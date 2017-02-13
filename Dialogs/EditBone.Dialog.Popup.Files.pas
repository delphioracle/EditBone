unit EditBone.Dialog.Popup.Files;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VirtualTrees, Vcl.ExtCtrls, BCControl.ButtonedEdit, sSkinProvider,
  System.Actions, Vcl.ActnList, Vcl.ImgList, System.UITypes, System.ImageList, Vcl.StdCtrls;

type
  TSelectFileEvent = procedure(APageIndex: Integer) of object;

  TPopupFilesDialog = class(TForm)
    VirtualDrawTree: TVirtualDrawTree;
    SkinProvider: TsSkinProvider;
    ButtonedEdit: TBCButtonedEdit;
    ActionList: TActionList;
    ActionClear: TAction;
    ActionSearch: TAction;
    ImageList: TImageList;
    procedure FormShow(Sender: TObject);
    procedure ActionClearExecute(Sender: TObject);
    procedure ActionSearchExecute(Sender: TObject);
    procedure VirtualDrawTreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode;
      Column: TColumnIndex; var Result: Integer);
    procedure VirtualDrawTreeDblClick(Sender: TObject);
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; var NodeWidth: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind;
      Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: TImageIndex);
    procedure ButtonedEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FSelectFile: TSelectFileEvent;
    procedure SetVisibleRows;
    procedure WMActivate(var AMessage: TWMActivate); message WM_ACTIVATE;
  public
    procedure Execute(AFiles: TStrings; const ASelectedFile: string);
    property OnSelectFile: TSelectFileEvent read FSelectFile write FSelectFile;
  end;

implementation

{$R *.dfm}

uses
  System.Types, BCControl.Utils, BCCommon.Utils, sGraphUtils, sVclUtils, sDefaults, System.Math, acPopupController;

type
  PSearchRec = ^TSearchRec;
  TSearchRec = packed record
    FileName: string;
    FilePath: string;
    ImageIndex: Integer;
    PageIndex: Integer;
  end;

procedure TPopupFilesDialog.FormCreate(Sender: TObject);
var
  SysImageList: THandle;
begin
  VirtualDrawTree.NodeDataSize := SizeOf(TSearchRec);
  VirtualDrawTree.Images := TImageList.Create(Self);
  SysImageList := GetSysImageList;
  if SysImageList <> 0 then
  begin
    VirtualDrawTree.Images.Handle := SysImageList;
    VirtualDrawTree.Images.BkColor := clNone;
    VirtualDrawTree.Images.ShareImages := True;
  end;
end;

procedure TPopupFilesDialog.Execute(AFiles: TStrings; const ASelectedFile: string);
var
  i: Integer;
  LNode, LSelectedNode: PVirtualNode;
  LNodeData: PSearchRec;
  LFileName, LSelectedFile: string;
  LWidth, LMaxWidth: Integer;
begin
  LMaxWidth := 0;
  LSelectedNode := nil;
  LSelectedFile := Copy(ASelectedFile, 2, Length(ASelectedFile) - 2); { Remove [] }
  VirtualDrawTree.Clear;
  VirtualDrawTree.DefaultNodeHeight := VirtualDrawTree.Images.Height + 2;
  for i := 0 to AFiles.Count - 1 do
  begin
    LNode := VirtualDrawTree.AddChild(nil);
    LNodeData := VirtualDrawTree.GetNodeData(LNode);
    LFileName := AFiles[i];

    LWidth := VirtualDrawTree.Canvas.TextWidth(LFileName);
    if LWidth > LMaxWidth then
      LMaxWidth := LWidth;

    LNodeData.FileName := ExtractFileName(LFileName);
    LNodeData.FilePath := ExtractFilePath(LFileName);
    LNodeData.ImageIndex := GetIconIndex(LFileName);
    if LNodeData.ImageIndex = -1 then
      LNodeData.ImageIndex := 0;
    LNodeData.PageIndex := Integer(AFiles.Objects[i]);

    if LSelectedFile = LFileName then
    begin
      VirtualDrawTree.Selected[LNode] := True;
      LSelectedNode := LNode;
    end;
  end;

  VirtualDrawTree.Sort(nil, 0, sdAscending, False);
  VirtualDrawTree.Invalidate;

  if Assigned(LSelectedNode) then
    VirtualDrawTree.ScrollIntoView(LSelectedNode, True);

  Width := LMaxWidth + 80;
  Height := Min(Integer(VirtualDrawTree.DefaultNodeHeight) * AFiles.Count + ButtonedEdit.Height +
    VirtualDrawTree.BorderWidth * 2 + 2, TForm(Self.PopupParent).Height - GetSystemMetrics(SM_CYCAPTION) - 10);

  ShowPopupForm(Self, Point(Left, Top + 2));
end;

procedure TPopupFilesDialog.FormDestroy(Sender: TObject);
begin
  VirtualDrawTree.Images.Free;
end;

procedure TPopupFilesDialog.FormShow(Sender: TObject);
begin
  ButtonedEdit.SetFocus;
end;

