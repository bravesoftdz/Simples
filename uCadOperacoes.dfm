object frmCadOperacoes: TfrmCadOperacoes
  Left = 242
  Top = 180
  BorderIcons = []
  Caption = 'Cadastro e manuten'#231'ao de Operac'#245'es'
  ClientHeight = 305
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PagCadastro: TbsSkinPageControl
    Left = 0
    Top = 53
    Width = 616
    Height = 252
    ActivePage = bsSkinTabSheet2
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = 14
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Style = tsButtons
    TabOrder = 0
    MouseWheelSupport = False
    TabExtededDraw = False
    TabsOffset = 0
    TabSpacing = 1
    TextInHorizontal = False
    TabsInCenter = False
    FreeOnClose = False
    ShowCloseButtons = False
    TabsBGTransparent = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clBtnText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    UseSkinFont = True
    DefaultItemHeight = 20
    SkinData = frmPrincipal.SkinPrincipal
    SkinDataName = 'tab'
    object bsSkinTabSheet1: TbsSkinTabSheet
      Caption = 'Consulta'
      object bsSkinPanel1: TbsSkinPanel
        Left = 0
        Top = 0
        Width = 614
        Height = 33
        HintImageIndex = 0
        TabOrder = 0
        SkinData = frmPrincipal.SkinEntradaDados
        SkinDataName = 'panel'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        RibbonStyle = False
        ImagePosition = bsipDefault
        TransparentMode = False
        CaptionImageIndex = -1
        RealHeight = -1
        AutoEnabledControls = True
        CheckedMode = False
        Checked = False
        DefaultAlignment = taLeftJustify
        DefaultCaptionHeight = 22
        BorderStyle = bvFrame
        CaptionMode = False
        RollUpMode = False
        RollUpState = False
        NumGlyphs = 1
        Spacing = 2
        Caption = 'bsSkinPanel1'
        Align = alTop
        object bsSkinComboBox1: TbsSkinComboBox
          Left = 10
          Top = 7
          Width = 120
          Height = 20
          HintImageIndex = 0
          TabOrder = 0
          SkinData = frmPrincipal.SkinPrincipal
          SkinDataName = 'combobox'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 14
          DefaultFont.Name = 'Arial'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          UseSkinSize = True
          ToolButtonStyle = False
          AlphaBlend = False
          AlphaBlendValue = 0
          AlphaBlendAnimation = False
          ListBoxCaptionMode = False
          ListBoxDefaultFont.Charset = DEFAULT_CHARSET
          ListBoxDefaultFont.Color = clWindowText
          ListBoxDefaultFont.Height = 14
          ListBoxDefaultFont.Name = 'Arial'
          ListBoxDefaultFont.Style = []
          ListBoxDefaultCaptionFont.Charset = DEFAULT_CHARSET
          ListBoxDefaultCaptionFont.Color = clWindowText
          ListBoxDefaultCaptionFont.Height = 14
          ListBoxDefaultCaptionFont.Name = 'Arial'
          ListBoxDefaultCaptionFont.Style = []
          ListBoxDefaultItemHeight = 20
          ListBoxCaptionAlignment = taLeftJustify
          ListBoxUseSkinFont = True
          ListBoxUseSkinItemHeight = True
          ListBoxWidth = 0
          HideSelection = True
          AutoComplete = True
          ImageIndex = -1
          CharCase = ecNormal
          DefaultColor = clWindow
          Text = 'Descricao'
          Items.Strings = (
            'Descricao')
          ItemIndex = 0
          DropDownCount = 8
          HorizontalExtent = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = 14
          Font.Name = 'Arial'
          Font.Style = []
          Sorted = False
          Style = bscbFixedStyle
        end
        object EdtPesquisa: TbsSkinEdit
          Left = 136
          Top = 7
          Width = 203
          Height = 18
          DefaultColor = clWindow
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clBlack
          DefaultFont.Height = 14
          DefaultFont.Name = 'Arial'
          DefaultFont.Style = []
          UseSkinFont = True
          DefaultWidth = 0
          DefaultHeight = 0
          ButtonMode = False
          SkinData = frmPrincipal.SkinPrincipal
          SkinDataName = 'edit'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = 14
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          LeftImageIndex = -1
          LeftImageHotIndex = -1
          LeftImageDownIndex = -1
          RightImageIndex = -1
          RightImageHotIndex = -1
          RightImageDownIndex = -1
          OnChange = edtPesquisaChange
        end
        object chkPesqTodoTexto: TbsSkinCheckRadioBox
          Left = 345
          Top = 7
          Width = 136
          Height = 16
          HintImageIndex = 0
          TabOrder = 2
          SkinData = frmPrincipal.SkinPrincipal
          SkinDataName = 'checkbox'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 14
          DefaultFont.Name = 'Arial'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          WordWrap = False
          AllowGrayed = False
          State = cbUnchecked
          ImageIndex = 0
          Flat = True
          UseSkinFontColor = True
          TabStop = True
          CanFocused = True
          Radio = False
          Checked = False
          GroupIndex = 0
          Caption = 'Pesquisa em todo texo'
        end
        object btnPesquisar: TbsSkinButton
          Left = 482
          Top = 4
          Width = 125
          Height = 25
          HintImageIndex = 0
          TabOrder = 3
          SkinData = frmPrincipal.SkinPrincipal
          SkinDataName = 'button'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 14
          DefaultFont.Name = 'Arial'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = False
          CheckedMode = False
          ImageList = frmPrincipal.Imagebutoes
          ImageIndex = 5
          AlwaysShowLayeredFrame = False
          UseSkinSize = False
          UseSkinFontColor = False
          RepeatMode = False
          RepeatInterval = 100
          AllowAllUp = False
          TabStop = True
          CanFocused = True
          Down = False
          GroupIndex = 0
          Caption = ' &Pesquisar'
          NumGlyphs = 1
          Spacing = 1
          OnClick = edtPesquisaChange
        end
      end
      object edtsequencia: TEdit
        Left = 232
        Top = 136
        Width = 121
        Height = 22
        Color = cl3DLight
        TabOrder = 1
        Text = 'edtsequencia'
        Visible = False
      end
      object cxGrid1: TcxGrid
        Left = 0
        Top = 33
        Width = 614
        Height = 195
        Align = alClient
        TabOrder = 2
        object GridOperacoes: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = srcPesquisa
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = '0'
              Kind = skCount
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '0'
              Kind = skCount
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          OptionsView.GroupSummaryLayout = gslAlignWithColumns
          Styles.StyleSheet = frmPrincipal.GridTableViewStyleSheetDevExpress
          object GridOperacoesCodigo: TcxGridDBColumn
            DataBinding.FieldName = 'Codigo'
            Width = 50
          end
          object GridOperacoesDescricao: TcxGridDBColumn
            DataBinding.FieldName = 'Descricao'
            Width = 200
          end
          object GridOperacoesData_cad: TcxGridDBColumn
            Caption = 'Cadastrado Em'
            DataBinding.FieldName = 'Data_cad'
            Width = 92
          end
          object GridOperacoesData_Atu: TcxGridDBColumn
            Caption = 'Alterado em'
            DataBinding.FieldName = 'Data_Atu'
            Width = 90
          end
          object GridOperacoesCod_Emp: TcxGridDBColumn
            DataBinding.FieldName = 'Cod_Emp'
            Visible = False
          end
          object GridOperacoesOperador: TcxGridDBColumn
            DataBinding.FieldName = 'Operador'
            Width = 70
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = GridOperacoes
        end
      end
    end
    object bsSkinTabSheet2: TbsSkinTabSheet
      Caption = 'Cadastro'
      object Previsto: TLabel
        Left = 72
        Top = 96
        Width = 65
        Height = 14
        Caption = 'Meta Prevista'
      end
      object Label2: TLabel
        Left = 90
        Top = 68
        Width = 49
        Height = 14
        Caption = 'Descricao'
      end
      object Label1: TLabel
        Left = 100
        Top = 48
        Width = 36
        Height = 14
        Caption = 'Codigo '
      end
      object bsSkinStdLabel8: TbsSkinStdLabel
        Left = 366
        Top = 11
        Width = 68
        Height = 13
        EllipsType = bsetNone
        UseSkinFont = True
        UseSkinColor = True
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = -11
        DefaultFont.Name = 'MS Sans Serif'
        DefaultFont.Style = []
        SkinData = frmPrincipal.SkinEntradaDados
        SkinDataName = 'stdlabel'
        Caption = 'Data Cadastro'
      end
      object Label3: TLabel
        Left = 208
        Top = 96
        Width = 66
        Height = 14
        Caption = 'Tipo Despesa'
      end
      object EdtDescricao: TbsSkinEdit
        Left = 145
        Top = 68
        Width = 337
        Height = 18
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = False
        SkinData = frmPrincipal.SkinEntradaDados
        SkinDataName = 'edit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
      end
      object edtCodigo: TbsSkinEdit
        Left = 146
        Top = 43
        Width = 56
        Height = 18
        Text = '0001'
        DefaultColor = clScrollBar
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = False
        SkinDataName = 'edit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 9
        ParentFont = False
        TabOrder = 0
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
      end
      object edtData_cad: TbsSkinEdit
        Left = 448
        Top = 6
        Width = 74
        Height = 18
        TabStop = False
        DefaultColor = clScrollBar
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = False
        SkinData = frmPrincipal.SkinEntradaDados
        SkinDataName = 'edit'
        ReadOnly = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
      end
      object cmbTipoDespesa: TbsSkinComboBox
        Left = 278
        Top = 90
        Width = 203
        Height = 20
        HintImageIndex = 0
        TabOrder = 3
        SkinData = frmPrincipal.SkinEntradaDados
        SkinDataName = 'combobox'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        UseSkinSize = True
        ToolButtonStyle = False
        AlphaBlend = False
        AlphaBlendValue = 0
        AlphaBlendAnimation = False
        ListBoxCaptionMode = False
        ListBoxDefaultFont.Charset = DEFAULT_CHARSET
        ListBoxDefaultFont.Color = clWindowText
        ListBoxDefaultFont.Height = 14
        ListBoxDefaultFont.Name = 'Arial'
        ListBoxDefaultFont.Style = []
        ListBoxDefaultCaptionFont.Charset = DEFAULT_CHARSET
        ListBoxDefaultCaptionFont.Color = clWindowText
        ListBoxDefaultCaptionFont.Height = 14
        ListBoxDefaultCaptionFont.Name = 'Arial'
        ListBoxDefaultCaptionFont.Style = []
        ListBoxDefaultItemHeight = 20
        ListBoxCaptionAlignment = taLeftJustify
        ListBoxUseSkinFont = True
        ListBoxUseSkinItemHeight = True
        ListBoxWidth = 0
        HideSelection = True
        AutoComplete = True
        ImageIndex = 0
        CharCase = ecNormal
        DefaultColor = clWindow
        Text = 'Despesas Operacionais'
        Items.Strings = (
          'Despesas Operacionais'
          'Receitas de Vendas'
          'Outras Despesas'
          'Outras Receitas')
        ItemIndex = -1
        DropDownCount = 8
        HorizontalExtent = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        Sorted = False
        Style = bscbFixedStyle
      end
      object edtMeta: TbsSkinNumericEdit
        Left = 146
        Top = 90
        Width = 55
        Height = 18
        Text = '0,00'
        Increment = 1.000000000000000000
        SupportUpDownKeys = False
        Alignment = taRightJustify
        UseSkinFont = True
        ValueType = vtFloat
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = False
        SkinData = frmPrincipal.SkinEntradaDados
        SkinDataName = 'edit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 2
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
      end
    end
  end
  object bsSkinCoolBar2: TbsSkinCoolBar
    Left = 0
    Top = 0
    Width = 616
    Height = 53
    AutoSize = True
    Bands = <
      item
        Control = bsSkinToolBar2
        ImageIndex = -1
        MinHeight = 49
        Width = 612
      end>
    SkinDataName = 'controlbar'
    SkinData = frmPrincipal.SkinPrincipal
    SkinBevel = True
    TabOrder = 1
    object bsSkinToolBar2: TbsSkinToolBar
      Left = 9
      Top = 0
      Width = 603
      Height = 49
      HintImageIndex = 0
      TabOrder = 0
      SkinData = frmPrincipal.SkinPrincipal
      SkinDataName = 'bigtoolpanel'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      RibbonStyle = False
      ImagePosition = bsipDefault
      TransparentMode = False
      CaptionImageIndex = -1
      RealHeight = -1
      AutoEnabledControls = True
      CheckedMode = False
      Checked = False
      DefaultAlignment = taLeftJustify
      DefaultCaptionHeight = 22
      BorderStyle = bvNone
      CaptionMode = False
      RollUpMode = False
      RollUpState = False
      NumGlyphs = 1
      Spacing = 2
      Caption = 'bsSkinToolBar1'
      CanScroll = False
      HotScroll = False
      ScrollOffset = 0
      ScrollTimerInterval = 50
      AdjustControls = True
      WidthWithCaptions = 0
      WidthWithoutCaptions = 0
      AutoShowHideCaptions = False
      ShowCaptions = False
      Flat = False
      Images = frmPrincipal.Imagebutoes
      object btnFechar: TbsSkinSpeedButton
        Left = 489
        Top = 0
        Width = 70
        Height = 49
        HintImageIndex = 0
        SkinData = frmPrincipal.SkinPrincipal
        SkinDataName = 'bigtoolbutton'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 70
        DefaultHeight = 40
        UseSkinFont = True
        CheckedMode = False
        UseSkinSize = True
        UseSkinFontColor = True
        WidthWithCaption = 0
        WidthWithoutCaption = 0
        ImageIndex = 7
        RepeatMode = False
        RepeatInterval = 100
        Transparent = True
        Flat = True
        AllowAllUp = False
        Down = False
        GroupIndex = 0
        Caption = '&Fechar'
        ShowCaption = True
        NumGlyphs = 1
        Align = alLeft
        Spacing = 2
        Layout = blGlyphTop
        OnClick = btnFecharClick
        ExplicitLeft = 550
        ExplicitTop = 12
        ExplicitHeight = 40
      end
      object btnexcluir: TbsSkinSpeedButton
        Left = 140
        Top = 0
        Width = 70
        Height = 49
        HintImageIndex = 0
        SkinData = frmPrincipal.SkinPrincipal
        SkinDataName = 'bigtoolbutton'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        CheckedMode = False
        UseSkinSize = True
        UseSkinFontColor = True
        WidthWithCaption = 0
        WidthWithoutCaption = 0
        ImageIndex = 2
        RepeatMode = False
        RepeatInterval = 100
        Transparent = True
        Flat = True
        AllowAllUp = False
        Down = False
        GroupIndex = 0
        Caption = '&Excluir'
        ShowCaption = True
        NumGlyphs = 1
        Align = alLeft
        Spacing = 1
        Layout = blGlyphTop
        OnClick = BtnExcluirClick
        ExplicitLeft = 126
        ExplicitTop = 12
      end
      object btnalterar: TbsSkinSpeedButton
        Left = 70
        Top = 0
        Width = 70
        Height = 49
        HintImageIndex = 0
        SkinData = frmPrincipal.SkinPrincipal
        SkinDataName = 'bigtoolbutton'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        CheckedMode = False
        UseSkinSize = True
        UseSkinFontColor = True
        WidthWithCaption = 0
        WidthWithoutCaption = 0
        ImageIndex = 1
        RepeatMode = False
        RepeatInterval = 100
        Transparent = True
        Flat = True
        AllowAllUp = False
        Down = False
        GroupIndex = 0
        Caption = '&Alterar'
        ShowCaption = True
        NumGlyphs = 1
        Align = alLeft
        Spacing = 1
        Layout = blGlyphTop
        OnClick = BtnAlterarClick
        ExplicitTop = 8
        ExplicitHeight = 40
      end
      object btnincluir: TbsSkinSpeedButton
        Left = 0
        Top = 0
        Width = 70
        Height = 49
        HintImageIndex = 0
        SkinData = frmPrincipal.SkinPrincipal
        SkinDataName = 'bigtoolbutton'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        CheckedMode = False
        UseSkinSize = True
        UseSkinFontColor = True
        WidthWithCaption = 0
        WidthWithoutCaption = 0
        ImageIndex = 0
        RepeatMode = False
        RepeatInterval = 100
        Transparent = True
        Flat = True
        AllowAllUp = False
        Down = False
        GroupIndex = 0
        Caption = '&Incluir'
        ShowCaption = True
        NumGlyphs = 1
        Align = alLeft
        Spacing = 1
        Layout = blGlyphTop
        OnClick = BtnIncluirClick
        ExplicitTop = 8
        ExplicitHeight = 40
      end
      object BtnCancela: TbsSkinSpeedButton
        Left = 327
        Top = 0
        Width = 70
        Height = 49
        HintImageIndex = 0
        SkinData = frmPrincipal.SkinPrincipal
        SkinDataName = 'bigtoolbutton'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        CheckedMode = False
        UseSkinSize = True
        UseSkinFontColor = True
        WidthWithCaption = 0
        WidthWithoutCaption = 0
        ImageIndex = 4
        RepeatMode = False
        RepeatInterval = 100
        Transparent = True
        Flat = True
        AllowAllUp = False
        Down = False
        GroupIndex = 0
        Caption = '&Cancelar'
        ShowCaption = True
        NumGlyphs = 1
        Align = alLeft
        Spacing = 1
        Layout = blGlyphTop
        Enabled = False
        OnClick = BtnCancelaClick
        ExplicitLeft = 273
        ExplicitTop = 12
      end
      object bsSkinBevel1: TbsSkinBevel
        Left = 210
        Top = 0
        Width = 47
        Height = 49
        Align = alLeft
        SkinData = frmPrincipal.SkinPrincipal
        SkinDataName = 'bevel'
        DividerMode = True
        ExplicitTop = -5
        ExplicitHeight = 40
      end
      object btnok: TbsSkinSpeedButton
        Left = 257
        Top = 0
        Width = 70
        Height = 49
        HintImageIndex = 0
        SkinData = frmPrincipal.SkinPrincipal
        SkinDataName = 'bigtoolbutton'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        CheckedMode = False
        UseSkinSize = True
        UseSkinFontColor = True
        WidthWithCaption = 0
        WidthWithoutCaption = 0
        ImageIndex = 3
        RepeatMode = False
        RepeatInterval = 100
        Transparent = True
        Flat = True
        AllowAllUp = False
        Down = False
        GroupIndex = 0
        Caption = '&Ok'
        ShowCaption = True
        NumGlyphs = 1
        Align = alLeft
        Spacing = 1
        Layout = blGlyphTop
        Enabled = False
        OnClick = BtnOkClick
        ExplicitLeft = 251
        ExplicitTop = 8
        ExplicitHeight = 40
      end
      object bsSkinBevel2: TbsSkinBevel
        Left = 397
        Top = 0
        Width = 92
        Height = 49
        Align = alLeft
        SkinData = frmPrincipal.SkinPrincipal
        SkinDataName = 'bevel'
        DividerMode = True
        ExplicitTop = -5
        ExplicitHeight = 40
      end
    end
  end
  object qryCadOperacoes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from T_Atividades where 1=2')
    SQLConnection = frmPrincipal.dbxPrincipal
    Left = 136
    Top = 139
  end
  object dspCadOperacoes: TDataSetProvider
    DataSet = qryCadOperacoes
    Left = 136
    Top = 167
  end
  object srcCadOperacoes: TDataSource
    DataSet = cdsCadOperacoes
    Left = 136
    Top = 195
  end
  object cdsCadOperacoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCadAtividades'
    Left = 136
    Top = 223
  end
  object sdtsPesquisa: TSimpleDataSet
    Aggregates = <>
    Connection = frmPrincipal.dbxPrincipal
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 108
    Top = 223
  end
  object srcPesquisa: TDataSource
    DataSet = sdtsPesquisa
    Left = 108
    Top = 195
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from T_Atividades where 1=2')
    SQLConnection = frmPrincipal.dbxPrincipal
    Left = 164
    Top = 139
  end
end
