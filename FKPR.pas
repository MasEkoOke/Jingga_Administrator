unit FKPR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxCore, dxButtons, ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, db,
  DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh, Wwdbspin,
  StdCtrls, Mask, wwdbedit, wwdblook, mxExport;

type
  TKPR = class(TForm)
    pTopBorder: TPanel;
    pnlButton: TPanel;
    bNew: TdxButton;
    bEdit: TdxButton;
    bDel: TdxButton;
    dbgData: TDBGridEh;
    pInput: TPanel;
    Llbl1: TLabel;
    Llbl8: TLabel;
    bCancel: TdxButton;
    bSave: TdxButton;
    eBunga: TwwDBSpinEdit;
    eTenor: TwwDBSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    eKoefisien: TwwDBSpinEdit;
    Label3: TLabel;
    lcNama: TwwDBLookupCombo;
    bT1: TdxButton;
    mxDataSetExport1: TmxDataSetExport;
    procedure SetButton(status: string);
    procedure pInputMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pInputMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure bNewClick(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure lcNamaEnter(Sender: TObject);
    procedure lcNamaExit(Sender: TObject);
    procedure lcNamaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure eBungaEnter(Sender: TObject);
    procedure eBungaExit(Sender: TObject);
    procedure EnterToTab(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure eTenorEnter(Sender: TObject);
    procedure eTenorExit(Sender: TObject);
    procedure eKoefisienEnter(Sender: TObject);
    procedure eKoefisienExit(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure MandatoryError;
    procedure bCancelClick(Sender: TObject);
    procedure bDelClick(Sender: TObject);
    procedure bT1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KPR: TKPR;
  MDown: Boolean = False;
  vIsNew, vOKSave: Boolean;
  sqls: String;
  OPnt, NPnt : TPoint;

implementation

uses
   DMC, FDM;

{$R *.dfm}

procedure TKPR.pInputMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   MDown := True;
   GetCursorPos(OPnt);
end;

procedure TKPR.pInputMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   MDown := False;
end;

procedure TKPR.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   if MDown then
   begin
      GetCursorPos(NPnt);
      pInput.Left :=  pInput.Left- OPnt.X + NPnt.X ;
      pInput.Top := pInput.Top- OPnt.Y + NPnt.Y   ;
      OPnt := NPnt;
   end;
end;

procedure TKPR.FormShow(Sender: TObject);
begin
   FDMC.tKPR.Refresh;
   SetButton('Initial');
end;

procedure TKPR.SetButton(status: string);
begin
   if status = 'Initial' then
   begin
      FDMC.vIsInput := False;
      vIsNew        := False;
      bNew.Enabled  := True;
      if (FDMC.tKPR.RecordCount > 0)then
      begin
         bEdit.Enabled := True;
         bDel.Enabled  := True;
      end else
      begin
         bEdit.Enabled := False;
         bDel.Enabled  := False;
      end;
      pInput.Visible := False;
   end else
   begin
      FDMC.vIsInput := True;
      bNew.Enabled := False;
      bEdit.Enabled := False;
      bDel.Enabled  := False;
      pInput.Visible := True;
      pInput.Left := 29;
      pInput.Top := 70;
      pInput.Width := 338;
      pInput.Height := 121;
   end;
end;

procedure TKPR.bNewClick(Sender: TObject);
begin
   SetButton('Input');
   FDMC.qRefBank.Close;
   FDMC.qRefBank.Open;
   FDMC.qMKPR.Close;  
   FDMC.qMKPR.Open; 
   FDMC.qMKPR.Edit;
   vIsNew := True;
   lcNama.SetFocus;
end;

procedure TKPR.bEditClick(Sender: TObject);
begin
   SetButton('Edit');
   with FDMC.qMKPR do
   begin
      sqls := 'SELECT * FROM mstkpr WHERE NamaBank = '''+FDMC.tKPR.FieldByName('NamaBank').AsString+''' '+
              'AND SukuBunga = '+FloatToStr(FDMC.tKPR.FieldByName('SukuBunga').AsFloat)+' '+
              'AND Tenor = '+IntToStr(FDMC.tKPR.FieldByName('Tenor').AsInteger)+'';
      Close;
      SQL.Clear;
      SQL.Add(sqls);
      Open;
      Edit;
   end;
   lcNama.SetFocus;
end;

procedure TKPR.lcNamaEnter(Sender: TObject);
begin
   lcNama.Color := clYellow;
   lcNama.ShowButton := True;
end;

procedure TKPR.lcNamaExit(Sender: TObject);
begin
   lcNama.Color := clWindow;
   lcNama.ShowButton := False;
end;

procedure TKPR.lcNamaCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
   eBunga.SetFocus;
end;

procedure TKPR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if FDMC.vIsInput then
   begin
      FDMC.MyMessageDialog('Peringatan', 'Simpan atau Batalkan input data !', mtWarning, [mbOK], ['OK']);
      Abort;
   end;        
   FDMC.qMKPR.Close;
   Action := caFree;
end;

procedure TKPR.eBungaEnter(Sender: TObject);
begin
   eBunga.Color := clYellow;
end;

procedure TKPR.eBungaExit(Sender: TObject);
begin
   eBunga.Color := clWindow;
end;

procedure TKPR.EnterToTab(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 13 then
   begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
   end;
end;

procedure TKPR.eTenorEnter(Sender: TObject);
begin
   eTenor.Color := clYellow;
end;

procedure TKPR.eTenorExit(Sender: TObject);
begin
   eTenor.Color := clWindow;
end;

procedure TKPR.eKoefisienEnter(Sender: TObject);
begin
   eKoefisien.Color := clYellow;
end;

procedure TKPR.eKoefisienExit(Sender: TObject);
begin
   eKoefisien.Color := clWindow;
end;
       
procedure TKPR.MandatoryError;
begin
   FDMC.MyMessageDialog('Peringatan', 'Terdapat data wajib isi yang masih kosong !', mtWarning, [mbOK], ['OK']);
   vOKSave := False;
   Abort;
end;

procedure TKPR.bSaveClick(Sender: TObject);
begin  
   vOKSave := True; 
   if lcNama.Text = '' then
   begin
      lcNama.SetFocus;
      MandatoryError;
   end;   
   if (eBunga.Text = '') or (eBunga.Text = '0') then
   begin
      eBunga.SetFocus;
      MandatoryError;
   end;    
   if (eTenor.Text = '') then
   begin
      eTenor.SetFocus;
      MandatoryError;
   end;    
   if (eKoefisien.Text = '') or (eKoefisien.Text = '0') then
   begin
      eKoefisien.SetFocus;
      MandatoryError;
   end;
   if vOKSave then
   begin
      if FDMC.MyMessageDialog('Konfirmasi', 'Pastikan input data sudah benar...'+#13+
      'Simpan data?', mtConfirmation, mbOKCancel, ['Ya', 'Tidak']) = mrOK then
      begin
         FDMC.qMKPR.FieldByName('OptId').AsInteger := FDMC.vOptId;
         FDMC.qMKPR.Post;
         FDMC.tKPR.Refresh;
         SetButton('Initial');
      end;
   end;
end;

procedure TKPR.bCancelClick(Sender: TObject);
begin
   if vIsNew then FDMC.qMKPR.Delete else FDMC.qMKPR.Cancel;
   FDMC.tKPR.Refresh;
   SetButton('Initial');
end;

procedure TKPR.bDelClick(Sender: TObject);
begin
   if FDMC.MyMessageDialog('Konfirmasi', 'Data akan dihapus secara permanen ...'+#13+
                           'Hapus data ?', mtConfirmation, mbOKCancel, ['Ya', 'Tidak']) = mrOK then
   begin
      SysUtils.DecimalSeparator := '.';
      with FDMC.qTemp do
      begin
         sqls := 'DELETE FROM mstkpr WHERE NamaBank = '''+FDMC.tKPR.FieldByName('NamaBank').AsString+''' AND '+
                 'SukuBunga = '+FloatToStr(FDMC.tKPR.FieldByName('SukuBunga').AsFloat)+' AND  '+
                 'Tenor = '+IntToStr(FDMC.tKPR.FieldByName('Tenor').AsInteger)+'';
         Close;
         SQL.Clear;
         SQL.Add(sqls);
         Execute;
      end;
      SysUtils.DecimalSeparator := ',';
   end;
end;

procedure TKPR.bT1Click(Sender: TObject);
begin
   try
     mxDataSetExport1.DataSet := FDMC.tKPR;
     mxDataSetExport1.Execute;
     mxDataSetExport1.Select;
   finally
   end;
end;

end.
