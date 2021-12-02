object Kavling: TKavling
  Left = 196
  Top = 111
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Kavling'
  ClientHeight = 441
  ClientWidth = 1150
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clNavy
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnMouseMove = FormMouseMove
  OnShow = FormShow
  DesignSize = (
    1150
    441)
  PixelsPerInch = 96
  TextHeight = 14
  object Label5: TLabel
    Left = 180
    Top = 163
    Width = 17
    Height = 14
    Caption = 'm2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 19
    Top = 163
    Width = 85
    Height = 14
    Caption = 'Luas Tanah Std'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object pnlButton: TPanel
    Left = 0
    Top = 7
    Width = 1150
    Height = 34
    Align = alTop
    BevelOuter = bvLowered
    Color = 16244694
    TabOrder = 0
    object Label16: TLabel
      Left = 405
      Top = 9
      Width = 37
      Height = 14
      Caption = 'Proyek'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 729
      Top = 9
      Width = 24
      Height = 14
      Caption = 'Tipe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object bNew: TdxButton
      Left = 8
      Top = 4
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = bNewClick
      Caption = '&Baru'
      TabOrder = 0
    end
    object bEdit: TdxButton
      Left = 89
      Top = 4
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = bEditClick
      Caption = '&Edit'
      TabOrder = 1
    end
    object bDel: TdxButton
      Left = 170
      Top = 4
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = bDelClick
      Caption = '&Hapus'
      TabOrder = 2
    end
    object cbLProyek: TwwDBLookupCombo
      Left = 446
      Top = 7
      Width = 247
      Height = 20
      Hint = 'Backspace/Del --> Hapus filter'
      BorderStyle = bsNone
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NamaProyek'#9'30'#9'NamaProyek'#9'F')
      LookupTable = FDMC.tProyek
      LookupField = 'IdProyek'
      Style = csDropDownList
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      AutoDropDown = True
      ShowButton = False
      PreciseEditRegion = False
      AllowClearKey = True
      OnChange = cbLProyekChange
    end
    object cbLType: TwwDBLookupCombo
      Left = 758
      Top = 7
      Width = 139
      Height = 20
      Hint = 'Backspace/Del --> Hapus filter'
      BorderStyle = bsNone
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NamaType'#9'14'#9'NamaType'#9'F')
      LookupTable = FDMC.tTipe
      LookupField = 'IdType'
      Style = csDropDownList
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      AutoDropDown = True
      ShowButton = False
      PreciseEditRegion = False
      AllowClearKey = True
      OnChange = cbLTypeChange
    end
    object bT1: TdxButton
      Left = 250
      Top = 4
      Width = 87
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = bT1Click
      Caption = ' &Export '
      TabOrder = 5
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000C40E0000C40E00000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F60808080808
        080808080808080808F6F5080808080808F6F50808080808070808FFF6F6F608
        080808B50808F6FF080808FFF50808B576AD083434BE08FF0808081AF6AD6D08
        7576F608FFF608F60808F77408BE08F6F6FFFFF6B56CFF08080808B5B6FFF6F6
        08AB64F63434F608080808BE6CFF6C752B19BEFFF6FFFF08B50808086BF6FF08
        226BF6FF086C6BF6F50808F66B08FF6C2B7C34070834BEFFB50807F675B5F66C
        F6FFFFFFFFFFF6F6080807BFB675FFFFF6BFB7BEB5B56D64080808F6B675B575
        75B5B5B5B6B6B564F60807FFB5B6B6B6BEBEBEBEBEBEBD1AF60808FFF608BFBE
        08BEBEBF080808F60808F708080707F50707070808070707F5F6}
    end
  end
  object dbgData: TDBGridEh
    Left = 0
    Top = 41
    Width = 1150
    Height = 400
    Align = alClient
    AllowedOperations = []
    AllowedSelections = []
    BorderStyle = bsNone
    DataSource = FDMC.dstKavling
    DynProps = <>
    EvenRowColor = clWindow
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    FrozenCols = 2
    HorzScrollBar.ExtraPanel.Visible = True
    HorzScrollBar.ExtraPanel.NavigatorButtons = [nbFirstEh, nbPriorEh, nbNextEh, nbLastEh]
    HorzScrollBar.ExtraPanel.VisibleItems = [gsbiRecordsInfoEh, gsbiNavigator]
    IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
    OddRowColor = clWindow
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
    OptionsEh = [dghHighlightFocus, dghClearSelection, dghDblClickOptimizeColWidth, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
    ParentFont = False
    ReadOnly = True
    SearchPanel.Enabled = True
    SearchPanel.ShortCut = 0
    STFilter.InstantApply = False
    STFilter.FilterButtonDrawTime = fbdtWhenCellHotEh
    TabOrder = 1
    TitleParams.RowLines = 3
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'ProTip'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Proyek - Tipe'
        Width = 350
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'KodeKavling'
        Footers = <>
        Title.Alignment = taCenter
        Width = 49
      end
      item
        DisplayFormat = '#,#,0'
        DynProps = <>
        EditButtons = <>
        FieldName = 'HAJBPlan'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'H. AJB'#13#10'Rencana'
        Width = 115
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'RC'
        Footers = <>
        Title.Alignment = taCenter
        Width = 42
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'IdType'
        Footers = <>
        Title.Alignment = taCenter
        Visible = False
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PosisiRumah'
        Footers = <>
        Title.Alignment = taCenter
        Width = 55
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'NIBSplit'
        Footers = <>
        Title.Alignment = taCenter
        Width = 46
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'SHMSplit'
        Footers = <>
        Title.Alignment = taCenter
        Width = 57
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'LuasBangunan'
        Footers = <>
        Title.Alignment = taCenter
      end
      item
        Alignment = taCenter
        DisplayFormat = '#,#,0'
        DynProps = <>
        EditButtons = <>
        FieldName = 'LuasTanahStandar'
        Footers = <>
        Title.Alignment = taCenter
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'LuasTanahBPN'
        Footers = <>
        Title.Alignment = taCenter
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'LebihKurangLuas'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Luas Lebih Kurang '
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'PersentaseProgres'
        Footers = <>
        Title.Alignment = taCenter
        Width = 50
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'KeteranganProgres'
        Footers = <>
        Title.Alignment = taCenter
        Width = 92
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'InputTime'
        Footers = <>
        Title.Alignment = taCenter
        Width = 115
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'OptId'
        Footers = <>
        Title.Alignment = taCenter
        Visible = False
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pInput: TPanel
    Left = 23
    Top = 135
    Width = 724
    Height = 242
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvSpace
    BevelOuter = bvSpace
    Color = 14985086
    UseDockManager = False
    DockSite = True
    TabOrder = 2
    Visible = False
    OnMouseDown = pInputMouseDown
    OnMouseMove = FormMouseMove
    OnMouseUp = pInputMouseUp
    object Llbl1: TLabel
      Left = 19
      Top = 19
      Width = 69
      Height = 14
      Caption = 'Kode Kavling'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Llbl6: TLabel
      Left = 19
      Top = 43
      Width = 66
      Height = 14
      Caption = 'Proyek/Tipe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Llbl8: TLabel
      Left = 19
      Top = 67
      Width = 28
      Height = 14
      Caption = 'Posisi'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Llbl13: TLabel
      Left = 19
      Top = 91
      Width = 46
      Height = 14
      Caption = 'NIB Split'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Llbl14: TLabel
      Left = 19
      Top = 115
      Width = 51
      Height = 14
      Caption = 'SHM Split'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 19
      Top = 139
      Width = 82
      Height = 14
      Caption = 'Luas Bangunan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 251
      Top = 139
      Width = 85
      Height = 14
      Caption = 'Luas Tanah Std'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 19
      Top = 163
      Width = 88
      Height = 14
      Caption = 'Luas Tanah BPN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 237
      Top = 163
      Width = 99
      Height = 14
      Caption = 'Luas Lebih Kurang'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 19
      Top = 187
      Width = 41
      Height = 14
      Caption = 'Progres'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 18
      Top = 211
      Width = 87
      Height = 14
      Caption = 'Catatan Progres'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 179
      Top = 187
      Width = 12
      Height = 14
      Caption = '%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 179
      Top = 163
      Width = 17
      Height = 14
      Caption = 'm2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 179
      Top = 139
      Width = 17
      Height = 14
      Caption = 'm2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 403
      Top = 139
      Width = 17
      Height = 14
      Caption = 'm2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 403
      Top = 163
      Width = 17
      Height = 14
      Caption = 'm2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 229
      Top = 187
      Width = 108
      Height = 14
      Caption = 'H. AJB Rencana Rp.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 267
      Top = 19
      Width = 81
      Height = 14
      Caption = 'Rumah Contoh'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbProyek: TwwDBLookupCombo
      Left = 118
      Top = 40
      Width = 344
      Height = 20
      BorderStyle = bsNone
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'ProTip'#9'100'#9'ProTip'#9'F')
      DataField = 'IdType'
      DataSource = FDMC.dsqMKavling
      LookupTable = FDMC.tTipe
      LookupField = 'IdType'
      Style = csDropDownList
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = False
      PreciseEditRegion = False
      AllowClearKey = True
      OnCloseUp = cbProyekCloseUp
      OnEnter = cbProyekEnter
      OnExit = cbProyekExit
      OnKeyDown = EnterToTab
    end
    object eNIB: TwwDBEdit
      Left = 118
      Top = 88
      Width = 99
      Height = 20
      AutoFillDate = False
      BorderStyle = bsNone
      DataField = 'NIBSplit'
      DataSource = FDMC.dsqMKavling
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnEnter = eNIBEnter
      OnExit = eNIBExit
    end
    object bCancel: TdxButton
      Left = 388
      Top = 84
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = bCancelClick
      Caption = 'Ba&tal'
      TabOrder = 12
    end
    object bSave: TdxButton
      Left = 308
      Top = 84
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = bSaveClick
      Caption = '&Simpan'
      TabOrder = 11
    end
    object eKodeKav: TwwDBEdit
      Left = 118
      Top = 16
      Width = 99
      Height = 20
      BorderStyle = bsNone
      DataField = 'KodeKavling'
      DataSource = FDMC.dsqMKavling
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnEnter = eKodeKavEnter
      OnExit = eKodeKavExit
      OnKeyDown = EnterToTab
    end
    object eSHM: TwwDBEdit
      Left = 118
      Top = 112
      Width = 180
      Height = 20
      AutoFillDate = False
      BorderStyle = bsNone
      DataField = 'SHMSplit'
      DataSource = FDMC.dsqMKavling
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object eLB: TwwDBSpinEdit
      Left = 118
      Top = 136
      Width = 59
      Height = 20
      Increment = 1.000000000000000000
      MaxValue = 9999.000000000000000000
      BorderStyle = bsNone
      DataField = 'LuasBangunan'
      DataSource = FDMC.dsqMKavling
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 5
      UnboundDataType = wwDefault
      OnEnter = eLBEnter
      OnExit = eLBExit
      OnKeyDown = EnterToTab
    end
    object cbPosisi: TwwDBComboBox
      Left = 119
      Top = 64
      Width = 98
      Height = 20
      ShowButton = False
      Style = csDropDownList
      MapList = False
      AllowClearKey = True
      AutoDropDown = True
      BorderStyle = bsNone
      DataField = 'PosisiRumah'
      DataSource = FDMC.dsqMKavling
      DropDownCount = 8
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      ItemHeight = 0
      Items.Strings = (
        'Sudut')
      Sorted = False
      TabOrder = 2
      UnboundDataType = wwDefault
      OnCloseUp = cbPosisiCloseUp
      OnEnter = cbPosisiEnter
      OnExit = cbPosisiExit
    end
    object eLBPN: TwwDBSpinEdit
      Left = 118
      Top = 160
      Width = 59
      Height = 20
      Increment = 1.000000000000000000
      MaxValue = 9999.000000000000000000
      BorderStyle = bsNone
      DataField = 'LuasTanahBPN'
      DataSource = FDMC.dsqMKavling
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 7
      UnboundDataType = wwDefault
      OnEnter = eLBPNEnter
      OnExit = eLBPNExit
      OnKeyDown = EnterToTab
    end
    object eLSelisih: TwwDBSpinEdit
      Left = 342
      Top = 160
      Width = 59
      Height = 20
      Increment = 1.000000000000000000
      MaxValue = 9999.000000000000000000
      MinValue = -999.000000000000000000
      BorderStyle = bsNone
      DataField = 'LebihKurangLuas'
      DataSource = FDMC.dsqMKavling
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 8
      UnboundDataType = wwDefault
      OnEnter = eLSelisihEnter
      OnExit = eLSelisihExit
      OnKeyDown = EnterToTab
    end
    object eLSTD: TwwDBSpinEdit
      Left = 342
      Top = 136
      Width = 59
      Height = 20
      Increment = 1.000000000000000000
      MaxValue = 9999.000000000000000000
      BorderStyle = bsNone
      DataField = 'LuasTanahStandar'
      DataSource = FDMC.dsqMKavling
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 6
      UnboundDataType = wwDefault
      OnEnter = eLSTDEnter
      OnExit = eLSTDExit
      OnKeyDown = EnterToTab
    end
    object eProgres: TwwDBSpinEdit
      Left = 118
      Top = 184
      Width = 59
      Height = 20
      Increment = 1.000000000000000000
      MaxValue = 100.000000000000000000
      BorderStyle = bsNone
      DataField = 'PersentaseProgres'
      DataSource = FDMC.dsqMKavling
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 9
      UnboundDataType = wwDefault
      OnEnter = eProgresEnter
      OnExit = eProgresExit
      OnKeyDown = EnterToTab
    end
    object eKeterangan: TwwDBComboBox
      Left = 118
      Top = 208
      Width = 124
      Height = 20
      ShowButton = False
      Style = csDropDownList
      MapList = False
      AllowClearKey = False
      AutoDropDown = True
      BorderStyle = bsNone
      DataField = 'KeteranganProgres'
      DataSource = FDMC.dsqMKavling
      DropDownCount = 8
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      ItemHeight = 0
      Items.Strings = (
        'KAVLING'
        'PONDASI'
        'SLOOF'
        'RUMAH')
      Sorted = False
      TabOrder = 10
      UnboundDataType = wwDefault
      OnCloseUp = eKeteranganCloseUp
      OnEnter = eKeteranganEnter
      OnExit = eKeteranganExit
      OnKeyDown = EnterToTab
    end
    object eAJB: TwwDBEdit
      Left = 342
      Top = 184
      Width = 120
      Height = 20
      AutoFillDate = False
      BorderStyle = bsNone
      DataField = 'HAJBPlan'
      DataSource = FDMC.dsqMKavling
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 13
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnEnter = eNIBEnter
      OnExit = eNIBExit
    end
    object cbRC: TwwDBComboBox
      Left = 363
      Top = 16
      Width = 98
      Height = 20
      ShowButton = False
      Style = csDropDownList
      MapList = True
      AllowClearKey = True
      AutoDropDown = True
      BorderStyle = bsNone
      DataField = 'IsContoh'
      DataSource = FDMC.dsqMKavling
      DropDownCount = 8
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      ItemHeight = 0
      Items.Strings = (
        'Ya'#9'Y'
        'Tidak'#9'T')
      Sorted = False
      TabOrder = 14
      UnboundDataType = wwDefault
      OnCloseUp = cbRCCloseUp
      OnEnter = cbRCEnter
      OnExit = cbRCExit
    end
  end
  object pTopBorder: TPanel
    Left = 0
    Top = 0
    Width = 1150
    Height = 7
    Align = alTop
    BevelOuter = bvNone
    Color = 14985086
    TabOrder = 3
  end
  object mxDataSetExport1: TmxDataSetExport
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'h:mm'
    DateTimeFormat = 'h:mm dd/MM/yyyy'
    ExportType = xtExcel
    ExportTypes = [xtExcel]
    ExportStyle = xsFile
    HTML.CustomColors.Background = clWhite
    HTML.CustomColors.DefaultLink = clRed
    HTML.CustomColors.DefaultFontFace = 'Arial,Helvetica'
    HTML.CustomColors.VisitedLink = clAqua
    HTML.CustomColors.ActiveLink = clBlue
    HTML.CustomColors.DefaultText = clBlack
    HTML.CustomColors.TableFontColor = clBlack
    HTML.CustomColors.TableFontFace = 'Arial,Helvetica'
    HTML.CustomColors.TableBackground = 16777167
    HTML.CustomColors.TableOddBackground = clWhite
    HTML.CustomColors.HeaderBackground = 3368601
    HTML.CustomColors.HeadersFontColor = clWhite
    HTML.Options = [hoShowGridLines, hoBoldHeaders, hoAutoLink, hoOddRowColoring, hoDisplayTitle]
    HTML.Template = ctStandard
    Messages.Caption = 'Exporting DataSet'
    Messages.CopiedToClipboard = 'Data was copied to clipboard!'
    Messages.CancelCaption = '&Cancel'
    Messages.CreatedText = 'Created:'
    Messages.DocumentFilter.HTML = 'HTML Documents'
    Messages.DocumentFilter.Excel = 'Excel Files'
    Messages.DocumentFilter.Word = 'Word Documents'
    Messages.DocumentFilter.Text = 'Text Files'
    Messages.DocumentFilter.Comma = 'CSV (Comma delimited)'
    Messages.DocumentFilter.Tab = 'Text (Tab delimited)'
    Messages.DocumentFilter.RTF = 'Rich Text Format'
    Messages.DocumentFilter.DIF = 'Data Interchange Format'
    Messages.DocumentFilter.SYLK = 'SYLK Files'
    Messages.ExportCaption = '&Export'
    Messages.ExportToFile = 'Export &to file'
    Messages.FalseText = 'False'
    Messages.Height = 80
    Messages.SaveTitle = 'Save document'
    Messages.SelectFormat = 'E&xport formats:'
    Messages.Text = 'Processing...'
    Messages.TrueText = 'True'
    Messages.Width = 300
    Messages.ViewOnly = '&View only'
    TruncateSymbol = '...'
    RowNumberFormat = '%d'
    DOC_RTF.Template = rtStandard
    DOC_RTF.Options = [roShowGridLines, roOddRowColoring]
    DOC_RTF.CustomSettings.TableBackground = 16777167
    DOC_RTF.CustomSettings.TableOddBackground = clWhite
    DOC_RTF.CustomSettings.HeaderBackground = 3368601
    DOC_RTF.CustomSettings.DefaultFont.Charset = DEFAULT_CHARSET
    DOC_RTF.CustomSettings.DefaultFont.Color = clWindowText
    DOC_RTF.CustomSettings.DefaultFont.Height = -11
    DOC_RTF.CustomSettings.DefaultFont.Name = 'MS Sans Serif'
    DOC_RTF.CustomSettings.DefaultFont.Style = []
    DOC_RTF.CustomSettings.HeaderFont.Charset = DEFAULT_CHARSET
    DOC_RTF.CustomSettings.HeaderFont.Color = clWindowText
    DOC_RTF.CustomSettings.HeaderFont.Height = -11
    DOC_RTF.CustomSettings.HeaderFont.Name = 'MS Sans Serif'
    DOC_RTF.CustomSettings.HeaderFont.Style = [fsBold]
    DOC_RTF.CustomSettings.TableFont.Charset = DEFAULT_CHARSET
    DOC_RTF.CustomSettings.TableFont.Color = clWindowText
    DOC_RTF.CustomSettings.TableFont.Height = -11
    DOC_RTF.CustomSettings.TableFont.Name = 'MS Sans Serif'
    DOC_RTF.CustomSettings.TableFont.Style = []
    DOC_RTF.CellWidth = 1400
    DOC_RTF.TopMargin = 101
    DOC_RTF.BottomMargin = 101
    DOC_RTF.LeftMargin = 461
    DOC_RTF.RightMargin = 562
    EXCEL.Options = [reSetMargins, reUseBorders]
    EXCEL.ColumnWidth = 20
    EXCEL.Protected = False
    EXCEL.Footer = '&P'
    EXCEL.ExcelVersion = xls21
    EXCEL.DefaultFont.Charset = DEFAULT_CHARSET
    EXCEL.DefaultFont.Color = clWindowText
    EXCEL.DefaultFont.Height = -11
    EXCEL.DefaultFont.Name = 'MS Sans Serif'
    EXCEL.DefaultFont.Style = []
    EXCEL.HeaderFont.Charset = DEFAULT_CHARSET
    EXCEL.HeaderFont.Color = clWindowText
    EXCEL.HeaderFont.Height = -11
    EXCEL.HeaderFont.Name = 'MS Sans Serif'
    EXCEL.HeaderFont.Style = [fsBold]
    EXCEL.TableFont.Charset = DEFAULT_CHARSET
    EXCEL.TableFont.Color = clWindowText
    EXCEL.TableFont.Height = -11
    EXCEL.TableFont.Name = 'MS Sans Serif'
    EXCEL.TableFont.Style = []
    EXCEL.TopMargin = 0.300000000000000000
    EXCEL.BottomMargin = 0.300000000000000000
    EXCEL.LeftMargin = 0.300000000000000000
    EXCEL.RightMargin = 0.300000000000000000
    Options = [xoClipboardMessage, xoShowHeader, xoShowProgress, xoUseAlignments]
    Version = '2.38'
    DataSet = FDMC.tHarga
    Left = 280
    Top = 39
  end
end
