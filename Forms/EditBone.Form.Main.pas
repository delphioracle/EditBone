unit EditBone.Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BCCommon.Form.Base, System.Actions, Vcl.ActnList, Vcl.Menus,
  sSkinProvider, acTitleBar, sSkinManager, EditBone.Dialog.Popup.Files, BCCommon.Dialog.Popup.Highlighter,
  Vcl.ComCtrls, BCControl.StatusBar, Vcl.ExtCtrls, BCControl.Panel, BCControl.Splitter, BCEditor.Editor,
  sPageControl, BCControl.PageControl, BCCommon.Images, BCControl.SpeedButton, Vcl.Buttons, sSpeedButton,
  EditBone.Directory, EditBone.Document, VirtualTrees, BCEditor.Print.Types, BCCommon.Dialog.Popup.Encoding,
  BCComponent.DragDrop, System.Diagnostics, EditBone.Output, Vcl.ImgList, acAlphaImageList,  BCEditor.Types,
  BCControl.ProgressBar, EditBone.FindInFiles, BCEditor.MacroRecorder, BCEditor.Print, sDialogs,
  System.Generics.Collections, BCControl.ComboBox, Vcl.AppEvnts, BCCommon.Dialog.Popup.SearchEngine,
  BCCommon.Dialog.Popup.Highlighter.Color, sPanel, sSplitter, BCComponent.TitleBar, BCCommon.Dialog.ClipboardHistory,
  BCComponent.SkinManager, sStatusBar, Vcl.StdCtrls, sComboBoxes, sComboBox, sTrackBar, JvComponentBase,
  JvClipboardMonitor;

const
  SWindowClassName = 'UniqueWindowClassNameForEditBone';

