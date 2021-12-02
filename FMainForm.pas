unit FMainForm;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ActnList, ImgList, dxWinXPBar, dxCore, dxContainer, db, ExtCtrls, StdCtrls,
   jpeg, Grids, DateUtils, Wwdbigrd, Wwdbgrid, AdvOfficeStatusBar;

type
   TMainForm = class(TForm)
      Panel1: TPanel;
      Label2: TLabel;
      Splitter1: TSplitter;
      sbxWinXPBar: TScrollBox;
      dxContainer1: TdxContainer;
    xpBarSistem: TdxWinXPBar;
      dxContainer3: TdxContainer;
    xpBarData: TdxWinXPBar;
    Gambar: TImageList;
      aclWinXPBar: TActionList;
    Proyek: TAction;
    Kavling: TAction;
      Keluar: TAction;
      LNmPers: TLabel;
      Splitter3: TSplitter;
      Pengguna: TAction;
      Image1: TImage;
      Salesman: TAction;
    TipeRumah: TAction;
    VersionHistory: TAction;
    Bonus: TAction;
    Harga: TAction;
    Konsumen: TAction;
    advStatusBar: TAdvOfficeStatusBar;
    KPR: TAction;
    procedure KeluarExecute(Sender: TObject);
    procedure Tutup;
    procedure KavlingExecute(Sender: TObject);
    procedure ProyekExecute(Sender: TObject);
    procedure SalesmanExecute(Sender: TObject);
    procedure PenggunaExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CekVersi;
    procedure VersionHistoryExecute(Sender: TObject);
    procedure TipeRumahExecute(Sender: TObject);
    procedure HargaExecute(Sender: TObject);
    procedure BonusExecute(Sender: TObject);
    procedure KonsumenExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure KPRExecute(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   MainForm: TMainForm;

implementation

uses DMC, FDM, FProyek, FSalesman, FTipe, FUser, FVersion, FBonus, FHarga, FKavling, FUpdater, FKonsumen, FKPR;

{$R *.DFM}

procedure TMainForm.Tutup;
begin
   if MainForm.MDIChildCount <> 0 then
      MainForm.MDIChildren[0].Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
   ShortDateFormat := 'DD-MM-YYYY';
   LongDateFormat  := 'DDDD, DD MMMM YYYY';
   LongMonthNames[01] := 'Januari';
   LongMonthNames[02] := 'Pebruari';
   LongMonthNames[03] := 'Maret';
   LongMonthNames[04] := 'April';
   LongMonthNames[05] := 'Mei';
   LongMonthNames[06] := 'Juni';
   LongMonthNames[07] := 'Juli';
   LongMonthNames[08] := 'Agustus';
   LongMonthNames[09] := 'September';
   LongMonthNames[10] := 'Oktober';
   LongMonthNames[11] := 'Nopember';
   LongMonthNames[12] := 'Desember';
   LongDayNames[1] := 'Minggu';
   LongDayNames[2] := 'Senin';
   LongDayNames[3] := 'SeLasa';
   LongDayNames[4] := 'Rabu';
   LongDayNames[5] := 'Kamis';
   LongDayNames[6] := 'Juma''t';
   LongDayNames[7] := 'Sabtu';
end;
      
procedure TMainForm.PenggunaExecute(Sender: TObject);
begin
   Tutup; 
   CekVersi;
   Application.CreateForm(TUser, User);
end;
        
procedure TMainForm.ProyekExecute(Sender: TObject);
begin
   Tutup;
   CekVersi;
   if FDMC.vUserLogin <> '' then
   Application.CreateForm(TProyek, Proyek) else
   FDMC.MyMessageDialog('Peringatan', 'Anda belum login dengan level DBA', mtWarning, [mbOK], ['OK']);
end;

procedure TMainForm.TipeRumahExecute(Sender: TObject);
begin 
   Tutup;
   CekVersi;   
   if FDMC.vUserLogin <> '' then
   Application.CreateForm(TTipe, Tipe) else
   FDMC.MyMessageDialog('Peringatan', 'Anda belum login dengan level DBA', mtWarning, [mbOK], ['OK']);
end;
         
procedure TMainForm.KavlingExecute(Sender: TObject);
begin
   Tutup;
   CekVersi;
   if FDMC.vUserLogin <> '' then
   Application.CreateForm(TKavling, Kavling) else
   FDMC.MyMessageDialog('Peringatan', 'Anda belum login dengan level DBA', mtWarning, [mbOK], ['OK']);
end;
  
procedure TMainForm.HargaExecute(Sender: TObject);
begin
   Tutup;
   CekVersi;
   if FDMC.vUserLogin <> '' then
   Application.CreateForm(THarga, Harga) else
   FDMC.MyMessageDialog('Peringatan', 'Anda belum login dengan level DBA', mtWarning, [mbOK], ['OK']);
end;
        
procedure TMainForm.KPRExecute(Sender: TObject);
begin
   Tutup;
   CekVersi; 
   if FDMC.vUserLogin <> '' then 
   Application.CreateForm(TKPR, KPR) else
   FDMC.MyMessageDialog('Peringatan', 'Anda belum login dengan level DBA', mtWarning, [mbOK], ['OK']);
end;

procedure TMainForm.BonusExecute(Sender: TObject);
begin
   Tutup;
   CekVersi; 
   if FDMC.vUserLogin <> '' then
   Application.CreateForm(TBonus, Bonus) else
   FDMC.MyMessageDialog('Peringatan', 'Anda belum login dengan level DBA', mtWarning, [mbOK], ['OK']);
end;

procedure TMainForm.SalesmanExecute(Sender: TObject);
begin
   Tutup;
   CekVersi;
   if FDMC.vUserLogin <> '' then
   Application.CreateForm(TSalesman, Salesman) else
   FDMC.MyMessageDialog('Peringatan', 'Anda belum login dengan level DBA', mtWarning, [mbOK], ['OK']);
end;
       
procedure TMainForm.KonsumenExecute(Sender: TObject);
begin
   Tutup;
   CekVersi;
   if FDMC.vUserLogin <> '' then
   Application.CreateForm(TKonsumen, Konsumen) else
   FDMC.MyMessageDialog('Peringatan', 'Anda belum login dengan level DBA', mtWarning, [mbOK], ['OK']);
end;

procedure TMainForm.VersionHistoryExecute(Sender: TObject);
begin    
   Tutup;
   CekVersi;
   Application.CreateForm(TVersionHist, VersionHist);
end;

procedure TMainForm.KeluarExecute(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TMainForm.CekVersi;
begin
   DM.CekVersi;
   if DM.MustUpdate = 1 then
   begin
      ShowMessage('Terdapat update yang lebih baru untuk aplikasi ini !'+#13+
                  'Silakan update aplikasi ini ...');
      Close;
      Application.CreateForm(TUpdater, Updater);
      Updater.ShowModal;
   end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
   if FDMC.vLoggedIn then
   begin
      MainForm.Caption := DM.AppDesc+' '+DM.LastVerStr;
      advStatusBar.Panels.Items[2].Text := FDMC.vNamaOpt+' ('+FDMC.vLevelOpt+')';
      advStatusBar.Panels.Items[3].Text := ' connected to '+FDMC.vServer;
      Application.CreateForm(THarga, Harga);
   end;
end;

end.
