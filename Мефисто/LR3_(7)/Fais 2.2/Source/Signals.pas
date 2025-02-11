/////////////////////////////////////////////////////////////////////////
// ������������� ������������� ����������� �����
// � ��������
/////////////////////////////////////////////////////////////////////////

// ����������. Class � Object - ���� �������� ������� (������������ � �.�.)
// ���������� ���������� - ��������.

unit Signals;

interface

uses
  SysUtils, Classes, Dialogs, Math, Forms;

const
  IM_ACCUR = 1e-6;  // �������� �������������

type
  //----------------------------------------------------------------------------
  TComplex = class
  public
    constructor Create(in_re : Extended = 0; in_im : Extended = 0); overload;
    constructor Create(src : TComplex); overload; // ����������� �����
    procedure copy(src : TComplex); // "�" := src
    procedure save(stream : TFileStream);
    procedure load(stream : TFileStream);
    procedure invert_a;
  private
    in_re : Extended;   // ������ �����
    in_im : Extended;   // �������� �����

    in_m  : Extended;   // ������
    in_a  : Extended;   // ��������

    function get_re : Extended;
    function get_im : Extended;
    function get_m  : Extended;
    function get_a  : Extended;
    procedure set_re(in_re : Extended);
    procedure set_im(in_im : Extended);
    procedure update_ma;
  published
    property re   : Extended read get_re write set_re;
    property im   : Extended read get_im write set_im;
    property m    : Extended read get_m;
    property a    : Extended read get_a;
  end;

  //----------------------------------------------------------------------------
  // ����������� ������. �����
  TScale = (scMachine, scMath); // �������� ��� �������������� ����� ��� �������
  // ��������         : �� 0 �� N-1
  // ��������������   : �� -N/2 �� N/2-1

  Signal = class
  public
    data        : array of TComplex; // ������� � �������� �����!
    re_im_plot  : boolean;      // false - ������ � ��������
    scale       : TScale;       // ����� ����������� �� �������

    constructor Create(stream : TFileStream); overload; // ������� �� ������
    constructor Create(src : Signal); overload;         // ������������ �����
    procedure save(stream : TFileStream);               // ��������� � �����
    procedure ExportToTextFile; // ��������� ���� � ��������� ���� Output
                                // (���� �������� - ���� ������)
    procedure change_razm(new_razm : longint); // �������� ���������� ��������
    procedure AxisMaxs(var Max1, Max2 : Extended);
    procedure AxisMins(var Min1, Min2 : Extended);
    function  get_plot_data1(i : integer) : Extended;
    function  get_plot_data2(i : integer) : Extended;
  protected
    constructor Create(rzm : longint; A : Extended; nme : string); overload;
    destructor  Destroy; virtual;
  private
    A         : Extended ;      // ��������� (��������, �������)
    in_razm   : longint;        // ���������� ��������
    in_name   : String;         // ��� �����������

    function get_razm : longint;
    function get_name : string;
  published
    property razm : longint read get_razm;
    property name : string read get_name;
  end;

  //----------------------------------------------------------------------------
  SignalFromFile = class(Signal)
  public
    constructor Create(name : string);
  end;

  //----------------------------------------------------------------------------
  // �����
  Sinus = class(Signal)
  public
    constructor Create( size  : longint;
                        freq  : Extended;
                        am    : Extended;
                        phase : Extended;
                        simm  : boolean                        
                      );
  private
    f   : Extended;
    ph  : Extended;
  end;

  //----------------------------------------------------------------------------
  // �������
  Kolocol = class(Signal)
    sk : Extended; // �������������������� ����������
    constructor Create( size  : longint;
                        am    : Extended;
                        sko   : Extended; // �������������������� ����������
                        wdth  : longint;  // ������ �������
                        simm  : boolean   // ���� �������������� ���-�� ���� X
                      );
  end;

  //----------------------------------------------------------------------------
  // �������������
  Priamougolnik = class(Signal)
    breite : Extended; // ������ �������� �������
    constructor Create( size  : longint;
                        am    : Extended;
                        br    : Longint;  // ������ �������� �������
                        simm  : boolean   // ���� �������������� ���-�� ���� X
                      );
  end;

  //----------------------------------------------------------------------------
  // �����������
  Treugolnik = class(Signal)
    constructor Create( size  : longint;
                        am    : Extended;
                        br    : Longint; // ������ �������� �������
                        simm  : boolean  // ���� �������������� ���-�� ���� X
                      );
  private
    breite : longint; // ������ �������� �������
  end;

  //----------------------------------------------------------------------------
  // �� ��������������� �������
  IXFNCH = class(Signal)
    constructor Create( size    : longint;
                        br      : Extended;
                        length  : longint; // ����� ��
                        simm    : boolean  // ���� �������������� ���-�� ���� X
                      );
  end;

  //----------------------------------------------------------------------------
  // �� ��������������
  IXDif = class(Signal)
    constructor Create( size  : longint;
                        l     : longint;
                        simm  : boolean  // ���� �������������� ���-�� ���� X
                        );
  end;

  //----------------------------------------------------------------------------
  // �� �����������
  IXInt= class(Signal)
    constructor Create( size  : longint;
                        l     : longint;
                        simm  : boolean  // ���� �������������� ���-�� ���� X
                      );
  end;

  //----------------------------------------------------------------------------
  // �� �������������� ���������
  IXGilb = class(Signal)
    constructor Create( size  : longint;
                        l     : longint;
                        simm  : boolean  // ���� �������������� ���-�� ���� X
                        );
  end;

  //----------------------------------------------------------------------------
  // ���
  FFT = class(Signal)
    constructor Create( s : signal);
  end;

  //----------------------------------------------------------------------------
  // ����
  OBPF = class(Signal)
    constructor Create( s : signal);
  end;

  //----------------------------------------------------------------------------
  // �����
  Sdvig = class(Signal)
    constructor Create( s : signal; sd_ : extended);
  end;

  //----------------------------------------------------------------------------
  // �������
  Zerkalo = class(Signal)
    constructor Create( s : signal);
  end;

  //----------------------------------------------------------------------------
  // ���������� ����������� ������
  Komplsopr = class(Signal)
    constructor Create( s : signal);
  end;

  //----------------------------------------------------------------------------
    // ��������� �������������� ����� ������������ �����
  KomplRe = class(Signal)
    constructor Create( s : signal);
  end;

  //----------------------------------------------------------------------------
      // ��������� ������ ����� ������������ �����
  KomplIm = class(Signal)
    constructor Create( s : signal);
  end;

  //----------------------------------------------------------------------------

  ReImToModArg = class(Signal)
    constructor Create( s : signal);
  end;

    //----------------------------------------------------------------------------
  // Sin
  Sin_s = class(Signal)
    constructor Create( s : signal);
  end;

    //----------------------------------------------------------------------------
  // cos
  Cos_s = class(Signal)
    constructor Create( s : signal);
  end;

  
  //----------------------------------------------------------------------------
  // ������� ����� ��� ��������, ����������� �� ������ �������� � �������
  // �������� ������� � �.�.
  Composite = class (Signal)
  protected
    constructor Create(s1, s2 : Signal; nme : string);
  end;

  //----------------------------------------------------------------------------
  // ���������
  Umnozhenie = class(Composite)
    constructor Create( s1, s2 : Signal);
  end;

  //----------------------------------------------------------------------------
  // ��������
  Slozhenie = class(Composite)
    constructor Create( s1, s2 : Signal);
  end;

  //----------------------------------------------------------------------------
  // ���������
  Vychitanie = class(Composite)
    constructor Create( s1, s2 : Signal);
  end;

  //----------------------------------------------------------------------------
  // �������
  Swertka = class(Composite)
    constructor Create( s1, s2 : Signal);
  end;

  //----------------------------------------------------------------------------
  // ����������
  Korelazia = class(Composite)
    constructor Create( s1, s2 : Signal);
  end;

  //----------------------------------------------------------------------------
  // ��������� �������� (�����!)
  SignalsArray = class
  public
    constructor Create; // ������� ������ ������
    destructor  Destroy;

    procedure add(new_signal : Signal);     // �������� ����� ������
    procedure delete; overload;                       // ������� ������� ������������
    procedure delete(n : integer); overload;          // ������� ����. ����� n
    function is_empty : boolean;
    function next : integer;                // ����������� (�� �����) pos
    function prev : integer;                // -//-
    function curr : integer;                // ������� pos
    procedure set_curr(new_poz : integer);  // �����������
    function is_changed : boolean;

    function get : Signal; overload;        // ������� ������ �� pos
    function get(pos_ : longint) : Signal; overload;

    procedure save(fname : string);   // ��������� � ���� ��� �������
    function load (fname : string) : boolean; // ��������� �� �����
  private
    // ����� ���� ������, ���� ���� ������ (����� ����� ������� �������)
    data    : array of Signal;  // ������ ���������� �� ������� ����� ��������
    razm    : LongInt;          // ������ ������� ��������
    pos     : longint;          // ������ �������� (������������� �������)
    changed : boolean;          // ������� ������������� ���������
  end;