type
  TMainForm = class(TBCBaseForm)
    ActionDirectoryContextMenu: TAction;
    ActionDirectoryDelete: TAction;
    ActionDirectoryFindInFiles: TAction;
    ActionDirectoryProperties: TAction;
    ActionDirectoryRefresh: TAction;
    ActionDirectoryRename: TAction;
    ActionDirectorySearchFindInFiles: TAction;
    ActionDocument: TAction;
    ActionDocumentFormat: TAction;
    ActionDocumentFormatJSON: TAction;
    ActionDocumentFormatJSONIndent2: TAction;
    ActionDocumentFormatJSONIndent3: TAction;
    ActionDocumentFormatJSONIndent4: TAction;
    ActionDocumentFormatJSONMinify: TAction;
    ActionDocumentFormatSQL: TAction;
    ActionDocumentFormatXML: TAction;
    ActionDocumentHTMLExport: TAction;
    ActionDocumentInfo: TAction;
    ActionDocumentViewInBrowser: TAction;
    ActionEdit: TAction;
    ActionEditCopy: TAction;
    ActionEditCut: TAction;
    ActionEditDelete: TAction;
    ActionEditDeleteEndOfLine: TAction;
    ActionEditDeleteLine: TAction;
    ActionEditDeleteWhitespace: TAction;
    ActionEditDeleteWord: TAction;
    ActionEditIndent: TAction;
    ActionEditIndentDecrease: TAction;
    ActionEditIndentIncrease: TAction;
    ActionEditInsert: TAction;
    ActionEditInsertDateTime: TAction;
    ActionEditInsertLine: TAction;
    ActionEditInsertTag: TAction;
    ActionEditPaste: TAction;
    ActionEditRedo: TAction;
    ActionEditSelectAll: TAction;
    ActionEditSort: TAction;
    ActionEditSortAsc: TAction;
    ActionEditSortDesc: TAction;
    ActionEditToggleCase: TAction;
    ActionEditToggleCaseAlternating: TAction;
    ActionEditToggleCaseLower: TAction;
    ActionEditToggleCaseSentence: TAction;
    ActionEditToggleCaseTitle: TAction;
    ActionEditToggleCaseUpper: TAction;
    ActionEditUndo: TAction;
    ActionFile: TAction;
    ActionFileClose: TAction;
    ActionFileCloseAll: TAction;
    ActionFileCloseAllOther: TAction;
    ActionFileNew: TAction;
    ActionFileOpen: TAction;
    ActionFilePrint: TAction;
    ActionFilePrintPreview: TAction;
    ActionFileProperties: TAction;
    ActionFileReopen: TAction;
    ActionFileReopenProperties: TAction;
    ActionFileSave: TAction;
    ActionFileSaveAll: TAction;
    ActionFileSaveAs: TAction;
    ActionFileSelectFromDirectory: TAction;
    ActionGotoBookmarks1: TAction;
    ActionGotoBookmarks2: TAction;
    ActionGotoBookmarks3: TAction;
    ActionGotoBookmarks4: TAction;
    ActionGotoBookmarks5: TAction;
    ActionGotoBookmarks6: TAction;
    ActionGotoBookmarks7: TAction;
    ActionGotoBookmarks8: TAction;
    ActionGotoBookmarks9: TAction;
    ActionHelp: TAction;
    ActionHelpAboutEditBone: TAction;
    ActionHelpCheckForUpdates: TAction;
    ActionHelpVisitHomepage: TAction;
    ActionMacro: TAction;
    ActionMacroOpen: TAction;
    ActionMacroPause: TAction;
    ActionMacroPlayback: TAction;
    ActionMacroRecord: TAction;
    ActionMacroSaveAs: TAction;
    ActionMacroStop: TAction;
    ActionMenuDocument: TAction;
    ActionMenuEdit: TAction;
    ActionMenuFile: TAction;
    ActionMenuHelp: TAction;
    ActionMenuSearch: TAction;
    ActionMenuTools: TAction;
    ActionMenuView: TAction;
    ActionOutputClose: TAction;
    ActionOutputCloseAll: TAction;
    ActionOutputCloseAllOtherPages: TAction;
    ActionOutputCopyAllToClipboard: TAction;
    ActionOutputCopySelectedToClipboard: TAction;
    ActionOutputOpenAll: TAction;
    ActionOutputOpenSelected: TAction;
    ActionOutputSelectAll: TAction;
    ActionOutputUnselectAll: TAction;
    ActionSearch: TAction;
    ActionSearchCaseSensitive: TAction;
    ActionSearchClearBookmarks: TAction;
    ActionSearchClose: TAction;
    ActionSearchEngine: TAction;
    ActionSearchFindInFiles: TAction;
    ActionSearchFindNext: TAction;
    ActionSearchFindPrevious: TAction;
    ActionSearchGoToBookmarks: TAction;
    ActionSearchGoToLine: TAction;
    ActionSearchInSelection: TAction;
    ActionSearchOptions: TAction;
    ActionSearchReplace: TAction;
    ActionSearchSearch: TAction;
    ActionSearchSearchButton: TAction;
    ActionSearchTextItems: TAction;
    ActionSearchToggleBookmark: TAction;
    ActionSearchToggleBookmarks: TAction;
    ActionSelectionBoxDown: TAction;
    ActionSelectionBoxLeft: TAction;
    ActionSelectionBoxRight: TAction;
    ActionSelectionBoxUp: TAction;
    ActionSelectReopenFile: TAction;
    ActionToggleBookmarks1: TAction;
    ActionToggleBookmarks2: TAction;
    ActionToggleBookmarks3: TAction;
    ActionToggleBookmarks4: TAction;
    ActionToggleBookmarks5: TAction;
    ActionToggleBookmarks6: TAction;
    ActionToggleBookmarks7: TAction;
    ActionToggleBookmarks8: TAction;
    ActionToggleBookmarks9: TAction;
    ActionToolbarMenuLanguage: TAction;
    ActionToolbarMenuSkin: TAction;
    ActionToolbarMenuView: TAction;
    ActionTools: TAction;
    ActionToolsCharacterMap: TAction;
    ActionToolsCompareFiles: TAction;
    ActionToolsConvert: TAction;
    ActionToolsLanguageEditor: TAction;
    ActionToolsOptions: TAction;
    ActionToolsSelectForCompare: TAction;
    ActionView: TAction;
    ActionViewCloseDirectory: TAction;
    ActionViewColorSelection: TAction;
    ActionViewDirectory: TAction;
    ActionViewEditDirectory: TAction;
    ActionViewEncodingSelection: TAction;
    ActionViewFiles: TAction;
    ActionViewFold: TAction;
    ActionViewFoldAll: TAction;
    ActionViewFoldAllDownFromActiveLine: TAction;
    ActionViewFoldAllUpFromActiveLine: TAction;
    ActionViewFoldSelected: TAction;
    ActionViewHighlighterSelection: TAction;
    ActionViewLineNumbers: TAction;
    ActionViewMainMenu: TAction;
    ActionViewMenuBar: TAction;
    ActionViewMinimap: TAction;
    ActionViewNextPage: TAction;
    ActionViewOpenDirectory: TAction;
    ActionViewOutput: TAction;
    ActionViewPreviousPage: TAction;
    ActionViewSelectionMode: TAction;
    ActionViewSpecialChars: TAction;
    ActionViewSplit: TAction;
    ActionViewStatusBar: TAction;
    ActionViewSyncEdit: TAction;
    ActionViewTitleBar: TAction;
    ActionViewTitleBarFileList: TAction;
    ActionViewTitleBarFilename: TAction;
    ActionViewToolbar: TAction;
    ActionViewUnfold: TAction;
    ActionViewUnfoldAll: TAction;
    ActionViewUnfoldAllDownFromActiveLine: TAction;
    ActionViewUnfoldAllUpFromActiveLine: TAction;
    ActionViewUnfoldSelected: TAction;
    ActionViewWordWrap: TAction;
    ActionViewXMLTree: TAction;
    ActionXMLTreeRefresh: TAction;
    DragDrop: TBCDragDrop;
    EditorMacroRecorder: TBCEditorMacroRecorder;
    EditorPrint: TBCEditorPrint;
    MenuItemClearBookmarks: TMenuItem;
    MenuItemCloseDirectory: TMenuItem;
    MenuItemContextMenu: TMenuItem;
    MenuItemCopy: TMenuItem;
    MenuItemCut: TMenuItem;
    MenuItemDateandTime: TMenuItem;
    MenuItemDecreaseIndent: TMenuItem;
    MenuItemDelete: TMenuItem;
    MenuItemDeleteEndOfLine: TMenuItem;
    MenuItemDeleteLine: TMenuItem;
    MenuItemDeleteWhiteSpace: TMenuItem;
    MenuItemDeleteWord: TMenuItem;
    MenuItemDirectoryDelete: TMenuItem;
    MenuItemDirectorySeparator1: TMenuItem;
    MenuItemDirectorySeparator2: TMenuItem;
    MenuItemDirectorySeparator3: TMenuItem;
    MenuItemDirectorySeparator4: TMenuItem;
    MenuItemDocumentFormatJSON: TMenuItem;
    MenuItemDocumentFormatJSONIndent2: TMenuItem;
    MenuItemDocumentFormatJSONIndent3: TMenuItem;
    MenuItemDocumentFormatJSONIndent4: TMenuItem;
    MenuItemDocumentFormatJSONMinify: TMenuItem;
    MenuItemDocumentFormatSQL: TMenuItem;
    MenuItemDocumentFormatXML: TMenuItem;
    MenuItemEditDeleteEndOfLine: TMenuItem;
    MenuItemEditDeleteLine: TMenuItem;
    MenuItemEditDeleteWhitespace: TMenuItem;
    MenuItemEditDeleteWord: TMenuItem;
    MenuItemEditDirectory: TMenuItem;
    MenuItemEditIndentDecrease: TMenuItem;
    MenuItemEditIndentIncrease: TMenuItem;
    MenuItemEditInsertDate: TMenuItem;
    MenuItemEditInsertLine: TMenuItem;
    MenuItemEditInsertTags: TMenuItem;
    MenuItemEditSortAscending: TMenuItem;
    MenuItemEditSortDescending: TMenuItem;
    MenuItemFileClose: TMenuItem;
    MenuItemFileCloseAll: TMenuItem;
    MenuItemFileCloseAllOther: TMenuItem;
    MenuItemFilePrint: TMenuItem;
    MenuItemFilePrintPreview: TMenuItem;
    MenuItemFileProperties: TMenuItem;
    MenuItemFiles: TMenuItem;
    MenuItemFileSave: TMenuItem;
    MenuItemFileSaveAs: TMenuItem;
    MenuItemFileSelectFromDirectory: TMenuItem;
    MenuItemFindinFiles: TMenuItem;
    MenuItemFold: TMenuItem;
    MenuItemFoldAll: TMenuItem;
    MenuItemFoldAllDownFromSelectedLine: TMenuItem;
    MenuItemFoldAllUpFromSelectedLine: TMenuItem;
    MenuItemFoldSelected: TMenuItem;
    MenuItemFormat: TMenuItem;
    MenuItemFormatJSON: TMenuItem;
    MenuItemFormatJSONIndent2: TMenuItem;
    MenuItemFormatJSONIndent3: TMenuItem;
    MenuItemFormatJSONIndent4: TMenuItem;
    MenuItemFormatJSONMinify: TMenuItem;
    MenuItemFormatSQL: TMenuItem;
    MenuItemFormatXML: TMenuItem;
    MenuItemGotoBookmark1: TMenuItem;
    MenuItemGotoBookmark2: TMenuItem;
    MenuItemGotoBookmark3: TMenuItem;
    MenuItemGotoBookmark4: TMenuItem;
    MenuItemGotoBookmark5: TMenuItem;
    MenuItemGotoBookmark6: TMenuItem;
    MenuItemGotoBookmark7: TMenuItem;
    MenuItemGotoBookmark8: TMenuItem;
    MenuItemGotoBookmark9: TMenuItem;
    MenuItemGotoBookmarks: TMenuItem;
    MenuItemIncreaseIndent: TMenuItem;
    MenuItemIndent: TMenuItem;
    MenuItemInsert: TMenuItem;
    MenuItemInsertLine: TMenuItem;
    MenuItemInsertTag: TMenuItem;
    MenuItemMacroOpen: TMenuItem;
    MenuItemMacroPlayback: TMenuItem;
    MenuItemMacroRecordPause: TMenuItem;
    MenuItemMacroSaveAs: TMenuItem;
    MenuItemMacroStop: TMenuItem;
    MenuItemMainMenu: TMenuItem;
    MenuItemMainMenuDocument: TMenuItem;
    MenuItemMainMenuDocumentDivider1: TMenuItem;
    MenuItemMainMenuDocumentDivider2: TMenuItem;
    MenuItemMainMenuDocumentFormat: TMenuItem;
    MenuItemMainMenuDocumentFormatJSON: TMenuItem;
    MenuItemMainMenuDocumentFormatJSONIndent2: TMenuItem;
    MenuItemMainMenuDocumentFormatJSONIndent3: TMenuItem;
    MenuItemMainMenuDocumentFormatJSONIndent4: TMenuItem;
    MenuItemMainMenuDocumentFormatJSONMinify: TMenuItem;
    MenuItemMainMenuDocumentFormatSQL: TMenuItem;
    MenuItemMainMenuDocumentFormatXML: TMenuItem;
    MenuItemMainMenuDocumentInfo: TMenuItem;
    MenuItemMainMenuDocumentMacro: TMenuItem;
    MenuItemMainMenuDocumentMacroDivider: TMenuItem;
    MenuItemMainMenuDocumentOpen: TMenuItem;
    MenuItemMainMenuDocumentPlayback: TMenuItem;
    MenuItemMainMenuDocumentMacroRecordPause: TMenuItem;
    MenuItemMainMenuDocumentSaveAs: TMenuItem;
    MenuItemMainMenuDocumentStop: TMenuItem;
    MenuItemMainMenuDocumentViewInBrowser: TMenuItem;
    MenuItemMainMenuEdit: TMenuItem;
    MenuItemMainMenuEditCopy: TMenuItem;
    MenuItemMainMenuEditCut: TMenuItem;
    MenuItemMainMenuEditDelete: TMenuItem;
    MenuItemMainMenuEditDeleteEndOfLine: TMenuItem;
    MenuItemMainMenuEditDeleteLine: TMenuItem;
    MenuItemMainMenuEditDeleteWhitespace: TMenuItem;
    MenuItemMainMenuEditDeleteWord: TMenuItem;
    MenuItemMainMenuEditDivider1: TMenuItem;
    MenuItemMainMenuEditDivider2: TMenuItem;
    MenuItemMainMenuEditDivider3: TMenuItem;
    MenuItemMainMenuEditDivider4: TMenuItem;
    MenuItemMainMenuEditIndent: TMenuItem;
    MenuItemMainMenuEditIndentDecrease: TMenuItem;
    MenuItemMainMenuEditIndentIncrease: TMenuItem;
    MenuItemMainMenuEditInsert: TMenuItem;
    MenuItemMainMenuEditInsertDateAndTime: TMenuItem;
    MenuItemMainMenuEditInsertHTMLXMLTags: TMenuItem;
    MenuItemMainMenuEditInsertLine: TMenuItem;
    MenuItemMainMenuEditPaste: TMenuItem;
    MenuItemMainMenuEditRedo: TMenuItem;
    MenuItemMainMenuEditSelectAll: TMenuItem;
    MenuItemMainMenuEditSort: TMenuItem;
    MenuItemMainMenuEditSortAscending: TMenuItem;
    MenuItemMainMenuEditSortDescending: TMenuItem;
    MenuItemMainMenuEditToggleCase: TMenuItem;
    MenuItemMainMenuEditUndo: TMenuItem;
    MenuItemMainMenuFile: TMenuItem;
    MenuItemMainMenuFileClose: TMenuItem;
    MenuItemMainMenuFileCloseAll: TMenuItem;
    MenuItemMainMenuFileCloseAllOther: TMenuItem;
    MenuItemMainMenuFileDivider1: TMenuItem;
    MenuItemMainMenuFileDivider2: TMenuItem;
    MenuItemMainMenuFileDivider3: TMenuItem;
    MenuItemMainMenuFileExit: TMenuItem;
    MenuItemMainMenuFileNew: TMenuItem;
    MenuItemMainMenuFileOpen: TMenuItem;
    MenuItemMainMenuFilePrint: TMenuItem;
    MenuItemMainMenuFilePrintPreview: TMenuItem;
    MenuItemMainMenuFileReopen: TMenuItem;
    MenuItemMainMenuFileSave: TMenuItem;
    MenuItemMainMenuFileSaveAll: TMenuItem;
    MenuItemMainMenuFileSaveAs: TMenuItem;
    MenuItemMainMenuFoldAll: TMenuItem;
    MenuItemMainMenuFoldAllDownFromSelectedLine: TMenuItem;
    MenuItemMainMenuFoldAllUpFromSelectedLine: TMenuItem;
    MenuItemMainMenuFoldSelected: TMenuItem;
    MenuItemMainMenuHelp: TMenuItem;
    MenuItemMainMenuHelpAboutEditBone: TMenuItem;
    MenuItemMainMenuHelpCheckForUpdates: TMenuItem;
    MenuItemMainMenuHelpDivider1: TMenuItem;
    MenuItemMainMenuHelpDivider2: TMenuItem;
    MenuItemMainMenuHelpVisitHomepage: TMenuItem;
    MenuItemMainMenuSearch: TMenuItem;
    MenuItemMainMenuSearchClearBookmarks: TMenuItem;
    MenuItemMainMenuSearchDivider1: TMenuItem;
    MenuItemMainMenuSearchDivider2: TMenuItem;
    MenuItemMainMenuSearchFindInFiles: TMenuItem;
    MenuItemMainMenuSearchGoToBookmarks: TMenuItem;
    MenuItemMainMenuSearchGoToBookmarksBookmark1: TMenuItem;
    MenuItemMainMenuSearchGoToBookmarksBookmark2: TMenuItem;
    MenuItemMainMenuSearchGoToBookmarksBookmark3: TMenuItem;
    MenuItemMainMenuSearchGoToBookmarksBookmark4: TMenuItem;
    MenuItemMainMenuSearchGoToBookmarksBookmark5: TMenuItem;
    MenuItemMainMenuSearchGoToBookmarksBookmark6: TMenuItem;
    MenuItemMainMenuSearchGoToBookmarksBookmark7: TMenuItem;
    MenuItemMainMenuSearchGoToBookmarksBookmark8: TMenuItem;
    MenuItemMainMenuSearchGoToBookmarksBookmark9: TMenuItem;
    MenuItemMainMenuSearchGoToLine: TMenuItem;
    MenuItemMainMenuSearchReplace: TMenuItem;
    MenuItemMainMenuSearchSearch: TMenuItem;
    MenuItemMainMenuSearchToggleBookmark: TMenuItem;
    MenuItemMainMenuSearchToggleBookmarks: TMenuItem;
    MenuItemMainMenuSearchToggleBookmarksBookmark1: TMenuItem;
    MenuItemMainMenuSearchToggleBookmarksBookmark2: TMenuItem;
    MenuItemMainMenuSearchToggleBookmarksBookmark3: TMenuItem;
    MenuItemMainMenuSearchToggleBookmarksBookmark4: TMenuItem;
    MenuItemMainMenuSearchToggleBookmarksBookmark5: TMenuItem;
    MenuItemMainMenuSearchToggleBookmarksBookmark6: TMenuItem;
    MenuItemMainMenuSearchToggleBookmarksBookmark7: TMenuItem;
    MenuItemMainMenuSearchToggleBookmarksBookmark8: TMenuItem;
    MenuItemMainMenuSearchToggleBookmarksBookmark9: TMenuItem;
    MenuItemMainMenuTools: TMenuItem;
    MenuItemMainMenuToolsCharacterMap: TMenuItem;
    MenuItemMainMenuToolsCompareFiles: TMenuItem;
    MenuItemMainMenuToolsConvert: TMenuItem;
    MenuItemMainMenuToolsDivider1: TMenuItem;
    MenuItemMainMenuToolsDivider2: TMenuItem;
    MenuItemMainMenuToolsLanguageEditor: TMenuItem;
    MenuItemMainMenuToolsOptions: TMenuItem;
    MenuItemMainMenuUnfold: TMenuItem;
    MenuItemMainMenuUnfoldAll: TMenuItem;
    MenuItemMainMenuUnfoldAllDownFromSelectedLine: TMenuItem;
    MenuItemMainMenuUnfoldAllUpFromSelectedLine: TMenuItem;
    MenuItemMainMenuUnfoldSelected: TMenuItem;
    MenuItemMainMenuView: TMenuItem;
    MenuItemMainMenuViewCloseDirectory: TMenuItem;
    MenuItemMainMenuViewDivider1: TMenuItem;
    MenuItemMainMenuViewDivider2: TMenuItem;
    MenuItemMainMenuViewDivider3: TMenuItem;
    MenuItemMainMenuViewDivider4: TMenuItem;
    MenuItemMainMenuViewEditDirectory: TMenuItem;
    MenuItemMainMenuViewFiles: TMenuItem;
    MenuItemMainMenuViewFold: TMenuItem;
    MenuItemMainMenuViewLineNumbers: TMenuItem;
    MenuItemMainMenuViewMinimap: TMenuItem;
    MenuItemMainMenuViewNextPage: TMenuItem;
    MenuItemMainMenuViewOpenDirectory: TMenuItem;
    MenuItemMainMenuViewPreviousPage: TMenuItem;
    MenuItemMainMenuViewSelectionMode: TMenuItem;
    MenuItemMainMenuViewSpecialChars: TMenuItem;
    MenuItemMainMenuViewSplit: TMenuItem;
    MenuItemMainMenuViewSyncedit: TMenuItem;
    MenuItemMainMenuViewWordWrap: TMenuItem;
    MenuItemMainMenuViewXMLTree: TMenuItem;
    MenuItemOpenDirectory: TMenuItem;
    MenuItemOutputClose: TMenuItem;
    MenuItemOutputCloseAll: TMenuItem;
    MenuItemOutputCloseAllOtherPages: TMenuItem;
    MenuItemOutputCopyAllToClipboard: TMenuItem;
    MenuItemOutputCopySelectedToClipboard: TMenuItem;
    MenuItemOutputDivider1: TMenuItem;
    MenuItemOutputDivider2: TMenuItem;
    MenuItemOutputDivider3: TMenuItem;
    MenuItemOutputOpenAll: TMenuItem;
    MenuItemOutputOpenSelected: TMenuItem;
    MenuItemOutputSelectAll: TMenuItem;
    MenuItemOutputUnselectAll: TMenuItem;
    MenuItemPaste: TMenuItem;
    MenuItemPopupMenuDocumentDivider1: TMenuItem;
    MenuItemPopupMenuDocumentDivider2: TMenuItem;
    MenuItemPopupMenuDocumentDivider3: TMenuItem;
    MenuItemPopupMenuDocumentDivider4: TMenuItem;
    MenuItemPopupMenuDocumentDivider5: TMenuItem;
    MenuItemPopupMenuDocumentMacroDivider: TMenuItem;
    MenuItemProperties: TMenuItem;
    MenuItemRedo: TMenuItem;
    MenuItemRefresh: TMenuItem;
    MenuItemRename: TMenuItem;
    MenuItemSearchGotoBookmark1: TMenuItem;
    MenuItemSearchGotoBookmark2: TMenuItem;
    MenuItemSearchGotoBookmark3: TMenuItem;
    MenuItemSearchGotoBookmark4: TMenuItem;
    MenuItemSearchGotoBookmark5: TMenuItem;
    MenuItemSearchGotoBookmark6: TMenuItem;
    MenuItemSearchGotoBookmark7: TMenuItem;
    MenuItemSearchGotoBookmark8: TMenuItem;
    MenuItemSearchGotoBookmark9: TMenuItem;
    MenuItemSearchToggleBookmark1: TMenuItem;
    MenuItemSearchToggleBookmark2: TMenuItem;
    MenuItemSearchToggleBookmark3: TMenuItem;
    MenuItemSearchToggleBookmark4: TMenuItem;
    MenuItemSearchToggleBookmark5: TMenuItem;
    MenuItemSearchToggleBookmark6: TMenuItem;
    MenuItemSearchToggleBookmark7: TMenuItem;
    MenuItemSearchToggleBookmark8: TMenuItem;
    MenuItemSearchToggleBookmark9: TMenuItem;
    MenuItemSelectAll: TMenuItem;
    MenuItemSeparator1: TMenuItem;
    MenuItemSeparator2: TMenuItem;
    MenuItemSeparator3: TMenuItem;
    MenuItemSeparator4: TMenuItem;
    MenuItemSeparator5: TMenuItem;
    MenuItemSeparator6: TMenuItem;
    MenuItemSeparator7: TMenuItem;
    MenuItemSort: TMenuItem;
    MenuItemSortAscending: TMenuItem;
    MenuItemSortDescending: TMenuItem;
    MenuItemToggleBookmark: TMenuItem;
    MenuItemToggleBookmark1: TMenuItem;
    MenuItemToggleBookmark2: TMenuItem;
    MenuItemToggleBookmark3: TMenuItem;
    MenuItemToggleBookmark4: TMenuItem;
    MenuItemToggleBookmark5: TMenuItem;
    MenuItemToggleBookmark6: TMenuItem;
    MenuItemToggleBookmark7: TMenuItem;
    MenuItemToggleBookmark8: TMenuItem;
    MenuItemToggleBookmark9: TMenuItem;
    MenuItemToggleBookmarks: TMenuItem;
    MenuItemToggleCase: TMenuItem;
    MenuItemToggleCaseAlternating: TMenuItem;
    MenuItemToggleCaseLower: TMenuItem;
    MenuItemToggleCaseSentence: TMenuItem;
    MenuItemToggleCaseTitle: TMenuItem;
    MenuItemToggleCaseUpper: TMenuItem;
    MenuItemToolbarMenuLanguage: TMenuItem;
    MenuItemToolbarMenuSkin: TMenuItem;
    MenuItemToolbarMenuView: TMenuItem;
    MenuItemToolbarMenuViewColor: TMenuItem;
    MenuItemToolbarMenuViewDirectory: TMenuItem;
    MenuItemToolbarMenuViewEncoding: TMenuItem;
    MenuItemToolbarMenuViewHighlighter: TMenuItem;
    MenuItemToolbarMenuViewMenuBar: TMenuItem;
    MenuItemToolbarMenuViewOutput: TMenuItem;
    MenuItemToolbarMenuViewStatusBar: TMenuItem;
    MenuItemToolbarMenuViewTitleBar: TMenuItem;
    MenuItemToolbarMenuViewTitleBarFileList: TMenuItem;
    MenuItemToolbarMenuViewTitleBarFilename: TMenuItem;
    MenuItemToolbarMenuViewToolbar: TMenuItem;
    MenuItemToolsSelectForCompare: TMenuItem;
    MenuItemUndo: TMenuItem;
    MenuItemUnfold: TMenuItem;
    MenuItemUnfoldAll: TMenuItem;
    MenuItemUnfoldAllDownFromSelectedLine: TMenuItem;
    MenuItemUnfoldAllUpFromSelectedLine: TMenuItem;
    MenuItemUnfoldSelected: TMenuItem;
    MenuItemViewFoldAll: TMenuItem;
    MenuItemViewFoldAllDownFromSelectedLine: TMenuItem;
    MenuItemViewFoldAllUpFromSelectedLine: TMenuItem;
    MenuItemViewFoldSelected: TMenuItem;
    MenuItemViewUnfoldAll: TMenuItem;
    MenuItemViewUnfoldAllDownFromSelectedLine: TMenuItem;
    MenuItemViewUnfoldAllUpFromSelectedLine: TMenuItem;
    MenuItemViewUnfoldSelected: TMenuItem;
    MenuItemXMLRefresh: TMenuItem;
    OpenDialog: TsOpenDialog;
    PageControlDirectory: TBCPageControl;
    PageControlDocument: TBCPageControl;
    PageControlOutput: TBCPageControl;
    PageControlToolbar: TBCPageControl;
    PanelDirectory: TBCPanel;
    PanelDocument: TBCPanel;
    PanelDocumentButtons: TBCPanel;
    PanelEditButtons: TBCPanel;
    PanelFileButtons: TBCPanel;
    PanelHelpButtons: TBCPanel;
    PanelMenuBar: TBCPanel;
    PanelMiddle: TBCPanel;
    PanelOutput: TBCPanel;
    PanelSearchButtons: TBCPanel;
    PanelToolbar: TBCPanel;
    PanelToolsButtons: TBCPanel;
    PanelViewButtons: TBCPanel;
    PopupMenuDocument: TPopupMenu;
    PopupMenuDocumentFormat: TPopupMenu;
    PopupMenuDocumentMacro: TPopupMenu;
    PopupMenuDummy: TPopupMenu;
    PopupMenuEditDelete: TPopupMenu;
    PopupMenuEditIndent: TPopupMenu;
    PopupMenuEditInsert: TPopupMenu;
    PopupMenuEditor: TPopupMenu;
    PopupMenuEditSort: TPopupMenu;
    PopupMenuFileReopen: TPopupMenu;
    PopupMenuFileTreeView: TPopupMenu;
    PopupMenuOutput: TPopupMenu;
    PopupMenuSearchGotoBookmarks: TPopupMenu;
    PopupMenuSearchToggleBookmarks: TPopupMenu;
    PopupMenuToggleCase: TPopupMenu;
    PopupMenuToolbar: TPopupMenu;
    PopupMenuViewFold: TPopupMenu;
    PopupMenuViewUnfold: TPopupMenu;
    PopupMenuXMLTree: TPopupMenu;
    PrintDialog: TPrintDialog;
    SaveDialog: TsSaveDialog;
    SpeedButtonClose: TBCSpeedButton;
    SpeedButtonCloseAll: TBCSpeedButton;
    SpeedButtonCloseAllOther: TBCSpeedButton;
    SpeedButtonDocumentDivider1: TBCSpeedButton;
    SpeedButtonDocumentDivider2: TBCSpeedButton;
    SpeedButtonDocumentFormat: TBCSpeedButton;
    SpeedButtonDocumentHTMLExport: TBCSpeedButton;
    SpeedButtonDocumentInfo: TBCSpeedButton;
    SpeedButtonDocumentMacro: TBCSpeedButton;
    SpeedButtonDocumentViewInBrowser: TBCSpeedButton;
    SpeedButtonEditCopy: TBCSpeedButton;
    SpeedButtonEditCut: TBCSpeedButton;
    SpeedButtonEditDelete: TBCSpeedButton;
    SpeedButtonEditDivider1: TBCSpeedButton;
    SpeedButtonEditDivider2: TBCSpeedButton;
    SpeedButtonEditDivider3: TBCSpeedButton;
    SpeedButtonEditDivider4: TBCSpeedButton;
    SpeedButtonEditIndent: TBCSpeedButton;
    SpeedButtonEditInsert: TBCSpeedButton;
    SpeedButtonEditPaste: TBCSpeedButton;
    SpeedButtonEditRedo: TBCSpeedButton;
    SpeedButtonEditSelectAll: TBCSpeedButton;
    SpeedButtonEditSort: TBCSpeedButton;
    SpeedButtonEditToggleCase: TBCSpeedButton;
    SpeedButtonEditUndo: TBCSpeedButton;
    SpeedButtonFileDivider1: TBCSpeedButton;
    SpeedButtonFileDivider2: TBCSpeedButton;
    SpeedButtonFileDivider3: TBCSpeedButton;
    SpeedButtonFileExit: TBCSpeedButton;
    SpeedButtonFileNew: TBCSpeedButton;
    SpeedButtonFileOpen: TBCSpeedButton;
    SpeedButtonFilePrint: TBCSpeedButton;
    SpeedButtonFilePrintPreview: TBCSpeedButton;
    SpeedButtonFileReopen: TBCSpeedButton;
    SpeedButtonFileSave: TBCSpeedButton;
    SpeedButtonFileSaveAll: TBCSpeedButton;
    SpeedButtonFileSaveAs: TBCSpeedButton;
    SpeedButtonHelpAboutEditBone: TBCSpeedButton;
    SpeedButtonHelpCheckForUpdates: TBCSpeedButton;
    SpeedButtonHelpDivider1: TBCSpeedButton;
    SpeedButtonHelpDivider2: TBCSpeedButton;
    SpeedButtonHelpVisitHomepage: TBCSpeedButton;
    SpeedButtonSearchClearBookmarks: TBCSpeedButton;
    SpeedButtonSearchDivider1: TBCSpeedButton;
    SpeedButtonSearchDivider2: TBCSpeedButton;
    SpeedButtonSearchFindInFiles: TBCSpeedButton;
    SpeedButtonSearchGoToBookmarks: TBCSpeedButton;
    SpeedButtonSearchGoToLine: TBCSpeedButton;
    SpeedButtonSearchReplace: TBCSpeedButton;
    SpeedButtonSearchSearch: TBCSpeedButton;
    SpeedButtonSearchToggleBookmark: TBCSpeedButton;
    SpeedButtonSearchToggleBookmarks: TBCSpeedButton;
    SpeedButtonToolbarDivider1: TBCSpeedButton;
    SpeedButtonToolbarDivider10: TBCSpeedButton;
    SpeedButtonToolbarDivider11: TBCSpeedButton;
    SpeedButtonToolbarDivider2: TBCSpeedButton;
    SpeedButtonToolbarDivider3: TBCSpeedButton;
    SpeedButtonToolbarDivider4: TBCSpeedButton;
    SpeedButtonToolbarDivider5: TBCSpeedButton;
    SpeedButtonToolbarDivider6: TBCSpeedButton;
    SpeedButtonToolbarDivider7: TBCSpeedButton;
    SpeedButtonToolbarDivider8: TBCSpeedButton;
    SpeedButtonToolbarDivider9: TBCSpeedButton;
    SpeedButtonToolbarDocumentInfo: TBCSpeedButton;
    SpeedButtonToolbarDocumentViewInBrowser: TBCSpeedButton;
    SpeedButtonToolbarEditIndentDecrease: TBCSpeedButton;
    SpeedButtonToolbarEditIndentIncrease: TBCSpeedButton;
    SpeedButtonToolbarEditRedo: TBCSpeedButton;
    SpeedButtonToolbarEditSortAsc: TBCSpeedButton;
    SpeedButtonToolbarEditSortDesc: TBCSpeedButton;
    SpeedButtonToolbarEditToggleCase: TBCSpeedButton;
    SpeedButtonToolbarEditUndo: TBCSpeedButton;
    SpeedButtonToolbarFileClose: TBCSpeedButton;
    SpeedButtonToolbarFileCloseAll: TBCSpeedButton;
    SpeedButtonToolbarFileNew: TBCSpeedButton;
    SpeedButtonToolbarFileOpen: TBCSpeedButton;
    SpeedButtonToolbarFilePrint: TBCSpeedButton;
    SpeedButtonToolbarFilePrintPreview: TBCSpeedButton;
    SpeedButtonToolbarFileSave: TBCSpeedButton;
    SpeedButtonToolbarFileSaveAll: TBCSpeedButton;
    SpeedButtonToolbarFileSaveAs: TBCSpeedButton;
    SpeedButtonToolbarSearchFindInFiles: TBCSpeedButton;
    SpeedButtonToolbarSearchReplace: TBCSpeedButton;
    SpeedButtonToolbarSearchSearch: TBCSpeedButton;
    SpeedButtonToolbarToolsCompareFiles: TBCSpeedButton;
    SpeedButtonToolbarViewCloseDirectory: TBCSpeedButton;
    SpeedButtonToolbarViewEditDirectory: TBCSpeedButton;
    SpeedButtonToolbarViewLineNumbers: TBCSpeedButton;
    SpeedButtonToolbarViewMinimap: TBCSpeedButton;
    SpeedButtonToolbarViewOpenDirectory: TBCSpeedButton;
    SpeedButtonToolbarViewSelectionMode: TBCSpeedButton;
    SpeedButtonToolbarViewSpecialChars: TBCSpeedButton;
    SpeedButtonToolbarViewSplit: TBCSpeedButton;
    SpeedButtonToolbarViewWordWrap: TBCSpeedButton;
    SpeedButtonToolsCharacterMap: TBCSpeedButton;
    SpeedButtonToolsCompareFiles: TBCSpeedButton;
    SpeedButtonToolsConvert: TBCSpeedButton;
    SpeedButtonToolsDivider1: TBCSpeedButton;
    SpeedButtonToolsDivider2: TBCSpeedButton;
    SpeedButtonToolsLanguageEditor: TBCSpeedButton;
    SpeedButtonToolsOptions: TBCSpeedButton;
    SpeedButtonViewCloseDirectory: TBCSpeedButton;
    SpeedButtonViewDivider1: TBCSpeedButton;
    SpeedButtonViewDivider2: TBCSpeedButton;
    SpeedButtonViewDivider3: TBCSpeedButton;
    SpeedButtonViewDivider4: TBCSpeedButton;
    SpeedButtonViewEditDirectory: TBCSpeedButton;
    SpeedButtonViewFiles: TBCSpeedButton;
    SpeedButtonViewFold: TBCSpeedButton;
    SpeedButtonViewLineNumbers: TBCSpeedButton;
    SpeedButtonViewMinimap: TBCSpeedButton;
    SpeedButtonViewNextPage: TBCSpeedButton;
    SpeedButtonViewOpenDirectory: TBCSpeedButton;
    SpeedButtonViewPreviousPage: TBCSpeedButton;
    SpeedButtonViewSelectionMode: TBCSpeedButton;
    SpeedButtonViewSpecialChars: TBCSpeedButton;
    SpeedButtonViewSplit: TBCSpeedButton;
    SpeedButtonViewSyncEdit: TBCSpeedButton;
    SpeedButtonViewUnfold: TBCSpeedButton;
    SpeedButtonViewWordWrap: TBCSpeedButton;
    SpeedButtonXMLTree: TBCSpeedButton;
    SplitterHorizontal: TBCSplitter;
    SplitterVertical: TBCSplitter;
    TabSheetButton: TsTabSheet;
    TabSheetDirectory: TsTabSheet;
    TabSheetDocument: TsTabSheet;
    TabSheetEdit: TsTabSheet;
    TabSheetFile: TsTabSheet;
    TabSheetFindInFiles: TsTabSheet;
    TabSheetHelp: TsTabSheet;
    TabSheetOpen: TsTabSheet;
    TabSheetSearch: TsTabSheet;
    TabSheetTools: TsTabSheet;
    TabSheetView: TsTabSheet;
    Timer: TTimer;
    ActionOpenFileList: TAction;
    ActionGotoNextBookmark: TAction;
    ActionGotoPreviousBookmark: TAction;
    MenuItemMainMenuSearchGotoBookmarksNext: TMenuItem;
    MenuItemMainMenuSearchGotoBookmarksPrevious: TMenuItem;
    MenuItemMainMenuSearchGotoBookmarksDivider: TMenuItem;
    MenuItemGotoBookmarkNext: TMenuItem;
    MenuItemGotoBookmarkPrevious: TMenuItem;
    MenuItemGotoBookmarkDivider: TMenuItem;
    BCSpeedButton1: TBCSpeedButton;
    ActionToolsClipboardHistory: TAction;
    ClipboardMonitor: TJvClipboardMonitor;
    ColorDialog: TsColorDialog;
    ActionEditInsertHexColor: TAction;
    MenuItemEditInsertColor: TMenuItem;
    MenuItemInsertColor: TMenuItem;
    MenuItemMainMenuEditInsertColor: TMenuItem;
    MenuItemSearchGotoNext: TMenuItem;
    MenuItemSearchGotoPrevious: TMenuItem;
    MenuItemSearchSeparator: TMenuItem;
    SkinSelector: TsSkinSelector;
    SpeedButtonMacroPlay: TBCSpeedButton;
    SpeedButtonMacroRecordPause: TBCSpeedButton;
    SpeedButtonMacroStop: TBCSpeedButton;
    S1: TMenuItem;
    ActionViewSkinSelector: TAction;
    ActionSearchFindAll: TAction;
    ActionEditSortRandom: TAction;
    Random1: TMenuItem;
    Random2: TMenuItem;
    Random3: TMenuItem;
    procedure ActionDirectoryContextMenuExecute(Sender: TObject);
    procedure ActionDirectoryDeleteExecute(Sender: TObject);
    procedure ActionDirectoryFindInFilesExecute(Sender: TObject);
    procedure ActionDirectoryPropertiesExecute(Sender: TObject);
    procedure ActionDirectoryRefreshExecute(Sender: TObject);
    procedure ActionDirectoryRenameExecute(Sender: TObject);
    procedure ActionDocumentFormatExecute(Sender: TObject);
    procedure ActionDocumentFormatJSONExecute(Sender: TObject);
    procedure ActionDocumentFormatJSONIndent2Execute(Sender: TObject);
    procedure ActionDocumentFormatJSONIndent3Execute(Sender: TObject);
    procedure ActionDocumentFormatJSONIndent4Execute(Sender: TObject);
    procedure ActionDocumentFormatJSONMinifyExecute(Sender: TObject);
    procedure ActionDocumentFormatSQLExecute(Sender: TObject);
    procedure ActionDocumentFormatXMLExecute(Sender: TObject);
    procedure ActionDocumentHTMLExportExecute(Sender: TObject);
    procedure ActionDocumentInfoExecute(Sender: TObject);
    procedure ActionDocumentViewInBrowserExecute(Sender: TObject);
    procedure ActionDummyExecute(Sender: TObject);
    procedure ActionEditCopyExecute(Sender: TObject);
    procedure ActionEditCutExecute(Sender: TObject);
    procedure ActionEditDeleteEndOfLineExecute(Sender: TObject);
    procedure ActionEditDeleteExecute(Sender: TObject);
    procedure ActionEditDeleteLineExecute(Sender: TObject);
    procedure ActionEditDeleteWhitespaceExecute(Sender: TObject);
    procedure ActionEditDeleteWordExecute(Sender: TObject);
    procedure ActionEditIndentDecreaseExecute(Sender: TObject);
    procedure ActionEditIndentExecute(Sender: TObject);
    procedure ActionEditIndentIncreaseExecute(Sender: TObject);
    procedure ActionEditInsertDateTimeExecute(Sender: TObject);
    procedure ActionEditInsertExecute(Sender: TObject);
    procedure ActionEditInsertLineExecute(Sender: TObject);
    procedure ActionEditInsertTagExecute(Sender: TObject);
    procedure ActionEditPasteExecute(Sender: TObject);
    procedure ActionEditRedoExecute(Sender: TObject);
    procedure ActionEditSelectAllExecute(Sender: TObject);
    procedure ActionEditSortAscExecute(Sender: TObject);
    procedure ActionEditSortDescExecute(Sender: TObject);
    procedure ActionEditSortExecute(Sender: TObject);
    procedure ActionEditToggleCaseAlternatingExecute(Sender: TObject);
    procedure ActionEditToggleCaseExecute(Sender: TObject);
    procedure ActionEditToggleCaseLowerExecute(Sender: TObject);
    procedure ActionEditToggleCaseSentenceExecute(Sender: TObject);
    procedure ActionEditToggleCaseTitleExecute(Sender: TObject);
    procedure ActionEditToggleCaseUpperExecute(Sender: TObject);
    procedure ActionEditUndoExecute(Sender: TObject);
    procedure ActionFileCloseAllExecute(Sender: TObject);
    procedure ActionFileCloseAllOtherExecute(Sender: TObject);
    procedure ActionFileCloseExecute(Sender: TObject);
    procedure ActionFileNewExecute(Sender: TObject);
    procedure ActionFileOpenExecute(Sender: TObject);
    procedure ActionFilePrintExecute(Sender: TObject);
    procedure ActionFilePrintPreviewExecute(Sender: TObject);
    procedure ActionFilePropertiesExecute(Sender: TObject);
    procedure ActionFileReopenPropertiesExecute(Sender: TObject);
    procedure ActionFileReopenExecute(Sender: TObject);
    procedure ActionFileSaveAllExecute(Sender: TObject);
    procedure ActionFileSaveAsExecute(Sender: TObject);
    procedure ActionFileSaveExecute(Sender: TObject);
    procedure ActionFileSelectFromDirectoryExecute(Sender: TObject);
    procedure ActionGotoBookmarksExecute(Sender: TObject);
    procedure ActionHelpAboutEditBoneExecute(Sender: TObject);
    procedure ActionHelpCheckForUpdatesExecute(Sender: TObject);
    procedure ActionHelpVisitHomepageExecute(Sender: TObject);
    procedure ActionMacroExecute(Sender: TObject);
    procedure ActionMacroOpenExecute(Sender: TObject);
    procedure ActionMacroPauseExecute(Sender: TObject);
    procedure ActionMacroPlaybackExecute(Sender: TObject);
    procedure ActionMacroRecordExecute(Sender: TObject);
    procedure ActionMacroSaveAsExecute(Sender: TObject);
    procedure ActionMacroStopExecute(Sender: TObject);
    procedure ActionMenuDocumentExecute(Sender: TObject);
    procedure ActionMenuEditExecute(Sender: TObject);
    procedure ActionMenuFileExecute(Sender: TObject);
    procedure ActionMenuHelpExecute(Sender: TObject);
    procedure ActionMenuSearchExecute(Sender: TObject);
    procedure ActionMenuToolsExecute(Sender: TObject);
    procedure ActionMenuViewExecute(Sender: TObject);
    procedure ActionOutputCloseAllExecute(Sender: TObject);
    procedure ActionOutputCloseAllOtherPagesExecute(Sender: TObject);
    procedure ActionOutputCloseExecute(Sender: TObject);
    procedure ActionOutputCopyAllToClipboardExecute(Sender: TObject);
    procedure ActionOutputCopySelectedToClipboardExecute(Sender: TObject);
    procedure ActionOutputOpenAllExecute(Sender: TObject);
    procedure ActionOutputOpenSelectedExecute(Sender: TObject);
    procedure ActionOutputSelectAllExecute(Sender: TObject);
    procedure ActionOutputUnselectAllExecute(Sender: TObject);
    procedure ActionSearchCaseSensitiveExecute(Sender: TObject);
    procedure ActionSearchClearBookmarksExecute(Sender: TObject);
    procedure ActionSearchCloseExecute(Sender: TObject);
    procedure ActionSearchEngineExecute(Sender: TObject);
    procedure ActionSearchFindInFilesExecute(Sender: TObject);
    procedure ActionSearchFindNextExecute(Sender: TObject);
    procedure ActionSearchFindPreviousExecute(Sender: TObject);
    procedure ActionSearchGoToBookmarksExecute(Sender: TObject);
    procedure ActionSearchGoToLineExecute(Sender: TObject);
    procedure ActionSearchInSelectionExecute(Sender: TObject);
    procedure ActionSearchOptionsExecute(Sender: TObject);
    procedure ActionSearchReplaceExecute(Sender: TObject);
    procedure ActionSearchSearchButtonExecute(Sender: TObject);
    procedure ActionSearchSearchExecute(Sender: TObject);
    procedure ActionSearchTextItemsExecute(Sender: TObject);
    procedure ActionSearchToggleBookmarkExecute(Sender: TObject);
    procedure ActionSearchToggleBookmarksExecute(Sender: TObject);
    procedure ActionSelectionBoxDownExecute(Sender: TObject);
    procedure ActionSelectionBoxLeftExecute(Sender: TObject);
    procedure ActionSelectionBoxRightExecute(Sender: TObject);
    procedure ActionSelectionBoxUpExecute(Sender: TObject);
    procedure ActionSelectReopenFileExecute(Sender: TObject);
    procedure ActionToggleBookmarksExecute(Sender: TObject);
    procedure ActionToolbarMenuSkinExecute(Sender: TObject);
    procedure ActionToolsCharacterMapExecute(Sender: TObject);
    procedure ActionToolsCompareFilesExecute(Sender: TObject);
    procedure ActionToolsConvertExecute(Sender: TObject);
    procedure ActionToolsLanguageEditorExecute(Sender: TObject);
    procedure ActionToolsOptionsExecute(Sender: TObject);
    procedure ActionToolsSelectForCompareExecute(Sender: TObject);
    procedure ActionViewCloseDirectoryExecute(Sender: TObject);
    procedure ActionViewColorSelectionExecute(Sender: TObject);
    procedure ActionViewDirectoryExecute(Sender: TObject);
    procedure ActionViewEditDirectoryExecute(Sender: TObject);
    procedure ActionViewEncodingSelectionExecute(Sender: TObject);
    procedure ActionViewFilesExecute(Sender: TObject);
    procedure ActionViewFoldAllDownFromActiveLineExecute(Sender: TObject);
    procedure ActionViewFoldAllExecute(Sender: TObject);
    procedure ActionViewFoldAllUpFromActiveLineExecute(Sender: TObject);
    procedure ActionViewFoldExecute(Sender: TObject);
    procedure ActionViewFoldSelectedExecute(Sender: TObject);
    procedure ActionViewHighlighterSelectionExecute(Sender: TObject);
    procedure ActionViewLineNumbersExecute(Sender: TObject);
    procedure ActionViewMainMenuExecute(Sender: TObject);
    procedure ActionViewMenuBarExecute(Sender: TObject);
    procedure ActionViewMinimapExecute(Sender: TObject);
    procedure ActionViewNextPageExecute(Sender: TObject);
    procedure ActionViewOpenDirectoryExecute(Sender: TObject);
    procedure ActionViewOutputExecute(Sender: TObject);
    procedure ActionViewPreviousPageExecute(Sender: TObject);
    procedure ActionViewSelectionModeExecute(Sender: TObject);
    procedure ActionViewSpecialCharsExecute(Sender: TObject);
    procedure ActionViewSplitExecute(Sender: TObject);
    procedure ActionViewStatusBarExecute(Sender: TObject);
    procedure ActionViewSyncEditExecute(Sender: TObject);
    procedure ActionViewTitleBarFileListExecute(Sender: TObject);
    procedure ActionViewTitleBarFilenameExecute(Sender: TObject);
    procedure ActionViewToolbarExecute(Sender: TObject);
    procedure ActionViewUnfoldAllDownFromActiveLineExecute(Sender: TObject);
    procedure ActionViewUnfoldAllExecute(Sender: TObject);
    procedure ActionViewUnfoldAllUpFromActiveLineExecute(Sender: TObject);
    procedure ActionViewUnfoldExecute(Sender: TObject);
    procedure ActionViewUnfoldSelectedExecute(Sender: TObject);
    procedure ActionViewWordWrapExecute(Sender: TObject);
    procedure ActionViewXMLTreeExecute(Sender: TObject);
    procedure ActionXMLTreeRefreshExecute(Sender: TObject);
    procedure ApplicationEventsActivate(Sender: TObject);
    procedure ApplicationEventsHint(Sender: TObject);
    procedure ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
    procedure ChangeSkin(Sender: TObject);
    procedure DragDropDrop(Sender: TObject; Pos: TPoint; Value: TStrings);
    procedure EditorPrintPrintLine(Sender: TObject; LineNumber, PageNumber: Integer);
    procedure EditorPrintPrintStatus(Sender: TObject; Status: TBCEditorPrintStatus; PageNumber: Integer; var Abort: Boolean);
    procedure FileTreeViewClickActionExecute(Sender: TObject);
    procedure FileTreeViewDblClickActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure LanguageMenuClick(Sender: TObject);
    procedure OnAddTreeViewLine(Sender: TObject; const AFilename: string; const ALine, ACharacter: LongInt;
      const AText: string; const ASearchString: string; const ALength: Integer);
    procedure OnProgressBarStepFindInFiles(Sender: TObject);
    procedure OnTerminateFindInFiles(Sender: TObject);
    procedure OutputDblClickActionExecute(Sender: TObject);
    procedure PageControlDirectoryCloseBtnClick(Sender: TComponent; TabIndex: Integer; var CanClose: Boolean; var Action: TacCloseAction);
    procedure PageControlDirectoryDblClick(Sender: TObject);
    procedure PageControlDirectoryMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PageControlDocumentChange(Sender: TObject);
    procedure PageControlDocumentCloseBtnClick(Sender: TComponent; TabIndex: Integer; var CanClose: Boolean; var Action: TacCloseAction);
    procedure PageControlDocumentDblClick(Sender: TObject);
    procedure PageControlDocumentMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PageControlOutputCloseBtnClick(Sender: TComponent; TabIndex: Integer; var CanClose: Boolean; var Action: TacCloseAction);
    procedure PageControlOutputDblClick(Sender: TObject);
    procedure PageControlOutputMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PopupMenuFileTreeViewPopup(Sender: TObject);
    procedure SelectedEncodingClick(const AIndex: Integer);
    procedure SelectedFileClick(APageIndex: Integer);
    procedure SelectedHighlighterClick(AHighlighterName: string);
    procedure SelectedHighlighterColorClick(AHighlighterColorName: string);
    procedure SelectedScaleModeClick(const AIndex: Integer);
    procedure SelectedSearchEngineClick(const ASearchEngine: TBCEditorSearchEngine);
    procedure StatusBarDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
    procedure TabSheetFindInFilesClickBtn(Sender: TObject);
    procedure TabSheetOpenClickBtn(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure TitleBarItems2Click(Sender: TObject);
    procedure TitleBarItems4Click(Sender: TObject);
    procedure TitleBarItems6Click(Sender: TObject);
    procedure TitleBarItems8Click(Sender: TObject);
    procedure ActionOpenFileListExecute(Sender: TObject);
    procedure ActionGotoNextBookmarkExecute(Sender: TObject);
    procedure ActionGotoPreviousBookmarkExecute(Sender: TObject);
    procedure ActionToolsClipboardHistoryExecute(Sender: TObject);
    procedure ClipboardMonitorChange(Sender: TObject);
    procedure ActionEditInsertHexColorExecute(Sender: TObject);
    procedure ActionViewSkinSelectorExecute(Sender: TObject);
    procedure ActionSearchFindAllExecute(Sender: TObject);
    procedure ActionEditSortRandomExecute(Sender: TObject);
  private
    FClipboardHistoryItems: TList<string>;
    FClipboardHistoryDialog: TClipboardHistoryDialog;
    FDirectory: TEBDirectory;
    FDocument: TEBDocument;
    FFindInFilesThread: TFindInFilesThread;
    FImageListCount: Integer;
    FNoIni: Boolean;
    FOutput: TEBOutput;
    FOutputTreeView: TVirtualDrawTree;
    FPopupEncodingDialog: TPopupEncodingDialog;
    FPopupFilesDialog: TPopupFilesDialog;
    FPopupHighlighterColorDialog: TPopupHighlighterColorDialog;
    FPopupHighlighterDialog: TPopupHighlighterDialog;
    FPopupSearchEngineDialog: TBCPopupSearchEngineDialog;
    FProcessingEventHandler: Boolean;
    FSQLFormatterDLLFound: Boolean;
    FStopWatch: TStopWatch;
    function GetActionList: TObjectList<TAction>;
    function GetTitleBarItemLeftBottom(AIndex: Integer): TPoint;
    function OnCancelSearch: Boolean;
    function Processing: Boolean;
    function ReadApplicationParamFiles: Boolean;
    procedure CopyIniFilesIntoUserProfile;
    procedure CreateLanguageMenu(AMenuItem: TMenuItem);
    procedure CreateObjects;
    procedure CreateToolbar(ACreate: Boolean = False);
    procedure DropdownMenuPopup(ASpeedButton: TBCSpeedButton);
    procedure MoveSelection(AEditor: TBCEditor; const AVirtualKey: Byte);
    procedure ReadApplicationParams;
    procedure ReadIniOptions;
    procedure ReadIniSizePositionAndState;
    procedure ReadLanguageFile(const ALanguage: string);
    procedure SearchFindInFiles(const AFolder: string = '');
    procedure SetFields;
    procedure SetImages;
    procedure SetOptions;
    procedure UpdateMenuBarLanguage;
    procedure UpdatePageControlMargins;
    procedure WriteIniFile;
    procedure WMCopyData(var Message: TWMCopyData); message WM_COPYDATA;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    procedure CreateFileReopenList;
    procedure SetBookmarks;
    procedure SetTitleBarMenuCaptions;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  Winapi.CommCtrl, Winapi.ShellAPI, System.Math, System.IOUtils, EditBone.Consts, BCCommon.FileUtils,
  BCCommon.Language.Utils, BCCommon.Language.Strings, BCEditor.Editor.Marks, Vcl.Clipbrd, System.Types,
  BCCommon.Options.Container, BCCommon.Options.Container.SQL.Formatter, BCCommon.Consts,
  BCCommon.Utils, BCControl.Utils, BCCommon.Dialog.FindInFiles, BCCommon.Dialog.ItemList, BCCommon.Encoding,
  BCEditor.Encoding, EditBone.Form.UnicodeCharacterMap, EditBone.Dialog.About, BCCommon.Dialog.DownloadURL,
  BCCommon.Form.Convert, EditBone.Form.LanguageEditor, BCCommon.Messages, BCCommon.Form.SearchForFiles,
  BCCommon.StringUtils, BCCommon.Dialog.SkinSelect, sGraphUtils, sConst, BCCommon.Form.Print.Preview,
  EditBone.DataModule.Images, System.IniFiles, EditBone.Types;

procedure TMainForm.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.WinClassName := SWindowClassName;
end;

procedure TMainForm.PageControlDirectoryCloseBtnClick(Sender: TComponent; TabIndex: Integer; var CanClose: Boolean;
  var Action: TacCloseAction);
begin
  inherited;
  if FDirectory.CloseDirectory(False, TabIndex) then
    Action := acaFree
  else
    CanClose := False;
end;

procedure TMainForm.PageControlDirectoryDblClick(Sender: TObject);
begin
  inherited;
  if OptionsContainer.DirCloseTabByDblClick then
    ActionViewCloseDirectory.Execute;
end;

procedure TMainForm.PageControlDocumentChange(Sender: TObject);
var
  LEditor: TBCEditor;
begin
  if Processing then
    Exit;
  SetBookmarks;
  SetTitleBarMenuCaptions;
  LEditor := FDocument.GetActiveEditor;
  if Assigned(LEditor) then
    if LEditor.CanFocus then
      LEditor.SetFocus;
end;

procedure TMainForm.PageControlDocumentCloseBtnClick(Sender: TComponent; TabIndex: Integer; var CanClose: Boolean;
  var Action: TacCloseAction);
begin
  inherited;
  if FDocument.Close(False, TabIndex) <> mrCancel then
    Action := acaFree
  else
    CanClose := False;
end;

procedure TMainForm.PageControlDocumentDblClick(Sender: TObject);
begin
  inherited;
  if OptionsContainer.DocCloseTabByDblClick then
    FDocument.Close;
end;

procedure TMainForm.PageControlDocumentMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (Button = mbMiddle) and OptionsContainer.DocCloseTabByMiddleClick then
  begin
    PageControlDocument.ActivePageIndex := PageControlDocument.GetTabUnderMouse(Point(X, Y));
    FDocument.Close;
  end;
end;

procedure TMainForm.PageControlOutputCloseBtnClick(Sender: TComponent; TabIndex: Integer; var CanClose: Boolean;
  var Action: TacCloseAction);
begin
  if FOutput.CloseTabSheet(False, TabIndex) then
  begin
    Application.ProcessMessages;
    Action := acaFree
  end
  else
    CanClose := False;
end;

procedure TMainForm.PageControlOutputDblClick(Sender: TObject);
begin
  if OptionsContainer.OutputCloseTabByDblClick then
    ActionOutputClose.Execute;
end;

procedure TMainForm.PageControlOutputMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  if (Button = mbMiddle) and OptionsContainer.OutputCloseTabByMiddleClick then
  begin
    PageControlOutput.ActivePageIndex := PageControlOutput.GetTabUnderMouse(Point(X, Y));
    ActionOutputClose.Execute;
  end;
end;

procedure TMainForm.PageControlDirectoryMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (Button = mbMiddle) and OptionsContainer.DirCloseTabByMiddleClick then
  begin
    PageControlDirectory.ActivePageIndex := PageControlDirectory.GetTabUnderMouse(Point(X, Y));
    ActionViewCloseDirectory.Execute;
  end;
end;

procedure TMainForm.PopupMenuFileTreeViewPopup(Sender: TObject);
begin
  inherited;
  ActionDirectoryProperties.Enabled := FileExists(FDirectory.SelectedFile);
end;

procedure TMainForm.SelectedFileClick(APageIndex: Integer);
begin
  PageControlDocument.ActivePageIndex := APageIndex;
end;

procedure TMainForm.SelectedEncodingClick(const AIndex: Integer);
begin
  SetEncoding(FDocument.GetActiveEditor, AIndex);
  SetTitleBarMenuCaptions;
end;

procedure TMainForm.SelectedScaleModeClick(const AIndex: Integer);
begin
  SkinManager.BeginUpdate;
  SkinManager.Options.ScaleMode := TacScaleMode(AIndex);
  SkinManager.EndUpdate(True, False);
  SetTitleBarMenuCaptions;
end;

procedure TMainForm.SelectedHighlighterClick(AHighlighterName: string);
begin
  FDocument.SetHighlighter(FDocument.GetActiveEditor, AHighlighterName);
  SetTitleBarMenuCaptions;
end;

procedure TMainForm.SelectedHighlighterColorClick(AHighlighterColorName: string);
begin
  FDocument.SetHighlighterColor(FDocument.GetActiveEditor, AHighlighterColorName);
  SetTitleBarMenuCaptions;
end;

function TMainForm.Processing: Boolean;
begin
  Result := True;
  if FProcessingEventHandler then
    Exit;
  if not Assigned(FDocument) then
    Exit;
  if FDocument.Processing then
    Exit;
  Result := False;
end;

procedure TMainForm.ActionDocumentViewInBrowserExecute(Sender: TObject);
begin
  BrowseURL(FormatFileName(FDocument.ActiveDocumentName), OptionsContainer.DefaultBrowser);
end;

procedure TMainForm.ActionFileReopenPropertiesExecute(Sender: TObject);
var
  LIndex: Integer;
  LFiles: TStringList;
begin
  with TItemListDialog.Create(Self) do
  try
    Caption := LanguageDataModule.GetConstant('ReopenItems');
    LFiles := TStringList.Create;
    with TIniFile.Create(GetIniFilename) do
    try
      ReadSectionValues('FileReopenFiles', LFiles);
      for LIndex := 0 to LFiles.Count - 1 do
        LFiles.Strings[LIndex] := LFiles.ValueFromIndex[LIndex];
      ListBox.Items.Assign(LFiles);
      if ShowModal = mrOk then
      begin
        EraseSection('FileReopenFiles');
        LFiles.Assign(ListBox.Items);
        for LIndex := 0 to LFiles.Count - 1 do
          WriteString('FileReopenFiles', IntToStr(LIndex), LFiles.Strings[LIndex]);
      end;
    finally
      LFiles.Free;
      Free;
    end;
  finally
    Free;
  end;
  CreateFileReopenList;
end;

procedure TMainForm.ActionFileReopenExecute(Sender: TObject);
begin
  DropdownMenuPopup(SpeedButtonFileReopen);
end;

function IsDown(const AVirtualKey: ShortInt): Boolean;
var
  LKeyboardState: TKeyboardState;
begin
  GetKeyboardState(LKeyboardState);
  Result := (LKeyboardState[AVirtualKey] and 128) <> 0;
end;

procedure TMainForm.DropdownMenuPopup(ASpeedButton: TBCSpeedButton);
var
  LPoint: TPoint;
begin
  if not IsDown(VK_CONTROL) and not IsDown(VK_SHIFT) and not IsDown(VK_F2) then
  begin
    LPoint := ASpeedButton.ClientToScreen(Point(0, ASpeedButton.Height));
    ASpeedButton.DropdownMenu.Popup(LPoint.X, LPoint.Y);
  end;
end;

procedure TMainForm.ActionOutputCloseAllOtherPagesExecute(Sender: TObject);
begin
  inherited;
  FOutput.CloseAllOtherTabSheets;
end;

procedure TMainForm.ActionOutputCopyAllToClipboardExecute(Sender: TObject);
begin
  inherited;
  FOutput.CopyToClipboard;
end;

procedure TMainForm.ActionOutputCopySelectedToClipboardExecute(Sender: TObject);
begin
  inherited;
  FOutput.CopyToClipboard(True);
end;

procedure TMainForm.ActionDirectoryContextMenuExecute(Sender: TObject);
var
  LFileName: string;
begin
  LFileName := FDirectory.SelectedFile;
  if LFileName = '' then
    LFileName :=  FDirectory.SelectedPath;
  DisplayContextMenu(Handle, LFileName, ScreenToClient(Mouse.CursorPos));
end;

procedure TMainForm.ActionDirectoryDeleteExecute(Sender: TObject);
begin
  inherited;
  FDirectory.DeleteSelected;
end;

procedure TMainForm.ActionDirectoryFindInFilesExecute(Sender: TObject);
begin
  inherited;
  SearchFindInFiles(FDirectory.SelectedPath);
end;

procedure TMainForm.ActionDirectoryPropertiesExecute(Sender: TObject);
begin
  inherited;
  FDirectory.FileProperties;
end;

procedure TMainForm.ActionDirectoryRefreshExecute(Sender: TObject);
begin
  inherited;
  FDirectory.Refresh;
end;

procedure TMainForm.ActionDirectoryRenameExecute(Sender: TObject);
begin
  inherited;
  FDirectory.Rename;
end;

procedure TMainForm.ActionDocumentFormatExecute(Sender: TObject);
begin
  inherited;
  DropdownMenuPopup(SpeedButtonDocumentFormat);
end;

procedure TMainForm.ActionDocumentFormatJSONExecute(Sender: TObject);
begin
  inherited;
  { Dummy action }
end;

procedure TMainForm.ActionDocumentFormatJSONIndent2Execute(Sender: TObject);
begin
  inherited;
  FDocument.FormatDocument(ftJSON, 2);
end;

procedure TMainForm.ActionDocumentFormatJSONIndent3Execute(Sender: TObject);
begin
  inherited;
  FDocument.FormatDocument(ftJSON, 3);
end;

procedure TMainForm.ActionDocumentFormatJSONIndent4Execute(Sender: TObject);
begin
  inherited;
  FDocument.FormatDocument(ftJSON, 4);
end;

procedure TMainForm.ActionDocumentFormatJSONMinifyExecute(Sender: TObject);
begin
  inherited;
  FDocument.FormatDocument(ftJSON);
end;

procedure TMainForm.ActionDocumentFormatSQLExecute(Sender: TObject);
begin
  FDocument.FormatDocument(ftSQL);
end;

procedure TMainForm.ActionDocumentFormatXMLExecute(Sender: TObject);
begin
  FDocument.FormatDocument(ftXML);
end;

procedure TMainForm.ActionDocumentHTMLExportExecute(Sender: TObject);
begin
  inherited;
  FDocument.HTMLExport;
end;

procedure TMainForm.ActionDocumentInfoExecute(Sender: TObject);
begin
  FDocument.ShowInfo;
end;

procedure TMainForm.ActionEditCopyExecute(Sender: TObject);
begin
  if FDirectory.Focused then
    FDirectory.Copy
  else
    FDocument.Copy;
end;

procedure TMainForm.ActionEditCutExecute(Sender: TObject);
begin
  if FDirectory.Focused then
    FDirectory.Cut
  else
    FDocument.Cut;
end;

procedure TMainForm.ActionEditDeleteEndOfLineExecute(Sender: TObject);
begin
  FDocument.DeleteEndOfLine;
end;

procedure TMainForm.ActionEditDeleteExecute(Sender: TObject);
begin
  inherited;
  DropdownMenuPopup(SpeedButtonEditDelete);
end;

procedure TMainForm.ActionEditDeleteLineExecute(Sender: TObject);
begin
  FDocument.DeleteLine;
end;

procedure TMainForm.ActionEditDeleteWhitespaceExecute(Sender: TObject);
begin
  FDocument.DeleteWhiteSpace;
end;

procedure TMainForm.ActionEditDeleteWordExecute(Sender: TObject);
begin
  FDocument.DeleteWord;
end;

procedure TMainForm.ActionEditIndentDecreaseExecute(Sender: TObject);
begin
  FDocument.DecreaseIndent;
end;

procedure TMainForm.ActionEditIndentExecute(Sender: TObject);
begin
  inherited;
  DropdownMenuPopup(SpeedButtonEditIndent);
end;

procedure TMainForm.ActionEditIndentIncreaseExecute(Sender: TObject);
begin
  FDocument.IncreaseIndent;
end;

procedure TMainForm.ActionEditInsertHexColorExecute(Sender: TObject);
begin
  inherited;
  FDocument.InsertHexColor;
end;

procedure TMainForm.ActionEditInsertDateTimeExecute(Sender: TObject);
begin
  FDocument.InsertDateAndTime;
end;

procedure TMainForm.ActionEditInsertExecute(Sender: TObject);
begin
  inherited;
  DropdownMenuPopup(SpeedButtonEditInsert);
end;

procedure TMainForm.ActionEditInsertLineExecute(Sender: TObject);
begin
  FDocument.InsertLine;
end;

procedure TMainForm.ActionEditInsertTagExecute(Sender: TObject);
begin
  FDocument.InsertTag;
end;

procedure TMainForm.ActionEditPasteExecute(Sender: TObject);
begin
  if FDirectory.Focused then
    FDirectory.Paste
  else
    FDocument.Paste;
end;

procedure TMainForm.ActionEditRedoExecute(Sender: TObject);
begin
  FDocument.Redo;
end;

procedure TMainForm.ActionEditSelectAllExecute(Sender: TObject);
begin
  FDocument.SelectAll;
end;

procedure TMainForm.ActionEditSortAscExecute(Sender: TObject);
begin
  FDocument.Sort(soAsc);
end;

procedure TMainForm.ActionEditSortDescExecute(Sender: TObject);
begin
  FDocument.Sort(soDesc);
end;

procedure TMainForm.ActionEditSortExecute(Sender: TObject);
begin
  inherited;
  DropdownMenuPopup(SpeedButtonEditSort);
end;

procedure TMainForm.ActionEditSortRandomExecute(Sender: TObject);
begin
  inherited;
  FDocument.Sort(soRandom);
end;

procedure TMainForm.ActionEditToggleCaseExecute(Sender: TObject);
begin
  FDocument.ToggleCase;
end;

procedure TMainForm.ActionEditUndoExecute(Sender: TObject);
begin
  FDocument.Undo;
end;

procedure TMainForm.ActionFileCloseAllExecute(Sender: TObject);
begin
  FDocument.CloseAll;
end;

procedure TMainForm.ActionFileCloseAllOtherExecute(Sender: TObject);
begin
  FDocument.CloseAllOtherPages;
end;

procedure TMainForm.ActionFileCloseExecute(Sender: TObject);
begin
  FDocument.Close;
end;

procedure TMainForm.ActionMacroExecute(Sender: TObject);
begin
  inherited;
  DropdownMenuPopup(SpeedButtonDocumentMacro);
end;

procedure TMainForm.ActionMacroOpenExecute(Sender: TObject);
begin
  FDocument.LoadMacro;
end;

procedure TMainForm.ActionMacroPauseExecute(Sender: TObject);
begin
  inherited;
  FDocument.RecordMacro;
  SpeedButtonMacroRecordPause.Images := nil;
  SpeedButtonMacroRecordPause.Action := ActionMacroRecord;
  SpeedButtonMacroRecordPause.Images := ImagesDataModule.ImageListSmall;
  MenuItemMacroRecordPause.Action := ActionMacroRecord;
  MenuItemMainMenuDocumentMacroRecordPause.Action := ActionMacroRecord;
end;

procedure TMainForm.ActionMacroPlaybackExecute(Sender: TObject);
begin
  FDocument.PlaybackMacro;
end;

procedure TMainForm.ActionMacroRecordExecute(Sender: TObject);
begin
  FDocument.RecordMacro;
  SpeedButtonMacroRecordPause.Images := nil;
  SpeedButtonMacroRecordPause.Action := ActionMacroPause;
  SpeedButtonMacroRecordPause.Images := ImagesDataModule.ImageListSmall;
  MenuItemMacroRecordPause.Action := ActionMacroPause;
  MenuItemMainMenuDocumentMacroRecordPause.Action := ActionMacroPause;
end;

procedure TMainForm.ActionMacroSaveAsExecute(Sender: TObject);
begin
  FDocument.SaveMacro;
end;

procedure TMainForm.ActionMacroStopExecute(Sender: TObject);
begin
  FDocument.StopMacro;
  SpeedButtonMacroRecordPause.Images := nil;
  SpeedButtonMacroRecordPause.Action := ActionMacroRecord;
  SpeedButtonMacroRecordPause.Images := ImagesDataModule.ImageListSmall;
  MenuItemMacroRecordPause.Action := ActionMacroRecord;
  MenuItemMainMenuDocumentMacroRecordPause.Action := ActionMacroRecord;
end;

procedure TMainForm.ActionMenuDocumentExecute(Sender: TObject);
begin
  inherited;
  PageControlToolbar.ActivePage := TabSheetDocument;
end;

procedure TMainForm.ActionMenuEditExecute(Sender: TObject);
begin
  inherited;
  PageControlToolbar.ActivePage := TabSheetEdit;
end;

procedure TMainForm.ActionMenuFileExecute(Sender: TObject);
begin
  inherited;
  PageControlToolbar.ActivePage := TabSheetFile;
end;

procedure TMainForm.ActionMenuHelpExecute(Sender: TObject);
begin
  inherited;
  PageControlToolbar.ActivePage := TabSheetHelp;
end;

procedure TMainForm.ActionMenuSearchExecute(Sender: TObject);
begin
  inherited;
  PageControlToolbar.ActivePage := TabSheetSearch;
end;

procedure TMainForm.ActionMenuToolsExecute(Sender: TObject);
begin
  inherited;
  PageControlToolbar.ActivePage := TabSheetTools;
end;

procedure TMainForm.ActionMenuViewExecute(Sender: TObject);
begin
  inherited;
  PageControlToolbar.ActivePage := TabSheetView;
end;

procedure TMainForm.ActionOutputOpenAllExecute(Sender: TObject);
begin
  inherited;
  FOutput.OpenFiles;
end;

procedure TMainForm.ActionOutputOpenSelectedExecute(Sender: TObject);
begin
  inherited;
  FOutput.OpenFiles(True);
end;

procedure TMainForm.ActionOpenFileListExecute(Sender: TObject);
begin
  inherited;
  TitleBarItems2Click(Sender);
end;

procedure TMainForm.ActionOutputCloseAllExecute(Sender: TObject);
begin
  inherited;
  FOutput.CloseAllTabSheets;
end;

procedure TMainForm.ActionOutputCloseExecute(Sender: TObject);
begin
  inherited;
  FOutput.CloseTabSheet;
end;

procedure TMainForm.ActionFileNewExecute(Sender: TObject);
begin
  FDocument.New;
end;

procedure TMainForm.ActionFileOpenExecute(Sender: TObject);
begin
  FDocument.Open;
end;

procedure TMainForm.ActionFilePrintExecute(Sender: TObject);
begin
  if PrintDialog.Execute(Handle) then
  begin
    FDocument.InitializeEditorPrint(EditorPrint);
    EditorPrint.Copies := PrintDialog.Copies;
    EditorPrint.SelectedOnly := PrintDialog.PrintRange = prSelection;
    ProgressBar.Show(EditorPrint.Editor.Lines.Count);
    if PrintDialog.PrintRange = prPageNums then
      EditorPrint.Print(PrintDialog.FromPage, PrintDialog.ToPage)
    else
      EditorPrint.Print;
    ProgressBar.Hide;
  end;
end;

procedure TMainForm.ActionFilePrintPreviewExecute(Sender: TObject);
begin
  FDocument.PrintPreview;
end;

procedure TMainForm.ActionFilePropertiesExecute(Sender: TObject);
begin
  FDocument.FileProperties;
end;

procedure TMainForm.ActionFileSaveAllExecute(Sender: TObject);
begin
  FDocument.SaveAll;
end;

procedure TMainForm.ActionFileSaveAsExecute(Sender: TObject);
begin
  FDocument.SaveAs;
end;

procedure TMainForm.ActionFileSaveExecute(Sender: TObject);
begin
  FDocument.Save;
end;

procedure TMainForm.ActionFileSelectFromDirectoryExecute(Sender: TObject);
var
  LActiveDocumentName: string;
begin
  if FDocument.ActiveDocumentName <> '' then
    if Assigned(FDirectory) then
      if FDirectory.IsAnyDirectory then
      begin
        LActiveDocumentName := FDocument.ActiveDocumentName;
        FDirectory.OpenPath(ExtractFileDrive(LActiveDocumentName), FormatFileName(LActiveDocumentName),
          FDirectory.ExcludeOtherBranches);
      end
end;

procedure TMainForm.ActionHelpAboutEditBoneExecute(Sender: TObject);
begin
  TAboutDialog.ClassShowModal(Self);
end;

procedure TMainForm.ActionHelpCheckForUpdatesExecute(Sender: TObject);
begin
  CheckForUpdates(Application.Title, GetFileVersion(Application.ExeName));
end;

procedure TMainForm.ActionHelpVisitHomepageExecute(Sender: TObject);
begin
  BrowseURL(BONECODE_URL);
end;

procedure TMainForm.ActionSearchCaseSensitiveExecute(Sender: TObject);

  procedure SetCaseSensitiveOption(AEditor: TBCEditor);
  begin
    if Assigned(AEditor) then
      AEditor.Search.SetOption(soCaseSensitive, ActionSearchCaseSensitive.Checked);
  end;

begin
  inherited;

  ActionSearchCaseSensitive.Checked := not ActionSearchCaseSensitive.Checked;
  SetCaseSensitiveOption(FDocument.GetActiveEditor);
  SetCaseSensitiveOption(FDocument.GetActiveSplitEditor);
end;

procedure TMainForm.ActionSearchClearBookmarksExecute(Sender: TObject);
begin
  FDocument.ClearBookmarks;
end;

procedure TMainForm.ActionSearchCloseExecute(Sender: TObject);
begin
  FDocument.SearchClose;
end;

procedure TMainForm.ActionSearchEngineExecute(Sender: TObject);
var
  LEditor: TBCEditor;
begin
  inherited;
  LEditor := FDocument.GetActiveEditor;
  if Assigned(LEditor) then
  begin
    if not Assigned(FPopupSearchEngineDialog) then
    begin
      FPopupSearchEngineDialog := TBCPopupSearchEngineDialog.Create(Self);
      FPopupSearchEngineDialog.PopupParent := Self;
      FPopupSearchEngineDialog.OnSelectSearchEngine := SelectedSearchEngineClick;
    end;
    SkinProvider.SkinData.BeginUpdate;
    FPopupSearchEngineDialog.Execute(LEditor.Search.Engine);
    SkinProvider.SkinData.EndUpdate;
  end;
end;

procedure TMainForm.SelectedSearchEngineClick(const ASearchEngine: TBCEditorSearchEngine);

  procedure SetSearchEngine(AEditor: TBCEditor);
  begin
    if Assigned(AEditor) then
      AEditor.Search.Engine := ASearchEngine;
  end;

begin
  SetSearchEngine(FDocument.GetActiveEditor);
  SetSearchEngine(FDocument.GetActiveSplitEditor);
end;

procedure TMainForm.ActionSearchFindAllExecute(Sender: TObject);
begin
  inherited;
  FDocument.FindAll;
end;

procedure TMainForm.ActionSearchFindInFilesExecute(Sender: TObject);
begin
  inherited;
  SearchFindInFiles;
end;

procedure TMainForm.ActionSearchFindNextExecute(Sender: TObject);
begin
  FDocument.FindNext;
end;

procedure TMainForm.ActionSearchFindPreviousExecute(Sender: TObject);
begin
  FDocument.FindPrevious;
end;

procedure TMainForm.ActionSearchGoToBookmarksExecute(Sender: TObject);
begin
  inherited;
  DropdownMenuPopup(SpeedButtonSearchGotoBookmarks);
end;

procedure TMainForm.ActionSearchGoToLineExecute(Sender: TObject);
begin
  FDocument.GotoLine;
end;

procedure TMainForm.ActionGotoNextBookmarkExecute(Sender: TObject);
var
  LEditor: TBCEditor;
begin
  LEditor := FDocument.GetActiveEditor;
  if Assigned(LEditor) then
    LEditor.GotoNextBookmark
  else
  begin
    LEditor := FDocument.GetActiveSplitEditor;
    if Assigned(LEditor) then
      LEditor.GotoNextBookmark
  end;
end;

procedure TMainForm.ActionGotoPreviousBookmarkExecute(Sender: TObject);
var
  LEditor: TBCEditor;
begin
  LEditor := FDocument.GetActiveEditor;
  if Assigned(LEditor) then
    LEditor.GotoPreviousBookmark
  else
  begin
    LEditor := FDocument.GetActiveSplitEditor;
    if Assigned(LEditor) then
      LEditor.GotoPreviousBookmark
  end;
end;

procedure TMainForm.ActionSearchInSelectionExecute(Sender: TObject);

  procedure SetCaseSensitiveOption(AEditor: TBCEditor);
  begin
    if Assigned(AEditor) then
      AEditor.Search.InSelection.Active := ActionSearchInSelection.Checked;
  end;

begin
  inherited;

  ActionSearchInSelection.Checked := not ActionSearchInSelection.Checked;
  SetCaseSensitiveOption(FDocument.GetActiveEditor);
  SetCaseSensitiveOption(FDocument.GetActiveSplitEditor);
end;

procedure TMainForm.ActionSearchOptionsExecute(Sender: TObject);
begin
  FDocument.SearchOptions;
end;

procedure TMainForm.ActionSearchReplaceExecute(Sender: TObject);
begin
  FDocument.Replace;
end;

procedure TMainForm.ActionSearchSearchButtonExecute(Sender: TObject);
begin
  ActionSearchSearchButton.Checked := FDocument.ToggleSearch;
end;

procedure TMainForm.ActionSearchSearchExecute(Sender: TObject);
begin
  inherited;
  FDocument.ToggleSearch(True);
end;

procedure TMainForm.ActionSearchTextItemsExecute(Sender: TObject);
var
  LIndex, LSearchItemIndex: Integer;
  LComboBox: TBCComboBox;
begin
  inherited;
  with TItemListDialog.Create(Self) do
  try
    Caption := LanguageDataModule.GetConstant('SearchItems');
    LComboBox := FDocument.GetActiveComboBoxSearchText;
    if Assigned(LComboBox) then
    begin
      ListBox.Items.Assign(LComboBox.Items);
      if ShowModal = mrOk then
      begin
        FDocument.UpdateSearchItems(ListBox.Items);
        with TIniFile.Create(GetUniIniFilename) do
        try
          EraseSection('SearchItems');
          LSearchItemIndex := 0;
          for LIndex := ListBox.Items.Count - 1 downto 0 do
          begin
            WriteString('SearchItems', IntToStr(LSearchItemIndex), ListBox.Items[LIndex]);
            Inc(LSearchItemIndex);
          end;
        finally
          Free;
        end;
      end;
    end;
  finally
    Free;
  end;
end;

procedure TMainForm.ActionSearchToggleBookmarkExecute(Sender: TObject);
var
  LEditor: TBCEditor;
begin
  LEditor := FDocument.GetActiveEditor;
  if Assigned(LEditor) then
    LEditor.ToggleBookMark
  else
  begin
    LEditor := FDocument.GetActiveSplitEditor;
    if Assigned(LEditor) then
      LEditor.ToggleBookMark
  end;
end;

procedure TMainForm.ActionSearchToggleBookmarksExecute(Sender: TObject);
begin
  inherited;
  DropdownMenuPopup(SpeedButtonSearchToggleBookmarks);
end;

procedure TMainForm.ActionOutputSelectAllExecute(Sender: TObject);
begin
  inherited;
  FOutput.SetCheckedState(csCheckedNormal);
end;

procedure TMainForm.MoveSelection(AEditor: TBCEditor; const AVirtualKey: Byte);
begin
  if Assigned(AEditor) then
    if AEditor.Focused then
    begin
      OptionsContainer.SelectionModeEnabled := True;
      AEditor.Selection.SetOption(soALTSetsColumnMode, True);
      AEditor.Selection.Mode := smColumn;
      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), 0, 0);
      Keybd_Event(AVirtualKey, MapVirtualKey(AVirtualKey, 0), 0, 0);
      Keybd_Event(AVirtualKey, MapVirtualKey(AVirtualKey, 0), KEYEVENTF_KEYUP, 0);
      Keybd_Event(VK_MENU, MapVirtualKey(VK_MENU, 0), KEYEVENTF_KEYUP, 0);
    end;
