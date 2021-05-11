unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Ugrafik, ComCtrls, DBCtrls, Menus,
  Signals, CheckLst, Buttons, ToolWin, ExtCtrls;

type
  TMainForm = class(TForm)
    Newsign: TGroupBox;
    Preobr: TGroupBox;
    btnToLeft: TButton;
    btnToRight: TButton;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    mQuit: TMenuItem;
    mOpenFRK: TMenuItem;
    mExport: TMenuItem;
    mImport: TMenuItem;
    mClearFRK: TMenuItem;
    ButBPF: TButton;
    ButOBPF: TButton;
    ButSwertka: TButton;
    ButKorrelazia: TButton;
    SignListBox: TCheckListBox;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    N2: TMenuItem;
    mSaveFRK: TMenuItem;
    Label1: TLabel;
    rbSinus: TRadioButton;
    rbKolocol: TRadioButton;
    rbPryamoug: TRadioButton;
    rbTreug: TRadioButton;
    rbLPF: TRadioButton;
    rbDiff: TRadioButton;
    rbExport: TRadioButton;
    rbHilbert: TRadioButton;
    ButSlozh: TButton;
    ButUmnozh: TButton;
    ButZerk: TButton;
    ButSin: TButton;
    ButSdvig: TButton;
    butCos: TButton;
    News: TButton;
    Label2: TLabel;
    SinusPar: TPanel;
    Label3: TLabel;
    DlinPreobr: TComboBox;
    Label4: TLabel;
    eSinusF: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    eSinusAmpl: TEdit;
    Label7: TLabel;
    eSinusPhase: TEdit;
    KolocolPar: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    eKolocolSKO: TEdit;
    eKolocolAmpl: TEdit;
    PryamougPar: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    ePryamougWidth: TEdit;
    ePryamougAmpl: TEdit;
    TreugPar: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    eTreugWidth: TEdit;
    eTreugAmpl: TEdit;
    LPFPar: TPanel;
    Label16: TLabel;
    Label15: TLabel;
    eLPFcf: TEdit;
    eLPFpn: TEdit;
    EmptyPar: TPanel;
    rbImport: TRadioButton;
    ImportPar: TPanel;
    eImportFname: TEdit;
    Label14: TLabel;
    Button2: TButton;
    ToolBar1: TToolBar;
    btDelCurr: TBitBtn;
    sbOpenFRK: TSpeedButton;
    sbSaveFRK: TSpeedButton;
    sbClearFRK: TSpeedButton;
    sbExport: TSpeedButton;
    sbImport: TSpeedButton;
    butDelSelected: TButton;
    Help2: TMenuItem;
    About1: TMenuItem;
    Contents1: TMenuItem;
    N1: TMenuItem;
    eKolocolWidth: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    eLengthPR: TEdit;
    Label19: TLabel;
    eLengthLPF: TEdit;
    cbSimm: TCheckBox;
    Label20: TLabel;
    ButVych: TButton;
    ExportPar: TPanel;
    Label21: TLabel;
    eExportFname: TEdit;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnToLeftClick(Sender: TObject);
    procedure btnToRightClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure NewsClick(Sender: TObject);
    procedure SignListBoxClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButBPFClick(Sender: TObject);
    procedure ButOBPFClick(Sender: TObject);
    procedure ButUmnozhClick(Sender: TObject);
    procedure ButSwertkaClick(Sender: TObject);
    procedure ButKorrelaziaClick(Sender: TObject);
    procedure ButZerkClick(Sender: TObject);
    procedure ButSlozhClick(Sender: TObject);
    procedure ButSinClick(Sender: TObject);
    procedure ButSdvigClick(Sender: TObject);

    procedure update_buttons_en;
    procedure DelClick(Sender: TObject);
    procedure DelALLClick(Sender: TObject);
    procedure AboutClick(Sender: TObject);
    procedure mImportClick(Sender: TObject);
    procedure mExportClick(Sender: TObject);
    procedure rbSinusClick(Sender: TObject);
    procedure rbKolocolClick(Sender: TObject);
    procedure rbHilbertClick(Sender: TObject);
    procedure rbExportClick(Sender: TObject);
    procedure rbDiffClick(Sender: TObject);
    procedure rbLPFClick(Sender: TObject);
    procedure rbTreugClick(Sender: TObject);
    procedure rbPryamougClick(Sender: TObject);
    procedure rbImportClick(Sender: TObject);
    procedure mOpenFRKClick(Sender: TObject);
    procedure mSaveFRKClick(Sender: TObject);
    procedure mClearFRKClick(Sender: TObject);
    procedure butDelSelectedClick(Sender: TObject);
    procedure mQuitClick(Sender: TObject);
    procedure SignListBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure DlinPreobrChange(Sender: TObject);
    procedure eTreugWidthKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure ButVychClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure eExportFnameKeyPress(Sender: TObject; var Key: Char);
  private
    first_activate : boolean;  
    { Private declarations }
    procedure on_enter_key(Key : char);
  public
    { Public declarations }
  end;

