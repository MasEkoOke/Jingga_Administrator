object Harga: THarga
  Left = 206
  Top = 125
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Parameter Harga'
  ClientHeight = 441
  ClientWidth = 1143
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
    1143
    441)
  PixelsPerInch = 96
  TextHeight = 14
  object pnlButton: TPanel
    Left = 0
    Top = 7
    Width = 1143
    Height = 34
    Align = alTop
    BevelOuter = bvLowered
    Color = 16244694
    TabOrder = 0
    object Label28: TLabel
      Left = 349
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
    object Label29: TLabel
      Left = 653
      Top = 9
      Width = 47
      Height = 14
      Caption = 'Revisi Ke'
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
      Left = 88
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
      Left = 169
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
      Left = 390
      Top = 7
      Width = 247
      Height = 20
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
      TabOrder = 3
      AutoDropDown = True
      ShowButton = False
      PreciseEditRegion = False
      AllowClearKey = True
      OnChange = cbLProyekChange
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
      TabOrder = 4
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
    object cblRev: TwwDBLookupCombo
      Left = 710
      Top = 6
      Width = 75
      Height = 20
      BorderStyle = bsNone
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'RevisiKe'#9'4'#9'RevisiKe'#9'F')
      LookupTable = FDMC.qLRevKe
      LookupField = 'RevisiKe'
      Style = csDropDownList
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 5
      AutoDropDown = True
      ShowButton = False
      PreciseEditRegion = False
      AllowClearKey = True
      OnChange = cblRevChange
    end
  end
  object dbgData: TDBGridEh
    Left = 0
    Top = 41
    Width = 1143
    Height = 400
    Align = alClient
    AllowedOperations = []
    AutoFitColWidths = True
    BorderStyle = bsNone
    DataSource = FDMC.dstHarga
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
    HorzScrollBar.ExtraPanel.NavigatorButtons = [nbFirstEh, nbPriorEh, nbNextEh, nbLastEh, nbRefreshEh]
    HorzScrollBar.ExtraPanel.VisibleItems = [gsbiRecordsInfoEh, gsbiNavigator]
    IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
    OddRowColor = clWindow
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDblClickOptimizeColWidth, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
    ParentFont = False
    ReadOnly = True
    SearchPanel.Enabled = True
    TabOrder = 1
    TitleParams.Font.Charset = DEFAULT_CHARSET
    TitleParams.Font.Color = clNavy
    TitleParams.Font.Height = -12
    TitleParams.Font.Name = 'Tahoma'
    TitleParams.Font.Style = []
    TitleParams.ParentFont = False
    TitleParams.RowLines = 2
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
        FieldName = 'RevisiKe'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Revisi'#13#10'Ke'
        Width = 40
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
        FieldName = 'HargaSatuanBangunan'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Harga Bangunan'
        Width = 80
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'HargaSatuanTanah'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Harga Tanah'
        Width = 80
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'HargaSatuanLebihKurang'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Harga Selisih Tanah'
        Width = 80
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'TambahanDiskon'
        Footers = <>
        Title.Alignment = taCenter
      end
      item
        DisplayFormat = '#,#,0'
        DynProps = <>
        EditButtons = <>
        FieldName = 'HargaJualStd'
        Footers = <>
        Title.Alignment = taCenter
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'HargaMembangun'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Harga Pelaksanaan'
        Width = 80
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'DiscountTunai'
        Footers = <>
        Title.Alignment = taCenter
        Visible = False
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'Keterangan'
        Footers = <>
        Title.Alignment = taCenter
        Width = 150
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'InputTime'
        Footers = <>
        Title.Alignment = taCenter
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
    Top = 111
    Width = 725
    Height = 218
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
    object Llbl6: TLabel
      Left = 389
      Top = 115
      Width = 21
      Height = 14
      Alignment = taRightJustify
      Caption = 'PPh'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Llbl8: TLabel
      Left = 19
      Top = 187
      Width = 63
      Height = 14
      Caption = 'Keterangan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 19
      Top = 43
      Width = 47
      Height = 14
      Caption = 'Revisi Ke'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 19
      Top = 67
      Width = 70
      Height = 14
      Caption = 'H. Bangunan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 19
      Top = 91
      Width = 50
      Height = 14
      Caption = 'H. Tanah'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 19
      Top = 115
      Width = 86
      Height = 14
      Caption = 'H. Selisih Tanah'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 19
      Top = 139
      Width = 96
      Height = 14
      Caption = 'Tambahan Diskon'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 205
      Top = 67
      Width = 22
      Height = 14
      Caption = '/m2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 205
      Top = 91
      Width = 22
      Height = 14
      Caption = '/m2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 205
      Top = 115
      Width = 22
      Height = 14
      Caption = '/m2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 205
      Top = 139
      Width = 26
      Height = 14
      Caption = '/unit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 19
      Top = 163
      Width = 81
      Height = 14
      Caption = 'H. Pelaksanaan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 205
      Top = 163
      Width = 22
      Height = 14
      Caption = '/m2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 344
      Top = 67
      Width = 66
      Height = 14
      Alignment = taRightJustify
      Caption = 'BPHTB Rate'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 359
      Top = 43
      Width = 51
      Height = 14
      Alignment = taRightJustify
      Caption = 'PPN Rate'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 243
      Top = 91
      Width = 167
      Height = 14
      Alignment = taRightJustify
      Caption = 'AJB, BBN, PNBP, Cek Sertifikat'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 328
      Top = 139
      Width = 82
      Height = 14
      Alignment = taRightJustify
      Caption = 'Uang Muka Min'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 329
      Top = 163
      Width = 81
      Height = 14
      Alignment = taRightJustify
      Caption = 'Biaya KPR Rate'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 500
      Top = 67
      Width = 100
      Height = 14
      Alignment = taRightJustify
      Caption = 'Pengurang BPHTB'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 510
      Top = 91
      Width = 90
      Height = 14
      Alignment = taRightJustify
      Caption = 'Penambah PNPB'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 517
      Top = 115
      Width = 83
      Height = 14
      Alignment = taRightJustify
      Caption = 'Penambah BBN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 515
      Top = 139
      Width = 85
      Height = 14
      Alignment = taRightJustify
      Caption = 'Biaya Lain - Lain'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label21: TLabel
      Left = 533
      Top = 163
      Width = 67
      Height = 14
      Alignment = taRightJustify
      Caption = 'Booking Fee'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 478
      Top = 43
      Width = 12
      Height = 14
      Alignment = taRightJustify
      Caption = '%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label23: TLabel
      Left = 478
      Top = 67
      Width = 12
      Height = 14
      Alignment = taRightJustify
      Caption = '%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label24: TLabel
      Left = 478
      Top = 91
      Width = 12
      Height = 14
      Alignment = taRightJustify
      Caption = '%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label25: TLabel
      Left = 478
      Top = 115
      Width = 12
      Height = 14
      Alignment = taRightJustify
      Caption = '%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label26: TLabel
      Left = 478
      Top = 139
      Width = 12
      Height = 14
      Alignment = taRightJustify
      Caption = '%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label27: TLabel
      Left = 478
      Top = 163
      Width = 12
      Height = 14
      Alignment = taRightJustify
      Caption = '%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object bCancel: TdxButton
      Left = 626
      Top = 28
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = bCancelClick
      Caption = 'Ba&tal'
      TabOrder = 9
    end
    object bSave: TdxButton
      Left = 546
      Top = 28
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = bSaveClick
      Caption = '&Simpan'
      TabOrder = 8
    end
    object cbProyek: TwwDBLookupCombo
      Left = 122
      Top = 16
      Width = 355
      Height = 20
      BorderStyle = bsNone
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'ProTip'#9'100'#9'ProTip'#9'F')
      DataField = 'IdType'
      DataSource = FDMC.dsqMHarga
      LookupTable = FDMC.tTipe
      LookupField = 'IdType'
      Style = csDropDownList
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 0
      AutoDropDown = True
      ShowButton = False
      PreciseEditRegion = False
      AllowClearKey = False
      OnCloseUp = cbProyekCloseUp
      OnEnter = cbProyekEnter
      OnExit = cbProyekExit
      OnKeyDown = EnterToTab
    end
    object cbBangunan: TwwDBSpinEdit
      Left = 122
      Top = 64
      Width = 80
      Height = 20
      Increment = 1.000000000000000000
      BorderStyle = bsNone
      DataField = 'HargaSatuanBangunan'
      DataSource = FDMC.dsqMHarga
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 2
      UnboundDataType = wwDefault
      OnEnter = cbBangunanEnter
      OnExit = cbBangunanExit
      OnKeyDown = EnterToTab
    end
    object cbTanah: TwwDBSpinEdit
      Left = 122
      Top = 88
      Width = 80
      Height = 20
      Increment = 1.000000000000000000
      BorderStyle = bsNone
      DataField = 'HargaSatuanTanah'
      DataSource = FDMC.dsqMHarga
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 3
      UnboundDataType = wwDefault
      OnEnter = cbTanahEnter
      OnExit = cbTanahExit
      OnKeyDown = EnterToTab
    end
    object cbSelisih: TwwDBSpinEdit
      Left = 122
      Top = 112
      Width = 80
      Height = 20
      Increment = 1.000000000000000000
      BorderStyle = bsNone
      DataField = 'HargaSatuanLebihKurang'
      DataSource = FDMC.dsqMHarga
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 4
      UnboundDataType = wwDefault
      OnEnter = cbSelisihEnter
      OnExit = cbSelisihExit
      OnKeyDown = EnterToTab
    end
    object cbDiskonPlus: TwwDBSpinEdit
      Left = 122
      Top = 136
      Width = 80
      Height = 20
      Increment = 1.000000000000000000
      BorderStyle = bsNone
      DataField = 'TambahanDiskon'
      DataSource = FDMC.dsqMHarga
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 5
      UnboundDataType = wwDefault
      OnEnter = cbDiskonPlusEnter
      OnExit = cbDiskonPlusExit
      OnKeyDown = EnterToTab
    end
    object cbPelaksanaan: TwwDBSpinEdit
      Left = 122
      Top = 160
      Width = 80
      Height = 20
      Increment = 1.000000000000000000
      BorderStyle = bsNone
      DataField = 'HargaMembangun'
      DataSource = FDMC.dsqMHarga
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 6
      UnboundDataType = wwDefault
      OnEnter = cbPelaksanaanEnter
      OnExit = cbPelaksanaanExit
      OnKeyDown = EnterToTab
    end
    object eKeterangan: TwwDBEdit
      Left = 122
      Top = 184
      Width = 355
      Height = 20
      BorderStyle = bsNone
      DataField = 'Keterangan'
      DataSource = FDMC.dsqMHarga
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnEnter = eKeteranganEnter
      OnExit = eKeteranganExit
      OnKeyDown = EnterToTab
    end
    object ePPNRate: TwwDBSpinEdit
      Left = 418
      Top = 40
      Width = 59
      Height = 20
      Increment = 1.000000000000000000
      BorderStyle = bsNone
      DataField = 'PPNRate'
      DataSource = FDMC.dsqMHarga
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 10
      UnboundDataType = wwDefault
      OnEnter = cbBangunanEnter
      OnExit = cbBangunanExit
      OnKeyDown = EnterToTab
    end
    object eBPHTBRate: TwwDBSpinEdit
      Left = 418
      Top = 64
      Width = 59
      Height = 20
      Increment = 1.000000000000000000
      BorderStyle = bsNone
      DataField = 'BPHTBRate'
      DataSource = FDMC.dsqMHarga
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 11
      UnboundDataType = wwDefault
      OnEnter = cbBangunanEnter
      OnExit = cbBangunanExit
      OnKeyDown = EnterToTab
    end
    object eBBNRate: TwwDBSpinEdit
      Left = 418
      Top = 112
      Width = 59
      Height = 20
      Increment = 1.000000000000000000
      BorderStyle = bsNone
      DataField = 'PPhRate'
      DataSource = FDMC.dsqMHarga
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 15
      UnboundDataType = wwDefault
      OnEnter = cbBangunanEnter
      OnExit = cbBangunanExit
      OnKeyDown = EnterToTab
    end
    object ePNPBRate: TwwDBSpinEdit
      Left = 418
      Top = 88
      Width = 59
      Height = 20
      Increment = 1.000000000000000000
      BorderStyle = bsNone
      DataField = 'CekSertipikatRate'
      DataSource = FDMC.dsqMHarga
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 13
      UnboundDataType = wwDefault
      OnEnter = cbBangunanEnter
      OnExit = cbBangunanExit
      OnKeyDown = EnterToTab
    end
    object eUMRate: TwwDBSpinEdit
      Left = 418
      Top = 136
      Width = 59
      Height = 20
      Increment = 1.000000000000000000
      BorderStyle = bsNone
      DataField = 'MinUMRate'
      DataSource = FDMC.dsqMHarga
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 17
      UnboundDataType = wwDefault
      OnEnter = cbBangunanEnter
      OnExit = cbBangunanExit
      OnKeyDown = EnterToTab
    end
    object eKPRRate: TwwDBSpinEdit
      Left = 418
      Top = 160
      Width = 59
      Height = 20
      Increment = 1.000000000000000000
      BorderStyle = bsNone
      DataField = 'BiayaKPRRate'
      DataSource = FDMC.dsqMHarga
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 18
      UnboundDataType = wwDefault
      OnEnter = cbBangunanEnter
      OnExit = cbBangunanExit
      OnKeyDown = EnterToTab
    end
    object eBPHTB: TwwDBSpinEdit
      Left = 610
      Top = 64
      Width = 99
      Height = 20
      Increment = 100000.000000000000000000
      BorderStyle = bsNone
      DataField = 'PengurangBPHTB'
      DataSource = FDMC.dsqMHarga
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 12
      UnboundDataType = wwDefault
      OnEnter = cbBangunanEnter
      OnExit = cbBangunanExit
      OnKeyDown = EnterToTab
    end
    object ePNPB: TwwDBSpinEdit
      Left = 610
      Top = 88
      Width = 99
      Height = 20
      Increment = 100000.000000000000000000
      BorderStyle = bsNone
      DataField = 'PenambahCek'
      DataSource = FDMC.dsqMHarga
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 14
      UnboundDataType = wwDefault
      OnEnter = cbBangunanEnter
      OnExit = cbBangunanExit
      OnKeyDown = EnterToTab
    end
    object eBBN: TwwDBSpinEdit
      Left = 610
      Top = 112
      Width = 99
      Height = 20
      Increment = 1.000000000000000000
      BorderStyle = bsNone
      DataField = 'PenambahAJB'
      DataSource = FDMC.dsqMHarga
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 16
      UnboundDataType = wwDefault
      OnEnter = cbBangunanEnter
      OnExit = cbBangunanExit
      OnKeyDown = EnterToTab
    end
    object eLain: TwwDBSpinEdit
      Left = 610
      Top = 136
      Width = 99
      Height = 20
      Increment = 1.000000000000000000
      BorderStyle = bsNone
      DataField = 'BiayaLain'
      DataSource = FDMC.dsqMHarga
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 19
      UnboundDataType = wwDefault
      OnEnter = cbBangunanEnter
      OnExit = cbBangunanExit
      OnKeyDown = EnterToTab
    end
    object eBooking: TwwDBSpinEdit
      Left = 610
      Top = 160
      Width = 99
      Height = 20
      Increment = 1.000000000000000000
      BorderStyle = bsNone
      DataField = 'BookingFee'
      DataSource = FDMC.dsqMHarga
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 20
      UnboundDataType = wwDefault
      OnEnter = cbBangunanEnter
      OnExit = cbBangunanExit
      OnKeyDown = EnterToTab
    end
    object eRevisi: TwwDBEdit
      Left = 122
      Top = 40
      Width = 80
      Height = 20
      BorderStyle = bsNone
      DataField = 'RevisiKe'
      DataSource = FDMC.dsqMHarga
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnEnter = eRevisiEnter
      OnExit = eRevisiEnter
      OnKeyDown = EnterToTab
    end
  end
  object pTopBorder: TPanel
    Left = 0
    Top = 0
    Width = 1143
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