end;

procedure TMainForm.ActionSelectionBoxDownExecute(Sender: TObject);
begin
  MoveSelection(FDocument.GetActiveEditor, VK_DOWN);
  MoveSelection(FDocument.GetActiveSplitEditor, VK_DOWN);
end;

procedure TMainForm.ActionSelectionBoxLeftExecute(Sender: TObject);
begin
  MoveSelection(FDocument.GetActiveEditor, VK_LEFT);
  MoveSelection(FDocument.GetActiveSplitEditor, VK_LEFT);
end;

procedure TMainForm.ActionSelectionBoxRightExecute(Sender: TObject);
begin
  MoveSelection(FDocument.GetActiveEditor, VK_RIGHT);
  MoveSelection(FDocument.GetActiveSplitEditor, VK_RIGHT);
end;

procedure TMainForm.ActionSelectionBoxUpExecute(Sender: TObject);
begin
  MoveSelection(FDocument.GetActiveEditor, VK_UP);
  MoveSelection(FDocument.GetActiveSplitEditor, VK_UP);
end;

procedure TMainForm.ActionSelectReopenFileExecute(Sender: TObject);
var
  LFileName: string;
  LMenuItem: TMenuItem;
begin
  LMenuItem := Sender as TMenuItem;
  LFileName := System.Copy(LMenuItem.Caption, Pos(' ', LMenuItem.Caption) + 1, Length(LMenuItem.Caption));
  FDocument.Open(LFileName);
