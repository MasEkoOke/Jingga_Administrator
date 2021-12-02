unit FTipe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, db,
  Wwdbspin, StdCtrls, Mask, wwdbedit, GridsEh, DBAxisGridsEh, DBGridEh,
  dxCore, dxButtons, ExtCtrls, wwdblook, mxExport;

type
  TTipe = class(TForm)
    pnlButton: TPanel;
    bNew: TdxButton;
    bEdit: TdxButton;
    bDel: TdxButton;
    dbgData: TDBGridEh;
    pInput: TPanel;
    Llbl1: TLabel;
    Llbl6: TLabel;
    Llbl8: TLabel;
    eNama: TwwDBEdit;
    bCancel: TdxButton;
    bSave: TdxButton;
    eKeterangan: TwwDBEdit;
    cbProyek: TwwDBLookupCombo;
    pTopBorder: TPanel;
    cbLProyek: TwwDBLookupCombo;
    Label1: TLabel;
    bT1: TdxButton;
    mxDataSetExport1: TmxDataSetExport;
    procedure FormShow(Sender: TObject);
    procedure SetButton(status: string);  
    procedure MandatoryError;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    procedure cbProyekEnter(Sender: TObject);
    procedure cbProyekExit(Sender: TObject);
    procedure eKeteranganEnter(Sender: TObject);
    procedure eKeteranganExit(Sender: TObject);
    procedure cbProyekCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cbLProyekChange(Sender: TObject);
    procedure cbLProyekEnter(Sender: TObject);
    procedure cbLProyekExit(Sender: TObject);
    procedure bT1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Tipe: TTipe;
  sqls: string;
  vOKSave, vIsNew, vIsRegistered: Boolean;
  MDown: Boolean = False;
  OPnt, NPnt : TPoint;

implementation

uses
   DMC;

{$R *.dfm}

procedure TTipe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if FDMC.vIsInput then
   begin
      FDMC.MyMessageDialog('Peringatan', 'Simpan atau Batalkan input data !', mtWarning, [mbOK], ['OK']);
      Abort;
   end;      
   FDMC.qMTipe.Close;
   Action := caFree;
end;

procedure TTipe.SetButton(status: string);
begin 
   if status = 'Initial' then
   begin
      FDMC.vIsInput := False;
      vIsNew        := False;
      if (FDMC.tProyek.RecordCount > 0) then
      bNew.Enabled  := True else
      bNew.Enabled  := False;
      if (FDMC.tTipe.RecordCount > 0) and (FDMC.tProyek.RecordCount > 0) then
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
      pInput.Width := 461;
      pInput.Height := 98;
   end;
end;
   
procedure TTipe.MandatoryError;
begin
   FDMC.MyMessageDialog('Peringatan', 'Terdapat data wajib isi yang masih kosong !', mtWarning, [mbOK], ['OK']);
   vOKSave := False;
   Abort;
end;

procedure TTipe.pInputMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   MDown := True;
   GetCursorPos(OPnt);
end;

procedure TTipe.pInputMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   MDown := False;
end;

procedure TTipe.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   if MDown then
   begin
      GetCursorPos(NPnt);
      pInput.Left := pInput.Left- OPnt.X + NPnt.X ;
      pInput.Top := pInput.Top- OPnt.Y + NPnt.Y   ;
      OPnt := NPnt;
   end;
end;

