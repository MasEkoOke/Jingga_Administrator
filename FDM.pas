unit FDM;

interface

uses
  SysUtils, Classes, DB, DBAccess, MyAccess, MemDS, Forms, Dialogs, StdCtrls;

type
  TDM = class(TDataModule)
    ConGlobal: TMyConnection;
    qTemp: TMyQuery;
    Function MyMessageDialog(Title, Text: string; DlgType: TMsgDlgType;
             Buttons: TMsgDlgButtons; BtnCaptions: array of string): Integer;
    procedure DataModuleCreate(Sender: TObject);
    procedure ConGlobalAfterConnect(Sender: TObject); 
    procedure CekVersi;
  private
    { Private declarations }
  public   
   vTerminate: Boolean;
   vAppName, AppName, AppDesc, LastVerStr: String;
   LastVerDate: TDateTime;
   VerNum, LastVer, MustUpdate, VerDate, vLvlOpt: Integer;  
  end;

var
   DM: TDM;

implementation

uses
   DMC;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
   vAppName           := 'Administrator';
   VerNuM             := 111;
   ConGlobal.Server   := FDMC.ConGlobal.Server;
   ConGlobal.Database := FDMC.ConGlobal.Database;
   ConGlobal.Username := FDMC.ConGlobal.Username;   
   ConGlobal.Password := FDMC.ConGlobal.Password;
   ConGlobal.Port     := FDMC.ConGlobal.Port;
   ConGlobal.Connect;
end;

procedure TDM.ConGlobalAfterConnect(Sender: TObject);
begin
   vTerminate := False;
   VerDate := FileAge(Application.ExeName);
   CekVersi;
   if MustUpdate = 1 then
   begin
      MyMessageDialog('Perhatian','Terdapat update yang lebih baru untuk aplikasi ini !'+#13+
                      'Silakan tutup dan jalankan ulang aplikasi ini untuk mengupdatenya.', mtWarning, [mbOK], ['OK']);
      ConGlobal.Disconnect;
      Application.Terminate;
   end;
end;

procedure TDM.CekVersi;
begin
   with qTemp do
   begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM appversion WHERE AppName = '''+vAppName+'''');
      Open;
   end;        
   AppName    := qTemp.FieldByName('AppName').AsString;
   AppDesc    := qTemp.FieldByName('AppDesc').AsString;
   LastVer    := qTemp.FieldByName('LastVer').AsInteger;
   LastVerStr := qTemp.FieldByName('LastVerStr').AsString;

   if (LastVer > VerNum) or (FileDateToDateTime(VerDate) < qTemp.FieldByName('LastVerDate').AsDateTime)
   then MustUpdate := 1 else MustUpdate := 0;
end;

function TDM.MyMessageDialog(Title, Text: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; BtnCaptions: array of string): Integer;
var
    dlgButton: TButton;
    i, BtnIndex: Integer;
begin
   with CreateMessageDialog(Text, DlgType, Buttons) do
   begin
      BtnIndex := 0;
      Caption := Title;
      for i := 0 to ComponentCount - 1 do
        if (Components[i] is TButton) then
        begin
            dlgButton := TButton(Components[i]);
            if BtnIndex > High(BtnCaptions) then Break;
            dlgButton.Caption := BtnCaptions[BtnIndex];
            Inc(BtnIndex);
        end;
      Result := ShowModal;
   end;
end;

end.
