{
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.
}
{
   Author: Hiroshi Takey.
}


unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls;

type
  TForm5 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    Shape4: TShape;
    Image2: TImage;
    Timer2: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    swimage1:integer;
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit2, Unit1, Unit4;

{$R *.dfm}

procedure TForm5.FormActivate(Sender: TObject);
begin
if form2.Showing then
  form2.setfocus;

end;

procedure TForm5.Timer1Timer(Sender: TObject);
var
  i:integer;
begin
  Application.ProcessMessages;
  Randomize;
  i:= random(20000);
  if i > 10000 then
  begin
    timer1.Interval:= i;
    form1.flb1.ItemIndex:= random(form1.flb1.Count);

    if swimage1 = 0 then
    begin
      image1.Picture.LoadFromFile(form1.flb1.FileName);
      image2.SendToBack;
      swimage1:= 0;
    end
    else
    begin
      image2.Picture.LoadFromFile(form1.flb1.FileName);
      image1.SendToBack;
      swimage1:= 1;
    end;
  end;



end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  swimage1:= 0;

end;

procedure TForm5.Timer2Timer(Sender: TObject);
begin
  timer2.Enabled:=false;
      image2.Align:= alclient;
      image2.Align:= alnone;
      image1.Align:= alclient;
      image1.Align:= alnone;
end;

end.
