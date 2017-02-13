unit EditBone.Output;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.ComCtrls, EditBone.Types,
  VirtualTrees, BCComponent.SkinManager, BCControl.PageControl, BCCommon.Images, sPageControl;

type
  TEBOutput = class(TObject)
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; var NodeWidth: Integer);
    procedure VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode;
      var InitialStates: TVirtualNodeInitStates);
    procedure TabsheetDblClick(Sender: TObject);
  private
    FCancelSearch: Boolean;
    FProcessingTabSheet: Boolean;
    FProcessingPage: TsTabSheet;
    FTabsheetDblClick: TNotifyEvent;
    FOpenAll: TOpenAllEvent;
    FRootNode: PVirtualNode;
    FPageControl: TBCPageControl;
    FTabSheetFindInFiles: TTabSheet;
    FSkinManager: TBCSkinManager;
    function GetOutputTreeView(ATabSheet: TTabSheet): TVirtualDrawTree;
    function TabFound(const ATabCaption: string): Boolean;
    function CheckCancel(const ATabIndex: Integer = -1): Boolean;
  public
    constructor Create(AOwner: TBCPageControl);
    function CloseTabSheet(const AFreePage: Boolean = True; const ATabIndex: Integer = -1): Boolean;
    function SelectedLine(var AFilename: string; var ALine: LongWord; var ACharacter: LongWord): Boolean;
    function AddTreeView(const ATabCaption: string): TVirtualDrawTree;
    procedure AddTreeViewLine(AOutputTreeView: TVirtualDrawTree; const AFilename: string; const ALine, ACharacter: LongInt;
      const AText: string; const ASearchString: string; const ALength: Integer);
    procedure ReadOutputFile;
    procedure SetOptions;
    procedure WriteOutputFile;
    procedure CloseAllOtherTabSheets;
    procedure CloseAllTabSheets;
    procedure CopyToClipboard(const AOnlySelected: Boolean = False);
    procedure SetProcessingTabSheet(const AValue: Boolean);
    procedure OpenFiles(const AOnlySelected: Boolean = False);
    procedure SetCheckedState(const AValue: TCheckState);
    property OnTabsheetDblClick: TNotifyEvent read FTabsheetDblClick write FTabsheetDblClick;
    property OnOpenAll: TOpenAllEvent read FOpenAll write FOpenAll;
    property ProcessingTabSheet: Boolean read FProcessingTabSheet write SetProcessingTabSheet;
    property CancelSearch: Boolean read FCancelSearch write FCancelSearch;
    property SkinManager: TBCSkinManager read FSkinManager write FSkinManager;
    property PageControl: TBCPageControl read FPageControl;
  end;

implementation

uses
  BCCommon.Options.Container, System.UITypes, System.Math, Vcl.Clipbrd, BCCommon.Messages,
  BCCommon.Language.Strings, BCCommon.FileUtils, BCCommon.Consts, BCCommon.StringUtils, System.Types,
  BCControl.Panel;

constructor TEBOutput.Create(AOwner: TBCPageControl);
begin
  inherited Create;
  FPageControl := AOwner;
  FTabSheetFindInFiles := AOwner.Pages[0];
end;

procedure TEBOutput.TabsheetDblClick(Sender: TObject);
begin
  if Assigned(FTabsheetDblClick) then
    FTabsheetDblClick(Sender);
end;

procedure TEBOutput.OpenFiles(const AOnlySelected: Boolean);
var
  LFileNames: TStrings;

  procedure GetFileNames;
  var
    LOutputTreeView: TVirtualDrawTree;
    LNode: PVirtualNode;
    LData: POutputRec;
  begin
    LOutputTreeView := GetOutputTreeView(PageControl.ActivePage);
    LNode := LOutputTreeView.GetFirst;
    while Assigned(LNode) do
    begin
      if not AOnlySelected or AOnlySelected and (LOutputTreeView.CheckState[LNode] = csCheckedNormal) then
      begin
        LData := LOutputTreeView.GetNodeData(LNode);
        LFileNames.Add(LData.FileName);
      end;
      LNode := LNode.NextSibling;
    end;
  end;

