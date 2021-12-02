object Bonus: TBonus
  Left = 206
  Top = 125
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Bonus'
  ClientHeight = 441
  ClientWidth = 908
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
    908
    441)
  PixelsPerInch = 96
  TextHeight = 14
  object pnlButton: TPanel
    Left = 0
    Top = 7
    Width = 908
    Height = 34
    Align = alTop
    BevelOuter = bvLowered
    Color = 16244694
    TabOrder = 0
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
      TabOrder = 3
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
    Width = 908
    Height = 400
    Align = alClient
    AllowedOperations = []
    AutoFitColWidths = True
    BorderStyle = bsNone
    DataSource = FDMC.dstBonus
    DynProps = <>
    EvenRowColor = clWindow
    Flat = True
    FrozenCols = 1
    HorzScrollBar.ExtraPanel.Visible = True
    HorzScrollBar.ExtraPanel.NavigatorButtons = [nbFirstEh, nbPriorEh, nbNextEh, nbLastEh, nbRefreshEh]
    HorzScrollBar.ExtraPanel.VisibleItems = [gsbiRecordsInfoEh, gsbiNavigator]
    IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
    OddRowColor = clWindow
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDblClickOptimizeColWidth, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
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
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'IdBonus'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Id. Bonus'
        Visible = False
        Width = 45
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'NamaBonus'
        Footers = <>
        Title.Alignment = taCenter
        Width = 221
      end
      item
        DisplayFormat = '#,#,0'
        DynProps = <>
        EditButtons = <>
        FieldName = 'BesarBonus'
        Footers = <>
        Title.Alignment = taCenter
        Width = 101
      end
      item
        Alignment = taCenter
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
    Left = 21
    Top = 112
    Width = 338
    Height = 81
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
      Width = 30
      Height = 14
      Caption = 'Nama'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Llbl8: TLabel
      Left = 19
      Top = 43
      Width = 29
      Height = 14
      Caption = 'Besar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object bCancel: TdxButton
      Left = 246
      Top = 40
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = bCancelClick
      Caption = 'Ba&tal'
      TabOrder = 3
    end
    object bSave: TdxButton
      Left = 166
      Top = 40
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = bSaveClick
      Caption = '&Simpan'
      TabOrder = 2
    end
    object eNama: TwwDBEdit
      Left = 70
      Top = 16
      Width = 249
      Height = 19
      BorderStyle = bsNone
      DataField = 'NamaBonus'
      DataSource = FDMC.dsqMBonus
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnEnter = eNamaEnter
      OnExit = eNamaExit
      OnKeyDown = EnterToTab
    end
    object eBesar: TwwDBSpinEdit
      Left = 70
      Top = 40
      Width = 83
      Height = 19
      Increment = 1.000000000000000000
      BorderStyle = bsNone
      DataField = 'BesarBonus'
      DataSource = FDMC.dsqMBonus
      ButtonEffects.Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Frame.Enabled = True
      Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
      ParentFont = False
      TabOrder = 1
      UnboundDataType = wwDefault
      OnEnter = eBesarEnter
      OnExit = eBesarExit
      OnKeyDown = EnterToTab
    end
  end
  object pTopBorder: TPanel
    Left = 0
    Top = 0
    Width = 908
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
