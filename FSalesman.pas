unit FSalesman;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  StdCtrls, Wwdotdot, Wwdbcomb, Mask, wwdbedit, wwdblook, GridsEh,
  DBAxisGridsEh, DBGridEh, dxCore, dxButtons, ExtCtrls, Wwdbspin, mxExport;

type
  TSalesman = class(TForm)
    pnlButton: TPanel;
    bNew: TdxButton;
    bEdit: TdxButton;
    bDel: TdxButton;
    dbgData: TDBGridEh;
    pInput: TPanel;
    Llbl1: TLabel;
    Llbl8: TLabel;
    Llbl13: TLabel;
    eStatus: TwwDBComboBox;
    bCancel: TdxButton;
    bSave: TdxButton;
    eNama: TwwDBEdit;
    eFee: TwwDBSpinEdit;
    pTopBorder: TPanel;
    bT1: TdxButton;
    mxDataSetExport1: TmxDataSetExport;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);  
    procedure SetButton(status: string);  
    procedure MandatoryError;
    procedure pInputMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pInputMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);  
    procedure EnterToTab(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bNewClick(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure bDelClick(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure eNamaEnter(Sender: TObject);
    procedure eNamaExit(Sender: TObject);
    procedure eFeeEnter(Sender: TObject);
    procedure eFeeExit(Sender: TObject);
    procedure eStatusEnter(Sender: TObject);
    procedure eStatusExit(Sender: TObject);
    procedure eStatusCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure bT1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Salesman: TSalesman;
  sqls: string;
  vOKSave, vIsNew: Boolean;
  MDown: Boolean = False;
  OPnt, NPnt : TPoint;

implementation

uses
   DMC;

{$R *.dfm}

procedure TSalesman.FormShow(Sender: TObject);
begin
   FDMC.tSalesman.Refresh;
   SetButton('Initial');
end;

procedure TSalesman.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if FDMC.vIsInput then
   begin
      FDMC.MyMessageDialog('Peringatan', 'Simpan atau Batalkan input data !', mtWarning, [mbOK], ['OK']);
      Abort;
   end;        
   FDMC.qMSalesman.Close;
   Action := caFree;
end;

procedure TSalesman.SetButton(status: string);
begin
   if status = 'Initial' then
   begin
      FDMC.vIsInput := False;
      vIsNew        := False;
      bNew.Enabled  := True;
      if (FDMC.tSalesman.RecordCount > 0)then
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
      pInput.Left := 21;
      pInput.Top := 96;
      pInput.Width := 370;
      pInput.Height := 101;
   end;
end;

procedure TSalesman.MandatoryError;
begin
   FDMC.MyMessageDialog('Peringatan', 'Terdapat data wajib isi yang masih kosong !', mtWarning, [mbOK], ['OK']);
   vOKSave := False;
   Abort;
end;

procedure TSalesman.pInputMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   MDown := True;
   GetCursorPos(OPnt);
end;

procedure TSalesman.pInputMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   MDown := False;
end;

procedure TSalesman.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
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

procedure TSalesman.EnterToTab(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 13 then
   begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
   end;
end;

procedure TSalesman.bNewClick(Sender: TObject);
begin
   SetButton('Input');
   FDMC.qMSalesman.Open;
   FDMC.qMSalesman.Append;
   FDMC.qMSalesman.FieldByName('OptId').AsInteger := FDMC.vOptId; 
   FDMC.qMSalesman.Post;
   vIsNew := True;
   eNama.SetFocus;
end;

procedure TSalesman.bEditClick(Sender: TObject);
begin
   SetButton('Edit');
   with FDMC.qMSalesman do
   begin
      sqls := 'SELECT * FROM mstsalesman WHERE IdMarketing = '+IntToStr(FDMC.tSalesman.FieldByName('IdMarketing').AsInteger)+'';
      Close;
      SQL.Clear;
      SQL.Add(sqls);
      Open;
      Edit;
   end;
   eNama.SetFocus;
end;

procedure TSalesman.bDelClick(Sender: TObject);
begin
   with FDMC.qTemp do
   begin
      sqls := 'CALL ADMCekBefDel (''mstsalesman'', '+IntToStr(FDMC.tSalesman.FieldByName('IdMarketing').AsInteger)+')';
      Close;
      SQL.Clear;
      SQL.Add(sqls);
      Execute;
   end;
   if FDMC.qTemp.FieldByName('Pesan').AsString = 'NG' then
   FDMC.MyMessageDialog('Peringatan', 'Id. Marketing sudah digunakan di data master lainnya atau transaksi!'+#13+
   'Penghapusan dibatalkan ...', mtWarning, [mbOK], ['OK']) else
   begin
      if FDMC.MyMessageDialog('Konfirmasi', 'Data akan dihapus secara permanen ...'+#13+
      'Hapus data ?', mtConfirmation, mbOKCancel, ['Ya', 'Tidak']) = mrOK then
      begin
         FDMC.tSalesman.Delete;
         FDMC.tSalesman.Refresh;
         SetButton('Initial');
      end;
   end;
end;

procedure TSalesman.bSaveClick(Sender: TObject);
begin
   vOKSave := True;
   if eNama.Text = '' then
   begin
      eNama.SetFocus;
      MandatoryError;
   end;     
   if eFee.Text = '' then
   begin
      eFee.SetFocus;
      MandatoryError;
   end;     
   if eStatus.Text = '' then
   begin
      eStatus.SetFocus;
      MandatoryError;
   end;

   if vOKSave then
   begin
      if FDMC.MyMessageDialog('Konfirmasi', 'Pastikan input data sudah benar...'+#13+
      'Simpan data?', mtConfirmation, mbOKCancel, ['Ya', 'Tidak']) = mrOK then
      begin
      
         FDMC.qMSalesman.Post;
         FDMC.tSalesman.Refresh;
         SetButton('Initial');
      end;
   end;
end;

procedure TSalesman.bCancelClick(Sender: TObject);
begin
   if vIsNew then FDMC.qMSalesman.Delete else FDMC.qMSalesman.Cancel;
   FDMC.tSalesman.Refresh;
   SetButton('Initial');
end;

procedure TSalesman.eNamaEnter(Sender: TObject);
begin
   eNama.Color := clYellow;
end;

procedure TSalesman.eNamaExit(Sender: TObject);
begin
   eNama.Color := clWindow;
end;

procedure TSalesman.eFeeEnter(Sender: TObject);
begin
   eFee.Color := clYellow;
end;

procedure TSalesman.eFeeExit(Sender: TObject);
begin
   eFee.Color := clWindow;
end;

procedure TSalesman.eStatusEnter(Sender: TObject);
begin
   eStatus.ShowButton := True;
   eStatus.Color := clYellow;
end;

procedure TSalesman.eStatusExit(Sender: TObject);
begin                         
   eStatus.ShowButton := False;
   eStatus.Color := clWindow;
end;

procedure TSalesman.eStatusCloseUp(Sender: TwwDBComboBox; Select: Boolean);
begin
   bSave.SetFocus;
end;

procedure TSalesman.bT1Click(Sender: TObject);
begin
   try
     mxDataSetExport1.DataSet := FDMC.tSalesman;
     mxDataSetExport1.Execute;
     mxDataSetExport1.Select;
   finally
   end;
end;

end.