var
  Ar  : SignalsArray;

implementation

uses Main, UGrafik;

//------------------------------------------------------------------------------

constructor TComplex.Create(in_re, in_im : Extended);
begin
  self.in_re := in_re;
  self.in_im := in_im;
  update_ma;
end;

// ����������� �����
constructor TComplex.Create(src : TComplex);
begin
  in_re  := src.in_re;
  in_im  := src.in_im;
  in_m   := src.in_m;
  in_a   := src.in_a;
end;

procedure TComplex.copy(src : TComplex); // "�" := src
begin
  re := src.re;
  im := src.im;
end;

procedure TComplex.save(stream : TFileStream); // "�" := src
begin
  stream.WriteBuffer(in_re, sizeof(in_re));
  stream.WriteBuffer(in_im, sizeof(in_im));
end;

procedure TComplex.load(stream : TFileStream); // "�" := src
begin
  stream.ReadBuffer(in_re, sizeof(in_re));
  stream.ReadBuffer(in_im, sizeof(in_im));
end;

function TComplex.get_re : Extended;
begin
  Result := self.in_re;
end;

function TComplex.get_im : Extended;
begin
  Result := self.in_im
end;

function TComplex.get_m : Extended;
begin
  Result := in_m;
end;

function TComplex.get_a : Extended;
begin
  Result := in_a;
end;

procedure TComplex.set_re(in_re : Extended);
begin
  self.in_re := in_re;
  update_ma;
end;

procedure TComplex.set_im(in_im : Extended);
begin
  self.in_im := in_im;
  update_ma;
end;
//------------------------------------------------------------------------------
// ������ ������ � ��������� �� ������ � �������� ������
function sign(x : Extended):Longint;
begin
  if x = 0 then
    Result := 0
  else
  if x < 0 then
    Result := -1
  else
  if x > 0 then
    Result := 1;
end;

procedure TComplex.update_ma;
begin
  in_m := sqrt(sqr(in_re)+sqr(in_im));

  if abs(in_re) > IM_ACCUR then
    if abs(in_im) > IM_ACCUR then
      in_a := -sign(in_im)*((pi/2 - arctan(abs(in_im/in_re)))*sign(in_re) - pi/2 )
    else
    if in_re > 0 then
      in_a := 0
    else
      in_a := pi  /// !!!
  else
    if abs(in_im) > IM_ACCUR then
      if in_im > 0 then
        in_a := pi/2            ///     ����� ����� �� ����
      else
        in_a := -pi/2            ///     ����� ����� �� ����
    else
      in_a := 0

