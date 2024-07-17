unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    LabelOutp: TLabel;
    LabelHist: TLabel;
    ButtonEq: TButton;
    Button1: TButton;
    Button4: TButton;
    Button2: TButton;
    Button5: TButton;
    Button3: TButton;
    Button6: TButton;
    Button9: TButton;
    Button7: TButton;
    Button8: TButton;
    ButtonPow: TButton;
    ButtonDiv: TButton;
    ButtonMin: TButton;
    ButtonPlus: TButton;
    Button0: TButton;
    ButtonC: TButton;
    ButtonCe: TButton;
    ButtonDot: TButton;
    ButtonBS: TButton;
    procedure Button9Click(Sender: TObject);
    procedure ButtonActClick(Sender: TObject);
    procedure ButtonEqClick(Sender: TObject);
    procedure ButtonCClick(Sender: TObject);
    procedure ButtonDotClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainFrm: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button9Click(Sender: TObject);
begin
  if (LabelOutp.Caption = '0') or (LabelHist.Caption <> '') then
  begin
    LabelOutp.Caption := '';
  end;
  LabelOutp.Caption := LabelOutp.Caption + (Sender as TButton).Caption;
end;

procedure TForm1.ButtonActClick(Sender: TObject);
begin
  LabelOutp.Caption := LabelOutp.Caption + (Sender as TButton).Caption;
end;

procedure TForm1.ButtonCClick(Sender: TObject);
begin
  LabelOutp.Caption := '0';
  LabelHist.Caption := '';
end;

procedure TForm1.ButtonDotClick(Sender: TObject);
var
  I: ShortInt;
  str: string;
begin
  str := LabelOutp.Caption;
  I := str.Length;
  while (not (LabelOutp.Caption[I] in ['+', '-', '*', '/'])) and (I > 1) do
  begin
    if LabelOutp.Caption[I] = ',' then
      exit ;
    I := I - 1;
  end;
  LabelOutp.Caption := LabelOutp.Caption + (Sender as TButton).Caption;
end;

procedure TForm1.ButtonEqClick(Sender: TObject);
var
  I, J, iNumFirst, iNumSecond, numAct, numFirstAct: ShortInt;
  first, second, answ: Double;
  str, strNum: string;
begin
  numAct := 0;
  numFirstAct := 0;
  first := 0;
  iNumFirst := 1;
  str := LabelOutp.Caption;
  LabelHist.Caption := str;
  for I := 1 to str.Length do
  begin
    if (str[I] in ['+', '-']) then
      numAct := numAct + 1;
    if (str[I] in ['*', '/']) then
      numFirstAct := numFirstAct + 1;
  end;
  for I := 1 to numFirstAct do
  begin
    for J := 1 to str.Length do
    begin
      if (str[J] = '*') or (str[J] = '/') then
      begin
        iNumFirst := J - 1;
        while not((iNumFirst = 1) or (str[iNumFirst -1 ] in ['+', '-', '*', '/'])) do
          iNumFirst := iNumFirst - 1;
        first := StrToFloat(Copy(str, iNumFirst, J-iNumFirst));
        iNumSecond := J + 1;
        while not((iNumSecond = str.Length) or (str[iNumSecond + 1] in ['+', '-', '*', '/'])) do
          iNumSecond := iNumSecond + 1;
        second := StrToFloat(Copy(str, J + 1, iNumSecond - J));
        if str[J] = '*' then
          answ := first * second
        else
          answ := first / second;
        str := Copy(str, 1, iNumFirst-1) + FloatToStr(answ) + Copy(str, iNumSecond + 1);
        strNum := str;
        break;
      end;
    end;
  end;
  for I := 1 to numAct do
  begin
    for J := 1 to str.Length do
    begin
      if (str[J] = '+') or (str[J] = '-') then
      begin
        iNumSecond := J + 1;
        first := StrToFloat(Copy(str, 1, J - 1));
        while not((iNumSecond = str.Length) or (str[iNumSecond + 1] in ['+', '-'])) do
          iNumSecond := iNumSecond + 1;
        second := StrToFloat(Copy(str, J + 1, iNumSecond - J));
        if str[J] = '+' then
          answ := first + second
        else
          answ := first - second;
        str := FloatToStr(answ) + Copy(str, iNumSecond + 1);
        strNum := str;
        break;
      end;
    end;
  end;
  LabelOutp.Caption := strNum;
end;
end.
