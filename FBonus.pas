unit FBonus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  Wwdbspin, wwdbedit, StdCtrls, Mask, Wwdotdot, Wwdbcomb, GridsEh,
  DBAxisGridsEh, DBGridEh, dxCore, dxButtons, ExtCtrls, mxExport;

type
  TBonus = class(TForm)
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
    eNama: TwwDBEdit;
    eBesar: TwwDBSpinEdit;
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
    procedure eBesarEnter(Sender: TObject);
    procedure eBesarExit(Sender: TObject);
    procedure bT1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Bonus: TBonus;   
  sqls: string;
  vOKSave, vIsNew: Boolean;
  MDown: Boolean = False;
  OPnt, NPnt : TPoint;

implementation

uses
   DMC;

{$R *.dfm}

procedure TBonus.FormShow(Sender: TObject);
begin
   FDMC.tBonus.Refresh;
   SetButton('Initial');
end;

procedure TBonus.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if FDMC.vIsInput then
   begin
      FDMC.MyMessageDialog('Peringatan', 'Simpan atau Batalkan input data !', mtWarning, [mbOK], ['OK']);
      Abort;
   end;        
   FDMC.qMBonus.Close;
   Action := caFree;
end;

procedure TBonus.MandatoryError;
begin  
   FDMC.MyMessageDialog('Peringatan', 'Terdapat data wajib isi yang masih kosong !', mtWarning, [mbOK], ['OK']);
   vOKSave := False;
   Abort;
end;

procedure TBonus.SetButton(status: string);
begin
   if status = 'Initial' then
   begin
      FDMC.vIsInput := False;
      vIsNew        := False;
      bNew.Enabled  := True;
      if (FDMC.tBonus.RecordCount > 0)then
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
      pInput.Width := 338;
      pInput.Height := 81;
   end;
end;

procedure TBonus.pInputMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   MDown := True;
   GetCursorPos(OPnt);
end;

procedure TBonus.pInputMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   MDown := False;
end;

procedure TBonus.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
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

procedure TBonus.EnterToTab(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 13 then
   begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
   end;
end;

procedure TBonus.bNewClick(Sender: TObject);
begin
   SetButton('Input');
   FDMC.qMBonus.Open;
   FDMC.qMBonus.Append;
   FDMC.qMBonus.FieldByName('OptId').AsInteger := FDMC.vOptId;
   FDMC.qMBonus.Post;
   vIsNew := True;
   eNama.SetFocus;
end;

procedure TBonus.bEditClick(Sender: TObject);
begin
   SetButton('Edit');
   with FDMC.qMBonus do
   begin
      sqls := 'SELECT * FROM mstbonus WHERE IdBonus = '+IntToStr(FDMC.tBonus.FieldByName('IdBonus').AsInteger)+'';
      Close;
      SQL.Clear;
      SQL.Add(sqls);
      Open;
      Edit;
   end;
   eNama.SetFocus;
end;

procedure TBonus.bDelClick(Sender: TObject);
begin
   with FDMC.qTemp do
   begin
      sqls := 'CALL ADMCekBefDel (''mstbonus'', '+IntToStr(FDMC.tBonus.FieldByName('IdBonus').AsInteger)+')';
      Close;
      SQL.Clear;
      SQL.Add(sqls);
      Execute;
   end;
   if FDMC.qTemp.FieldByName('Pesan').AsString = 'NG' then
   FDMC.MyMessageDialog('Peringatan', 'Id. Bonus sudah digunakan di data master lainnya atau transaksi!'+#13+
   'Penghapusan dibatalkan ...', mtWarning, [mbOK], ['OK']) else
   begin
      if FDMC.MyMessageDialog('Konfirmasi', 'Data akan dihapus secara permanen ...'+#13+
      'Hapus data ?', mtConfirmation, mbOKCancel, ['Ya', 'Tidak']) = mrOK then
      begin
         FDMC.tBonus.Delete;
         FDMC.tBonus.Refresh;
         SetButton('Initial');
      end;
   end;
end;

procedure TBonus.bSaveClick(Sender: TObject);
begin
   vOKSave := True;
   if eNama.Text = '' then
   begin
      eNama.SetFocus;
      MandatoryError;
   end;     
   if eBesar.Text = '' then
   begin
      eBesar.SetFocus;
      MandatoryError;
   end;

   if vOKSave then
   begin
      if FDMC.MyMessageDialog('Konfirmasi', 'Pastikan input data sudah benar...'+#13+
      'Simpan data?', mtConfirmation, mbOKCancel, ['Ya', 'Tidak']) = mrOK then
      begin
         FDMC.qMBonus.Post;
         FDMC.tBonus.Refresh;
         SetButton('Initial');
      end;
   end;
end;

procedure TBonus.bCancelClick(Sender: TObject);
begin
   if vIsNew then FDMC.qMBonus.Delete else FDMC.qMBonus.Cancel;
   FDMC.tBonus.Refresh;
   SetButton('Initial');
end;

procedure TBonus.eNamaEnter(Sender: TObject);
begin
   eNama.Color := clYellow;
end;

procedure TBonus.eNamaExit(Sender: TObject);
begin
   eNama.Color := clWindow;
end;

procedure TBonus.eBesarEnter(Sender: TObject);
begin
   eBesar.Color := clYellow;
end;

procedure TBonus.eBesarExit(Sender: TObject);
begin
   eBesar.Color := clWindow;
end;

procedure TBonus.bT1Click(Sender: TObject);
begin
   try
     mxDataSetExport1.DataSet := FDMC.tBonus;
     mxDataSetExport1.Execute;
     mxDataSetExport1.Select;
   finally
   end;
end;

end.
