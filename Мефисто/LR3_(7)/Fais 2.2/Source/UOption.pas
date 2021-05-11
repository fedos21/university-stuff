unit UOption;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TOptionSign = class(TForm)
    procedure Page1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OptionSign: TOptionSign;

implementation
uses main;
{$R *.dfm}

procedure TOptionSign.Page1Change(Sender: TObject);
begin
   MainForm.Chsign.ItemIndex:=OptionSign.Page1.TabIndex;
end;

end.
