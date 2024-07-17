program Calculator2;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, MainFrm);
  Application.Run;
end.
