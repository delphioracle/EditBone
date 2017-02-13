unit EditBone.Directory;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.ComCtrls,
  BCControl.FileControl, Vcl.ImgList, Vcl.Menus, BCControl.PageControl, VirtualTrees, BCCommon.Form.SearchForFiles,
  sPageControl, BCComponent.SkinManager;

type
  TEBDirectory = class(TObject)
    procedure DriveComboChange(Sender: TObject);
    procedure FileTreeViewClick(Sender: TObject);
    procedure FileTreeViewDblClick(Sender: TObject);
    procedure FileTreeKeyPress(Sender: TObject; var Key: Char);
  private
    FFileTreeViewDblClick: TNotifyEvent;
    FFileTreeViewClick: TNotifyEvent;
    FImages: TImageList;
    FOnSearchForFilesOpenFile: TOpenFileEvent;
    FPageControl: TBCPageControl;
    FPopupMenuFileTreeView: TPopupMenu;
    FSkinManager: TBCSkinManager;
    FTabSheetOpen: TTabSheet;
    function GetActiveDriveComboBox: TBCDriveComboBox;
    function GetDrivesPanelOrientation(ATabSheet: TTabSheet = nil): Byte;
    function GetFileTypePanelOrientation(ATabSheet: TTabSheet = nil): Byte;
    function GetDriveComboBox(ATabSheet: TTabSheet): TBCDriveComboBox;
    function GetFileTypeComboBox(ATabSheet: TTabSheet): TBCFileTypeComboBox;
    function GetExcludeOtherBranches: Boolean;
    function GetFileTreeView(ATabSheet: TTabSheet = nil): TBCFileTreeView;
    function GetFileType(ATabSheet: TTabSheet): string;
    function GetIsAnyDirectory: Boolean;
    function GetRootDirectory: string;
    function GetSelectedPath: string;
    procedure CreateImageList;
    procedure SetDrivesPanelOrientation(const AShowDrives: Byte; ADriveComboBox: TBCDriveComboBox = nil);
    procedure SetFileTypePanelOrientation(const AShowFileType: Byte; const AFileType: string = '';
      AFileTypeComboBox: TBCFileTypeComboBox = nil);
  public
    constructor Create(AOwner: TBCPageControl);
    destructor Destroy; override;
    function CloseDirectory(const AFreePage: Boolean = True; const ATabIndex: Integer = -1): Boolean;
    function Focused: Boolean;
    function SelectedFile: string;
    procedure Copy;
    procedure Cut;
    procedure DeleteSelected;
    procedure EditDirectory;
    procedure FileProperties;
    procedure OpenDirectory(const ATabName: string; const ARootDirectory: string; const ALastPath: string;
      const AShowDrives: Byte; const AExcludeOtherBranches: Boolean; const AShowFileType: Byte; const AFileType: string); overload;
    procedure OpenDirectory; overload;
    procedure OpenPath(const ARootDirectory: string; const ALastPath: string; AExcludeOtherBranches: Boolean = False);
    procedure Paste;
    procedure ReadIniFile;
    procedure Refresh;
    procedure Rename;
    procedure SetOptions;
    procedure WriteIniFile;
    property ExcludeOtherBranches: Boolean read GetExcludeOtherBranches;
    property IsAnyDirectory: Boolean read GetIsAnyDirectory;
    property OnFileTreeViewClick: TNotifyEvent read FFileTreeViewClick write FFileTreeViewClick;
    property OnFileTreeViewDblClick: TNotifyEvent read FFileTreeViewDblClick write FFileTreeViewDblClick;
    property OnSearchForFilesOpenFile: TOpenFileEvent read FOnSearchForFilesOpenFile write FOnSearchForFilesOpenFile;
    property PageControl: TBCPageControl read FPageControl;
    property PopupMenuFileTreeView: TPopupMenu read FPopupMenuFileTreeView write FPopupMenuFileTreeView;
    property RootDirectory: string read GetRootDirectory;
    property SelectedPath: string read GetSelectedPath;
    property SkinManager: TBCSkinManager read FSkinManager write FSkinManager;
  end;

implementation