end;

procedure TMainForm.ChangeSkin(Sender: TObject);
begin
  FDocument.UpdateHighlighterColors;
end;

procedure TMainForm.ClipboardMonitorChange(Sender: TObject);
begin
  inherited;
  try
    if IsClipboardFormatAvailable(CF_TEXT) or IsClipboardFormatAvailable(CF_UNICODETEXT) then
    begin
      if FClipboardHistoryItems.IndexOf(Clipboard.AsText) <> -1 then
        Exit;

      FClipboardHistoryItems.Insert(0, Clipboard.AsText);

      while FClipboardHistoryItems.Count > OptionsContainer.ClipboardHistoryItemsCount do
        FClipboardHistoryItems.Delete(FClipboardHistoryItems.Count - 1);

      if Assigned(FClipboardHistoryDialog) then
        FClipboardHistoryDialog.SetDrawTreeData;
    end;
  except
    { intentionally silent }
  end;
end;

procedure TMainForm.ActionToolsCompareFilesExecute(Sender: TObject);
begin
  FDocument.CompareFiles;
end;

procedure TMainForm.ActionToolsConvertExecute(Sender: TObject);
begin
  ConvertForm(Self).Open;
end;

procedure TMainForm.ActionToolsLanguageEditorExecute(Sender: TObject);
begin
  LanguageEditorForm.Open;
  Self.ReadLanguageFile(GetSelectedLanguage);