begin
  if Assigned(FOpenAll) then
  begin
    LFileNames := TStringList.Create;
    try
      GetFileNames;
      FOpenAll(LFileNames);
    finally
      LFileNames.Free;
    end;
  end;
end;

function TEBOutput.TabFound(const ATabCaption: string): Boolean;
var
  i: Integer;
begin
  Result := False;
  { check if there already is a tab with same name }
  for i := 0 to PageControl.PageCount - 1 do
  if Trim(PageControl.Pages[i].Caption) = ATabCaption then
  begin
    PageControl.ActivePageIndex := i;
    Result := True;
    Break;
  end;
end;

function TEBOutput.AddTreeView(const ATabCaption: string): TVirtualDrawTree;
var
  LTabSheet: TsTabSheet;
  LVirtualDrawTree: TVirtualDrawTree;
  //LPanel: TBCPanel;
  LTabCaption: string;
begin
  LTabCaption := StringReplace(ATabCaption, '&', '&&', [rfReplaceAll]);
  { check if there already is a tab with same name }
  if TabFound(LTabCaption) then
  begin
    Result := GetOutputTreeView(PageControl.ActivePage);
    if Assigned(Result) then
    begin
      Result.Clear;
      Result.Tag := 0;
    end;
    Exit;
  end;

  LTabSheet := TsTabSheet.Create(PageControl);
  LTabSheet.PageControl := PageControl;

  if Assigned(FTabSheetFindInFiles) then
    FTabSheetFindInFiles.PageIndex := FPageControl.PageCount - 1;

  LTabSheet.TabVisible := False;
  LTabSheet.ImageIndex := IMAGE_INDEX_FIND_IN_FILES;
  LTabSheet.Caption := LTabCaption;
  PageControl.ActivePage := LTabSheet;

  LVirtualDrawTree := TVirtualDrawTree.Create(LTabSheet);
  with LVirtualDrawTree do
  begin
    Parent := LTabSheet;
    Align := alClient;

    AlignWithMargins := True;
    Margins.Left := 2;
    Margins.Top := 2;
    if FSkinManager.Active then
      Margins.Right := 2
    else
      Margins.Right := 4;
    Margins.Bottom := 2;

    TreeOptions.AutoOptions := [toAutoDropExpand, toAutoScroll, toAutoChangeScale, toAutoScrollOnExpand, toAutoTristateTracking];
    TreeOptions.MiscOptions := [toCheckSupport, toFullRepaintOnResize, toToggleOnDblClick, toWheelPanning];
    TreeOptions.PaintOptions := [toHideFocusRect, toShowButtons, toShowRoot, toThemeAware, toGhostedIfUnfocused];
    TreeOptions.SelectionOptions := [toFullRowSelect, toMiddleClickSelect];
    OnDrawNode := VirtualDrawTreeDrawNode;
    OnFreeNode := VirtualDrawTreeFreeNode;
    OnGetNodeWidth := VirtualDrawTreeGetNodeWidth;
    OnInitNode := VirtualDrawTreeInitNode;
    OnDblClick := TabsheetDblClick;
    NodeDataSize := SizeOf(TOutputRec);

    DefaultNodeHeight := Max(Canvas.TextHeight('Tg'), 18);

    Indent := OptionsContainer.OutputIndent;
    if OptionsContainer.OutputUseExplorerTheme then
      TreeOptions.PaintOptions := TreeOptions.PaintOptions + [toUseExplorerTheme]
    else
      TreeOptions.PaintOptions := TreeOptions.PaintOptions - [toUseExplorerTheme];
    if OptionsContainer.OutputShowTreeLines then
      TreeOptions.PaintOptions := TreeOptions.PaintOptions + [toShowTreeLines]
    else
      TreeOptions.PaintOptions := TreeOptions.PaintOptions - [toShowTreeLines];
  end;
  Result := LVirtualDrawTree;
  LTabSheet.TabVisible := True;
end;

