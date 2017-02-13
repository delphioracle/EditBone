inherited MainForm: TMainForm
  Caption = 'EditBone'
  ClientHeight = 722
  ClientWidth = 1111
  KeyPreview = True
  OldCreateOrder = True
  Position = poDefault
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SplitterHorizontal: TBCSplitter [0]
    Left = 0
    Top = 574
    Width = 1111
    Height = 5
    Cursor = crVSplit
    Align = alBottom
    Visible = False
    SkinData.SkinSection = 'SPLITTER'
  end
  inherited StatusBar: TBCStatusBar
    AlignWithMargins = True
    Top = 703
    Width = 1111
    Margins.Left = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Panels = <
      item
        Width = 64
      end
      item
        Alignment = taCenter
        Style = psOwnerDraw
        Width = 88
      end
      item
        Width = 88
      end
      item
        Width = 88
      end
      item
        Width = 50
      end>
    ParentFont = True
    ParentShowHint = False
    ShowHint = True
    UseSystemFont = False
    OnDrawPanel = StatusBarDrawPanel
    object SpeedButtonMacroPlay: TBCSpeedButton
      Left = 2
      Top = 2
      Width = 16
      Height = 16
      Action = ActionMacroPlayback
      Flat = True
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 87
      ShowCaption = False
    end
    object SpeedButtonMacroRecordPause: TBCSpeedButton
      Left = 20
      Top = 2
      Width = 16
      Height = 16
      Action = ActionMacroRecord
      Flat = True
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 88
      ShowCaption = False
    end
    object SpeedButtonMacroStop: TBCSpeedButton
      Left = 38
      Top = 2
      Width = 16
      Height = 16
      Action = ActionMacroStop
      Flat = True
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 90
      ShowCaption = False
    end
  end
  object PanelMenuBar: TBCPanel [2]
    Left = 0
    Top = 28
    Width = 1111
    Height = 91
    Align = alTop
    BevelOuter = bvNone
    DoubleBuffered = False
    ParentDoubleBuffered = False
    TabOrder = 3
    SkinData.SkinSection = 'CHECKBOX'
    object PageControlToolbar: TBCPageControl
      AlignWithMargins = True
      Left = 0
      Top = 3
      Width = 1111
      Height = 88
      Margins.Left = 0
      Margins.Right = 0
      Margins.Bottom = 0
      ActivePage = TabSheetFile
      Align = alClient
      DoubleBuffered = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      HotTrack = True
      Images = ImagesDataModule.ImageListSmall
      MultiLine = True
      ParentDoubleBuffered = False
      ParentFont = False
      TabHeight = 22
      TabOrder = 0
      ActiveIsBold = True
      TabPadding = 6
      TabSpacing = 8
      SkinData.SkinSection = 'RIBBONPAGE'
      SkinData.OuterEffects.Visibility = ovAlways
      HoldShiftToDragDrop = False
      TabDragDrop = False
      object TabSheetButton: TsTabSheet
        ImageIndex = 86
        TabType = ttMenu
        TabMenu = PopupMenuToolbar
        TabSkin = 'CHECKBOX'
      end
      object TabSheetFile: TsTabSheet
        Caption = 'File'
        ImageIndex = -1
        TabSkin = 'RIBBONTAB'
        object PanelFileButtons: TBCPanel
          Left = 0
          Top = 0
          Width = 1103
          Height = 56
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          SkinData.SkinSection = 'TRANSPARENT'
          object SpeedButtonFileNew: TBCSpeedButton
            Left = 0
            Top = 0
            Width = 60
            Height = 56
            Action = ActionFileNew
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 0
          end
          object SpeedButtonFileOpen: TBCSpeedButton
            Left = 60
            Top = 0
            Width = 60
            Height = 56
            Action = ActionFileOpen
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 1
          end
          object SpeedButtonFileReopen: TBCSpeedButton
            Left = 120
            Top = 0
            Width = 70
            Height = 56
            Action = ActionFileReopen
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDropDown
            SkinData.SkinSection = 'TOOLBUTTON'
            DropdownMenu = PopupMenuFileReopen
            Images = ImagesDataModule.ImageList
            ImageIndex = 2
          end
          object SpeedButtonFileDivider1: TBCSpeedButton
            AlignWithMargins = True
            Left = 190
            Top = 4
            Width = 10
            Height = 48
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonFileSave: TBCSpeedButton
            Left = 200
            Top = 0
            Width = 60
            Height = 56
            Action = ActionFileSave
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 3
          end
          object SpeedButtonFileSaveAs: TBCSpeedButton
            Left = 260
            Top = 0
            Width = 60
            Height = 56
            Action = ActionFileSaveAs
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 4
          end
          object SpeedButtonFileSaveAll: TBCSpeedButton
            Left = 320
            Top = 0
            Width = 60
            Height = 56
            Action = ActionFileSaveAll
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 5
          end
          object SpeedButtonFileDivider2: TBCSpeedButton
            AlignWithMargins = True
            Left = 566
            Top = 4
            Width = 10
            Height = 48
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonCloseAllOther: TBCSpeedButton
            Left = 500
            Top = 0
            Width = 66
            Height = 56
            Action = ActionFileCloseAllOther
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 8
          end
          object SpeedButtonCloseAll: TBCSpeedButton
            Left = 440
            Top = 0
            Width = 60
            Height = 56
            Action = ActionFileCloseAll
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 7
          end
          object SpeedButtonClose: TBCSpeedButton
            Left = 380
            Top = 0
            Width = 60
            Height = 56
            Action = ActionFileClose
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 6
          end
          object SpeedButtonFilePrint: TBCSpeedButton
            Left = 576
            Top = 0
            Width = 60
            Height = 56
            Action = ActionFilePrint
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 9
          end
          object SpeedButtonFilePrintPreview: TBCSpeedButton
            Left = 636
            Top = 0
            Width = 60
            Height = 56
            Action = ActionFilePrintPreview
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 10
          end
          object SpeedButtonFileDivider3: TBCSpeedButton
            AlignWithMargins = True
            Left = 696
            Top = 4
            Width = 10
            Height = 48
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonFileExit: TBCSpeedButton
            Left = 706
            Top = 0
            Width = 60
            Height = 56
            Action = ActionFileExit
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 11
          end
        end
      end
      object TabSheetEdit: TsTabSheet
        Caption = 'Edit'
        ImageIndex = -1
        TabSkin = 'RIBBONTAB'
        object PanelEditButtons: TBCPanel
          Left = 0
          Top = 0
          Width = 1103
          Height = 56
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          SkinData.SkinSection = 'TRANSPARENT'
          object SpeedButtonEditUndo: TBCSpeedButton
            Left = 0
            Top = 0
            Width = 60
            Height = 56
            Action = ActionEditUndo
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 12
          end
          object SpeedButtonEditRedo: TBCSpeedButton
            Left = 60
            Top = 0
            Width = 60
            Height = 56
            Action = ActionEditRedo
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 13
          end
          object SpeedButtonEditDivider1: TBCSpeedButton
            AlignWithMargins = True
            Left = 120
            Top = 4
            Width = 10
            Height = 48
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonEditCut: TBCSpeedButton
            Left = 130
            Top = 0
            Width = 60
            Height = 56
            Action = ActionEditCut
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 14
          end
          object SpeedButtonEditCopy: TBCSpeedButton
            Left = 190
            Top = 0
            Width = 60
            Height = 56
            Action = ActionEditCopy
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 15
          end
          object SpeedButtonEditPaste: TBCSpeedButton
            Left = 250
            Top = 0
            Width = 60
            Height = 56
            Action = ActionEditPaste
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 16
          end
          object SpeedButtonEditDivider2: TBCSpeedButton
            AlignWithMargins = True
            Left = 370
            Top = 4
            Width = 10
            Height = 48
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonEditSelectAll: TBCSpeedButton
            Left = 310
            Top = 0
            Width = 60
            Height = 56
            Action = ActionEditSelectAll
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 17
          end
          object SpeedButtonEditInsert: TBCSpeedButton
            Left = 380
            Top = 0
            Width = 70
            Height = 56
            Action = ActionEditInsert
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDropDown
            SkinData.SkinSection = 'TOOLBUTTON'
            DropdownMenu = PopupMenuEditInsert
            Images = ImagesDataModule.ImageList
            ImageIndex = 18
          end
          object SpeedButtonEditDelete: TBCSpeedButton
            Left = 450
            Top = 0
            Width = 70
            Height = 56
            Action = ActionEditDelete
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDropDown
            SkinData.SkinSection = 'TOOLBUTTON'
            DropdownMenu = PopupMenuEditDelete
            Images = ImagesDataModule.ImageList
            ImageIndex = 22
          end
          object SpeedButtonEditDivider3: TBCSpeedButton
            AlignWithMargins = True
            Left = 520
            Top = 4
            Width = 10
            Height = 48
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonEditSort: TBCSpeedButton
            Left = 600
            Top = 0
            Width = 70
            Height = 56
            Action = ActionEditSort
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDropDown
            SkinData.SkinSection = 'TOOLBUTTON'
            DropdownMenu = PopupMenuEditSort
            Images = ImagesDataModule.ImageList
            ImageIndex = 30
          end
          object SpeedButtonEditIndent: TBCSpeedButton
            Left = 530
            Top = 0
            Width = 70
            Height = 56
            Action = ActionEditIndent
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDropDown
            SkinData.SkinSection = 'TOOLBUTTON'
            DropdownMenu = PopupMenuEditIndent
            Images = ImagesDataModule.ImageList
            ImageIndex = 27
          end
          object SpeedButtonEditDivider4: TBCSpeedButton
            AlignWithMargins = True
            Left = 670
            Top = 4
            Width = 10
            Height = 48
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonEditToggleCase: TBCSpeedButton
            Left = 680
            Top = 0
            Width = 76
            Height = 56
            Action = ActionEditToggleCase
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDropDown
            SkinData.SkinSection = 'TOOLBUTTON'
            DropdownMenu = PopupMenuToggleCase
            Images = ImagesDataModule.ImageList
            ImageIndex = 33
          end
        end
      end
      object TabSheetSearch: TsTabSheet
        Caption = 'Search'
        ImageIndex = -1
        TabSkin = 'RIBBONTAB'
        object PanelSearchButtons: TBCPanel
          Left = 0
          Top = 0
          Width = 1103
          Height = 56
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          SkinData.SkinSection = 'TRANSPARENT'
          object SpeedButtonSearchSearch: TBCSpeedButton
            Left = 0
            Top = 0
            Width = 60
            Height = 56
            Action = ActionSearchSearchButton
            Align = alLeft
            AllowAllUp = True
            GroupIndex = 10
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 34
          end
          object SpeedButtonSearchReplace: TBCSpeedButton
            Left = 60
            Top = 0
            Width = 60
            Height = 56
            Action = ActionSearchReplace
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 35
          end
          object SpeedButtonSearchDivider1: TBCSpeedButton
            AlignWithMargins = True
            Left = 180
            Top = 4
            Width = 10
            Height = 48
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonSearchFindInFiles: TBCSpeedButton
            Left = 120
            Top = 0
            Width = 60
            Height = 56
            Action = ActionSearchFindInFiles
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 36
          end
          object SpeedButtonSearchToggleBookmark: TBCSpeedButton
            Left = 190
            Top = 0
            Width = 80
            Height = 56
            Action = ActionSearchToggleBookmark
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 39
          end
          object SpeedButtonSearchToggleBookmarks: TBCSpeedButton
            Left = 270
            Top = 0
            Width = 94
            Height = 56
            Action = ActionSearchToggleBookmarks
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDropDown
            SkinData.SkinSection = 'TOOLBUTTON'
            DropdownMenu = PopupMenuSearchToggleBookmarks
            Images = ImagesDataModule.ImageList
            ImageIndex = 40
          end
          object SpeedButtonSearchGoToBookmarks: TBCSpeedButton
            Left = 364
            Top = 0
            Width = 94
            Height = 56
            Action = ActionSearchGoToBookmarks
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDropDown
            SkinData.SkinSection = 'TOOLBUTTON'
            DropdownMenu = PopupMenuSearchGotoBookmarks
            Images = ImagesDataModule.ImageList
            ImageIndex = 41
          end
          object SpeedButtonSearchDivider2: TBCSpeedButton
            AlignWithMargins = True
            Left = 538
            Top = 4
            Width = 10
            Height = 48
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonSearchClearBookmarks: TBCSpeedButton
            Left = 458
            Top = 0
            Width = 80
            Height = 56
            Action = ActionSearchClearBookmarks
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 42
          end
          object SpeedButtonSearchGoToLine: TBCSpeedButton
            Left = 548
            Top = 0
            Width = 60
            Height = 56
            Action = ActionSearchGoToLine
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 43
          end
        end
      end
      object TabSheetView: TsTabSheet
        Caption = 'View'
        ImageIndex = -1
        TabSkin = 'RIBBONTAB'
        object PanelViewButtons: TBCPanel
          Left = 0
          Top = 0
          Width = 1103
          Height = 56
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          SkinData.SkinSection = 'TRANSPARENT'
          object SpeedButtonViewOpenDirectory: TBCSpeedButton
            Left = 0
            Top = 0
            Width = 60
            Height = 56
            Action = ActionViewOpenDirectory
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 53
          end
          object SpeedButtonViewCloseDirectory: TBCSpeedButton
            Left = 60
            Top = 0
            Width = 60
            Height = 56
            Action = ActionViewCloseDirectory
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 54
          end
          object SpeedButtonViewDivider1: TBCSpeedButton
            AlignWithMargins = True
            Left = 180
            Top = 4
            Width = 10
            Height = 48
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonViewEditDirectory: TBCSpeedButton
            Left = 120
            Top = 0
            Width = 60
            Height = 56
            Action = ActionViewEditDirectory
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 55
          end
          object SpeedButtonViewFiles: TBCSpeedButton
            Left = 190
            Top = 0
            Width = 60
            Height = 56
            Action = ActionViewFiles
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 56
          end
          object SpeedButtonViewWordWrap: TBCSpeedButton
            Left = 260
            Top = 0
            Width = 60
            Height = 56
            Action = ActionViewWordWrap
            Align = alLeft
            AllowAllUp = True
            GroupIndex = 1
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 57
          end
          object SpeedButtonViewDivider2: TBCSpeedButton
            AlignWithMargins = True
            Left = 250
            Top = 4
            Width = 10
            Height = 48
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonViewSelectionMode: TBCSpeedButton
            Left = 440
            Top = 0
            Width = 60
            Height = 56
            Action = ActionViewSelectionMode
            Align = alLeft
            AllowAllUp = True
            GroupIndex = 4
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 60
          end
          object SpeedButtonViewSpecialChars: TBCSpeedButton
            Left = 380
            Top = 0
            Width = 60
            Height = 56
            Action = ActionViewSpecialChars
            Align = alLeft
            AllowAllUp = True
            GroupIndex = 3
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 59
          end
          object SpeedButtonViewLineNumbers: TBCSpeedButton
            Left = 320
            Top = 0
            Width = 60
            Height = 56
            Action = ActionViewLineNumbers
            Align = alLeft
            AllowAllUp = True
            GroupIndex = 2
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 58
          end
          object SpeedButtonViewPreviousPage: TBCSpeedButton
            Left = 900
            Top = 0
            Width = 60
            Height = 56
            Action = ActionViewPreviousPage
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 61
          end
          object SpeedButtonViewDivider3: TBCSpeedButton
            AlignWithMargins = True
            Left = 740
            Top = 4
            Width = 10
            Height = 48
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonViewNextPage: TBCSpeedButton
            Left = 960
            Top = 0
            Width = 60
            Height = 56
            Action = ActionViewNextPage
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 62
          end
          object SpeedButtonXMLTree: TBCSpeedButton
            Left = 680
            Top = 0
            Width = 60
            Height = 56
            Action = ActionViewXMLTree
            Align = alLeft
            AllowAllUp = True
            GroupIndex = 7
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 85
          end
          object SpeedButtonViewSplit: TBCSpeedButton
            Left = 560
            Top = 0
            Width = 60
            Height = 56
            Action = ActionViewSplit
            Align = alLeft
            AllowAllUp = True
            GroupIndex = 6
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 95
          end
          object SpeedButtonViewMinimap: TBCSpeedButton
            Left = 500
            Top = 0
            Width = 60
            Height = 56
            Action = ActionViewMinimap
            Align = alLeft
            AllowAllUp = True
            GroupIndex = 5
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 94
          end
          object SpeedButtonViewSyncEdit: TBCSpeedButton
            Left = 620
            Top = 0
            Width = 60
            Height = 56
            Hint = 'Show or hide synchronized editing'
            Action = ActionViewSyncEdit
            Align = alLeft
            AllowAllUp = True
            GroupIndex = 8
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 139
          end
          object SpeedButtonViewDivider4: TBCSpeedButton
            AlignWithMargins = True
            Left = 890
            Top = 4
            Width = 10
            Height = 48
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonViewUnfold: TBCSpeedButton
            Left = 820
            Top = 0
            Width = 70
            Height = 56
            Action = ActionViewUnfold
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDropDown
            SkinData.SkinSection = 'TOOLBUTTON'
            DropdownMenu = PopupMenuViewUnfold
            Images = ImagesDataModule.ImageList
            ImageIndex = 142
          end
          object SpeedButtonViewFold: TBCSpeedButton
            Left = 750
            Top = 0
            Width = 70
            Height = 56
            Action = ActionViewFold
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDropDown
            SkinData.SkinSection = 'TOOLBUTTON'
            DropdownMenu = PopupMenuViewFold
            Images = ImagesDataModule.ImageList
            ImageIndex = 141
          end
        end
      end
      object TabSheetDocument: TsTabSheet
        Caption = 'Document'
        ImageIndex = -1
        TabSkin = 'RIBBONTAB'
        object PanelDocumentButtons: TBCPanel
          Left = 0
          Top = 0
          Width = 1103
          Height = 56
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          SkinData.SkinSection = 'TRANSPARENT'
          object SpeedButtonDocumentInfo: TBCSpeedButton
            Left = 0
            Top = 0
            Width = 60
            Height = 56
            Action = ActionDocumentInfo
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 63
          end
          object SpeedButtonDocumentDivider1: TBCSpeedButton
            AlignWithMargins = True
            Left = 60
            Top = 4
            Width = 10
            Height = 48
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonDocumentViewInBrowser: TBCSpeedButton
            Left = 292
            Top = 0
            Width = 82
            Height = 56
            Action = ActionDocumentViewInBrowser
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 64
          end
          object SpeedButtonDocumentDivider2: TBCSpeedButton
            AlignWithMargins = True
            Left = 282
            Top = 4
            Width = 10
            Height = 48
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonDocumentFormat: TBCSpeedButton
            Left = 70
            Top = 0
            Width = 76
            Height = 56
            Action = ActionDocumentFormat
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDropDown
            SkinData.SkinSection = 'TOOLBUTTON'
            DropdownMenu = PopupMenuDocumentFormat
            Images = ImagesDataModule.ImageList
            ImageIndex = 65
          end
          object SpeedButtonDocumentMacro: TBCSpeedButton
            Left = 146
            Top = 0
            Width = 76
            Height = 56
            Action = ActionMacro
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDropDown
            SkinData.SkinSection = 'TOOLBUTTON'
            DropdownMenu = PopupMenuDocumentMacro
            Images = ImagesDataModule.ImageList
            ImageIndex = 136
          end
          object SpeedButtonDocumentHTMLExport: TBCSpeedButton
            Left = 222
            Top = 0
            Width = 60
            Height = 56
            Action = ActionDocumentHTMLExport
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 140
          end
        end
      end
      object TabSheetTools: TsTabSheet
        Caption = 'Tools'
        ImageIndex = -1
        TabSkin = 'RIBBONTAB'
        object PanelToolsButtons: TBCPanel
          Left = 0
          Top = 0
          Width = 1103
          Height = 56
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          SkinData.SkinSection = 'TRANSPARENT'
          object SpeedButtonToolsOptions: TBCSpeedButton
            Left = 0
            Top = 0
            Width = 60
            Height = 56
            Action = ActionToolsOptions
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 68
          end
          object SpeedButtonToolsCompareFiles: TBCSpeedButton
            Left = 70
            Top = 0
            Width = 60
            Height = 56
            Action = ActionToolsCompareFiles
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 69
          end
          object SpeedButtonToolsDivider1: TBCSpeedButton
            AlignWithMargins = True
            Left = 60
            Top = 4
            Width = 10
            Height = 48
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonToolsConvert: TBCSpeedButton
            Left = 130
            Top = 0
            Width = 60
            Height = 56
            Action = ActionToolsConvert
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 70
          end
          object SpeedButtonToolsCharacterMap: TBCSpeedButton
            Left = 250
            Top = 0
            Width = 76
            Height = 56
            Action = ActionToolsClipboardHistory
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 147
          end
          object SpeedButtonToolsDivider2: TBCSpeedButton
            AlignWithMargins = True
            Left = 326
            Top = 4
            Width = 10
            Height = 48
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonToolsLanguageEditor: TBCSpeedButton
            Left = 336
            Top = 0
            Width = 65
            Height = 56
            Action = ActionToolsLanguageEditor
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 75
          end
          object BCSpeedButton1: TBCSpeedButton
            Left = 190
            Top = 0
            Width = 60
            Height = 56
            Action = ActionToolsCharacterMap
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 71
          end
        end
      end
      object TabSheetHelp: TsTabSheet
        Caption = 'Help'
        ImageIndex = -1
        TabSkin = 'RIBBONTAB'
        object PanelHelpButtons: TBCPanel
          Left = 0
          Top = 0
          Width = 1103
          Height = 56
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          SkinData.SkinSection = 'TRANSPARENT'
          object SpeedButtonHelpCheckForUpdates: TBCSpeedButton
            Left = 0
            Top = 0
            Width = 81
            Height = 56
            Action = ActionHelpCheckForUpdates
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 72
          end
          object SpeedButtonHelpVisitHomepage: TBCSpeedButton
            Left = 91
            Top = 0
            Width = 68
            Height = 56
            Action = ActionHelpVisitHomepage
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 73
          end
          object SpeedButtonHelpDivider1: TBCSpeedButton
            AlignWithMargins = True
            Left = 81
            Top = 4
            Width = 10
            Height = 48
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonHelpAboutEditBone: TBCSpeedButton
            Left = 169
            Top = 0
            Width = 74
            Height = 56
            Action = ActionHelpAboutEditBone
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            Images = ImagesDataModule.ImageList
            ImageIndex = 74
          end
          object SpeedButtonHelpDivider2: TBCSpeedButton
            AlignWithMargins = True
            Left = 159
            Top = 4
            Width = 10
            Height = 48
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
        end
      end
    end
    object SkinSelector: TsSkinSelector
      Left = 962
      Top = 2
      Width = 145
      Height = 22
      ItemMargin = 8
      ShowNoSkin = False
      ThumbSize = tsMedium
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object PanelMiddle: TBCPanel [3]
    AlignWithMargins = True
    Left = 0
    Top = 123
    Width = 1111
    Height = 451
    Margins.Left = 0
    Margins.Top = 4
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    BevelOuter = bvNone
    DoubleBuffered = False
    ParentColor = True
    ParentDoubleBuffered = False
    TabOrder = 2
    SkinData.SkinSection = 'CHECKBOX'
    object SplitterVertical: TBCSplitter
      Left = 329
      Top = 0
      Width = 5
      Height = 451
      Visible = False
      SkinData.SkinSection = 'SPLITTER'
    end
    object PanelDirectory: TBCPanel
      Left = 0
      Top = 0
      Width = 329
      Height = 451
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alLeft
      BevelOuter = bvNone
      DoubleBuffered = False
      ParentColor = True
      ParentDoubleBuffered = False
      TabOrder = 0
      Visible = False
      SkinData.SkinSection = 'CHECKBOX'
      object PageControlDirectory: TBCPageControl
        Left = 0
        Top = 0
        Width = 329
        Height = 451
        ActivePage = TabSheetDirectory
        Align = alClient
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentDoubleBuffered = False
        ParentFont = False
        PopupMenu = PopupMenuFileTreeView
        TabHeight = 23
        TabOrder = 0
        OnMouseDown = PageControlDirectoryMouseDown
        TabPadding = 2
        SkinData.SkinSection = 'PAGECONTROL'
        OnDblClick = PageControlDirectoryDblClick
        OnCloseBtnClick = PageControlDirectoryCloseBtnClick
        HoldShiftToDragDrop = False
        RightClickSelect = True
        TabDragDrop = True
        object TabSheetDirectory: TsTabSheet
          DoubleBuffered = False
          ParentDoubleBuffered = False
          TabType = ttButton
          TabSkin = 'TRANSPARENT'
          OnClickBtn = TabSheetOpenClickBtn
        end
      end
    end
    object PanelDocument: TBCPanel
      Left = 334
      Top = 0
      Width = 777
      Height = 451
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Processing...'
      Color = clWindow
      DoubleBuffered = False
      ParentDoubleBuffered = False
      TabOrder = 1
      SkinData.SkinSection = 'CHECKBOX'
      object PageControlDocument: TBCPageControl
        Left = 0
        Top = 0
        Width = 777
        Height = 451
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 0
        ActivePage = TabSheetOpen
        Align = alClient
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        HotTrack = True
        MultiLine = True
        ParentDoubleBuffered = False
        ParentFont = False
        PopupMenu = PopupMenuDocument
        TabHeight = 23
        TabOrder = 0
        OnChange = PageControlDocumentChange
        OnMouseDown = PageControlDocumentMouseDown
        ShowCloseBtns = True
        SkinData.SkinSection = 'PAGECONTROL'
        OnDblClick = PageControlDocumentDblClick
        OnCloseBtnClick = PageControlDocumentCloseBtnClick
        HoldShiftToDragDrop = False
        TabDragDrop = True
        object TabSheetOpen: TsTabSheet
          Caption = '      '
          TabType = ttButton
          TabSkin = 'TRANSPARENT'
          OnClickBtn = ActionFileNewExecute
        end
      end
    end
  end
  object PanelToolbar: TBCPanel [4]
    Left = 0
    Top = 0
    Width = 1111
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    Color = clWindow
    Padding.Left = 2
    Padding.Top = 2
    Padding.Right = 2
    Padding.Bottom = 2
    ParentBackground = False
    TabOrder = 1
    Visible = False
    SkinData.SkinSection = 'CHECKBOX'
    object SpeedButtonToolbarFileNew: TBCSpeedButton
      Left = 2
      Top = 2
      Width = 36
      Height = 24
      Action = ActionFileNew
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 0
      ShowCaption = False
    end
    object SpeedButtonToolbarFileOpen: TBCSpeedButton
      Left = 38
      Top = 2
      Width = 36
      Height = 24
      Action = ActionFileOpen
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 1
      ShowCaption = False
    end
    object SpeedButtonToolbarDivider1: TBCSpeedButton
      AlignWithMargins = True
      Left = 74
      Top = 4
      Width = 10
      Height = 20
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = ActionFileOpenExecute
      ButtonStyle = tbsDivider
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
    end
    object SpeedButtonToolbarFileSave: TBCSpeedButton
      Left = 84
      Top = 2
      Width = 26
      Height = 24
      Action = ActionFileSave
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 3
      ShowCaption = False
    end
    object SpeedButtonToolbarFileSaveAs: TBCSpeedButton
      Left = 110
      Top = 2
      Width = 26
      Height = 24
      Action = ActionFileSaveAs
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 4
      ShowCaption = False
    end
    object SpeedButtonToolbarFileSaveAll: TBCSpeedButton
      Left = 136
      Top = 2
      Width = 26
      Height = 24
      Action = ActionFileSaveAll
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 5
      ShowCaption = False
    end
    object SpeedButtonToolbarFileClose: TBCSpeedButton
      Left = 162
      Top = 2
      Width = 26
      Height = 24
      Action = ActionFileClose
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 6
      ShowCaption = False
    end
    object SpeedButtonToolbarFileCloseAll: TBCSpeedButton
      Left = 188
      Top = 2
      Width = 26
      Height = 24
      Action = ActionFileCloseAll
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 7
      ShowCaption = False
    end
    object SpeedButtonToolbarDivider6: TBCSpeedButton
      AlignWithMargins = True
      Left = 488
      Top = 4
      Width = 10
      Height = 20
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = ActionFileOpenExecute
      ButtonStyle = tbsDivider
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
    end
    object SpeedButtonToolbarFilePrint: TBCSpeedButton
      Left = 224
      Top = 2
      Width = 26
      Height = 24
      Action = ActionFilePrint
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 9
      ShowCaption = False
    end
    object SpeedButtonToolbarFilePrintPreview: TBCSpeedButton
      Left = 250
      Top = 2
      Width = 26
      Height = 24
      Action = ActionFilePrintPreview
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 10
      ShowCaption = False
    end
    object SpeedButtonToolbarDivider3: TBCSpeedButton
      AlignWithMargins = True
      Left = 276
      Top = 4
      Width = 10
      Height = 20
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = ActionFileOpenExecute
      ButtonStyle = tbsDivider
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
    end
    object SpeedButtonToolbarDivider4: TBCSpeedButton
      AlignWithMargins = True
      Left = 364
      Top = 4
      Width = 10
      Height = 20
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = ActionFileOpenExecute
      ButtonStyle = tbsDivider
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
    end
    object SpeedButtonToolbarDivider5: TBCSpeedButton
      AlignWithMargins = True
      Left = 426
      Top = 4
      Width = 10
      Height = 20
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = ActionFileOpenExecute
      ButtonStyle = tbsDivider
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
    end
    object SpeedButtonToolbarDivider8: TBCSpeedButton
      AlignWithMargins = True
      Left = 586
      Top = 4
      Width = 10
      Height = 20
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = ActionFileOpenExecute
      ButtonStyle = tbsDivider
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
    end
    object SpeedButtonToolbarDivider7: TBCSpeedButton
      AlignWithMargins = True
      Left = 524
      Top = 4
      Width = 10
      Height = 20
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = ActionFileOpenExecute
      ButtonStyle = tbsDivider
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
    end
    object SpeedButtonToolbarDivider9: TBCSpeedButton
      AlignWithMargins = True
      Left = 674
      Top = 4
      Width = 10
      Height = 20
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = ActionFileOpenExecute
      ButtonStyle = tbsDivider
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
    end
    object SpeedButtonToolbarDivider10: TBCSpeedButton
      AlignWithMargins = True
      Left = 840
      Top = 4
      Width = 10
      Height = 20
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = ActionFileOpenExecute
      ButtonStyle = tbsDivider
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
    end
    object SpeedButtonToolbarDivider11: TBCSpeedButton
      AlignWithMargins = True
      Left = 876
      Top = 4
      Width = 10
      Height = 20
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = ActionFileOpenExecute
      ButtonStyle = tbsDivider
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
    end
    object SpeedButtonToolbarDivider2: TBCSpeedButton
      AlignWithMargins = True
      Left = 214
      Top = 4
      Width = 10
      Height = 20
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = ActionFileOpenExecute
      ButtonStyle = tbsDivider
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
    end
    object SpeedButtonToolbarViewOpenDirectory: TBCSpeedButton
      Left = 286
      Top = 2
      Width = 26
      Height = 24
      Action = ActionViewOpenDirectory
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 53
      ShowCaption = False
    end
    object SpeedButtonToolbarViewCloseDirectory: TBCSpeedButton
      Left = 312
      Top = 2
      Width = 26
      Height = 24
      Action = ActionViewCloseDirectory
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 54
      ShowCaption = False
    end
    object SpeedButtonToolbarViewEditDirectory: TBCSpeedButton
      Left = 338
      Top = 2
      Width = 26
      Height = 24
      Action = ActionViewEditDirectory
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 55
      ShowCaption = False
    end
    object SpeedButtonToolbarEditIndentIncrease: TBCSpeedButton
      Left = 374
      Top = 2
      Width = 26
      Height = 24
      Action = ActionEditIndentIncrease
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 28
      ShowCaption = False
    end
    object SpeedButtonToolbarEditIndentDecrease: TBCSpeedButton
      Left = 400
      Top = 2
      Width = 26
      Height = 24
      Action = ActionEditIndentDecrease
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 29
      ShowCaption = False
    end
    object SpeedButtonToolbarEditSortAsc: TBCSpeedButton
      Left = 436
      Top = 2
      Width = 26
      Height = 24
      Action = ActionEditSortAsc
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 31
      ShowCaption = False
    end
    object SpeedButtonToolbarEditSortDesc: TBCSpeedButton
      Left = 462
      Top = 2
      Width = 26
      Height = 24
      Action = ActionEditSortDesc
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 32
      ShowCaption = False
    end
    object SpeedButtonToolbarEditToggleCase: TBCSpeedButton
      Left = 498
      Top = 2
      Width = 26
      Height = 24
      Action = ActionEditToggleCase
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 33
      ShowCaption = False
    end
    object SpeedButtonToolbarEditUndo: TBCSpeedButton
      Left = 534
      Top = 2
      Width = 26
      Height = 24
      Action = ActionEditUndo
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 12
      ShowCaption = False
    end
    object SpeedButtonToolbarEditRedo: TBCSpeedButton
      Left = 560
      Top = 2
      Width = 26
      Height = 24
      Action = ActionEditRedo
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 13
      ShowCaption = False
    end
    object SpeedButtonToolbarSearchSearch: TBCSpeedButton
      Left = 596
      Top = 2
      Width = 26
      Height = 24
      Action = ActionSearchSearchButton
      Align = alLeft
      GroupIndex = 10
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 34
      ShowCaption = False
    end
    object SpeedButtonToolbarSearchReplace: TBCSpeedButton
      Left = 622
      Top = 2
      Width = 26
      Height = 24
      Action = ActionSearchReplace
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 35
      ShowCaption = False
    end
    object SpeedButtonToolbarSearchFindInFiles: TBCSpeedButton
      Left = 648
      Top = 2
      Width = 26
      Height = 24
      Action = ActionSearchFindInFiles
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 36
      ShowCaption = False
    end
    object SpeedButtonToolbarViewWordWrap: TBCSpeedButton
      Left = 684
      Top = 2
      Width = 26
      Height = 24
      Action = ActionViewWordWrap
      Align = alLeft
      AllowAllUp = True
      GroupIndex = 1
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsCheck
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 57
      ShowCaption = False
    end
    object SpeedButtonToolbarViewLineNumbers: TBCSpeedButton
      Left = 710
      Top = 2
      Width = 26
      Height = 24
      Action = ActionViewLineNumbers
      Align = alLeft
      AllowAllUp = True
      GroupIndex = 2
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsCheck
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 58
      ShowCaption = False
    end
    object SpeedButtonToolbarViewSpecialChars: TBCSpeedButton
      Left = 736
      Top = 2
      Width = 26
      Height = 24
      Action = ActionViewSpecialChars
      Align = alLeft
      AllowAllUp = True
      GroupIndex = 3
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsCheck
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 59
      ShowCaption = False
    end
    object SpeedButtonToolbarViewSelectionMode: TBCSpeedButton
      Left = 762
      Top = 2
      Width = 26
      Height = 24
      Action = ActionViewSelectionMode
      Align = alLeft
      AllowAllUp = True
      GroupIndex = 4
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsCheck
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 60
      ShowCaption = False
    end
    object SpeedButtonToolbarToolsCompareFiles: TBCSpeedButton
      Left = 850
      Top = 2
      Width = 26
      Height = 24
      Action = ActionToolsCompareFiles
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 69
      ShowCaption = False
    end
    object SpeedButtonToolbarDocumentInfo: TBCSpeedButton
      Left = 886
      Top = 2
      Width = 26
      Height = 24
      Action = ActionDocumentInfo
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 63
      ShowCaption = False
    end
    object SpeedButtonToolbarDocumentViewInBrowser: TBCSpeedButton
      Left = 912
      Top = 2
      Width = 26
      Height = 24
      Action = ActionDocumentViewInBrowser
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 64
      ShowCaption = False
    end
    object SpeedButtonToolbarViewSplit: TBCSpeedButton
      Left = 814
      Top = 2
      Width = 26
      Height = 24
      Action = ActionViewSplit
      Align = alLeft
      AllowAllUp = True
      GroupIndex = 6
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsCheck
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 95
      ShowCaption = False
    end
    object SpeedButtonToolbarViewMinimap: TBCSpeedButton
      Left = 788
      Top = 2
      Width = 26
      Height = 24
      Action = ActionViewMinimap
      Align = alLeft
      AllowAllUp = True
      GroupIndex = 5
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsCheck
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = ImagesDataModule.ImageList
      ImageIndex = 94
      ShowCaption = False
    end
  end
  object PanelOutput: TBCPanel [5]
    Left = 0
    Top = 579
    Width = 1111
    Height = 121
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 4
    Visible = False
    SkinData.SkinSection = 'CHECKBOX'
    object PageControlOutput: TBCPageControl
      Left = 0
      Top = 0
      Width = 1111
      Height = 121
      ActivePage = TabSheetFindInFiles
      Align = alClient
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Images = ImagesDataModule.ImageListSmall
      ParentDoubleBuffered = False
      ParentFont = False
      PopupMenu = PopupMenuOutput
      TabHeight = 23
      TabOrder = 0
      OnMouseDown = PageControlOutputMouseDown
      TabPadding = 2
      SkinData.SkinSection = 'PAGECONTROL'
      OnDblClick = PageControlOutputDblClick
      OnCloseBtnClick = PageControlOutputCloseBtnClick
      HoldShiftToDragDrop = False
      RightClickSelect = True
      TabDragDrop = True
      object TabSheetFindInFiles: TsTabSheet
        DoubleBuffered = False
        ImageIndex = 36
        ParentDoubleBuffered = False
        TabType = ttButton
        TabSkin = 'TRANSPARENT'
        OnClickBtn = TabSheetFindInFilesClickBtn
      end
    end
  end
  inherited SkinManager: TBCSkinManager
    Effects.AllowAnimation = False
    Effects.AllowGlowing = False
    Effects.AllowOuterEffects = True
    AnimEffects.DialogShow.Active = True
    AnimEffects.DialogShow.Time = 120
    AnimEffects.FormShow.Active = True
    AnimEffects.FormShow.Time = 120
    AnimEffects.FormHide.Active = True
    AnimEffects.FormHide.Time = 120
    AnimEffects.DialogHide.Active = True
    AnimEffects.DialogHide.Time = 120
    AnimEffects.Minimizing.Active = True
    AnimEffects.PageChange.Time = 100
    AnimEffects.SkinChanging.Active = True
    ExtendedBorders = True
    IsDefault = False
    MenuSupport.UseExtraLine = False
    Options.ChangeSysColors = True
    ThirdParty.ThirdEdits = 'TBCEditorPrintPreview'#13#10'TBCButtonedEdit'#13#10
    ThirdParty.ThirdButtons = ' '#13#10'TButton'#13#10
    ThirdParty.ThirdGrids = ' '#13#10'TStringGrid'#13#10
    ThirdParty.ThirdVirtualTrees = ' '#13#10'TVirtualDrawTree'#13#10'TBCFileTreeView'#13#10'TEBXMLTree'#13#10
    Top = 172
  end
  inherited TitleBar: TBCTitleBar
    Images = ImagesDataModule.ImageListSmall
    Items = <
      item
        DropdownMenu = PopupMenuToolbar
        FontData.Font.Charset = DEFAULT_CHARSET
        FontData.Font.Color = clWindowText
        FontData.Font.Height = -11
        FontData.Font.Name = 'Tahoma'
        FontData.Font.Style = []
        Visible = False
        ImageIndex = 86
        Height = 16
        Width = 16
        Index = 0
        Name = 'TitleBarItemMenu'
        ShowHint = False
      end
      item
        Caption = 'EditBone'
        FontData.Font.Charset = DEFAULT_CHARSET
        FontData.Font.Color = clWindowText
        FontData.Font.Height = -11
        FontData.Font.Name = 'Tahoma'
        FontData.Font.Style = []
        Height = 21
        Width = 53
        Index = 1
        Name = 'TitleBarItemCaption'
        ShowHint = False
        Style = bsInfo
      end
      item
        Caption = ' '
        DropdownMenu = PopupMenuDummy
        FontData.Font.Charset = DEFAULT_CHARSET
        FontData.Font.Color = clWindowText
        FontData.Font.Height = -11
        FontData.Font.Name = 'Tahoma'
        FontData.Font.Style = []
        Height = 21
        Index = 2
        Name = 'TitleBarItemFilename'
        ShowHint = False
        OnClick = TitleBarItems2Click
      end
      item
        Align = tbaRight
        Caption = 'ANSI'
        DropdownMenu = PopupMenuDummy
        FontData.Font.Charset = DEFAULT_CHARSET
        FontData.Font.Color = clWindowText
        FontData.Font.Height = -11
        FontData.Font.Name = 'Tahoma'
        FontData.Font.Style = []
        Height = 22
        Width = 56
        Index = 3
        Name = 'TitleBarItemEncoding'
        ShowHint = False
        Style = bsMenu
        OnClick = TitleBarItems4Click
      end
      item
        Align = tbaRight
        FontData.Font.Charset = DEFAULT_CHARSET
        FontData.Font.Color = clWindowText
        FontData.Font.Height = -11
        FontData.Font.Name = 'Tahoma'
        FontData.Font.Style = []
        Width = 6
        Index = 4
        Name = 'TitleBarItemSpacing2'
        ShowHint = False
        Style = bsSpacing
      end
      item
        Align = tbaRight
        Caption = 'Text'
        DropdownMenu = PopupMenuDummy
        FontData.Font.Charset = DEFAULT_CHARSET
        FontData.Font.Color = clWindowText
        FontData.Font.Height = -11
        FontData.Font.Name = 'Tahoma'
        FontData.Font.Style = []
        Height = 22
        Width = 52
        Index = 5
        Name = 'TitleBarItemHighlighter'
        ShowHint = False
        Style = bsMenu
        OnClick = TitleBarItems6Click
      end
      item
        Align = tbaRight
        FontData.Font.Charset = DEFAULT_CHARSET
        FontData.Font.Color = clWindowText
        FontData.Font.Height = -11
        FontData.Font.Name = 'Tahoma'
        FontData.Font.Style = []
        Width = 6
        Index = 6
        Name = 'TitleBarItemSpacing3'
        ShowHint = False
        Style = bsSpacing
      end
      item
        Align = tbaRight
        Caption = 'Default'
        DropdownMenu = PopupMenuDummy
        FontData.Font.Charset = DEFAULT_CHARSET
        FontData.Font.Color = clWindowText
        FontData.Font.Height = -11
        FontData.Font.Name = 'Tahoma'
        FontData.Font.Style = []
        Height = 22
        Width = 68
        Index = 7
        Name = 'TitleBarItemColors'
        ShowHint = False
        Style = bsMenu
        OnClick = TitleBarItems8Click
      end
      item
        Align = tbaRight
        FontData.Font.Charset = DEFAULT_CHARSET
        FontData.Font.Color = clWindowText
        FontData.Font.Height = -11
        FontData.Font.Name = 'Tahoma'
        FontData.Font.Style = []
        Width = 2
        Index = 8
        Name = 'TitleBarItemSpacing4'
        ShowHint = False
        Style = bsSpacing
      end>
    Left = 36
    Top = 234
  end
  inherited SkinProvider: TsSkinProvider
    SkinData.OuterEffects.Visibility = ovAlways
    Left = 32
    Top = 294
  end
  object PopupMenuEditInsert: TPopupMenu [9]
    Images = ImagesDataModule.ImageList
    Left = 58
    Top = 523
    object MenuItemEditInsertDate: TMenuItem
      Action = ActionEditInsertDateTime
    end
    object MenuItemEditInsertColor: TMenuItem
      Action = ActionEditInsertHexColor
    end
    object MenuItemEditInsertTags: TMenuItem
      Action = ActionEditInsertTag
    end
    object MenuItemEditInsertLine: TMenuItem
      Action = ActionEditInsertLine
    end
  end
  object PopupMenuEditDelete: TPopupMenu [10]
    Images = ImagesDataModule.ImageList
    Left = 56
    Top = 573
    object MenuItemEditDeleteLine: TMenuItem
      Action = ActionEditDeleteLine
    end
    object MenuItemEditDeleteEndOfLine: TMenuItem
      Action = ActionEditDeleteEndOfLine
    end
    object MenuItemEditDeleteWord: TMenuItem
      Action = ActionEditDeleteWord
    end
    object MenuItemEditDeleteWhitespace: TMenuItem
      Action = ActionEditDeleteWhitespace
    end
  end
  object PopupMenuFileReopen: TPopupMenu [11]
    Images = ImagesDataModule.ImageListSmall
    Left = 466
    Top = 581
  end
  object PopupMenuEditIndent: TPopupMenu [12]
    Images = ImagesDataModule.ImageList
    Left = 192
    Top = 523
    object MenuItemEditIndentDecrease: TMenuItem
      Action = ActionEditIndentDecrease
    end
    object MenuItemEditIndentIncrease: TMenuItem
      Action = ActionEditIndentIncrease
    end
  end
  object PopupMenuEditSort: TPopupMenu [13]
    Images = ImagesDataModule.ImageList
    Left = 190
    Top = 577
    object MenuItemEditSortAscending: TMenuItem
      Action = ActionEditSortAsc
    end
    object MenuItemEditSortDescending: TMenuItem
      Action = ActionEditSortDesc
    end
    object Random1: TMenuItem
      Action = ActionEditSortRandom
    end
  end
  object PopupMenuSearchGotoBookmarks: TPopupMenu [14]
    Images = ImagesDataModule.ImageList
    Left = 631
    Top = 521
    object MenuItemSearchGotoNext: TMenuItem
      Action = ActionGotoNextBookmark
    end
    object MenuItemSearchGotoPrevious: TMenuItem
      Action = ActionGotoPreviousBookmark
    end
    object MenuItemSearchSeparator: TMenuItem
      Caption = '-'
    end
    object MenuItemSearchGotoBookmark1: TMenuItem
      Action = ActionGotoBookmarks1
    end
    object MenuItemSearchGotoBookmark2: TMenuItem
      Action = ActionGotoBookmarks2
    end
    object MenuItemSearchGotoBookmark3: TMenuItem
      Action = ActionGotoBookmarks3
    end
    object MenuItemSearchGotoBookmark4: TMenuItem
      Action = ActionGotoBookmarks4
    end
    object MenuItemSearchGotoBookmark5: TMenuItem
      Action = ActionGotoBookmarks5
    end
    object MenuItemSearchGotoBookmark6: TMenuItem
      Action = ActionGotoBookmarks6
    end
    object MenuItemSearchGotoBookmark7: TMenuItem
      Action = ActionGotoBookmarks7
    end
    object MenuItemSearchGotoBookmark8: TMenuItem
      Action = ActionGotoBookmarks8
    end
    object MenuItemSearchGotoBookmark9: TMenuItem
      Action = ActionGotoBookmarks9
    end
  end
  object PopupMenuSearchToggleBookmarks: TPopupMenu [15]
    Images = ImagesDataModule.ImageList
    Left = 631
    Top = 579
    object MenuItemSearchToggleBookmark1: TMenuItem
      Action = ActionToggleBookmarks1
    end
    object MenuItemSearchToggleBookmark2: TMenuItem
      Action = ActionToggleBookmarks2
    end
    object MenuItemSearchToggleBookmark3: TMenuItem
      Action = ActionToggleBookmarks3
    end
    object MenuItemSearchToggleBookmark4: TMenuItem
      Action = ActionToggleBookmarks4
    end
    object MenuItemSearchToggleBookmark5: TMenuItem
      Action = ActionToggleBookmarks5
    end
    object MenuItemSearchToggleBookmark6: TMenuItem
      Action = ActionToggleBookmarks6
    end
    object MenuItemSearchToggleBookmark7: TMenuItem
      Action = ActionToggleBookmarks7
    end
    object MenuItemSearchToggleBookmark8: TMenuItem
      Action = ActionToggleBookmarks8
    end
    object MenuItemSearchToggleBookmark9: TMenuItem
      Action = ActionToggleBookmarks9
    end
  end
  object PopupMenuToolbar: TPopupMenu [16]
    Images = ImagesDataModule.ImageList
    Left = 317
    Top = 519
    object MenuItemToolbarMenuLanguage: TMenuItem
      Action = ActionToolbarMenuLanguage
      SubMenuImages = ImagesDataModule.ImageListSmall
    end
    object MenuItemToolbarMenuSkin: TMenuItem
      Action = ActionToolbarMenuSkin
      SubMenuImages = ImagesDataModule.ImageListSmall
    end
    object MenuItemToolbarMenuView: TMenuItem
      Action = ActionToolbarMenuView
      SubMenuImages = ImagesDataModule.ImageListSmall
      object MenuItemToolbarMenuViewDirectory: TMenuItem
        Action = ActionViewDirectory
      end
      object MenuItemMainMenu: TMenuItem
        Action = ActionViewMainMenu
      end
      object MenuItemToolbarMenuViewMenuBar: TMenuItem
        Action = ActionViewMenuBar
      end
      object MenuItemToolbarMenuViewOutput: TMenuItem
        Action = ActionViewOutput
      end
      object S1: TMenuItem
        Action = ActionViewSkinSelector
      end
      object MenuItemToolbarMenuViewStatusBar: TMenuItem
        Action = ActionViewStatusBar
      end
      object MenuItemToolbarMenuViewTitleBar: TMenuItem
        Action = ActionViewTitleBar
        SubMenuImages = ImagesDataModule.ImageListSmall
        object MenuItemToolbarMenuViewColor: TMenuItem
          Action = ActionViewColorSelection
          Hint = 'Show or hide the color selection'
        end
        object MenuItemToolbarMenuViewEncoding: TMenuItem
          Action = ActionViewEncodingSelection
        end
        object MenuItemToolbarMenuViewTitleBarFilename: TMenuItem
          Action = ActionViewTitleBarFilename
        end
        object MenuItemToolbarMenuViewTitleBarFileList: TMenuItem
          Action = ActionViewTitleBarFileList
        end
        object MenuItemToolbarMenuViewHighlighter: TMenuItem
          Action = ActionViewHighlighterSelection
        end
      end
      object MenuItemToolbarMenuViewToolbar: TMenuItem
        Action = ActionViewToolbar
      end
    end
  end
  inherited ApplicationEvents: TApplicationEvents
    OnActivate = ApplicationEventsActivate
    OnHint = ApplicationEventsHint
    OnMessage = ApplicationEventsMessage
    Left = 122
    Top = 244
  end
  inherited ActionList: TActionList
    Images = ImagesDataModule.ImageList
    Left = 122
    Top = 300
    object ActionFile: TAction [0]
      Category = 'File'
      Caption = 'File'
      OnExecute = ActionDummyExecute
    end
    object ActionFileNew: TAction [1]
      Category = 'File'
      Caption = 'New'
      Hint = 'Create a new document'
      ImageIndex = 0
      ShortCut = 16462
      OnExecute = ActionFileNewExecute
    end
    object ActionFileOpen: TAction [2]
      Category = 'File'
      Caption = 'Open'
      Hint = 'Open an existing document'
      ImageIndex = 1
      ShortCut = 16463
      OnExecute = ActionFileOpenExecute
    end
    object ActionFileReopen: TAction [3]
      Category = 'File'
      Caption = 'Reopen'
      ImageIndex = 2
      OnExecute = ActionFileReopenExecute
    end
    object ActionFileSave: TAction [4]
      Category = 'File'
      Caption = 'Save'
      Hint = 'Save the active document'
      ImageIndex = 3
      ShortCut = 16467
      OnExecute = ActionFileSaveExecute
    end
    object ActionFileSaveAs: TAction [5]
      Category = 'File'
      Caption = 'Save as'
      Hint = 'Save the active document with a new name'
      ImageIndex = 4
      ShortCut = 49235
      OnExecute = ActionFileSaveAsExecute
    end
    object ActionFileSaveAll: TAction [6]
      Category = 'File'
      Caption = 'Save all'
      Hint = 'Save all documents'
      ImageIndex = 5
      ShortCut = 24659
      OnExecute = ActionFileSaveAllExecute
    end
    object ActionFileClose: TAction [7]
      Category = 'File'
      Caption = 'Close'
      Hint = 'Close the active document'
      ImageIndex = 6
      ShortCut = 16499
      OnExecute = ActionFileCloseExecute
    end
    object ActionFileCloseAll: TAction [8]
      Category = 'File'
      Caption = 'Close all'
      Hint = 'Close all open files'
      ImageIndex = 7
      OnExecute = ActionFileCloseAllExecute
    end
    object ActionFileCloseAllOther: TAction [9]
      Category = 'File'
      Caption = 'Close all other'
      Hint = 'Close all other pages'
      ImageIndex = 8
      ShortCut = 24691
      OnExecute = ActionFileCloseAllOtherExecute
    end
    object ActionFilePrint: TAction [10]
      Category = 'File'
      Caption = 'Print'
      Hint = 'Print the active document'
      ImageIndex = 9
      ShortCut = 16464
      OnExecute = ActionFilePrintExecute
    end
    object ActionFilePrintPreview: TAction [11]
      Category = 'File'
      Caption = 'Print preview'
      Hint = 'Preview the active document'
      ImageIndex = 10
      OnExecute = ActionFilePrintPreviewExecute
    end
    inherited ActionFileExit: TAction
      Category = 'File'
    end
    object ActionEdit: TAction
      Category = 'Edit'
      Caption = 'Edit'
      OnExecute = ActionDummyExecute
    end
    object ActionEditUndo: TAction
      Category = 'Edit'
      Caption = 'Undo'
      Hint = 'Undo the last action'
      ImageIndex = 12
      ShortCut = 16474
      OnExecute = ActionEditUndoExecute
    end
    object ActionEditRedo: TAction
      Category = 'Edit'
      Caption = 'Redo'
      Hint = 'Redo the previously undone action'
      ImageIndex = 13
      ShortCut = 24666
      OnExecute = ActionEditRedoExecute
    end
    object ActionEditCut: TAction
      Category = 'Edit'
      Caption = 'Cut'
      Hint = 'Cut the selection and put it on the clipboard'
      ImageIndex = 14
      ShortCut = 16472
      OnExecute = ActionEditCutExecute
    end
    object ActionEditCopy: TAction
      Category = 'Edit'
      Caption = 'Copy'
      Hint = 'Copy the selection and put it on the clipboard'
      ImageIndex = 15
      ShortCut = 16451
      OnExecute = ActionEditCopyExecute
    end
    object ActionEditPaste: TAction
      Category = 'Edit'
      Caption = 'Paste'
      Hint = 'Insert clipboard contents'
      ImageIndex = 16
      ShortCut = 16470
      OnExecute = ActionEditPasteExecute
    end
    object ActionEditSelectAll: TAction
      Category = 'Edit'
      Caption = 'Select all'
      Hint = 'Select all'
      ImageIndex = 17
      ShortCut = 16449
      OnExecute = ActionEditSelectAllExecute
    end
    object ActionEditInsert: TAction
      Category = 'Edit'
      Caption = 'Insert'
      ImageIndex = 18
      OnExecute = ActionEditInsertExecute
    end
    object ActionEditInsertHexColor: TAction
      Category = 'Edit'
      Caption = 'Hex color'
      ImageIndex = 148
      ShortCut = 24643
      OnExecute = ActionEditInsertHexColorExecute
    end
    object ActionEditInsertLine: TAction
      Category = 'Edit'
      Caption = 'Line'
      Hint = 'Insert line'
      ImageIndex = 19
      ShortCut = 16397
      OnExecute = ActionEditInsertLineExecute
    end
    object ActionEditInsertTag: TAction
      Category = 'Edit'
      Caption = 'HTML/XML tags'
      Hint = 'Insert HTML/XML tags'
      ImageIndex = 20
      ShortCut = 24660
      OnExecute = ActionEditInsertTagExecute
    end
    object ActionEditInsertDateTime: TAction
      Category = 'Edit'
      Caption = 'Date and time'
      Hint = 'Insert date and time'
      ImageIndex = 21
      ShortCut = 41028
      OnExecute = ActionEditInsertDateTimeExecute
    end
    object ActionEditDelete: TAction
      Category = 'Edit'
      Caption = 'Delete'
      ImageIndex = 22
      OnExecute = ActionEditDeleteExecute
    end
    object ActionEditDeleteLine: TAction
      Category = 'Edit'
      Caption = 'Line'
      Hint = 'Delete line'
      ImageIndex = 23
      ShortCut = 16473
      OnExecute = ActionEditDeleteLineExecute
    end
    object ActionEditDeleteEndOfLine: TAction
      Category = 'Edit'
      Caption = 'End of line'
      Hint = 'Delete end of line'
      ImageIndex = 24
      ShortCut = 24665
      OnExecute = ActionEditDeleteEndOfLineExecute
    end
    object ActionEditDeleteWord: TAction
      Category = 'Edit'
      Caption = 'Word'
      Hint = 'Delete word'
      ImageIndex = 25
      SecondaryShortCuts.Strings = (
        'Ctrl+Del')
      ShortCut = 16468
      OnExecute = ActionEditDeleteWordExecute
    end
    object ActionEditDeleteWhitespace: TAction
      Category = 'Edit'
      Caption = 'Whitespace'
      Hint = 'Remove all whitespace from selected text'
      ImageIndex = 26
      ShortCut = 16471
      OnExecute = ActionEditDeleteWhitespaceExecute
    end
    object ActionEditIndent: TAction
      Category = 'Edit'
      Caption = 'Indent'
      ImageIndex = 27
      OnExecute = ActionEditIndentExecute
    end
    object ActionEditIndentIncrease: TAction
      Category = 'Edit'
      Caption = 'Increase'
      Hint = 'Increase indent'
      ImageIndex = 28
      ShortCut = 24649
      OnExecute = ActionEditIndentIncreaseExecute
    end
    object ActionEditIndentDecrease: TAction
      Category = 'Edit'
      Caption = 'Decrease'
      Hint = 'Decrease indent'
      ImageIndex = 29
      ShortCut = 24661
      OnExecute = ActionEditIndentDecreaseExecute
    end
    object ActionEditSort: TAction
      Category = 'Edit'
      Caption = 'Sort'
      ImageIndex = 30
      OnExecute = ActionEditSortExecute
    end
    object ActionEditSortAsc: TAction
      Category = 'Edit'
      Caption = 'Ascending'
      Hint = 'Sort ascending'
      ImageIndex = 31
      ShortCut = 24641
      OnExecute = ActionEditSortAscExecute
    end
    object ActionEditSortDesc: TAction
      Category = 'Edit'
      Caption = 'Descending'
      Hint = 'Sort descending'
      ImageIndex = 32
      ShortCut = 24644
      OnExecute = ActionEditSortDescExecute
    end
    object ActionEditSortRandom: TAction
      Category = 'Edit'
      Caption = 'Random'
      Hint = 'Sort random'
      ImageIndex = 152
      OnExecute = ActionEditSortRandomExecute
    end
    object ActionEditToggleCase: TAction
      Category = 'Edit'
      Caption = 'Toggle case'
      Hint = 'Toggle case'
      ImageIndex = 33
      ShortCut = 24643
      OnExecute = ActionEditToggleCaseExecute
    end
    object ActionSearch: TAction
      Category = 'Search'
      Caption = 'Search'
      OnExecute = ActionDummyExecute
    end
    object ActionSearchSearchButton: TAction
      Category = 'Search'
      AutoCheck = True
      Caption = 'Search'
      GroupIndex = 10
      Hint = 'Search the specified text'
      ImageIndex = 34
      OnExecute = ActionSearchSearchButtonExecute
    end
    object ActionSearchSearch: TAction
      Category = 'Search'
      Caption = 'ActionSearchSearch'
      ShortCut = 16454
      OnExecute = ActionSearchSearchExecute
    end
    object ActionSearchReplace: TAction
      Category = 'Search'
      Caption = 'Replace'
      Hint = 'Replace the specified text with different text'
      ImageIndex = 35
      ShortCut = 16466
      OnExecute = ActionSearchReplaceExecute
    end
    object ActionSearchFindInFiles: TAction
      Category = 'Search'
      Caption = 'Find in files'
      Hint = 'Search for a string in multiple files'
      ImageIndex = 36
      ShortCut = 24646
      OnExecute = ActionSearchFindInFilesExecute
    end
    object ActionSearchFindAll: TAction
      Category = 'Search'
      Caption = 'Find all'
      Hint = 'Find all matching texts'
      ImageIndex = 151
      OnExecute = ActionSearchFindAllExecute
    end
    object ActionSearchFindNext: TAction
      Category = 'Search'
      Caption = 'Find next'
      Hint = 'Find the next matching text'
      ImageIndex = 37
      ShortCut = 114
      OnExecute = ActionSearchFindNextExecute
    end
    object ActionSearchFindPrevious: TAction
      Category = 'Search'
      Caption = 'Find previous'
      Hint = 'Find the previous matching text'
      ImageIndex = 38
      ShortCut = 8306
      OnExecute = ActionSearchFindPreviousExecute
    end
    object ActionSearchToggleBookmark: TAction
      Category = 'Search'
      Caption = 'Toggle bookmark'
      Hint = 
        'Set or clear bookmark at current line. Bookmarks can be also set' +
        ' by using Ctrl+Shift+1..9. Go to bookmark by using Ctrl+1..9.'
      ImageIndex = 39
      ShortCut = 16497
      OnExecute = ActionSearchToggleBookmarkExecute
    end
    object ActionSearchToggleBookmarks: TAction
      Category = 'Search'
      Caption = 'Toggle bookmarks'
      Hint = 'Toggle bookmarks'
      ImageIndex = 40
      OnExecute = ActionSearchToggleBookmarksExecute
    end
    object ActionSearchGoToBookmarks: TAction
      Category = 'Search'
      Caption = 'Go to bookmarks'
      Hint = 'Go to bookmarks'
      ImageIndex = 41
      OnExecute = ActionSearchGoToBookmarksExecute
    end
    object ActionSearchClearBookmarks: TAction
      Category = 'Search'
      Caption = 'Clear bookmarks'
      Hint = 'Clear all bookmarks'
      ImageIndex = 42
      OnExecute = ActionSearchClearBookmarksExecute
    end
    object ActionSearchGoToLine: TAction
      Category = 'Search'
      Caption = 'Go to line'
      Hint = 'Go to line'
      ImageIndex = 43
      ShortCut = 16455
      OnExecute = ActionSearchGoToLineExecute
    end
    object ActionGotoNextBookmark: TAction
      Category = 'GotoBookmarks'
      Caption = 'Next'
      Hint = 'Go to next bookmark'
      ImageIndex = 41
      ShortCut = 113
      OnExecute = ActionGotoNextBookmarkExecute
    end
    object ActionGotoPreviousBookmark: TAction
      Category = 'GotoBookmarks'
      Caption = 'Previous'
      Hint = 'Go to previous bookmark'
      ImageIndex = 146
      ShortCut = 8305
      OnExecute = ActionGotoPreviousBookmarkExecute
    end
    object ActionGotoBookmarks1: TAction
      Tag = 1
      Category = 'GotoBookmarks'
      Caption = 'Bookmark 1'
      ImageIndex = 44
      ShortCut = 16433
      OnExecute = ActionGotoBookmarksExecute
    end
    object ActionGotoBookmarks2: TAction
      Tag = 2
      Category = 'GotoBookmarks'
      Caption = 'Bookmark 2'
      ImageIndex = 45
      ShortCut = 16434
      OnExecute = ActionGotoBookmarksExecute
    end
    object ActionGotoBookmarks3: TAction
      Tag = 3
      Category = 'GotoBookmarks'
      Caption = 'Bookmark 3'
      ImageIndex = 46
      ShortCut = 16435
      OnExecute = ActionGotoBookmarksExecute
    end
    object ActionGotoBookmarks4: TAction
      Tag = 4
      Category = 'GotoBookmarks'
      Caption = 'Bookmark 4'
      ImageIndex = 47
      ShortCut = 16436
      OnExecute = ActionGotoBookmarksExecute
    end
    object ActionGotoBookmarks5: TAction
      Tag = 5
      Category = 'GotoBookmarks'
      Caption = 'Bookmark 5'
      ImageIndex = 48
      ShortCut = 16437
      OnExecute = ActionGotoBookmarksExecute
    end
    object ActionGotoBookmarks6: TAction
      Tag = 6
      Category = 'GotoBookmarks'
      Caption = 'Bookmark 6'
      ImageIndex = 49
      ShortCut = 16438
      OnExecute = ActionGotoBookmarksExecute
    end
    object ActionGotoBookmarks7: TAction
      Tag = 7
      Category = 'GotoBookmarks'
      Caption = 'Bookmark 7'
      ImageIndex = 50
      ShortCut = 16439
      OnExecute = ActionGotoBookmarksExecute
    end
    object ActionGotoBookmarks8: TAction
      Tag = 8
      Category = 'GotoBookmarks'
      Caption = 'Bookmark 8'
      ImageIndex = 51
      ShortCut = 16440
      OnExecute = ActionGotoBookmarksExecute
    end
    object ActionGotoBookmarks9: TAction
      Tag = 9
      Category = 'GotoBookmarks'
      Caption = 'Bookmark 9'
      ImageIndex = 52
      ShortCut = 16441
      OnExecute = ActionGotoBookmarksExecute
    end
    object ActionView: TAction
      Category = 'View'
      Caption = 'View'
      OnExecute = ActionDummyExecute
    end
    object ActionViewOpenDirectory: TAction
      Category = 'View'
      Caption = 'Open directory'
      Hint = 'Open a new directory'
      ImageIndex = 53
      ShortCut = 16452
      OnExecute = ActionViewOpenDirectoryExecute
    end
    object ActionViewCloseDirectory: TAction
      Category = 'View'
      Caption = 'Close directory'
      Hint = 'Close the active directory'
      ImageIndex = 54
      ShortCut = 24644
      OnExecute = ActionViewCloseDirectoryExecute
    end
    object ActionViewEditDirectory: TAction
      Category = 'View'
      Caption = 'Edit directory'
      Hint = 'Edit the active directory'
      ImageIndex = 55
      ShortCut = 24645
      OnExecute = ActionViewEditDirectoryExecute
    end
    object ActionViewFiles: TAction
      Category = 'View'
      Caption = 'Files'
      Hint = 'Search files from the selected directory and its subdirectories'
      ImageIndex = 56
      ShortCut = 16507
      OnExecute = ActionViewFilesExecute
    end
    object ActionViewWordWrap: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'Word wrap'
      GroupIndex = 1
      Hint = 'Toggle word wrap'
      ImageIndex = 57
      OnExecute = ActionViewWordWrapExecute
    end
    object ActionViewLineNumbers: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'Line numbers'
      GroupIndex = 2
      Hint = 'Toggle line numbers'
      ImageIndex = 58
      OnExecute = ActionViewLineNumbersExecute
    end
    object ActionViewSpecialChars: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'Special chars'
      GroupIndex = 3
      Hint = 'Toggle special characters'
      ImageIndex = 59
      OnExecute = ActionViewSpecialCharsExecute
    end
    object ActionViewSelectionMode: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'Selection mode'
      GroupIndex = 4
      Hint = 
        'Toggle selection mode. Also pressing Alt on editor will toggle s' +
        'election mode.'
      ImageIndex = 60
      OnExecute = ActionViewSelectionModeExecute
    end
    object ActionViewMinimap: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'Minimap'
      GroupIndex = 5
      Hint = 'Show or hide the minimap'
      ImageIndex = 94
      OnExecute = ActionViewMinimapExecute
    end
    object ActionViewSplit: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'Split'
      GroupIndex = 6
      Hint = 'Split the document'
      ImageIndex = 95
      OnExecute = ActionViewSplitExecute
    end
    object ActionViewSyncEdit: TAction
      Category = 'View'
      Caption = 'Sync edit'
      GroupIndex = 8
      Hint = 'Show or hide synchronized edit'
      ImageIndex = 139
      ShortCut = 24650
      OnExecute = ActionViewSyncEditExecute
    end
    object ActionViewXMLTree: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'XML tree'
      GroupIndex = 7
      Hint = 'Show or hide the XML tree'
      ImageIndex = 85
      OnExecute = ActionViewXMLTreeExecute
    end
    object ActionViewPreviousPage: TAction
      Category = 'View'
      Caption = 'Previous page'
      Hint = 'Go to previous page'
      ImageIndex = 61
      ShortCut = 24585
      OnExecute = ActionViewPreviousPageExecute
    end
    object ActionViewNextPage: TAction
      Category = 'View'
      Caption = 'Next page'
      Hint = 'Go to next page'
      ImageIndex = 62
      ShortCut = 16393
      OnExecute = ActionViewNextPageExecute
    end
    object ActionDocument: TAction
      Category = 'Document'
      Caption = 'Document'
      OnExecute = ActionDummyExecute
    end
    object ActionDocumentInfo: TAction
      Category = 'Document'
      Caption = 'Info'
      Hint = 'Line, word, and character count'
      ImageIndex = 63
      OnExecute = ActionDocumentInfoExecute
    end
    object ActionDocumentViewInBrowser: TAction
      Category = 'Document'
      Caption = 'View in browser'
      Hint = 'View current document in default browser'
      ImageIndex = 64
      ShortCut = 32834
      OnExecute = ActionDocumentViewInBrowserExecute
    end
    object ActionMenuFile: TAction
      Category = 'Menu'
      Caption = 'File'
      ShortCut = 32838
      OnExecute = ActionMenuFileExecute
    end
    object ActionMenuEdit: TAction
      Category = 'Menu'
      Caption = 'Edit'
      ShortCut = 32837
      OnExecute = ActionMenuEditExecute
    end
    object ActionMenuSearch: TAction
      Category = 'Menu'
      Caption = 'Search'
      ShortCut = 32851
      OnExecute = ActionMenuSearchExecute
    end
    object ActionMenuView: TAction
      Category = 'Menu'
      Caption = 'View'
      ShortCut = 32854
      OnExecute = ActionMenuViewExecute
    end
    object ActionMenuDocument: TAction
      Category = 'Menu'
      Caption = 'Document'
      ShortCut = 32836
      OnExecute = ActionMenuDocumentExecute
    end
    object ActionMenuTools: TAction
      Category = 'Menu'
      Caption = 'Tools'
      ShortCut = 32852
      OnExecute = ActionMenuToolsExecute
    end
    object ActionMenuHelp: TAction
      Category = 'Menu'
      Caption = 'Help'
      ShortCut = 32840
      OnExecute = ActionMenuHelpExecute
    end
    object ActionTools: TAction
      Category = 'Tools'
      Caption = 'Tools'
      OnExecute = ActionDummyExecute
    end
    object ActionToolsOptions: TAction
      Category = 'Tools'
      Caption = 'Options'
      Hint = 'Set options'
      ImageIndex = 68
      OnExecute = ActionToolsOptionsExecute
    end
    object ActionToolsCompareFiles: TAction
      Category = 'Tools'
      Caption = 'Compare files'
      Hint = 'Compare files'
      ImageIndex = 69
      OnExecute = ActionToolsCompareFilesExecute
    end
    object ActionToolsConvert: TAction
      Category = 'Tools'
      Caption = 'Convert'
      Hint = 'Convert between numerical units'
      ImageIndex = 70
      OnExecute = ActionToolsConvertExecute
    end
    object ActionToolsCharacterMap: TAction
      Category = 'Tools'
      Caption = 'Character map'
      Hint = 'Insert unicode characters to active document by double-clicking'
      ImageIndex = 71
      OnExecute = ActionToolsCharacterMapExecute
    end
    object ActionHelp: TAction
      Category = 'Help'
      Caption = 'Help'
      OnExecute = ActionDummyExecute
    end
    object ActionHelpCheckForUpdates: TAction
      Category = 'Help'
      Caption = 'Check for updates'
      Hint = 'Check for updates'
      ImageIndex = 72
      OnExecute = ActionHelpCheckForUpdatesExecute
    end
    object ActionHelpVisitHomepage: TAction
      Category = 'Help'
      Caption = 'Visit homepage'
      Hint = 'Visit EditBone homepage - http://www.bonecode.com/'
      ImageIndex = 73
      OnExecute = ActionHelpVisitHomepageExecute
    end
    object ActionHelpAboutEditBone: TAction
      Category = 'Help'
      Caption = 'About EditBone'
      Hint = 'Display information about EditBone'
      ImageIndex = 74
      OnExecute = ActionHelpAboutEditBoneExecute
    end
    object ActionToggleBookmarks1: TAction
      Category = 'ToggleBookmarks'
      Caption = 'Bookmark 1'
      ImageIndex = 44
      ShortCut = 24625
      OnExecute = ActionToggleBookmarksExecute
    end
    object ActionToggleBookmarks2: TAction
      Tag = 1
      Category = 'ToggleBookmarks'
      Caption = 'Bookmark 2'
      ImageIndex = 45
      ShortCut = 24626
      OnExecute = ActionToggleBookmarksExecute
    end
    object ActionToggleBookmarks3: TAction
      Tag = 2
      Category = 'ToggleBookmarks'
      Caption = 'Bookmark 3'
      ImageIndex = 46
      ShortCut = 24627
      OnExecute = ActionToggleBookmarksExecute
    end
    object ActionToggleBookmarks4: TAction
      Tag = 3
      Category = 'ToggleBookmarks'
      Caption = 'Bookmark 4'
      ImageIndex = 47
      ShortCut = 24628
      OnExecute = ActionToggleBookmarksExecute
    end
    object ActionToggleBookmarks5: TAction
      Tag = 4
      Category = 'ToggleBookmarks'
      Caption = 'Bookmark 5'
      ImageIndex = 48
      ShortCut = 24629
      OnExecute = ActionToggleBookmarksExecute
    end
    object ActionToggleBookmarks6: TAction
      Tag = 5
      Category = 'ToggleBookmarks'
      Caption = 'Bookmark 6'
      ImageIndex = 49
      ShortCut = 24630
      OnExecute = ActionToggleBookmarksExecute
    end
    object ActionToggleBookmarks7: TAction
      Tag = 6
      Category = 'ToggleBookmarks'
      Caption = 'Bookmark 7'
      ImageIndex = 50
      ShortCut = 24631
      OnExecute = ActionToggleBookmarksExecute
    end
    object ActionToggleBookmarks8: TAction
      Tag = 7
      Category = 'ToggleBookmarks'
      Caption = 'Bookmark 8'
      ImageIndex = 51
      ShortCut = 24632
      OnExecute = ActionToggleBookmarksExecute
    end
    object ActionToggleBookmarks9: TAction
      Tag = 8
      Category = 'ToggleBookmarks'
      Caption = 'Bookmark 9'
      ImageIndex = 52
      ShortCut = 24633
      OnExecute = ActionToggleBookmarksExecute
    end
    object ActionToolbarMenuLanguage: TAction
      Category = 'ToolbarMenu'
      Caption = 'Language'
      ImageIndex = 75
      OnExecute = ActionDummyExecute
    end
    object ActionToolbarMenuSkin: TAction
      Category = 'ToolbarMenu'
      Caption = 'Skin...'
      ImageIndex = 76
      OnExecute = ActionToolbarMenuSkinExecute
    end
    object ActionToolbarMenuView: TAction
      Category = 'ToolbarMenu'
      Caption = 'View'
      ImageIndex = 77
      OnExecute = ActionDummyExecute
    end
    object ActionSelectReopenFile: TAction
      Category = 'File'
      OnExecute = ActionSelectReopenFileExecute
    end
    object ActionFileReopenProperties: TAction
      Category = 'File'
      Caption = 'Properties...'
      ImageIndex = 68
      OnExecute = ActionFileReopenPropertiesExecute
    end
    object ActionViewEncodingSelection: TAction
      Category = 'View'
      Caption = 'Encoding'
      Hint = 'Show or hide the encoding selection'
      OnExecute = ActionViewEncodingSelectionExecute
    end
    object ActionViewHighlighterSelection: TAction
      Category = 'View'
      Caption = 'Highlighter'
      Hint = 'Show or hide the highlighter selection'
      OnExecute = ActionViewHighlighterSelectionExecute
    end
    object ActionViewColorSelection: TAction
      Category = 'View'
      Caption = 'Color'
      Hint = 'Show or hide the highlighter color selection'
      OnExecute = ActionViewColorSelectionExecute
    end
    object ActionViewToolbar: TAction
      Category = 'View'
      Caption = 'Toolbar'
      Hint = 'Show or hide the Toolbar'
      OnExecute = ActionViewToolbarExecute
    end
    object ActionViewMenuBar: TAction
      Category = 'View'
      Caption = 'Menu bar'
      Hint = 'Show or hide the menu bar'
      OnExecute = ActionViewMenuBarExecute
    end
    object ActionViewSkinSelector: TAction
      Category = 'View'
      Caption = 'Skin selector'
      OnExecute = ActionViewSkinSelectorExecute
    end
    object ActionViewStatusBar: TAction
      Category = 'View'
      Caption = 'Status bar'
      Hint = 'Show or hide the status bar'
      OnExecute = ActionViewStatusBarExecute
    end
    object ActionViewTitleBar: TAction
      Category = 'View'
      Caption = 'Title bar'
      OnExecute = ActionDummyExecute
    end
    object ActionViewTitleBarFilename: TAction
      Category = 'View'
      Caption = 'Filename'
      Hint = 'Show or hide the title bar filename'
      OnExecute = ActionViewTitleBarFilenameExecute
    end
    object ActionViewTitleBarFileList: TAction
      Category = 'View'
      Caption = 'File list'
      Hint = 'Show or hide the title bar file list'
      OnExecute = ActionViewTitleBarFileListExecute
    end
    object ActionViewOutput: TAction
      Category = 'View'
      Caption = 'Output'
      Hint = 'Show or hide the output'
      OnExecute = ActionViewOutputExecute
    end
    object ActionViewDirectory: TAction
      Category = 'View'
      Caption = 'Directory'
      Hint = 'Show or hide the directory'
      OnExecute = ActionViewDirectoryExecute
    end
    object ActionFileProperties: TAction
      Category = 'File'
      Caption = 'Properties...'
      Hint = 'See the file properties'
      ImageIndex = 99
      OnExecute = ActionFilePropertiesExecute
    end
    object ActionFileSelectFromDirectory: TAction
      Category = 'File'
      Caption = 'Select from directory'
      Hint = 'Select the file from the active directory'
      ImageIndex = 116
      OnExecute = ActionFileSelectFromDirectoryExecute
    end
    object ActionToolsSelectForCompare: TAction
      Category = 'Tools'
      Caption = 'Select for compare...'
      Hint = 'Select document for compare'
      ImageIndex = 69
      OnExecute = ActionToolsSelectForCompareExecute
    end
    object ActionDocumentFormat: TAction
      Category = 'Document'
      Caption = 'Format'
      ImageIndex = 65
      OnExecute = ActionDocumentFormatExecute
    end
    object ActionDocumentFormatSQL: TAction
      Category = 'Document'
      Caption = 'Format SQL'
      Hint = 'Format SQL'
      ImageIndex = 66
      OnExecute = ActionDocumentFormatSQLExecute
    end
    object ActionDocumentFormatXML: TAction
      Category = 'Document'
      Caption = 'Format XML'
      Hint = 'Format XML'
      ImageIndex = 67
      OnExecute = ActionDocumentFormatXMLExecute
    end
    object ActionMacro: TAction
      Category = 'Macro'
      Caption = 'Macro'
      ImageIndex = 136
      OnExecute = ActionMacroExecute
    end
    object ActionMacroPlayback: TAction
      Category = 'Macro'
      Caption = 'Playback'
      Hint = 'Playback the macro'
      ImageIndex = 87
      ShortCut = 24656
      OnExecute = ActionMacroPlaybackExecute
    end
    object ActionMacroRecord: TAction
      Category = 'Macro'
      Caption = 'Record'
      Hint = 'Record a macro'
      ImageIndex = 88
      ShortCut = 24658
      OnExecute = ActionMacroRecordExecute
    end
    object ActionMacroPause: TAction
      Category = 'Macro'
      Caption = 'Pause'
      Hint = 'Pause a macro'
      ImageIndex = 89
      OnExecute = ActionMacroPauseExecute
    end
    object ActionMacroStop: TAction
      Category = 'Macro'
      Caption = 'Stop'
      Hint = 'Stop the macro recording'
      ImageIndex = 90
      ShortCut = 24659
      OnExecute = ActionMacroStopExecute
    end
    object ActionMacroOpen: TAction
      Category = 'Macro'
      Caption = 'Open...'
      Hint = 'Open an existing macro'
      ImageIndex = 91
      OnExecute = ActionMacroOpenExecute
    end
    object ActionMacroSaveAs: TAction
      Category = 'Macro'
      Caption = 'Save as...'
      Hint = 'Save the macro with a new name'
      ImageIndex = 92
      OnExecute = ActionMacroSaveAsExecute
    end
    object ActionDirectorySearchFindInFiles: TAction
      Category = 'Search'
      Caption = '<directory find in files action>'
    end
    object ActionToolsLanguageEditor: TAction
      Category = 'Tools'
      Caption = 'Language editor'
      Hint = 'Language editor'
      ImageIndex = 75
      OnExecute = ActionToolsLanguageEditorExecute
    end
    object ActionViewMainMenu: TAction
      Category = 'View'
      Caption = 'Main menu'
      Hint = 'Show or hide the main menu'
      OnExecute = ActionViewMainMenuExecute
    end
    object ActionEditToggleCaseUpper: TAction
      Category = 'Edit'
      Caption = 'Upper'
      ImageIndex = 33
      OnExecute = ActionEditToggleCaseUpperExecute
    end
    object ActionEditToggleCaseLower: TAction
      Category = 'Edit'
      Caption = 'Lower'
      ImageIndex = 33
      OnExecute = ActionEditToggleCaseLowerExecute
    end
    object ActionEditToggleCaseAlternating: TAction
      Category = 'Edit'
      Caption = 'Alternating'
      ImageIndex = 33
      OnExecute = ActionEditToggleCaseAlternatingExecute
    end
    object ActionEditToggleCaseSentence: TAction
      Category = 'Edit'
      Caption = 'Sentence'
      ImageIndex = 33
      OnExecute = ActionEditToggleCaseSentenceExecute
    end
    object ActionEditToggleCaseTitle: TAction
      Category = 'Edit'
      Caption = 'Title'
      ImageIndex = 33
      OnExecute = ActionEditToggleCaseTitleExecute
    end
    object ActionSelectionBoxDown: TAction
      Category = 'BoxSelection'
      Caption = 'ActionSelectionBoxDown'
      ShortCut = 41000
      OnExecute = ActionSelectionBoxDownExecute
    end
    object ActionSelectionBoxLeft: TAction
      Category = 'BoxSelection'
      Caption = 'ActionSelectionBoxLeft'
      ShortCut = 40997
      OnExecute = ActionSelectionBoxLeftExecute
    end
    object ActionSelectionBoxRight: TAction
      Category = 'BoxSelection'
      Caption = 'ActionSelectionBoxRight'
      ShortCut = 40999
      OnExecute = ActionSelectionBoxRightExecute
    end
    object ActionSelectionBoxUp: TAction
      Category = 'BoxSelection'
      Caption = 'ActionSelectionBoxUp'
      ShortCut = 40998
      OnExecute = ActionSelectionBoxUpExecute
    end
    object ActionXMLTreeRefresh: TAction
      Caption = '&Refresh'
      Hint = 'Refresh files'
      ImageIndex = 93
      OnExecute = ActionXMLTreeRefreshExecute
    end
    object ActionSearchOptions: TAction
      Category = 'Search'
      Caption = 'ActionSearchOptions'
      Hint = 'Search options'
      ImageIndex = 78
      OnExecute = ActionSearchOptionsExecute
    end
    object ActionSearchClose: TAction
      Category = 'Search'
      Caption = 'ActionSearchClose'
      Hint = 'Close'
      OnExecute = ActionSearchCloseExecute
    end
    object ActionDirectoryFindInFiles: TAction
      Category = 'Directory'
      Caption = '&Find in Files...'
      Hint = 'Search for a string in multiple files'
      ImageIndex = 36
      OnExecute = ActionDirectoryFindInFilesExecute
    end
    object ActionDirectoryRefresh: TAction
      Category = 'Directory'
      Caption = '&Refresh'
      Hint = 'Refresh files'
      ImageIndex = 93
      ShortCut = 116
      OnExecute = ActionDirectoryRefreshExecute
    end
    object ActionDirectoryRename: TAction
      Category = 'Directory'
      Caption = 'Re&name'
      Hint = 'Rename a file'
      ImageIndex = 96
      OnExecute = ActionDirectoryRenameExecute
    end
    object ActionDirectoryDelete: TAction
      Category = 'Directory'
      Caption = '&Delete'
      Hint = 'Delete a file or directory'
      ImageIndex = 97
      OnExecute = ActionDirectoryDeleteExecute
    end
    object ActionDirectoryProperties: TAction
      Category = 'Directory'
      Caption = '&Properties'
      Hint = 'File properties'
      ImageIndex = 99
      OnExecute = ActionDirectoryPropertiesExecute
    end
    object ActionDirectoryContextMenu: TAction
      Category = 'Directory'
      Caption = 'C&ontext Menu'
      Hint = 'Context menu'
      ImageIndex = 98
      OnExecute = ActionDirectoryContextMenuExecute
    end
    object ActionDocumentFormatJSON: TAction
      Category = 'Document'
      Caption = 'Format JSON'
      Hint = 'Format JSON'
      ImageIndex = 137
      OnExecute = ActionDocumentFormatJSONExecute
    end
    object ActionDocumentFormatJSONMinify: TAction
      Category = 'Document'
      Caption = 'Minify'
      ImageIndex = 138
      OnExecute = ActionDocumentFormatJSONMinifyExecute
    end
    object ActionDocumentFormatJSONIndent2: TAction
      Category = 'Document'
      Caption = 'Indent 2'
      ImageIndex = 28
      OnExecute = ActionDocumentFormatJSONIndent2Execute
    end
    object ActionDocumentFormatJSONIndent3: TAction
      Category = 'Document'
      Caption = 'Indent 3'
      ImageIndex = 28
      OnExecute = ActionDocumentFormatJSONIndent3Execute
    end
    object ActionDocumentFormatJSONIndent4: TAction
      Category = 'Document'
      Caption = 'Indent 4'
      ImageIndex = 28
      OnExecute = ActionDocumentFormatJSONIndent4Execute
    end
    object ActionOutputClose: TAction
      Category = 'Output'
      Caption = '&Close'
      Hint = 'Close current page'
      ImageIndex = 6
      OnExecute = ActionOutputCloseExecute
    end
    object ActionOutputCloseAll: TAction
      Category = 'Output'
      Caption = 'Close &all'
      Hint = 'Close all pages'
      ImageIndex = 7
      OnExecute = ActionOutputCloseAllExecute
    end
    object ActionOutputCloseAllOtherPages: TAction
      Category = 'Output'
      Caption = 'Close a&ll other pages'
      Hint = 'Close all other pages'
      ImageIndex = 8
      OnExecute = ActionOutputCloseAllOtherPagesExecute
    end
    object ActionOutputCopyAllToClipboard: TAction
      Category = 'Output'
      Caption = 'C&opy all to Clipboard'
      Hint = 'Copy all to clipboard'
      ImageIndex = 15
      OnExecute = ActionOutputCopyAllToClipboardExecute
    end
    object ActionOutputCopySelectedToClipboard: TAction
      Category = 'Output'
      Caption = 'Cop&y selected to Clipboard'
      Hint = 'Copy selected to clipboard'
      ImageIndex = 100
      OnExecute = ActionOutputCopySelectedToClipboardExecute
    end
    object ActionOutputOpenAll: TAction
      Category = 'Output'
      Caption = 'O&pen all'
      Hint = 'Open all files'
      ImageIndex = 1
      OnExecute = ActionOutputOpenAllExecute
    end
    object ActionOutputOpenSelected: TAction
      Category = 'Output'
      Caption = 'Op&en selected'
      Hint = 'Open selected files'
      ImageIndex = 101
      OnExecute = ActionOutputOpenSelectedExecute
    end
    object ActionOutputSelectAll: TAction
      Category = 'Output'
      Caption = 'Select all'
      Hint = 'Select all files'
      ImageIndex = 102
      OnExecute = ActionOutputSelectAllExecute
    end
    object ActionOutputUnselectAll: TAction
      Category = 'Output'
      Caption = 'Unselect all'
      Hint = 'Unselect all files'
      ImageIndex = 103
      OnExecute = ActionOutputUnselectAllExecute
    end
    object ActionSearchTextItems: TAction
      Category = 'Search'
      Hint = 'Search items'
      ImageIndex = 77
      OnExecute = ActionSearchTextItemsExecute
    end
    object ActionDocumentHTMLExport: TAction
      Category = 'Document'
      Caption = 'HTML Export'
      ImageIndex = 140
      OnExecute = ActionDocumentHTMLExportExecute
    end
    object ActionSearchEngine: TAction
      Category = 'Search'
      Hint = 'Select search engine'
      ImageIndex = 143
      OnExecute = ActionSearchEngineExecute
    end
    object ActionSearchCaseSensitive: TAction
      Category = 'Search'
      GroupIndex = 1
      Hint = 'Case sensitive'
      ImageIndex = 144
      OnExecute = ActionSearchCaseSensitiveExecute
    end
    object ActionSearchInSelection: TAction
      Category = 'Search'
      GroupIndex = 2
      Hint = 'In selection'
      ImageIndex = 145
      OnExecute = ActionSearchInSelectionExecute
    end
    object ActionViewFold: TAction
      Category = 'View'
      Caption = 'Fold'
      ImageIndex = 141
      OnExecute = ActionViewFoldExecute
    end
    object ActionViewFoldAll: TAction
      Category = 'View'
      Caption = 'Fold all'
      Hint = 'Fold all'
      ImageIndex = 141
      OnExecute = ActionViewFoldAllExecute
    end
    object ActionViewFoldAllDownFromActiveLine: TAction
      Category = 'View'
      Caption = 'Fold all down from active line'
      Hint = 'Fold all down from active line'
      ImageIndex = 141
      OnExecute = ActionViewFoldAllDownFromActiveLineExecute
    end
    object ActionViewFoldAllUpFromActiveLine: TAction
      Category = 'View'
      Caption = 'Fold all up from active line'
      Hint = 'Fold all up from active line'
      ImageIndex = 141
      OnExecute = ActionViewFoldAllUpFromActiveLineExecute
    end
    object ActionViewFoldSelected: TAction
      Category = 'View'
      Caption = 'Fold selected'
      Hint = 'Fold selected'
      ImageIndex = 141
      OnExecute = ActionViewFoldSelectedExecute
    end
    object ActionViewUnfold: TAction
      Category = 'View'
      Caption = 'Unfold'
      ImageIndex = 142
      OnExecute = ActionViewUnfoldExecute
    end
    object ActionViewUnfoldAll: TAction
      Category = 'View'
      Caption = 'Unfold all'
      Hint = 'Unfold all'
      ImageIndex = 142
      OnExecute = ActionViewUnfoldAllExecute
    end
    object ActionViewUnfoldAllDownFromActiveLine: TAction
      Category = 'View'
      Caption = 'Unfold all down from active line'
      Hint = 'Unfold all down from active line'
      ImageIndex = 142
      OnExecute = ActionViewUnfoldAllDownFromActiveLineExecute
    end
    object ActionViewUnfoldAllUpFromActiveLine: TAction
      Category = 'View'
      Caption = 'Unfold all up from active line'
      Hint = 'Unfold all up from active line'
      ImageIndex = 142
      OnExecute = ActionViewUnfoldAllUpFromActiveLineExecute
    end
    object ActionViewUnfoldSelected: TAction
      Category = 'View'
      Caption = 'Unfold selected'
      Hint = 'Unfold selected'
      ImageIndex = 142
      OnExecute = ActionViewUnfoldSelectedExecute
    end
    object ActionOpenFileList: TAction
      ShortCut = 32891
      OnExecute = ActionOpenFileListExecute
    end
    object ActionToolsClipboardHistory: TAction
      Category = 'Tools'
      Caption = 'Clipboard history'
      ImageIndex = 147
      OnExecute = ActionToolsClipboardHistoryExecute
    end
  end
  object PopupMenuDocument: TPopupMenu [19]
    Images = ImagesDataModule.ImageListSmall
    Left = 594
    Top = 158
    object MenuItemFileClose: TMenuItem
      Action = ActionFileClose
    end
    object MenuItemFileCloseAll: TMenuItem
      Action = ActionFileCloseAll
    end
    object MenuItemPopupMenuDocumentDivider1: TMenuItem
      Caption = '-'
    end
    object MenuItemFileCloseAllOther: TMenuItem
      Action = ActionFileCloseAllOther
    end
    object MenuItemPopupMenuDocumentDivider2: TMenuItem
      Caption = '-'
    end
    object MenuItemFileSave: TMenuItem
      Action = ActionFileSave
    end
    object MenuItemFileSaveAs: TMenuItem
      Action = ActionFileSaveAs
    end
    object MenuItemPopupMenuDocumentDivider3: TMenuItem
      Caption = '-'
    end
    object MenuItemFilePrint: TMenuItem
      Action = ActionFilePrint
    end
    object MenuItemFilePrintPreview: TMenuItem
      Action = ActionFilePrintPreview
    end
    object MenuItemPopupMenuDocumentDivider4: TMenuItem
      Caption = '-'
    end
    object MenuItemToolsSelectForCompare: TMenuItem
      Action = ActionToolsSelectForCompare
    end
    object MenuItemFileSelectFromDirectory: TMenuItem
      Action = ActionFileSelectFromDirectory
    end
    object MenuItemPopupMenuDocumentDivider5: TMenuItem
      Caption = '-'
    end
    object MenuItemFileProperties: TMenuItem
      Action = ActionFileProperties
    end
  end
  object DragDrop: TBCDragDrop [20]
    DropTarget = Owner
    OnDrop = DragDropDrop
    Left = 36
    Top = 372
  end
  object PopupMenuDocumentFormat: TPopupMenu [21]
    Images = ImagesDataModule.ImageList
    Left = 314
    Top = 579
    object MenuItemDocumentFormatJSON: TMenuItem
      Action = ActionDocumentFormatJSON
      object MenuItemDocumentFormatJSONMinify: TMenuItem
        Action = ActionDocumentFormatJSONMinify
      end
      object MenuItemDocumentFormatJSONIndent2: TMenuItem
        Action = ActionDocumentFormatJSONIndent2
      end
      object MenuItemDocumentFormatJSONIndent3: TMenuItem
        Action = ActionDocumentFormatJSONIndent3
      end
      object MenuItemDocumentFormatJSONIndent4: TMenuItem
        Action = ActionDocumentFormatJSONIndent4
      end
    end
    object MenuItemDocumentFormatSQL: TMenuItem
      Action = ActionDocumentFormatSQL
    end
    object MenuItemDocumentFormatXML: TMenuItem
      Action = ActionDocumentFormatXML
    end
  end
  object PopupMenuEditor: TPopupMenu [22]
    Images = ImagesDataModule.ImageListSmall
    Left = 448
    Top = 164
    object MenuItemCut: TMenuItem
      Action = ActionEditCut
    end
    object MenuItemCopy: TMenuItem
      Action = ActionEditCopy
    end
    object MenuItemPaste: TMenuItem
      Action = ActionEditPaste
    end
    object MenuItemSelectAll: TMenuItem
      Action = ActionEditSelectAll
    end
    object MenuItemSeparator1: TMenuItem
      Caption = '-'
    end
    object MenuItemUndo: TMenuItem
      Action = ActionEditUndo
    end
    object MenuItemRedo: TMenuItem
      Action = ActionEditRedo
    end
    object MenuItemSeparator2: TMenuItem
      Caption = '-'
    end
    object MenuItemToggleBookmark: TMenuItem
      Action = ActionSearchToggleBookmark
    end
    object MenuItemToggleBookmarks: TMenuItem
      Action = ActionSearchToggleBookmarks
      object MenuItemToggleBookmark1: TMenuItem
        Tag = 1
        Action = ActionToggleBookmarks1
      end
      object MenuItemToggleBookmark2: TMenuItem
        Tag = 2
        Action = ActionToggleBookmarks2
      end
      object MenuItemToggleBookmark3: TMenuItem
        Tag = 3
        Action = ActionToggleBookmarks3
      end
      object MenuItemToggleBookmark4: TMenuItem
        Tag = 4
        Action = ActionToggleBookmarks4
      end
      object MenuItemToggleBookmark5: TMenuItem
        Tag = 5
        Action = ActionToggleBookmarks5
      end
      object MenuItemToggleBookmark6: TMenuItem
        Tag = 6
        Action = ActionToggleBookmarks6
      end
      object MenuItemToggleBookmark7: TMenuItem
        Tag = 7
        Action = ActionToggleBookmarks7
      end
      object MenuItemToggleBookmark8: TMenuItem
        Tag = 8
        Action = ActionToggleBookmarks8
      end
      object MenuItemToggleBookmark9: TMenuItem
        Tag = 9
        Action = ActionToggleBookmarks9
      end
    end
    object MenuItemGotoBookmarks: TMenuItem
      Action = ActionSearchGoToBookmarks
      object MenuItemGotoBookmarkNext: TMenuItem
        Action = ActionGotoNextBookmark
      end
      object MenuItemGotoBookmarkPrevious: TMenuItem
        Action = ActionGotoPreviousBookmark
      end
      object MenuItemGotoBookmarkDivider: TMenuItem
        Caption = '-'
      end
      object MenuItemGotoBookmark1: TMenuItem
        Tag = 1
        Action = ActionGotoBookmarks1
      end
      object MenuItemGotoBookmark2: TMenuItem
        Tag = 2
        Action = ActionGotoBookmarks2
      end
      object MenuItemGotoBookmark3: TMenuItem
        Tag = 3
        Action = ActionGotoBookmarks3
      end
      object MenuItemGotoBookmark4: TMenuItem
        Tag = 4
        Action = ActionGotoBookmarks4
      end
      object MenuItemGotoBookmark5: TMenuItem
        Tag = 5
        Action = ActionGotoBookmarks5
      end
      object MenuItemGotoBookmark6: TMenuItem
        Tag = 6
        Action = ActionGotoBookmarks6
      end
      object MenuItemGotoBookmark7: TMenuItem
        Tag = 7
        Action = ActionGotoBookmarks7
      end
      object MenuItemGotoBookmark8: TMenuItem
        Tag = 8
        Action = ActionGotoBookmarks8
      end
      object MenuItemGotoBookmark9: TMenuItem
        Tag = 9
        Action = ActionGotoBookmarks9
      end
    end
    object MenuItemClearBookmarks: TMenuItem
      Action = ActionSearchClearBookmarks
    end
    object MenuItemSeparator3: TMenuItem
      Caption = '-'
    end
    object MenuItemInsert: TMenuItem
      Action = ActionEditInsert
      object MenuItemDateandTime: TMenuItem
        Action = ActionEditInsertDateTime
      end
      object MenuItemInsertColor: TMenuItem
        Action = ActionEditInsertHexColor
      end
      object MenuItemInsertTag: TMenuItem
        Action = ActionEditInsertTag
      end
      object MenuItemInsertLine: TMenuItem
        Action = ActionEditInsertLine
      end
    end
    object MenuItemDelete: TMenuItem
      Action = ActionEditDelete
      object MenuItemDeleteLine: TMenuItem
        Action = ActionEditDeleteLine
      end
      object MenuItemDeleteEndOfLine: TMenuItem
        Action = ActionEditDeleteEndOfLine
      end
      object MenuItemDeleteWord: TMenuItem
        Action = ActionEditDeleteWord
      end
      object MenuItemDeleteWhiteSpace: TMenuItem
        Action = ActionEditDeleteWhitespace
      end
    end
    object MenuItemSeparator4: TMenuItem
      Caption = '-'
    end
    object MenuItemIndent: TMenuItem
      Action = ActionEditIndent
      object MenuItemIncreaseIndent: TMenuItem
        Action = ActionEditIndentIncrease
      end
      object MenuItemDecreaseIndent: TMenuItem
        Action = ActionEditIndentDecrease
      end
    end
    object MenuItemSort: TMenuItem
      Action = ActionEditSort
      object MenuItemSortAscending: TMenuItem
        Action = ActionEditSortAsc
      end
      object MenuItemSortDescending: TMenuItem
        Action = ActionEditSortDesc
      end
      object Random3: TMenuItem
        Action = ActionEditSortRandom
      end
    end
    object MenuItemSeparator5: TMenuItem
      Caption = '-'
    end
    object MenuItemFold: TMenuItem
      Action = ActionViewFold
      object MenuItemFoldAll: TMenuItem
        Action = ActionViewFoldAll
      end
      object MenuItemFoldAllDownFromSelectedLine: TMenuItem
        Action = ActionViewFoldAllDownFromActiveLine
      end
      object MenuItemFoldAllUpFromSelectedLine: TMenuItem
        Action = ActionViewFoldAllUpFromActiveLine
      end
      object MenuItemFoldSelected: TMenuItem
        Action = ActionViewFoldSelected
      end
    end
    object MenuItemUnfold: TMenuItem
      Action = ActionViewUnfold
      object MenuItemUnfoldAll: TMenuItem
        Action = ActionViewUnfoldAll
      end
      object MenuItemUnfoldAllDownFromSelectedLine: TMenuItem
        Action = ActionViewUnfoldAllDownFromActiveLine
      end
      object MenuItemUnfoldAllUpFromSelectedLine: TMenuItem
        Action = ActionViewUnfoldAllUpFromActiveLine
      end
      object MenuItemUnfoldSelected: TMenuItem
        Action = ActionViewUnfoldSelected
      end
    end
    object MenuItemSeparator6: TMenuItem
      Caption = '-'
    end
    object MenuItemFormat: TMenuItem
      Action = ActionDocumentFormat
      object MenuItemFormatJSON: TMenuItem
        Action = ActionDocumentFormatJSON
        object MenuItemFormatJSONMinify: TMenuItem
          Action = ActionDocumentFormatJSONMinify
        end
        object MenuItemFormatJSONIndent2: TMenuItem
          Action = ActionDocumentFormatJSONIndent2
        end
        object MenuItemFormatJSONIndent3: TMenuItem
          Action = ActionDocumentFormatJSONIndent3
        end
        object MenuItemFormatJSONIndent4: TMenuItem
          Action = ActionDocumentFormatJSONIndent4
        end
      end
      object MenuItemFormatSQL: TMenuItem
        Action = ActionDocumentFormatSQL
      end
      object MenuItemFormatXML: TMenuItem
        Action = ActionDocumentFormatXML
      end
    end
    object MenuItemSeparator7: TMenuItem
      Caption = '-'
    end
    object MenuItemToggleCase: TMenuItem
      Action = ActionEditToggleCase
    end
  end
  object PopupMenuToggleCase: TPopupMenu [23]
    Images = ImagesDataModule.ImageList
    Left = 937
    Top = 586
    object MenuItemToggleCaseUpper: TMenuItem
      Action = ActionEditToggleCaseUpper
    end
    object MenuItemToggleCaseLower: TMenuItem
      Action = ActionEditToggleCaseLower
    end
    object MenuItemToggleCaseAlternating: TMenuItem
      Action = ActionEditToggleCaseAlternating
    end
    object MenuItemToggleCaseSentence: TMenuItem
      Action = ActionEditToggleCaseSentence
    end
    object MenuItemToggleCaseTitle: TMenuItem
      Action = ActionEditToggleCaseTitle
    end
  end
  object PopupMenuDocumentMacro: TPopupMenu [24]
    Images = ImagesDataModule.ImageList
    Left = 466
    Top = 521
    object MenuItemMacroPlayback: TMenuItem
      Action = ActionMacroPlayback
    end
    object MenuItemMacroRecordPause: TMenuItem
      Action = ActionMacroRecord
    end
    object MenuItemMacroStop: TMenuItem
      Action = ActionMacroStop
    end
    object MenuItemPopupMenuDocumentMacroDivider: TMenuItem
      Caption = '-'
    end
    object MenuItemMacroOpen: TMenuItem
      Action = ActionMacroOpen
    end
    object MenuItemMacroSaveAs: TMenuItem
      Action = ActionMacroSaveAs
    end
  end
  object OpenDialog: TsOpenDialog [25]
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 874
    Top = 176
  end
  object SaveDialog: TsSaveDialog [26]
    Left = 874
    Top = 228
  end
  object PrintDialog: TPrintDialog [27]
    Options = [poPageNums, poSelection]
    Left = 872
    Top = 280
  end
  object EditorPrint: TBCEditorPrint [28]
    Color = clWhite
    Copies = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Footer.DefaultFont.Charset = DEFAULT_CHARSET
    Footer.DefaultFont.Color = clBlack
    Footer.DefaultFont.Height = -12
    Footer.DefaultFont.Name = 'Courier New'
    Footer.DefaultFont.Style = []
    Header.DefaultFont.Charset = DEFAULT_CHARSET
    Header.DefaultFont.Color = clBlack
    Header.DefaultFont.Height = -12
    Header.DefaultFont.Name = 'Courier New'
    Header.DefaultFont.Style = []
    Margins.Bottom = 18.000000000000000000
    Margins.Footer = 15.000000000000000000
    Margins.Header = 15.000000000000000000
    Margins.InternalMargin = 0.500000000000000000
    Margins.Left = 20.000000000000000000
    Margins.LeftTextIndent = 2.000000000000000000
    Margins.MirrorMargins = False
    Margins.Right = 15.000000000000000000
    Margins.RightTextIndent = 2.000000000000000000
    Margins.Top = 18.000000000000000000
    OnPrintLine = EditorPrintPrintLine
    OnPrintStatus = EditorPrintPrintStatus
    Left = 872
    Top = 348
  end
  object EditorMacroRecorder: TBCEditorMacroRecorder [29]
    RecordShortCut = 24658
    PlaybackShortCut = 24656
    Left = 870
    Top = 408
  end
  object Timer: TTimer [30]
    OnTimer = TimerTimer
    Left = 958
    Top = 180
  end
  object PopupMenuXMLTree: TPopupMenu [31]
    Images = ImagesDataModule.ImageListSmall
    Left = 448
    Top = 306
    object MenuItemXMLRefresh: TMenuItem
      Action = ActionXMLTreeRefresh
    end
  end
  inherited MainMenu: TMainMenu
    Images = ImagesDataModule.ImageListSmall
    Left = 117
    Top = 366
    object MenuItemMainMenuFile: TMenuItem
      Action = ActionFile
      object MenuItemMainMenuFileNew: TMenuItem
        Action = ActionFileNew
      end
      object MenuItemMainMenuFileOpen: TMenuItem
        Action = ActionFileOpen
      end
      object MenuItemMainMenuFileReopen: TMenuItem
        Action = ActionFileReopen
      end
      object MenuItemMainMenuFileDivider1: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuFileSave: TMenuItem
        Action = ActionFileSave
      end
      object MenuItemMainMenuFileSaveAs: TMenuItem
        Action = ActionFileSaveAs
      end
      object MenuItemMainMenuFileSaveAll: TMenuItem
        Action = ActionFileSaveAll
      end
      object MenuItemMainMenuFileClose: TMenuItem
        Action = ActionFileClose
      end
      object MenuItemMainMenuFileCloseAll: TMenuItem
        Action = ActionFileCloseAll
      end
      object MenuItemMainMenuFileCloseAllOther: TMenuItem
        Action = ActionFileCloseAllOther
      end
      object MenuItemMainMenuFileDivider2: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuFilePrint: TMenuItem
        Action = ActionFilePrint
      end
      object MenuItemMainMenuFilePrintPreview: TMenuItem
        Action = ActionFilePrintPreview
      end
      object MenuItemMainMenuFileDivider3: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuFileExit: TMenuItem
        Action = ActionFileExit
      end
    end
    object MenuItemMainMenuEdit: TMenuItem
      Action = ActionEdit
      object MenuItemMainMenuEditUndo: TMenuItem
        Action = ActionEditUndo
      end
      object MenuItemMainMenuEditRedo: TMenuItem
        Action = ActionEditRedo
      end
      object MenuItemMainMenuEditDivider1: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuEditCut: TMenuItem
        Action = ActionEditCut
      end
      object MenuItemMainMenuEditCopy: TMenuItem
        Action = ActionEditCopy
      end
      object MenuItemMainMenuEditPaste: TMenuItem
        Action = ActionEditPaste
      end
      object MenuItemMainMenuEditSelectAll: TMenuItem
        Action = ActionEditSelectAll
      end
      object MenuItemMainMenuEditDivider2: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuEditInsert: TMenuItem
        Action = ActionEditInsert
        object MenuItemMainMenuEditInsertDateAndTime: TMenuItem
          Action = ActionEditInsertDateTime
        end
        object MenuItemMainMenuEditInsertColor: TMenuItem
          Action = ActionEditInsertHexColor
        end
        object MenuItemMainMenuEditInsertHTMLXMLTags: TMenuItem
          Action = ActionEditInsertTag
        end
        object MenuItemMainMenuEditInsertLine: TMenuItem
          Action = ActionEditInsertLine
        end
      end
      object MenuItemMainMenuEditDelete: TMenuItem
        Action = ActionEditDelete
        object MenuItemMainMenuEditDeleteLine: TMenuItem
          Action = ActionEditDeleteLine
        end
        object MenuItemMainMenuEditDeleteEndOfLine: TMenuItem
          Action = ActionEditDeleteEndOfLine
        end
        object MenuItemMainMenuEditDeleteWord: TMenuItem
          Action = ActionEditDeleteWord
        end
        object MenuItemMainMenuEditDeleteWhitespace: TMenuItem
          Action = ActionEditDeleteWhitespace
        end
      end
      object MenuItemMainMenuEditDivider3: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuEditIndent: TMenuItem
        Action = ActionEditIndent
        object MenuItemMainMenuEditIndentIncrease: TMenuItem
          Action = ActionEditIndentIncrease
        end
        object MenuItemMainMenuEditIndentDecrease: TMenuItem
          Action = ActionEditIndentDecrease
        end
      end
      object MenuItemMainMenuEditSort: TMenuItem
        Action = ActionEditSort
        object MenuItemMainMenuEditSortAscending: TMenuItem
          Action = ActionEditSortAsc
        end
        object MenuItemMainMenuEditSortDescending: TMenuItem
          Action = ActionEditSortDesc
        end
        object Random2: TMenuItem
          Action = ActionEditSortRandom
        end
      end
      object MenuItemMainMenuEditDivider4: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuEditToggleCase: TMenuItem
        Action = ActionEditToggleCase
      end
    end
    object MenuItemMainMenuSearch: TMenuItem
      Action = ActionSearch
      object MenuItemMainMenuSearchSearch: TMenuItem
        Action = ActionSearchSearchButton
        AutoCheck = True
      end
      object MenuItemMainMenuSearchReplace: TMenuItem
        Action = ActionSearchReplace
      end
      object MenuItemMainMenuSearchFindInFiles: TMenuItem
        Action = ActionSearchFindInFiles
      end
      object MenuItemMainMenuSearchDivider1: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuSearchToggleBookmark: TMenuItem
        Action = ActionSearchToggleBookmark
      end
      object MenuItemMainMenuSearchToggleBookmarks: TMenuItem
        Action = ActionSearchToggleBookmarks
        object MenuItemMainMenuSearchToggleBookmarksBookmark1: TMenuItem
          Action = ActionToggleBookmarks1
        end
        object MenuItemMainMenuSearchToggleBookmarksBookmark2: TMenuItem
          Action = ActionToggleBookmarks2
        end
        object MenuItemMainMenuSearchToggleBookmarksBookmark3: TMenuItem
          Action = ActionToggleBookmarks3
        end
        object MenuItemMainMenuSearchToggleBookmarksBookmark4: TMenuItem
          Action = ActionToggleBookmarks4
        end
        object MenuItemMainMenuSearchToggleBookmarksBookmark5: TMenuItem
          Action = ActionToggleBookmarks5
        end
        object MenuItemMainMenuSearchToggleBookmarksBookmark6: TMenuItem
          Action = ActionToggleBookmarks6
        end
        object MenuItemMainMenuSearchToggleBookmarksBookmark7: TMenuItem
          Action = ActionToggleBookmarks7
        end
        object MenuItemMainMenuSearchToggleBookmarksBookmark8: TMenuItem
          Action = ActionToggleBookmarks8
        end
        object MenuItemMainMenuSearchToggleBookmarksBookmark9: TMenuItem
          Action = ActionToggleBookmarks9
        end
      end
      object MenuItemMainMenuSearchGoToBookmarks: TMenuItem
        Action = ActionSearchGoToBookmarks
        object MenuItemMainMenuSearchGotoBookmarksNext: TMenuItem
          Action = ActionGotoNextBookmark
        end
        object MenuItemMainMenuSearchGotoBookmarksPrevious: TMenuItem
          Action = ActionGotoPreviousBookmark
        end
        object MenuItemMainMenuSearchGotoBookmarksDivider: TMenuItem
          Caption = '-'
        end
        object MenuItemMainMenuSearchGoToBookmarksBookmark1: TMenuItem
          Action = ActionGotoBookmarks1
        end
        object MenuItemMainMenuSearchGoToBookmarksBookmark2: TMenuItem
          Action = ActionGotoBookmarks2
        end
        object MenuItemMainMenuSearchGoToBookmarksBookmark3: TMenuItem
          Action = ActionGotoBookmarks3
        end
        object MenuItemMainMenuSearchGoToBookmarksBookmark4: TMenuItem
          Action = ActionGotoBookmarks4
        end
        object MenuItemMainMenuSearchGoToBookmarksBookmark5: TMenuItem
          Action = ActionGotoBookmarks5
        end
        object MenuItemMainMenuSearchGoToBookmarksBookmark6: TMenuItem
          Action = ActionGotoBookmarks6
        end
        object MenuItemMainMenuSearchGoToBookmarksBookmark7: TMenuItem
          Action = ActionGotoBookmarks7
        end
        object MenuItemMainMenuSearchGoToBookmarksBookmark8: TMenuItem
          Action = ActionGotoBookmarks8
        end
        object MenuItemMainMenuSearchGoToBookmarksBookmark9: TMenuItem
          Action = ActionGotoBookmarks9
        end
      end
      object MenuItemMainMenuSearchClearBookmarks: TMenuItem
        Action = ActionSearchClearBookmarks
      end
      object MenuItemMainMenuSearchDivider2: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuSearchGoToLine: TMenuItem
        Action = ActionSearchGoToLine
      end
    end
    object MenuItemMainMenuView: TMenuItem
      Action = ActionView
      object MenuItemMainMenuViewOpenDirectory: TMenuItem
        Action = ActionViewOpenDirectory
      end
      object MenuItemMainMenuViewCloseDirectory: TMenuItem
        Action = ActionViewCloseDirectory
      end
      object MenuItemMainMenuViewEditDirectory: TMenuItem
        Action = ActionViewEditDirectory
      end
      object MenuItemMainMenuViewDivider1: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuViewFiles: TMenuItem
        Action = ActionViewFiles
      end
      object MenuItemMainMenuViewDivider2: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuViewWordWrap: TMenuItem
        Action = ActionViewWordWrap
        AutoCheck = True
      end
      object MenuItemMainMenuViewLineNumbers: TMenuItem
        Action = ActionViewLineNumbers
        AutoCheck = True
      end
      object MenuItemMainMenuViewSpecialChars: TMenuItem
        Action = ActionViewSpecialChars
        AutoCheck = True
      end
      object MenuItemMainMenuViewSelectionMode: TMenuItem
        Action = ActionViewSelectionMode
        AutoCheck = True
      end
      object MenuItemMainMenuViewMinimap: TMenuItem
        Action = ActionViewMinimap
        AutoCheck = True
      end
      object MenuItemMainMenuViewSplit: TMenuItem
        Action = ActionViewSplit
        AutoCheck = True
      end
      object MenuItemMainMenuViewSyncedit: TMenuItem
        Action = ActionViewSyncEdit
      end
      object MenuItemMainMenuViewXMLTree: TMenuItem
        Action = ActionViewXMLTree
        AutoCheck = True
      end
      object MenuItemMainMenuViewDivider3: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuViewFold: TMenuItem
        Action = ActionViewFold
        object MenuItemMainMenuFoldAll: TMenuItem
          Action = ActionViewFoldAll
        end
        object MenuItemMainMenuFoldAllDownFromSelectedLine: TMenuItem
          Action = ActionViewFoldAllDownFromActiveLine
        end
        object MenuItemMainMenuFoldAllUpFromSelectedLine: TMenuItem
          Action = ActionViewFoldAllUpFromActiveLine
        end
        object MenuItemMainMenuFoldSelected: TMenuItem
          Action = ActionViewFoldSelected
        end
      end
      object MenuItemMainMenuUnfold: TMenuItem
        Action = ActionViewUnfold
        object MenuItemMainMenuUnfoldAll: TMenuItem
          Action = ActionViewUnfoldAll
        end
        object MenuItemMainMenuUnfoldAllDownFromSelectedLine: TMenuItem
          Action = ActionViewUnfoldAllDownFromActiveLine
        end
        object MenuItemMainMenuUnfoldAllUpFromSelectedLine: TMenuItem
          Action = ActionViewUnfoldAllUpFromActiveLine
        end
        object MenuItemMainMenuUnfoldSelected: TMenuItem
          Action = ActionViewUnfoldSelected
        end
      end
      object MenuItemMainMenuViewDivider4: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuViewPreviousPage: TMenuItem
        Action = ActionViewPreviousPage
      end
      object MenuItemMainMenuViewNextPage: TMenuItem
        Action = ActionViewNextPage
      end
    end
    object MenuItemMainMenuDocument: TMenuItem
      Action = ActionDocument
      object MenuItemMainMenuDocumentInfo: TMenuItem
        Action = ActionDocumentInfo
      end
      object MenuItemMainMenuDocumentDivider1: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuDocumentFormat: TMenuItem
        Action = ActionDocumentFormat
        object MenuItemMainMenuDocumentFormatJSON: TMenuItem
          Action = ActionDocumentFormatJSON
          object MenuItemMainMenuDocumentFormatJSONMinify: TMenuItem
            Action = ActionDocumentFormatJSONMinify
          end
          object MenuItemMainMenuDocumentFormatJSONIndent2: TMenuItem
            Action = ActionDocumentFormatJSONIndent2
          end
          object MenuItemMainMenuDocumentFormatJSONIndent3: TMenuItem
            Action = ActionDocumentFormatJSONIndent3
          end
          object MenuItemMainMenuDocumentFormatJSONIndent4: TMenuItem
            Action = ActionDocumentFormatJSONIndent4
          end
        end
        object MenuItemMainMenuDocumentFormatSQL: TMenuItem
          Action = ActionDocumentFormatSQL
        end
        object MenuItemMainMenuDocumentFormatXML: TMenuItem
          Action = ActionDocumentFormatXML
        end
      end
      object MenuItemMainMenuDocumentMacro: TMenuItem
        Action = ActionMacro
        object MenuItemMainMenuDocumentPlayback: TMenuItem
          Action = ActionMacroPlayback
        end
        object MenuItemMainMenuDocumentMacroRecordPause: TMenuItem
          Action = ActionMacroRecord
        end
        object MenuItemMainMenuDocumentStop: TMenuItem
          Action = ActionMacroStop
        end
        object MenuItemMainMenuDocumentMacroDivider: TMenuItem
          Caption = '-'
        end
        object MenuItemMainMenuDocumentOpen: TMenuItem
          Action = ActionMacroOpen
        end
        object MenuItemMainMenuDocumentSaveAs: TMenuItem
          Action = ActionMacroSaveAs
        end
      end
      object MenuItemMainMenuDocumentDivider2: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuDocumentViewInBrowser: TMenuItem
        Action = ActionDocumentViewInBrowser
      end
    end
    object MenuItemMainMenuTools: TMenuItem
      Action = ActionTools
      object MenuItemMainMenuToolsOptions: TMenuItem
        Action = ActionToolsOptions
      end
      object MenuItemMainMenuToolsDivider1: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuToolsCompareFiles: TMenuItem
        Action = ActionToolsCompareFiles
      end
      object MenuItemMainMenuToolsConvert: TMenuItem
        Action = ActionToolsConvert
      end
      object MenuItemMainMenuToolsCharacterMap: TMenuItem
        Action = ActionToolsCharacterMap
      end
      object MenuItemMainMenuToolsDivider2: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuToolsLanguageEditor: TMenuItem
        Action = ActionToolsLanguageEditor
      end
    end
    object MenuItemMainMenuHelp: TMenuItem
      Action = ActionHelp
      object MenuItemMainMenuHelpCheckForUpdates: TMenuItem
        Action = ActionHelpCheckForUpdates
      end
      object MenuItemMainMenuHelpDivider1: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuHelpVisitHomepage: TMenuItem
        Action = ActionHelpVisitHomepage
      end
      object MenuItemMainMenuHelpDivider2: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuHelpAboutEditBone: TMenuItem
        Action = ActionHelpAboutEditBone
      end
    end
  end
  object PopupMenuFileTreeView: TPopupMenu
    Images = ImagesDataModule.ImageListSmall
    OnPopup = PopupMenuFileTreeViewPopup
    Left = 446
    Top = 234
    object MenuItemOpenDirectory: TMenuItem
      Action = ActionViewOpenDirectory
    end
    object MenuItemCloseDirectory: TMenuItem
      Action = ActionViewCloseDirectory
    end
    object MenuItemEditDirectory: TMenuItem
      Action = ActionViewEditDirectory
    end
    object MenuItemDirectorySeparator1: TMenuItem
      Caption = '-'
    end
    object MenuItemFiles: TMenuItem
      Action = ActionViewFiles
    end
    object MenuItemFindinFiles: TMenuItem
      Action = ActionDirectoryFindInFiles
    end
    object MenuItemDirectorySeparator2: TMenuItem
      Caption = '-'
    end
    object MenuItemRefresh: TMenuItem
      Action = ActionDirectoryRefresh
    end
    object MenuItemDirectorySeparator3: TMenuItem
      Caption = '-'
    end
    object MenuItemRename: TMenuItem
      Action = ActionDirectoryRename
    end
    object MenuItemDirectoryDelete: TMenuItem
      Action = ActionDirectoryDelete
    end
    object MenuItemDirectorySeparator4: TMenuItem
      Caption = '-'
    end
    object MenuItemContextMenu: TMenuItem
      Action = ActionDirectoryContextMenu
    end
    object MenuItemProperties: TMenuItem
      Action = ActionDirectoryProperties
    end
  end
  object PopupMenuOutput: TPopupMenu
    Images = ImagesDataModule.ImageListSmall
    Left = 592
    Top = 412
    object MenuItemOutputClose: TMenuItem
      Action = ActionOutputClose
    end
    object MenuItemOutputCloseAll: TMenuItem
      Action = ActionOutputCloseAll
    end
    object MenuItemOutputCloseAllOtherPages: TMenuItem
      Action = ActionOutputCloseAllOtherPages
    end
    object MenuItemOutputDivider1: TMenuItem
      Caption = '-'
    end
    object MenuItemOutputCopyAllToClipboard: TMenuItem
      Action = ActionOutputCopyAllToClipboard
    end
    object MenuItemOutputCopySelectedToClipboard: TMenuItem
      Action = ActionOutputCopySelectedToClipboard
    end
    object MenuItemOutputDivider2: TMenuItem
      Caption = '-'
    end
    object MenuItemOutputOpenAll: TMenuItem
      Action = ActionOutputOpenAll
    end
    object MenuItemOutputOpenSelected: TMenuItem
      Action = ActionOutputOpenSelected
    end
    object MenuItemOutputDivider3: TMenuItem
      Caption = '-'
    end
    object MenuItemOutputSelectAll: TMenuItem
      Action = ActionOutputSelectAll
    end
    object MenuItemOutputUnselectAll: TMenuItem
      Action = ActionOutputUnselectAll
    end
  end
  object PopupMenuDummy: TPopupMenu
    Left = 718
    Top = 337
  end
  object PopupMenuViewFold: TPopupMenu
    Images = ImagesDataModule.ImageList
    Left = 799
    Top = 525
    object MenuItemViewFoldAll: TMenuItem
      Action = ActionViewFoldAll
    end
    object MenuItemViewFoldAllDownFromSelectedLine: TMenuItem
      Action = ActionViewFoldAllDownFromActiveLine
    end
    object MenuItemViewFoldAllUpFromSelectedLine: TMenuItem
      Action = ActionViewFoldAllUpFromActiveLine
    end
    object MenuItemViewFoldSelected: TMenuItem
      Action = ActionViewFoldSelected
    end
  end
  object PopupMenuViewUnfold: TPopupMenu
    Images = ImagesDataModule.ImageList
    Left = 801
    Top = 585
    object MenuItemViewUnfoldAll: TMenuItem
      Action = ActionViewUnfoldAll
    end
    object MenuItemViewUnfoldAllDownFromSelectedLine: TMenuItem
      Action = ActionViewUnfoldAllDownFromActiveLine
    end
    object MenuItemViewUnfoldAllUpFromSelectedLine: TMenuItem
      Action = ActionViewUnfoldAllUpFromActiveLine
    end
    object MenuItemViewUnfoldSelected: TMenuItem
      Action = ActionViewUnfoldSelected
    end
  end
  object ClipboardMonitor: TJvClipboardMonitor
    OnChange = ClipboardMonitorChange
    Left = 600
    Top = 218
  end
  object ColorDialog: TsColorDialog
    Options = [cdFullOpen, cdAnyColor]
    Left = 804
    Top = 176
  end
end
