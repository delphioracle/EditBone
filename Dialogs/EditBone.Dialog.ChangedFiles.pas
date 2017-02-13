unit EditBone.Dialog.ChangedFiles;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BCCommon.Dialog.Base, Vcl.StdCtrls, Vcl.ExtCtrls, sPanel, BCControl.Panel,
  VirtualTrees, sSkinProvider;

type
  PChangedFilesTreeData = ^TChangedFilesTreeData;
  TChangedFilesTreeData = record
    Index: Integer;
    FileName: string;
    Path: string;
  end;

  TChangedFilesDialog = class(TBCBaseDialog)
    PanelButtons: TBCPanel;
    ButtonFind: TButton;
    ButtonCancel: TButton;
    VirtualDrawTree: TVirtualDrawTree;
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode;
      var InitialStates: TVirtualNodeInitStates);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; var NodeWidth: Integer);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
  private
    { Private declarations }
    procedure SetDrawTreeData(AFileNames: TStrings);
  public
    function Execute(AFileNames: TStrings): Boolean;
  end;

implementation

{$R *.dfm}

uses
  System.Math, System.Types;

function TChangedFilesDialog.Execute(AFileNames: TStrings): Boolean;
begin
  VirtualDrawTree.NodeDataSize := SizeOf(TChangedFilesTreeData);
  SetDrawTreeData(AFileNames);
  Result := ShowModal = mrOk;
end;

procedure TChangedFilesDialog.SetDrawTreeData(AFileNames: TStrings);
var
  LIndex: Integer;
  LNode: PVirtualNode;
  LData: PChangedFilesTreeData;
begin
  VirtualDrawTree.BeginUpdate;
  VirtualDrawTree.Clear;
  VirtualDrawTree.DefaultNodeHeight := Max(Canvas.TextHeight('Tg'), 18);
  for LIndex := 0 to AFileNames.Count - 1 do
  begin
    LNode := VirtualDrawTree.AddChild(nil);
    LData := VirtualDrawTree.GetNodeData(LNode);
    LData^.Index := Integer(AFileNames.Objects[LIndex]);
    LData^.FileName := ExtractFileName(AFileNames[LIndex]);
    LData^.Path := ExtractFilePath(AFileNames[LIndex]);
  end;
  LNode := VirtualDrawTree.GetFirst;
  if Assigned(LNode) then
    VirtualDrawTree.Selected[LNode] := True;
  VirtualDrawTree.EndUpdate;
end;

procedure TChangedFilesDialog.VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
var
  LText: string;
  LData: PChangedFilesTreeData;
  LFormat: Cardinal;
  LRect: TRect;
begin
  with Sender as TVirtualDrawTree, PaintInfo do
  begin
    LData := Sender.GetNodeData(Node);

    if not Assigned(LData) then
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

    if Column = 0 then
      LText := LData^.FileName
    else
      LText := LData^.Path;

    LRect := ContentRect;
    if Length(LText) > 0 then
    begin
      LFormat := DT_TOP or DT_LEFT or DT_VCENTER or DT_SINGLELINE;
      DrawText(Canvas.Handle, LText, Length(LText), LRect, LFormat)
    end;
  end;
end;

procedure TChangedFilesDialog.VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  LData: PChangedFilesTreeData;
begin
  LData := VirtualDrawTree.GetNodeData(Node);
  Finalize(LData^);
  inherited;
end;

procedure TChangedFilesDialog.VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
var
  LData: PChangedFilesTreeData;
  LText: string;
begin
  with Sender as TVirtualDrawTree do
  begin
    LData := Sender.GetNodeData(Node);
    if Column = 0 then
      LText := LData^.FileName
    else
      LText := LData^.Path;
    if Assigned(LData) then
      NodeWidth := Canvas.TextWidth(LText);
  end;
end;

procedure TChangedFilesDialog.VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode;
  var InitialStates: TVirtualNodeInitStates);
begin
  with Sender do
  begin
    CheckType[Node] := ctCheckBox;
    CheckState[Node] := csCheckedNormal;
  end
end;

end.