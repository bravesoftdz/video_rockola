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


unit Unit3;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  Tdm1 = class(TDataModule)
    dslist: TDataSource;
    Treport: TTable;
    Tlist: TTable;
    Database1: TDatabase;
    TlistCod: TIntegerField;
    TlistName: TStringField;
    TlistPathname: TStringField;
    TlistCortesia: TIntegerField;
    TlistVideo: TIntegerField;
    TlistKaraoke: TIntegerField;
    TlistMp3: TIntegerField;
    dsreport: TDataSource;
    TreportCod: TAutoIncField;
    TreportFecha: TDateField;
    TreportCantidad: TFloatField;
    TreportCosto: TFloatField;
    DSTCola: TDataSource;
    TCola: TTable;
    TColaCod: TIntegerField;
    TColaName: TStringField;
    TColaPathname: TStringField;
    TConfig: TTable;
    DSTconfig: TDataSource;
    TConfigCod: TIntegerField;
    TConfigCantidad: TIntegerField;
    TConfigCosto: TCurrencyField;
    TConfigVoldemo: TIntegerField;
    TConfigVolmaster: TIntegerField;
    DSTIndexChar: TDataSource;
    TIndexChar: TTable;
    TIndexCharCod: TIntegerField;
    TIndexCharLetra: TStringField;
    TlistLetraorden: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm1: Tdm1;

implementation

{$R *.dfm}


procedure Tdm1.DataModuleCreate(Sender: TObject);
begin

  Database1.Session.AddPassword('activex1');
  treport.Active:=true;
  Tlist.Active:=true;
  tcola.Active:= true;
  TConfig.Active:=true;
  TIndexChar.Active:=true;
end;

procedure Tdm1.DataModuleDestroy(Sender: TObject);
begin
  Treport.Active:=false;
  Tlist.Active:=false;
  tcola.Active:=false;
  tconfig.Active:=false;
  TIndexChar.Active:=false;
end;

end.
