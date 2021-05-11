unit UGrafik;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, Menus, ToolWin,
  ComCtrls, Buttons, StdCtrls, Signals;

type
  TGrafik = class(TForm)
    Chart1: TChart;
    Chart2: TChart;
    Series2: TBarSeries;
    Series1: TBarSeries;
    ToolBar1: TToolBar;
    ReIm: TRadioButton;
    ModArg: TRadioButton;
    Markers: TCheckBox;
    ToolButton1: TToolButton;
    Panel1: TPanel;
    rbMachine: TRadioButton;
    rbMath: TRadioButton;
    ToolButton2: TToolButton;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    procedure FormResize(Sender: TObject);
    procedure ReImClick(Sender: TObject);
    procedure ModArgClick(Sender: TObject);
    procedure MarkersClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure draw(s : Signal);
    procedure to_off;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure rbMachineClick(Sender: TObject);
    procedure rbMathClick(Sender: TObject);
    procedure Chart1UndoZoom(Sender: TObject);
    procedure Chart2UndoZoom(Sender: TObject); // Когда нет ни одного сигнала, то пустой график
  private
    { Private declarations }
    procedure s_plot(s : Signal);
    procedure in_draw(s : Signal);
    procedure init_charts;
  public
  published
    procedure to_on;
    { Public declarations }
  end;

var
  Grafik : TGrafik;
implementation

uses   Main, about;
{$R *.dfm}

procedure TGrafik.init_charts;
begin
  Chart1.Bottomaxis.Maximum :=
    StrToInt( MainForm.DlinPreobr.Items[MainForm.DlinPreobr.ItemIndex] );
  Chart1.LeftAxis.Maximum := 1.1;
  Chart1.LeftAxis.Minimum := -0.1;

  Chart2.Bottomaxis.Maximum := Chart1.BottomAxis.Maximum;
  Chart2.LeftAxis.Maximum := 1.1;
  Chart2.LeftAxis.Minimum := -0.1;
end;

procedure TGrafik.FormResize(Sender: TObject);
begin
  Chart1.Height:=Grafik.ClientHeight div 2 - (ToolBar1.Height div 2)-1;
  Chart2.Height:=Grafik.ClientHeight div 2 - (ToolBar1.Height div 2)-1;
end;

procedure TGrafik.ReImClick(Sender: TObject);
begin
  Ar.get.re_im_plot:=true;
  in_Draw(ar.get);
end;

procedure TGrafik.ModArgClick(Sender: TObject);
begin
  Ar.get.re_im_plot:=false;
  in_Draw(ar.get);
end;

procedure TGrafik.MarkersClick(Sender: TObject);
begin
  Series1.Marks.Visible:= not Series1.Marks.Visible;
  Series2.Marks.Visible:= not Series2.Marks.Visible;
end;

procedure TGrafik.FormCreate(Sender: TObject);
begin
  Left    := 0;
  Top     := MainForm.Height;
  Width   := MainForm.Width;
  Height  := Screen.Height - MainForm.Height - 30;
  init_charts
end;

procedure TGrafik.s_plot(s : Signal);
var
  i     : integer;
  Max1,Max2,Min1,Min2 : Extended;