procedure TEBOutput.VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
var
  LData: POutputRec;
  S, Temp: string;
  LRect: TRect;
  LFormat: Cardinal;
  LColor: TColor;
begin
  with Sender as TVirtualDrawTree, PaintInfo do
  begin
    LData := Sender.GetNodeData(Node);

    if not Assigned(LData) then
      Exit;

    if Assigned(FSkinManager) then
      LColor := FSkinManager.GetActiveEditFontColor
    else
      LColor := clWindowText;

    if vsSelected in PaintInfo.Node.States then
    begin
      if Assigned(FSkinManager) then
        LColor := FSkinManager.GetHighLightFontColor
      else
        LColor := clHighlightText;
    end;
    Canvas.Font.Color := LColor;

    if LData.Level = 0 then
      Canvas.Font.Style := Canvas.Font.Style + [fsBold]
    else
      Canvas.Font.Style := Canvas.Font.Style - [fsBold];

    SetBKMode(Canvas.Handle, TRANSPARENT);

    LRect := ContentRect;
    InflateRect(LRect, -TextMargin, 0);
    Dec(LRect.Right);
    Dec(LRect.Bottom);
    if LData.Level = 2 then
      LRect.Left := 4;

    if (LData.Level = 0) or (LData.Level = 2) then
      S := LData.Filename
    else
      S := LData.Text;

    if Length(S) > 0 then
    begin
      LFormat := DT_TOP or DT_LEFT or DT_VCENTER or DT_SINGLELINE;
      if (LData.Level = 0) or (LData.Level = 2) or (LData.SearchString = '') then
      begin
        if LData.Level = 0 then
          S := System.SysUtils.Format('%s [%d]', [S, Node.ChildCount]);
        if LData.Level = 1 then
          S := System.SysUtils.Format('%s (%d, %d): ', [ExtractFilename(LData.Filename), LData.Line +
            OptionsContainer.LeftMarginLineNumbersStartFrom, LData.Character]) + S;
        DrawText(Canvas.Handle, S, Length(S), LRect, LFormat)
      end
      else
      begin
        S := LData.Text;
        S := System.Copy(S, 0, LData.TextCharacter - 1);
        S := System.SysUtils.Format('%s (%d, %d): ', [ExtractFilename(LData.Filename), LData.Line +
          OptionsContainer.LeftMarginLineNumbersStartFrom, LData.Character]) + S;
        DrawText(Canvas.Handle, S, Length(S), LRect, LFormat);
        S := StringReplace(S, Chr(9), '', [rfReplaceAll]); { replace tabs }
        Inc(LRect.Left, Canvas.TextWidth(S));
        Canvas.Font.Color := clRed;
        S := Copy(LData.Text, LData.TextCharacter, LData.Length);
        Temp := StringReplace(S, '&', '&&', [rfReplaceAll]);
        Canvas.Font.Style := Canvas.Font.Style + [fsBold];
        DrawText(Canvas.Handle, Temp, Length(Temp), LRect, LFormat);
        Canvas.Font.Color := LColor;
        inc(LRect.Left, Canvas.TextWidth(S));
        Canvas.Font.Style := Canvas.Font.Style - [fsBold];
        S := System.Copy(LData.Text, Integer(LData.TextCharacter) + LData.Length, Length(LData.Text));
        DrawText(Canvas.Handle, S, Length(S), LRect, LFormat);
      end;
    end;
  end;
end;

procedure TEBOutput.VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree;
  HintCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
var
  LData: POutputRec;
  LMargin, LBoldWidth: Integer;
  S: string;