procedure TTipe.EnterToTab(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 13 then
   begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
   end;
end;

procedure TTipe.bNewClick(Sender: TObject);
begin
   SetButton('Input');
   FDMC.qMTipe.Open;
   FDMC.qMTipe.Append;  
   FDMC.qMTipe.FieldByName('OptId').AsInteger := FDMC.vOptId;
   FDMC.qMTipe.Post;
   vIsNew := True;
   eNama.SetFocus;
end;

procedure TTipe.bEditClick(Sender: TObject);
begin
   SetButton('Edit');
   with FDMC.qMTipe do
   begin
      sqls := 'SELECT * FROM msttYpe WHERE IdType = '+IntToStr(FDMC.tTipe.FieldByName('IdType').AsInteger)+'';
      Close;
      SQL.Clear;
      SQL.Add(sqls);
      Open;
      Edit;
   end;
   eNama.SetFocus;
end;

procedure TTipe.bDelClick(Sender: TObject);
begin
   with FDMC.qTemp do
   begin
      sqls := 'CALL ADMCekBefDel (''msttype'', '+IntToStr(FDMC.tTipe.FieldByName('IdType').AsInteger)+')';
      Close;
      SQL.Clear;
      SQL.Add(sqls);
      Execute;
   end;
   if FDMC.qTemp.FieldByName('Pesan').AsString = 'NG' then
   FDMC.MyMessageDialog('Peringatan', 'Id. Kavling sudah digunakan di data master lainnya atau transaksi!'+#13+
   'Penghapusan dibatalkan ...', mtWarning, [mbOK], ['OK']) else
   begin
      if FDMC.MyMessageDialog('Konfirmasi', 'Data akan dihapus secara permanen ...'+#13+
      'Hapus data ?', mtConfirmation, mbOKCancel, ['Ya', 'Tidak']) = mrOK then
      begin
         FDMC.tTipe.Delete;
         FDMC.tTipe.Refresh;
         SetButton('Initial');
      end;
   end;
end;

procedure TTipe.bSaveClick(Sender: TObject);
begin
   vOKSave := True;
   if eNama.Text = '' then
   begin
      eNama.SetFocus;
      MandatoryError;
   end;     
   if cbProyek.Text = '' then
   begin
      cbProyek.SetFocus;
      MandatoryError;
   end;

   if vOKSave then
   begin
      if FDMC.MyMessageDialog('Konfirmasi', 'Pastikan input data sudah benar...'+#13+
      'Simpan data?', mtConfirmation, mbOKCancel, ['Ya', 'Tidak']) = mrOK then
      begin
         FDMC.qMTipe.Post;
         FDMC.tTipe.Refresh;
         SetButton('Initial');
      end;
   end;
end;

procedure TTipe.bCancelClick(Sender: TObject);
begin
   if vIsNew then FDMC.qMTipe.Delete else FDMC.qMTipe.Cancel;
   FDMC.tTipe.Refresh;
   SetButton('Initial');
end;

procedure TTipe.eNamaEnter(Sender: TObject);
begin
   eNama.Color := clYellow;
end;

procedure TTipe.eNamaExit(Sender: TObject);
begin
   eNama.Color := clWindow;
end;

procedure TTipe.cbProyekEnter(Sender: TObject);
begin
   cbProyek.ShowButton := True;
   cbProyek.Color := clYellow;
end;

procedure TTipe.cbProyekExit(Sender: TObject);
begin        
   cbProyek.ShowButton := False;
   cbProyek.Color := clWindow;
end;

procedure TTipe.eKeteranganEnter(Sender: TObject);
begin
   eKeterangan.Color := clYellow;
end;

procedure TTipe.eKeteranganExit(Sender: TObject);
begin
   eKeterangan.Color := clWindow;
end;

procedure TTipe.cbProyekCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
   //### Cek Tipe Rumah di Proyek terpilih ###
   if (eNama.Text <> '') and (vIsNew) then
   begin
      with FDMC.qTemp do
      begin
         sqls := 'SELECT * FROM msttype WHERE NamaType = '''+eNama.Text+''' AND '+
                 'IdProyek = '+IntToStr(FDMC.tProyek.FieldByName('IdProyek').AsInteger)+'';
         Close;
         SQL.Clear;
         SQL.Add(sqls);
         Open;
      end;
      if FDMC.qTemp.RecordCount > 0 then
      begin
         FDMC.MyMessageDialog('Peringatan', 'Tipe rumah ini sudah terdaftar !', mtWarning, [mbOK], ['OK']);
         eNama.SetFocus;
      end else eKeterangan.SetFocus;
   end;
end;

procedure TTipe.cbLProyekChange(Sender: TObject);
begin     
   FDMC.tTipe.Filtered := True; 
   FDMC.tTipe.FilterSQL := 'IdType > 0';

   if cbLProyek.Text = '' then
      FDMC.tTipe.FilterSQL := 'IdType > 0' else
      FDMC.tTipe.FilterSQL := 'IdProyek = '+IntToStr(FDMC.tProyek.FieldByName('IdProyek').AsInteger)+'';
   FDMC.tTipe.FilterSQL := FDMC.tTipe.FilterSQL+ ' ORDER BY IdType';
end;
 
procedure TTipe.FormShow(Sender: TObject);
begin   
   FDMC.tProyek.Refresh; 
   FDMC.tTipe.Refresh;
   FDMC.tTipe.Filtered := True;
   FDMC.tTipe.FilterSQL := 'IdType > 0';
   cbLProyek.Text := '';
   SetButton('Initial');
end;

procedure TTipe.cbLProyekEnter(Sender: TObject);
begin
   cbLProyek.Color := clYellow;
end;

procedure TTipe.cbLProyekExit(Sender: TObject);
begin
   cbLProyek.Color := clWindow;
end;

procedure TTipe.bT1Click(Sender: TObject);
begin
   try
     mxDataSetExport1.DataSet := FDMC.tTipe;
     mxDataSetExport1.Execute;
     mxDataSetExport1.Select;
   finally
   end;
end;

end.


