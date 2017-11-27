unit Lsys;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, math;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    Plik1: TMenuItem;
    Edycja1: TMenuItem;
    Nowy1: TMenuItem;
    Zapisz1: TMenuItem;
    Otworz1: TMenuItem;
    Kopiuj1: TMenuItem;
    Wklej1: TMenuItem;
    Wklej2: TMenuItem;
    Pomoc1: TMenuItem;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button3: TButton;
    prod: TRichEdit;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    NrPrzepis: TLabel;
    Button4: TButton;
    Button5: TButton;
    Label6: TLabel;
    Edit3: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Edit4: TEdit;
    Label9: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Edit9: TEdit;
    Oprogramie1: TMenuItem;
    Pomoc2: TMenuItem;

    procedure Otworz1Click(Sender: TObject);
    procedure Zapisz1Click(Sender: TObject);
    procedure OdczytajzPliku(FileName: String);
    procedure ZapiszDoPliku(FileName: String);
    procedure Button3Click(Sender: TObject);
procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Nowy1Click(Sender: TObject);
procedure duzeF(alfa,krok:real; przes :integer; var x,y:real);
procedure maleF(alfa,krok:real; przes :integer; var x,y:real);
procedure plus(var alfa :real);
procedure minus(var alfa :real);
    procedure Oprogramie1Click(Sender: TObject);

     private
    { Private declarations }
  public

    { Public declarations }
  end;

type
  LS = class

   private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
    xx: array[0..5] of  Real;  //x,y wspolrzedne do zapamietania w strukturach rozgaleionych
    yy: array[0..5] of  Real;
    aa: array[0..5] of Real;


implementation

uses LsysRysun;

{$R *.dfm}




          { odczyt z pliku }
procedure TForm1.OdczytajzPliku(FileName: String);
var
 lis: TStringList;
 i,j: Integer;
 pom: String;
begin
memo1.Text:=''; //zeruj memo do wypelnienia odpowiednia iloscia linijek
lis := TStringList.Create;
lis.LoadFromFile(FileName); //duje zawartosc pliku do listy lis
//poszczegolne pola edit dostaja swoja zawartosc
Edit3.Text:=lis[0];
Edit4.Text:=lis[1];
Edit1.text:=lis[2];
Edit2.text:=lis[3];

for i:=4 to lis.count-1 do
 begin
 if (lis[i]='0') or(lis[i]='1') then
           begin
           pom:=lis[i];
            break;
           end
 else   begin
       memo1.Text:=memo1.text+#13#10;
       memo1.Lines[i-4]:=lis[i];
       end;
 end; //pierwsze for dla memo1
 if pom='1' then
 begin
  if ((i+1)<lis.count) then edit5.text:=lis[i+1];
  if ((i+2)<lis.count) then edit6.text:=lis[i+2];
  if ((i+3)<lis.count) then edit7.text:=lis[i+3];
  if ((i+4)<lis.count) then edit8.text:=lis[i+4];

 end else begin
    edit5.Text:='';
    edit6.Text:='';
    edit7.Text:='';
    edit8.Text:='';
 end ;//else
lis.Free;
prod.Text:='';     // produkcje
NrPrzepis.Caption:=IntToStr(0); //nr przepisania
end;

procedure TForm1.Otworz1Click(Sender: TObject);
begin
  if(OpenDialog1.Execute) then
       OdczytajzPliku(OpenDialog1.FileName);
end;

procedure TForm1.Zapisz1Click(Sender: TObject);
begin

if SaveDialog1.Execute then
       ZapiszDoPliku(SaveDialog1.FileName);
end;


procedure TForm1.ZapiszDoPliku(FileName: String);
var
 lis: TStringList;
 i: Integer;
begin
lis := TStringList.Create;
lis.add(Edit3.Text);
lis.add(Edit4.Text);
lis.add(Edit1.text);
lis.add(Edit2.text);

for i:=0 to memo1.lines.count-1 do
        lis.add(memo1.Lines[i]);

if edit5.text='' then lis.add('0')
else lis.add('1');

if edit5.text<>'' then lis.Add(edit5.Text);
if edit6.text<>'' then lis.Add(edit6.Text);
if edit7.text<>'' then lis.Add(edit7.Text);
if edit8.text<>'' then lis.Add(edit8.Text);
lis.SavetoFile(FileName);
lis.Free;

end;


