unit FProyek;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  StdCtrls, Wwdotdot, Wwdbcomb, Mask, wwdbedit, wwdblook, GridsEh, db,
  DBAxisGridsEh, DBGridEh, dxCore, dxButtons, ExtCtrls, Wwdbspin, mxExport;

type
  TProyek = class(TForm)
    pnlButton: TPanel;
    bNew: TdxButton;
    bEdit: TdxButton;
    bDel: TdxButton;
    dbgData: TDBGridEh;
    pInput: TPanel;
    Llbl1: TLabel;
    Llbl6: TLabel;
    Llbl8: TLabel;
    Llbl13: TLabel;
    Llbl14: TLabel;
    eNIB: TwwDBEdit;
    eNama: TwwDBEdit;
    eKontak: TwwDBEdit;
    bCancel: TdxButton;
    bSave: TdxButton;
    Label1: TLabel;
    eAlamat: TwwDBEdit;
    eSHM: TwwDBEdit;
    eLuas: TwwDBSpinEdit;
    pTopBorder: TPanel;
    bT1: TdxButton;
    mxDataSetExport1: TmxDataSetExport;
    procedure SetButton(status: string);
    procedure MandatoryError;
    procedure FormShow(Sender: TObject);
    procedure pInputMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pInputMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EnterToTab(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bDelClick(Sender: TObject);
    procedure bNewClick(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure eNamaEnter(Sender: TObject);
    procedure eNamaExit(Sender: TObject);
    procedure eAlamatEnter(Sender: TObject);
    procedure eAlamatExit(Sender: TObject);
    procedure eKontakEnter(Sender: TObject);
    procedure eKontakExit(Sender: TObject);
    procedure eNIBEnter(Sender: TObject);
    procedure eNIBExit(Sender: TObject);
    procedure eSHMEnter(Sender: TObject);
    procedure eSHMExit(Sender: TObject);
    procedure eLuasEnter(Sender: TObject);
    procedure eLuasExit(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure bT1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Proyek: TProyek;  
  sqls: string;
  vOKSave, vIsNew: Boolean;
  MDown: Boolean = False;
  OPnt, NPnt : TPoint;

implementation

uses
   DMC;   

{$R *.dfm}

procedure TProyek.FormShow(Sender: TObject);
begin    
   SetButton('Initial');
end;
         
procedure TProyek.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if FDMC.vIsInput then
   begin
      FDMC.MyMessageDialog('Peringatan', 'Simpan atau Batalkan input data !', mtWarning, [mbOK], ['OK']);
      Abort;
   end;    
   FDMC.qMProyek.Close;
   Action := caFree;
end;
     
procedure TProyek.SetButton(status: string);
begin
   if status = 'Initial' then
   begin
      FDMC.vIsInput := False;
      vIsNew        := False;
      bNew.Enabled  := True;
      if FDMC.tProyek.RecordCount > 0 then
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
      pInput.Width   := 461;
      pInput.Height  := 170;
   end;
end;

procedure TProyek.MandatoryError;
begin
   FDMC.MyMessageDialog('Peringatan', 'Terdapat data wajib isi yang masih kosong !', mtWarning, [mbOK], ['OK']);
   vOKSave := False;
   Abort;
end;

procedure TProyek.pInputMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   MDown := True;
   GetCursorPos(OPnt);
end;
       
procedure TProyek.pInputMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   MDown := False;
end;
      
procedure TProyek.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
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

procedure TProyek.EnterToTab(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 13 then
   begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
   end;
end;

procedure TProyek.bNewClick(Sender: TObject);
begin  
   SetButton('Input');
   FDMC.qMProyek.Open;
   FDMC.qMProyek.Append;
   FDMC.qMProyek.FieldByName('OptId').AsInteger := FDMC.vOptId;
   FDMC.qMProyek.Post;
   vIsNew := True;
   eNama.SetFocus;
end;

procedure TProyek.bEditClick(Sender: TObject);
begin  
   SetButton('Edit');
   with FDMC.qMProyek do
   begin
      sqls := 'SELECT * FROM mstproyek WHERE IdProyek = '+IntToStr(FDMC.tProyek.FieldByName('IdProyek').AsInteger)+'';
      Close;
      SQL.Clear;
      SQL.Add(sqls);
      Open;
      Edit;
   end;
   eNama.SetFocus;
end;
    
procedure TProyek.bDelClick(Sender: TObject);
begin
   with FDMC.qTemp do
   begin
      sqls := 'CALL ADMCekBefDel (''mstproyek'', '+IntToStr(FDMC.tProyek.FieldByName('IdProyek').AsInteger)+')';
      Close;
      SQL.Clear;
      SQL.Add(sqls);
      Execute;
   end;
   if FDMC.qTemp.FieldByName('Pesan').AsString = 'NG' then
   FDMC.MyMessageDialog('Peringatan', 'Id. Proyek sudah digunakan di data master lainnya atau transaksi!'+#13+
   'Penghapusan dibatalkan ...', mtWarning, [mbOK], ['OK']) else
   begin
      if FDMC.MyMessageDialog('Konfirmasi', 'Data akan dihapus secara permanen ...'+#13+
      'Hapus data ?', mtConfirmation, mbOKCancel, ['Ya', 'Tidak']) = mrOK then
      begin
         FDMC.tProyek.Delete;
         FDMC.tProyek.Refresh;
         SetButton('Initial');
      end;
   end;
end;

procedure TProyek.bSaveClick(Sender: TObject);
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
         FDMC.qMProyek.Post;
         FDMC.tProyek.Refresh;
         SetButton('Initial');
      end;
   end;
end;

procedure TProyek.bCancelClick(Sender: TObject);
begin
   if vIsNew then FDMC.qMProyek.Delete else FDMC.qMProyek.Cancel;
   FDMC.tProyek.Refresh;
   SetButton('Initial');
end;

procedure TProyek.eNamaEnter(Sender: TObject);
begin
   eNama.Color := clYellow;
end;

procedure TProyek.eNamaExit(Sender: TObject);
begin
   eNama.Color := clWindow;
end;

procedure TProyek.eAlamatEnter(Sender: TObject);
begin
   eAlamat.Color := clYellow;
end;

procedure TProyek.eAlamatExit(Sender: TObject);
begin
   eAlamat.Color := clWindow;
end;

procedure TProyek.eKontakEnter(Sender: TObject);
begin
   eKontak.Color := clYellow;
end;

procedure TProyek.eKontakExit(Sender: TObject);
begin
   eKontak.Color := clWindow;
end;

procedure TProyek.eNIBEnter(Sender: TObject);
begin
   eNIB.Color := clYellow;
end;

procedure TProyek.eNIBExit(Sender: TObject);
begin
   eNIB.Color := clWindow;
end;

procedure TProyek.eSHMEnter(Sender: TObject);
begin
   eSHM.Color := clYellow;
end;

procedure TProyek.eSHMExit(Sender: TObject);
begin
   eSHM.Color := clWindow;
end;

procedure TProyek.eLuasEnter(Sender: TObject);
begin
   eLuas.Color := clYellow;
end;

procedure TProyek.eLuasExit(Sender: TObject);
begin
   eLuas.Color := clWindow;
end;

procedure TProyek.bT1Click(Sender: TObject);
begin
   try
     mxDataSetExport1.DataSet := FDMC.tProyek;
     mxDataSetExport1.Execute;
     mxDataSetExport1.Select;
   finally
   end;
end;

end.
