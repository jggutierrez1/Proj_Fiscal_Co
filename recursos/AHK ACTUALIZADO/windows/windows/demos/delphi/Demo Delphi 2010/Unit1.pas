unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
function OpenFpctrl(lpcstr: Ansistring):  boolean; stdcall external 'tfhkaif.dll';
function CloseFpctrl():  boolean; stdcall external 'tfhkaif.dll';
function CheckFprinter():  boolean; stdcall external 'tfhkaif.dll';
function SendCmd(status:Pointer;error:Pointer;cmd:Ansistring): boolean; stdcall external 'tfhkaif.dll';

procedure TForm1.BitBtn1Click(Sender: TObject);
var
Puerto:String;
Result:Boolean;
begin


  Puerto:='COM4';
  result:=CloseFpctrl();

  result:=OpenFpctrl(puerto);

  if result=true then
    label1.caption:= 'verdadero'
  else
    label1.caption:= 'falso';

  end;

  procedure TForm1.Button1Click(Sender: TObject);
  Var
    cmd: AnsiString;
    status:^Integer;
    error:^Integer;
    Resultado:boolean;

  begin
    cmd:='j01Nombre: Jesus Martinez                  ';
    Resultado:=SendCmd(@status,@error,cmd);
    cmd:='!000000100000002000Afeitadoras                             ';
    Resultado:=SendCmd(@status,@error,cmd);
    cmd:='101';
    Resultado:=SendCmd(@status,@error,cmd);

    if Resultado=true then
      label1.caption:= 'Accion Exitosa'
    else
      label1.caption:= 'Accion Fallida';
  end;

  procedure TForm1.Button2Click(Sender: TObject);
  Var
    cmd:AnsiString;
    status:^Integer;
    error:^Integer;
    Resultado:Boolean;

  begin
    cmd:='I0X';
    Resultado:=SendCmd(@status,@error,cmd);
  end;

end.
