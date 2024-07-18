unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMainFm = class(TForm)
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
  MainFm: TMainFm;

implementation

{$R *.dfm}

procedure TMainFm.Button9Click(Sender: TObject);
begin
  if (LabelOutp.Caption = '0') or (LabelHist.Caption <> '') then
  begin
    LabelOutp.Caption := '';
  end;
  LabelOutp.Caption := LabelOutp.Caption + (Sender as TButton).Caption;
end;

procedure TMainFm.ButtonActClick(Sender: TObject);
begin
  LabelOutp.Caption := LabelOutp.Caption + (Sender as TButton).Caption;
end;

procedure TMainFm.ButtonCClick(Sender: TObject);
begin
  LabelOutp.Caption := '0';
  LabelHist.Caption := '';
end;

procedure TMainFm.ButtonDotClick(Sender: TObject);
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

procedure TMainFm.ButtonEqClick(Sender: TObject);
var
  I, J, iNumFirst, iNumSecond, numAct, numFirstAct: ShortInt;
  firstNum, secondNum, answ: Double;
  str, strNum: string;
begin
  numAct := 0;
  numFirstAct := 0;
  firstNum := 0;
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
        firstNum := StrToFloat(Copy(str, iNumFirst, J-iNumFirst));
        iNumSecond := J + 1;
        while not((iNumSecond = str.Length) or (str[iNumSecond + 1] in ['+', '-', '*', '/'])) do
          iNumSecond := iNumSecond + 1;
        secondNum := StrToFloat(Copy(str, J + 1, iNumSecond - J));
        if str[J] = '*' then
          answ := firstNum * secondNum
        else
          answ := firstNum / secondNum;
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
        firstNum := StrToFloat(Copy(str, 1, J - 1));
        while not((iNumSecond = str.Length) or (str[iNumSecond + 1] in ['+', '-'])) do
          iNumSecond := iNumSecond + 1;
        secondNum := StrToFloat(Copy(str, J + 1, iNumSecond - J));
        if str[J] = '+' then
          answ := firstNum + secondNum
        else
          answ := firstNum - secondNum;
        str := FloatToStr(answ) + Copy(str, iNumSecond + 1);
        strNum := str;
        break;
      end;
    end;
  end;
  LabelOutp.Caption := strNum;
end;
end.
