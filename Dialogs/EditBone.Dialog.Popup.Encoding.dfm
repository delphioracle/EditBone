object PopupEncodingDialog: TPopupEncodingDialog
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 279
  ClientWidth = 336
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMode = pmExplicit
  Position = poDesigned
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object VirtualDrawTree: TVirtualDrawTree
    Left = 0
    Top = 0
    Width = 336
    Height = 279
    Align = alClient
    Header.AutoSizeIndex = 0
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'Tahoma'
    Header.Font.Style = []
    Header.MainColumn = -1
    Indent = 0
    TabOrder = 0
    TreeOptions.MiscOptions = [toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
    TreeOptions.PaintOptions = [toHideFocusRect, toShowRoot, toThemeAware]
    TreeOptions.SelectionOptions = [toFullRowSelect]
    OnDblClick = VirtualDrawTreeDblClick
    OnDrawNode = VirtualDrawTreeDrawNode
    OnFreeNode = VirtualDrawTreeFreeNode
    OnGetNodeWidth = VirtualDrawTreeGetNodeWidth
    Columns = <>
  end
  object SkinProvider: TsSkinProvider
    AllowExtBorders = False
    DrawNonClientArea = False
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 44
    Top = 84
  end
end