begin
  with Sender as TVirtualDrawTree do
  begin
    LMargin := TextMargin;
    LData := Sender.GetNodeData(Node);
    if Assigned(LData) then
    case LData.Level of
      0: begin
           Canvas.Font.Style := Canvas.Font.Style + [fsBold];
           NodeWidth := Canvas.TextWidth(Trim(Format('%s [%d]', [LData.FileName, Node.ChildCount]))) + 2 * LMargin;
         end;
      1: begin
           S := System.SysUtils.Format('%s (%d, %d): ', [ExtractFilename(LData.Filename), LData.Line, LData.Character]);
           Canvas.Font.Style := Canvas.Font.Style + [fsBold];
           LBoldWidth := Canvas.TextWidth(LData.SearchString);
           Canvas.Font.Style := Canvas.Font.Style - [fsBold];
           LBoldWidth := LBoldWidth - Canvas.TextWidth(LData.SearchString);
           NodeWidth := Canvas.TextWidth(Trim(S + LData.Text)) + 2 * LMargin + LBoldWidth;
         end;
    end;
  end;
end;

procedure TEBOutput.VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: POutputRec;
begin
  Data := Sender.GetNodeData(Node);
  Finalize(Data^);
  inherited;
end;

procedure TEBOutput.AddTreeViewLine(AOutputTreeView: TVirtualDrawTree; const AFilename: string; const ALine, ACharacter: LongInt;
  const AText: string; const ASearchString: string; const ALength: Integer);
var
  LNode, LLastNode: PVirtualNode;
  LNodeData: POutputRec;
  S: WideString;
begin
  if not FProcessingTabSheet then
    Exit;
  if FCancelSearch then
    Exit;
  if not Assigned(AOutputTreeView) then
    Exit;
  AOutputTreeView.DefaultNodeHeight := Max(AOutputTreeView.Canvas.TextHeight('Tg'), 18);
  AOutputTreeView.BeginUpdate;
  LLastNode := AOutputTreeView.GetLast;
  if Assigned(LLastNode) then
  begin
    LNodeData := AOutputTreeView.GetNodeData(LLastNode);
    if (LNodeData.Filename <> AFileName) or (LNodeData.Line = -1) then
      LLastNode := nil;
  end;
  if not Assigned(LLastNode) then
  begin
    FRootNode := AOutputTreeView.AddChild(nil);
    LNodeData := AOutputTreeView.GetNodeData(FRootNode);
    LNodeData.Level := 0;
    if ALine = -1 then
    begin
      LNodeData.Level := 2;
      LNodeData.Filename := AText;
    end
    else
      LNodeData.Filename := AFilename;
  end;
  if ALine <> -1  then
  begin
    LNode := AOutputTreeView.AddChild(FRootNode);
    LNodeData := AOutputTreeView.GetNodeData(LNode);
    LNodeData.Level := 1;
    LNodeData.Line := ALine;
    LNodeData.Character := ACharacter;
    LNodeData.SearchString := ASearchString;
    LNodeData.Filename := AFilename;
    LNodeData.Length := ALength;

    S := AText;

    if LNodeData.SearchString <> '' then
    begin
      if ACharacter > 255 then
      begin
        LNodeData.TextCharacter := 11;
        S := System.Copy(s, ACharacter - 10, System.Length(s));
      end
      else
        LNodeData.TextCharacter := ACharacter;
      if System.Length(S) > 255 then
        S := Format('%s...', [System.Copy(S, 0, 251)]);
    end;

    if toAutoExpand in AOutputTreeView.TreeOptions.AutoOptions then
      if not AOutputTreeView.Expanded[FRootNode] then
        AOutputTreeView.FullExpand(FRootNode);

    LNodeData.Text := S;
    AOutputTreeView.Tag := AOutputTreeView.Tag + 1;
  end;
  AOutputTreeView.EndUpdate;
end;

function TEBOutput.SelectedLine(var AFilename: string; var ALine: LongWord; var ACharacter: LongWord): Boolean;
var
  LNode: PVirtualNode;
  LNodeData: POutputRec;
  LOutputTreeView: TVirtualDrawTree;
begin
  Result := False;
  LOutputTreeView := GetOutputTreeView(PageControl.ActivePage);
  if not Assigned(LOutputTreeView) then
    Exit;

  LNode := LOutputTreeView.GetFirstSelected;
  LNodeData := LOutputTreeView.GetNodeData(LNode);

  Result := Assigned(LNodeData) and (LNodeData.Text <> '');
  if Result then
  begin
    AFilename := LNodeData.Filename;
    ALine := LNodeData.Line;
    ACharacter := LNodeData.Character;
  end;