(*
  if abs(in_re) > IM_ACCUR then
    in_a := arctan(in_im/in_re)
  else
    if abs(in_im) > IM_ACCUR then
      if in_im > 0 then
        in_a := pi/2
      else
        in_a := -pi/2
    else
      in_a := 0;
*)
end;

procedure TComplex.invert_a;
begin
  in_a := -in_a;
end;

//------------------------------------------------------------------------------
// protected
constructor Signal.Create(rzm : longint; A : Extended; nme : String);
var
  i : integer;
begin
  in_razm     := rzm;
  self.A      := A;
  in_name     := nme;
  re_im_plot  := true;
  scale       := scMachine;

  SetLength(data, razm);
  for i := 0 to razm - 1 do
    data[i] := TComplex.Create;
end;

//------------------------------------------------------------------------------
constructor Composite.Create(s1, s2 : Signal; nme : string);
begin
  // ����������� ������� �������� ��������:
  if s1.razm <> s2.razm then
    if s1.razm < s2.razm
    then
      s1.change_razm(s2.razm)
    else
      s2.change_razm(s1.razm);

  inherited Create(s1.razm, -1, nme);
end;
//------------------------------------------------------------------------------
// ������� ���� �� ������. 
constructor Signal.Create(stream : TFileStream);
var
  l, i, j : longint;
  ch      : char;
begin
  with stream do
  begin
    Read(l, sizeof(i));
    SetLength(in_name, l);
    for i := 1 to l do
    begin
      Read(ch, 1);
      in_name[i] := ch;
    end;
    Read(A, sizeof(A));
    Read(re_im_plot, sizeof(re_im_plot));
    Read(scale, sizeof(scale));

    Read(in_razm, sizeof(in_razm));
    SetLength(data, in_razm);
    for j := 0 to razm - 1 do
    begin
      data[j] := TComplex.Create;
      data[j].load(stream);
    end
  end;
end;
//------------------------------------------------------------------------------
// ����������� �����
constructor Signal.Create(src : Signal);
var
  i : longint;
begin
  A          := src.A;
  in_name    := src.in_name;
  in_razm    := src.in_razm;
  re_im_plot := src.re_im_plot;
  scale      := src.scale;
  SetLength(data, razm);
  for i := 0 to razm - 1 do
  begin
    data[i] := TComplex.Create(src.data[i]);
  end
end;
//------------------------------------------------------------------------------
// ��������� ���� � ��������� ����
procedure Signal.save(stream : TFileStream);
var
  i, j  : longint;
  l     : longint;
begin
  with stream do
  begin
    l := length(in_name);
    Write(l, sizeof(l));
    for i := 1 to l do
      Write(in_name[i], 1);

    Write(A, sizeof(A));
    Write(re_im_plot, sizeof(re_im_plot));
    Write(scale, sizeof(scale));

    Write(in_razm, sizeof(in_razm));
    for j := 0 to razm - 1 do
      data[j].save(stream);
  end;
end;

destructor  Signal.Destroy;
begin
  SetLength(data, 0);
end;

procedure Signal.ExportToTextFile;
var
  i : integer;
  s : String;
begin
  // ������� ���� � ������ fname � ��������� � ���� ���� ������
  // (� ���������������, ���� ����� ���� ��� ����)

  for i:=0 to self.razm - 1 do
    writeln(FloatToStr(data[i].re));
end;

function Signal.get_plot_data1(i : integer) : Extended;
begin
  if re_im_plot then
    Result := data[i].re
  else
    Result := data[i].in_m;

  if abs(Result) < IM_ACCUR then
    Result := 0;
end;
//------------------------------------------------------------------------------
function Signal.get_plot_data2(i : integer) : Extended;
begin
  if re_im_plot then
    Result := data[i].in_im
  else
    Result := data[i].in_a;

  if abs(Result) < IM_ACCUR then
    Result := 0;
end;
//------------------------------------------------------------------------------
// ���� ���������� �������� �� ����� 2^N, �� ��������
// ������ �� ��������� ������� 2
constructor SignalFromFile.Create(name : string);
var
  s       : String;
  i, code : longint;
  size    : longint;
  size2   : longint;
  v       : Extended;
begin
  // 1. ���������� ���������� �����
  size := 0;
  while not(EOF(Input)) do
  begin
    readln(Input, s);
    inc(size);
  end;

  if frac(log2(size)) <> 0 then
    size2 := round(power(2, int(log2(size)) + 1))
  else
    size2 := size;

  inherited Create(size2, -1, '������� (' + name + ')');

  Reset(Input);
  i := 0;
  while not(EOF(Input)) do
  begin
    readln(Input, s);
    if TextToFloat(PChar(s), v, fvExtended) then
    begin
      data[i] := TComplex.Create(v, 0);
      inc(i);
    end
    else
      exit;
  end;
end;
//------------------------------------------------------------------------------
constructor Sinus.Create( size  : longint;
                          freq  : Extended;
                          am    : Extended;
                          phase : Extended;
                          simm  : boolean
                        );
var
  i   : integer;
begin
  inherited Create(size, am, '���(' + FormatFloat('.####', freq)+')');

  if simm then
  begin
    scale := scMath;
    phase := phase + 90;
  end;

  f   := freq;
  ph  := phase;

  for i:= 0 to razm - 1 do
    data[(i+razm) mod razm].re:= A * sin(2*pi*f*i + ph*pi/180);
end;
//------------------------------------------------------------------------------
constructor Kolocol.Create(size   : longint;
                           am     : Extended;
                           sko    : Extended;
                           wdth   : longint;
                           simm   : boolean
                      );
var
  i   : integer;
  ss  : Extended;
  h   : integer;
