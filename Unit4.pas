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


unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, DBCtrls, ExtCtrls, Grids, DBGrids, ComCtrls,
  OleCtnrs, Menus;

type
  TForm4 = class(TForm)
    flb1: TFileListBox;
    Button1: TButton;
    Button2: TButton;
    dbchekcortesia: TDBCheckBox;
    Label1: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    Button3: TButton;
    Button4: TButton;
    DBLookupListBox1: TDBGrid;
    ProgressBar1: TProgressBar;
    Timer2: TTimer;
    Label3: TLabel;
    flb2: TFileListBox;
    flb3: TFileListBox;
    Button5: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Button6: TButton;
    Label6: TLabel;
    Label7: TLabel;
    Button7: TButton;
    MainMenu1: TMainMenu;
    Acercade1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Acercade1Click(Sender: TObject);
  private
    { Private declarations }
  public
    vpath: array [0..5] of string;
    kpath: array [0..5] of string;
    mpath: array [0..5] of string;
    i22:integer;
    swi1:integer;
    maxcount:integer;
    function GetHardDiskSerial(const DriveLetter: Char): string;
    procedure activatetables;
    procedure desactivatetables;

    { Public declarations }
  end;

var
  Form4: TForm4;
implementation
uses unit2,unit3, Unit6;
{$R *.dfm}
function tform4.GetHardDiskSerial(const DriveLetter: Char): string;
var
  NotUsed:     DWORD;
  VolumeFlags: DWORD;
  VolumeInfo:  array[0..MAX_PATH] of Char;
  VolumeSerialNumber: DWORD;
