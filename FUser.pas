unit FUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  dxCore, dxButtons, Wwdbspin, Wwdotdot, Wwdbcomb, StdCtrls, Mask, db,
  wwdbedit, ExtCtrls, GridsEh, DBAxisGridsEh, DBGridEh, DBCtrlsEh, wwdblook,
  mxExport;

type
  TUser = class(TForm)
    dbgData: TDBGridEh;
    pInput: TPanel;
    lbl1: TLabel;
    lbl6: TLabel;
    lbl8: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    eNama: TwwDBEdit;
    eStatus: TwwDBComboBox;
    eLogin: TwwDBEdit;
    ePassword: TwwDBEdit;
    bCancel: TdxButton;
    bSave: TdxButton;
    pnlButton: TPanel;
    bNew: TdxButton;
    bEdit: TdxButton;
    bDel: TdxButton;
    chkPass: TCheckBox;
    cbLevelOpt: TwwDBLookupCombo;
    cbLevel: TwwDBComboBox;
    bT1: TdxButton;
    mxDataSetExport1: TmxDataSetExport;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SetButton(status: string);
    procedure pInputMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pInputMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure bNewClick(Sender: TObject);
    procedure eNamaEnter(Sender: TObject);
    procedure eNamaExit(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure cbLevelOptEnter(Sender: TObject);
    procedure cbLevelOptExit(Sender: TObject);
    procedure ePosisiCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure eLoginEnter(Sender: TObject);
    procedure eLoginExit(Sender: TObject);
    procedure eStatusEnter(Sender: TObject);
    procedure eStatusExit(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure eStatusCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure bEditClick(Sender: TObject);
    procedure bDelClick(Sender: TObject);
    procedure MandatoryError;
    procedure chkPassClick(Sender: TObject);
    procedure ePasswordEnter(Sender: TObject);
    procedure ePasswordExit(Sender: TObject);
    procedure EnterToTab(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbLevelOptNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure cbLevelEnter(Sender: TObject);
    procedure cbLevelExit(Sender: TObject);
    procedure cbLevelCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure bT1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  User: TUser;
  sqls: string;
  vOKSave, vIsNew: Boolean;
  MDown: Boolean = False;
  OPnt, NPnt : TPoint;

implementation

uses
   DMC;

{$R *.dfm}

procedure TUser.FormShow(Sender: TObject);
begin  
   SetButton('Initial');
end;

procedure TUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if FDMC.vIsInput then
   begin
      FDMC.MyMessageDialog('Peringatan', 'Simpan atau Batalkan input data !', mtWarning, [mbOK], ['OK']);
      Abort;
   end;
   FDMC.qMUser.Close;
   Action := caFree;
end;

procedure TUser.SetButton(status: string);
begin
   if status = 'Initial' then
   begin 
      FDMC.vIsInput := False;
      vIsNew        := False;
      bNew.Enabled  := True;    
      if FDMC.tUser.RecordCount > 0 then
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
      FDMC.vIsInput  := True;
      bNew.Enabled   := False;
      bEdit.Enabled  := False;
      bDel.Enabled   := False;
      pInput.Visible := True;
      pInput.Left    := 21;
      pInput.Top     := 96;
      pInput.Width   := 378;
      pInput.Height  := 147;
      chkPass.Checked := False;
   end;
end;

procedure TUser.MandatoryError;
begin
   FDMC.MyMessageDialog('Peringatan', 'Terdapat data wajib isi yang masih kosong !', mtWarning, [mbOK], ['OK']);
   vOKSave := False;    
   Abort;
end;

procedure TUser.pInputMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   MDown := True;
   GetCursorPos(OPnt);
end;

procedure TUser.pInputMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   MDown := False;
end;

procedure TUser.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
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
     
procedure TUser.EnterToTab(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 13 then
   begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
   end;
end;

procedure TUser.bNewClick(Sender: TObject);
begin
   SetButton('Input');
   FDMC.qMUser.Open;
   FDMC.qMUser.Append;
   FDMC.qMUser.FieldByName('OptSts').AsString := '1';
   FDMC.qMUser.Post;                                  
   FDMC.qMUser.Edit;
   vIsNew := True;
   eNama.SetFocus;
end;

procedure TUser.bEditClick(Sender: TObject);
begin
   SetButton('Edit');
   with FDMC.qMUser do
   begin
      sqls := 'SELECT * FROM mstuser WHERE OptId = '+IntToStr(FDMC.tUser.FieldByName('OptId').AsInteger)+'';
      Close;
      SQL.Clear;
      SQL.Add(sqls);
      Open;
      Edit;
   end;
   eNama.SetFocus;
end;

procedure TUser.bDelClick(Sender: TObject);
begin
   with FDMC.qTemp do
   begin
      sqls := 'CALL ADMCekBefDel (''mstuser'', '+IntToStr(FDMC.tUser.FieldByName('OptId').AsInteger)+')';
      Close;
      SQL.Clear;
      SQL.Add(sqls);
      Execute;
   end;
   if FDMC.qTemp.FieldByName('Pesan').AsString = 'NG' then
   FDMC.MyMessageDialog('Peringatan', 'Kode User sudah digunakan di data master lainnya atau transaksi!'+#13+
   'Penghapusan dibatalkan ...', mtWarning, [mbOK], ['OK']) else
   begin
      if FDMC.MyMessageDialog('Konfirmasi', 'Data akan dihapus secara permanen ...'+#13+
      'Hapus data ?', mtConfirmation, mbOKCancel, ['Ya', 'Tidak']) = mrOK then
      begin
         FDMC.tUser.Delete;
         FDMC.tUser.Refresh;
         SetButton('Initial');
      end;
   end;
end;

procedure TUser.bSaveClick(Sender: TObject);
begin  
   vOKSave := True;
   if eNama.Text = '' then
   begin
      eNama.SetFocus;
      MandatoryError;
   end;     
   if eLogin.Text = '' then
   begin
      eLogin.SetFocus;
      MandatoryError;
   end; 
   if ePassword.Text = '' then
   begin
      ePassword.SetFocus;
      MandatoryError;
   end;
   if cbLevel.Text = '' then
   begin
      cbLevel.SetFocus;
      MandatoryError;
   end;
   if eStatus.Text = '' then
   begin
      eStatus.SetFocus;
      MandatoryError;
   end;

   with FDMC.qTemp do
   begin
      sqls := 'SELECT * FROM mstuser WHERE Username = '''+eLogin.Text+''' AND Password = '''+ePassword.Text+'''';
      Close;
      SQL.Clear;
      SQL.Add(sqls);
      Open;
   end;
   if (FDMC.qTemp.RecordCount > 0) and vIsNew then
   begin
      FDMC.MyMessageDialog('Peringatan', 'Login dan Password sudah digunakan user lain !', mtWarning, [mbOK], ['OK']);
      vOKSave := False;
      eLogin.SetFocus;   
      Abort;
   end;

   if vOKSave then
   begin
      if FDMC.MyMessageDialog('Konfirmasi', 'Pastikan input data sudah benar...'+#13+
      'Simpan data?', mtConfirmation, mbOKCancel, ['Ya', 'Tidak']) = mrOK then
      begin
         FDMC.qMUser.FieldByName('password').AsString := ePassword.Text;//Utility.encr(ePassword.Text);
         FDMC.qMUser.Post;
         FDMC.tUser.Refresh;
         SetButton('Initial');
      end;
   end;
end;

procedure TUser.bCancelClick(Sender: TObject);
begin
   if vIsNew then FDMC.qMUser.Delete else FDMC.qMUser.Cancel;
   FDMC.tUser.Refresh;
   SetButton('Initial');
end;

procedure TUser.eNamaEnter(Sender: TObject);
begin
   eNama.Color := clYellow;
end;

procedure TUser.eNamaExit(Sender: TObject);
begin
   eNama.Color := clWindow;
end;

procedure TUser.cbLevelOptEnter(Sender: TObject);
begin
   cbLevelOpt.Color := clYellow;
end;

procedure TUser.cbLevelOptExit(Sender: TObject);
begin
   cbLevelOpt.Color := clWindow;
end;

procedure TUser.ePosisiCloseUp(Sender: TwwDBComboBox; Select: Boolean);
begin
   eLogin.SetFocus;
end;

procedure TUser.eLoginEnter(Sender: TObject);
begin
   eLogin.Color := clYellow;
end;

procedure TUser.eLoginExit(Sender: TObject);
begin
   eLogin.Color := clWindow;
end;

procedure TUser.eStatusEnter(Sender: TObject);
begin
   eStatus.ShowButton := True;
   eStatus.Color := clYellow;
end;

procedure TUser.eStatusExit(Sender: TObject);
begin
   eStatus.ShowButton := False;
   eStatus.Color := clWindow;
end;

procedure TUser.eStatusCloseUp(Sender: TwwDBComboBox; Select: Boolean);
begin
   bSave.SetFocus;
end;

procedure TUser.chkPassClick(Sender: TObject);
begin
   if chkPass.Checked then ePassword.PasswordChar := #0 else ePassword.PasswordChar := #42;
end;

procedure TUser.ePasswordEnter(Sender: TObject);
begin
   ePassword.Color := clYellow;
end;

procedure TUser.ePasswordExit(Sender: TObject);
begin
   ePassword.Color := clWindow;
end;

procedure TUser.cbLevelOptNotInList(Sender: TObject; LookupTable: TDataSet;
  NewValue: String; var Accept: Boolean);
begin
   {if FDMC.MyMessageDialog('Konfirmasi', 'Kriteria posisi baru...'+#13+
   'Tambahkan ke data posisi ?', mtConfirmation, mbOKCancel, ['Ya', 'Tidak']) = mrOK then
   begin
      FDMC.qPosisi.Append;
      FDMC.qPosisi.FieldByName('Posisi').AsString := cbLevelOpt.Text;
      FDMC.qPosisi.Post;
   end; }
end;

procedure TUser.cbLevelEnter(Sender: TObject);
begin
   cbLevel.ShowButton := True;
   cbLevel.Color := clYellow;
end;

procedure TUser.cbLevelExit(Sender: TObject);
begin
   cbLevel.ShowButton := False;
   cbLevel.Color := clWindow;
end;

procedure TUser.cbLevelCloseUp(Sender: TwwDBComboBox; Select: Boolean);
begin
   eStatus.SetFocus;
end;

procedure TUser.bT1Click(Sender: TObject);
begin
   try
     mxDataSetExport1.DataSet := FDMC.tUser;
     mxDataSetExport1.Execute;
     mxDataSetExport1.Select;
   finally
   end;
end;

end.