end;

procedure TMainForm.CreateToolbar(ACreate: Boolean = False);
var
  LIndex, LLeft: Integer;
  LToken: string;
  LToolbarItems: TStrings;
  LIsChanged: Boolean;
  LSpeedButton: TBCSpeedButton;

  function FindItemByName(ItemName: string): TContainedAction;
  var
    LIndex: Integer;
    LAction: TContainedAction;
  begin
    Result := nil;
    for LIndex := 0 to ActionList.ActionCount - 1 do
    begin
      LAction := ActionList.Actions[LIndex];
      if LAction.Name = ItemName then
        Exit(LAction);
    end;
  end;

begin
  LLeft := 0;
  LToolbarItems := TStringList.Create;
  with TIniFile.Create(GetIniFilename) do
  try
    { update if changed }
    LIsChanged := ReadBool('ToolbarItemsChanged', 'Changed', False);
    EraseSection('ToolbarItemsChanged');

    if LIsChanged or ACreate then
    begin
      { read items from ini }
      ReadSectionValues('ToolbarItems', LToolbarItems);
      if LToolbarItems.Count > 0 then
      begin
        if OptionsContainer.ToolbarIconSizeSmall then
          PanelToolbar.Height := 28
        else
          PanelToolbar.Height := 36;

        { add items to action bar }
        while PanelToolbar.ControlCount > 0 do
          PanelToolbar.Controls[0].Destroy;

        if OptionsContainer.ToolbarIconSizeSmall then
          ActionList.Images := ImagesDataModule.ImageListSmall
        else
          ActionList.Images := ImagesDataModule.ImageList;

        for LIndex := 0 to LToolbarItems.Count - 1 do
        begin
          LSpeedButton := TBCSpeedButton.Create(PanelToolbar);
          LSpeedButton.Flat := True;

          LSpeedButton.SkinData.SkinSection := 'TOOLBUTTON';
          LSpeedButton.Layout := Vcl.Buttons.blGlyphTop;

          LToken := GetTokenAfter('=', LToolbarItems.Strings[LIndex]);
          if LToken <> '-' then
          begin
            LSpeedButton.Action := FindItemByName(LToken);
            LSpeedButton.ShowCaption := False;
            if Assigned(LSpeedButton.Action) and TAction(LSpeedButton.Action).AutoCheck then
            begin
              LSpeedButton.AllowAllUp := True;
              LSpeedButton.Down := TAction(LSpeedButton.Action).Checked;
            end
            else
              LSpeedButton.ButtonStyle := tbsTextButton;
            if OptionsContainer.ToolbarIconSizeSmall then
              LSpeedButton.Width := 26
            else
              LSpeedButton.Width := 36
          end
          else
          begin
            LSpeedButton.ButtonStyle := tbsDivider;
            LSpeedButton.Width := 10;
            LSpeedButton.Margins.Top := 2;
            LSpeedButton.Margins.Left := 0;
            LSpeedButton.Margins.Right := 0;
            LSpeedButton.Margins.Bottom := 2;
            LSpeedButton.AlignWithMargins := True;
          end;

          LSpeedButton.Parent := PanelToolbar;
          LSpeedButton.Left := LLeft;
          LSpeedButton.Align := alLeft;

          LLeft := LLeft + LSpeedButton.Width;
        end;
      end;
    end
  finally
    Free;
    LToolbarItems.Free;
  end;
end;

procedure TMainForm.ActionToolsOptionsExecute(Sender: TObject);
begin
  if FDocument.Options(ActionList) then
  begin
    SetOptions;
    CreateToolbar;
    SetTitleBarMenuCaptions;
  end;
end;

procedure TMainForm.ActionToolsSelectForCompareExecute(Sender: TObject);
begin
  FDocument.SelectForCompare;
end;

procedure TMainForm.ActionOutputUnselectAllExecute(Sender: TObject);
begin
  inherited;
  FOutput.SetCheckedState(csUncheckedNormal);
end;

procedure TMainForm.ActionDummyExecute(Sender: TObject);
begin
  inherited;
  { Dummy }
end;

procedure TMainForm.ActionToggleBookmarksExecute(Sender: TObject);
var
  LAction: TAction;
begin
  LAction := Sender as TAction;
  FDocument.ToggleBookMark(LAction.Tag);
end;

procedure TMainForm.ActionEditToggleCaseAlternatingExecute(Sender: TObject);
begin
  inherited;
  FDocument.ToggleCase(cAlternating);
end;

procedure TMainForm.ActionEditToggleCaseLowerExecute(Sender: TObject);
begin
  inherited;
  FDocument.ToggleCase(cLower);
end;

procedure TMainForm.ActionEditToggleCaseSentenceExecute(Sender: TObject);
begin
  inherited;
  FDocument.ToggleCase(cSentence);
end;

procedure TMainForm.ActionEditToggleCaseTitleExecute(Sender: TObject);
begin
  inherited;
  FDocument.ToggleCase(cTitle);
end;

procedure TMainForm.ActionEditToggleCaseUpperExecute(Sender: TObject);
begin
  inherited;
  FDocument.ToggleCase(cUpper);
end;

procedure TMainForm.ActionGotoBookmarksExecute(Sender: TObject);
var
  LAction: TAction;
begin
  LAction := Sender as TAction;
  FDocument.GotoBookMarks(LAction.Tag);
end;

procedure TMainForm.ActionToolbarMenuSkinExecute(Sender: TObject);
begin
  inherited;
  TSkinSelectDialog.ClassShowModal(SkinManager);
  UpdatePageControlMargins;
end;

procedure TMainForm.UpdatePageControlMargins;
begin
  if SkinManager.ExtendedBorders then
    PageControlToolbar.Margins.SetBounds(3, 3, 3, 0)
  else
    PageControlToolbar.Margins.SetBounds(0, 3, 0, 0);
  if SkinManager.ExtendedBorders then
  begin
    PanelMiddle.Margins.Left := 3;
    PanelMiddle.Margins.Right := 3;
  end
  else
  begin
    PanelMiddle.Margins.Left := 0;
    PanelMiddle.Margins.Right := 0;
  end;
  PageControlOutput.AlignWithMargins := SkinManager.ExtendedBorders;
  PageControlOutput.Margins.SetBounds(3, 0, 3, 0);
end;

procedure TMainForm.ActionToolsCharacterMapExecute(Sender: TObject);
begin
  UnicodeCharacterMapForm.Open(FDocument.GetActiveEditor);
end;

procedure DoOnInsertInEditor(var AText: string);
var
  LEditor: TBCEditor;
begin
  LEditor := MainForm.FDocument.GetActiveEditor;
  if Assigned(LEditor) then
    LEditor.InsertText(AText);
end;

procedure TMainForm.ActionToolsClipboardHistoryExecute(Sender: TObject);
begin
  inherited;
  FClipboardHistoryDialog := ClipboardHistoryDialog;
  FClipboardHistoryDialog.OnInsertInEditor := DoOnInsertInEditor;
  FClipboardHistoryDialog.Open(FClipboardHistoryItems);
end;

procedure TMainForm.ActionViewCloseDirectoryExecute(Sender: TObject);
begin
  FDirectory.CloseDirectory;
end;

procedure TMainForm.ActionViewDirectoryExecute(Sender: TObject);
begin
  with PanelDirectory do
  begin
    if not Visible then
      SplitterVertical.Show { vertical splitter must be shown at first or the order goes wrong! }
    else
      SplitterVertical.Hide;
    Visible := not Visible;
    UpdatePageControlMargins;
  end;
end;

procedure TMainForm.ActionViewEditDirectoryExecute(Sender: TObject);
begin
  FDirectory.EditDirectory;
end;

procedure TMainForm.ActionViewEncodingSelectionExecute(Sender: TObject);
begin
  ActionViewEncodingSelection.Checked := not ActionViewEncodingSelection.Checked
end;

procedure DoSearchForFilesOpenFile(var FileName: string);
begin
  MainForm.FDocument.Open(FileName);
end;

procedure TMainForm.ActionViewFilesExecute(Sender: TObject);
var
  LSelectedPath: string;
begin
  with SearchForFilesForm(Self) do
  begin
    OnOpenFile := DoSearchForFilesOpenFile;
    LSelectedPath := FDirectory.SelectedPath;
    if Length(LSelectedPath) > 4 then
      Open(LSelectedPath)
    else
      ShowMessage(LanguageDataModule.GetMessage('SelectFilePathFromDirectory'))
  end;
end;

procedure TMainForm.ActionViewFoldAllDownFromActiveLineExecute(Sender: TObject);
begin
  inherited;
  FDocument.FoldAllDownFromSelectedLine;
end;

procedure TMainForm.ActionViewFoldAllExecute(Sender: TObject);
begin
  inherited;
  FDocument.FoldAll;
end;

procedure TMainForm.ActionViewFoldAllUpFromActiveLineExecute(Sender: TObject);
begin
  inherited;
  FDocument.FoldAllUpFromSelectedLine;
end;

procedure TMainForm.ActionViewFoldExecute(Sender: TObject);
begin
  inherited;
  DropdownMenuPopup(SpeedButtonViewFold);
end;

procedure TMainForm.ActionViewFoldSelectedExecute(Sender: TObject);
begin
  inherited;
  FDocument.FoldAllSelected;
end;

procedure TMainForm.ActionViewColorSelectionExecute(Sender: TObject);
begin
  ActionViewColorSelection.Checked := not ActionViewColorSelection.Checked
end;

procedure TMainForm.ActionViewHighlighterSelectionExecute(Sender: TObject);
begin
  ActionViewHighlighterSelection.Checked := not ActionViewHighlighterSelection.Checked
end;

procedure TMainForm.ActionViewLineNumbersExecute(Sender: TObject);
begin
  ActionViewLineNumbers.Checked := FDocument.ToggleLineNumbers;
end;

procedure TMainForm.ActionViewMainMenuExecute(Sender: TObject);
begin
  OptionsContainer.MainMenuVisible := not OptionsContainer.MainMenuVisible;
  if OptionsContainer.MainMenuVisible then
  begin
    Menu := MainMenu;
    Height := Height + 1;
    Height := Height - 1;
  end
  else
    Menu := nil;
  if PanelMenubar.Visible and Assigned(Menu) then
  begin
    OptionsContainer.MenuBarVisible := False;
    PanelMenuBar.Visible := False;
  end;
end;

procedure TMainForm.ActionViewMenuBarExecute(Sender: TObject);
begin
  OptionsContainer.MenubarVisible := not OptionsContainer.MenubarVisible;
  PanelMenubar.Visible := OptionsContainer.MenubarVisible;
  if PanelMenubar.Visible then
    ActionList.Images := ImagesDataModule.ImageList
  else
    ActionList.Images := ImagesDataModule.ImageListSmall;
  if PanelMenubar.Visible and PanelToolbar.Visible then
  begin
    OptionsContainer.ToolbarVisible := False;
    PanelToolbar.Visible := False;
  end;
  if PanelMenubar.Visible and Assigned(Menu) then
  begin
    OptionsContainer.MainMenuVisible := False;
    Menu := nil;
  end;
end;

procedure TMainForm.ActionViewMinimapExecute(Sender: TObject);
begin
  FDocument.ToggleMiniMap;
end;

procedure TMainForm.ActionViewNextPageExecute(Sender: TObject);
begin
  FDocument.NextPage;
end;

procedure TMainForm.ActionViewOpenDirectoryExecute(Sender: TObject);
begin
  FDirectory.OpenDirectory;
  if not PanelDirectory.Visible then
  begin
    PanelDirectory.Visible := True;
    SplitterVertical.Visible := True;
  end;
end;

procedure TMainForm.ActionViewOutputExecute(Sender: TObject);
begin
  PanelOutput.Visible := not PanelOutput.Visible;
  PanelOutput.Top := StatusBar.Top - PanelOutput.Height; { always top of statusbar }
end;

procedure TMainForm.ActionViewPreviousPageExecute(Sender: TObject);
begin
  FDocument.PreviousPage;
end;

procedure TMainForm.ActionViewSelectionModeExecute(Sender: TObject);
begin
  FDocument.ToggleSelectionMode;
end;

procedure TMainForm.ActionViewSkinSelectorExecute(Sender: TObject);
begin
  inherited;
  ActionViewSkinSelector.Checked := not ActionViewSkinSelector.Checked;
  OptionsContainer.SkinSelectorVisible := not OptionsContainer.SkinSelectorVisible;
end;

procedure TMainForm.ActionViewSpecialCharsExecute(Sender: TObject);
begin
  ActionViewSpecialChars.Checked := FDocument.ToggleSpecialChars;
end;

procedure TMainForm.ActionViewSplitExecute(Sender: TObject);
begin
  FDocument.ToggleSplit;
end;

procedure TMainForm.ActionViewStatusBarExecute(Sender: TObject);
begin
  StatusBar.Visible := not StatusBar.Visible;
end;

procedure TMainForm.ActionViewSyncEditExecute(Sender: TObject);
begin
  inherited;
  FDocument.SyncEdit;
end;

procedure TMainForm.ActionViewTitleBarFileListExecute(Sender: TObject);
begin
  inherited;
  OptionsContainer.TitlebarFileListVisible := not OptionsContainer.TitlebarFileListVisible;
end;

procedure TMainForm.ActionViewTitleBarFilenameExecute(Sender: TObject);
begin
  inherited;
  OptionsContainer.TitleBarFilenameVisible := not OptionsContainer.TitleBarFilenameVisible;
end;

procedure TMainForm.ActionViewToolbarExecute(Sender: TObject);
begin
  OptionsContainer.ToolbarVisible := not OptionsContainer.ToolbarVisible;
  PanelToolbar.Visible := OptionsContainer.ToolbarVisible;
  if PanelToolbar.Visible then
    ActionList.Images := ImagesDataModule.ImageListSmall
  else
    ActionList.Images := ImagesDataModule.ImageList;
  if PanelMenubar.Visible and PanelToolbar.Visible then
  begin
    OptionsContainer.MenuBarVisible := False;
    PanelMenuBar.Visible := False;
  end;
end;

procedure TMainForm.ActionViewUnfoldAllDownFromActiveLineExecute(Sender: TObject);
begin
  inherited;
  FDocument.UnfoldAllDownFromSelectedLine;
end;

procedure TMainForm.ActionViewUnfoldAllExecute(Sender: TObject);
begin
  inherited;
  FDocument.UnfoldAll;