begin
  inherited Create(size, am, '���('+FormatFloat('#.##', sko)+')');
  sk  := sko;
  if wdth > size then wdth := size;

  if simm then
  begin
    if not odd(wdth) then
      dec(wdth);
    for i := -(wdth div 2) to (wdth div 2) do
    begin
      h := (i+razm) mod razm;
      ss:=i;
      ss:=i*ss/2/(sk*sk);
      if ss > 87 then
        data[h].re := 0
      else
        data[h].re := A * exp(-ss);
    end;
    scale := scMath;
  end
  else
    for i:= 0 to wdth - 1 do
    begin
      if odd(wdth) then
        data[i].re := A * exp(-sqr(i-(wdth div 2))/2/sqr(sk))
      else
        data[i].re := A * exp(-sqr(i-(wdth div 2)+0.5)/2/sqr(sk));
    end;
end;

constructor Priamougolnik.Create(size  : longint;
                                 am    : Extended;
                                 br    : Longint;
                                 simm  : boolean
                                  );
var i,pd,ps:integer;
  Breite:longint;
begin
  Breite := Br;
  if Breite > size then Breite := size;

  inherited Create(size, am, '�������('+FormatFloat('#.##',Breite)+')');

  if simm then
  begin
    if not odd(breite) then
      dec(breite);
    for i:=-(razm div 2)+1 to (razm div 2) do
    begin
      data[(i+razm) mod razm].im := 0;
      if abs(i)<=breite/2 then
        data[(i+razm) mod razm].re := A
      else
        data[(i+razm) mod razm].re := 0;
    end;
    scale := scMath
  end
  else
  begin
    for i := 0 to  Breite-1 do   // br - 1 do     ** Kostya ispravil
      data[i].re := A;
  end;
end;

constructor Treugolnik.Create(  size  : longint;
                                am    : Extended;
                                br    : Longint;
                                simm  : boolean
                             );
var
  i : integer;
  h : extended;
begin
  inherited Create(size, am, '�����('+FormatFloat('#.##', br)+')');
  Breite := Br;
  if breite > size then breite := size;

  if simm then
  begin
    if not odd(breite) then
      dec(breite);
    breite := breite - 2;
    for i:=-(razm div 2)+1 to (razm div 2) do
    begin
      data[(i+razm) mod razm].im:=0;
      if abs(i)<=breite/2 then
        data[(i+razm) mod razm].re:= A * (1-abs(i)*2/breite)
      else
        data[(i+razm) mod razm].re:=0;
    end;
    scale := scMath
  end
  else
  begin
    for i := 0 to breite - 1 do
      if (breite mod 2) <> 0 then
      begin
        if abs(i) <= breite div 2 then
          data[i].re:= A * (i*2/breite)
        else
          data[i].re:= A * (1 - (i-breite/2+1)*2/breite)
      end
      else
      begin
        h := 1/(breite div 2 - 1);
        if abs(i) <= breite div 2 - 1then
          data[i].re:= A * (i*h)
        else
          data[i].re:= A * (1 - (i-breite/2)*h)
      end;
  end;      
end;

constructor IXFNCH.Create(size    : longint;
                          br      : Extended;   // ������� �����
                          length  : longint;
                          simm    : boolean
                      );
var
  i             : longint;
  tmp           : longint;
  breite, v     : Extended;
  al            : extended; // ������ ��� (��������)
begin
  inherited Create( size,
                    1,
                    '���('+FormatFloat('0.###', br)//+'; '
                    //+FormatFloat('0.##', all)
                   +')');
  al      := 0;
  Breite  := Br;   // ������� �����
  if length > size then length := size;

  if simm then
  begin
    if not odd(length) then dec(length);
    for i:=-(length div 2) to (length div 2) do
    begin
      data[(i + razm) mod razm].im:=0;
      v:=(2*pi*breite*i - al*breite);
      if v=0 then
      begin
        tmp := (i+razm) mod razm;
        data[tmp].re := 1
      end
      else
      begin
        tmp := (i+razm) mod razm;
        data[tmp].re := sin(v)/v;
      end
    end;
    scale := scMath;
  end
  else
  begin
    for i:= 0 to length - 1 do
    begin
      if (length mod 2) = 1 then
      begin
        v := 2*pi*breite*(i - length div 2);
        if v <> 0 then
          data[i].re := sin(v)/v
        else
          data[i].re := 1;
      end
      else
      begin
        v := 2*pi*breite*(i - length div 2 + 0.5);
        data[i].re := sin(v)/v
      end
    end
  end;
end;

constructor IXDif.Create(size   : longint;
                         l      : longint;
                         simm   : boolean
                        );
var
  i,h, k : integer;
begin
  inherited Create(size, 1, '����:' + FormatFloat('0', l));
  if l > size then l := size;
  if not odd(l) then l := l - 1;

  if simm then
  begin
    for i := -(l div 2) to (l div 2) do
    begin
      h:=(i+razm) mod razm;
      data[(i+razm) mod razm].im:=0;
      if i=0 then
        data[(i+razm) mod razm].re:=0
      else
        if odd(i) then
          data[(i+razm) mod razm].re:=-1/i
        else
          data[(i+razm) mod razm].re:=1/i;
    end;
    scale := scMath
  end
  else
  begin
    if ((l+1) mod 4) = 0 then
      k := 1
    else
      k := -1;
    for i := 0 to l - 1  do
      if i = (l div 2) then
        data[i].re:=0
      else
        if odd(i) then
          data[i].re := k*1/(i - l div 2)
        else
          data[i].re := -k*1/(i - l div 2);
  end
end;

function si(x:Extended):Extended;
var i:integer;
    v,si1:Extended;
begin
  v:=x;si1:=v;
  i:=3;
  while i<=100 do
  begin
    v:=-v*x*x/i/(i-1);
    si1:=si1+v/i;
    i:=i+2;
  end;
  si:=si1;
end;

