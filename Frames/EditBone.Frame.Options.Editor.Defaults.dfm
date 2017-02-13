inherited OptionsEditorDefaultsFrame: TOptionsEditorDefaultsFrame
  Width = 353
  Height = 214
  Visible = False
  object Panel: TBCPanel [0]
    AlignWithMargins = True
    Left = 4
    Top = 0
    Width = 349
    Height = 214
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    AutoSize = True
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'CHECKBOX'
    object ComboBoxDefaultColor: TBCComboBox
      Left = 0
      Top = 17
      Width = 186
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Alignment = taLeftJustify
      BoundLabel.Active = True
      BoundLabel.Caption = 'Color'
      BoundLabel.Indent = 4
      BoundLabel.Layout = sclTopLeft
      DropDownCount = 9
      SkinData.SkinSection = 'COMBOBOX'
      VerticalAlignment = taAlignTop
      Style = csOwnerDrawFixed
      ItemIndex = -1
      TabOrder = 0
      UseMouseWheel = False
    end
    object ComboBoxDefaultEncoding: TBCComboBox
      Left = 0
      Top = 61
      Width = 186
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Alignment = taLeftJustify
      BoundLabel.Active = True
      BoundLabel.Caption = 'Encoding'
      BoundLabel.Indent = 4
      BoundLabel.Layout = sclTopLeft
      DropDownCount = 9
      SkinData.SkinSection = 'COMBOBOX'
      VerticalAlignment = taAlignTop
      Style = csOwnerDrawFixed
      ItemIndex = -1
      TabOrder = 1
      UseMouseWheel = False
    end
    object ComboBoxDefaultHighlighter: TBCComboBox
      Left = 0
      Top = 105
      Width = 186
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Alignment = taLeftJustify
      BoundLabel.Active = True
      BoundLabel.Caption = 'Highlighter '
      BoundLabel.Indent = 4
      BoundLabel.Layout = sclTopLeft
      DropDownCount = 9
      SkinData.SkinSection = 'COMBOBOX'
      VerticalAlignment = taAlignTop
      Style = csOwnerDrawFixed
      ItemIndex = -1
      TabOrder = 2
      UseMouseWheel = False
    end
    object ComboBoxDefaultSQLHighlighter: TBCComboBox
      Left = 0
      Top = 149
      Width = 186
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Alignment = taLeftJustify
      BoundLabel.Active = True
      BoundLabel.Caption = 'SQL highlighter '
      BoundLabel.Indent = 4
      BoundLabel.Layout = sclTopLeft
      DropDownCount = 9
      SkinData.SkinSection = 'COMBOBOX'
      VerticalAlignment = taAlignTop
      Style = csOwnerDrawFixed
      ItemIndex = -1
      TabOrder = 3
      UseMouseWheel = False
    end
    object PanelDirectoryComboBoxAndButton: TBCPanel
      Left = 0
      Top = 174
      Width = 349
      Height = 40
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 2
      BevelOuter = bvNone
      TabOrder = 4
      SkinData.SkinSection = 'CHECKBOX'
      object PanelDirectoryComboBoxRight: TBCPanel
        Left = 328
        Top = 0
        Width = 21
        Height = 40
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        SkinData.SkinSection = 'CHECKBOX'
        object PanelDirectoryButton: TBCPanel
          Left = 0
          Top = 19
          Width = 21
          Height = 21
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          SkinData.SkinSection = 'CHECKBOX'
          object SpeedButtonBrowser: TBCSpeedButton
            Left = 0
            Top = 0
            Width = 21
            Height = 21
            Action = ActionBrowserButtonClick
            Align = alLeft
            Flat = True
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000300000
              0033000000330000003300000033000000330000003300000033000000330000
              00330000003300000033000000330000002F00000000000000004598D1F24398
              D2FF4094D0FF3E92CFFF3E92CEFF3F92CEFF3F92CEFF3F92CEFF3F92CEFF3F92
              CEFF3F92CEFF3F92CEFF3F93CFFF4194CEF00000000E469AD3004499D2FF3F94
              D0FFABFBFFFF9BF3FFFF92F1FFFF93F1FFFF93F1FFFF93F1FFFF93F1FFFF93F1
              FFFF93F1FFFF93F1FFFFA6F8FFFF65B8E3FF31709D5F469AD3004398D2FF4FA6
              D9FF8EDAF5FFA2EEFFFF82E5FEFF84E5FEFF84E5FEFF85E6FEFF85E6FEFF85E6
              FEFF85E6FEFF84E6FEFF96EBFFFF8CD8F5FF3985BCB84499D2004296D1FF6BBE
              E8FF6DBDE6FFBBF2FFFF75DEFDFF77DEFCFF78DEFCFF7BDFFCFF7DDFFCFF7DDF
              FCFF7DDFFCFF7CDFFCFF80E0FDFFADF0FFFF4D9DD3FF0000000E4095D0FF8AD7
              F5FF44A1D8FFDDFDFFFFDAFAFFFFDBFAFFFFDEFAFFFF74DCFCFF76DBFAFF75DA
              FAFF74DAFAFF74DAFAFF72D9FAFFA1E8FFFF7CBFE6FF306F9C5E3E94D0FFABF0
              FFFF449DD6FF368CCBFF368CCBFF368CCBFF378BCBFF5CBEEAFF6FD9FBFF6AD6
              FAFF68D5F9FF67D4F9FF66D4F9FF82DEFCFFAAE0F6FF3885BCB93D92CFFFB9F4
              FFFF73DBFBFF6BCCF2FF6CCDF3FF6CCEF3FF6DCEF3FF479CD4FF56BAE9FFDAF8
              FFFFD7F6FFFFD6F6FFFFD5F6FFFFD5F7FFFFDBFCFFFF3E94D0FF3C92CFFFC0F3
              FFFF71DAFBFF74DBFBFF75DBFCFF75DBFCFF76DCFCFF73DAFAFF449CD4FF378C
              CBFF368CCBFF358CCCFF348DCCFF3890CEFF3D94D0FF4398D2EB3B92CFFFCAF6
              FFFF69D5F9FF6CD5F9FF6BD5F9FF69D5F9FF69D5FAFF6AD7FBFF68D4FAFF5EC7
              F1FF5EC7F2FF5DC8F2FFB4E3F8FF3D94D0FF3F8FC669469AD3003B92CFFFD5F7
              FFFF60D1F9FF61D0F8FFB4EBFDFFD9F6FFFFDAF8FFFFDAF8FFFFDBF9FFFFDCFA
              FFFFDCFAFFFFDCFBFFFFE0FFFFFF3E95D0FF4599D333469AD3003D94D0FFDCFC
              FFFFD8F7FFFFD8F7FFFFDBFAFFFF358ECDFF3991CEFF3A92CFFF3A92CFFF3A92
              CFFF3A92CFFF3B92CFFF3D94D0FF4398D2D7469AD300469AD3004398D2B03D94
              D0FF3A92CFFF3A92CFFF3D94D0FF4197D1D24398D2004498D2004498D2004498
              D2004498D2004499D2004499D300459AD300469AD300469AD300FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 0
          end
        end
      end
      object PanelDirectoryComboBoxClient: TBCPanel
        Left = 0
        Top = 0
        Width = 328
        Height = 40
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 3
        TabOrder = 0
        SkinData.SkinSection = 'CHECKBOX'
        object EditBrowser: TBCEdit
          Left = 0
          Top = 19
          Width = 325
          Height = 21
          Align = alBottom
          TabOrder = 0
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Browser'
          BoundLabel.Indent = 4
          BoundLabel.Layout = sclTopLeft
          EnterToTab = False
          OnlyNumbers = False
          NumbersWithDots = False
          NumbersWithSpots = False
          ErrorColor = 14803455
          NumbersAllowMinus = False
          NumbersAllowPlus = False
        end
      end
    end
  end
  inherited FrameAdapter: TsFrameAdapter
    Left = 142
    Top = 30
  end
  object ActionList: TActionList
    Left = 221
    Top = 136
    object ActionBrowserButtonClick: TAction
      ImageIndex = 0
      OnExecute = ActionBrowserButtonClickExecute
    end
  end
  object OpenDialog: TsOpenDialog
    DefaultExt = 'exe'
    Filter = 'Application (*.exe)|*.exe'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Title = 'Select browser'
    Left = 231
    Top = 66
  end
end