end;

procedure TMainForm.ActionViewUnfoldAllUpFromActiveLineExecute(Sender: TObject);
begin
  inherited;
  FDocument.UnfoldAllUpFromSelectedLine;
end;

procedure TMainForm.ActionViewUnfoldExecute(Sender: TObject);
begin
  inherited;
  DropdownMenuPopup(SpeedButtonViewUnfold);
end;

procedure TMainForm.ActionViewUnfoldSelectedExecute(Sender: TObject);
begin
  inherited;
  FDocument.UnfoldAllSelected;
end;

procedure TMainForm.ActionViewWordWrapExecute(Sender: TObject);
begin
  ActionViewWordWrap.Checked := FDocument.ToggleWordWrap;
end;

procedure TMainForm.ActionViewXMLTreeExecute(Sender: TObject);
begin
  ActionViewXMLTree.Checked := FDocument.ToggleXMLTree;
end;

procedure TMainForm.ActionXMLTreeRefreshExecute(Sender: TObject);
begin
  FDocument.RefreshXMLTree;
end;

procedure TMainForm.ApplicationEventsActivate(Sender: TObject);
begin
  if Processing then
    Exit;
  FDocument.CheckFileDateTimes;
end;

procedure TMainForm.ApplicationEventsHint(Sender: TObject);
begin
  inherited;
  StatusBar.Panels[EDITBONE_STATUS_BAR_HINT_PANEL].Text := Application.Hint;
end;

procedure TMainForm.ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
begin
  if Processing then
    Exit;
  SetFields;
  SetImages;
end;

procedure TMainForm.SetImages;
var
  i: Integer;
  LSpeedButton: TBCSpeedButton;
begin
  SpeedButtonMacroPlay.Images := ImagesDataModule.ImageListSmall;
  SpeedButtonMacroRecordPause.Images := ImagesDataModule.ImageListSmall;
  SpeedButtonMacroStop.Images := ImagesDataModule.ImageListSmall;
  PopupMenuEditor.Images := ImagesDataModule.ImageListSmall;
  PopupMenuDocument.Images := ImagesDataModule.ImageListSmall;
  PopupMenuFileTreeView.Images := ImagesDataModule.ImageListSmall;

  for i := 0 to PanelToolbar.ControlCount - 1 do
  if PanelToolbar.Controls[i] is TBCSpeedButton then
  begin
    LSpeedButton := TBCSpeedButton(PanelToolbar.Controls[i]);
    if OptionsContainer.ToolbarIconSizeSmall then
      LSpeedButton.Images := ImagesDataModule.ImageListSmall
    else
      LSpeedButton.Images := ImagesDataModule.ImageList
  end;
end;

procedure TMainForm.SetFields;
var
  LActiveEditor, LActiveSplitEditor: TBCEditor;
  LActiveDocumentName, LCaption, LConstant: string;
  LActiveDocumentFound, LActiveSplitDocumentFound: Boolean;
  LInfoText: string;
  LKeyState: TKeyboardState;
  LSelectionAvailable: Boolean;
  LIsSQLDocument: Boolean;
  LIsXMLDocument: Boolean;
  LIsJSONDocument: Boolean;
  LSelectionModeChecked: Boolean;
  LMinimapVisible: Boolean;
  LSyncEditActive: Boolean;
  LSearchEnabled: Boolean;
  LIsRecordingMacro: Boolean;
  LIsRecordingStopped: Boolean;
  LActiveDocumentModified: Boolean;
  LCodeFoldingVisible: Boolean;
  LActiveDocumentBookmarksFound: Boolean;
begin
  FProcessingEventHandler := True;
  try
    LActiveEditor := nil;
    LActiveSplitEditor := nil;
    if Assigned(PageControlDocument.ActivePage) then
    begin
      LActiveEditor := FDocument.GetActiveEditor;
      LActiveSplitEditor := FDocument.GetActiveSplitEditor;
    end;
    LActiveDocumentFound := Assigned(LActiveEditor);
    LActiveSplitDocumentFound := Assigned(LActiveSplitEditor);

    LSelectionAvailable := False;
    LIsSQLDocument := False;
    LIsXMLDocument := False;
    LIsJSONDocument := False;
    LActiveDocumentName := '';
    LSelectionModeChecked := False;
    LMinimapVisible := False;
    LSyncEditActive := False;
    LSearchEnabled := False;
    LIsRecordingMacro := False;
    LIsRecordingStopped := False;
    LActiveDocumentModified := False;
    LCodeFoldingVisible := False;
    LActiveDocumentBookmarksFound := False;
    if LActiveDocumentFound then
    begin
      LSelectionAvailable := LActiveEditor.SelectionAvailable;
      LIsSQLDocument := LActiveEditor.Tag = EXTENSION_SQL;
      LIsXMLDocument := LActiveEditor.Tag = EXTENSION_XML;
      LIsJSONDocument := LActiveEditor.Tag = EXTENSION_JSON;
      LMinimapVisible := LActiveEditor.Minimap.Visible;
      LSyncEditActive := LActiveEditor.SyncEdit.Active;
      LCodeFoldingVisible := LActiveEditor.CodeFolding.Visible;
      LActiveDocumentModified := LActiveEditor.Modified;
      LActiveDocumentBookmarksFound := LActiveEditor.Bookmarks.Count > 0;

      LSearchEnabled := LActiveEditor.Search.Visible;

      if Assigned(LActiveEditor.MacroRecorder) then
      begin
        LIsRecordingMacro := LActiveEditor.MacroRecorder.State = msRecording;
        LIsRecordingStopped := LActiveEditor.MacroRecorder.State = msStopped;
      end;
      LSelectionModeChecked := LActiveEditor.Selection.Mode = smColumn;
    end;
    if LActiveDocumentFound and (PageControlDocument.ActivePage.TabType = ttTab) then
    begin
      LActiveDocumentName := LActiveEditor.FilePath;
      LActiveDocumentName := LActiveDocumentName + PageControlDocument.ActivePage.Caption;
    end;

    if LActiveSplitDocumentFound then
      LSelectionAvailable := LSelectionAvailable or LActiveSplitEditor.SelectionAvailable;

    ActionViewMainMenu.Checked := Assigned(Menu);
    ActionViewToolbar.Checked := PanelToolbar.Visible;
    ActionViewMenuBar.Checked := PanelMenuBar.Visible;
    ActionViewStatusbar.Checked := StatusBar.Visible;
    ActionViewOutput.Checked := PanelOutput.Visible;
    ActionViewDirectory.Enabled := FDirectory.IsAnyDirectory;
    ActionViewDirectory.Checked := PanelDirectory.Visible;

    SplitterHorizontal.Visible := PanelOutput.Visible;
    SplitterHorizontal.Top := PanelOutput.Top - SplitterHorizontal.Height; { always top of panel output }

    TitleBar.Items[EDITBONE_TITLE_BAR_ENCODING].Visible := ActionViewEncodingSelection.Checked;
    TitleBar.Items[EDITBONE_TITLE_BAR_SPACING2].Visible := TitleBar.Items[EDITBONE_TITLE_BAR_ENCODING].Visible;
    TitleBar.Items[EDITBONE_TITLE_BAR_HIGHLIGHTER].Visible := ActionViewHighlighterSelection.Checked;
    TitleBar.Items[EDITBONE_TITLE_BAR_SPACING3].Visible := TitleBar.Items[EDITBONE_TITLE_BAR_HIGHLIGHTER].Visible;
    TitleBar.Items[EDITBONE_TITLE_BAR_COLORS].Visible := ActionViewColorSelection.Checked;
    TitleBar.Items[EDITBONE_TITLE_BAR_SPACING4].Visible := TitleBar.Items[EDITBONE_TITLE_BAR_COLORS].Visible;

    SkinSelector.Visible := ActionViewSkinSelector.Checked;
    if ActionViewSkinSelector.Checked then
      SkinSelector.Left := ClientWidth - SkinSelector.Width - 3;

    ActionViewXMLTree.Enabled := LActiveDocumentFound and LIsXMLDocument;
    if ActionViewXMLTree.Enabled then
      ActionViewXMLTree.Checked := FDocument.XMLTreeVisible;

    LCaption := Application.Title;
    if (LActiveDocumentName <> '') and OptionsContainer.TitlebarFilenameVisible then
      LCaption := LCaption + '  -';

    TitleBar.Items[EDITBONE_TITLE_BAR_CAPTION].Caption := LCaption;

    TitleBar.Items[EDITBONE_TITLE_BAR_FILENAME].Visible := (PageControlDocument.PageCount > 1) and OptionsContainer.TitlebarFilenameVisible;
    TitleBar.Items[EDITBONE_TITLE_BAR_FILENAME].Caption := '[' + LActiveDocumentName + ']';

    ActionViewTitleBarFilename.Checked := OptionsContainer.TitlebarFilenameVisible;

    if OptionsContainer.TitlebarFileListVisible then
      TitleBar.Items[EDITBONE_TITLE_BAR_FILENAME].Style := bsButton
    else
      TitleBar.Items[EDITBONE_TITLE_BAR_FILENAME].Style := bsInfo;

    ActionViewTitleBarFileList.Checked := OptionsContainer.TitlebarFileListVisible;

    ActionFileProperties.Enabled := LActiveDocumentFound and (LActiveDocumentName <> '');

    ActionFileReopen.Enabled := PopupMenuFileReopen.Items.Count > 0;
    ActionFileClose.Enabled := PageControlDocument.PageCount > 1;
    ActionFileCloseAll.Enabled := ActionFileClose.Enabled;
    ActionFileCloseAllOther.Enabled := ActionFileClose.Enabled;
    ActionViewNextPage.Enabled := PageControlDocument.PageCount > 2;
    ActionViewPreviousPage.Enabled := ActionViewNextPage.Enabled;
    ActionFileSaveAs.Enabled := ActionFileClose.Enabled and LActiveDocumentFound;
    ActionFileSave.Enabled := LActiveDocumentModified and LActiveDocumentFound;
    ActionFileSaveAll.Enabled := FDocument.ModifiedDocuments and LActiveDocumentFound;
    ActionFilePrint.Enabled := ActionFileClose.Enabled and LActiveDocumentFound;
    ActionFilePrintPreview.Enabled := ActionFileClose.Enabled and LActiveDocumentFound;
    ActionFileSelectFromDirectory.Enabled := PanelDirectory.Visible and LActiveDocumentFound and ActionViewDirectory.Enabled;
    ActionEditUndo.Enabled := ActionFileClose.Enabled and FDocument.CanUndo and LActiveDocumentFound;
    ActionEditRedo.Enabled := ActionFileClose.Enabled and FDocument.CanRedo and LActiveDocumentFound;
    ActionEditCut.Enabled := LSelectionAvailable and LActiveDocumentFound;
    ActionEditCopy.Enabled := ActionEditCut.Enabled and LActiveDocumentFound;
    ActionEditSelectAll.Enabled := LActiveDocumentFound;
    ActionEditIndentIncrease.Enabled := LSelectionAvailable;
    ActionEditIndentDecrease.Enabled := LSelectionAvailable;
    ActionEditToggleCase.Enabled := LSelectionAvailable;
    ActionEditInsertTag.Enabled := LActiveDocumentFound;
    ActionEditInsertDateTime.Enabled := LActiveDocumentFound;
    ActionEditInsertLine.Enabled := LActiveDocumentFound;
    ActionEditDeleteWord.Enabled := LActiveDocumentFound;
    ActionEditDeleteLine.Enabled := LActiveDocumentFound;
    ActionEditDeleteEndOfLine.Enabled := LActiveDocumentFound;

    ActionEditPaste.Enabled := Clipboard.HasFormat(CF_TEXT) and LActiveDocumentFound;

    ActionViewSelectionMode.Enabled := LActiveDocumentFound;
    ActionViewSelectionMode.Checked := LActiveDocumentFound and LSelectionModeChecked;
    ActionViewSplit.Enabled := LActiveDocumentFound;
    ActionViewSplit.Checked := LActiveSplitDocumentFound;
    ActionViewMinimap.Enabled := LActiveDocumentFound;
    ActionViewMinimap.Checked := LActiveDocumentFound and LMinimapVisible;
    ActionViewSyncEdit.Enabled := LActiveDocumentFound and LSelectionAvailable;
    ActionViewSyncEdit.Checked := LActiveDocumentFound and LSyncEditActive;

    ActionViewFold.Enabled := LCodeFoldingVisible;
    ActionViewFoldAll.Enabled := LCodeFoldingVisible;
    ActionViewFoldAllDownFromActiveLine.Enabled := LCodeFoldingVisible;
    ActionViewFoldAllUpFromActiveLine.Enabled := LCodeFoldingVisible;
    ActionViewFoldSelected.Enabled := LCodeFoldingVisible and LSelectionAvailable;

    ActionViewUnfold.Enabled := LCodeFoldingVisible;
    ActionViewUnfoldAll.Enabled := LCodeFoldingVisible;
    ActionViewUnfoldAllDownFromActiveLine.Enabled := LCodeFoldingVisible;
    ActionViewUnfoldAllUpFromActiveLine.Enabled := LCodeFoldingVisible;
    ActionViewUnfoldSelected.Enabled := LCodeFoldingVisible and LSelectionAvailable;

    ActionSearchSearch.Enabled := LActiveDocumentFound;
    ActionSearchSearchButton.Enabled := LActiveDocumentFound;
    ActionSearchSearchButton.Checked := LActiveDocumentFound and LSearchEnabled;
    ActionSearchGotoLine.Enabled := LActiveDocumentFound;
    ActionSearchReplace.Enabled := LActiveDocumentFound;
    ActionSearchFindInFiles.Enabled := Assigned(FOutput) and not FOutput.ProcessingTabSheet;
    ActionSearchFindAll.Enabled := LActiveDocumentFound;
    ActionSearchFindNext.Enabled := LActiveDocumentFound;
    ActionSearchFindPrevious.Enabled := LActiveDocumentFound;
    ActionSearchToggleBookmark.Enabled := OptionsContainer.LeftMarginShowBookmarks and LActiveDocumentFound;
    ActionSearchToggleBookmarks.Enabled := ActionSearchToggleBookmark.Enabled;
    ActionSearchGotoBookmarks.Enabled := ActionSearchToggleBookmark.Enabled;
    ActionSearchClearBookmarks.Enabled := ActionSearchToggleBookmark.Enabled;

    ActionGotoNextBookmark.Enabled := LActiveDocumentFound and LActiveDocumentBookmarksFound;
    ActionGotoPreviousBookmark.Enabled := LActiveDocumentFound and LActiveDocumentBookmarksFound;

    ActionViewWordWrap.Enabled := LActiveDocumentFound;
    ActionViewLineNumbers.Enabled := Assigned(FDocument) and (PageControlDocument.PageCount > 1);
    ActionViewSpecialChars.Enabled := ActionViewLineNumbers.Enabled;
    ActionDocumentInfo.Enabled := LActiveDocumentFound;
    {$IFDEF DEBUG} // TODO
    ActionToolsSelectForCompare.Enabled := LActiveDocumentFound and not LActiveDocumentModified;
    {$ELSE}
    ActionToolsCompareFiles.Enabled := False;
    ActionToolsSelectForCompare.Enabled := False;
    {$ENDIF}
    ActionDocumentFormatJSON.Enabled := LActiveDocumentFound and LIsJSONDocument;
    ActionDocumentFormatSQL.Enabled := FSQLFormatterDLLFound and LActiveDocumentFound and LIsSQLDocument;
    ActionDocumentFormatXML.Enabled := LActiveDocumentFound and LIsXMLDocument;

    ActionViewOutput.Enabled := PageControlOutput.PageCount > 1;
    if not ActionViewOutput.Enabled then { if there's no output then hide panel }
      PanelOutput.Visible := False;

    if OptionsContainer.DirAutoHide then
      if not ActionViewDirectory.Enabled then
      begin
        SplitterVertical.Visible := False;
        PanelDirectory.Visible := False;
      end;

    ActionViewEditDirectory.Enabled := PanelDirectory.Visible;
    ActionViewCloseDirectory.Enabled := PanelDirectory.Visible;

    if LActiveDocumentFound and OptionsContainer.StatusBarShowModified then
    begin
      LInfoText := FDocument.GetModifiedInfo(LActiveEditor);
      if StatusBar.Panels[EDITBONE_STATUS_BAR_MODIFIED_INFO_PANEL].Text <> LInfoText then
        StatusBar.Panels[EDITBONE_STATUS_BAR_MODIFIED_INFO_PANEL].Text := LInfoText;
    end
    else
      StatusBar.Panels[EDITBONE_STATUS_BAR_MODIFIED_INFO_PANEL].Text := '';

    GetKeyboardState(LKeyState);
    if OptionsContainer.StatusBarShowKeyState then
    case LKeyState[VK_INSERT] of
      0:
        begin
          LConstant := LanguageDataModule.GetConstant('Insert');
          if StatusBar.Panels[EDITBONE_STATUS_BAR_INSERT_KEYSTATE_PANEL].Text <> LConstant then
            StatusBar.Panels[EDITBONE_STATUS_BAR_INSERT_KEYSTATE_PANEL].Text := LConstant;
        end;
      1:
        begin
          LConstant := LanguageDataModule.GetConstant('Overwrite');
          if StatusBar.Panels[EDITBONE_STATUS_BAR_INSERT_KEYSTATE_PANEL].Text <> LConstant then
            StatusBar.Panels[EDITBONE_STATUS_BAR_INSERT_KEYSTATE_PANEL].Text := LConstant;
        end;
    end
    else
      StatusBar.Panels[EDITBONE_STATUS_BAR_INSERT_KEYSTATE_PANEL].Text := '';
    { Macro }
    ActionMacroRecord.Enabled := LActiveDocumentFound;
    ActionMacroPause.Enabled := LActiveDocumentFound;
    ActionMacroStop.Enabled := LActiveDocumentFound and LIsRecordingMacro;
    ActionMacroPlayback.Enabled := LActiveDocumentFound and LIsRecordingStopped;
    ActionMacroOpen.Enabled := LActiveDocumentFound;
    ActionMacroSaveAs.Enabled := ActionMacroPlayback.Enabled;
    TitleBar.Items[EDITBONE_TITLE_BAR_MENU].Visible := not PanelMenubar.Visible;
    FProcessingEventHandler := False;

    ActionOutputCopySelectedToClipboard.Visible := OptionsContainer.OutputShowCheckBox;
    ActionOutputOpenSelected.Visible := OptionsContainer.OutputShowCheckBox;
    ActionOutputSelectAll.Visible := OptionsContainer.OutputShowCheckBox;
    ActionOutputUnselectAll.Visible := OptionsContainer.OutputShowCheckBox;

    ActionToolbarMenuSkin.Visible := SkinManager.Active;
  except
    { intentionally silent }
  end;
end;

procedure TMainForm.SetBookmarks;
var
  i: Integer;
  LBookmarkList: TBCEditorMarkList;
  LActionGotoBookmarks, LActionToggleBookmarks: TAction;
begin
  if OptionsContainer.LeftMarginShowBookmarks then
  begin
    LBookmarkList := FDocument.GetActiveBookmarkList;
    { Bookmarks }
    if Assigned(LBookmarkList) then
    for i := 1 to 9 do
    begin
      LActionGotoBookmarks := TAction(FindComponent(Format('ActionGotoBookmarks%d', [i])));
      if Assigned(LActionGotoBookmarks) then
      begin
        LActionGotoBookmarks.Enabled := False;
        LActionGotoBookmarks.Caption := Format('%s &%d', [LanguageDataModule.GetConstant('Bookmark'), i]);
      end;
      LActionToggleBookmarks := TAction(FindComponent(Format('ActionToggleBookmarks%d', [i])));
      if Assigned(LActionToggleBookmarks) then
        LActionToggleBookmarks.Caption := Format('%s &%d', [LanguageDataModule.GetConstant('Bookmark'), i]);
    end;
    if Assigned(LBookmarkList) then
    for i := 0 to LBookmarkList.Count - 1 do
    begin
      LActionGotoBookmarks := TAction(FindComponent(Format('ActionGotoBookmarks%d', [LBookmarkList.Items[i].Index + 1])));
      if Assigned(LActionGotoBookmarks) then
      begin
        LActionGotoBookmarks.Enabled := True;
        LActionGotoBookmarks.Caption := Format('%s &%d: %s %d', [LanguageDataModule.GetConstant('Bookmark'),
          LBookmarkList.Items[i].Index + 1, LanguageDataModule.GetConstant('Line'), LBookmarkList.Items[i].Line]);
      end;
      LActionToggleBookmarks := TAction(FindComponent(Format('ActionToggleBookmarks%d', [LBookmarkList.Items[i].Index + 1])));
      if Assigned(LActionToggleBookmarks) then
        LActionToggleBookmarks.Caption := Format('%s &%d: %s %d', [LanguageDataModule.GetConstant('Bookmark'),
          LBookmarkList.Items[i].Index + 1, LanguageDataModule.GetConstant('Line'), LBookmarkList.Items[i].Line]);
    end;
  end;
end;

procedure TMainForm.CopyIniFilesIntoUserProfile;
var
  LOldFileName, LNewFileName: string;
begin
  LOldFileName := GetOldIniFilename;
  LNewFileName := GetIniFilename;
  if FileExists(LOldFileName) then
  begin
    if not FileExists(LNewFileName) then
      TFile.Move(LOldFileName, LNewFileName);
  end;
  LOldFileName := GetOldOutFilename;
  LNewFileName := GetOutFilename;
  if FileExists(LOldFileName) then
  begin
    if not FileExists(LNewFileName) then
      TFile.Move(LOldFileName, LNewFileName);
  end;
end;

procedure TMainForm.CreateLanguageMenu(AMenuItem: TMenuItem);
var
  LLanguagePath, LFileName, LExtractedFileName, LLanguageName: string;
  LMenuItem: TMenuItem;
begin
  ActionToolbarMenuLanguage.Enabled := False;
  AMenuItem.Clear;

  LLanguagePath := IncludeTrailingPathDelimiter(Format('%s%s', [ExtractFilePath(ParamStr(0)), 'Languages']));
  if not DirectoryExists(LLanguagePath) then
    Exit;

  LLanguageName := GetSelectedLanguage;
  for LFileName in TDirectory.GetFiles(LLanguagePath, '*.lng') do
  begin
    LMenuItem := TMenuItem.Create(Application);
    LExtractedFileName := ExtractFilename(ChangeFileExt(LFileName, ''));
    LMenuItem.Caption := LExtractedFileName;
    LMenuItem.OnClick := LanguageMenuClick;
    LMenuItem.Checked := LLanguageName = LExtractedFileName;
    LMenuItem.RadioItem := True;
    AMenuItem.Add(LMenuItem);
  end;
  ActionToolbarMenuLanguage.Enabled := AMenuItem.Count > 0;
end;

procedure TMainForm.DragDropDrop(Sender: TObject; Pos: TPoint; Value: TStrings);
begin
  FDocument.DropFiles(Sender, Pos, Value);
end;

procedure TMainForm.EditorPrintPrintLine(Sender: TObject; LineNumber, PageNumber: Integer);
begin
  inherited;
  ProgressBar.StepIt;
end;

procedure TMainForm.EditorPrintPrintStatus(Sender: TObject; Status: TBCEditorPrintStatus; PageNumber: Integer;
  var Abort: Boolean);
begin
  inherited;
  // TODO: Abort
end;

procedure TMainForm.LanguageMenuClick(Sender: TObject);
var
  LCaption: string;
begin
  LCaption := StringReplace(TMenuItem(Sender).Caption, '&', '', [rfReplaceAll]);

  with TIniFile.Create(GetIniFilename) do
  try
    WriteString('Options', 'Language', LCaption);
  finally
    Free;
  end;

  TMenuItem(Sender).Checked := True;

  Self.ReadLanguageFile(LCaption);
end;

procedure TMainForm.ReadLanguageFile(const ALanguage: string);
begin
  if ALanguage = '' then
    Exit;

  { language constants }
  BCCommon.Language.Strings.ReadLanguageFile(ALanguage);
  { mainform }
  UpdateLanguage(Self, ALanguage);
  { menubar }
  UpdateMenuBarLanguage;

  Invalidate;
end;

procedure TMainForm.UpdateMenuBarLanguage;

  procedure InitializeSpeedButtons(Panels: array of TBCPanel);
  var
    LControlIndex, LPanelIndex: Integer;
    LCaption: string;
    LSpeedButton: TBCSpeedButton;
    LTextWidth: Integer;
    LAction: TBasicAction;
    LControl: TControl;
  begin
    for LPanelIndex := 0 to Length(Panels) - 1 do
      for LControlIndex := 0 to Panels[LPanelIndex].ControlCount - 1 do
      begin
        LControl := Panels[LPanelIndex].Controls[LControlIndex];
        if LControl is TBCSpeedButton then
        begin
          LSpeedButton := TBCSpeedButton(LControl);
          LSpeedButton.Images := ImagesDataModule.ImageList;
          if LSpeedButton.ButtonStyle <> tbsDivider then
          begin
            { Menubar items are not updated, if the action is not set }
            LAction := LSpeedButton.Action;
            LSpeedButton.Action := LAction;

            LCaption := LSpeedButton.Caption;
            LCaption := StringReplace(LCaption, '.', '', [rfReplaceAll]);
            LCaption := StringReplace(LCaption, '&', '', [rfReplaceAll]);
            LSpeedButton.Caption := LCaption;
            LTextWidth := LSpeedButton.Canvas.TextWidth(LCaption);
            LSpeedButton.Width := Max(60, LTextWidth + 8);
            if LSpeedButton.ButtonStyle = tbsDropDown then
              LSpeedButton.Width := LSpeedButton.Width + 12;
            LSpeedButton.Width := LSpeedButton.Width - LCaption.CountChar(',') * LSpeedButton.Canvas.TextWidth(',');
          end;
        end;
      end;
  end;

  function RemoveShortCut(AText: string): string;
  begin
    Result := StringReplace(AText, '&', '', [rfReplaceAll]);
  end;

begin
  { Captions }
  TabSheetFile.Caption := RemoveShortCut(ActionFile.Caption);
  TabSheetEdit.Caption := RemoveShortCut(ActionEdit.Caption);
  TabSheetSearch.Caption := RemoveShortCut(ActionSearch.Caption);
  TabSheetView.Caption := RemoveShortCut(ActionView.Caption);
  TabSheetDocument.Caption := RemoveShortCut(ActionDocument.Caption);
  TabSheetTools.Caption := RemoveShortCut(ActionTools.Caption);
  TabSheetHelp.Caption := RemoveShortCut(ActionHelp.Caption);
  { Buttons }
  InitializeSpeedButtons([PanelFileButtons, PanelEditButtons, PanelSearchButtons, PanelViewButtons,
    PanelDocumentButtons, PanelToolsButtons, PanelHelpButtons]);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  LResult: Integer;
begin
  if FOutput.ProcessingTabSheet then
  begin
    if AskYesOrNo(LanguageDataModule.GetYesOrNoMessage('CancelSearch')) then
      FOutput.CancelSearch := True;
    Action := caNone;
    Exit;
  end;

  if FDocument.ModifiedDocuments then
  begin
    LResult := SaveChanges;
    if LResult = mrYes then
      FDocument.SaveAll;
    if LResult = mrCancel then
    begin
      Action := caNone;
      Exit;
    end;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  inherited;

  ReadApplicationParams;

  PageControlToolbar.ActivePage := TabSheetFile;

  CopyIniFilesIntoUserProfile;

  FImageListCount := ImagesDataModule.ImageListSmall.Count; { System images are appended after menu icons for file reopen }
  ReadIniOptions;
  CreateToolbar(True);
  ActionList.Images := ImagesDataModule.ImageList;
  CreateObjects;
  ReadIniSizePositionAndState;
  SetOptions;

  FSQLFormatterDLLFound := FileExists(GetSQLFormatterDLLFilename);

  CreateLanguageMenu(MenuItemToolbarMenuLanguage);

  OptionsContainer.HighlighterStrings := GetHighlighters;
  OptionsContainer.HighlighterColorStrings := GetHighlighterColors;

  MainMenu.Images := ImagesDataModule.ImageListSmall;
  OnSkinChange := ChangeSkin;

  FClipboardHistoryItems := TList<string>.Create;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  if not FNoIni then
  begin
    OptionsContainer.WriteIniFile;
    FDocument.WriteIniFile;
    FDirectory.WriteIniFile;
    FOutput.WriteOutputFile;
    WriteIniFile;
  end;
  FDocument.Free;
  FDirectory.Free;
  FOutput.Free;
  OptionsContainer.Free;
  SQLFormatterOptionsContainer.Free;
  FClipboardHistoryItems.Clear;
  FClipboardHistoryItems.Free;

  inherited;
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssCtrl]) and (Key = 9) then
    FDocument.NextPage;
