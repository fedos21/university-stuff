program fais;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  UGrafik in 'UGrafik.pas' {Grafik},
  Signals in 'Signals.pas',
  USdvig in 'USdvig.pas' {SdvigForm},
  about in 'about.pas' {Abutform},
  CompForm in 'CompForm.pas' {ComplexForm};

{$R *.res}

begin
  Application.Initialize;
  Application.HelpFile := 'FAIS.HLP';
  Application.Title := '‘¿»—';

  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TGrafik, Grafik);
  Application.CreateForm(TSdvigForm, SdvigForm);
  Application.CreateForm(TAbutform, Abutform);
  Application.CreateForm(TComplexForm, ComplexForm);
  Application.Run;
end.
