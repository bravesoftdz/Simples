object frmRemessaParaVenda: TfrmRemessaParaVenda
  Left = 0
  Top = 0
  Caption = 'Controle de Remessa Para Venda'
  ClientHeight = 407
  ClientWidth = 750
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bsSkinCoolBar2: TbsSkinCoolBar
    Left = 0
    Top = 0
    Width = 750
    Height = 53
    AutoSize = True
    Bands = <
      item
        Control = bsSkinToolBar2
        ImageIndex = -1
        MinHeight = 49
        Width = 746
      end>
    SkinDataName = 'controlbar'
    SkinData = frmPrincipal.SkinPrincipal
    SkinBevel = True
    TabOrder = 0
    object bsSkinToolBar2: TbsSkinToolBar
      Left = 9
      Top = 0
      Width = 737
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
      EmptyDrawing = False
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
      object brnNovaRemessa: TbsSkinSpeedButton
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
        DefaultWidth = 70
        DefaultHeight = 40
        UseSkinFont = True
        CheckedMode = False
        UseSkinSize = True
        UseSkinFontColor = True
        WidthWithCaption = 0
        WidthWithoutCaption = 0
        ImageIndex = 15
        RepeatMode = False
        RepeatInterval = 100
        Transparent = True
        Flat = True
        AllowAllUp = False
        Down = False
        GroupIndex = 0
        Caption = 'Nova Remessa'
        ShowCaption = True
        NumGlyphs = 1
        Align = alLeft
        Spacing = 2
        OnClick = brnNovaRemessaClick
        ExplicitTop = 12
        ExplicitHeight = 40
      end
      object btnFecharRemessa: TbsSkinSpeedButton
        Left = 70
        Top = 0
        Width = 91
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
        ImageIndex = 11
        RepeatMode = False
        RepeatInterval = 100
        Transparent = True
        Flat = True
        AllowAllUp = False
        Down = False
        GroupIndex = 0
        Caption = '&Fecha Remessa'
        ShowCaption = True
        NumGlyphs = 1
        Align = alLeft
        Spacing = 1
        OnClick = btnFecharRemessaClick
        ExplicitLeft = 64
        ExplicitTop = 12
      end
      object bsSkinBevel1: TbsSkinBevel
        Left = 464
        Top = 0
        Width = 1
        Height = 49
        Align = alLeft
        SkinData = frmPrincipal.SkinPrincipal
        SkinDataName = 'bevel'
        DividerMode = True
        ExplicitLeft = 477
        ExplicitTop = -1
      end
      object bsSkinBevel2: TbsSkinBevel
        Left = 244
        Top = 0
        Width = 80
        Height = 49
        Align = alLeft
        SkinData = frmPrincipal.SkinPrincipal
        SkinDataName = 'bevel'
        DividerMode = True
        ExplicitLeft = 161
        ExplicitTop = -1
      end
      object bsSkinSpeedButton1: TbsSkinSpeedButton
        Left = 580
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
        OnClick = bsSkinSpeedButton1Click
        ExplicitLeft = 649
        ExplicitTop = 12
        ExplicitHeight = 40
      end
      object bsSkinBevel3: TbsSkinBevel
        Left = 465
        Top = 0
        Width = 115
        Height = 49
        Align = alLeft
        SkinData = frmPrincipal.SkinPrincipal
        SkinDataName = 'bevel'
        DividerMode = True
        ExplicitLeft = 542
        ExplicitTop = -1
      end
      object BtnCancela: TbsSkinSpeedButton
        Left = 324
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
        ExplicitLeft = 319
        ExplicitTop = 8
        ExplicitHeight = 40
      end
      object btnok: TbsSkinSpeedButton
        Left = 394
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
        OnClick = btnokClick
        ExplicitLeft = 485
        ExplicitTop = 8
        ExplicitHeight = 40
      end
      object btndicionar: TbsSkinSpeedButton
        Left = 161
        Top = 0
        Width = 83
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
        ImageIndex = 10
        RepeatMode = False
        RepeatInterval = 100
        Transparent = True
        Flat = True
        AllowAllUp = False
        Down = False
        GroupIndex = 0
        Caption = 'Adicinar Estoque'
        ShowCaption = True
        NumGlyphs = 1
        Align = alLeft
        Spacing = 1
        OnClick = btndicionarClick
        ExplicitLeft = 222
        ExplicitTop = 12
      end
    end
  end
  object PaginaDeconsulta: TbsSkinPageControl
    Left = 0
    Top = 53
    Width = 750
    Height = 354
    ActivePage = bsSkinTabSheet1
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = 14
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    MouseWheelSupport = False
    TabExtededDraw = False
    ButtonTabSkinDataName = 'resizetoolbutton'
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
    SkinDataName = 'tab'
    object bsSkinTabSheet1: TbsSkinTabSheet
      Caption = 'Consulta Remessa'
      object bsSkinDBGrid2: TbsSkinDBGrid
        Left = 0
        Top = 33
        Width = 729
        Height = 134
        HintImageIndex = 0
        TabOrder = 0
        SkinData = frmPrincipal.SkinPrincipal
        SkinDataName = 'grid'
        Transparent = False
        WallpaperStretch = False
        UseSkinFont = True
        UseSkinCellHeight = True
        VScrollBar = bsSkinScrollBar3
        GridLineColor = clWindowText
        DefaultCellHeight = 20
        ColSizingwithLine = False
        DrawGraphicFields = False
        UseColumnsFont = False
        DefaultRowHeight = 18
        MouseWheelSupport = False
        SaveMultiSelection = False
        PickListBoxSkinDataName = 'listbox'
        PickListBoxCaptionMode = False
        Align = alClient
        DataSource = srcRemessas
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBtnText
        TitleFont.Height = 14
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'FuncionarioId'
            Title.Caption = 'Codigo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Vendedor'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DataCadastro'
            Title.Caption = 'Data Saida'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DataFechamento'
            Title.Caption = 'Data Fechamento'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Id'
            Title.Caption = 'N'#186' Remessa'
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NomeStatus'
            Title.Caption = 'Status'
            Visible = True
          end>
      end
      object bsSkinExPanel2: TbsSkinExPanel
        Left = 0
        Top = 167
        Width = 748
        Height = 166
        HintImageIndex = 0
        TabOrder = 1
        SkinData = frmPrincipal.SkinPrincipal
        SkinDataName = 'expanel'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        UseSkinSize = True
        CaptionImageIndex = -1
        NumGlyphs = 1
        Spacing = 2
        RealWidth = 0
        RealHeight = 0
        ShowRollButton = True
        ShowCloseButton = True
        DefaultCaptionHeight = 21
        RollState = False
        RollKind = rkRollVertical
        Moveable = False
        Sizeable = False
        Align = alBottom
        Caption = 'Itens da Remessa Selecionada'
        object bsSkinDBGrid3: TbsSkinDBGrid
          Left = 1
          Top = 21
          Width = 727
          Height = 144
          HintImageIndex = 0
          TabOrder = 0
          SkinData = frmPrincipal.SkinPrincipal
          SkinDataName = 'grid'
          Transparent = False
          WallpaperStretch = False
          UseSkinFont = True
          UseSkinCellHeight = True
          VScrollBar = bsSkinScrollBar2
          GridLineColor = clWindowText
          DefaultCellHeight = 20
          ColSizingwithLine = False
          DrawGraphicFields = False
          UseColumnsFont = False
          DefaultRowHeight = 18
          MouseWheelSupport = False
          SaveMultiSelection = False
          PickListBoxSkinDataName = 'listbox'
          PickListBoxCaptionMode = False
          Align = alClient
          DataSource = srcItensRemessa
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBtnText
          TitleFont.Height = 14
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ProdutoId'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Produto'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QuantidadeEnviada'
              Title.Caption = 'Qtde Enviada'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QuantidadeDevolvida'
              Title.Caption = 'Qtde. Devolvida'
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QuantidadeVendida'
              Title.Caption = 'Qtde. Vendida'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Saldo'
              Visible = True
            end>
        end
        object bsSkinScrollBar2: TbsSkinScrollBar
          Left = 728
          Top = 21
          Width = 19
          Height = 144
          HintImageIndex = 0
          TabOrder = 1
          Visible = False
          SkinData = frmPrincipal.SkinPrincipal
          SkinDataName = 'vscrollbar'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 14
          DefaultFont.Name = 'Arial'
          DefaultFont.Style = []
          DefaultWidth = 19
          DefaultHeight = 0
          UseSkinFont = True
          Both = False
          BothMarkerWidth = 19
          BothSkinDataName = 'bothhscrollbar'
          CanFocused = False
          Align = alRight
          Kind = sbVertical
          PageSize = 0
          Min = 0
          Max = 100
          Position = 0
          SmallChange = 1
          LargeChange = 1
        end
      end
      object bsSkinPanel1: TbsSkinPanel
        Left = 0
        Top = 0
        Width = 748
        Height = 33
        HintImageIndex = 0
        TabOrder = 2
        SkinDataName = 'panel'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        EmptyDrawing = False
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
        object cmbtipoconsulta: TbsSkinComboBox
          Left = 8
          Top = 8
          Width = 120
          Height = 20
          HintImageIndex = 0
          TabOrder = 0
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
          Text = 'Em Aberto'
          Items.Strings = (
            'Em Aberto'
            'Fechado')
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
        object btnPesquisar: TbsSkinButton
          Left = 602
          Top = 5
          Width = 125
          Height = 25
          HintImageIndex = 0
          TabOrder = 1
          SkinDataName = 'button'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 14
          DefaultFont.Name = 'Arial'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = False
          Transparent = False
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
          OnClick = btnPesquisarClick
        end
      end
      object bsSkinScrollBar3: TbsSkinScrollBar
        Left = 729
        Top = 33
        Width = 19
        Height = 134
        HintImageIndex = 0
        TabOrder = 3
        Visible = False
        SkinData = frmPrincipal.SkinPrincipal
        SkinDataName = 'vscrollbar'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 19
        DefaultHeight = 0
        UseSkinFont = True
        Both = False
        BothMarkerWidth = 19
        BothSkinDataName = 'bothhscrollbar'
        CanFocused = False
        Align = alRight
        Kind = sbVertical
        PageSize = 0
        Min = 0
        Max = 100
        Position = 0
        SmallChange = 1
        LargeChange = 1
      end
    end
    object tabNovaRemessa: TbsSkinTabSheet
      Caption = 'Novo Remessa'
      object bsSkinExPanel1: TbsSkinExPanel
        Left = 0
        Top = 0
        Width = 748
        Height = 97
        HintImageIndex = 0
        TabOrder = 0
        SkinDataName = 'expanel'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        UseSkinSize = True
        CaptionImageIndex = -1
        NumGlyphs = 1
        Spacing = 2
        RealWidth = 0
        RealHeight = 0
        ShowRollButton = True
        ShowCloseButton = True
        DefaultCaptionHeight = 21
        RollState = False
        RollKind = rkRollVertical
        Moveable = False
        Sizeable = False
        Align = alTop
        object bsSkinStdLabel15: TbsSkinStdLabel
          Left = 13
          Top = 33
          Width = 50
          Height = 13
          EllipsType = bsetNone
          UseSkinFont = True
          UseSkinColor = True
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = -11
          DefaultFont.Name = 'MS Sans Serif'
          DefaultFont.Style = []
          SkinData = frmPrincipal.SkinPrincipal
          SkinDataName = 'stdlabel'
          Caption = 'Supervisor'
        end
        object cmbNome_Funcionario: TbsSkinDBLookupComboBox
          Left = 153
          Top = 30
          Width = 298
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
          DefaultHeight = 20
          UseSkinFont = True
          DefaultColor = clWindow
          ListBoxDefaultItemHeight = 20
          ListBoxUseSkinFont = True
          ListBoxUseSkinItemHeight = True
          KeyField = 'codigo'
          ListField = 'Descricao;Codigo'
          ListSource = SrcVendedores
          OnChange = cmbNome_FuncionarioChange
        end
        object edtCod_Funcionario: TbsSkinEdit
          Left = 82
          Top = 32
          Width = 65
          Height = 20
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
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = 14
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          ButtonImageIndex = -1
          LeftImageIndex = -1
          LeftImageHotIndex = -1
          LeftImageDownIndex = -1
          RightImageIndex = -1
          RightImageHotIndex = -1
          RightImageDownIndex = -1
          OnExit = edtCod_FuncionarioExit
        end
        object pnlProdutos: TbsSkinPanel
          Left = 1
          Top = 56
          Width = 746
          Height = 40
          HintImageIndex = 0
          TabOrder = 2
          SkinData = frmPrincipal.SkinPrincipal
          SkinDataName = 'panel'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 14
          DefaultFont.Name = 'Arial'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          EmptyDrawing = False
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
          Align = alBottom
          object bsSkinStdLabel1: TbsSkinStdLabel
            Left = 12
            Top = 14
            Width = 37
            Height = 13
            EllipsType = bsetNone
            UseSkinFont = True
            UseSkinColor = True
            DefaultFont.Charset = DEFAULT_CHARSET
            DefaultFont.Color = clWindowText
            DefaultFont.Height = -11
            DefaultFont.Name = 'MS Sans Serif'
            DefaultFont.Style = []
            SkinData = frmPrincipal.SkinPrincipal
            SkinDataName = 'stdlabel'
            Caption = 'Produto'
          end
          object bsSkinStdLabel2: TbsSkinStdLabel
            Left = 435
            Top = 15
            Width = 55
            Height = 13
            EllipsType = bsetNone
            UseSkinFont = True
            UseSkinColor = True
            DefaultFont.Charset = DEFAULT_CHARSET
            DefaultFont.Color = clWindowText
            DefaultFont.Height = -11
            DefaultFont.Name = 'MS Sans Serif'
            DefaultFont.Style = []
            SkinData = frmPrincipal.SkinPrincipal
            SkinDataName = 'stdlabel'
            Caption = 'Quantidade'
          end
          object bsSkinStdLabel5: TbsSkinStdLabel
            Left = 131
            Top = 13
            Width = 48
            Height = 13
            EllipsType = bsetNone
            UseSkinFont = True
            UseSkinColor = True
            DefaultFont.Charset = DEFAULT_CHARSET
            DefaultFont.Color = clWindowText
            DefaultFont.Height = -11
            DefaultFont.Name = 'MS Sans Serif'
            DefaultFont.Style = []
            SkinData = frmPrincipal.SkinPrincipal
            SkinDataName = 'stdlabel'
            Caption = 'Descricao'
          end
          object edtCod_Produto: TbsSkinEdit
            Left = 54
            Top = 10
            Width = 65
            Height = 20
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
            TabOrder = 0
            ButtonImageIndex = -1
            LeftImageIndex = -1
            LeftImageHotIndex = -1
            LeftImageDownIndex = -1
            RightImageIndex = -1
            RightImageHotIndex = -1
            RightImageDownIndex = -1
            OnExit = edtCod_ProdutoExit
          end
          object cmbNome_Produto: TbsSkinDBLookupComboBox
            Left = 188
            Top = 10
            Width = 241
            Height = 20
            HintImageIndex = 0
            TabOrder = 1
            SkinData = frmPrincipal.SkinPrincipal
            SkinDataName = 'combobox'
            DefaultFont.Charset = DEFAULT_CHARSET
            DefaultFont.Color = clWindowText
            DefaultFont.Height = 14
            DefaultFont.Name = 'Arial'
            DefaultFont.Style = []
            DefaultWidth = 0
            DefaultHeight = 20
            UseSkinFont = True
            DefaultColor = clWindow
            ListBoxDefaultItemHeight = 20
            ListBoxUseSkinFont = True
            ListBoxUseSkinItemHeight = True
            KeyField = 'codigo'
            ListField = 'Descricao;Codigo'
            ListSource = SrcProdutos
            OnChange = cmbNome_ProdutoChange
          end
          object edtQtde_Venda: TbsSkinEdit
            Left = 501
            Top = 11
            Width = 42
            Height = 20
            Text = '0'
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
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = 14
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            ButtonImageIndex = -1
            LeftImageIndex = -1
            LeftImageHotIndex = -1
            LeftImageDownIndex = -1
            RightImageIndex = -1
            RightImageHotIndex = -1
            RightImageDownIndex = -1
          end
          object btnAcessar: TbsSkinButton
            Left = 550
            Top = 4
            Width = 89
            Height = 29
            HintImageIndex = 0
            TabOrder = 3
            SkinDataName = 'button'
            DefaultFont.Charset = DEFAULT_CHARSET
            DefaultFont.Color = clWindowText
            DefaultFont.Height = 14
            DefaultFont.Name = 'Arial'
            DefaultFont.Style = []
            DefaultWidth = 0
            DefaultHeight = 0
            UseSkinFont = False
            Transparent = False
            CheckedMode = False
            ImageList = frmPrincipal.Imagebutoes
            ImageIndex = 10
            AlwaysShowLayeredFrame = False
            UseSkinSize = False
            UseSkinFontColor = True
            RepeatMode = False
            RepeatInterval = 100
            AllowAllUp = False
            TabStop = True
            CanFocused = True
            Down = False
            GroupIndex = 0
            Caption = ' &Adicionar'
            NumGlyphs = 1
            Spacing = 1
            OnClick = btnAcessarClick
          end
          object btnRemover: TbsSkinButton
            Left = 646
            Top = 4
            Width = 89
            Height = 29
            HintImageIndex = 0
            TabOrder = 4
            SkinDataName = 'button'
            DefaultFont.Charset = DEFAULT_CHARSET
            DefaultFont.Color = clWindowText
            DefaultFont.Height = 14
            DefaultFont.Name = 'Arial'
            DefaultFont.Style = []
            DefaultWidth = 0
            DefaultHeight = 0
            UseSkinFont = False
            Transparent = False
            CheckedMode = False
            ImageList = frmPrincipal.Imagebutoes
            ImageIndex = 9
            AlwaysShowLayeredFrame = False
            UseSkinSize = False
            UseSkinFontColor = True
            RepeatMode = False
            RepeatInterval = 100
            AllowAllUp = False
            TabStop = True
            CanFocused = True
            Down = False
            GroupIndex = 0
            Caption = ' &Remover'
            NumGlyphs = 1
            Spacing = 1
            OnClick = btnRemoverClick
          end
        end
      end
      object btn: TbsSkinDBGrid
        Left = 0
        Top = 97
        Width = 729
        Height = 236
        HintImageIndex = 0
        TabOrder = 1
        SkinDataName = 'grid'
        Transparent = False
        WallpaperStretch = False
        UseSkinFont = True
        UseSkinCellHeight = True
        VScrollBar = bsSkinScrollBar1
        GridLineColor = clWindowText
        DefaultCellHeight = 20
        ColSizingwithLine = False
        DrawGraphicFields = False
        UseColumnsFont = False
        DefaultRowHeight = 18
        MouseWheelSupport = False
        SaveMultiSelection = False
        PickListBoxSkinDataName = 'listbox'
        PickListBoxCaptionMode = False
        Align = alClient
        DataSource = srcTempProdutos
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBtnText
        TitleFont.Height = 14
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Width = 341
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'qtde_enviada'
            Title.Caption = 'Qtde. Enviada'
            Width = 80
            Visible = True
          end>
      end
      object bsSkinScrollBar1: TbsSkinScrollBar
        Left = 729
        Top = 97
        Width = 19
        Height = 236
        HintImageIndex = 0
        TabOrder = 2
        SkinData = frmPrincipal.SkinPrincipal
        SkinDataName = 'vscrollbar'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        DefaultWidth = 19
        DefaultHeight = 0
        UseSkinFont = True
        Both = False
        BothMarkerWidth = 19
        BothSkinDataName = 'bothhscrollbar'
        CanFocused = False
        Align = alRight
        Kind = sbVertical
        PageSize = 1
        Min = 1
        Max = 0
        Position = 1
        SmallChange = 1
        LargeChange = 1
      end
    end
  end
  object QryVariavel: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = frmPrincipal.dbxPrincipal
    Left = 341
    Top = 322
  end
  object dspVariavel: TDataSetProvider
    DataSet = QryVariavel
    Left = 341
    Top = 349
  end
  object cdsVendedores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVariavel'
    Left = 400
    Top = 352
  end
  object SrcVendedores: TDataSource
    DataSet = cdsVendedores
    Left = 400
    Top = 380
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVariavel'
    Left = 428
    Top = 352
  end
  object SrcProdutos: TDataSource
    DataSet = cdsProdutos
    Left = 428
    Top = 380
  end
  object cdsTempProdutos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 456
    Top = 352
    Data = {
      5C0000009619E0BD0100000018000000030000000000030000005C0006436F64
      69676F04000100000000000944657363726963616F0100490000000100055749
      4454480200020032000C717464655F656E766961646108000400000000000000}
    object cdsTempProdutosCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsTempProdutosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object cdsTempProdutosqtde_enviada: TFloatField
      FieldName = 'qtde_enviada'
    end
  end
  object srcTempProdutos: TDataSource
    DataSet = cdsTempProdutos
    Left = 456
    Top = 380
  end
  object srcRemessas: TDataSource
    DataSet = cdsRemessas
    Left = 152
    Top = 188
  end
  object cdsRemessas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVariavel'
    AfterScroll = cdsRemessasAfterScroll
    Left = 152
    Top = 160
  end
  object srcItensRemessa: TDataSource
    Left = 136
    Top = 340
  end
end