end;

procedure TMainForm.SetOptions;
var
  LPanelWidth: Integer;
begin
  PanelToolbar.Visible := OptionsContainer.ToolbarVisible;
  PanelMenuBar.Visible := OptionsContainer.MenuBarVisible;
  if OptionsContainer.MainMenuVisible then
    Menu := MainMenu
  else
    Menu := nil;
  { MainMenu }
  if OptionsContainer.MainMenuUseSystemFont then
  begin
    Screen.MenuFont.Name := OptionsContainer.MainMenuSystemFontName;
    Screen.MenuFont.Size := OptionsContainer.MainMenuSystemFontSize;
  end
  else
  begin
    Screen.MenuFont.Name := OptionsContainer.MainMenuFontName;
    Screen.MenuFont.Size := OptionsContainer.MainMenuFontSize;
  end;
  { StatusBar }
  // TODO: use consts instead of numbers
  if OptionsContainer.StatusBarShowMacro then
    StatusBar.Panels[EDITBONE_STATUS_BAR_MACRO_PANEL].Width := ScaleSize(60)
  else
    StatusBar.Panels[EDITBONE_STATUS_BAR_MACRO_PANEL].Width := 0;
  SpeedButtonMacroPlay.Visible := OptionsContainer.StatusBarShowMacro;
  SpeedButtonMacroRecordPause.Visible := OptionsContainer.StatusBarShowMacro;
  SpeedButtonMacroStop.Visible := OptionsContainer.StatusBarShowMacro;

  if OptionsContainer.StatusBarShowCaretPosition then
    StatusBar.Panels[EDITBONE_STATUS_BAR_CARET_POSITION_PANEL].Width := ScaleSize(90)
  else
    StatusBar.Panels[EDITBONE_STATUS_BAR_CARET_POSITION_PANEL].Width := 0;

  if OptionsContainer.StatusBarShowKeyState then
    StatusBar.Panels[EDITBONE_STATUS_BAR_INSERT_KEYSTATE_PANEL].Width := ScaleSize(90)
  else
    StatusBar.Panels[EDITBONE_STATUS_BAR_INSERT_KEYSTATE_PANEL].Width := 0;

  if OptionsContainer.StatusBarShowModified then
  begin
    StatusBar.Panels[EDITBONE_STATUS_BAR_MODIFIED_INFO_PANEL].Width := EDITBONE_STATUS_BAR_PANEL_WIDTH;
    LPanelWidth := StatusBar.Canvas.TextWidth(StatusBar.Panels[EDITBONE_STATUS_BAR_MODIFIED_INFO_PANEL].Text);
    if LPanelWidth > EDITBONE_STATUS_BAR_PANEL_WIDTH then
      StatusBar.Panels[EDITBONE_STATUS_BAR_MODIFIED_INFO_PANEL].Width := LPanelWidth;
  end
  else
    StatusBar.Panels[EDITBONE_STATUS_BAR_MODIFIED_INFO_PANEL].Width := 0;

  OptionsContainer.AssignTo(TitleBar);
  OptionsContainer.AssignTo(StatusBar);
  { Output }
  if Assigned(FOutput) then
    FOutput.SetOptions;
  { Directory }
  if Assigned(FDirectory) then
  begin
    FDirectory.SetOptions;
    ActionDirectoryRefresh.Execute;
  end;
  if OptionsContainer.DirAlign = 0 then { left }
  begin
    PanelDirectory.Align := alLeft;
    SplitterVertical.Align := alLeft;
    SplitterVertical.Left := PanelDirectory.Width + 1;
  end
  else
  begin
    PanelDirectory.Align := alRight;
    SplitterVertical.Align := alRight;
    SplitterVertical.Left := PanelDirectory.Left - 1;
  end;

  if Assigned(FClipboardHistoryItems) then
  while FClipboardHistoryItems.Count > OptionsContainer.ClipboardHistoryItemsCount do
    FClipboardHistoryItems.Delete(FClipboardHistoryItems.Count - 1);
end;

procedure TMainForm.WMCopyData(var Message: TWMCopyData);
var
  LParam: string;
begin
  SetString(LParam, PChar(Message.CopyDataStruct.lpData), (Message.CopyDataStruct.cbData div SizeOf(Char)) - 1);
  FDocument.Open(LParam, nil, 0, 0, True);
  Application.Restore;
  Application.BringToFront;
end;

procedure TMainForm.ReadApplicationParams;
var
  i: Integer;
begin
  FNoIni := False;
  if ParamCount > 0 then
  for i := 1 to ParamCount do
  begin
    if ParamStr(i) = PARAM_NO_INI then
      FNoIni := True
    else
    if ParamStr(i) = PARAM_NO_SKIN then
      SkinManager.Active := False
    else
    if ParamStr(i) = PARAM_APP_INI_PATH then
      GApplicationIniPath := True
  end;
end;

function TMainForm.ReadApplicationParamFiles: Boolean;
var
  i: Integer;
begin
  Result := False;

  FNoIni := False;
  if ParamCount > 0 then
  for i := 1 to ParamCount do
  if (ParamStr(i) <> PARAM_NO_INI) and (ParamStr(i) <> PARAM_NO_SKIN) and (ParamStr(i) <> PARAM_APP_INI_PATH) then
  begin
    FDocument.Open(ParamStr(i), nil, 0, 0, True);
    Result := True;
  end;
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  LEditor: TBCEditor;
  LOpenFilesFound, LParamFilesFound: Boolean;
begin
  inherited;

  LOpenFilesFound := FDocument.ReadIniOpenFiles;
  LParamFilesFound := ReadApplicationParamFiles;

  if not LOpenFilesFound and not LParamFilesFound then
    FDocument.New;

  Self.ReadLanguageFile(GetSelectedLanguage);

  CreateFileReopenList;

  PanelOutput.Visible := PageControlOutput.PageCount > 1;
  if PanelOutput.Visible then
    PanelOutput.Top := StatusBar.Top - PanelOutput.Height; { always top of status bar }

  LEditor := FDocument.GetActiveEditor;
  if Assigned(LEditor) then
    if LEditor.CanFocus then
      LEditor.SetFocus;
end;

procedure TMainForm.StatusBarDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
var
  LRect: TRect;
begin
  inherited;
  if (Panel.Index = 1) and OptionsContainer.StatusBarShowCaretPosition then
  begin
    EBDataModuleImages.ImageListStatusBar.Draw(StatusBar.Canvas, Rect.Left + 2, Rect.Top + 1, 0);

    LRect := Rect;
    LRect.Left := LRect.Left + EBDataModuleImages.ImageListStatusBar.Width + 4;

    if SkinManager.Active then
      acWriteTextEx(StatusBar.Canvas, PACChar(FDocument.CaretInfo), True, LRect, DT_SINGLELINE or DT_VCENTER,
        SkinProvider.SkinData, True)
    else
    begin
      StatusBar.Canvas.Font.Assign(StatusBar.Font);
      StatusBar.Canvas.TextOut(LRect.Left, LRect.Top + 2, FDocument.CaretInfo);
    end;
  end;
end;

procedure TMainForm.TabSheetFindInFilesClickBtn(Sender: TObject);
begin
  inherited;
  SearchFindInFiles;
end;

procedure TMainForm.TabSheetOpenClickBtn(Sender: TObject);
begin
  inherited;
  ActionViewOpenDirectory.Execute;
end;

procedure TMainForm.TimerTimer(Sender: TObject);
begin
  inherited;
  FDocument.CheckFileDateTimes;
end;

procedure TMainForm.TitleBarItems2Click(Sender: TObject);
var
  LPoint: TPoint;
  LFiles: TStrings;

  function GetFiles: TStrings;
  var
    i: Integer;
    LTabSheet: TsTabSheet;
    LName: string;
  begin
    Result := TStringList.Create;
    for i := 0 to PageControlDocument.PageCount - 1 do
    begin
      LTabSheet := PageControlDocument.Pages[i] as TsTabSheet;
      if Assigned(LTabSheet.Editor) then
      begin
        if LTabSheet.Editor.FileName <> '' then
          LName := LTabSheet.Editor.DocumentName
        else
          LName := PageControlDocument.Pages[i].Caption;
        Result.AddObject(LName, TObject(i));
      end;
    end;
  end;

begin
  inherited;

  if not Assigned(FPopupFilesDialog) then
  begin
    FPopupFilesDialog := TPopupFilesDialog.Create(Self);
    FPopupFilesDialog.PopupParent := Self;
    FPopupFilesDialog.OnSelectFile := SelectedFileClick;
  end;

  LPoint := GetTitleBarItemLeftBottom(EDITBONE_TITLE_BAR_FILENAME);
  FPopupFilesDialog.Left := LPoint.X;
  FPopupFilesDialog.Top := LPoint.Y;

  SkinProvider.SkinData.BeginUpdate;
  LFiles := GetFiles;
  try
    FPopupFilesDialog.Execute(LFiles, TitleBar.Items[EDITBONE_TITLE_BAR_FILENAME].Caption);
  finally
    LFiles.Free;
  end;
  SkinProvider.SkinData.EndUpdate;
end;

procedure TMainForm.TitleBarItems4Click(Sender: TObject);
var
  LPoint: TPoint;
begin
  inherited;

  if not Assigned(FPopupEncodingDialog) then
  begin
    FPopupEncodingDialog := TPopupEncodingDialog.Create(Self);
    FPopupEncodingDialog.PopupParent := Self;
    FPopupEncodingDialog.OnSelectEncoding := SelectedEncodingClick;
  end;

  LPoint := GetTitleBarItemLeftBottom(EDITBONE_TITLE_BAR_ENCODING);
  FPopupEncodingDialog.Left := LPoint.X;
  FPopupEncodingDialog.Top := LPoint.Y;

  SkinProvider.SkinData.BeginUpdate;
  FPopupEncodingDialog.Execute(TitleBar.Items[EDITBONE_TITLE_BAR_ENCODING].Caption);
  SkinProvider.SkinData.EndUpdate;
end;

function TMainForm.GetTitleBarItemLeftBottom(AIndex: Integer): TPoint;
var
  LRect: TRect;
begin
  Result.X := TitleBar.Items[AIndex].Rect.Left;
  Result.Y := TitleBar.Items[AIndex].Rect.Bottom;

  if Assigned(TitleBar.Items[AIndex].ExtForm) then
  begin
    Inc(Result.X, TitleBar.Items[AIndex].ExtForm.Left);
    Inc(Result.Y, TitleBar.Items[AIndex].ExtForm.Top);
  end
  else
  begin
    GetWindowRect(Handle, LRect);
    Inc(Result.Y, LRect.Top);
    Inc(Result.X, LRect.Left);
  end;
end;

procedure TMainForm.TitleBarItems6Click(Sender: TObject);
var
  LPoint: TPoint;
begin
  inherited;

  if not Assigned(FPopupHighlighterDialog) then
  begin
    FPopupHighlighterDialog := TPopupHighlighterDialog.Create(Self);
    FPopupHighlighterDialog.PopupParent := Self;
    FPopupHighlighterDialog.OnSelectHighlighter := SelectedHighlighterClick;
  end;

  LPoint := GetTitleBarItemLeftBottom(EDITBONE_TITLE_BAR_HIGHLIGHTER);
  FPopupHighlighterDialog.Left := LPoint.X;
  FPopupHighlighterDialog.Top := LPoint.Y;

  SkinProvider.SkinData.BeginUpdate;
  FPopupHighlighterDialog.Execute(OptionsContainer.HighlighterStrings, TitleBar.Items[EDITBONE_TITLE_BAR_HIGHLIGHTER].Caption);
  SkinProvider.SkinData.EndUpdate;
end;

procedure TMainForm.TitleBarItems8Click(Sender: TObject);
var
  LPoint: TPoint;
begin
  inherited;

  if not Assigned(FPopupHighlighterColorDialog) then
  begin
    FPopupHighlighterColorDialog := TPopupHighlighterColorDialog.Create(Self);
    FPopupHighlighterColorDialog.PopupParent := Self;
    FPopupHighlighterColorDialog.OnSelectHighlighterColor := SelectedHighlighterColorClick;
  end;

  LPoint := GetTitleBarItemLeftBottom(EDITBONE_TITLE_BAR_COLORS);
  FPopupHighlighterColorDialog.Left := LPoint.X;
  FPopupHighlighterColorDialog.Top := LPoint.Y;

  SkinProvider.SkinData.BeginUpdate;
  FPopupHighlighterColorDialog.Execute(OptionsContainer.HighlighterColorStrings, TitleBar.Items[EDITBONE_TITLE_BAR_COLORS].Caption);
  SkinProvider.SkinData.EndUpdate;
end;

procedure TMainForm.ReadIniOptions;
var
  i: Integer;
