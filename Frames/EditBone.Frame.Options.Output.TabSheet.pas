unit EditBone.Frame.Options.Output.TabSheet;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  BCCommon.Options.Container, BCCommon.Frame.Options.Base, BCControl.Panel,
  acSlider, sLabel, Vcl.ExtCtrls, Vcl.StdCtrls, sPanel, sFrameAdapter;

type
  TOptionsOutputTabsFrame = class(TBCOptionsBaseFrame)
    Panel: TBCPanel;
    ShowImageStickyLabelShowImage: TsStickyLabel;
    SliderCloseTabByDblClick: TsSlider;
    SliderCloseTabByMiddleClick: TsSlider;
    SliderMultiline: TsSlider;
    SliderRightClickSelect: TsSlider;
    SliderSaveTabs: TsSlider;
    SliderShowCloseButton: TsSlider;
    SliderShowImage: TsSlider;
    StickyLabelCloseTabByDblClick: TsStickyLabel;
    StickyLabelCloseTabByMiddleClick: TsStickyLabel;
    StickyLabelMultiline: TsStickyLabel;
    StickyLabelRightClickSelect: TsStickyLabel;
    StickyLabelSaveTabs: TsStickyLabel;
    StickyLabelShowCloseButton: TsStickyLabel;
    SliderShowFindInFilesButton: TsSlider;
    StickyLabelShowFindInFilesButton: TsStickyLabel;
  protected
    procedure GetData; override;
    procedure PutData; override;
  public
    destructor Destroy; override;
  end;

function OptionsOutputTabsFrame(AOwner: TComponent): TOptionsOutputTabsFrame;

implementation

{$R *.dfm}

uses
  BCCommon.Utils;

var
  FOptionsOutputTabsFrame: TOptionsOutputTabsFrame;

function OptionsOutputTabsFrame(AOwner: TComponent): TOptionsOutputTabsFrame;
begin
  if not Assigned(FOptionsOutputTabsFrame) then
    FOptionsOutputTabsFrame := TOptionsOutputTabsFrame.Create(AOwner);
  Result := FOptionsOutputTabsFrame;
  AlignSliders(Result.Panel);
end;

destructor TOptionsOutputTabsFrame.Destroy;
begin
  inherited;
  FOptionsOutputTabsFrame := nil;
end;

procedure TOptionsOutputTabsFrame.GetData;
begin
  SliderCloseTabByDblClick.SliderOn := OptionsContainer.OutputCloseTabByDblClick;
  SliderCloseTabByMiddleClick.SliderOn := OptionsContainer.OutputCloseTabByMiddleClick;
  SliderMultiLine.SliderOn := OptionsContainer.OutputMultiLine;
  SliderSaveTabs.SliderOn := OptionsContainer.OutputSaveTabs;
  SliderShowCloseButton.SliderOn := OptionsContainer.OutputShowCloseButton;
  SliderShowImage.SliderOn := OptionsContainer.OutputShowImage;
  SliderShowFindInFilesButton.SliderOn := OptionsContainer.OutputShowFindInFilesButton;
  SliderRightClickSelect.SliderOn := OptionsContainer.OutputRightClickSelect;
end;

procedure TOptionsOutputTabsFrame.PutData;
begin
  OptionsContainer.OutputCloseTabByDblClick := SliderCloseTabByDblClick.SliderOn;
  OptionsContainer.OutputCloseTabByMiddleClick := SliderCloseTabByMiddleClick.SliderOn;
  OptionsContainer.OutputMultiLine := SliderMultiLine.SliderOn;
  OptionsContainer.OutputSaveTabs := SliderSaveTabs.SliderOn;
  OptionsContainer.OutputShowCloseButton := SliderShowCloseButton.SliderOn;
  OptionsContainer.OutputShowImage := SliderShowImage.SliderOn;
  OptionsContainer.OutputShowFindInFilesButton := SliderShowFindInFilesButton.SliderOn;
  OptionsContainer.OutputRightClickSelect := SliderRightClickSelect.SliderOn;
end;

end.