constructor IXInt.Create(size   : longint;
                         l      : longint;
                         simm   : boolean
                          );
var
  i, h : integer;
begin
  inherited Create(size, 1, '���.');
  if simm then scale := scMath;

  for i := -(razm div 2) to (razm div 2 - 1) do
  begin
    h:=(i + razm - 1) mod razm;
    if i <> 0 then
    begin
      if abs(i) < 10 then
        data[h].re := si(pi*(i-1))/pi
      else
        if i<0 then
          data[h].re := -0.5
        else
          data[h].re := 0.5;
    end
  end;
  data[razm-1].re := si(pi*(-1))/pi
end;

constructor IXGilb.Create(size  : longint;
                          l     : longint;
                          simm  : boolean
                          );
var i:integer;
begin
  inherited Create(size, 1, '��');
  if l > size then l := size;
  if not odd(l) then dec(l);

  if simm then
  begin
    for i:=-(l div 2) to (l div 2) do
    begin
      data[(i+razm) mod razm].im:=0;
      if i=0 then data[(i+razm) mod razm].re:=0
           else if odd(i) then data[(i+razm) mod razm].re:=2/pi/i
                          else data[(i+razm) mod razm].re:=0;
    end;
    scale := scMath
  end
  else
  begin
    for i := 0 to l - 1  do
      if i = l div 2 then
        data[i].re := 0
      else
        if not odd(i) then
          data[i].re := 2/pi/(i - (l div 2))
        else
          data[i].re:=0;
  end
end;

constructor FFT.Create( s : signal);
var
  t,u,w                     : TComplex;
  k,l,le1,le,n,nv2,i,j,ip   : integer;
  c,d,e                     : Extended;
  m                         : integer;
label
  6,7;
begin
  t := TComplex.Create;
  u := TComplex.Create;
  w := TComplex.Create;

  inherited Create(s.razm, -1, '���('+s.name+')');
  re_im_plot  := false;
  scale       := scMath;

  for i:=0 to razm-1 do
    data[i].copy(s.data[i]);
  
  m := round(ln(razm)/ln(2));
  n := 2;
  for i:=2 to m do n:=n*2;
  nv2 := n div 2;
  j   := 0;

  for i:=0 to n-2 do
  begin
    if i<j then
    begin
      t.copy(data[j]);
      data[j].copy(data[i]);
      data[i].copy(t);
    end;
    k:=nv2;
  6:
    if k>=(j+1) then goto 7;
    j:=j-k;
    k:=k div 2;
    goto 6;
  7:
    j:=j+k;
  end;
  for l:=1 to m do
  begin
    le:=1;for i:=1 to l do le:=le*2;
    le1:=le div 2;
    u.re:=1; u.im:=0;
    w.re:=cos(pi/le1); w.im:=-sin(pi/le1);
    for j:=1 to le1 do
    begin
      i:=j-1;
      while i<n do
      begin
        ip:=i+le1;
        c:=(data[ip].re+data[ip].im)*(u.re+u.im);
        d:=u.re*data[ip].re;e:=u.im*data[ip].im;
        t.re:=d-e;t.im:=c-d-e;
        data[ip].re:=data[i].re-t.re;data[ip].im:=data[i].im-t.im;
        data[i].re:=data[i].re+t.re;data[i].im:=data[i].im+t.im;
        i:=i+le;
      end;
      c:=(w.re+w.im)*(u.re+u.im);d:=u.re*w.re;e:=u.im*w.im;
      u.re:=d-e;u.im:=c-d-e;
    end;
  end;

  // ��������� ���
  for i :=0 to (razm div 2) do// (razm div 2)+1 to razm - 1 do//
    if data[i].in_a = pi then
      data[i].invert_a;

end;

constructor OBPF.Create( s : signal);
var
  s2  : signal;
  i   : longint;
  buf : Extended;
  n   : longint;
begin
  inherited Create(s.razm, -1, '����(' + s.name + ')');
  re_im_plot := true;
  scale      := scMachine;

  s2:=FFT.Create(s);
  for i:=0 to razm-1 do data[i]:=s2.data[i];
  n:=razm;
  for i:=1 to (n div 2)-1 do
  begin
    buf:=data[n-i].re;
    data[n-i].re:=data[i].re/n;
    data[i].re:=buf/n;
    buf:=data[n-i].im;
    data[n-i].im:=data[i].im/n;
    data[i].im:=buf/n;
  end;
  data[0].re:=data[0].re/n;data[n div 2].re:=data[n div 2].re/n;
  data[0].im:=data[0].im/n;data[n div 2].im:=data[n div 2].im/n;
end;

//------------------------------------------------------------------------------
// ����� ������� ����� ����� �������� �� ��������!
constructor Swertka.Create( s1, s2 : signal);
var
  i         : longint;
  u, ss     : Signal;
  s_1, s_2  : Signal;
  fft_s1    : Signal;
  fft_s2    : Signal;
begin
  s_1 := Signal.Create(s1);
  s_2 := Signal.Create(s2);
  inherited Create( s_1, s_2, '���.('+s1.name+'*'+s2.name+')');
  re_im_plot := s1.re_im_plot;
  scale      := s1.scale;

  fft_s1    := FFT.Create(s_1);
  fft_s2    := FFT.Create(s_2);;
  ss := OBPF.Create(Umnozhenie.Create(fft_s1, fft_s2));

  // �������� � ���� ������:
  for i := 0 to razm - 1 do
    data[i].copy(ss.data[i]);
end;
//------------------------------------------------------------------------------
constructor Korelazia.Create( s1, s2 : signal);
var
  i         : longint;
  u, ss     : Signal;
  s_1, s_2  : Signal;
  fft_s1    : Signal;
  fft_s2    : Signal;
