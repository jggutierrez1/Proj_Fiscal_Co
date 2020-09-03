unit Memo_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfMemo_form = class(TForm)
    oMComment3: TMemo;
    oObservacion: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMemo_form: TfMemo_form;

implementation

{$R *.dfm}

end.