uses
  EditBone.Dialog.DirectoryTab, BCCommon.Language.Strings, BCCommon.Options.Container, BCControl.Utils,
  BCCommon.FileUtils, BCCommon.Messages, BCCommon.StringUtils, BCCommon.Dialog.Base, EditBone.Consts,
  Winapi.ShellAPI, Winapi.CommCtrl, EditBone.DataModule.Images, BCControl.Panel, System.IniFiles;

destructor TEBDirectory.Destroy;
begin
  if Assigned(FImages) then
    FImages.Free;

  inherited Destroy;
end;

procedure TEBDirectory.CreateImageList;
var
  LSysImageList: THandle;
  LIcon: TIcon;
begin
  if not Assigned(FImages) then
    FImages := TImageList.Create(nil);
  LSysImageList := GetSysImageList;
  if LSysImageList <> 0 then
  begin
    FImages.Handle := LSysImageList;
    FImages.BkColor := clNone;
    FImages.ShareImages := True;
  end;
  { open image index }
  LIcon := TIcon.Create;
  try
    { Windows font size causing a problem: Icon size will be smaller than PageControl.Images size }
    case FImages.Height of
      16:
        { smaller }
        if Assigned(FTabSheetOpen) then
        begin
          EBDataModuleImages.ImageListDirectory16.GetIcon(0, LIcon);
          FTabSheetOpen.ImageIndex := ImageList_AddIcon(FImages.Handle, LIcon.Handle);
        end;
      20:
        { medium }
        if Assigned(FTabSheetOpen) then
        begin
          EBDataModuleImages.ImageListDirectory20.GetIcon(0, LIcon);
          FTabSheetOpen.ImageIndex := ImageList_AddIcon(FImages.Handle, LIcon.Handle);
        end;
      24:
        { larger }
        if Assigned(FTabSheetOpen) then
        begin
          EBDataModuleImages.ImageListDirectory24.GetIcon(0, LIcon);
          FTabSheetOpen.ImageIndex := ImageList_AddIcon(FImages.Handle, LIcon.Handle);
        end;
    end;
  finally
    LIcon.Free;
  end;
end;

constructor TEBDirectory.Create(AOwner: TBCPageControl);
begin
  inherited Create;

  FPageControl := AOwner;
  if FPageControl.PageCount > 0 then
    FTabSheetOpen := AOwner.Pages[0];
  CreateImageList;
end;

procedure TEBDirectory.ReadIniFile;
var
  i: Integer;
  s: string;
  LLastPaths: TStrings;
  LTabName, LRoot, LLastPath, LFileType: string;
  LShowDrives, LShowFileType: Byte; { 0=Hide, 1=Bottom, 2=Top }
  LExcludeOtherBranches: Boolean;
begin
  LLastPaths := TStringList.Create;
  with TIniFile.Create(GetIniFilename) do
  try
    { Options }
    ReadSectionValues('LastPaths', LLastPaths);
    for i := 0 to LLastPaths.Count - 1 do
    begin
      s := RemoveTokenFromStart('=', LLastPaths.Strings[i]);
      LTabName := GetNextToken(';', s);
      s := RemoveTokenFromStart(';', s);
      LRoot := GetNextToken(';', s);
      s := RemoveTokenFromStart(';', s);
      LLastPath := GetNextToken(';', s);
      s := RemoveTokenFromStart(';', s);
      LShowDrives := Abs(StrToInt(GetNextToken(';', s)));
      s := RemoveTokenFromStart(';', s);
      LExcludeOtherBranches := StrToBool(GetNextToken(';', s));
      s := RemoveTokenFromStart(';', s);
      if s = '' then { Version < 6.7.0 }
        s := '0;*.*';
      LShowFileType := StrToInt(GetNextToken(';', s));
      LFileType := RemoveTokenFromStart(';', s);
      if DirectoryExists(LLastPath) then
        OpenDirectory(LTabName, LRoot, LLastPath, LShowDrives, LExcludeOtherBranches, LShowFileType, LFileType);
    end;
    i := ReadInteger('Options', 'ActiveDirectoryIndex', 0);
    if i < FPageControl.PageCount then
      FPageControl.ActivePageIndex := i;
  finally
    LLastPaths.Free;
    Free;
  end;
end;

function TEBDirectory.GetDriveComboBox(ATabSheet: TTabSheet): TBCDriveComboBox;
var
  i: Integer;
  LPanel: TBCPanel;