begin
  s_1 := Signal.Create(s1);
  s_2 := Signal.Create(s2);
  inherited Create( s_1, s_2, '����.('+s1.name+'*'+s2.name+')');
  re_im_plot := s1.re_im_plot;
  scale      := s1.scale;

  fft_s1    := FFT.Create(s_1);
  fft_s2    := FFT.Create(s_2);;

  // ����������� ����������:
  for i:=0 to fft_s1.razm-1 do
    fft_s1.data[i].im := -fft_s1.data[i].im;

  u  := Umnozhenie.Create(fft_s1, fft_s2);
  ss := OBPF.Create(u);
  for i := 0 to razm - 1 do
    data[i].copy(ss.data[i]);

end;
//------------------------------------------------------------------------------
constructor Slozhenie.Create(s1, s2 : signal);
var
  i         : longint;
  s_1, s_2  : Signal;
begin
  s_1 := Signal.Create(s1);
  s_2 := Signal.Create(s2);
  inherited Create( s_1, s_2, '��('+s1.name + '+' + s2.name + ')');
  re_im_plot := s1.re_im_plot;
  scale      := s1.scale;

  for i := 0 to razm - 1 do
  begin
    data[i].im:=s_1.data[i].im + s_2.data[i].im;
    data[i].Re:=s_1.data[i].re + s_2.data[i].re;
  end;
end;
//------------------------------------------------------------------------------
constructor Vychitanie.Create(s1, s2 : signal);
var
  i         : longint;
  s_1, s_2  : Signal;
begin
  s_1 := Signal.Create(s1);
  s_2 := Signal.Create(s2);
  inherited Create( s_1, s_2, '���('+s1.name + '-' + s2.name + ')');
  re_im_plot := s1.re_im_plot;
  scale      := s1.scale;

  for i := 0 to razm - 1 do
  begin
    data[i].im:=s_1.data[i].im - s_2.data[i].im;
    data[i].Re:=s_1.data[i].re - s_2.data[i].re;
  end;
end;
//------------------------------------------------------------------------------
constructor Umnozhenie.Create( s1, s2 : signal);
var
  i       : longint;
  a, b, c : Extended;
  r       : longint;
  s_1, s_2  : Signal;
begin
  s_1 := Signal.Create(s1);
  s_2 := Signal.Create(s2);
  inherited Create( s_1, s_2, '���.('+s1.name + '+' + s2.name + ')');
  re_im_plot := s1.re_im_plot;
  scale      := s1.scale;

  for i := 0 to razm - 1 do
  begin
    a           := ( s_1.data[i].re + s_1.data[i].im    )
                 * ( s_2.data[i].re + s_2.data[i].im );
    b           := s_1.data[i].re * s_2.data[i].re;
    c           := s_1.data[i].im * s_2.data[i].im;
    data[i].re  := b - c;
    data[i].im  := a - b - c;
  end;
end;
//------------------------------------------------------------------------------
constructor Zerkalo.Create( s : signal );
var
  i : longint;
begin
  inherited Create(s.razm, -1, '����(' + s.name + ')');
  re_im_plot := s.re_im_plot;
  scale      := s.scale;

  for i:=0 to razm-1 do
    begin
      data[i].re:=s.data[razm-i-1].re;;
      data[i].im:=s.data[razm-i-1].im;;
    end
end;
//------------------------------------------------------------------------------
constructor Komplsopr.Create( s : signal);
var
  i : longint;
begin
  inherited Create(s.razm, -1, '�����.����('+s.name+')');
  re_im_plot := s.re_im_plot;
  scale      := s.scale;

  for i:=0 to razm-1 do
    begin
      data[i].im:=-s.data[i].im;
      data[i].re:=s.data[i].re
    end;
end;
//------------------------------------------------------------------------------
constructor KomplRe.Create( s : signal);
var
  i : longint;
begin
  inherited Create(s.razm, -1, 'Re('+s.name+')');
  re_im_plot := s.re_im_plot;
  scale      := s.scale;

  for i:=0 to razm-1 do
    begin
      data[i].im:=0;
      data[i].re:=s.data[i].re
    end;
end;
//------------------------------------------------------------------------------
constructor KomplIm.Create( s : signal);
var
  i : longint;
begin
  inherited Create(s.razm, -1, 'Im('+s.name+')');
  re_im_plot := s.re_im_plot;
  scale      := s.scale;

  for i:=0 to razm-1 do
    begin
      data[i].im:=0;
      data[i].re:=s.data[i].im;
    end;
end;

//------------------------------------------------------------------------------
constructor Sin_s.Create( s : signal);
var
  i             : longint;
  Max1,Max,Max2 : Extended;
begin
  inherited Create(s.razm, -1, 'Sin('+s.name+')');
  re_im_plot := s.re_im_plot;
  scale      := s.scale;
  s.AxisMaxs(Max1,Max);
  s.AxisMins(Max2,Max);
  if Max1<abs(Max2) then Max1:=Max2;
  if Max1<>0 then
     for i:=0 to razm-1 do
      begin
        data[i].re:=sin(pi/2*s.data[i].re/Max1);
        data[i].im:=0;
      end;
end;

//------------------------------------------------------------------------------
constructor Cos_s.Create( s : signal);
var
  i             : longint;
  Max1,Max,Max2 : Extended;
begin
  inherited Create(s.razm, -1, 'Cos('+s.name+')');
  re_im_plot := s.re_im_plot;
  scale      := s.scale;
  s.AxisMaxs(Max1,Max);
  s.AxisMins(Max2,Max);
  if Max1<abs(Max2) then Max1:=Max2;
  if Max1<>0 then
     for i:=0 to razm-1 do
       begin
         data[i].re:=Cos(pi/2*s.data[i].re/Max1);
         data[i].im:=0;
       end;
end;

//------------------------------------------------------------------------------
// �������� ������ ����� ���� ������ 0.5! ��� ���� ���������� ���������
// ������������� �������� ��������: ������������ �� N ������
constructor Sdvig.Create( s : signal; sd_ : extended);
var
  i   : longint;
  sd  : longint;
