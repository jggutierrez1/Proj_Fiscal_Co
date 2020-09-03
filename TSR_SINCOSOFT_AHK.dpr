program TSR_SINCOSOFT_AHK;

uses
  Vcl.Forms,
  SyncObjs,
  main in 'main.pas' {fMain},
  AHK_FISCAL_LIB in 'AHK_FISCAL_LIB.pas',
  utiles in 'utiles.pas',
  CommPortList in 'CommPortList.pas',
  uLkJSON in 'uLkJSON.pas',
  superdate in 'superdate.pas',
  superobject in 'superobject.pas',
  supertimezone in 'supertimezone.pas',
  supertypes in 'supertypes.pas',
  superxmlparser in 'superxmlparser.pas',
  sndkey32 in 'sndkey32.pas',
  NetworkFunctions in 'NetworkFunctions.pas',
  Base64 in 'Base64.pas',
  SplashForm in 'SplashForm.pas' {TSplashForm},
  SplashForm2 in 'SplashForm2.pas' {TSplashForm2};

{$R *.res}

var
  oMutex: TMutex;

begin
  oMutex := SyncObjs.TMutex.Create(nil, False, 'TSR_fiscal_AHK_V2');
  if (GetLastError <> 0) then
  begin
    Exit;
  end;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.Run;

end.