begin
  Result := nil;
  if Assigned(ATabSheet) then
    if ATabSheet.ControlCount <> 0 then
      if ATabSheet.Controls[0] is TBCPanel then
      begin
        LPanel := TBCPanel(ATabSheet.Controls[0]);
        if Assigned(LPanel) then
          for i := 0 to LPanel.ControlCount - 1 do
            if LPanel.Controls[i] is TBCDriveComboBox then
            begin
              Result := LPanel.Controls[i] as TBCDriveComboBox;
              Break;
            end;
      end;
end;

function TEBDirectory.GetFileTypeComboBox(ATabSheet: TTabSheet): TBCFileTypeComboBox;
var
  i: Integer;
  LPanel: TBCPanel;
begin
  Result := nil;
  if Assigned(ATabSheet) then
    if ATabSheet.ControlCount <> 0 then
      if ATabSheet.Controls[0] is TBCPanel then
      begin
        LPanel := TBCPanel(ATabSheet.Controls[0]);
        if Assigned(LPanel) then
          for i := 0 to LPanel.ControlCount - 1 do
            if LPanel.Controls[i] is TBCFileTypeComboBox then
            begin
              Result := LPanel.Controls[i] as TBCFileTypeComboBox;
              Break;
            end;
      end;
end;

function TEBDirectory.GetDrivesPanelOrientation(ATabSheet: TTabSheet): Byte;
var
  LDriveComboBox: TBCDriveComboBox;
begin
  Result := 0;
  if not Assigned(ATabSheet) then
    ATabSheet := FPageControl.ActivePage;
  LDriveComboBox := GetDriveComboBox(ATabSheet);
  if Assigned(LDriveComboBox) then
    if LDriveComboBox.Visible then
    begin
      if LDriveComboBox.Align = alBottom then
        Result := 1
      else
        Result := 2;
    end;
end;

function TEBDirectory.GetFileType(ATabSheet: TTabSheet): string;
var
  LFileTypeComboBox: TBCFileTypeComboBox;
begin
  Result := '';
  LFileTypeComboBox := GetFileTypeComboBox(ATabSheet);
  if Assigned(LFileTypeComboBox) then
    Result := LFileTypeComboBox.Text;
end;

procedure TEBDirectory.SetDrivesPanelOrientation(const AShowDrives: Byte; ADriveComboBox: TBCDriveComboBox);
var
  LDriveComboBox: TBCDriveComboBox;
begin
  if not Assigned(ADriveComboBox) then
    LDriveComboBox := GetDriveComboBox(FPageControl.ActivePage)
  else
    LDriveComboBox := ADriveComboBox;
  if Assigned(LDriveComboBox) then
  begin
    LDriveComboBox.Visible := AShowDrives <> 0;
    if AShowDrives = 1 then
    with LDriveComboBox do
    begin
      Margins.Top := 4;
      Margins.Bottom := 0;
      Align := alBottom
    end
    else
    if AShowDrives = 2 then
    with LDriveComboBox do
    begin
      Margins.Top := 0;
      Margins.Bottom := 4;
      Align := alTop
    end;
  end;
end;

procedure TEBDirectory.SetFileTypePanelOrientation(const AShowFileType: Byte; const AFileType: string;
  AFileTypeComboBox: TBCFileTypeComboBox);
var
  LFileTypeComboBox: TBCFileTypeComboBox;
begin
  if not Assigned(AFileTypeComboBox) then
    LFileTypeComboBox := GetFileTypeComboBox(FPageControl.ActivePage)
  else
    LFileTypeComboBox := AFileTypeComboBox;
  if Assigned(LFileTypeComboBox) then
  begin
    LFileTypeComboBox.Visible := AShowFileType <> 0;
    if AFileType <> '' then
      LFileTypeComboBox.Text := AFileType;
    if AShowFileType = 1 then
    with LFileTypeComboBox do
    begin
      Margins.Top := 4;
      Margins.Bottom := 0;
      Align := alBottom
    end
    else
    if AShowFileType = 2 then
    with LFileTypeComboBox do
    begin
      Margins.Top := 0;
      Margins.Bottom := 4;
      Align := alTop
    end;
  end;
end;

function TEBDirectory.GetFileTypePanelOrientation(ATabSheet: TTabSheet = nil): Byte;
var
  LFileTypeComboBox: TBCFileTypeComboBox;