end;

procedure TEBOutput.CopyToClipboard(const AOnlySelected: Boolean);
var
  LOutputTreeView: TVirtualDrawTree;
  LNode, LChildNode: PVirtualNode;
  LData, LChildData: POutputRec;
  LStringList: TStrings;
begin
  LOutputTreeView := GetOutputTreeView(PageControl.ActivePage);
  if Assigned(LOutputTreeView) then
  begin
    LStringList := TStringList.Create;
    try
      LNode := LOutputTreeView.GetFirst;
      while Assigned(LNode) do
      begin
        if not AOnlySelected or AOnlySelected and (LOutputTreeView.CheckState[LNode] = csCheckedNormal) then
        begin
          LData := LOutputTreeView.GetNodeData(LNode);
          LStringList.Add(LData.FileName);
          LChildNode := LNode.FirstChild;
          while Assigned(LChildNode) do
          begin
            LChildData := LOutputTreeView.GetNodeData(LChildNode);
            LStringList.Add(System.SysUtils.Format('  %s (%d, %d): %s', [ExtractFilename(LChildData.Filename),
              LChildData.Line, LChildData.Character, LChildData.Text]));
            LChildNode := LChildNode.NextSibling;
          end;
        end;
        LNode := LNode.NextSibling;
      end;
    finally
      Clipboard.AsText := LStringList.Text;
      LStringList.Free;
    end;
  end;
end;

function TEBOutput.CheckCancel(const ATabIndex: Integer = -1): Boolean;
var
  LTabSheet: TTabSheet;
begin
  Result := False;
  Application.ProcessMessages;
  if ATabIndex <> -1 then
    LTabSheet := PageControl.Pages[ATabIndex]
  else
    LTabSheet := PageControl.ActivePage;
  if FProcessingTabSheet then
    if FProcessingPage = LTabSheet then
    begin
      if AskYesOrNo(LanguageDataModule.GetYesOrNoMessage('CancelSearch')) then
        FCancelSearch := True
      else
        Result := True;
    end;
end;

function TEBOutput.CloseTabSheet(const AFreePage: Boolean = True; const ATabIndex: Integer = -1): Boolean;
var
  LActivePageIndex: Integer;
begin
  Result := True;

  FPageControl.TabClosed := True;
  if CheckCancel(ATabIndex) then
    Exit(False);
  if FPageControl.PageCount > 0 then
  begin
    if ATabIndex = -1 then
      LActivePageIndex := FPageControl.ActivePageIndex
    else
      LActivePageIndex := ATabIndex;
    if AFreePage and (FPageControl.PageCount > 0) then
    begin
      FPageControl.Pages[LActivePageIndex].Free;
      if LActivePageIndex > 0 then
        FPageControl.ActivePageIndex := LActivePageIndex - 1
      else
      if FPageControl.PageCount > 0 then
        FPageControl.ActivePageIndex := 0;
    end
    else
    begin
      TsTabSheet(FPageControl.Pages[LActivePageIndex]).TabVisible := False;
      FPageControl.Pages[LActivePageIndex].PageIndex := LActivePageIndex + 1;
    end;
  end;
end;

procedure TEBOutput.CloseAllTabSheets;
var
  i, j: Integer;
begin
  Screen.Cursor := crHourGlass;
  try
    PageControl.Visible := False;
    j := PageControl.PageCount - 2;
    for i := j downto 0 do
    if TsTabSheet(PageControl.Pages[i]).TabType = ttTab then
      CloseTabSheet(True, i);
    PageControl.Visible := True;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TEBOutput.CloseAllOtherTabSheets;
var
  i, j: Integer;
  LTabSheet: TsTabSheet;
begin
  if CheckCancel then
    Exit;
  LTabSheet := PageControl.ActivePage;
  LTabSheet.PageIndex := 0; { move the page first }
  Screen.Cursor := crHourGlass;
  try
    PageControl.Visible := False;
    j := PageControl.PageCount - 2;
    for i := j downto 1 do
      PageControl.Pages[i].Free;
    PageControl.ActivePage := LTabSheet;
    PageControl.Visible := True;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TEBOutput.SetProcessingTabSheet(const AValue: Boolean);