procedure TForm1.Button3Click(Sender: TObject);
var
 reg :array of String ; //dynamiczna tablica
 i,j,nr,z,lin,li : Integer;

 produkcjas,produkcjan :string;
 //produkcja stara, produkcja nowa
begin
  produkcjan:='';                       //zerowanie nowej produkcji
  lin:=memo1.Lines.Count;               //liczba lini z pola memo
  setlength(reg, lin);                  // potrzebna do ustalenia wielkosci tabicy reg przechowujacej linie z pola memo
  for i:=low(reg) to high(reg) do
        reg[i]:=memo1.Lines[i];         //zbieramy reguly do tablicy


   nr:=StrToInt(NrPrzepis.Caption);     // odczytujemy numer przepisania

  if (nr<>0) then begin
        produkcjas:=prod.text ;              //  pamietamy stara produkcje
        prod.Clear;                          //czyscimy pole richedit pod nowa produkcje
        for i:=0 to  length(produkcjas) do   // od poczatku do konca produkcji
        begin
 //          li:=0;
            for j:=low(reg) to high(reg) do   //j - nr lini z regula
            begin                             // tab reg ma reg[j,1] symbol
                if (produkcjas[i]=reg[j,1])then begin             //sprawdzamy czy znak z produkcji jest rowny symbolowi z tablicy regul reg
                        for z:=3 to length(reg[j]) do begin             // jesli tak to od poczatku reguly do jej konca wpisujemy
                                produkcjan:=produkcjan+reg[j,z]; // symbol po symbolu do nowej produkcja
                      li:=1;

    end;

                end // else produkcjan:='FFF'+produkcjan; //produkcjan+produkcjas[i];

            end; //for j:=0
 //         if (li=0) then  produkcjan:=produkcjan+''+produkcjas[i];; //produkcjan+produkcjas[i]; //!!!!! nowe dopisane
        end;  //for i:=0
          prod.text:=produkcjan;
       end else prod.Text:=Edit2.Text;      //if (nr<>0)
{

   zakladamy ze reg[i,1] ma pierwsza wartosc
     reg [i,2] regule
     jestli prod (rich edit) jest puste to wstaw aksjomat
     w przeciwnym wypadku wykonuj

for i:=1 to ostatnia wartosc stringa do begin
   if pole memo ma wartosc reg[i,1] then prod dostaje wartosc reg[i,2]
}
  nr:=nr+1; //zwiekszamy licznik przepisan
  NrPrzepis.Caption:=InttoStr(nr);

end;



procedure TForm1.Button4Click(Sender: TObject);

var
produkcja :String;
i,j,z, przes, nr : integer;
 dod: array [1..4] of string;      //tablica dodatkowych regul
