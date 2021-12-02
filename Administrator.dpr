program Administrator;

uses
  Forms,
  SysUtils,
  Dialogs,
  FMainForm in 'FMainForm.pas' {MainForm},
  FUser in 'FUser.pas' {User},
  FSalesman in 'FSalesman.pas' {Salesman},
  FProyek in 'FProyek.pas' {Proyek},
  FTipe in 'FTipe.pas' {Tipe},
  Splash in '..\Common Units\Splash.pas' {FSplash},
  DMC in '..\Common Units\DMC.pas' {FDMC: TDataModule},
  FVersion in 'FVersion.pas' {VersionHist},
  FKavling in 'FKavling.pas' {Kavling},
  FHarga in 'FHarga.pas' {Harga},
  FBonus in 'FBonus.pas' {Bonus},
  FUpdater in '..\Common Units\FUpdater.pas' {Updater},
  FKonsumen in 'FKonsumen.pas' {Konsumen},
  FDM in 'FDM.pas' {DM: TDataModule},
  FKPR in 'FKPR.pas' {KPR};

{$R *.res}

begin
   Application.Initialize;
   Application.Title := 'Aplikasi Administrator';
   if not(FileExists(ExtractFilePath(Application.EXEName)+'config.ini')) then
   begin
      ShowMessage('File config.ini tidak ditemukan !'+#13+'Periksa folder Aplikasi Admin ...');
      Application.Terminate;
   end else
   begin
      Application.CreateForm(TFDMC, FDMC);
      Application.CreateForm(TDM, DM);
      Application.CreateForm(TMainForm, MainForm);
      if FDMC.ConGlobal.Connected then
      begin         
         Application.CreateForm(TFSplash, FSplash);
         FSplash.ShowModal;
         Application.Run;
      end else
      begin
         ShowMessage('Gangguan koneksi dengan server database !'+#13+'Periksa koneksi internet Anda...');
         Application.Terminate;
      end;
   end;
end.
