unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    oFull_Json: TMemo;
    procedure Button1Click(Sender: TObject);
    function BestFit(const AInput: AnsiString): AnsiString;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses SuperObject;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var

  sJsonStrn, sJsonFac, sJsonDet: string;
  cField: string;
  cValue,cValue2: string;
  oJsonFull, oJsonFac, oJsonDet: iSuperObject;
  oItems: TSuperObjectIter;
  oLogFile: TStringlist;
  item: integer;
  oItem2: iSuperObject;
  iIdx: integer;
  oItem3: iSuperObject;
begin
  oLogFile := TStringlist.create;
  sJsonStrn := BestFit(self.oFull_Json.Lines.Text);
  sJsonStrn := StringReplace(sJsonStrn, '\r', ' ', [rfReplaceAll]);
  sJsonStrn := StringReplace(sJsonStrn, #$D, '', [rfReplaceAll]);
  sJsonStrn := StringReplace(sJsonStrn, #$A, '', [rfReplaceAll]);

  oJsonFull := SO(sJsonStrn);
  if not Assigned(oJsonFull) then
  begin
    // Json no valido
    Exit;
  end;

  //*****************JSON INDEPENDIENTE DE CADA UNO*************************
  sJsonFac := oJsonFull.S['print_list.fact_cabs'];
  sJsonDet := oJsonFull.S['print_list.fact_dets'];
  //-------------------------------------------------------------------------

  // *****************************BABECERA****************************
  for iIdx := 0 to oJsonFull['print_list.fact_cabs'].AsArray.Length - 1 do
  begin
    oItem3 := oJsonFull['print_list.fact_cabs'].AsArray[iIdx];
    //cValue2:= oItem3['op_id'].AsString ;

    if ObjectFindFirst(oItem3, oItems) then
      repeat
        cField := oItems.key;
        cValue := oItems.val.AsString;
      until not ObjectFindNext(oItems);
    ObjectFindClose(oItems);
  end;
   oLogFile.FREE;
end;

function TForm1.BestFit(const AInput: AnsiString): AnsiString;
const
  CodePage = 20127; // 20127 = us-ascii
var
  WS: WideString;
begin
  WS := WideString(AInput);
  SetLength(Result, WideCharToMultiByte(CodePage, 0, PWideChar(WS), Length(WS), nil, 0, nil, nil));
  WideCharToMultiByte(CodePage, 0, PWideChar(WS), Length(WS), PAnsiChar(Result), Length(Result), nil, nil);
end;

end.
