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


unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, OleCtrls, WMPLib_TLB, jpeg, ExtCtrls, StdCtrls,
  FileCtrl, DBCtrls, MPlayer, SHDocVw, ShockwaveFlashObjects_TLB, Grids,
  DBGrids;

type
  TForm2 = class(TForm)
    wm2: TWindowsMediaPlayer;
    Label1: TLabel;
    Timer1: TTimer;
    shape1: TLabel;
    Timer2: TTimer;
    Timer3: TTimer;
    colalst: TDBLookupListBox;
    Timer4: TTimer;
    Timer5: TTimer;
    mp1: TMediaPlayer;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    sfl1: TShockwaveFlash;
    Timer6: TTimer;
    dblboxlist: TDBGrid;
    Timer7: TTimer;
    Panel1: TPanel;
    Timer8: TTimer;
    Label2: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure wm2StatusChange(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure Timer6Timer(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer7Timer(Sender: TObject);
    procedure Timer8Timer(Sender: TObject);
  private
    { Private declarations }
  public
    i11:integer;
     i111:integer;
    keyvideo:boolean;
    keymp3:boolean;
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit4,unit1, unit3, Unit5;

{$R *.dfm}

procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sw:boolean;
  i,i1:integer;
begin

if key = 83 then
begin
  timer2.Enabled:=false;
  timer5.Enabled:=false;
  wm2.controls.stop;
  form1.wm1.controls.stop;
  form1.Timer3.Enabled:= false;
  form1.Timer4.Enabled:=false;
  form4.Close;
end;

if key = 13 then
begin

  mp1.Stop;
  mp1.Play;
  mp1.Stop;
  mp1.Play;
  if (form1.wm1.playState = 1)or(form1.wm1.playState = 10)or(form1.wm1.playState = 0) then
  begin
  wm2.controls.stop;
  form1.wm1.Visible:=true;
  form1.wm1.URL:= dm1.TlistPathname.Value;
  form1.wm1.Visible:= true;
  form1.wm1.controls.play;
      form1.wm1.Align:= alClient;
  timer3.Enabled:=true;
  end;
  if form1.wm1.playState = 3 then
  begin
     dm1.TCola.Last;
     i1:= dm1.TColaCod.Value;
     dm1.TCola.Insert;
     dm1.TColaCod.Value:= i1 + 1;
     dm1.TColaName.Value:= dm1.TlistName.Value;
     dm1.TColaPathname.Value:= dm1.TlistPathname.Value;
     dm1.TCola.Post;
     dm1.TCola.First;
  end;
end;

if key = 27 then
begin
  form1.wm1.controls.stop;
  form1.wm1.Visible:= false;
  shape1.Caption:= 'Pedidos Tel. 70849789';
  if dm1.TCola.RecordCount > 0 then
  begin
    dm1.TCola.First;
    form1.wm1.URL:= dm1.TColaPathname.Value;
    form1.wm1.controls.play;
    form1.wm1.Align:= alClient;
    timer3.Enabled:=true;
    dm1.TCola.Delete;
    dm1.TCola.First;
  end;
end;
  if key = 34 then
  begin
    dm1.TIndexChar.Next;
    dm1.Tlist.RecNo:= dm1.TIndexCharCod.Value + 1;
  end;
  if key = 33 then
  begin
    dm1.TIndexChar.Prior;
    dm1.Tlist.RecNo:= dm1.TIndexCharCod.Value + 1;
  end;

  if key = 40 then
  begin
    dm1.Tlist.Next;
  end;
  if key = 38 then
  begin
    dm1.Tlist.Prior;
  end;

  if key = 77 then
  begin
    keymp3:=true;
    timer5.Enabled:=false;
    timer6.Enabled:=false;
    wm2.controls.stop;
    form4.Label7.Caption:='Karaoke:';
    form4.Button7.OnClick(self);
    label2.Caption:= 'MP3';
  end;

  if key = 86 then
  begin
    keyvideo:=true;
    timer5.Enabled:=false;
    timer6.Enabled:=false;
    wm2.controls.stop;
    form4.Label7.Caption:='Mp3:';
    form4.Button7.OnClick(self);
    label2.Caption:= 'VIDEO';
  end;

  if key = 75 then
  begin
    timer5.Enabled:=false;
    timer6.Enabled:=false;
    wm2.controls.stop;
    form4.Label7.Caption:='Video:';
    form4.Button7.OnClick(self);
    label2.Caption:= 'KARAOKE';
  end;

  if (keyvideo = true) and (keymp3 = true)and(panel1.Visible=false) then
  begin
    timer7.Enabled:=true;
    panel1.Caption:='Apagando Sistema...';
    i111:= 4;
    timer8.Enabled:=true;
    wm2.controls.stop;
    wm2.Visible:=false;
    panel1.Visible:=true;
    Panel1.Align:= alClient;
    form5.Image1.Refresh;
    form5.Image2.Refresh;
  end;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
var
  sw:boolean;
  i:integer;
begin
  timer1.Enabled:= false;
  timer4.Enabled:=true;
  colalst.RowCount:=4;
  sfl1.Left:= form2.Width - sfl1.Width;
  label1.Align:=altop;
  Label1.Align:= alnone;
  label2.Align:=alnone;
  dblboxlist.Align:= alnone;
  dblboxlist.Width:= dblboxlist.Width + 20;
  dblboxlist.Left:= 0;
  Shape1.Align:= alnone;
  shape1.Left:=0;
  colalst.Align:= alnone;
  colalst.Width:= colalst.Width + 20;
  colalst.Left:=0;
  dm1.Tlist.RecNo:= 5;
  wm2.URL:= dm1.TlistPathname.Value;
  dm1.Tlist.First;
  dm1.TCola.First;
  Shape5.Left:= shape1.Left - 20;
  Shape5.Width:= shape1.Width + 25;
  Shape5.Height:= shape1.Height;
  Shape5.Top:= shape1.Top;
  Shape5.Visible:= true;
  Shape2.Left:= dblboxlist.Left - 15;
  Shape2.Width:= dblboxlist.Width + 5;
  Shape2.Height:= dblboxlist.Height +10;
  Shape2.Top:= dblboxlist.Top - 5;
  Shape2.Visible:= true;
  Shape3.Left:= colalst.Left - 15;
  Shape3.Width:= colalst.Width + 5;
  Shape3.Top:= colalst.Top - 5;
  Shape3.Height:= colalst.Height + 30;
  Shape3.Visible:= true;
  Shape4.Left:= 0;
  Shape4.Top:= label1.Height;
  Shape4.Width:= label1.Width;
  Shape4.Visible:= true;
  wm2.Top:= label1.Height + 35;
  dblboxlist.Columns.Items[0].Width:= form2.ClientWidth + dblboxlist.Font.Height + 15;
  dm1.TIndexChar.First;
  sfl1.Top:= label1.Height + 5;
  sfl1.Height:= form2.Height-( Label2.Height + dblboxlist.Height + shape1.Height + colalst.Height+label1.Height+5);
  sfl1.Width:= sfl1.Width + 20;
  SetCursorPos((sfl1.Left+5),(sfl1.Top+5));
end;

procedure TForm2.wm2StatusChange(Sender: TObject);
begin
  if wm2.playState = 3 then
  begin
     form2.Refresh;
  end;
end;

procedure TForm2.Timer2Timer(Sender: TObject);
begin
  wm2.Repaint;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  keyvideo:=false;
  keymp3:=false;
end;

procedure TForm2.Timer3Timer(Sender: TObject);
begin
  timer3.Enabled:= false;
  if form1.wm1.playState = 3 then
  begin
    form1.wm1.controls.currentPosition:=0;
    form2.SetFocus;
  end;
end;

procedure TForm2.Timer4Timer(Sender: TObject);
var
  sw:boolean;
  i:integer;
begin
  timer4.Enabled:= false;
  if dm1.TCola.RecordCount > 0 then
  begin
    shape1.Caption:= 'Pedidos Tel. 70251147 - 70849789';
    dm1.TCola.First;
    form1.wm1.URL:= dm1.TColaPathname.Value;
    form1.wm1.controls.play;
    form1.wm1.Align:= alClient;
    timer3.Enabled:=true;
    dm1.TCola.Delete;
    dm1.TCola.First;
  end;
end;

procedure TForm2.Timer5Timer(Sender: TObject);
begin
  wm2.Top:= label1.Height + 35;
  if form1.wm1.playState = 3 then
  begin
    wm2.settings.volume:= 0;
  end
  else
  begin
    wm2.settings.volume:= 4;
  end;
    if wm2.playState = 3 then
    begin
      if wm2.controls.currentPositionString >= '00:10' then
      begin
        timer5.Enabled:= false;
        wm2.controls.stop;
        wm2.settings.volume:=0;
      end;
    end;
end;

procedure TForm2.Timer6Timer(Sender: TObject);
begin
  timer6.Enabled:=false;
  wm2.controls.stop;
  wm2.URL:= dm1.TlistPathname.Value;
  timer5.Enabled:=true;
end;

procedure TForm2.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 38) or (key = 40)or(key = 34) or (key = 33) then
  begin
    timer5.Enabled:=false;
    timer6.Enabled:=false;
    if form1.wm1.playState <> 3 then
    begin
      Timer6.Enabled:=true;
    end;
  end;
  if ((key = 77) or (key = 86)){and ((keymp3 = true)or(keyvideo = true))} then
  begin
    keymp3:=false;
    keyvideo:=false;
    timer7.Enabled:=false;
    timer8.Enabled:=false;
    Panel1.Visible:=false;
    wm2.controls.stop;
    wm2.Visible:=true;
  end;
end;

procedure TForm2.Timer7Timer(Sender: TObject);
begin
    timer2.Enabled:=false;
    timer5.Enabled:=false;
    wm2.controls.stop;
    form1.wm1.controls.stop;
    form1.Timer3.Enabled:= false;
    form1.Timer4.Enabled:=false;
    label1.Refresh;
    form4.Close;
end;

procedure TForm2.Timer8Timer(Sender: TObject);
begin
  if i111 > 0 then
  begin
    i111:= i111 - 1;
    Panel1.Caption:= 'Apagando Sistema... ' + inttostr(i111);
  end;
end;

end.
