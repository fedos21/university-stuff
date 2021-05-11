unit CompForm;

interface

uses
  Windows, StdCtrls, Classes, Controls,Forms;

type
  TComplexForm = class(TForm)
    Preobr: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    OperationNumber:Integer;
  end;

var
  ComplexForm: TComplexForm;
implementation

{$R *.dfm}

procedure TComplexForm.Button1Click(Sender: TObject);
begin
   OperationNumber:=1;
   ComplexForm.Close;
end;

procedure TComplexForm.Button2Click(Sender: TObject);
begin
   OperationNumber:=2;
   ComplexForm.Close;
end;

procedure TComplexForm.Button3Click(Sender: TObject);
begin
   OperationNumber:=3;
   ComplexForm.Close;
end;

procedure TComplexForm.FormShow(Sender: TObject);
begin
   OperationNumber:=0;
end;

end.