begin
  GetVolumeInformation(PChar(DriveLetter + ':\'),
    nil, SizeOf(VolumeInfo), @VolumeSerialNumber, NotUsed,
    VolumeFlags, nil, 0);
  Result := Format('%8.8X',
    [VolumeSerialNumber])
end;

procedure tform4.activatetables;
begin
  dm1.Tlist.Active:= true;
  dm1.Treport.Active:= true;
  dm1.TCola.Active:= true;
  dm1.TConfig.Active:=true;
  dm1.TIndexChar.Active:=true;
end;

procedure tform4.desactivatetables;
begin
  dm1.Tlist.Active:= false;
  dm1.Treport.Active:= false;
  dm1.TCola.Active:= false;
  dm1.TConfig.Active:=false;
  dm1.TIndexChar.Active:=false;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin

  maxcount:=0;
  swi1:= 0;
  i22:=0;

  timer1.Enabled:= true;

  vpath[0]:= 'c:\video\';
  vpath[1]:= 'd:\video\';
  vpath[2]:= 'e:\video\';
  vpath[3]:= 'f:\video\';
  vpath[4]:= 'k:\video\';
  vpath[5]:= 'i:\video\';

  kpath[0]:= 'c:\karaoke\';
  kpath[1]:= 'd:\karaoke\';
  kpath[2]:= 'e:\karaoke\';
  kpath[3]:= 'f:\karaoke\';
  kpath[4]:= 'k:\karaoke\';
  kpath[5]:= 'i:\karaoke\';

  mpath[0]:= 'c:\mp3\';
  mpath[1]:= 'd:\mp3\';
  mpath[2]:= 'e:\mp3\';
  mpath[3]:= 'f:\mp3\';
  mpath[4]:= 'k:\mp3\';
  mpath[5]:= 'i:\mp3\';

  flb1.Items.NameValueSeparator:= '.';
  flb1.Mask:= 'C:\video\*.mpg;D:\video\*.mpg;E:\video\*.mpg;F:\video\*.mpg;k:\video\*.mpg;i:\video\*.mpg;C:\video\*.flv;D:\video\*.flv;E:\video\*.flv;F:\video\*.flv;k:\video\*.flv;i:\video\*.flv';
  flb1.ItemIndex:= 0;

  flb2.Items.NameValueSeparator:= '.';
  flb2.Mask:= 'C:\mp3\*.mp3;D:\mp3\*.mp3;E:\mp3\*.mp3;F:\mp3\*.mp3;k:\mp3\*.mp3;i:\mp3\*.mp3;C:\mp3\*.wma;D:\mp3\*.wma;E:\mp3\*.wma;F:\mp3\*.wma;k:\mp3\*.wma;i:\mp3\*.wma';
  flb2.ItemIndex:= 0;

  flb3.Items.NameValueSeparator:= '.';
  flb3.Mask:= 'C:\karaoke\*.mpg;D:\karaoke\*.mpg;E:\karaoke\*.mpg;F:\karaoke\*.mpg;k:\karaoke\*.mpg;i:\karaoke\*.mpg;C:\karaoke\*.flv;D:\karaoke\*.flv;E:\karaoke\*.flv;F:\karaoke\*.flv;k:\karaoke\*.flv;i:\karaoke\*.flv';
  flb3.ItemIndex:= 0;

  form4.Width:= 368;

end;

procedure TForm4.Button1Click(Sender: TObject);
begin
  form2.timer1.Enabled:= true;
  form2.Visible:= true;
  form4.Visible:= false;
  showcursor(false);
end;

procedure TForm4.Button2Click(Sender: TObject);
var
  codlist,i,i2,codindexchar:integer;
  vp1:string;
  vp22: array [0..200] of integer;
begin


if flb1.Count > 0 then
begin

  desactivatetables;
  dm1.Tlist.TableName:= 'list';
  dm1.TIndexChar.TableName:= 'indexchar';

  activatetables;

  dbchekcortesia.Enabled:=false;
  Button2.Enabled:=false;
  Button1.Enabled:= false;
  Button5.Enabled:= false;
  Button6.Enabled:= false;
  timer2.Enabled:= true;

  ProgressBar1.Visible:= true;
  label3.Visible:= true;
  if dm1.Tlist.IsEmpty = false then
  begin
    desactivatetables;
    dm1.Tlist.EmptyTable;
    activatetables;
  end;
  if dm1.TIndexChar.IsEmpty = false then
  begin
    desactivatetables;
    dm1.TIndexChar.EmptyTable;
    activatetables;
  end;

  ProgressBar1.Max:= flb1.Count - 1;
  maxcount:=flb1.Count - 1;

  ProgressBar1.Position:= 0;
  for i:= 0 to maxcount do
  begin

    dm1.Tlist.Last;
    codlist:= dm1.TlistCod.Value;
    dm1.Tlist.Insert;
    dm1.TlistCod.Value:= codlist + 1;
    dm1.TlistVideo.Value:= 1;
    dm1.TlistName.Value:= flb1.Items.Names[i];
    Application.ProcessMessages;
    for i2:= 0 to 5 do
    begin
      if FileExists(vpath[i2] + flb1.Items.Strings[i]) then
      begin
        vp1:= vpath[i2] + flb1.Items.Strings[i];
      end;
    end;
    dm1.TlistPathname.Value:= vp1;
    dm1.Tlist.Post;
    if i < (flb1.Count - 1) then
    begin
      if UpperCase(flb1.Items.Names[i][1]) <> UpperCase(flb1.Items.Names[i+1][1]) then
      begin
        dm1.TIndexChar.Last;
        codindexchar:= dm1.Tindexcharcod.Value;
        dm1.Tindexchar.Insert;
        dm1.Tindexcharcod.Value:= i + 1;
        dm1.TIndexCharLetra.Value:= flb1.Items.Names[i][1];
        dm1.TIndexChar.Post;
      end;
    end;

    if i > ProgressBar1.Position then
    begin
      ProgressBar1.Position:= i + 2;
    end;
  end;
    dm1.Tlist.First;
end
else
begin
  ShowMessage('Carpeta Video Vacía!!!');
end;
end;

procedure TForm4.Timer1Timer(Sender: TObject);
var
  passwd:string;
begin
  passwd:= GetHardDiskSerial('c');
  if passwd = '084FBCB3' then
  begin
  i22:= i22 + 1;
  Label1.Caption:= inttostr(i22);

  label2.Visible:= true;
  label1.Visible:= true;
  button3.Visible:= true;
  button4.Visible:= true;

    if (strtoint(label1.Caption)) > 10 then
    begin
      timer1.Enabled:=false;
      form2.timer1.Enabled:= true;
      form2.Visible:= true;
      form4.Visible:= false;
      Button3.SetFocus;
        showcursor(false);
    end;
  end
  else
  begin
    close;
  end;

end;

procedure TForm4.Button3Click(Sender: TObject);
begin

  timer1.Enabled:=false;
  label2.Visible:=false;
  label1.Visible:=false;
  Button3.Visible:=false;
  Button4.Visible:=false;

  dbchekcortesia.Visible:=true;
  DBLookupListBox1.Visible:=true;
  Button2.Visible:=true;
  Button1.Visible:= true;
  Button5.Visible:= true;
  Button6.Visible:= true;
  Button7.Visible:= true;
  label4.Visible:=true;
  label5.Visible:=true;
  label6.Visible:=true;
  label7.Visible:=true;
  form4.Visible:= false;
  form4.Width:= form4.Width + (600 - form4.Width);
  form4.Position:= poScreenCenter;
  form4.Visible:=true;

  ProgressBar1.Width:= (form4.ClientWidth - DBLookupListBox1.Width)-15;
  label3.Width:= ProgressBar1.Width;
  acercade1.Visible:=true;
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
  timer1.Enabled:=false;
  form2.timer1.Enabled:= true;
  form2.Visible:= true;
  form4.Visible:= false;
  showcursor(false);

end;

procedure TForm4.Timer2Timer(Sender: TObject);
begin

  swi1:= swi1 + 1;
  if label3.Visible = false then
  begin
    label3.Visible:= true;
    label3.Repaint;
  end
  else
  begin
    label3.Visible:= false;
  end;

  if ProgressBar1.Position >= (flb1.Count - 3) then
  begin
    timer2.Enabled:= false;
    label3.Visible:= false;
    Button2.Enabled:= true;
    Button1.Enabled:= true;
    Button5.Enabled:= true;
    Button6.Enabled:= true;
    dbchekcortesia.Enabled:= true;
    ProgressBar1.Visible:=false;
  end;
  if ProgressBar1.Position >= (flb2.Count - 3) then
  begin
    timer2.Enabled:= false;
    label3.Visible:= false;
    Button2.Enabled:= true;
    Button1.Enabled:= true;
    Button5.Enabled:= true;
    Button6.Enabled:= true;
    dbchekcortesia.Enabled:= true;
    ProgressBar1.Visible:=false;
  end;
  if ProgressBar1.Position >= (flb3.Count - 3) then
  begin
    timer2.Enabled:= false;
    label3.Visible:= false;
    Button2.Enabled:= true;
    Button1.Enabled:= true;
    Button5.Enabled:= true;
    Button6.Enabled:= true;
    dbchekcortesia.Enabled:= true;
    ProgressBar1.Visible:=false;
  end;
end;

procedure TForm4.Button5Click(Sender: TObject);
var
  codlist,i,i2,codindexchar:integer;
  vp1:string;
  vp22: array [0..200] of integer;
begin


if flb2.Count > 0 then
begin
  desactivatetables;

  dm1.Tlist.TableName:= 'listmp3';
  dm1.TIndexChar.TableName:= 'indexcharmp3';

  activatetables;

  dbchekcortesia.Enabled:=false;
  Button2.Enabled:=false;
  Button1.Enabled:= false;
  Button5.Enabled:= false;
  Button6.Enabled:= false;
  timer2.Enabled:= true;

  ProgressBar1.Visible:= true;
  label3.Visible:= true;
  if dm1.Tlist.IsEmpty = false then
  begin
    desactivatetables;
    dm1.Tlist.EmptyTable;
    activatetables;
  end;
  if dm1.TIndexChar.IsEmpty = false then
  begin
    desactivatetables;
    dm1.TIndexChar.EmptyTable;
    activatetables;
  end;

  ProgressBar1.Max:= flb2.Count - 1;
  maxcount:=flb2.Count - 1;
  ProgressBar1.Position:=0;
  for i:= 0 to maxcount do
  begin

    dm1.Tlist.Last;
    codlist:= dm1.TlistCod.Value;
    dm1.Tlist.Insert;
    dm1.TlistCod.Value:= codlist + 1;
    dm1.TlistMp3.Value:= 1;
    dm1.TlistName.Value:= flb2.Items.Names[i];
    Application.ProcessMessages;
    for i2:= 0 to 5 do
    begin
      if FileExists(mpath[i2] + flb2.Items.Strings[i]) then
      begin
        vp1:= mpath[i2] + flb2.Items.Strings[i];
      end;
    end;
    dm1.TlistPathname.Value:= vp1;
    dm1.Tlist.Post;

    if i < (flb2.Count - 1) then
    begin
      if UpperCase(flb2.Items.Names[i][1]) <> UpperCase(flb2.Items.Names[i+1][1]) then
      begin
        dm1.TIndexChar.Last;
        codindexchar:= dm1.Tindexcharcod.Value;
        dm1.Tindexchar.Insert;
        dm1.Tindexcharcod.Value:= i + 1;
        dm1.TIndexCharLetra.Value:= flb2.Items.Names[i][1];
        dm1.TIndexChar.Post;
      end;
    end;

    if i > ProgressBar1.Position then
    begin
      ProgressBar1.Position:= i + 2;
    end;
  end;
    dm1.Tlist.First;
end
else
begin
  ShowMessage('Carpeta MP3 Vacía!!!');
end;
end;

procedure TForm4.Button6Click(Sender: TObject);
var
  codlist,i,i2,codindexchar:integer;
  vp1:string;
  vp22: array [0..200] of integer;
begin


if flb3.Count > 0 then
begin
  desactivatetables;
  dm1.Tlist.TableName:= 'listkaraoke';
  dm1.TIndexChar.TableName:= 'indexcharkaraoke';
  activatetables;
  dbchekcortesia.Enabled:=false;
  Button2.Enabled:=false;
  Button1.Enabled:= false;
  Button5.Enabled:= false;
  Button6.Enabled:= false;
  timer2.Enabled:= true;
  ProgressBar1.Visible:= true;
  label3.Visible:= true;
  if dm1.Tlist.IsEmpty = false then
  begin
    desactivatetables;
    dm1.Tlist.EmptyTable;
    activatetables;
  end;
  if dm1.TIndexChar.IsEmpty = false then
  begin
    desactivatetables;
    dm1.TIndexChar.EmptyTable;
    activatetables;
  end;
  ProgressBar1.Max:= flb3.Count - 1;
  maxcount:=flb3.Count - 1;
  ProgressBar1.Position:=0;
  for i:= 0 to maxcount do
  begin
    dm1.Tlist.Last;
    codlist:= dm1.TlistCod.Value;
    dm1.Tlist.Insert;
    dm1.TlistCod.Value:= codlist + 1;
    dm1.Tlistkaraoke.Value:= 1;
    dm1.TlistName.Value:= flb3.Items.Names[i];
    Application.ProcessMessages;
    for i2:= 0 to 5 do
    begin
      if FileExists(kpath[i2] + flb3.Items.Strings[i]) then
      begin
        vp1:= kpath[i2] + flb3.Items.Strings[i];
      end;
    end;
    dm1.TlistPathname.Value:= vp1;
    dm1.Tlist.Post;
    if i < (flb3.Count - 1) then
    begin
      if UpperCase(flb3.Items.Names[i][1]) <> UpperCase(flb3.Items.Names[i+1][1]) then
      begin
        dm1.TIndexChar.Last;
        codindexchar:= dm1.Tindexcharcod.Value;
        dm1.Tindexchar.Insert;
        dm1.Tindexcharcod.Value:= i + 1;
        dm1.TIndexCharLetra.Value:= flb2.Items.Names[i][1];
        dm1.TIndexChar.Post;
      end;
    end;

    if i > ProgressBar1.Position then
    begin
      ProgressBar1.Position:= i + 2;
    end;
  end;
    dm1.Tlist.First;
end
else
begin
  ShowMessage('Carpeta Karaoke Vacía!!!');
end;
end;

procedure TForm4.Button7Click(Sender: TObject);
begin
  if Label7.Caption = 'Video:' then
  begin
    label7.Caption:= 'Karaoke:';
    desactivatetables;
    dm1.Tlist.TableName:= 'listkaraoke';
    dm1.TIndexChar.TableName:= 'indexcharkaraoke';
    activatetables;
  end
  else
  begin
    if label7.Caption = 'Karaoke:' then
    begin
      label7.Caption:= 'Mp3:';
      desactivatetables;
      dm1.Tlist.TableName:= 'listmp3';
      dm1.TIndexChar.TableName:= 'indexcharmp3';
      activatetables;
    end
    else
    begin
      if label7.Caption = 'Mp3:' then
      begin
        label7.Caption:= 'Video:';
        desactivatetables;
        dm1.Tlist.TableName:= 'list';
        dm1.TIndexChar.TableName:= 'indexchar';
        activatetables;
      end;
    end;
  end;
end;

procedure TForm4.Acercade1Click(Sender: TObject);
begin
  form6.ShowModal;
end;

end.


