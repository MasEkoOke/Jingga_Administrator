unit FKonsumen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  StdCtrls, dxCore, dxButtons, Wwdotdot, Wwdbcomb, Mask, wwdbedit,
  wwdblook, ExtCtrls, GridsEh, DBAxisGridsEh, DBGridEh, mxExport;

type
  TKonsumen = class(TForm)
    dbgData: TDBGridEh;
    pInput: TPanel;
    Llbl1: TLabel;
    Llbl6: TLabel;
    Llbl8: TLabel;
    Llbl13: TLabel;
    eKontak: TwwDBEdit;
    eNama: TwwDBEdit;
    eAlamat: TwwDBEdit;
    bCancel: TdxButton;
    bSave: TdxButton;
    pnlButton: TPanel;
    bNew: TdxButton;
    bEdit: TdxButton;
    bDel: TdxButton;
    eNIK: TwwDBEdit;
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
    procedure eAlamatEnter(Sender: TObject);
    procedure eAlamatExit(Sender: TObject);
    procedure eKontakEnter(Sender: TObject);
    procedure eKontakExit(Sender: TObject);
    procedure eNIKEnter(Sender: TObject);
    procedure eNIKExit(Sender: TObject);
    procedure bT1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Konsumen: TKonsumen;
  sqls: string;
  vOKSave, vIsNew, vIsRegistered: Boolean;
  MDown: Boolean = False;
  OPnt, NPnt : TPoint;

implementation

uses
   DMC;

{$R *.dfm}

procedure TKonsumen.FormShow(Sender: TObject);
begin
   FDMC.tKonsumen.Refresh;
   SetButton('Initial');
end;

procedure TKonsumen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if FDMC.vIsInput then
   begin
      FDMC.MyMessageDialog('Peringatan', 'Simpan atau Batalkan input data !', mtWarning, [mbOK], ['OK']);
      Abort;
   end;      
   FDMC.qMKonsumen.Close;
   Action := caFree;
end;
        
procedure TKonsumen.SetButton(status: string);
begin
   if status = 'Initial' then
   begin
      FDMC.vIsInput := False;
      vIsNew        := False;
      bNew.Enabled  := True;
      if (FDMC.tKonsumen.RecordCount > 0) then
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
      pInput.Width := 402;
      pInput.Height := 121;
   end;
end;

procedure TKonsumen.MandatoryError;
begin
   FDMC.MyMessageDialog('Peringatan', 'Terdapat data wajib isi yang masih kosong !', mtWarning, [mbOK], ['OK']);
   vOKSave := False;
   Abort;
end;

procedure TKonsumen.pInputMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   MDown := True;
   GetCursorPos(OPnt);
end;

procedure TKonsumen.pInputMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   MDown := False;
end;

procedure TKonsumen.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
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

procedure TKonsumen.EnterToTab(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 13 then
   begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
   end;
end;

procedure TKonsumen.bNewClick(Sender: TObject);
begin
   SetButton('Input');
   FDMC.qMKonsumen.Open;
   FDMC.qMKonsumen.Append;  
   FDMC.qMKonsumen.FieldByName('OptId').AsInteger := FDMC.vOptId;
   FDMC.qMKonsumen.Post;
   vIsNew := True;
   eNama.SetFocus;
end;

procedure TKonsumen.bEditClick(Sender: TObject);
begin
   SetButton('Edit');
   with FDMC.qMKonsumen do
   begin
      sqls := 'SELECT * FROM mstkonsumen WHERE IdKonsumen = '+IntToStr(FDMC.tKonsumen.FieldByName('IdKonsumen').AsInteger)+'';
      Close;
      SQL.Clear;
      SQL.Add(sqls);
      Open;
      Edit;
   end;
   eNama.SetFocus;
end;

procedure TKonsumen.bDelClick(Sender: TObject);
begin
   with FDMC.qTemp do
   begin
      sqls := 'CALL ADMCekBefDel (''mstkonsumen'', '+IntToStr(FDMC.tKonsumen.FieldByName('IdKonsumen').AsInteger)+')';
      Close;
      SQL.Clear;
      SQL.Add(sqls);
      Execute;
   end;
   if FDMC.qTemp.FieldByName('Pesan').AsString = 'NG' then
   FDMC.MyMessageDialog('Peringatan', 'Id. Konsumen sudah digunakan di data master lainnya atau transaksi!'+#13+
   'Penghapusan dibatalkan ...', mtWarning, [mbOK], ['OK']) else
   begin
      if FDMC.MyMessageDialog('Konfirmasi', 'Data akan dihapus secara permanen ...'+#13+
      'Hapus data ?', mtConfirmation, mbOKCancel, ['Ya', 'Tidak']) = mrOK then
      begin
         FDMC.tKonsumen.Delete;
         FDMC.tKonsumen.Refresh;
         SetButton('Initial');
      end;
   end;
end;

procedure TKonsumen.bSaveClick(Sender: TObject);
begin
   vOKSave := True;
   if eNama.Text = '' then
   begin
      eNama.SetFocus;
      MandatoryError;
   end;
   if eAlamat.Text = '' then
   begin
      eAlamat.SetFocus;
      MandatoryError;
   end;

   if vOKSave then
   begin
      if FDMC.MyMessageDialog('Konfirmasi', 'Pastikan input data sudah benar...'+#13+
      'Simpan data?', mtConfirmation, mbOKCancel, ['Ya', 'Tidak']) = mrOK then
      begin
         FDMC.qMKonsumen.Post;
         FDMC.tKonsumen.Refresh;
         SetButton('Initial');
      end;
   end;
end;

procedure TKonsumen.bCancelClick(Sender: TObject);
begin
   if vIsNew then FDMC.qMKonsumen.Delete else FDMC.qMKonsumen.Cancel;
   FDMC.tKonsumen.Refresh;
   SetButton('Initial');
end;

procedure TKonsumen.eNamaEnter(Sender: TObject);
begin
   eNama.Color := clYellow;
end;

procedure TKonsumen.eNamaExit(Sender: TObject);
begin
   eNama.Color := clWindow;
end;

procedure TKonsumen.eAlamatEnter(Sender: TObject);
begin
   eAlamat.Color := clYellow;
end;

procedure TKonsumen.eAlamatExit(Sender: TObject);
begin
   eAlamat.Color := clWindow;
end;

procedure TKonsumen.eKontakEnter(Sender: TObject);
begin
   eKontak.Color := clYellow;
end;

procedure TKonsumen.eKontakExit(Sender: TObject);
begin
   eKontak.Color := clWindow;
end;

procedure TKonsumen.eNIKEnter(Sender: TObject);
begin
   eNIK.Color := clYellow;
end;

procedure TKonsumen.eNIKExit(Sender: TObject);
begin
   eNIK.Color := clWindow;
end;

procedure TKonsumen.bT1Click(Sender: TObject);
begin
   try
     mxDataSetExport1.DataSet := FDMC.tKonsumen;
     mxDataSetExport1.Execute;
     mxDataSetExport1.Select;
   finally
   end;
end;

end.