begin
  inherited Create(s.razm, -1, '�����('+s.name+'�� '+FormatFloat('0.0', sd_)+')');
  // ���� �������� ������ �������, ��
  re_im_plot  := s.re_im_plot;
  scale       := s.scale;
  sd := round(sd_);
  sd := sd mod s.razm;
  if sd < 0 then
    sd := sd + s.razm;
  for i:=0 to s.razm-1 do
    data[(i + sd) mod s.razm].re := s.data[i].re;
  for i:=0 to s.razm-1 do
    data[(i + sd) mod s.razm].im := s.data[i].im;
end;
//------------------------------------------------------------------------------
constructor ReImToModArg.Create(s:signal);
var
  i               : longint;
  SreMax,SimMax   : Extended;
  Kch,Kre,Kim     : integer;
begin
  inherited Create(s.razm, -1, s.name);
  Kch:=10000; { ������. ���������������  ��� ����������� ���� }
  re_im_plot := s.re_im_plot;
  scale      := s.scale;

  SreMax:=0; SimMax:=0;
  for i:=0 to razm-1 do
  begin
    if abs(s.data[i].re)>SreMax then SreMax:=abs(s.data[i].re);
    if abs(s.data[i].im)>SimMax then SimMax:=abs(s.data[i].im);
  end;

  SreMax:=SreMax/Kch;
  SimMax:=SimMax/Kch; { ��������� �������� ��� ������� ����}

  for i:=0 to razm-1 do
  begin
    data[i].re:=sqrt(sqr(s.data[i].re)+sqr(s.data[i].im));
    if abs(s.data[i].im)> SreMax+SimMax then
    begin
      { ������ �������� ���� ��� ����� �������� ������ �������}
      if data[i].re>SreMax+SimMax then
      begin
        if s.data[i].re<>0 then
          data[i].im:=arctan(abs(s.data[i].im/s.data[i].re))
        else
          Kim:=0;
        if s.data[i].im<0 then Kim:=-1 else Kim:=1;
        if abs(s.data[i].im)<SimMax then Kim:=0;
        if s.data[i].re<0 then Kre:=-1 else Kre:=1;
        if abs(s.data[i].re)<SreMax then Kre:=0;
        data[i].im:=((pi/2 - data[i].im)*Kre - pi/2)*Kim;
        data[i].im:=-data[i].im;
      end
      else
        data[i].im:=0;
    end
    else
    begin
      if data[i].re>SreMax+SimMax then
      begin
        if (i <= razm-(razm div 2 )-1) and (s.data[i].re < 0 ) then
          data[i].im := -pi;
        if (i > razm-(razm div 2 )-1) and (s.data[i].re < 0 )  then
          data[i].im := pi;
      end
      else
        data[i].im := 0;
    end
  end;
end;
//------------------------------------------------------------------------------
procedure SignalsArray.add(new_signal : Signal);  // �������� ����� ������
var
  l : longint;
begin
  // ��������� ������ �������
  l := length(data);
  SetLength(data, l+1);
  //
  data[l] := new_signal;
  pos := l;
  inc(razm);

  MainForm.SignListBox.Items.Add(data[pos].name);
  MainForm.SignListBox.ItemIndex:=ar.curr;
  Grafik.draw(Ar.get);

  changed := true;
  if self.razm = 1 then
    Grafik.to_on;
end;
//------------------------------------------------------------------------------
// ������� ������� ������
procedure SignalsArray.delete;
var
  i : longint;
begin
  data[pos].Destroy; // ������� �� ������
  for i := (pos + 1) to (razm - 1) do
    data[i - 1] := data[i];

  setlength(data, razm - 1);
  dec(razm);

  if pos >= razm then
    pos := razm - 1;

  if not(is_empty) then
    changed := true
  else
  begin
    changed := false;
    grafik.to_off;
  end;
end;
//------------------------------------------------------------------------------
procedure SignalsArray.delete(n : integer);
var
  i : longint;
begin
  if n > self.razm - 1 then exit;
  data[n].Destroy; // ������� �� ������

  for i := (n + 1) to (razm - 1) do
    data[i - 1] := data[i];

  setlength(data, razm - 1);
  dec(razm);

  if pos >= razm then // ��������� �������� (�����.)
    pos := razm - 1;

  if not(is_empty) then
    changed := true
  else
  begin
    changed := false;
    grafik.to_off;
  end;
end;
//------------------------------------------------------------------------------
constructor SignalsArray.Create();
begin
  data    := NIL;
  pos     := 0;
  changed := false;
end;
//------------------------------------------------------------------------------
function SignalsArray.is_empty : boolean ;
begin
  if (razm = 0) then
    result := true  // ���� Ar ����
  else
    result := false;
end;
//------------------------------------------------------------------------------
function SignalsArray.get : Signal;  // ������� ������ �� pos
begin
  if not(is_empty) then
    result := data[pos]
  else
    result := NIL;
end;
//------------------------------------------------------------------------------
function SignalsArray.get(pos_ : longint)  : Signal;
begin
  result := data[pos_];
end;
//------------------------------------------------------------------------------
// ��������� � ���� ��� �������
procedure SignalsArray.save(fname : string);
var
  fs  : TFileStream;
  i   : integer;
begin
  fs := TFileStream.Create(fname, fmCreate);
  fs.Write(razm, sizeof(razm));
  for i := 0 to razm - 1 do
    data[i].save(fs);
  fs.Destroy;

  changed := false;
end;
//------------------------------------------------------------------------------
// ��������� �� �����
function SignalsArray.load(fname : string) : boolean;
var
  fs    : TFileStream;
  i, r  : integer;
