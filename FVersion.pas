unit FVersion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TVersionHist = class(TForm)
    mmo1: TMemo;
    pnl1: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VersionHist: TVersionHist;

implementation

{$R *.dfm}

procedure TVersionHist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin      
   Action := caFree;
end;

end.