var
  MainForm  : TMainForm;

implementation

uses USdvig, about;

{$R *.dfm}

function get_n_checked(clb : TCheckListBox) : integer;
var
  i : integer;
begin
  Result := 0;

  for i := 0 to clb.Items.Capacity-1 do
  begin
    if clb.State[i]=cbChecked then
      inc(Result);
  end;
end;

//------------------------------------------------------------------------------
// Обновить доступность кнопок и пунктов меню

procedure TMainForm.update_buttons_en;
begin
  if ar.is_empty then
  begin
    mSaveFRK.Enabled  := false;
    mExport.Enabled   := false;
    sbSaveFRK.Enabled := false;
    sbExport.Enabled  := false;
    btDelCurr.Enabled := false;
  end
  else
  begin
    mSaveFRK.Enabled  := true;
    mExport.Enabled   := true;
    sbSaveFRK.Enabled := true;
    sbExport.Enabled  := true;

    btDelCurr.Enabled := true;
  end;

  if SignListBox.Items.Capacity > 1 then
  begin
    btnToLeft.Enabled       := true;
    btnToRight.Enabled      := true;
  end
  else
  begin
    btnToLeft.Enabled       := false;
    btnToRight.Enabled      := false;
  end;

  if get_n_checked( SignListBox ) > 0 then
  begin
    ButBPF.Enabled          := true;
    ButOBPF.Enabled         := true;
    ButSdvig.Enabled        := true;
    ButZerk.Enabled         := true;
    ButSin.Enabled          := true;
    ButCos.Enabled          := true;
    rbExport.Enabled        := true;
    butDelSelected.Enabled  := true;

    if get_n_checked( SignListBox ) > 1 then
    begin
      ButUmnozh.Enabled     := true;
      ButSlozh.Enabled      := true;
      ButVych.Enabled       := True;
      ButSwertka.Enabled    := true;
      ButKorrelazia.Enabled := true;
    end
    else
    begin
      ButUmnozh.Enabled     := false;
      ButSlozh.Enabled      := false;
      ButVych.Enabled       := False;
      ButSwertka.Enabled    := false;
      ButKorrelazia.Enabled := false;
    end
  end
  else
  begin
    ButBPF.Enabled          := false;
    ButOBPF.Enabled         := false;
    ButSdvig.Enabled        := false;
    ButZerk.Enabled         := false;
    ButSin.Enabled          := false;
    ButCos.Enabled          := false;
    rbExport.Enabled        := false;
    butDelSelected.Enabled  := false;

    ButUmnozh.Enabled       := false;
    ButSlozh.Enabled        := false;
    ButVych.Enabled         := False;
    ButSwertka.Enabled      := false;
    ButKorrelazia.Enabled   := false;
  end
end;

//------------------------------------------------------------------------------
// Создать новый сигнал:
procedure TMainForm.NewsClick(Sender: TObject);
var
  size        : integer;
  s           : Signal;
  IOres       : integer;
  v1, v2, v3  : Extended;
  strg        : string;
