program Lsystem;

uses
  Forms,
  Lsys in 'Lsys.pas' {Form1},
  LsysRysun in 'LsysRysun.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
