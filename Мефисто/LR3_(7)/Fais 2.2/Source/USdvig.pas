unit USdvig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TSdvigForm = class(TForm)
    SdvigSign: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SdvigForm: TSdvigForm;

implementation

{$R *.dfm}

end.