begin
  FProcessingTabSheet := AValue;
  FProcessingPage := PageControl.ActivePage;
  FCancelSearch := False;
end;

function TEBOutput.GetOutputTreeView(ATabSheet: TTabSheet): TVirtualDrawTree;
begin
  Result := nil;
  if Assigned(ATabSheet) and Assigned(ATabSheet.Controls[0]) and (ATabSheet.Controls[0] is TVirtualDrawTree) then
    Result := TVirtualDrawTree(ATabSheet.Controls[0]);
end;

procedure TEBOutput.SetOptions;
var
  i: Integer;
  LVirtualDrawTree: TVirtualDrawTree;
  LNode: PVirtualNode;
begin
  PageControl.MultiLine := OptionsContainer.OutputMultiLine;
  PageControl.ShowCloseBtns := OptionsContainer.OutputShowCloseButton;
  PageControl.RightClickSelect := OptionsContainer.OutputRightClickSelect;
  FTabSheetFindInFiles.TabVisible := OptionsContainer.OutputShowFindInFilesButton;

  if OptionsContainer.OutputShowImage then
    PageControl.Images := ImagesDataModule.ImageListSmall
  else
    PageControl.Images := nil;

  for i := 0 to PageControl.PageCount - 2 do
  begin
    LVirtualDrawTree := GetOutputTreeView(PageControl.Pages[i]);
    LVirtualDrawTree.Indent := OptionsContainer.OutputIndent;
    if OptionsContainer.OutputUseExplorerTheme then
      LVirtualDrawTree.TreeOptions.PaintOptions := LVirtualDrawTree.TreeOptions.PaintOptions + [toUseExplorerTheme]
    else
      LVirtualDrawTree.TreeOptions.PaintOptions := LVirtualDrawTree.TreeOptions.PaintOptions - [toUseExplorerTheme];
    if OptionsContainer.OutputShowTreeLines then
      LVirtualDrawTree.TreeOptions.PaintOptions := LVirtualDrawTree.TreeOptions.PaintOptions + [toShowTreeLines]
    else
      LVirtualDrawTree.TreeOptions.PaintOptions := LVirtualDrawTree.TreeOptions.PaintOptions - [toShowTreeLines];

    { check box }
    LNode := LVirtualDrawTree.GetFirst;
    while Assigned(LNode) do
    begin
      LVirtualDrawTree.ReinitNode(LNode, False);
      LNode := LVirtualDrawTree.GetNextSibling(LNode);
    end;
  end;
end;

procedure TEBOutput.SetCheckedState(const AValue: TCheckState);
var
  LOutputTreeView: TVirtualDrawTree;
  LNode: PVirtualNode;
begin
  LOutputTreeView := GetOutputTreeView(PageControl.ActivePage);
  LNode := LOutputTreeView.GetFirst;
  while Assigned(LNode) do
  begin
    LOutputTreeView.CheckState[LNode] := AValue;
    LNode := LNode.NextSibling;
  end;
end;

procedure TEBOutput.ReadOutputFile;
var
  LFilename, S: string;
  LOutputFile: TStreamReader;
  LVirtualDrawTree: TVirtualDrawTree;
  LFilenameToken, LText, LSearchString: string;
  LLineToken, LCharacterToken: Cardinal;
  LLength: Integer;
