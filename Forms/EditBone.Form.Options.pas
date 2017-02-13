unit EditBone.Form.Options;

interface

uses
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, BCCommon.FileUtils, Vcl.StdCtrls,
  System.Classes, System.SysUtils, Vcl.ActnList, BCCommon.Images, BCCommon.Frame.Options.Editor.Color,
  VirtualTrees, BCCommon.Options.Container, System.Generics.Collections, System.UITypes,
  sSkinProvider, BCControl.ScrollBox, BCControl.Splitter, BCControl.Panel, System.Actions, Vcl.ExtCtrls, sScrollBox,
  sSplitter, sPanel;

type
  POptionsRec = ^TOptionsRec;
  TOptionsRec = record
    Index: Integer;
    Caption: string;
    ImageIndex: Integer;
  end;

  TOptionsForm = class(TForm)
    ActionCompare: TAction;
    ActionDirectory: TAction;
    ActionDirectoryTabs: TAction;
    ActionEditor: TAction;
    ActionEditorCaret: TAction;
    ActionEditorCodeFolding: TAction;
    ActionEditorColors: TAction;
    ActionEditorCompletionProposal: TAction;
    ActionEditorDefaults: TAction;
    ActionEditorFonts: TAction;
    ActionEditorLeftMargin: TAction;
    ActionEditorMatchingPair: TAction;
    ActionEditorMinimap: TAction;
    ActionEditorRightMargin: TAction;
    ActionEditorScroll: TAction;
    ActionEditorSearch: TAction;
    ActionEditorSelection: TAction;
    ActionEditorSpecialChars: TAction;
    ActionEditorTabs: TAction;
    ActionEditorTabulator: TAction;
    ActionFileTypes: TAction;
    ActionList: TActionList;
    ActionMainMenu: TAction;
    ActionOutput: TAction;
    ActionOutputTabs: TAction;
    ActionPrint: TAction;
    ActionSQLAlignments: TAction;
    ActionSQLCapitalization: TAction;
    ActionSQLFormatter: TAction;
    ActionSQLIndentation: TAction;
    ActionSQLInsert: TAction;
    ActionSQLSelect: TAction;
    ActionSQLUpdate: TAction;
    ActionSQLWhitespace: TAction;
    ActionStatusBar: TAction;
    ActionToolbar: TAction;
    ButtonCancel: TButton;
    ButtonOK: TButton;
    OptionsPanel: TBCPanel;
    PanelButton: TBCPanel;
    PanelTop: TBCPanel;
    ScrollBox: TBCScrollBox;
    SkinProvider: TsSkinProvider;
    Splitter: TBCSplitter;
    ActionEditorSyncEdit: TAction;
    ActionEditorWordWrap: TAction;
    VirtualDrawTreeOptions: TVirtualDrawTree;
    ActionTitleBar: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure VirtualDrawTreeOptionsClick(Sender: TObject);
    procedure VirtualDrawTreeOptionsFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeOptionsDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeOptionsGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; var NodeWidth: Integer);
    procedure VirtualDrawTreeOptionsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure VirtualDrawTreeOptionsGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind;
      Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: TImageIndex);
  private
    FActionList: TObjectList<TAction>;
    FSQLFormatterDLLFound: Boolean;
    procedure CreateTree;
    procedure ReadIniFile;
    procedure SaveSelectedTreeNode;
    procedure SetVisibleFrame;
    procedure WriteIniFile;
  public
    function Execute(ActionList: TObjectList<TAction>): Boolean;
  end;

function OptionsForm: TOptionsForm;

implementation

{$R *.dfm}

