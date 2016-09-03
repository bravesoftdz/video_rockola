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

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MPlayer, ExtCtrls, OleCtrls, WMPLib_TLB, StdCtrls, jpeg,
  FileCtrl;

type
  TForm1 = class(TForm)
    wm1: TWindowsMediaPlayer;
    Timer1: TTimer;
    Image1: TImage;
    flb1: TFileListBox;
    Timer2: TTimer;
    Timer3: TTimer;
    Timer4: TTimer;
    Timer5: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure wm1StatusChange(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses unit2, unit4, Unit3;
{$R *.dfm}

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  timer1.Enabled:= false;
  form1.Visible:= true;
  form1.Left:= 1280;
  form1.WindowState:=wsMaximized;

if form2.Showing then
begin
  form2.SetFocus;
end;
  if form4.Showing then
  begin
    form4.SetFocus;
  end;


end;

procedure TForm1.wm1StatusChange(Sender: TObject);
var
  sw:boolean;
  i:integer;
begin

  if wm1.playState = 3 then
  begin
    wm1.Visible:=true;
    form2.shape1.Caption:= '';
    timer4.Enabled:=true;
    form2.SetFocus;
  end;


  if wm1.playState = 1 then
  begin
    wm1.Visible:=false;
    timer3.Enabled:=true;
    timer4.Enabled:=false;
    wm1.settings.volume:= 0;
  end;


end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
  i:integer;
begin
  Application.ProcessMessages;
  Randomize;
  i:= random(10000);
  if i > 5000 then
  begin
    timer2.Interval:= i;
  end;
  flb1.ItemIndex:= random(flb1.Count);
  image1.Picture.LoadFromFile(flb1.FileName);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  flb1.Directory:= 'C:\imagenes\';
  timer1.Enabled:=true;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
var
  i:integer;
  sw:boolean;
begin
  timer3.Enabled:=false;
  sw:= false;
  if wm1.playState = 1 then
  begin
    if dm1.TCola.RecordCount > 0 then
    begin
      dm1.TCola.First;
      wm1.URL:= dm1.TColaPathname.Value;
      wm1.controls.play;
      wm1.Align:= alClient;
      timer3.Enabled:=true;
      dm1.TCola.Delete;
      dm1.TCola.First;
    end;
  end;
end;

procedure TForm1.Timer4Timer(Sender: TObject);
var
  pos1:string;
begin
    form2.shape1.Refresh;
    pos1:= wm1.controls.currentPositionString;
    form2.shape1.Canvas.TextOut(0,7,pos1);
    if pos1 = '00:01' then
    begin
      wm1.settings.volume:=90;
    end;

end;

procedure TForm1.Timer5Timer(Sender: TObject);
begin
  timer5.Enabled:= false;
    if wm1.playState = 3 then
    begin
      wm1.controls.currentPosition:=0;
      wm1.fullScreen:= true;
    end;
end;

end.
