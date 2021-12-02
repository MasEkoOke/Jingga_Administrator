unit FKavling;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, DbUtilsEh, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, db,
  Wwdbspin, StdCtrls, Mask, wwdbedit, GridsEh, DBAxisGridsEh, DBGridEh,
  dxCore, dxButtons, ExtCtrls, Wwdotdot, Wwdbcomb, wwdblook, mxExport;

type
  TKavling = class(TForm)
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
    Label1: TLabel;
    eNIB: TwwDBEdit;
    bCancel: TdxButton;
    bSave: TdxButton;
    eKodeKav: TwwDBEdit;
    eSHM: TwwDBEdit;
    eLB: TwwDBSpinEdit;
    cbPosisi: TwwDBComboBox;
    cbProyek: TwwDBLookupCombo;
    eLBPN: TwwDBSpinEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    eLSelisih: TwwDBSpinEdit;
    eLSTD: TwwDBSpinEdit;
    Label3: TLabel;
    eProgres: TwwDBSpinEdit;
    Label8: TLabel;
    eKeterangan: TwwDBComboBox;
    pTopBorder: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    eAJB: TwwDBEdit;
    Label15: TLabel;
    cbRC: TwwDBComboBox;
    Label16: TLabel;
    cbLProyek: TwwDBLookupCombo;
    Label17: TLabel;
    cbLType: TwwDBLookupCombo;
    bT1: TdxButton;
    mxDataSetExport1: TmxDataSetExport;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MandatoryError; 
    procedure SetButton(status: string);
    procedure pInputMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pInputMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EnterToTab(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bNewClick(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure bDelClick(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure cbProyekEnter(Sender: TObject);
    procedure cbProyekExit(Sender: TObject);
    procedure eKodeKavEnter(Sender: TObject);
    procedure eKodeKavExit(Sender: TObject);
    procedure cbProyekCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cbPosisiCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure cbPosisiEnter(Sender: TObject);
    procedure cbPosisiExit(Sender: TObject);
    procedure eNIBEnter(Sender: TObject);
    procedure eNIBExit(Sender: TObject);
    procedure eLBEnter(Sender: TObject);
    procedure eLBExit(Sender: TObject);
    procedure eLSTDEnter(Sender: TObject);
    procedure eLSTDExit(Sender: TObject);
    procedure eLBPNEnter(Sender: TObject);
    procedure eLBPNExit(Sender: TObject);
    procedure eLSelisihEnter(Sender: TObject);
    procedure eLSelisihExit(Sender: TObject);
    procedure eProgresEnter(Sender: TObject);
    procedure eProgresExit(Sender: TObject);
    procedure eKeteranganEnter(Sender: TObject);
    procedure eKeteranganExit(Sender: TObject);
    procedure eKeteranganCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure cbRCCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure cbRCEnter(Sender: TObject);
    procedure cbRCExit(Sender: TObject);
    procedure cbLTypeChange(Sender: TObject);
    procedure cbLProyekChange(Sender: TObject);
    procedure bT1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Kavling: TKavling;
  sqls: string;
  vOKSave, vIsNew, vIsRegistered: Boolean;
  MDown: Boolean = False;
  OPnt, NPnt : TPoint;

implementation

uses
   DMC;

{$R *.dfm}

procedure TKavling.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if FDMC.vIsInput then
   begin
      FDMC.MyMessageDialog('Peringatan', 'Simpan atau Batalkan input data !', mtWarning, [mbOK], ['OK']);
      Abort;
   end;  
   FDMC.qMKavling.Close;
   Action := caFree;
end;

procedure TKavling.SetButton(status: string);
begin
   if status = 'Initial' then
   begin
      FDMC.vIsInput := False;
      vIsNew        := False;
      if (FDMC.tTipe.RecordCount > 0) then
      bNew.Enabled  := True else
      bNew.Enabled := False;
      if (FDMC.tKavling.RecordCount > 0) and (FDMC.tTipe.RecordCount > 0) then
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
      pInput.Width := 482;
      pInput.Height := 242;
   end;
end;
   
procedure TKavling.MandatoryError;
begin
   FDMC.MyMessageDialog('Peringatan', 'Terdapat data wajib isi yang masih kosong !', mtWarning, [mbOK], ['OK']);
   vOKSave := False;
   Abort;
end;

procedure TKavling.pInputMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   MDown := True;
   GetCursorPos(OPnt);
end;
              
procedure TKavling.pInputMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   MDown := False;
end;

procedure TKavling.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
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

procedure TKavling.EnterToTab(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 13 then
   begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
   end;
end;

procedure TKavling.bNewClick(Sender: TObject);
begin
   SetButton('Input');
   FDMC.qMKavling.Open;
   FDMC.qMKavling.Append;
   FDMC.qMKavling.FieldByName('OptId').AsInteger := FDMC.vOptId;
   FDMC.qMKavling.Post;
   vIsNew := True;
   eKodeKav.SetFocus;
end;

procedure TKavling.bEditClick(Sender: TObject);
begin
   SetButton('Edit');
   with FDMC.qMKavling do
   begin
      sqls := 'SELECT * FROM mstkavling WHERE IdKavling = '+IntToStr(FDMC.tKavling.FieldByName('IdKavling').AsInteger)+'';
      Close;
      SQL.Clear;
      SQL.Add(sqls);
      Open;
      Edit;
   end;
   cbProyek.SetFocus;
end;

procedure TKavling.bDelClick(Sender: TObject);
begin
   with FDMC.qTemp do
   begin
      sqls := 'CALL ADMCekBefDel (''mstkavling'', '+IntToStr(FDMC.tKavling.FieldByName('IdKavling').AsInteger)+')';
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
         FDMC.tKavling.Delete;
         FDMC.tKavling.Refresh;
         SetButton('Initial');
      end;
   end;
end;

procedure TKavling.bSaveClick(Sender: TObject);
begin
   vOKSave := True;
   if cbProyek.Text = '' then
   begin
      cbProyek.SetFocus;
      MandatoryError;
   end;     
   if eKodeKav.Text = '' then
   begin
      eKodeKav.SetFocus;
      MandatoryError;
   end;     
   if eLB.Text = '' then
   begin
      eLB.SetFocus;
      MandatoryError;
   end;    
   if eLSTD.Text = '' then
   begin
      eLSTD.SetFocus;
      MandatoryError;
   end;
   if eLBPN.Text = '' then
   begin
      eLBPN.SetFocus;
      MandatoryError;
   end;  
   if eLSelisih.Text = '' then
   begin
      eLSelisih.SetFocus;
      MandatoryError;
   end;   
   if eProgres.Text = '' then
   begin
      eProgres.SetFocus;
      MandatoryError;
   end;    
   if eKeterangan.Text = '' then
   begin
      eKeterangan.SetFocus;
      MandatoryError;
   end;
   
   if (eAJB.Text = '') or (eAJB.Text = '0') then
   begin
      eAJB.SetFocus;
      MandatoryError;
   end;

   if vOKSave then
   begin
      if FDMC.MyMessageDialog('Konfirmasi', 'Pastikan input data sudah benar...'+#13+
      'Simpan data?', mtConfirmation, mbOKCancel, ['Ya', 'Tidak']) = mrOK then
      begin
         FDMC.qMKavling.FieldByName('LebihKurangLuas').AsFloat := FDMC.qMKavling.FieldByName('LuasTanahBPN').AsFloat -
                                                                  FDMC.qMKavling.FieldByName('LuasTanahStandar').AsFloat;
         FDMC.qMKavling.Post;
         FDMC.tKavling.Refresh;
         SetButton('Initial');
      end;
   end;
end;

procedure TKavling.bCancelClick(Sender: TObject);
begin
   if vIsNew then FDMC.qMKavling.Delete else FDMC.qMKavling.Cancel;
   FDMC.tKavling.Refresh;
   SetButton('Initial');
end;
       
procedure TKavling.cbProyekCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
   //### Cek Tipe Rumah di Proyek terpilih ###
   if (eKodeKav.Text <> '') and (vIsNew) then
   begin
      with FDMC.qTemp do
      begin
         sqls := 'SELECT * FROM mstkavling WHERE KodeKavling = '''+eKodeKav.Text+''' AND '+
                 'IdType  = '+IntToStr(FDMC.tTipe.FieldByName('IdType').AsInteger)+'';
         Close;
         SQL.Clear;
         SQL.Add(sqls);
         Open;
      end;
      if FDMC.qTemp.RecordCount > 0 then
      begin
         FDMC.MyMessageDialog('Peringatan', 'Kode kavling ini sudah terdaftar !', mtWarning, [mbOK], ['OK']);
         eKodeKav.SetFocus;
      end else cbPosisi.SetFocus;
   end;
end;

procedure TKavling.cbProyekEnter(Sender: TObject);
begin
   cbProyek.ShowButton := True;
   cbProyek.Color := clYellow;
end;

procedure TKavling.cbProyekExit(Sender: TObject);
begin
   cbProyek.ShowButton := False;
   cbProyek.Color := clWindow;
end;

procedure TKavling.eKodeKavEnter(Sender: TObject);
begin
   eKodeKav.Color := clYellow;
end;

procedure TKavling.eKodeKavExit(Sender: TObject);
begin
   eKodeKav.Color := clWindow;
end;

procedure TKavling.cbPosisiCloseUp(Sender: TwwDBComboBox; Select: Boolean);
begin
//   eNIB.SetFocus;
end;

procedure TKavling.cbPosisiEnter(Sender: TObject);
begin
   cbPosisi.ShowButton := True;
   cbPosisi.Color := clYellow;
end;

procedure TKavling.cbPosisiExit(Sender: TObject);
begin
   cbPosisi.ShowButton := False;
   cbPosisi.Color := clWindow;
end;

procedure TKavling.eNIBEnter(Sender: TObject);
begin 
   eNIB.Color := clYellow;
end;

procedure TKavling.eNIBExit(Sender: TObject);
begin
   eNIB.Color := clWindow;
end;

procedure TKavling.eLBEnter(Sender: TObject);
begin
   eLB.Color := clYellow;
end;

procedure TKavling.eLBExit(Sender: TObject);
begin
   eLB.Color := clWindow;
end;

procedure TKavling.eLSTDEnter(Sender: TObject);
begin
   eLSTD.Color := clYellow;
end;

procedure TKavling.eLSTDExit(Sender: TObject);
begin
   eLSTD.Color := clWindow;
   if (eLBPN.Value > 0) and (eLSTD.Value >= 0) then eLSelisih.Value := eLBPN.Value - eLSTD.Value;
end;

procedure TKavling.eLBPNEnter(Sender: TObject);
begin
   eLBPN.Color := clYellow;
end;

procedure TKavling.eLBPNExit(Sender: TObject);
begin
   eLBPN.Color := clWindow;
   if (eLBPN.Value > 0) and (eLSTD.Value >= 0) then eLSelisih.Value := eLBPN.Value - eLSTD.Value;
end;

procedure TKavling.eLSelisihEnter(Sender: TObject);
begin
   eLSelisih.Color := clYellow;
end;

procedure TKavling.eLSelisihExit(Sender: TObject);
begin
   eLSelisih.Color := clWindow;
end;

procedure TKavling.eProgresEnter(Sender: TObject);
begin
   eProgres.Color := clYellow;
end;

procedure TKavling.eProgresExit(Sender: TObject);
begin
   eProgres.Color := clWindow;
end;

procedure TKavling.eKeteranganEnter(Sender: TObject);
begin
   eKeterangan.Color := clYellow;
end;

procedure TKavling.eKeteranganExit(Sender: TObject);
begin
   eKeterangan.Color := clWindow;
end;

procedure TKavling.eKeteranganCloseUp(Sender: TwwDBComboBox;
  Select: Boolean);
begin
   bSave.SetFocus
end;

procedure TKavling.cbRCCloseUp(Sender: TwwDBComboBox; Select: Boolean);
begin
   bSave.SetFocus;
end;

procedure TKavling.cbRCEnter(Sender: TObject);
begin
   cbRC.ShowButton := True;
   cbRC.Color := clYellow;
end;

procedure TKavling.cbRCExit(Sender: TObject);
begin                     
   cbRC.ShowButton := False;
   cbRC.Color := clWindow;
end;

procedure TKavling.cbLProyekChange(Sender: TObject);
begin
   FDMC.tKavling.Filtered := True;
   FDMC.tKavling.FilterSQL := 'IdKavling > 0';
   
   if cbLProyek.Text <> '' then
   FDMC.tKavling.FilterSQL := FDMC.tKavling.FilterSQL + ' AND IdType IN (SELECT IdType FROM msttype WHERE IdProyek = '+IntToStr(FDMC.tProyek.FieldByName('IdProyek').AsInteger)+')';

   if cbLType.Text <> '' then
   FDMC.tKavling.FilterSQL := FDMC.tKavling.FilterSQL + ' AND IdType = '+IntToStr(FDMC.tTipe.FieldByName('IdType').AsInteger)+'';

   FDMC.tKavling.FilterSQL := FDMC.tKavling.FilterSQL+ ' ORDER BY KodeKavling, LENGTH(KodeKavling)';
end;
       
procedure TKavling.cbLTypeChange(Sender: TObject);
begin
   FDMC.tKavling.Filtered := True;
   FDMC.tKavling.FilterSQL := 'IdKavling > 0';

   if cbLType.Text <> '' then
//   FDMC.tKavling.FilterSQL := FDMC.tKavling.FilterSQL + ' AND IdType > 0' else
   FDMC.tKavling.FilterSQL := FDMC.tKavling.FilterSQL + ' AND IdType = '+IntToStr(FDMC.tTipe.FieldByName('IdType').AsInteger)+'';

   if cbLProyek.Text <> '' then
//   FDMC.tKavling.FilterSQL := FDMC.tKavling.FilterSQL else
   FDMC.tKavling.FilterSQL := FDMC.tKavling.FilterSQL + ' AND IdType IN (SELECT IdType FROM msttype WHERE IdProyek = '+IntToStr(FDMC.tProyek.FieldByName('IdProyek').AsInteger)+')';

   FDMC.tKavling.FilterSQL := FDMC.tKavling.FilterSQL+ ' ORDER BY KodeKavling, LENGTH(KodeKavling)';
end;

procedure TKavling.FormShow(Sender: TObject);
begin    
   FDMC.tTipe.Refresh;
   FDMC.tKavling.Filtered := True;
   FDMC.tKavling.FilterSQL := 'IdKavling > 0 ORDER BY KodeKavling, LENGTH(KodeKavling)'; 
   cbLProyek.Text := '';
   cbLType.Text := '';
   SetButton('Initial');
end;

procedure TKavling.bT1Click(Sender: TObject);
begin
   try
     mxDataSetExport1.DataSet := FDMC.tKavling;
     mxDataSetExport1.Execute;
     mxDataSetExport1.Select;
   finally
   end;
end;

end.