begin
  Series1.clear;
  Series2.clear;

  s.AxisMaxs(Max1,Max2);
  s.AxisMins(Min1,Min2);
  Chart1.LeftAxis.Maximum := Max1 * 1.5 +abs(Min1) * 0.05;
  Chart2.LeftAxis.Maximum := Max2 * 1.5 +abs(Min2) * 0.05;
  Chart1.LeftAxis.Minimum := Min1 * 1.1 -abs(Max1) * 0.05;
  Chart2.LeftAxis.Minimum := Min2 * 1.1 -abs(Max2) * 0.05;

  if s.scale = scMachine then
  begin
    // Машинная шкала
    for i := 0 to s.Razm - 1 do
    begin
      Series1.AddBar(s.get_plot_data1(i), IntToStr(i), clRed);
      Series2.AddBar(s.get_plot_data2(i), IntToStr(i), clRed);
    end;
  end
  else
  begin
    // Математическая шкала
    for i := s.Razm div 2 to s.Razm - 1 do
    begin
      Series1.AddBar(s.get_plot_data1(i), IntToStr(-(s.razm  - i)), clRed);
      Series2.AddBar(s.get_plot_data2(i), IntToStr(-(s.razm  - i)), clRed);
    end;
    for i := 0 div 2 to s.Razm div 2 - 1 do
    begin
      Series1.AddBar(s.get_plot_data1(i), IntToStr(i), clRed);
      Series2.AddBar(s.get_plot_data2(i), IntToStr(i), clRed);
    end;
  end
end;

procedure TGrafik.Draw(s : signal);
begin
  if s = NIL then
    exit;
  if not(Enabled) then
    Enabled := true;

  if s.re_im_plot then
  begin
    ModArg.Checked  := false;
    ReIm.Checked    := true;
  end
  else
  begin
    ReIm.Checked    := false;
    ModArg.Checked  := true;
  end;

  if s.scale = scMachine then
  begin
    rbMath.Checked    := false;
    rbMachine.Checked := true;
  end
  else
  begin
    rbMachine.Checked := false;
    rbMath.Checked    := true;    
  end;

  in_draw(s);
end;

procedure TGrafik.in_draw(s : Signal);
begin
  if s.re_im_plot then
  begin
//    Chart1.Title.Text.Text := 'Реальная часть:';
//    Chart2.Title.Text.Text := 'Мнимая часть:';
    Chart1.Title.Text.Text := 'Re:';
    Chart2.Title.Text.Text := 'Im:';
  end
  else
  begin
//    Chart1.Title.Text.Text := 'Модуль:';
//    Chart2.Title.Text.Text := 'Аргумент:';
    Chart1.Title.Text.Text := 'Mod:';
    Chart2.Title.Text.Text := 'Arg:';
  end;

  s_plot(s);
  Caption := MainForm.SignListBox.Items.Strings[Ar.curr];
end;

procedure TGrafik.to_off;
begin
  Series1.clear;
  Series2.clear;
  Chart1.BottomAxis.Automatic := false;
  Chart2.BottomAxis.Automatic := false;

  init_charts;
  ReIm.Enabled      := false;
  ModArg.Enabled    := false;;
  Markers.Enabled   := false;;
  rbMachine.Enabled := false;;
  rbMath.Enabled    := false;;
end;

procedure TGrafik.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Пересылаем сообщение о закрытии в главное окно, сами ничего не делаем!
  Action := caNone;
  SendMessage(MainForm.Handle,WM_CLOSE, 0, 0);
end;

procedure TGrafik.N1Click(Sender: TObject);
begin
  Chart1.CopyToClipboardMetafile(true);
end;

procedure TGrafik.MenuItem1Click(Sender: TObject);
begin
  Chart2.CopyToClipboardBitmap;
end;

procedure TGrafik.to_on;
begin
  ReIm.Enabled      := true;
  ModArg.Enabled    := true;
  Markers.Enabled   := true;
  rbMachine.Enabled := true;
  rbMath.Enabled    := true;

  Chart1.BottomAxis.Automatic := true;
  Chart2.BottomAxis.Automatic := true;
end;

procedure TGrafik.rbMachineClick(Sender: TObject);
begin
  Ar.get.scale := scMachine;
  in_Draw(ar.get);
end;

procedure TGrafik.rbMathClick(Sender: TObject);
begin
  Ar.get.scale := scMath;
  in_Draw(ar.get);
end;

procedure TGrafik.Chart1UndoZoom(Sender: TObject);
begin
  draw(Ar.get);
end;

procedure TGrafik.Chart2UndoZoom(Sender: TObject);
begin
  draw(Ar.get);
end;

end.
