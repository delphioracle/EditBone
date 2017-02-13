program EditBone;
								  
uses
  {$ifdef DEBUG}
  FastMM4,
  {$endif }
  Winapi.Windows,
  Winapi.Messages,
  Vcl.Forms,
  EditBone.Consts in 'Units\EditBone.Consts.pas',
  EditBone.DataModule.Images in 'DataModules\EditBone.DataModule.Images.pas' {EBDataModuleImages: TDataModule},
  EditBone.Dialog.About in 'Dialogs\EditBone.Dialog.About.pas' {AboutDialog},
  EditBone.Dialog.DirectoryTab in 'Dialogs\EditBone.Dialog.DirectoryTab.pas' {DirectoryTabDialog},
  EditBone.Directory in 'Units\EditBone.Directory.pas',
  EditBone.Document in 'Units\EditBone.Document.pas',
  EditBone.FindInFiles in 'Units\EditBone.FindInFiles.pas',
  EditBone.Form.LanguageEditor in 'Forms\EditBone.Form.LanguageEditor.pas' {LanguageEditorForm},
  EditBone.Form.Main in 'Forms\EditBone.Form.Main.pas' {MainForm},
  EditBone.Form.Options in 'Forms\EditBone.Form.Options.pas' {OptionsForm},
  EditBone.Form.UnicodeCharacterMap in 'Forms\EditBone.Form.UnicodeCharacterMap.pas' {UnicodeCharacterMapForm},
  EditBone.Frame.Options.Directory in 'Frames\EditBone.Frame.Options.Directory.pas' {OptionsDirectoryFrame: TFrame},
  EditBone.Frame.Options.Directory.TabSheet in 'Frames\EditBone.Frame.Options.Directory.TabSheet.pas' {OptionsDirectoryTabsFrame: TFrame},
  EditBone.Frame.Options.Editor.Defaults in 'Frames\EditBone.Frame.Options.Editor.Defaults.pas' {OptionsEditorDefaultsFrame: TFrame},
  EditBone.Frame.Options.Editor.TabSheet in 'Frames\EditBone.Frame.Options.Editor.TabSheet.pas' {OptionsEditorTabsFrame: TFrame},
  EditBone.Frame.Options.FileTypes in 'Frames\EditBone.Frame.Options.FileTypes.pas' {OptionsFileTypesFrame: TFrame},
  EditBone.Frame.Options.Output.TabSheet in 'Frames\EditBone.Frame.Options.Output.TabSheet.pas' {OptionsOutputTabsFrame: TFrame},
  EditBone.Output in 'Units\EditBone.Output.pas',
  EditBone.Types in 'Units\EditBone.Types.pas',
  EditBone.XMLTree in 'Units\EditBone.XMLTree.pas',
  EditBone.Dialog.Popup.Files in 'Dialogs\EditBone.Dialog.Popup.Files.pas' {PopupFilesDialog},
  EditBone.Dialog.ChangedFiles in 'Dialogs\EditBone.Dialog.ChangedFiles.pas' {ChangedFilesDialog};

{$R *.res}

{$ifdef RELEASE}
var
  LIndex: Integer;
  LParam: string;
  LWindow: HWND;
  LCopyDataStruct: TCopyDataStruct;
{$endif}
begin
  {$ifdef DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$endif}
  {$ifdef RELEASE}
  LWindow := FindWindow(SWindowClassName, nil);
  if LWindow = 0 then
  begin
  {$endif}
    Application.Initialize;
    Application.Title := 'EditBone';
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TMainForm, MainForm);
    Application.Run;
  {$ifdef RELEASE}
  end
  else
  begin
    FillChar(LCopyDataStruct, Sizeof(TCopyDataStruct), 0);
    for LIndex := 1 to ParamCount do
    begin
      LParam := ParamStr(LIndex);
      LCopyDataStruct.cbData := (Length(LParam) + 1) * SizeOf(Char);
      LCopyDataStruct.lpData := PChar(LParam);
      SendMessage(LWindow, WM_COPYDATA, 0, NativeInt(@LCopyDataStruct));
    end;
    SetForegroundWindow(LWindow);
  end;
  {$endif}
end.
