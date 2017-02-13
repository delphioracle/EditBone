unit EditBone.Dialog.Popup.Encoding;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VirtualTrees, Vcl.ExtCtrls, sSkinProvider,
  System.Actions, Vcl.ActnList;

type
  TSelectEncodingEvent = procedure(AId: Integer) of object;

  TPopupEncodingDialog = class(TForm)
    VirtualDrawTree: TVirtualDrawTree;
    SkinProvider: TsSkinProvider;
    procedure VirtualDrawTreeDblClick(Sender: TObject);
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; var NodeWidth: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FSelectEncoding: TSelectEncodingEvent;
    procedure WMActivate(var AMessage: TWMActivate); message WM_ACTIVATE;
  public
    procedure Execute(const ASelectedEncoding: string);
    property OnSelectEncoding: TSelectEncodingEvent read FSelectEncoding write FSelectEncoding;
  end;

implementation

{$R *.dfm}

uses
  System.Types, BCControl.Utils, EditBone.Encoding, sGraphUtils, sVclUtils, System.Math, acPopupController;

type
  PSearchRec = ^TSearchRec;
  TSearchRec = packed record
    Id: Integer;
    Name: string;
  end;

procedure TPopupEncodingDialog.FormCreate(Sender: TObject);
begin
  VirtualDrawTree.NodeDataSize := SizeOf(TSearchRec);
end;

procedure TPopupEncodingDialog.FormShow(Sender: TObject);
begin
  VirtualDrawTree.SetFocus;
end;

procedure TPopupEncodingDialog.Execute(const ASelectedEncoding: string);
var
  i: Integer;
  Node: PVirtualNode;
  NodeData: PSearchRec;
  LWidth, LMaxWidth: Integer;

  procedure AddEncoding(AId: Integer; AName: string);
  begin
    Node := VirtualDrawTree.AddChild(nil);
    NodeData := VirtualDrawTree.GetNodeData(Node);

    LWidth := VirtualDrawTree.Canvas.TextWidth(AName);
    if LWidth > LMaxWidth then
      LMaxWidth := LWidth;

    NodeData.Id := AId;
    NodeData.Name := AName;
    VirtualDrawTree.Selected[Node] := ASelectedEncoding = AName;
  end;

begin
  LMaxWidth := 0;

  VirtualDrawTree.Clear;
  for i := Low(ENCODING_CAPTIONS) to High(ENCODING_CAPTIONS) do
    AddEncoding(i, ENCODING_CAPTIONS[i]);

  VirtualDrawTree.Invalidate;

  Width := LMaxWidth + 80;
  Height := Min(Integer(VirtualDrawTree.DefaultNodeHeight) * 7 + VirtualDrawTree.BorderWidth * 2 + 2, TForm(Self.PopupParent).Height);

  ShowPopupForm(Self, Point(Left, Top + 2));
end;

procedure TPopupEncodingDialog.VirtualDrawTreeDblClick(Sender: TObject);
var
  Node: PVirtualNode;
  Data: PSearchRec;
begin
  Node := VirtualDrawTree.GetFirstSelected;
  Data := VirtualDrawTree.GetNodeData(Node);
  if Assigned(Data) then
    if Assigned(FSelectEncoding) then
      FSelectEncoding(Data.Id);
  Hide;
end;

procedure TPopupEncodingDialog.VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
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
    begin
      Canvas.Brush.Color := SkinProvider.SkinData.SkinManager.GetHighLightColor;
      Canvas.Font.Color := SkinProvider.SkinData.SkinManager.GetHighLightFontColor
    end;

    SetBKMode(Canvas.Handle, TRANSPARENT);

    R := ContentRect;
    InflateRect(R, -TextMargin, 0);
    Dec(R.Right);
    Dec(R.Bottom);

    S := Data.Name;

    if Length(S) > 0 then
    begin
      Format := DT_TOP or DT_LEFT or DT_VCENTER or DT_SINGLELINE;

      DrawText(Canvas.Handle, S, Length(S), R, Format);
    end;
  end;
end;

procedure TPopupEncodingDialog.WMActivate(var AMessage: TWMActivate);
begin
  if AMessage.Active <> WA_INACTIVE then
    SendMessage(Self.PopupParent.Handle, WM_NCACTIVATE, WPARAM(True), -1);

  inherited;
end;

procedure TPopupEncodingDialog.VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PSearchRec;
begin
  Data := Sender.GetNodeData(Node);
  Finalize(Data^);
  inherited;
end;

procedure TPopupEncodingDialog.VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas;
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
      NodeWidth := Canvas.TextWidth(Data.Name) + 2 * AMargin;
  end;
end;

end.
