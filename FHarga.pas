unit FHarga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, db,
  Wwdbspin, StdCtrls, Mask, wwdbedit, GridsEh, DBAxisGridsEh, DBGridEh,
  dxCore, dxButtons, ExtCtrls, Wwdotdot, Wwdbcomb, wwdblook, mxExport;

type
  THarga = class(TForm)
    pnlButton: TPanel;
    bNew: TdxButton;
    bEdit: TdxButton;
    bDel: TdxButton;
    dbgData: TDBGridEh;
    pInput: TPanel;
    bCancel: TdxButton;
    bSave: TdxButton;
    Llbl1: TLabel;
    cbProyek: TwwDBLookupCombo;
    Llbl6: TLabel;
    Llbl8: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    cbBangunan: TwwDBSpinEdit;
    Label3: TLabel;
    cbTanah: TwwDBSpinEdit;
    cbSelisih: TwwDBSpinEdit;
    Label4: TLabel;
    cbDiskonPlus: TwwDBSpinEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cbPelaksanaan: TwwDBSpinEdit;
    Label11: TLabel;
    Label12: TLabel;
    eKeterangan: TwwDBEdit;
    pTopBorder: TPanel;
    Label13: TLabel;
    ePPNRate: TwwDBSpinEdit;
    eBPHTBRate: TwwDBSpinEdit;
    eBBNRate: TwwDBSpinEdit;
    Label14: TLabel;
    ePNPBRate: TwwDBSpinEdit;
    Label15: TLabel;
    eUMRate: TwwDBSpinEdit;
    Label16: TLabel;
    eKPRRate: TwwDBSpinEdit;
    Label17: TLabel;
    eBPHTB: TwwDBSpinEdit;
    Label18: TLabel;
    ePNPB: TwwDBSpinEdit;
    Label19: TLabel;
    eBBN: TwwDBSpinEdit;
    Label20: TLabel;
    eLain: TwwDBSpinEdit;
    Label21: TLabel;
    eBooking: TwwDBSpinEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    cbLProyek: TwwDBLookupCombo;
    Label29: TLabel;
    eRevisi: TwwDBEdit;
    bT1: TdxButton;
    mxDataSetExport1: TmxDataSetExport;
    cblRev: TwwDBLookupCombo;
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
    procedure cbProyekCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cbProyekEnter(Sender: TObject);
    procedure cbProyekExit(Sender: TObject);
    procedure eRevisiEnter(Sender: TObject);
    procedure eRevisiExit(Sender: TObject);
    procedure cbBangunanEnter(Sender: TObject);
    procedure cbBangunanExit(Sender: TObject);
    procedure cbTanahEnter(Sender: TObject);
    procedure cbTanahExit(Sender: TObject);
    procedure cbSelisihEnter(Sender: TObject);
    procedure cbSelisihExit(Sender: TObject);
    procedure cbDiskonPlusEnter(Sender: TObject);
    procedure cbDiskonPlusExit(Sender: TObject);
    procedure cbPelaksanaanEnter(Sender: TObject);
    procedure cbPelaksanaanExit(Sender: TObject);
    procedure eKeteranganEnter(Sender: TObject);
    procedure eKeteranganExit(Sender: TObject);
    procedure cbLProyekChange(Sender: TObject);
    procedure bT1Click(Sender: TObject);
    procedure cblRevChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Harga: THarga;
  sqls: string;
  vOKSave, vIsNew: Boolean;
  MDown: Boolean = False;
  OPnt, NPnt : TPoint;
  vHrgStd: Double;

implementation

uses
   DMC;

{$R *.dfm}

procedure THarga.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if FDMC.vIsInput then
   begin
      FDMC.MyMessageDialog('Peringatan', 'Simpan atau Batalkan input data !', mtWarning, [mbOK], ['OK']);
      Abort;
   end;
   FDMC.qLRevKe.Close;
   FDMC.qMHarga.Close;
   Action := caFree;
end;

procedure THarga.SetButton(status: string);
begin
   if status = 'Initial' then
   begin
      FDMC.vIsInput := False;
      vIsNew        := False; 
      if (FDMC.tTipe.RecordCount > 0) then
      bNew.Enabled  := True else
      bNew.Enabled := False;
      if (FDMC.tHarga.RecordCount > 0) and (FDMC.tTipe.RecordCount > 0) then
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
      pInput.Left := 20;
      pInput.Top := 68;
      pInput.Width := 725;
      pInput.Height := 218;
   end;
end;

procedure THarga.MandatoryError;
begin
   FDMC.MyMessageDialog('Peringatan', 'Terdapat data wajib isi yang masih kosong !', mtWarning, [mbOK], ['OK']);
   vOKSave := False;
   Abort;
end;

procedure THarga.pInputMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   MDown := True;
   GetCursorPos(OPnt);
end;

procedure THarga.pInputMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   MDown := False;
end;

procedure THarga.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
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