uses
  System.IniFiles, System.Math, BCCommon.Language.Utils, BCCommon.Utils, Winapi.Windows,
  System.Types, BCCommon.Frame.Options.Editor.Minimap, BCCommon.Frame.Options.Editor.Scroll,
  BCCommon.Frame.Options.Editor.Selection, BCCommon.Frame.Options.Editor.SpecialChars,
  BCCommon.Frame.Options.Editor.Tabulator, EditBone.Frame.Options.Editor.Defaults,
  BCCommon.Options.Container.SQL.Formatter, EditBone.Frame.Options.Editor.TabSheet,
  BCCommon.Frame.Options.Editor.CompletionProposal, BCCommon.Frame.Options.Editor.Caret,
  BCCommon.Frame.Options.Editor.CodeFolding, BCCommon.Frame.Options.Editor.MatchingPair,
  BCCommon.Frame.Options.Editor.Search, BCCommon.Frame.Options.Editor.Options, BCCommon.Frame.Options.Editor.Font,
  BCCommon.Frame.Options.Editor.LeftMargin, BCCommon.Frame.Options.Editor.RightMargin,
  EditBone.Frame.Options.FileTypes, EditBone.Frame.Options.Directory, EditBone.Frame.Options.Directory.TabSheet,
  EditBone.Frame.Options.Output.TabSheet, BCCommon.Frame.Options.Compare, BCCommon.Frame.Options.Editor.SyncEdit,
  BCCommon.Frame.Options.MainMenu, BCCommon.Frame.Options.StatusBar, BCCommon.Frame.Options.TitleBar,
  BCCommon.Frame.Options.Output, BCCommon.Frame.Options.Toolbar, BCCommon.Frame.Options.Print,
  BCCommon.Frame.Options.Editor.WordWrap, BCCommon.Frame.Options.SQL.Select, BCCommon.Frame.Options.SQL.Alignments,
  BCCommon.Frame.Options.SQL.Insert, BCCommon.Frame.Options.SQL.Update, BCCommon.Frame.Options.SQL.Whitespace,
  BCCommon.Frame.Options.SQL.Capitalization, BCCommon.Frame.Options.SQL.Indentation,
  BCCommon.Frame.Options.SQL.Formatter;

var
  FOptionsForm: TOptionsForm;

{ TOptionsDialog }

function OptionsForm: TOptionsForm;
begin
  if not Assigned(FOptionsForm) then
    Application.CreateForm(TOptionsForm, FOptionsForm);
  Result := FOptionsForm;
end;

procedure TOptionsForm.FormDestroy(Sender: TObject);
begin
  FOptionsForm := nil;
end;

procedure TOptionsForm.CreateTree;
var
  i: Integer;
  Data: POptionsRec;
  Node, ChildNode: PVirtualNode;