begin
  Result := 0;
  if not Assigned(ATabSheet) then
    ATabSheet := FPageControl.ActivePage;
  LFileTypeComboBox := GetFileTypeComboBox(ATabSheet);
  if Assigned(LFileTypeComboBox) then
    if LFileTypeComboBox.Visible then
    begin
      if LFileTypeComboBox.Align = alBottom then
        Result := 1
      else
        Result := 2;
    end;
end;

function TEBDirectory.GetExcludeOtherBranches: Boolean;
var
  LFileTreeView: TBCFileTreeView;
begin
  Result := False;
  LFileTreeView := GetFileTreeView;
  if Assigned(LFileTreeView) then
    Result := LFileTreeView.ExcludeOtherBranches;
end;

procedure TEBDirectory.WriteIniFile;
var
  i: Integer;
  LFileTreeView: TBCFileTreeView;
  LTabSheet: TTabSheet;
begin
  with TIniFile.Create(GetIniFilename) do
  try
    WriteInteger('Options', 'ActiveDirectoryIndex', FPageControl.ActivePageIndex);
    { Options }
    EraseSection('LastPaths');
    { Open directories }
    if OptionsContainer.DirSaveTabs then
      for i := 0 to FPageControl.PageCount - 2 do
      begin
        LTabSheet := FPageControl.Pages[i];
        LFileTreeView := GetFileTreeView(LTabSheet);
        if Assigned(LFileTreeView) then
          WriteString('LastPaths', IntToStr(i), Format('%s;%s;%s;%d;%s;%d;%s', [Trim(LTabSheet.Caption),
            LFileTreeView.RootDirectory, LFileTreeView.SelectedPath, GetDrivesPanelOrientation(LTabSheet),
            BoolToStr(LFileTreeView.ExcludeOtherBranches), GetFileTypePanelOrientation(LTabSheet),
            GetFileType(LTabSheet)]));
      end;
  finally
    Free;
  end;
end;

function TEBDirectory.GetFileTreeView(ATabSheet: TTabSheet): TBCFileTreeView;
var
  LIndex: Integer;
  LPanel: TBCPanel;
begin
  if not Assigned(ATabSheet) then
    ATabSheet := FPageControl.ActivePage;

  Result := nil;
  if Assigned(ATabSheet) then
    if ATabSheet.ControlCount <> 0 then
      if ATabSheet.Controls[0] is TBCPanel then
      begin
        LPanel := TBCPanel(ATabSheet.Controls[0]);
        if Assigned(LPanel) then
          for LIndex := 0 to LPanel.ControlCount - 1 do
            if LPanel.Controls[LIndex] is TBCFileTreeView then
            begin
              Result := LPanel.Controls[LIndex] as TBCFileTreeView;
              Break;
            end;
      end;
end;

procedure TEBDirectory.FileTreeViewClick(Sender: TObject);
begin
  if Assigned(FFileTreeViewClick) then
    FFileTreeViewClick(Sender);
end;

procedure TEBDirectory.FileTreeViewDblClick(Sender: TObject);
begin
  if Assigned(FFileTreeViewDblClick) then
    FFileTreeViewDblClick(Sender);
end;

procedure TEBDirectory.FileTreeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = EDITBONE_CARRIAGE_RETURN then
    if Assigned(FFileTreeViewDblClick) then
      FFileTreeViewDblClick(Sender);
end;

function TEBDirectory.GetActiveDriveComboBox: TBCDriveComboBox;
begin
  Result := GetDriveComboBox(FPageControl.ActivePage);
end;

function TEBDirectory.CloseDirectory(const AFreePage: Boolean = True; const ATabIndex: Integer = -1): Boolean;
var
  LActivePageIndex: Integer;
  LTabSheet: TTabSheet;
begin
  Result := True;
  if ATabIndex <> -1 then
    LTabSheet := FPageControl.Pages[ATabIndex]
  else
    LTabSheet := FPageControl.ActivePage;
  FPageControl.TabClosed := True;
  if not AskYesOrNo(Format(LanguageDataModule.GetYesOrNoMessage('CloseDirectory'), [LTabSheet.Caption])) then
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

function TEBDirectory.SelectedFile: string;
var
  LFileTreeView: TBCFileTreeView;
begin
  Result := '';
  LFileTreeView := GetFileTreeView;
  if Assigned(LFileTreeView) then
    Result := LFileTreeView.SelectedFile;
