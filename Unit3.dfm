object dm1: Tdm1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 806
  Top = 186
  Height = 403
  Width = 200
  object dslist: TDataSource
    DataSet = Tlist
    Left = 32
    Top = 72
  end
  object Treport: TTable
    DatabaseName = 'DBRockolin'
    SessionName = 'Default'
    TableName = 'report.db'
    TableType = ttParadox
    Left = 112
    Top = 152
    object TreportCod: TAutoIncField
      FieldName = 'Cod'
      ReadOnly = True
    end
    object TreportFecha: TDateField
      FieldName = 'Fecha'
    end
    object TreportCantidad: TFloatField
      FieldName = 'Cantidad'
    end
    object TreportCosto: TFloatField
      FieldName = 'Costo'
    end
  end
  object Tlist: TTable
    DatabaseName = 'DBRockolin'
    SessionName = 'Default'
    TableName = 'list.DB'
    TableType = ttParadox
    Left = 112
    Top = 72
    object TlistCod: TIntegerField
      FieldName = 'Cod'
    end
    object TlistName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object TlistPathname: TStringField
      FieldName = 'Pathname'
      Size = 255
    end
    object TlistCortesia: TIntegerField
      FieldName = 'Cortesia'
    end
    object TlistVideo: TIntegerField
      FieldName = 'Video'
    end
    object TlistKaraoke: TIntegerField
      FieldName = 'Karaoke'
    end
    object TlistMp3: TIntegerField
      FieldName = 'Mp3'
    end
    object TlistLetraorden: TStringField
      FieldName = 'Letraorden'
      Size = 1
    end
  end
  object Database1: TDatabase
    Connected = True
    DatabaseName = 'DBRockolin'
    DriverName = 'STANDARD'
    LoginPrompt = False
    Params.Strings = (
      'PATH=C:\Rockolintony'
      'DEFAULT DRIVER=PARADOX'
      'ENABLE BCD=FALSE'
      '')
    SessionName = 'Default'
    Left = 32
    Top = 16
  end
  object dsreport: TDataSource
    DataSet = Treport
    Left = 32
    Top = 152
  end
  object DSTCola: TDataSource
    DataSet = TCola
    Left = 32
    Top = 208
  end
  object TCola: TTable
    DatabaseName = 'DBRockolin'
    SessionName = 'Default'
    TableName = 'cola.db'
    TableType = ttParadox
    Left = 112
    Top = 208
    object TColaCod: TIntegerField
      FieldName = 'Cod'
    end
    object TColaName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object TColaPathname: TStringField
      FieldName = 'Pathname'
      Size = 255
    end
  end
  object TConfig: TTable
    DatabaseName = 'DBRockolin'
    SessionName = 'Default'
    TableName = 'config.DB'
    Left = 112
    Top = 264
    object TConfigCod: TIntegerField
      FieldName = 'Cod'
    end
    object TConfigCantidad: TIntegerField
      FieldName = 'Cantidad'
    end
    object TConfigCosto: TCurrencyField
      FieldName = 'Costo'
    end
    object TConfigVoldemo: TIntegerField
      FieldName = 'Voldemo'
    end
    object TConfigVolmaster: TIntegerField
      FieldName = 'Volmaster'
    end
  end
  object DSTconfig: TDataSource
    DataSet = TConfig
    Left = 32
    Top = 264
  end
  object DSTIndexChar: TDataSource
    DataSet = TIndexChar
    Left = 32
    Top = 320
  end
  object TIndexChar: TTable
    DatabaseName = 'DBRockolin'
    SessionName = 'Default'
    TableName = 'indexchar.db'
    Left = 112
    Top = 320
    object TIndexCharCod: TIntegerField
      FieldName = 'Cod'
    end
    object TIndexCharLetra: TStringField
      FieldName = 'Letra'
      Size = 1
    end
  end
end