begin
  Result := false;
  // ���� ���� ������� �����-�� �������, �� �� ���� ����������,
  // �������������� ����������� � � ����
  if not(is_empty) then
  begin
    r := MessageDlg(
        '��� �������� ������������ ������� ����� �������! ����������'
      , mtConfirmation
      , [mbYes, mbNo]
      , 0);
    case r of
    6:
      begin // ������� ������������ �������
        for i := 0 to razm - 1 do
          data[i].Destroy;
        SetLength(data, 0);
        razm := 0;
        pos  := 0;
        MainForm.SignListBox.Items.Clear;
        Grafik.to_off;
        MainForm.update_buttons_en;
      end;
    2, 7:
      exit;
    end;
  end;

  fs := TFileStream.Create(fname, fmOpenRead);
  if fs = NIL then exit;

  fs.Read(r, sizeof(razm));

  for i := 0 to r - 1 do
    add(Signal.Create(fs));
   
  fs.Destroy;
  Result := true;
  changed := false;
end;
//------------------------------------------------------------------------------
function SignalsArray.prev : integer;  // ����������� (�� �����) pos
begin
  dec(pos);
  if(pos < 0) then
    pos := razm - 1;
  result := pos;
end;
//------------------------------------------------------------------------------
function SignalsArray.next : integer;  // -//-
begin
  inc(pos);
  if(pos >= razm) then
    pos := 0;

  result := pos;
end;
//------------------------------------------------------------------------------
function SignalsArray.curr : integer;  // ������� pos
begin
  result := pos;
end;
//------------------------------------------------------------------------------
procedure SignalsArray.set_curr(new_poz : integer);       // �����������
begin
  pos := new_poz mod razm;
end;
//------------------------------------------------------------------------------
function SignalsArray.is_changed : boolean;
begin
  Result := changed;
end;
//------------------------------------------------------------------------------
destructor SignalsArray.Destroy;
begin
  SetLength(data, 0);
end;
//------------------------------------------------------------------------------
procedure Signal.AxisMaxs(var Max1,Max2 :Extended);
var
  i : longint;
begin
  Max1 := 0;
  Max2 := 0;

  if razm <> 0 then
    for i:=0 to razm-1 do
      if re_im_plot then
      begin
        if Max1 < data[i].re then Max1 := data[i].Re;
        if Max2 < data[i].im then Max2 := data[i].im;
      end
      else
      begin
        if Max1 < data[i].m then Max1 := data[i].m;
        if Max2 < data[i].a then Max2 := data[i].a;
      end
end;
//------------------------------------------------------------------------------
procedure Signal.AxisMins(var Min1, Min2 :Extended);
var
  i : longint;
begin
  Min1 := 0;
  Min2 := 0;

  if razm <> 0 then
    for i:=0 to razm-1 do
      if re_im_plot then
      begin
        if Min1 > data[i].re then Min1 := data[i].Re;
        if Min2 > data[i].im then Min2 := data[i].im;
      end
      else
      begin
        if Min1 > data[i].m then Min1 := data[i].m;
        if Min2 > data[i].a then Min2 := data[i].a;
      end
end;
//------------------------------------------------------------------------------
function Signal.get_razm : longint;
begin
  result := in_razm;
end;
//------------------------------------------------------------------------------
function Signal.get_name : string;
begin
  result := in_name;
end;
//------------------------------------------------------------------------------
// �������� ���������� �������� ���� �������, ���� �������� ������
// ���� ��� ������, ����� new_razm - ������ � ������ razm
// 
procedure Signal.change_razm(new_razm : longint);
var
  new_data    : array of TComplex;
  i, j        : longint;
begin
  // ������������ ����� ������ � ������� ������� `2`
  if frac(log2(new_razm)) <> 0 then
    new_razm := round(power(2, int(log2(new_razm)) + 1));

  // ������� ����� ������
  SetLength(new_data, new_razm);

  // �������� ������ ������, ������ ����� �������� "0":
  j := 0;
  for i := 0 to (new_razm div 2) - 1 do
    if i < (razm div 2) - 1 then
    begin
      new_data[i] := TComplex.Create(data[j]);
      inc(j);
    end
    else
      new_data[i] := TComplex.Create;

  for i := (new_razm div 2) to (new_razm - 1) do
    if i < new_razm - (razm div 2) then
      new_data[i] := TComplex.Create
    else
    begin
      new_data[i] := TComplex.Create(data[j]);
      inc(j);
    end;

  // ����������� ������ �� ������ ������ � �������� data � in_razm
  SetLength(data, 0);
  data := pointer(new_data);
  in_razm := new_razm;
end;
//------------------------------------------------------------------------------
// ������-������������
function spline(y : array of extended;
                A : extended; // ��������� x - ��� y[0]
                x : extended; // �����, � ������� ����� ���������
                H : extended; // ���
                N : longint
                ) : extended;
var
  m             : array[0..3] of extended;
  i             : longint;
  w, c, b, d, e : extended;
begin
  // ���������� �����������:
  m[0] := (4*Y[1] - Y[2] - 3*Y[0])/2/H;
  m[N] := (3*Y[n] + Y[N-2] - 4*Y[N-1])/2/H;
  for i := 1 to N-1 do
  begin
    m[i] := (Y[i+1] -Y[i-1])/2/H;
  end;
  if x <= A then
    w := y[0] + (x - A)*M[0]
  else
  begin
    B := A + H * N;
    if x >= B then
      w := y[N] + (x - b) *M[N]
    else
    begin
      i := round((x-A)/H); b := A + H * i;
      c := b + h; d := x - c; e := x - b;
      w := d * d *(e + e + h)*y[i]+e*e*(h-d-d)*y[i+1];
      w := w/h + d*d*e*m[i];
      w := (w+e*e*d*m[i+1])/h/h;
    end
  end;
  result := w;
end;
//------------------------------------------------------------------------------
end.