begin
  size := StrToInt( DlinPreobr.Items[DlinPreobr.ItemIndex] );

  if rbSinus.Checked then
  begin
    // Синус:
    if not(TextToFloat(PChar(eSinusF.text), v1, fvExtended)) then
    begin
      ShowMessage('Неверное значение частоты. Должно быть в пределах от 0 до 0.5!');
      eSinusF.SetFocus;
      exit;
    end;

    if not(TextToFloat(PChar(eSinusAmpl.text), v2, fvExtended)) then
    begin
      ShowMessage('Неверное значение амлитуды. Должно быть число!');
      eSinusAmpl.SetFocus;
      exit;
    end;

    if not(TextToFloat(PChar(eSinusPhase.text), v3, fvExtended)) then
    begin
      ShowMessage('Неверное значение фазы. Должно быть число!');
      eSinusPhase.SetFocus;
      exit;
    end;

    s := Sinus.Create( size, v1, v2, v3, cbSimm.Checked);
  end;

  if rbKolocol.checked then
  begin
    // Колокол:
    if not(TextToFloat(PChar(eKolocolAmpl.text), v1, fvExtended)) then
    begin
      ShowMessage('Неверное значение амплитуды. Должно быть число!');
      eKolocolAmpl.SetFocus;
      exit;
    end;

    if not(TextToFloat(PChar(eKolocolSKO.text), v2, fvExtended)) then
    begin
      ShowMessage('Неверное значение СКО. Должно быть число!');
      eKolocolSKO.SetFocus;
      exit;
    end;

    if not(TextToFloat(PChar(eKolocolWidth.text), v3, fvExtended)) or
      (frac(v3) <> 0 )then
    begin
      ShowMessage('Неверное значение ширины. Должно быть целое число!');
      eKolocolWidth.SetFocus;
      exit;
    end;

    s := Kolocol.Create( size, v1, v2, round(v3), cbSimm.Checked);
  end;

  if rbPryamoug.Checked then
  begin
    // Прямоугольник:
    if not(TextToFloat(PChar(ePryamougAmpl.text), v1, fvExtended)) then
    begin
      ShowMessage('Неверное значение амплитуды. Должно быть число!');
      ePryamougAmpl.SetFocus;
      exit;
    end;

    if not(TextToFloat(PChar(ePryamougWidth.text), v2, fvExtended)) or
      (frac(v2) <> 0 )then
    begin
      ShowMessage('Неверное значение ширины. Должно быть целое число!');
      ePryamougWidth.SetFocus;
      exit;
    end;

    s := Priamougolnik.Create(size, v1, round(v2), cbSimm.Checked);
  end;

  if rbTreug.Checked then
  begin
    // Треугольник:
    if not(TextToFloat(PChar(eTreugAmpl.text), v1, fvExtended)) then
    begin
      ShowMessage('Неверное значение амплитуды. Должно быть число!');
      eTreugAmpl.SetFocus;
      exit;
    end;

    if not(TextToFloat(PChar(eTreugWidth.text), v2, fvExtended)) or
      (frac(v2) <> 0) then
    begin
      ShowMessage('Неверное значение ширины. Должно быть целое число!');
      eTreugWidth.SetFocus;
      exit;
    end;

    s := Treugolnik.Create( size, v1, round(v2), cbSimm.Checked );
  end;

  if rbLPF.Checked then
  begin
    // ФНЧ:
    if not(TextToFloat(PChar(eLPFcf.text), v1, fvExtended)) then
    begin
      ShowMessage('Неверное значение частоты среза. Должно быть число!');
      eLPFcf.SetFocus;
      exit;
    end;
    (*
    if not(TextToFloat(PChar(eLPFpn.text), v2, fvExtended)) then
    begin
      ShowMessage('Неверное значение наклона ФЧХ. Должно быть число!');
      eLPFcf.SetFocus;
      exit;
    end;
    *)
    if not(TextToFloat(PChar(eLengthLPF.text), v2, fvExtended)) or
      (frac(v2) <> 0) then
    begin
      ShowMessage('Неверное значение длины. Должно быть целое число!');
      eLengthLPF.SetFocus;
      exit;
    end;
    s := IXFNCH.Create( size, v1, round(v2), cbSimm.Checked);
  end;

  if rbDiff.Checked  or rbHilbert.Checked then
  begin
    if not(TextToFloat(PChar(eLengthPR.text), v2, fvExtended)) or
      (frac(v2) <> 0) then
    begin
      ShowMessage('Неверное значение длины. Должно быть целое число!');
      eLengthPR.SetFocus;
      exit;
    end;
    if rbDiff.Checked then
      s := IXDif.Create(size, round(v2), cbSimm.Checked);  // Диференциатор:
{    if rbIntegr.Checked then
      s := IXInt.Create(size, round(v2), cbSimm.Checked);  // Интегратор}
    if rbHilbert.Checked then
      s := IXGilb.Create(size, round(v2), cbSimm.Checked); // Преобразователь Гильберта:
  end;

  if rbImport.Checked then
  begin
    if eImportFname.Text = '' then
    begin
      ShowMessage('Укажите имя файла!');
      eImportFname.SetFocus;
      exit;
    end;

    AssignFile(Input, eImportFname.Text);
    {$I-}
    Reset(Input);
    IOres := IOresult;
    {$I+}
    if IOres <> 0 then
    begin
      ShowMessage('Файл не найден!');
      eImportFname.SelText;
      eImportFname.SetFocus;
      exit;
    end;

    s := SignalFromFile.Create(eImportFname.Text);
    CloseFile(Input);
  end;

  if rbExport.Checked then
  begin
    if eImportFname.Text = '' then
    begin
      ShowMessage('Укажите имя файла!');
      eImportFname.SetFocus;
      exit;
    end;

    AssignFile(Output, eExportFname.Text);
    {$I-}
    Rewrite(Output);
    IOres := IOresult;
    {$I+}
    if IOres <> 0 then
    begin
      ShowMessage('Файл не найден!');
      eExportFname.SelText;
      eExportFname.SetFocus;
      exit;
    end;
    s := ar.get;
      if s <> NIL then
    s.ExportToTExtFile();
    CloseFile(Output);
  end;

  Ar.add(s);
  update_buttons_en;  // Обновить доступность кнопок и пунктов меню
end;
//------------------------------------------------------------------------------
procedure TMainForm.FormCreate(Sender: TObject);
begin
  Ar := SignalsArray.Create;
  self.Left := 0;
  self.Top  := 0;

  DlinPreobr.ItemIndex := 5;

  SinusPar.BringToFront;
 (* eSinusF.Text        := FloatToStr(0.125);
  eSinusAmpl.Text     := '1';
  eSinusPhase.Text    := '0';

  eKolocolSKO.Text    := '7';
  eKolocolAmpl.Text   := '1';
  eKolocolWidth.Text  := '51';

  ePryamougWidth.Text := '20';
  ePryamougAmpl.Text  := '1';

  eTreugWidth.Text    := '51';
  eTreugAmpl.Text     := '1';

  eLPFcf.Text         := FloatToStr(0.25);
  eLPFpn.Text         := '0';
  eLengthLPF.Text     := '128';

  eLengthPR.Text      := '51';   *)

  first_activate := true;
end;
//------------------------------------------------------------------------------
procedure TMainForm.btnToLeftClick(Sender: TObject);
begin
  if Ar.is_empty then exit;  // Если Ar пуст
  // Иначе:
  SignListBox.ItemIndex := Ar.prev;
  Grafik.Draw(Ar.get);
end;
//------------------------------------------------------------------------------
procedure TMainForm.btnToRightClick(Sender: TObject);
begin
  if Ar.is_empty then exit;
  SignListBox.ItemIndex:=Ar.next;
  Grafik.Draw(Ar.get);
end;
//------------------------------------------------------------------------------
procedure TMainForm.SignListBoxClick(Sender: TObject);
begin
  if SignListBox.ItemIndex = -1 then exit;
  if ar.curr <> SignListBox.ItemIndex then
  begin
    Ar.set_curr(SignListBox.ItemIndex);
    Grafik.draw(Ar.get);
  end;
  update_buttons_en;
end;
//------------------------------------------------------------------------------

procedure TMainForm.btnDeleteClick(Sender: TObject);
begin
  if Ar.is_empty then exit;
  SignListBox.Items.Delete(ar.curr);
  Ar.delete;

  if ar.curr >= 0 then
  begin
    SignListBox.ItemIndex:=ar.curr;
    Grafik.Draw(ar.get)
  end;

  update_buttons_en;
end;
//------------------------------------------------------------------------------
procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  res : integer;
begin
  if Ar.is_changed then
  begin
    res := Application.MessageBox
      ( 'Измененное рабочее пространство не сохранено! Сохранить?'
      , 'Внимание!'
      , integer(MB_YESNOCANCEL));

    case res of
    6:  // Да - сохраняем
    begin
      mSaveFRKClick(Nil);
    end;
    7:  // Нет - не сохраняем
      ;
    2:  // Отмена - продолжить работу
    begin
      Action := caNone;
      exit;
    end;
    end
  end;

  Ar.Destroy;
end;
//------------------------------------------------------------------------------
procedure TMainForm.ButBPFClick(Sender: TObject);
var
  i : integer;
begin
  if ar.is_empty then exit;

  for i := 0 to SignListBox.Items.Capacity-1 do
    if SignListBox.State[i]=cbChecked then
      ar.add( FFT.Create(ar.get(i)) );
end;
//------------------------------------------------------------------------------
procedure TMainForm.ButOBPFClick(Sender: TObject);
var
  I,j : integer;
begin
  if ar.is_empty then exit;
  j:=SignListBox.Items.Capacity-1;
  for i := 0 to SignListBox.Items.Capacity-1 do
    if SignListBox.State[i]=cbChecked then
      begin
      ar.add( OBPF.Create(ar.get(i)) );
      ar.add( KomplRe.Create(ar.get(j+1)) );
      ar.add( KomplIm.Create(ar.get(j+1)) );
      end;

end;
//------------------------------------------------------------------------------
procedure TMainForm.ButUmnozhClick(Sender: TObject);
var
  i,j       : integer;
  s,sold    : signal;
begin
  if ar.is_empty then exit;
  i:=0;
  while i < SignListBox.Items.Capacity-1 do
  begin
    if SignListBox.State[i]=cbChecked then
    begin
      j:=i;
      s:=ar.get(j);
      inc(i);
      while i <= SignListBox.Items.Capacity-1 do
      begin
        if SignListBox.State[i]=cbChecked then
        begin
          sold := ar.get(i);
          ar.add( Umnozhenie.Create(s, sold) );
          j := SignListBox.ItemIndex;
          s := ar.get(j);
        end;
        inc(i);
      end;
    end;
    inc(i);
  end;
end;
//------------------------------------------------------------------------------
procedure TMainForm.ButSwertkaClick(Sender: TObject);
var
  i,j       : integer;
  s         : signal;
begin
  if ar.is_empty then exit;
  i:=0;
  while i < SignListBox.Items.Capacity-1 do
  begin
    if SignListBox.State[i]=cbChecked then
    begin
      j:=i;
      s:=ar.get(j);
      inc(i);
      while i <= SignListBox.Items.Capacity-1 do
      begin
        if SignListBox.State[i]=cbChecked then
        begin
          ar.add(Swertka.Create(s, ar.get(i)));
          Grafik.draw(Ar.get);
          j:=SignListBox.ItemIndex;
          s:=ar.get(j);
        end;
        inc(i);
      end;
    end;
    inc(i);
  end;
end;
//------------------------------------------------------------------------------
procedure TMainForm.ButKorrelaziaClick(Sender: TObject);
var
  i,j       : integer;
  s         : signal;
begin
   if ar.is_empty then exit;
  i:=0;
  while i < SignListBox.Items.Capacity-1 do
  begin
    if SignListBox.State[i]=cbChecked then
    begin
      j:=i;
      s:=ar.get(j);
      inc(i);
      while i <= SignListBox.Items.Capacity-1 do
      begin
        if SignListBox.State[i]=cbChecked then
        begin
          ar.add(Korelazia.Create(s,ar.get(i)));
          Grafik.draw(Ar.get);
          j:=SignListBox.ItemIndex;
          s:=ar.get(j);
        end;
        inc(i);
      end;
    end;
    inc(i);
  end;
end;
//------------------------------------------------------------------------------
procedure TMainForm.ButSlozhClick(Sender: TObject);
var
  i,j       : integer;
  s,sold,ss : signal;
begin
  i:=0;
  while i < SignListBox.Items.Capacity-1 do
  begin
    if SignListBox.State[i]=cbChecked then
    begin
      j:=i;
      s:=ar.get(j);
      inc(i);
      while i <= SignListBox.Items.Capacity-1 do
      begin
        if SignListBox.State[i]=cbChecked then
        begin
          sold:=ar.get(i);
          ss:=Slozhenie.Create(s,sold);
          ar.add(ss);
          Grafik.draw(Ar.get);
          j:=SignListBox.ItemIndex;
          s:=ar.get(j);
        end;
        inc(i);
      end;
    end;
    inc(i);
  end;
end;
//------------------------------------------------------------------------------
procedure TMainForm.ButZerkClick(Sender: TObject);
var I : integer;
begin
  if ar.is_empty then exit;
  for i := 0 to SignListBox.Items.Capacity-1 do
    if SignListBox.State[i]=cbChecked then
      ar.add( Zerkalo.Create(ar.get(i)) );
end;
//------------------------------------------------------------------------------
procedure TMainForm.ButSinClick(Sender: TObject);
var
  i : integer;
begin
  if ar.is_empty then exit;

  for i := 0 to SignListBox.Items.Capacity-1 do
    if SignListBox.State[i]=cbChecked then
      ar.add( Sin_s.Create(ar.get(i)) );

end;
//------------------------------------------------------------------------------
procedure TMainForm.ButSdvigClick(Sender: TObject);
var
  I, cod      : integer;
  s           : signal;
  sdv_val     : extended;
  before_cap  : integer;
label
  l1;
begin
  if ar.is_empty then exit;
  i           := 0;
  before_cap  := SignListBox.Items.Capacity;

l1:
  SdvigForm.Position := poDesktopCenter;
  if SdvigForm.ShowModal = mrOK
  then
  begin
    if not(
      TextToFloat(  PChar(SdvigForm.SdvigSign.text)
                ,   sdv_val
                ,   fvExtended))
    then
    begin
      ShowMessage('Неверный формат числа!');
      goto l1;
    end;
//    if frac(2*sdv_val) <> 0 then
    if frac(sdv_val) <> 0 then
    begin
//      ShowMessage('Параметр сдвига должен быть кратен 0.5!');
      ShowMessage('Параметр сдвига должен быть целым числом!');
      goto l1;
    end;
  end
  else
    exit;  // (нажата "Отмена")

  While (i <= before_cap - 1)do
  begin
    if SignListBox.State[i]=cbChecked then
      ar.add( Sdvig.Create(ar.get(i), sdv_val) );
    inc(i);
  end;     
  
end;
//------------------------------------------------------------------------------
// команды всплывающего меню
procedure TMainForm.DelClick(Sender: TObject);
begin
  if Ar.is_empty then exit;
  SignListBox.Items.Delete(ar.curr);
  Ar.delete;
  if ar.curr >= 0 then
    Begin
      SignListBox.ItemIndex:=ar.curr;
      Grafik.Draw(ar.get)
    End
  else
    if ar.is_empty then grafik.Visible := false
end;
//------------------------------------------------------------------------------
procedure TMainForm.DelALLClick(Sender: TObject);
Var Poss , i :longint;

begin
  if ar.is_empty then exit;
//  Poss:=ar.curr;
  i:=0;
  while i <= SignListBox.Items.Capacity-1 do
    begin
      if SignListBox.State[i]=cbChecked then
         Begin
 //          if (i<=Poss)and (i>0) then Dec(poss);
           ar.set_curr(i);
           SignListBox.Items.Delete(ar.curr);
           Ar.delete;
         End
                else
                  inc(i);
    End;
  ar.set_curr(0);
  if ar.curr >= 0 then
    Begin
      SignListBox.ItemIndex:=ar.curr;
      Grafik.Draw(ar.get)
    End
  else
    if ar.is_empty then grafik.Visible := false
end;
//------------------------------------------------------------------------------

procedure TMainForm.AboutClick(Sender: TObject);
begin
  Abutform.Position := poDesktopCenter;
  Abutform.ShowModal
end;
//------------------------------------------------------------------------------
procedure TMainForm.mImportClick(Sender: TObject);
begin
  with OpenDialog1 do
  begin
    Title   := 'Импорт сигнала из текстового файла';
    Filter  := 'Файлы сигналов (*.txt)|*.txt';

    if Execute then
    begin
      AssignFile(Input, FileName);
      Reset(Input);

      Ar.add(SignalFromFile.Create(FileName));
      
      CloseFile(Input);
    end
  end;
  update_buttons_en;
end;
//------------------------------------------------------------------------------
procedure TMainForm.mExportClick(Sender: TObject);
var
  i : integer;
begin
  if ar.is_empty then exit;

  for i := 0 to SignListBox.Items.Capacity-1 do
    if SignListBox.State[i]=cbChecked then
      ar.add( Cos_s.Create(ar.get(i)) );
end;
//------------------------------------------------------------------------------
procedure TMainForm.rbSinusClick(Sender: TObject);
begin
  SinusPar.BringToFront;
  DlinPreobr.Enabled := True;
end;
//------------------------------------------------------------------------------
procedure TMainForm.rbKolocolClick(Sender: TObject);
begin
  KolocolPar.BringToFront;
  DlinPreobr.Enabled := True;
end;
//------------------------------------------------------------------------------
procedure TMainForm.rbHilbertClick(Sender: TObject);
begin
  EmptyPar.BringToFront;
  DlinPreobr.Enabled := True;
end;
//------------------------------------------------------------------------------
procedure TMainForm.rbExportClick(Sender: TObject);
begin
  ExportPar.BringToFront;
  DlinPreobr.Enabled := False;
end;
//------------------------------------------------------------------------------
procedure TMainForm.rbDiffClick(Sender: TObject);
begin
  EmptyPar.BringToFront;
  DlinPreobr.Enabled := True;
end;
//------------------------------------------------------------------------------
procedure TMainForm.rbLPFClick(Sender: TObject);
begin
  LPFPar.BringToFront;
  DlinPreobr.Enabled := True;
end;
//------------------------------------------------------------------------------
procedure TMainForm.rbTreugClick(Sender: TObject);
begin
  TreugPar.BringToFront;
  DlinPreobr.Enabled := True;
end;
//------------------------------------------------------------------------------
procedure TMainForm.rbPryamougClick(Sender: TObject);
begin
  PryamougPar.BringToFront;
  DlinPreobr.Enabled := True;
end;
//------------------------------------------------------------------------------
procedure TMainForm.rbImportClick(Sender: TObject);
begin
  ImportPar.BringToFront;
  DlinPreobr.Enabled := False;
end;
//------------------------------------------------------------------------------
procedure TMainForm.mOpenFRKClick(Sender: TObject);
begin
  // Загрузить рабочее пространство ФАИС
  with OpenDialog1 do
  begin
    Title   := 'Загрузка рабочего пространства';
    Filter  := 'Файлы рабочего пространства (*.frk)|*.frk';

    if Execute then
      ar.load(FileName);
  end;
  Grafik.draw(ar.get);
  update_buttons_en;
end;
//------------------------------------------------------------------------------
procedure TMainForm.mSaveFRKClick(Sender: TObject);
var
 { IOres   : integer;    }
  s       : Signal;
begin
  // Сохранить все сигналы рабочего пространства
  with SaveDialog1 do
  begin
    Title   := 'Сохранение рабочего пространства';
    Filter  := 'Файлы рабочего пространства (*.frk)|*.frk';
    DefaultExt := 'frk';

    if Execute then
      ar.save(FileName);
  end;
end;
//------------------------------------------------------------------------------
procedure TMainForm.mClearFRKClick(Sender: TObject);
begin
  // Очистить множество сигналов
  ar.Destroy;
  Ar := SignalsArray.Create;

  SignListBox.Items.Clear;
  grafik.to_off;
  update_buttons_en;
end;
//------------------------------------------------------------------------------
procedure TMainForm.butDelSelectedClick(Sender: TObject);
var
  i : integer;
begin
  i := 0;
  // Удалить отмеченные сигналы
  repeat
    if SignListBox.State[i]=cbChecked then
    begin
      ar.delete(i);
      SignListBox.Items.Delete(i);
      if not(ar.is_empty) then
      begin
        SignListBox.ItemIndex := ar.curr;
        Grafik.Draw(ar.get);
      end
    end
    else
      inc(i);
  until i = SignListBox.Items.Capacity;
  update_buttons_en;
end;
//------------------------------------------------------------------------------
procedure TMainForm.mQuitClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TMainForm.SignListBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case integer(key) of
  vk_Delete:
    btnDeleteClick(Sender);
  end;
end;
//------------------------------------------------------------------------------
procedure TMainForm.Button2Click(Sender: TObject);
begin
  with OpenDialog1 do
  begin
    Title   := 'Импорт сигнала из текстового файла';
    Filter  := 'Файлы сигналов (*.txt)|*.txt';

    if Execute then
      eImportFname.Text := FileName;
  end;
end;
//------------------------------------------------------------------------------
procedure TMainForm.Contents1Click(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTENTS, 0);
end;

procedure TMainForm.DlinPreobrChange(Sender: TObject);
begin
  Grafik.Chart1.Bottomaxis.Maximum :=
    StrToInt( MainForm.DlinPreobr.Items[MainForm.DlinPreobr.ItemIndex] );
  Grafik.Chart2.Bottomaxis.Maximum := Grafik.Chart1.Bottomaxis.Maximum;
end;

procedure TMainForm.on_enter_key(Key : char);
begin
  if Key = char(13) then
    NewsClick(Nil);
end;

procedure TMainForm.eTreugWidthKeyPress(Sender: TObject; var Key: Char);
begin
  on_enter_key(Key);
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  if first_activate then
  begin
    Abutform.Position := poMainFormCenter;
    Abutform.ShowModal;
    first_activate := false;
  end;
end;

procedure TMainForm.ButVychClick(Sender: TObject);
var  i,j       : integer;
  s,sold,ss : signal;
begin
  i:=0;
  while i < SignListBox.Items.Capacity-1 do
  begin
    if SignListBox.State[i]=cbChecked then
    begin
      j:=i;
      s:=ar.get(j);
      inc(i);
      while i <= SignListBox.Items.Capacity-1 do
      begin
        if SignListBox.State[i]=cbChecked then
        begin
          sold:=ar.get(i);
          ss:=Vychitanie.Create(s,sold);
          ar.add(ss);
          Grafik.draw(Ar.get);
          j:=SignListBox.ItemIndex;
          s:=ar.get(j);
        end;
        inc(i);
      end;
    end;
    inc(i);
  end;
end;

procedure TMainForm.Button1Click(Sender: TObject);
var
  s     : Signal;
  IOres : integer;
begin
  with SaveDialog1 do
  begin
    Title       := 'Экспорт сигнала в текстовый файл';
    DefaultExt  := 'txt';

    if Execute then
    begin
      AssignFile(Output, FileName);
      Rewrite(Output);

      s := ar.get;
      if s <> NIL then
        s.ExportToTExtFile();
      CloseFile(Output);
      eExportFname.Text := FileName;
    end;
  end;
end;

procedure TMainForm.eExportFnameKeyPress(Sender: TObject; var Key: Char);
begin
  on_enter_key(Key);
end;

end.

