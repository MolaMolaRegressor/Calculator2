unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMainFm = class(TForm)
    lblOutput: TLabel;
    lblHistory: TLabel;
    btnEqual: TButton;
    btn1: TButton;
    btn4: TButton;
    btn2: TButton;
    btn5: TButton;
    btn3: TButton;
    btn6: TButton;
    btn9: TButton;
    btn7: TButton;
    btn8: TButton;
    btnMultiply: TButton;
    btnDivide: TButton;
    btnMinus: TButton;
    btnPlus: TButton;
    btn0: TButton;
    btnC: TButton;
    btnCe: TButton;
    btnDot: TButton;
    btnBackspace: TButton;
    procedure btn9Click(Sender: TObject);
    procedure btnActClick(Sender: TObject);
    procedure btnEqualClick(Sender: TObject);
    procedure btnCClick(Sender: TObject);
    procedure btnDotClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainFm: TMainFm;

implementation

{$R *.dfm}

procedure TMainFm.btn9Click(Sender: TObject);
begin
  if (lblOutput.Caption = '0') or (lblHistory.Caption <> '') then
  begin
    lblOutput.Caption := '';
  end;
  lblOutput.Caption := lblOutput.Caption + (Sender as TButton).Caption;
end;

procedure TMainFm.btnActClick(Sender: TObject);
var
  str : string;
begin
  str := lblOutput.Caption;
  if not(lblOutput.Caption[str.Length] in ['+','-','/','*']) then
    lblOutput.Caption := lblOutput.Caption + (Sender as TButton).Caption;
end;

procedure TMainFm.btnCClick(Sender: TObject);
begin
  lblOutput.Caption := '0';
  lblHistory.Caption := '';
end;

procedure TMainFm.btnDotClick(Sender: TObject);
var
  I: ShortInt;
  str: string;
begin
  str := lblOutput.Caption;
  I := str.Length;
  while (not (lblOutput.Caption[I] in ['+', '-', '*', '/'])) and (I > 1) do
  begin
    if lblOutput.Caption[I] = ',' then
      exit ;
    I := I - 1;
  end;
  lblOutput.Caption := lblOutput.Caption + (Sender as TButton).Caption;
end;

procedure TMainFm.btnEqualClick(Sender: TObject);
var
  I, J, iNumFirst, iNumSecond, numAct, numFirstAct: ShortInt;
  firstNum, secondNum, answ: Double;
  str, strNum: string;
begin
  numAct := 0;
  numFirstAct := 0;
  firstNum := 0;
  iNumFirst := 1;
  str := lblOutput.Caption;
  lblHistory.Caption := str;
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
        begin
          if (secondNum <> 0) then
            answ := firstNum / secondNum
          else
            begin
              lblOutput.Caption := 'Невозможно деление на 0';
              exit;
            end;
        end;
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
  lblOutput.Caption := strNum;
end;
end.