procedure THarga.EnterToTab(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 13 then
   begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
   end;
end;

procedure THarga.bNewClick(Sender: TObject);
begin
   SetButton('Input');
   FDMC.qMHarga.Open;
   FDMC.qMHarga.Append;
   FDMC.qMHarga.FieldByName('OptId').AsInteger := FDMC.vOptId; 
   FDMC.qMHarga.Post;
   vIsNew := True;
   cbProyek.SetFocus;
end;

procedure THarga.bEditClick(Sender: TObject);
begin
   SetButton('Edit');
   with FDMC.qMHarga do
   begin
      sqls := 'SELECT * FROM mstharga WHERE IdHarga = '+IntToStr(FDMC.tHarga.FieldByName('IdHarga').AsInteger)+'';
      Close;
      SQL.Clear;
      SQL.Add(sqls);
      Open;
      Edit;
   end;
   cbProyek.SetFocus;
end;

procedure THarga.bDelClick(Sender: TObject);
begin
   with FDMC.qTemp do
   begin
      sqls := 'CALL ADMCekBefDel (''mstharga'', '+IntToStr(FDMC.tHarga.FieldByName('IdHarga').AsInteger)+')';
      Close;
      SQL.Clear;
      SQL.Add(sqls);
      Execute;
   end;
   if FDMC.qTemp.FieldByName('Pesan').AsString = 'NG' then
   FDMC.MyMessageDialog('Peringatan', 'Id. Harga sudah digunakan di data master lainnya atau transaksi!'+#13+
                        'Penghapusan dibatalkan ...', mtWarning, [mbOK], ['OK']) else
   begin
      if FDMC.MyMessageDialog('Konfirmasi', 'Data akan dihapus secara permanen ...'+#13+
                              'Hapus data ?', mtConfirmation, mbOKCancel, ['Ya', 'Tidak']) = mrOK then
      begin
         FDMC.tHarga.Delete;
         FDMC.tHarga.Refresh;
         SetButton('Initial');
      end;
   end;
end;

procedure THarga.bSaveClick(Sender: TObject);
begin
   vOKSave := True;
   if cbProyek.Text = '' then
   begin
      cbProyek.SetFocus;
      MandatoryError;
   end;     
   if eRevisi.Text = '' then
   begin
      eRevisi.SetFocus;
      MandatoryError;
   end;     
   if cbBangunan.Text = '' then
   begin
      cbBangunan.SetFocus;
      MandatoryError;
   end;     
   if cbTanah.Text = '' then
   begin
      cbTanah.SetFocus;
      MandatoryError;
   end;    
   if cbSelisih.Text = '' then
   begin
      cbSelisih.SetFocus;
      MandatoryError;
   end;
   if (ePPNRate.Text = '') or (ePPNRate.Text = '0') then
   begin
      ePPNRate.SetFocus;
      MandatoryError;
   end; 
   if (eBPHTBRate.Text = '') or (eBPHTBRate.Text = '0') then
   begin
      eBPHTBRate.SetFocus;
      MandatoryError;
   end;  
   if (eBPHTB.Text = '') or (eBPHTB.Text = '0') then
   begin
      eBPHTB.SetFocus;
      MandatoryError;
   end;  
   if (ePNPBRate.Text = '') or (ePNPBRate.Text = '0') then
   begin
      ePNPBRate.SetFocus;
      MandatoryError;
   end;
   if (eBBNRate.Text = '') or (eBBNRate.Text = '0') then
   begin
      eBBNRate.SetFocus;
      MandatoryError;
   end;
   if (eUMRate.Text = '') or (eUMRate.Text = '0') then
   begin
      eUMRate.SetFocus;
      MandatoryError;
   end;
   if (eKPRRate.Text = '') or (eKPRRate.Text = '0') then
   begin
      eKPRRate.SetFocus;
      MandatoryError;
   end;
   if (eBooking.Text = '') or (eBooking.Text = '0') then
   begin
      eBooking.SetFocus;
      MandatoryError;
   end;

   if vOKSave then
   begin
      if FDMC.MyMessageDialog('Konfirmasi', 'Pastikan input data sudah benar...'+#13+
      'Simpan data?', mtConfirmation, mbOKCancel, ['Ya', 'Tidak']) = mrOK then
      begin
         if FDMC.qMHarga.FieldByName('HargaJualStd').AsFloat = 0 then
         begin
            with FDMC.qTemp do
            begin
               sqls := 'UPDATE mstharga H JOIN '+
                       '(SELECT t.*, k.LuasTanahStandar, k.LuasBangunan, k.LebihKurangLuas FROM msttype t '+
                       ' JOIN mstkavling k ON t.IdType = k.IdType GROUP BY t.IdType) T ON H.IdType = T.IdType '+
                       'SET H.HargaJualStd = (H.HargaSatuanTanah * T.LuasTanahStandar) + (H.HargaSatuanBangunan * T.LuasBangunan) + '+
                       '                     (H.HargaSatuanLebihKurang * T.LebihKurangLuas) WHERE H.HargaJualStd = 0';
               Close;
               SQL.Clear;
               SQL.Add(sqls);
               Execute;
            end;
         end;
         FDMC.qMHarga.Post;
         FDMC.tHarga.Refresh;
         SetButton('Initial');
      end;
   end;
end;

procedure THarga.bCancelClick(Sender: TObject);
begin
   if vIsNew then FDMC.qMHarga.Delete else FDMC.qMHarga.Cancel;
   FDMC.tHarga.Refresh;
   SetButton('Initial');
end;

procedure THarga.cbProyekCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin

   eRevisi.SetFocus;
end;

procedure THarga.cbProyekEnter(Sender: TObject);
begin
   cbProyek.ShowButton := True;
   cbProyek.Color := clYellow;
end;

procedure THarga.cbProyekExit(Sender: TObject);
begin
   cbProyek.ShowButton := False;
   cbProyek.Color := clWindow;
end;

procedure THarga.eRevisiEnter(Sender: TObject);
begin
   eRevisi.Color := clYellow;
end;

procedure THarga.eRevisiExit(Sender: TObject);
begin 
   eRevisi.Color := clWindow;
end;

procedure THarga.cbBangunanEnter(Sender: TObject);
begin
   cbBangunan.Color := clYellow;
end;

procedure THarga.cbBangunanExit(Sender: TObject);
begin
   cbBangunan.Color := clWindow;
end;

procedure THarga.cbTanahEnter(Sender: TObject);
begin
   cbTanah.Color := clYellow;
end;

procedure THarga.cbTanahExit(Sender: TObject);
begin
   cbTanah.Color := clWindow;
end;

procedure THarga.cbSelisihEnter(Sender: TObject);
begin
   cbSelisih.Color := clYellow;
end;

procedure THarga.cbSelisihExit(Sender: TObject);
begin
   cbSelisih.Color := clWindow;
end;

procedure THarga.cbDiskonPlusEnter(Sender: TObject);
begin
   cbDiskonPlus.Color := clYellow;
end;

procedure THarga.cbDiskonPlusExit(Sender: TObject);
begin
   cbDiskonPlus.Color := clWindow;
end;

procedure THarga.cbPelaksanaanEnter(Sender: TObject);
begin
   cbPelaksanaan.Color := clYellow;
end;

procedure THarga.cbPelaksanaanExit(Sender: TObject);
begin
   cbPelaksanaan.Color := clWindow;
end;

procedure THarga.eKeteranganEnter(Sender: TObject);
begin
   eKeterangan.Color := clYellow;
end;

procedure THarga.eKeteranganExit(Sender: TObject);
begin
   eKeterangan.Color := clWindow;
end;
    
procedure THarga.FormShow(Sender: TObject);
begin
   FDMC.qLRevKe.Close;
   FDMC.qLRevKe.Open;
   FDMC.tHarga.Refresh;  
   FDMC.tHarga.Filtered := True;
   FDMC.tHarga.FilterSQL := 'IdHarga > 0 ORDER BY LENGTH(RevisiKe), RevisiKe';
   SetButton('Initial');
end;

procedure THarga.cbLProyekChange(Sender: TObject);
begin
   FDMC.tHarga.Filtered := True;
   FDMC.tHarga.FilterSQL := 'IdHarga > 0';
   
   if cbLProyek.Text <> '' then
   FDMC.tHarga.FilterSQL := FDMC.tHarga.FilterSQL + ' AND IdType IN (SELECT IdType FROM msttype WHERE IdProyek = '+IntToStr(FDMC.tProyek.FieldByName('IdProyek').AsInteger)+')';
     
   if cblRev.Text <> '' then
   FDMC.tHarga.FilterSQL := FDMC.tHarga.FilterSQL + 'AND RevisiKe = "'+cblRev.Text+'"';

   FDMC.tHarga.FilterSQL := FDMC.tHarga.FilterSQL+ ' ORDER BY LENGTH(RevisiKe), RevisiKe';
end;
   
procedure THarga.cblRevChange(Sender: TObject);
begin
   FDMC.tHarga.Filtered := True;
   FDMC.tHarga.FilterSQL := 'IdHarga > 0';

   if cblRev.Text <> '' then
   FDMC.tHarga.FilterSQL := FDMC.tHarga.FilterSQL + ' AND RevisiKe = "'+cblRev.Text+'"';

   if cbLProyek.Text <> '' then
   FDMC.tHarga.FilterSQL := FDMC.tHarga.FilterSQL + ' AND IdType IN (SELECT IdType FROM msttype WHERE IdProyek = '+IntToStr(FDMC.tProyek.FieldByName('IdProyek').AsInteger)+')';

   
   FDMC.tHarga.FilterSQL := FDMC.tHarga.FilterSQL+ ' ORDER BY LENGTH(RevisiKe), RevisiKe';
end;

procedure THarga.bT1Click(Sender: TObject);
begin
   try
     mxDataSetExport1.DataSet := FDMC.tHarga;
     mxDataSetExport1.Execute;
     mxDataSetExport1.Select;
   finally
   end;
end;

end.