end;

function TEBDirectory.GetSelectedPath: string;
var
  LFileTreeView: TBCFileTreeView;
begin
  Result := '';
  LFileTreeView := GetFileTreeView;
  if Assigned(LFileTreeView) then
    Result := LFileTreeView.SelectedPath;
end;

function TEBDirectory.Focused: Boolean;
var
  LFileTreeView: TBCFileTreeView;
begin
  Result := False;
  LFileTreeView := GetFileTreeView;
  if Assigned(LFileTreeView) then
    Result := LFileTreeView.Focused or Assigned(LFileTreeView.EditLink);
end;

procedure TEBDirectory.DeleteSelected;
var
  LResult: Boolean;
  LFileTreeView: TBCFileTreeView;
  LSelectedNode: PVirtualNode;
  LData: PBCFileTreeNodeRecord;
begin
  LFileTreeView := GetFileTreeView;
  if Assigned(LFileTreeView) then
  begin
    LSelectedNode := LFileTreeView.GetFirstSelected;
    LData := LFileTreeView.GetNodeData(LSelectedNode);
    if LData.FileType = ftDirectory then
      LResult := AskYesOrNo(Format(LanguageDataModule.GetYesOrNoMessage('DeleteDirectory'), [SelectedPath]))
    else
      LResult := AskYesOrNo(Format(LanguageDataModule.GetYesOrNoMessage('DeleteFile'), [SelectedFile]));
    if LResult then
      LFileTreeView.DeleteSelectedNode;
  end;
end;

procedure TEBDirectory.EditDirectory;
var
  LFileTreeView: TBCFileTreeView;
begin
  LFileTreeView := GetFileTreeView;
  if Assigned(LFileTreeView) then
    with TDirectoryTabDialog.Create(nil) do
      try
        TabName := FPageControl.ActivePage.Caption { ActivePageCaption };
        RootDirectory := LFileTreeView.RootDirectory;
        ShowDrives := GetDrivesPanelOrientation;
        ExcludeOtherBranches := LFileTreeView.ExcludeOtherBranches;
        ShowFileType := GetFileTypePanelOrientation;
        if Open(dtEdit) then
        begin
          FPageControl.ActivePage.Caption { ActivePageCaption } := TabName;
          SetDrivesPanelOrientation(ShowDrives);
          SetFileTypePanelOrientation(ShowFileType);
          LFileTreeView.OpenPath(RootDirectory, SelectedPath, ExcludeOtherBranches);
        end;
      finally
        Free;
      end;
end;

procedure TEBDirectory.OpenDirectory;
begin
  with TDirectoryTabDialog.Create(nil) do
  try
    TabName := 'C:\';
    RootDirectory := TabName;
    ShowDrives := 1;
    ExcludeOtherBranches := False;
    ShowFileType := 0;
    if Open(dtOpen) then
      OpenDirectory(TabName, RootDirectory, RootDirectory, ShowDrives, ExcludeOtherBranches, ShowFileType, '*.*');
  finally
    Free;
  end;
end;

procedure TEBDirectory.FileProperties;
var
  LFileTreeView: TBCFileTreeView;
begin
  LFileTreeView := GetFileTreeView;
  if Assigned(LFileTreeView) then
    if LFileTreeView.SelectedCount > 0 then
      FilePropertiesDialog(LFileTreeView.SelectedFile);
end;

function TEBDirectory.GetRootDirectory: string;
var
  LFileTreeView: TBCFileTreeView;
begin
  Result := '';
  LFileTreeView := GetFileTreeView;
  if Assigned(LFileTreeView) then
    Result := LFileTreeView.RootDirectory;
end;

procedure TEBDirectory.Refresh;
var
  LFileTreeView: TBCFileTreeView;
begin
  LFileTreeView := GetFileTreeView;
  if Assigned(LFileTreeView) then
    LFileTreeView.OpenPath(RootDirectory, SelectedPath, ExcludeOtherBranches, True);
end;

procedure TEBDirectory.Rename;
var
  LFileTreeView: TBCFileTreeView;
begin
  LFileTreeView := GetFileTreeView;
  if Assigned(LFileTreeView) then
    LFileTreeView.RenameSelectedNode;
end;

