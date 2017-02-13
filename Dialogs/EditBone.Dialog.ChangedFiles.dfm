inherited ChangedFilesDialog: TChangedFilesDialog
  BorderStyle = bsSizeable
  Caption = 'Reload changed files'
  ClientHeight = 300
  ClientWidth = 635
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PanelButtons: TBCPanel [0]
    AlignWithMargins = True
    Left = 3
    Top = 264
    Width = 626
    Height = 33
    Margins.Top = 0
    Margins.Right = 6
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    SkinData.SkinSection = 'CHECKBOX'
    object ButtonFind: TButton
      AlignWithMargins = True
      Left = 468
      Top = 5
      Width = 75
      Height = 25
      Margins.Top = 5
      Align = alRight
      Caption = '&Reload'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object ButtonCancel: TButton
      AlignWithMargins = True
      Left = 551
      Top = 5
      Width = 75
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 0
      Align = alRight
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object VirtualDrawTree: TVirtualDrawTree [1]
    AlignWithMargins = True
    Left = 0
    Top = 6
    Width = 635
    Height = 258
    Margins.Left = 0
    Margins.Top = 6
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Ctl3D = True
    DragOperations = []
    EditDelay = 0
    Header.AutoSizeIndex = 0
    Header.DefaultHeight = 20
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'Tahoma'
    Header.Font.Style = []
    Header.Height = 20
    Header.Options = [hoAutoResize, hoShowImages, hoShowSortGlyphs, hoVisible, hoAutoSpring]
    Images = ImagesDataModule.ImageListSmall
    Indent = 0
    ParentCtl3D = False
    SelectionBlendFactor = 255
    TabOrder = 1
    TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoChangeScale]
    TreeOptions.MiscOptions = [toCheckSupport, toFullRepaintOnResize, toToggleOnDblClick, toWheelPanning]
    TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowRoot, toThemeAware, toGhostedIfUnfocused]
    TreeOptions.SelectionOptions = [toFullRowSelect, toMiddleClickSelect]
    WantTabs = True
    OnDrawNode = VirtualDrawTreeDrawNode
    OnFreeNode = VirtualDrawTreeFreeNode
    OnGetNodeWidth = VirtualDrawTreeGetNodeWidth
    OnInitNode = VirtualDrawTreeInitNode
    Columns = <
      item
        Options = [coEnabled, coParentBidiMode, coParentColor, coVisible, coAutoSpring]
        Position = 0
        Width = 235
        WideText = 'File'
      end
      item
        Position = 1
        Width = 400
        WideText = 'Path'
      end>
  end
end