begin
  with VirtualDrawTreeOptions do
  begin
    Images := ImagesDataModule.ImageListSmall;
    NodeDataSize := SizeOf(TOptionsRec);

    Clear;
    i := 0;

    DefaultNodeHeight := Max(Canvas.TextHeight('Tg'), 18);

    { Editor }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditor.ImageIndex;
    Data.Caption := ActionEditor.Caption;
    { Editor caret }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorCaret.ImageIndex;
    Data.Caption := ActionEditorCaret.Caption;
    { Editor code folding }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorCodeFolding.ImageIndex;
    Data.Caption := ActionEditorCodeFolding.Caption;
    { Editor color }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorColors.ImageIndex;
    Data.Caption := ActionEditorColors.Caption;
    { Editor completion proposal }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorCompletionProposal.ImageIndex;
    Data.Caption := ActionEditorCompletionProposal.Caption;
    { Editor defaults }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex :=  ActionEditorDefaults.ImageIndex;
    Data.Caption :=  ActionEditorDefaults.Caption;
    { Editor font }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorFonts.ImageIndex;
    Data.Caption := ActionEditorFonts.Caption;
    { Editor left margin }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorLeftMargin.ImageIndex;
    Data.Caption := ActionEditorLeftMargin.Caption;
    { Editor matching pair }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorMatchingPair.ImageIndex;
    Data.Caption := ActionEditorMatchingPair.Caption;
    { Editor minimap }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorMinimap.ImageIndex;
    Data.Caption := ActionEditorMinimap.Caption;
    { Editor right margin }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorRightMargin.ImageIndex;
    Data.Caption := ActionEditorRightMargin.Caption;
    { Editor scroll }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorScroll.ImageIndex;
    Data.Caption := ActionEditorScroll.Caption;
    { Editor search }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorSearch.ImageIndex;
    Data.Caption := ActionEditorSearch.Caption;
    { Editor selection }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorSelection.ImageIndex;
    Data.Caption := ActionEditorSelection.Caption;
    { Editor special chars }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorSpecialChars.ImageIndex;
    Data.Caption := ActionEditorSpecialChars.Caption;
    { Editor sync edit }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorSyncEdit.ImageIndex;
    Data.Caption := ActionEditorSyncEdit.Caption;
    { Editor tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorTabs.ImageIndex;
    Data.Caption := ActionEditorTabs.Caption;
    { Editor tabulator }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorTabulator.ImageIndex;
    Data.Caption := ActionEditorTabulator.Caption;
    { Editor word wrap }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorWordWrap.ImageIndex;
    Data.Caption := ActionEditorWordWrap.Caption;

    Node.ChildCount := VirtualDrawTreeOptions.ChildCount[Node];
    VirtualDrawTreeOptions.Selected[Node] := True;
    VirtualDrawTreeOptions.Expanded[Node] := True;
    { Directory }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionDirectory.ImageIndex;
    Data.Caption := ActionDirectory.Caption;
    { Directory tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionDirectoryTabs.ImageIndex;
    Data.Caption := ActionDirectoryTabs.Caption;
    Node.ChildCount := VirtualDrawTreeOptions.ChildCount[Node];
    VirtualDrawTreeOptions.Selected[Node] := True;
    VirtualDrawTreeOptions.Expanded[Node] := True;
    { Output }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionOutput.ImageIndex;
    Data.Caption := ActionOutput.Caption;
    { Output tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionOutputTabs.ImageIndex;
    Data.Caption := ActionOutputTabs.Caption;
    Node.ChildCount := VirtualDrawTreeOptions.ChildCount[Node];
    VirtualDrawTreeOptions.Selected[Node] := True;
    VirtualDrawTreeOptions.Expanded[Node] := True;
    { Compare }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionCompare.ImageIndex;
    Data.Caption := ActionCompare.Caption;
    { Print }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionPrint.ImageIndex;
    Data.Caption := ActionPrint.Caption;
    { Main menu }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionMainMenu.ImageIndex;
    Data.Caption := ActionMainMenu.Caption;
    { Toolbar }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionToolbar.ImageIndex;
    Data.Caption := ActionToolbar.Caption;
    { Status Bar }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionStatusBar.ImageIndex;
    Data.Caption := ActionStatusBar.Caption;
    { Title Bar }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionTitleBar.ImageIndex;
    Data.Caption := ActionTitleBar.Caption;
    { File types }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionFileTypes.ImageIndex;
    Data.Caption := ActionFileTypes.Caption;
    if FSQLFormatterDLLFound then
    begin
      { SQL Formatter }
      Node := AddChild(nil);
      Data := GetNodeData(Node);
      Data.Index := PostInc(i);
      Data.ImageIndex := ActionSQLFormatter.ImageIndex;
      Data.Caption := ActionSQLFormatter.Caption;
      { Alignments }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := ActionSQLAlignments.ImageIndex;
      Data.Caption := ActionSQLAlignments.Caption;
      { Capitalization }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := ActionSQLCapitalization.ImageIndex;
      Data.Caption := ActionSQLCapitalization.Caption;
      { Indentation }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := ActionSQLIndentation.ImageIndex;
      Data.Caption := ActionSQLIndentation.Caption;
      { Insert }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := ActionSQLInsert.ImageIndex;
      Data.Caption := ActionSQLInsert.Caption;
      { Select }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := ActionSQLSelect.ImageIndex;
      Data.Caption := ActionSQLSelect.Caption;
      { Update }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := ActionSQLUpdate.ImageIndex;
      Data.Caption := ActionSQLUpdate.Caption;
      { Whitespace }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := ActionSQLWhitespace.ImageIndex;
      Data.Caption := ActionSQLWhitespace.Caption;

      Node.ChildCount := VirtualDrawTreeOptions.ChildCount[Node];
      VirtualDrawTreeOptions.Selected[Node] := True;
      VirtualDrawTreeOptions.Expanded[Node] := True;
    end;

    Selected[GetFirst] := True;
  end;
end;

function TOptionsForm.Execute(ActionList: TObjectList<TAction>): Boolean;
begin
  FActionList := ActionList;
  try
    //ReadIniFile;
    UpdateLanguage(Self, GetSelectedLanguage);
    Result := Showmodal = mrOk;
    WriteIniFile;
    SaveSelectedTreeNode;
  finally
    Free; { Do not use Release for this. Options need to be set before updating the editor. }
  end;
  if Result then
    SQLFormatterOptionsContainer.WriteIniFile; { this is written here because dll is reading settings from the ini file }
end;

procedure TOptionsForm.SaveSelectedTreeNode;
var
  Node: PVirtualNode;
  Data: POptionsRec;
begin
  with TIniFile.Create(GetIniFilename) do
  try
    Node := VirtualDrawTreeOptions.GetFirstSelected;
    Data := VirtualDrawTreeOptions.GetNodeData(Node);
    WriteInteger('Options', 'OptionsSelectedItemIndex', Data.Index);
  finally
    Free;
  end;
end;

procedure TOptionsForm.VirtualDrawTreeOptionsClick(Sender: TObject);
begin
  SetVisibleFrame;
end;

procedure TOptionsForm.VirtualDrawTreeOptionsDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
var
  Data: POptionsRec;
  S: string;
  R: TRect;
  Format: Cardinal;
begin
  with Sender as TVirtualDrawTree, PaintInfo do
  begin
    Data := Sender.GetNodeData(Node);

    if not Assigned(Data) then
      Exit;

    if Assigned(SkinProvider.SkinData) and Assigned(SkinProvider.SkinData.SkinManager) then
      Canvas.Font.Color := SkinProvider.SkinData.SkinManager.GetActiveEditFontColor
    else
      Canvas.Font.Color := clWindowText;

    if vsSelected in PaintInfo.Node.States then
    begin
      if Assigned(SkinProvider.SkinData) and Assigned(SkinProvider.SkinData.SkinManager) then
        Canvas.Font.Color := SkinProvider.SkinData.SkinManager.GetHighLightFontColor
      else
        Canvas.Font.Color := clHighlightText;
    end;

    SetBKMode(Canvas.Handle, TRANSPARENT);

    R := ContentRect;
    InflateRect(R, -TextMargin, 0);
    Dec(R.Right);
    Dec(R.Bottom);
    S := Data.Caption;

    if Length(S) > 0 then
    begin
      Format := DT_TOP or DT_LEFT or DT_VCENTER or DT_SINGLELINE;
      DrawText(Canvas.Handle, S, Length(S), R, Format)
    end;
  end;
end;

procedure TOptionsForm.SetVisibleFrame;
var
  LIndex, LLevel, LParentIndex: Integer;
  LTreeNode: PVirtualNode;
begin
  inherited;
  LTreeNode := VirtualDrawTreeOptions.GetFirstSelected;
  if Assigned(LTreeNode) then
  begin
    LLevel := VirtualDrawTreeOptions.GetNodeLevel(LTreeNode);
    LParentIndex := -1;
    if LLevel = 1 then
      LParentIndex := LTreeNode.Parent.Index;
    for LIndex := 0 to ComponentCount - 1 do
      if Components[LIndex] is TFrame then
        (Components[LIndex] as TFrame).Hide;

    { don't set the visibility value with the condition because the frame is created }
    case LLevel of
      0:
        case LTreeNode.Index of
          0: OptionsEditorOptionsFrame(Self).ShowFrame;
          1: OptionsDirectoryFrame(Self).ShowFrame;
          2: OptionsOutputFrame(Self).ShowFrame;
          3: OptionsCompareFrame(Self).ShowFrame;
          4: OptionsPrintFrame(Self).ShowFrame;
          5: OptionsMainMenuFrame(Self).ShowFrame;
          6: OptionsToolbarFrame(Self, FActionList).Show;
          7: OptionsStatusBarFrame(Self).ShowFrame;
          8: OptionsTitleBarFrame(Self).ShowFrame;
          9: OptionsFileTypesFrame(Self).ShowFrame;
          10:
            if FSQLFormatterDLLFound then
              OptionsSQLFormatterFrame(Self).ShowFrame;
        end;
      1:
        case LParentIndex of
          0:
            case LTreeNode.Index of
              0: OptionsEditorCaretFrame(Self).ShowFrame;
              1: OptionsEditorCodeFoldingFrame(Self).ShowFrame;
              2: OptionsEditorColorFrame(Self).ShowFrame;
              3: OptionsEditorCompletionProposalFrame(Self).ShowFrame;
              4: OptionsEditorDefaultsFrame(Self).ShowFrame;
              5: OptionsEditorFontFrame(Self).ShowFrame;
              6: OptionsEditorLeftMarginFrame(Self).ShowFrame;
              7: OptionsEditorMatchingPairFrame(Self).ShowFrame;
              8: OptionsEditorMinimapFrame(Self).ShowFrame;
              9: OptionsEditorRightMarginFrame(Self).ShowFrame;
              10: OptionsEditorScrollFrame(Self).ShowFrame;
              11: OptionsEditorSearchFrame(Self).ShowFrame;
              12: OptionsEditorSelectionFrame(Self).ShowFrame;
              13: OptionsEditorSpecialCharsFrame(Self).ShowFrame;
              14: OptionsEditorSyncEditFrame(Self).ShowFrame;
              15: OptionsEditorTabsFrame(Self).ShowFrame;
              16: OptionsEditorTabulatorFrame(Self).ShowFrame;
              17: OptionsEditorWordWrapFrame(Self).ShowFrame;
            end;
          1:
            OptionsDirectoryTabsFrame(Self).ShowFrame;
          2:
            OptionsOutputTabsFrame(Self).ShowFrame;
          10:
            if FSQLFormatterDLLFound then
            case LTreeNode.Index of
              0: OptionsSQLAlignmentsFrame(Self).ShowFrame;
              1: OptionsSQLCapitalizationFrame(Self).ShowFrame;
              2: OptionsSQLIndentationFrame(Self).ShowFrame;
              3: OptionsSQLInsertFrame(Self).ShowFrame;
              4: OptionsSQLSelectFrame(Self).ShowFrame;
              5: OptionsSQLUpdateFrame(Self).ShowFrame;
              6: OptionsSQLWhitespaceFrame(Self).ShowFrame;
            end;
        end;
    end;
  end;
end;

procedure TOptionsForm.VirtualDrawTreeOptionsFreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  Data: POptionsRec;
begin
  Data := Sender.GetNodeData(Node);
  Finalize(Data^);
  inherited;
end;

procedure TOptionsForm.VirtualDrawTreeOptionsGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: TImageIndex);
var
  Data: POptionsRec;
begin
  inherited;
  if Kind = ikState then
    Exit;
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    ImageIndex := Data.ImageIndex;
end;

procedure TOptionsForm.VirtualDrawTreeOptionsGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
var
  Data: POptionsRec;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    NodeWidth := Canvas.TextWidth(Trim(Data.Caption)) + 2;
end;

procedure TOptionsForm.VirtualDrawTreeOptionsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  SetVisibleFrame;
end;

procedure TOptionsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  OptionsContainer.SupportedFileExtensions(True);
end;

procedure TOptionsForm.ReadIniFile;
begin
  with TMemIniFile.Create(GetIniFilename) do
  try
    { Size }
    Width := ReadInteger('OptionsSize', 'Width', Width);
    Height := ReadInteger('OptionsSize', 'Height', Height);
    { Position }
    Left := ReadInteger('OptionsPosition', 'Left', (Screen.Width - Width) div 2);
    Top := ReadInteger('OptionsPosition', 'Top', (Screen.Height - Height) div 2);
    { Check if the form is outside the workarea }
    Left := SetFormInsideWorkArea(Left, Width);
    { Tree width }
    VirtualDrawTreeOptions.Width := ReadInteger('OptionsSize', 'TreeWidth', VirtualDrawTreeOptions.Width);
  finally
    Free;
  end;
end;

procedure TOptionsForm.WriteIniFile;
begin
  if Windowstate = wsNormal then
  with TMemIniFile.Create(GetIniFilename) do
  try
    { Size }
    WriteInteger('OptionsSize', 'Width', Width);
    WriteInteger('OptionsSize', 'Height', Height);
    { Position }
    WriteInteger('OptionsPosition', 'Left', Left);
    WriteInteger('OptionsPosition', 'Top', Top);
    { Tree width }
    WriteInteger('OptionsSize', 'TreeWidth', VirtualDrawTreeOptions.Width);
  finally
    UpdateFile;
    Free;
  end;
end;

procedure TOptionsForm.FormCreate(Sender: TObject);
begin
  inherited;

  //VirtualDrawTreeOptions.NodeDataSize := SizeOf(TOptionsRec);
  { IDE can lose these properties }
  ActionList.Images := ImagesDataModule.ImageListSmall;
  //VirtualDrawTreeOptions.Images := ImagesDataModule.ImageListSmall;
  FSQLFormatterDLLFound := FileExists(GetSQLFormatterDLLFilename);
end;

procedure TOptionsForm.FormShow(Sender: TObject);
var
  SelectedItemIndex: Integer;
  Node: PVirtualNode;

  function FindItem(CurrentNode: PVirtualNode; ItemIndex: Integer): PVirtualNode;
  var
    Data: POptionsRec;
  begin
    Data := VirtualDrawTreeOptions.GetNodeData(CurrentNode);
    while Assigned(CurrentNode) and (Data.Index <> ItemIndex) do
    begin
      CurrentNode := VirtualDrawTreeOptions.GetNext(CurrentNode);
      Data := VirtualDrawTreeOptions.GetNodeData(CurrentNode);
    end;
    Result := CurrentNode;
  end;

begin
  inherited;

  CreateTree;
  ReadIniFile;

  with TIniFile.Create(GetIniFilename) do
  try
    SelectedItemIndex := ReadInteger('Options', 'OptionsSelectedItemIndex', 0);
  finally
    Free;
  end;
  Node := FindItem(VirtualDrawTreeOptions.GetFirst, SelectedItemIndex);
  if Assigned(Node) then
  begin
    VirtualDrawTreeOptions.Selected[Node] := True;
    VirtualDrawTreeOptions.ScrollIntoView(Node, True);
  end;
  SetVisibleFrame;
end;

end.