begin
  FProcessingTabSheet := True;
  LVirtualDrawTree := nil;
  LFilename := GetOutFilename;
  if FileExists(LFilename) then
  begin
    LOutputFile := TStreamReader.Create(LFilename, TEncoding.Unicode);
    try
      while not LOutputFile.EndOfStream do
      begin
        S := LOutputFile.ReadLine;
        if Pos('s:', S) = 1 then
          LVirtualDrawTree := AddTreeView(Format(LanguageDataModule.GetConstant('SearchFor'), [Copy(S, 3, Length(S))]))
        else
        if Assigned(LVirtualDrawTree) then
        begin
          LFilenameToken := GetNextToken(OUTPUT_FILE_SEPARATOR, S);
          S := RemoveTokenFromStart(OUTPUT_FILE_SEPARATOR, S);
          LLineToken := StrToInt(GetNextToken(OUTPUT_FILE_SEPARATOR, S));
          S := RemoveTokenFromStart(OUTPUT_FILE_SEPARATOR, S);
          LCharacterToken := StrToInt(GetNextToken(OUTPUT_FILE_SEPARATOR, S));
          S := RemoveTokenFromStart(OUTPUT_FILE_SEPARATOR, S);
          LText := GetNextToken(OUTPUT_FILE_SEPARATOR, S);
          S := RemoveTokenFromStart(OUTPUT_FILE_SEPARATOR, S);
          LSearchString := GetNextToken(OUTPUT_FILE_SEPARATOR, S);
          S := RemoveTokenFromStart(OUTPUT_FILE_SEPARATOR, S);
          LLength := StrToIntDef(S, Length(LSearchString));
          AddTreeViewLine(LVirtualDrawTree, LFilenameToken, LLineToken, LCharacterToken, LText, LSearchString, LLength);
        end;
      end;
    finally
      LOutputFile.Free;
    end;
  end;
  FProcessingTabSheet := False;
end;

procedure TEBOutput.WriteOutputFile;
var
  i: Integer;
  LFilename: string;
  LOutputFile: TStreamWriter;
  LNode: PVirtualNode;
  LNodeData: POutputRec;
  LVirtualDrawTree: TVirtualDrawTree;
begin
  FProcessingTabSheet := True;
  LFilename := GetOutFilename;
  if FileExists(LFilename) then
    DeleteFile(LFilename);
  if OptionsContainer.OutputSaveTabs then
    if PageControl.PageCount > 0 then
    begin
      LOutputFile := TStreamWriter.Create(LFilename, False, TEncoding.Unicode);
      try
        for i := 0 to PageControl.PageCount - 2 do
        begin
          LVirtualDrawTree := GetOutputTreeView(PageControl.Pages[i]);
          if Assigned(LVirtualDrawTree) then
          begin
            { tab sheet }
            LNode := LVirtualDrawTree.GetFirst;
            LNode := LVirtualDrawTree.GetFirstChild(LNode);
            if Assigned(LNode) then
            begin
              LNodeData := LVirtualDrawTree.GetNodeData(LNode);
              LOutputFile.Writeline(Format('s:%s', [LNodeData.SearchString]));
            end;
            { data }
            while Assigned(LNode) do
            begin
              LNodeData := LVirtualDrawTree.GetNodeData(LNode);
              if LNodeData.SearchString <> '' then
                LOutputFile.WriteLine(Format('%s%s%d%s%d%s%s%s%s%s%d', [LNodeData.Filename, OUTPUT_FILE_SEPARATOR, LNodeData.Line,
                  OUTPUT_FILE_SEPARATOR, LNodeData.Character, OUTPUT_FILE_SEPARATOR, LNodeData.Text, OUTPUT_FILE_SEPARATOR,
                  LNodeData.SearchString, OUTPUT_FILE_SEPARATOR, LNodeData.Length]));
              LNode := LVirtualDrawTree.GetNext(LNode);
            end;
          end;
        end;
      finally
        LOutputFile.Free;
      end;
    end;
  FProcessingTabSheet := False;
end;

procedure TEBOutput.VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode;
  var InitialStates: TVirtualNodeInitStates);
var
  LData: POutputRec;
begin
  with Sender do
  if OptionsContainer.OutputShowCheckBox then
  begin
    if GetNodeLevel(Node) = 0 then
    begin
      LData := GetNodeData(Node);
      if LData.Level <> 2 then
      begin
        CheckType[Node] := ctCheckBox;
        CheckState[Node] := csCheckedNormal;
      end;
    end
  end
  else
    CheckType[Node] := ctNone;
end;

end.
