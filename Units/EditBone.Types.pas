unit EditBone.Types;

interface

uses
  System.Classes;

type
  TOpenAllEvent = procedure(var AFileNames: TStrings);

  TOutputRec = packed record
    Level: Byte;
    Filename: string;
    Line: LongInt;
    Character: LongInt;
    TextCharacter: LongWord;
    Text: string;
    SearchString: string;
    Length: Integer;
  end;
  POutputRec = ^TOutputRec;

  TFormatType = (ftJSON, ftSQL, ftXML);

implementation

end.
