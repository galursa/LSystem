unit LsysRysun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Math;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
 uses Lsys;
{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
Form2.Canvas.FloodFill(70,70,clGray, fsBorder);
form1.Button4Click(Sender);
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
Form2.Canvas.FloodFill(70,70,clGray, fsBorder);
form1.Button4Click(Sender);
end;

end.