x,y, alfa, krok,krok0,li, czynnik :real;
begin
Form2.Canvas.FloodFill(70,70,clGray, fsBorder); //czyszczenie podloza pod rysunek
nr:=StrToInt(NrPrzepis.Caption);
if  (nr<>0) then begin


 //       setlength(xx,1);
 //       setlength(yy,1);

        xx[0]:=0;     //inicjuemy puste tablice
        yy[0]:=0;
        aa[0]:=0;
        dod[1]:=edit5.Text;
        dod[2]:=edit6.Text;
        dod[3]:=edit7.Text;
        dod[4]:=edit8.Text;

  produkcja:=Form1.prod.Text;   //Odczytujemy produkcje
  //ustalenie danych poczatkowych
  alfa:=Degtorad(StrToInt(Form2.Edit1.text));
  x:=0;
  y:=0;
  czynnik:=Strtoint(edit3.Text)/strtofloat(edit4.Text);
  krok0:=Strtoint(edit9.Text);
  krok:=strtoint(NrPrzepis.caption);      // skala nazwa etykiety ze skala
  krok:=krok0*Exp(StrToInt(NrPrzepis.Caption)*Ln(czynnik));
  Form2.Show;
  Form2.Canvas.Pen.Color:=clRed;  //Czerwony
  Form2.Canvas.Pen.Style:=psSolid; //Linia ciagla
  //zolw
  przes:=100; //przesuniecie do rysowania
  Form2.Canvas.MoveTo(0+przes,0+przes);
  for i:=0 to length(produkcja)+1 do begin
        case produkcja[i]  of
        'F' : duzeF(alfa,krok,przes,x,y);
        'f':  maleF(alfa,krok,przes,x,y);
        '+' : plus(alfa);
        '-' : minus(alfa)    ;
        'X':
             begin
                           for z:=1 to length(dod[1]) do
                                   case dod[1,z]  of
                                   'F' : duzeF(alfa,krok,przes,x,y);
                                   'f':  maleF(alfa,krok,przes,x,y);
                                   '+' : plus(alfa);
                                   '-' : minus(alfa)    ;
                                   end;      //case

              end;   //x  ;
        'Y':
             begin
                           for z:=1 to length(dod[2]) do
                                   case dod[2,z]  of
                                   'F' : duzeF(alfa,krok,przes,x,y);
                                   'f':  maleF(alfa,krok,przes,x,y);
                                   '+' : plus(alfa);
                                   '-' : minus(alfa)    ;
                                   end;      //case

              end;   //x  ;
        'G':
             begin
                           for z:=1 to length(dod[3]) do
                                   case dod[3,z]  of
                                   'F' : duzeF(alfa,krok,przes,x,y);
                                   'f':  maleF(alfa,krok,przes,x,y);
                                   '+' : plus(alfa);
                                   '-' : minus(alfa)    ;
                                   end;      //case

              end;   //x  ;
         'H':
             begin
                           for z:=1 to length(dod[4]) do
                                   case dod[4,z]  of
                                   'F' : duzeF(alfa,krok,przes,x,y);
                                   'f':  maleF(alfa,krok,przes,x,y);
                                   '+' : plus(alfa);
                                   '-' : minus(alfa)    ;
                                   end;      //case

              end;   //x  ;
        '[': begin
              xx[0]:=xx[0]+1;
              yy[0]:=yy[0]+1;
              aa[0]:=aa[0]+1;
     //         setlength(xx,round(xx[0]));
     //         setlength(yy,round(yy[0]));
              xx[round(xx[0])]:=x;
              yy[round(yy[0])]:=y;
              aa[round(aa[0])]:=alfa;

             end ;
        ']':begin

              x:=xx[round(xx[0])];
              y:=yy[round(yy[0])];
              Form2.Canvas.moveto(round(x)+przes,round(y)+przes);
              alfa:=aa[round(aa[0])];
              xx[0]:=xx[0]-1;
              yy[0]:=yy[0]-1;
              aa[0]:=aa[0]-1;
     //         setlength(xx,round(xx[0]));
      //        setlength(yy,round(yy[0]));

            end;
        end;
  end;
 end else //if nr <>0
 messagedlgpos('Nie moge rysowac, brak produkcji',mtWarning,[mbOK],0,300,300);
end;

//Grafika Zolwia
//niestety oddzielnie
procedure TForm1.duzeF(alfa,krok:real; przes :integer; var x,y:real);

begin
x:=x+krok*cos(alfa);
y:=y+krok*sin(alfa);
  Form2.Canvas.Lineto(round(x)+przes,round(y)+przes);
end;
procedure TForm1.maleF(alfa,krok:real; przes :integer; var x,y:real);

begin
x:=x+krok*cos(alfa);
y:=y+krok*sin(alfa);
  Form2.Canvas.moveto(round(x)+przes,round(y)+przes);
end;
procedure TForm1.plus(var alfa :real);

var delta :real;
begin
delta:=strtoint(form1.edit1.text);   // odczytanie obrotu z pola
delta:=DegToRad(delta);
alfa:=alfa-delta;
end;
procedure TForm1.minus(var alfa :real);

var delta :real;
begin
delta:=strtoint(form1.edit1.text);   // odczytanie obrotu z pola
delta:=DegToRad(delta);
alfa:=alfa+delta;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
Form1.prod.text:='';
Form1.NrPrzepis.Caption:=InttoStr(0);
end;

procedure TForm1.Nowy1Click(Sender: TObject);
begin
Edit3.text:='1';//czynnik
Edit4.text:='2';//czynnik
Edit1.text:='';    //obrot
Edit2.Text:='';    //aksjomat
memo1.Text:='';   //reguly
prod.Text:='';     // produkcje
Edit5.text:='';//czynnik
Edit6.text:='';//czynnik
Edit7.text:='';//czynnik
Edit8.text:='';//czynnik
NrPrzepis.Caption:=IntToStr(0); //nr przepisania
end;

procedure TForm1.Oprogramie1Click(Sender: TObject);
begin
  Application.MessageBox ('Program Lsystem'+#10#13+'Autor:'+#10#13+'(c)Urszula ¯ukowska',
'O programie', MB_OK );

end;

end.