procedure TEBDirectory.OpenPath(const ARootDirectory: string; const ALastPath: string; AExcludeOtherBranches: Boolean);
var
  LFileTreeView: TBCFileTreeView;
begin
  GetActiveDriveComboBox.Drive := ExtractFileDir(ARootDirectory)[1];
  LFileTreeView := GetFileTreeView;
  if Assigned(LFileTreeView) then
    LFileTreeView.OpenPath(ARootDirectory, ALastPath, AExcludeOtherBranches);
end;

procedure TEBDirectory.DriveComboChange(Sender: TObject);
var
  LDriveComboBox: TBCDriveComboBox;
begin
  LDriveComboBox := GetActiveDriveComboBox;
  if Assigned(LDriveComboBox) then
  begin
    FPageControl.ActivePage.ImageIndex := LDriveComboBox.IconIndex;
    if (Length(FPageControl.ActivePage.Caption) = 3) and
      (Pos(':\', FPageControl.ActivePage.Caption) = 2) then
      FPageControl.ActivePage.Caption := Format('%s:\', [LDriveComboBox.Drive]);
  end;
end;

procedure TEBDirectory.OpenDirectory(const ATabName: string; const ARootDirectory: string; const ALastPath: string;
  const AShowDrives: Byte; const AExcludeOtherBranches: Boolean; const AShowFileType: Byte; const AFileType: string);
var
  LTabSheet: TsTabSheet;
  LFileInfo: TSHFileInfo;
  LPanel: TBCPanel;
  LFileTreeView: TBCFileTreeView;
  LDriveComboBox: TBCDriveComboBox;
  LFileTypeComboBox: TBCFileTypeComboBox;
begin
  if not DirectoryExists(ARootDirectory) then
    Exit;
  if not DirectoryExists(ALastPath) then
    Exit;

  LTabSheet := TsTabSheet.Create(FPageControl);
  LTabSheet.PageControl := FPageControl;

  if Assigned(FTabSheetOpen) then
    FTabSheetOpen.PageIndex := FPageControl.PageCount - 1;

  LTabSheet.Visible := False;
  LTabSheet.ImageIndex := -1;
  FPageControl.ActivePage := LTabSheet;

  LPanel := TBCPanel.Create(LTabSheet);
  with LPanel do
  begin
    Visible := False;
    Parent := LTabSheet;
    Align := alClient;
    Padding.Left := 2;
    Padding.Top := 2;
    if FSkinManager.Active then
      Padding.Right := 2
    else
      Padding.Right := 4;
    Padding.Bottom := 2;
  end;

  LFileTreeView := TBCFileTreeView.Create(LPanel);
  with LFileTreeView do
  begin
    Parent := LPanel;
    Align := alClient;
    Indent := 20;
    TreeOptions.AutoOptions := [toAutoDropExpand, toAutoScroll, toAutoScrollOnExpand, toAutoTristateTracking,
      toAutoDeleteMovedNodes, toAutoChangeScale];
    TreeOptions.MiscOptions := [toEditable, toFullRepaintOnResize, toToggleOnDblClick, toWheelPanning, toEditOnClick];
    TreeOptions.PaintOptions := [toHideFocusRect, toShowButtons, toShowDropmark, toShowRoot, toThemeAware];
    PopupMenu := PopupMenuFileTreeView;
    OnClick := FileTreeViewClick;
    OnDblClick := FileTreeViewDblClick;
    OnKeyPress := FileTreeKeyPress;
    DefaultNodeHeight := Images.Height + 2;
    SkinManager := FSkinManager;
  end;

  LDriveComboBox := TBCDriveComboBox.Create(LPanel);
  with LDriveComboBox do
  begin
    Parent := LPanel;
    AlignWithMargins := True;
    Margins.Top := 0;
    Margins.Left := 0;
    Margins.Right := 0;
    Margins.Bottom := 4;
    Align := alTop;
    FileTreeView := LFileTreeView;
    Drive := 'C';
    OnChange := DriveComboChange;
    SkinData.SkinSection := 'COMBOBOX';
  end;

  LFileTypeComboBox := TBCFileTypeComboBox.Create(LPanel);
  with LFileTypeComboBox do
  begin
    Parent := LPanel;
    AlignWithMargins := True;
    Margins.Top := 4;
    Margins.Left := 0;
    Margins.Right := 0;
    Margins.Bottom := 0;
    Align := alBottom;
    FileTreeView := LFileTreeView;
    Extensions := OptionsContainer.Extensions;
    FileType := '*.*';
    ItemIndex := 0;
    SkinData.SkinSection := 'COMBOBOX';
  end;

  SetDrivesPanelOrientation(AShowDrives, LDriveComboBox);
  SetFileTypePanelOrientation(AShowFileType, AFileType, LFileTypeComboBox);
  SHGetFileInfo(PChar(ARootDirectory), 0, LFileInfo, SizeOf(SHFileInfo), SHGFI_SYSICONINDEX or SHGFI_DISPLAYNAME or
    SHGFI_TYPENAME);
  LTabSheet.ImageIndex := LFileInfo.iIcon;
  DestroyIcon(LFileInfo.hIcon); { destroy the icon, we are only using the index }

  PageControl.ActivePage.Caption := ATabName;
  SetOptions;
  OpenPath(ARootDirectory, ALastPath, AExcludeOtherBranches);
  LPanel.Visible := True;
  LTabSheet.Visible := True;
end;

function TEBDirectory.GetIsAnyDirectory: Boolean;
begin
  Result := False;
  if Assigned(PageControl) then
    Result := PageControl.PageCount > 1;
end;

procedure TEBDirectory.Copy;
var
  LFileTreeView: TBCFileTreeView;
begin
  LFileTreeView := GetFileTreeView;
  if Assigned(LFileTreeView) then
    if Assigned(LFileTreeView.EditLink) then
      TEditLink(LFileTreeView.EditLink).Copy;
end;

procedure TEBDirectory.Paste;
var
  LFileTreeView: TBCFileTreeView;
begin
  LFileTreeView := GetFileTreeView;
  if Assigned(LFileTreeView) then
    if Assigned(LFileTreeView.EditLink) then
      TEditLink(LFileTreeView.EditLink).Paste;
end;

procedure TEBDirectory.Cut;
var
  LFileTreeView: TBCFileTreeView;
begin
  LFileTreeView := GetFileTreeView;
  if Assigned(LFileTreeView) then
    if Assigned(LFileTreeView.EditLink) then
      TEditLink(LFileTreeView.EditLink).Cut;
end;

procedure TEBDirectory.SetOptions;
var
  i: Integer;
  LFileTreeView: TBCFileTreeView;
begin
  PageControl.MultiLine := OptionsContainer.DirMultiLine;
  PageControl.ShowCloseBtns := OptionsContainer.DirShowCloseButton;
  PageControl.RightClickSelect := OptionsContainer.DirRightClickSelect;
  if Assigned(FTabSheetOpen) then
    FTabSheetOpen.TabVisible := OptionsContainer.DirShowOpenDirectoryButton;
  if OptionsContainer.DirShowImage then
    PageControl.Images := FImages
  else
    PageControl.Images := nil;
  for i := 0 to PageControl.PageCount - 2 do
  begin
    LFileTreeView := GetFileTreeView(PageControl.Pages[i]);
    if Assigned(LFileTreeView) then
    begin
      LFileTreeView.Indent := OptionsContainer.DirIndent;
      LFileTreeView.ShowHiddenFiles := OptionsContainer.DirShowHiddenFiles;
      LFileTreeView.ShowSystemFiles := OptionsContainer.DirShowSystemFiles;
      LFileTreeView.ShowArchiveFiles := OptionsContainer.DirShowArchiveFiles;
      LFileTreeView.ShowOverlayIcons := OptionsContainer.DirShowOverlayIcons;
      if OptionsContainer.DirUseExplorerTheme then
        LFileTreeView.TreeOptions.PaintOptions := LFileTreeView.TreeOptions.PaintOptions + [toUseExplorerTheme]
      else
        LFileTreeView.TreeOptions.PaintOptions := LFileTreeView.TreeOptions.PaintOptions - [toUseExplorerTheme];
      if OptionsContainer.DirShowTreeLines then
        LFileTreeView.TreeOptions.PaintOptions := LFileTreeView.TreeOptions.PaintOptions + [toShowTreeLines]
      else
        LFileTreeView.TreeOptions.PaintOptions := LFileTreeView.TreeOptions.PaintOptions - [toShowTreeLines]
    end;
  end;
end;

end.