begin
  OptionsContainer.ReadIniFile;
  SQLFormatterOptionsContainer.ReadIniFile;

  with TIniFile.Create(GetIniFilename) do
  try
    { Options }
    StatusBar.Visible := ReadBool('Options', 'ShowStatusbar', True);
    PanelDirectory.Visible := ReadBool('Options', 'ShowDirectory', False);
    TitleBar.Items[EDITBONE_TITLE_BAR_ENCODING].Visible := ReadBool('Options', 'ShowEncodingSelection', True);
    TitleBar.Items[EDITBONE_TITLE_BAR_HIGHLIGHTER].Visible := ReadBool('Options', 'ShowHighlighterSelection', True);
    TitleBar.Items[EDITBONE_TITLE_BAR_COLORS].Visible := ReadBool('Options', 'ShowHighlighterColorSelection', True);
    SplitterVertical.Visible := PanelDirectory.Visible;

    //ActionViewXMLTree.Checked := OptionsContainer.ShowXMLTree;
    ActionViewWordWrap.Checked := OptionsContainer.WordWrapEnabled;
    ActionViewLineNumbers.Checked := OptionsContainer.LineNumbersEnabled;
    ActionViewSpecialChars.Checked := OptionsContainer.SpecialCharsEnabled;
    ActionViewSelectionMode.Checked := OptionsContainer.SelectionModeEnabled;
    ActionViewEncodingSelection.Checked := TitleBar.Items[EDITBONE_TITLE_BAR_ENCODING].Visible;
    ActionViewHighlighterSelection.Checked := TitleBar.Items[EDITBONE_TITLE_BAR_HIGHLIGHTER].Visible;
    ActionViewColorSelection.Checked := TitleBar.Items[EDITBONE_TITLE_BAR_COLORS].Visible;

    ActionViewSkinSelector.Checked := OptionsContainer.SkinSelectorVisible;

    { if items doesn't exist in ini, create them }
    if not SectionExists('ToolbarItems') then
      for i := 1 to Length(ToolbarItemsArray) do
         WriteString('ToolbarItems', IntToStr(i - 1), ToolbarItemsArray[i]);

    SkinManager.BeginUpdate;
    SkinManager.SkinName := ReadString('Options', 'SelectedSkin', 'Windows 10');
    SkinManager.HueOffset := ReadInteger('Options', 'SkinHueOffset', 0);
    SkinManager.Saturation := ReadInteger('Options', 'SkinSaturation', 10);
    SkinManager.Brightness := ReadInteger('Options', 'SkinBrightness', 0);
    SkinManager.AnimEffects.BlendOnMoving.Active := ReadBool('Options', 'SkinBlendOnMoving', False);
    SkinManager.ExtendedBorders := ReadBool('Options', 'SkinExtendedBorders', True);
    SkinManager.Effects.AllowAnimation := ReadBool('Options', 'SkinAllowAnimation', False);
    SkinManager.Effects.AllowAeroBluring := ReadBool('Options', 'SkinAllowAeroBluring', False);
    SkinManager.Effects.AllowGlowing := ReadBool('Options', 'SkinAllowGlowing', False);
    SkinManager.Effects.AllowOuterEffects := ReadBool('Options', 'SkinAllowOuterEffects', False);
    SkinManager.EndUpdate(True, False);
    UpdatePageControlMargins;
  finally
    Free;
  end;
end;

procedure OutputOpenAllEvent(var FileNames: TStrings);
var
  LIndex: Integer;
  LFileNameCount: Integer;
  LActivePageIndex: Integer;
begin
  Screen.Cursor := crHourGlass;
  try
    LFileNameCount := FileNames.Count;
    LActivePageIndex := MainForm.PageControlDocument.ActivePageIndex;
    MainForm.ProgressBar.Show(LFileNameCount);
    MainForm.PageControlDocument.Visible := False;
    Application.ProcessMessages;
    for LIndex := 0 to LFileNameCount - 1 do
    begin
      MainForm.ProgressBar.StepIt;
      MainForm.FDocument.Open(FileNames.Strings[LIndex], False);
    end;
    MainForm.PageControlDocument.Visible := True;
    if LActivePageIndex = -1 then
      MainForm.PageControlDocument.ActivePage := TsTabSheet(MainForm.PageControlDocument.Pages[0]);
    MainForm.ProgressBar.Hide;
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TMainForm.GetActionList: TObjectList<TAction>;
var
  i: Integer;
  LAction: TAction;
begin
  Result := TObjectList<TAction>.Create;
  for i := 0 to ActionList.ActionCount - 1 do
    if (ActionList.Actions[i].ImageIndex <> -1) and (ActionList.Actions[i].Hint <> '') then
    begin
      LAction := TAction.Create(nil);
      LAction.Name := ActionList.Actions[i].Name;
      LAction.Caption := StringReplace(ActionList.Actions[i].Caption, '&', '', []);
      LAction.ImageIndex := ActionList.Actions[i].ImageIndex;
      Result.Add(LAction);
    end;
end;

procedure TMainForm.CreateObjects;
begin
  { TDocumentFrame }
  FDocument := TEBDocument.Create(PageControlDocument);
  FDocument.PopupMenuEditor := PopupMenuEditor;
  FDocument.PopupMenuXMLTree := PopupMenuXMLTree;
  FDocument.SetBookmarks := SetBookmarks;
  FDocument.SetTitleBarMenuCaptions := SetTitleBarMenuCaptions;
  FDocument.ColorDialog := ColorDialog;
  FDocument.OpenDialog := OpenDialog;
  FDocument.SaveDialog := SaveDialog;
  FDocument.CreateFileReopenList := CreateFileReopenList;
  FDocument.GetActionList := GetActionList;
  FDocument.SkinManager := SkinManager;
  FDocument.StatusBar := StatusBar;
  FDocument.ActionSearchCaseSensitive := ActionSearchCaseSensitive;
  FDocument.ActionSearchTextItems := ActionSearchTextItems;
  FDocument.ActionSearchEngine := ActionSearchEngine;
  FDocument.ActionSearchFindAll := ActionSearchFindAll;
  FDocument.ActionSearchFindPrevious := ActionSearchFindPrevious;
  FDocument.ActionSearchFindNext := ActionSearchFindNext;
  FDocument.ActionSearchInSelection := ActionSearchInSelection;
  FDocument.ActionSearchOptions := ActionSearchOptions;
  FDocument.ActionSearchClose := ActionSearchClose;
  FDocument.ProgressBar := ProgressBar;
  { TEBDirectory }
  FDirectory := TEBDirectory.Create(PageControlDirectory);
  FDirectory.OnFileTreeViewClick := FileTreeViewClickActionExecute;
  FDirectory.OnFileTreeViewDblClick := FileTreeViewDblClickActionExecute;
  FDirectory.OnSearchForFilesOpenFile := DoSearchForFilesOpenFile;
  FDirectory.PopupMenuFileTreeView := PopupMenuFileTreeView;
  FDirectory.SkinManager := SkinManager;
  FDirectory.ReadIniFile;
  { TEBOutput }
  FOutput := TEBOutput.Create(PageControlOutput);
  FOutput.OnTabsheetDblClick := OutputDblClickActionExecute;
  FOutput.OnOpenAll := OutputOpenAllEvent;
  FOutput.SkinManager := SkinManager;
  FOutput.ReadOutputFile;
end;

procedure TMainForm.ReadIniSizePositionAndState;
var
  LState: Integer;
begin
  with TIniFile.Create(GetIniFilename) do
  try
    { Size }
    Width := ReadInteger('Size', 'Width', Round(Screen.Width * 0.8));
    Height := ReadInteger('Size', 'Height', Round(Screen.Height * 0.8));
    { Position }
    Left := ReadInteger('Position', 'Left', (Screen.Width - Width) div 2);
    Top := ReadInteger('Position', 'Top', (Screen.Height - Height) div 2);
    { Check if the form is outside the workarea }
    Left := SetFormInsideWorkArea(Left, Width);
    { Directory }
    PanelDirectory.Width := ReadInteger('Options', 'DirectoryWidth', 321);
    { Output }
    PanelOutput.Height := ReadInteger('Options', 'OutputPanelHeight', 121);
    Application.ProcessMessages;
    { State }
    LState := ReadInteger('Size', 'State', 0);
    case LState of
      0: WindowState := wsNormal;
      1: WindowState := wsMinimized;
      2: { This does not work WindowState := wsMaximized; }
        ShowWindowAsync(Handle, SW_MAXIMIZE);
    end;
  finally
    Free;
  end;
end;

procedure TMainForm.CreateFileReopenList;
var
  LIndex, LFileIndex, LImageIndex: Integer;
  LFileName: string;
  LFiles: TStrings;
  LMenuItem, LMenuItem2: TMenuItem;
  LSystemImageList: TImageList;
  LSysImageList: THandle;
  LIcon: TIcon;
begin
  LSystemImageList := TImageList.Create(nil);
  try
    LSysImageList := GetSysImageList;
    if LSysImageList <> 0 then
      LSystemImageList.Handle := LSysImageList;
    { Remove added images from imagelist }
    while FImageListCount < ImagesDataModule.ImageListSmall.Count do
      ImageList_Remove(ImagesDataModule.ImageListSmall.Handle, FImageListCount);

    PopupMenuFileReopen.Items.Clear;
    MenuItemMainMenuFileReopen.Clear;

    LFiles := TStringList.Create;
    with TIniFile.Create(GetIniFilename) do
    try
      ReadSectionValues('FileReopenFiles', LFiles);
      { Files }
      LFileIndex := 0;
      for LIndex := 0 to LFiles.Count - 1 do
      begin
        LFileName := LFiles.ValueFromIndex[LIndex];
        if FileExists(LFileName) then
        begin
          LMenuItem := TMenuItem.Create(PopupMenuFileReopen);
          LMenuItem2 :=  TMenuItem.Create(MainMenu);
          LMenuItem.OnClick := ActionSelectReopenFileExecute;
          LMenuItem2.OnClick := ActionSelectReopenFileExecute;
          LMenuItem.Caption := Format('%d %s', [LFileIndex, LFileName]);
          LMenuItem2.Caption := LMenuItem.Caption;
          { Add image to imagelist }
          LIcon := TIcon.Create;
          try
            LImageIndex := GetIconIndex(LFileName, SHGFI_ICON or SHGFI_ADDOVERLAYS);
            LSystemImageList.GetIcon(LImageIndex, LIcon);
            LImageIndex := ImageList_AddIcon(ImagesDataModule.ImageListSmall.Handle, LIcon.Handle);
          finally
            LIcon.Free;
          end;
          LMenuItem.ImageIndex := LImageIndex;
          LMenuItem2.ImageIndex := LImageIndex;
          Inc(LFileIndex);

          PopupMenuFileReopen.Items.Add(LMenuItem);
          MenuItemMainMenuFileReopen.Add(LMenuItem2);
        end;
      end;

      { Divider }
      if LFiles.Count > 0 then
      begin
        LMenuItem := TMenuItem.Create(PopupMenuFileReopen);
        LMenuItem.Caption := '-';
        PopupMenuFileReopen.Items.Add(LMenuItem);
        LMenuItem := TMenuItem.Create(MainMenu);
        LMenuItem.Caption := '-';
        MenuItemMainMenuFileReopen.Add(LMenuItem);
        { Clear }
        LMenuItem := TMenuItem.Create(PopupMenuFileReopen);
        LMenuItem.Action := ActionFileReopenProperties;
        PopupMenuFileReopen.Items.Add(LMenuItem);
        LMenuItem := TMenuItem.Create(MainMenu);
        LMenuItem.Action := ActionFileReopenProperties;
        MenuItemMainMenuFileReopen.Add(LMenuItem);
      end;
    finally
      Free;
      LFiles.Free;
    end;
  finally
    LSystemImageList.Free;
  end;
end;

procedure TMainForm.OutputDblClickActionExecute(Sender: TObject);
var
  LFilename: string;
  LLine, LChar: LongWord;
begin
  if FOutput.SelectedLine(LFilename, LLine, LChar) then
    FDocument.Open(LFilename, LLine, LChar);
end;

procedure TMainForm.FileTreeViewClickActionExecute(Sender: TObject);
begin
  if Assigned(FDirectory) then
    StatusBar.Panels[EDITBONE_STATUS_BAR_HINT_PANEL].Text := FDirectory.SelectedFile;
end;

procedure TMainForm.FileTreeViewDblClickActionExecute(Sender: TObject);
var
  LFilename: string;
begin
  LFilename := '';
  if Assigned(FDirectory) then
    LFilename := FDirectory.SelectedFile;
  if LFilename <> '' then
    FDocument.Open(LFilename);
end;

procedure TMainForm.OnAddTreeViewLine(Sender: TObject; const AFilename: string; const ALine, ACharacter: LongInt;
  const AText: string; const ASearchString: string; const ALength: Integer);
begin
  FOutput.AddTreeViewLine(FOutputTreeView, AFilename, ALine, ACharacter, AText, ASearchString, ALength);
end;

procedure TMainForm.OnProgressBarStepFindInFiles(Sender: TObject);
begin
  ProgressBar.StepIt;
end;

procedure TMainForm.SearchFindInFiles(const AFolder: string = '');
var
  LEditor: TBCEditor;
  LFileExtensions: string;
  LCount: Integer;
begin
  FOutputTreeView := nil;
  with FindInFilesDialog do
  begin
    if AFolder <> '' then
      FolderText := AFolder;
    LEditor := FDocument.GetActiveEditor;
    if Assigned(LEditor) then
      if LEditor.SelectionAvailable then
        FindWhatText := LEditor.SelectedText;
    if ShowModal = mrOk then
    begin
      Screen.Cursor := crHourGlass;
      LFileExtensions := GetFileExtensions(OptionsContainer.SupportedFileExtensions);
      try
        StatusBar.Panels[EDITBONE_STATUS_BAR_HINT_PANEL].Text := LanguageDataModule.GetConstant('CountingFiles');
        Application.ProcessMessages;
        LCount := CountFilesInFolder(FolderText, FileTypeText, LFileExtensions);
      finally
        Screen.Cursor := crDefault;
        StatusBar.Panels[EDITBONE_STATUS_BAR_HINT_PANEL].Text := '';
      end;
      ProgressBar.Show(LCount);
      FStopWatch.Reset;
      FStopWatch.Start;
      FOutputTreeView := FOutput.AddTreeView(Format(LanguageDataModule.GetConstant('SearchFor'), [FindWhatText]));
      FOutput.ProcessingTabSheet := True;
      PanelOutput.Visible := True;
      PanelOutput.Top := StatusBar.Top - PanelOutput.Height; { always top of status bar }
      Application.ProcessMessages;
      FFindInFilesThread := TFindInFilesThread.Create(FindWhatText, FileTypeText, FolderText, SearchCaseSensitive,
        WholeWordsOnly, LookInSubfolders, LFileExtensions, SearchEngine);
      FFindInFilesThread.OnTerminate := OnTerminateFindInFiles;
      FFindInFilesThread.OnProgressBarStep := OnProgressBarStepFindInFiles;
      FFindInFilesThread.OnCancelSearch := OnCancelSearch;
      FFindInFilesThread.OnAddTreeViewLine := OnAddTreeViewLine;
      FFindInFilesThread.Start;
    end;
  end;
end;

procedure TMainForm.OnTerminateFindInFiles(Sender: TObject);
var
  LTimeDifference: string;
begin
  ProgressBar.Hide;
  FStopWatch.Stop;
  if not FOutput.CancelSearch then
  begin
    if FFindInFilesThread.Count = 0 then
    begin
      FOutput.AddTreeViewLine(FOutputTreeView, '', -1, 0,
        Format(LanguageDataModule.GetMessage('CannotFindString'), [FFindInFilesThread.FindWhatText]), '', 0);
      StatusBar.Panels[EDITBONE_STATUS_BAR_HINT_PANEL].Text := '';
    end;
    if StrToInt(FormatDateTime('n', FStopWatch.ElapsedMilliseconds / MSecsPerDay)) < 1 then
      LTimeDifference := FormatDateTime(Format('s.zzz "%s"', [LanguageDataModule.GetConstant('Second')]), FStopWatch.ElapsedMilliseconds / MSecsPerDay)
    else
      LTimeDifference := FormatDateTime(Format('n "%s" s.zzz "%s"', [LanguageDataModule.GetConstant('Minute'), LanguageDataModule.GetConstant('Second')]), FStopWatch.ElapsedMilliseconds / MSecsPerDay);
    StatusBar.Panels[EDITBONE_STATUS_BAR_HINT_PANEL].Text := Format(LanguageDataModule.GetConstant('OccurencesFound'), [FFindInFilesThread.Count, LTimeDifference])
  end;
  FOutput.PageControl.EndDrag(False); { if close button pressed and search canceled, dragging will stay... }
  FOutput.ProcessingTabSheet := False;
  FFindInFilesThread := nil;
  SetFields;
end;

function TMainForm.OnCancelSearch: Boolean;
begin
  Result := FOutput.CancelSearch;
end;

procedure TMainForm.WriteIniFile;
begin
  with TIniFile.Create(GetIniFilename) do
  try
    WriteString(Application.Title, 'Version', GetFileVersion(Application.ExeName));
    if WindowState = wsNormal  then
    begin
      { Position }
      WriteInteger('Position', 'Left', Left);
      WriteInteger('Position', 'Top', Top);
      { Size }
      WriteInteger('Size', 'Width', Width);
      WriteInteger('Size', 'Height', Height);
    end;
    WriteInteger('Size', 'State', Ord(WindowState));
    { Options }
    WriteInteger('Options', 'DirectoryWidth', PanelDirectory.Width);
    WriteInteger('Options', 'OutputPanelHeight', PanelOutput.Height);
    WriteBool('Options', 'ShowToolbar', PanelToolbar.Visible);
    WriteBool('Options', 'ShowStatusbar', StatusBar.Visible);
    WriteBool('Options', 'ShowDirectory', PanelDirectory.Visible);
    WriteBool('Options', 'ShowEncodingSelection', TitleBar.Items[EDITBONE_TITLE_BAR_ENCODING].Visible);
    WriteBool('Options', 'ShowHighlighterSelection', TitleBar.Items[EDITBONE_TITLE_BAR_HIGHLIGHTER].Visible);
    WriteBool('Options', 'ShowHighlighterColorSelection', TitleBar.Items[EDITBONE_TITLE_BAR_COLORS].Visible);
    WriteString('Options', 'SelectedSkin', SkinManager.SkinName);
    WriteInteger('Options', 'SkinHueOffset', SkinManager.HueOffset);
    WriteInteger('Options', 'SkinSaturation', SkinManager.Saturation);
    WriteInteger('Options', 'SkinBrightness', SkinManager.Brightness);
    WriteBool('Options', 'SkinBlendOnMoving', SkinManager.AnimEffects.BlendOnMoving.Active);
    WriteBool('Options', 'SkinExtendedBorders', SkinManager.ExtendedBorders);
    WriteBool('Options', 'SkinAllowAnimation', SkinManager.Effects.AllowAnimation);
    WriteBool('Options', 'SkinAllowAeroBluring', SkinManager.Effects.AllowAeroBluring);
    WriteBool('Options', 'SkinAllowGlowing', SkinManager.Effects.AllowGlowing);
    WriteBool('Options', 'SkinAllowOuterEffects', SkinManager.Effects.AllowOuterEffects);
  finally
    Free;
  end;
end;

procedure TMainForm.SetTitleBarMenuCaptions;
var
  LEditor: TBCEditor;
begin
  LEditor := FDocument.GetActiveEditor;
  if Assigned(LEditor) then
  begin
    TitleBar.Items[EDITBONE_TITLE_BAR_ENCODING].Caption := EncodingToText(LEditor.Encoding);
    TitleBar.Items[EDITBONE_TITLE_BAR_HIGHLIGHTER].Caption := LEditor.Highlighter.Name;
    TitleBar.Items[EDITBONE_TITLE_BAR_COLORS].Caption := LEditor.Highlighter.Colors.Name;
  end;
end;

{
procedure TMainForm.ToolsDuplicateCheckerActionExecute(Sender: TObject);
var
  DuplicateChecker: TDuplicateChecker;
begin
  with DuplicateCheckerOptionsDialog do
  try
    Extensions := OptionsContainer.Extensions;
    if Open then
    begin
      DuplicateChecker := TDuplicateChecker.Create(InputFolderName, FileTypeText, OutputFileName, MinBlockSize, MinChars, RemoveComments);
      try
        DuplicateChecker.Run;
        if LaunchAfterCreation then
          FDocument.Open(OutputFileName);
      finally
        DuplicateChecker.Free;
      end;
    end;
  finally
    Free;
  end;
end;

procedure TMainForm.ToolsMapVirtualDrivesActionExecute(Sender: TObject);
begin
  MapVirtualDrivesForm.Open;
  FDirectory.Refresh;
end;
}

end.