procedure TPopupFilesDialog.VirtualDrawTreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode;
  Column: TColumnIndex; var Result: Integer);
var
  Data1, Data2: PSearchRec;
begin
  if Result = 0 then
  begin
    Data1 := VirtualDrawTree.GetNodeData(Node1);
    Data2 := VirtualDrawTree.GetNodeData(Node2);

    Result := -1;

    if not Assigned(Data1) or not Assigned(Data2) then
      Exit;

    Result := AnsiCompareText(Data1.FileName, Data2.FileName);
  end;
end;

procedure TPopupFilesDialog.VirtualDrawTreeDblClick(Sender: TObject);
var
  Node: PVirtualNode;
  Data: PSearchRec;
begin
  Node := VirtualDrawTree.GetFirstSelected;
  Data := VirtualDrawTree.GetNodeData(Node);
  Hide;
  if Assigned(Data) then
    if Assigned(FSelectFile) then
      FSelectFile(Data.PageIndex);
end;

procedure TPopupFilesDialog.VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
var
  Data: PSearchRec;
  S: string;
  R: TRect;
  Format: Cardinal;
begin
  with Sender as TVirtualDrawTree, PaintInfo do
  begin
    Data := Sender.GetNodeData(Node);

    if not Assigned(Data) then
      Exit;

    Canvas.Font.Color := SkinProvider.SkinData.SkinManager.GetActiveEditFontColor;

    if vsSelected in PaintInfo.Node.States then
      Canvas.Font.Color := SkinProvider.SkinData.SkinManager.GetHighLightFontColor;

    SetBKMode(Canvas.Handle, TRANSPARENT);

    R := ContentRect;
    InflateRect(R, -TextMargin, 0);
    Dec(R.Right);
    Dec(R.Bottom);

    S := Data.Filename;

    if Length(S) > 0 then
    begin
      Format := DT_TOP or DT_LEFT or DT_VCENTER or DT_SINGLELINE;

      DrawText(Canvas.Handle, S, Length(S), R, Format);
      if Data.FilePath <> '' then
      begin
        R.Left := R.Left + Canvas.TextWidth(S);
        S := System.SysUtils.Format(' (%s)', [Data.FilePath]);
        Canvas.Font.Color := BlendColors(ColorToRGB(Font.Color), GetControlColor(Parent), DefBlendDisabled);
        //Canvas.Font.Color := MixColors(ColorToRGB(Font.Color), GetControlColor(Parent), DefDisabledBlend);
        DrawText(Canvas.Handle, S, Length(S), R, Format);
      end;
    end;
  end;
end;

procedure TPopupFilesDialog.WMActivate(var AMessage: TWMActivate);
begin
  if AMessage.Active <> WA_INACTIVE then
    SendMessage(Self.PopupParent.Handle, WM_NCACTIVATE, WPARAM(True), -1);

  inherited;
end;

procedure TPopupFilesDialog.ActionClearExecute(Sender: TObject);
begin
  ButtonedEdit.Text := '';
end;

procedure TPopupFilesDialog.ActionSearchExecute(Sender: TObject);
begin
  ButtonedEdit.RightButton.Visible := Trim(ButtonedEdit.Text) <> '';
  SetVisibleRows;
end;

procedure TPopupFilesDialog.ButtonedEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_UP:
      begin
        VirtualDrawTree.SetFocus;
        VirtualDrawTree.Selected[VirtualDrawTree.GetFirstSelected.PrevSibling] := True;
      end;
    VK_DOWN:
      begin
        VirtualDrawTree.SetFocus;
        VirtualDrawTree.Selected[VirtualDrawTree.GetFirstSelected.NextSibling] := True;
      end;
  end;
end;

procedure TPopupFilesDialog.SetVisibleRows;
var
  CurNode: PVirtualNode;
  Data: PSearchRec;
begin
  with VirtualDrawTree do
  begin
    CurNode := GetFirst;
    while Assigned(CurNode) do
    begin
      Data := GetNodeData(CurNode);
      IsVisible[CurNode] := (Pos(UpperCase(ButtonedEdit.Text), UpperCase(Data.FileName)) <> 0) or (ButtonedEdit.Text = '');
      CurNode := CurNode.NextSibling;
    end;
  end;
end;

procedure TPopupFilesDialog.VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PSearchRec;
begin
  Data := Sender.GetNodeData(Node);
  Finalize(Data^);
  inherited;
end;

procedure TPopupFilesDialog.VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: TImageIndex);
var
  Data: PSearchRec;
begin
  if Kind = ikState then
    Exit;
  Data := VirtualDrawTree.GetNodeData(Node);
  if Assigned(Data) then
    ImageIndex := Data.ImageIndex;
end;

procedure TPopupFilesDialog.VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
var
  Data: PSearchRec;
  AMargin: Integer;
begin
  with Sender as TVirtualDrawTree do
  begin
    AMargin := TextMargin;
    Data := GetNodeData(Node);
    if Assigned(Data) then
      NodeWidth := Canvas.TextWidth(Format('%s (%s)', [Data.FileName, Data.FilePath])) + 2 * AMargin;
  end;
end;

end.
