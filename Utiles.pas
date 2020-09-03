﻿{ ******************************************************* }
{ johnn Gutierrez jg_gutierrez@yahoo.es }
{ Mayo 2019 }
{ ******************************************************* }
unit utiles;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, ComObj,
  Dialogs, inifiles, StdCtrls, Buttons, ExtCtrls, Menus, ComCtrls, Registry,
  ExtActns,
  ZConnection, ZDataset, DBCtrlsEh, GridsEh, DBGridEh, BASE64,
  ShellAPI, DB, ADODB, DBCtrls, FileCtrl, StrUtils, WinSvc, math, variants,
  ZSqlProcessor, ZScriptParser,
  Grids, WinSpool, Printers,
  PsAPI, TlHelp32,
  IdCustomTransparentProxy, IdSocks, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdException, IdGlobal, IdSync,
  uLkJSON, WinInet, networkFunctions, System.DateUtils;

type
  Config2 = object
    host: string;
    usuario: string;
    clave: string;
    puerto: integer;
    database: string;
    reportes: string;
    estado: string;
    protocol: string;
    nAutoLogin: integer;
    nAutoStartE: integer;
    nAutoStartR: integer;
    cUsername: string;
    cPassword: string;
    cServerNa: string;
    ResizeScrn: integer;
    LicenseType: integer;
  end;

type
  TDateTimePart = (dtpHour, dtpMinute, dtpSecond, dtpMS, dtpDay, dtpMonth, dtpYear);

type
  THackAccess = class(TcustomDBGridEh)
  end;

type
  TCorner = (cLeftTop, cLeftButton, cRightTop, cRightButton);

var
  oPublicCnn, oPublicCnnProc: TZConnection;
  oFileIni: TiniFile;
  cConfigIniFle: string;

  cUsa_Imp_Fiscal: string;
  oSetting_Fac: Config2;
  sSlectedHost: string;
  WaitForm: TForm;
  WaitLabel: TLabel;
  WaitEdit: TEdit;
  bShow_QryMessage: Boolean = False;
  cApp_Fecha_sistema: Tdatetime;
  cApp_imp_01: string;
  cApp_imp_02: string;
  cApp_imp_03: string;
  cpDecimales: Char = '.';
  cpThousand: Char = ',';
  bConnectionOk: Boolean;
  cId_Estacion: string;
  cId_empresa: string;
  cTmpFlsPath: string;

const
  C1 = 52845;
  C2 = 22719;

procedure ProperCase(var oText: TDBEdit);
procedure WriteToLog(const key: string; const level: integer; const description: string);
procedure SaveFileFromString(const FileName: TFileName; const content: string);
procedure CenterFormOverActive(AForm: TForm);
procedure CenterForm(AForm: TForm);
procedure ShellExecute_AndWait(FileName: string; Params: string);
procedure MoveDBGridColumns(DBGrid: TDBGridEh; FromColumn, ToColumn: integer);
function GetWindowsDir: TFileName;
procedure LogToFileV0(const s, FileName: string);
function GetAppVersion(): string;
function CreateUniqueFileName(sPath: string): string;
function delete_Files(sPath: string; sExten: string): Boolean;
function MakeRNDString(Chars: string; Count: integer): string;
function LoadFileToString(const FileName: string): widestring;
procedure SaveStringToFile(const Path, Data: string);
function LDOM(Date: Tdatetime): Tdatetime;
function FDOM(Date: Tdatetime): Tdatetime;
function RandomWord(dictSize, lngStepSize, wordLen, minWordLen: integer): string;
function RemoveNonAlpha(srcStr: string): string;
function RandomPassword(PLen: integer): string;

procedure set_decimal_separator(pDecimal_Separator: Char);
function isEmpty(s: string): Boolean; overload;
function isEmpty(s: single): Boolean; overload;
procedure WriteIniFacilValue(cSeccion, cIdent, cType: string; vDataValue: variant);
function Read_IniFacilValue(cSeccion, cIdent, cType: string; vDefaValue: variant): variant;
procedure CloseIniFacilValue;
procedure Delete_IniFacilValue(cSeccion, cIdent: string);
function WriteRawDataToPrinter2(PrinterName: string; Str: string): Boolean;
function GetSetting(pClaveReg: string): Boolean;
function SaveSetting(pClaveReg: string): Boolean;
function iif(Test: Boolean; TrueR, FalseR: variant): variant;
procedure LogToFile(const s, FileName: string);
function WaitEnd: Boolean;
procedure WaitSetMsg(sMsg: string);
function WaitStart(TheParent: TComponent; sMsg: string): Boolean;
function PadL(ASource: string; ALimit: integer; APadChar: Char = ' '): string;
function PadR(ASource: string; ALimit: integer; APadChar: Char = ' '): string;
function StrToFloat2(cStr: string): Extended;
function stripped(stripchar: Char; Str: string): string;
function DateTimeAdd(SrcDate: Tdatetime; DatePart: TDateTimePart; DiffValue: integer): Tdatetime;
function CenterString(aStr: string; Len: integer): string;
function Query_Selectg(var oQuery_In: TZQuery; cSql_Text: string; bShowMessage: Boolean = False; bSaveLogFile: Boolean = False): Boolean;
function query_updateg(text: string; bShowMessage: Boolean = False; bSaveLogFile: Boolean = False; bGrava: Boolean = False): Boolean;
function FormatSumadora_FloatToStr(fValue: Extended; DigitInt: integer; DigitFloat: integer): string;
function RoundDn(X: single): single;
function RoundUp(X: single): single;
function Sgn(X: single): integer;
function RoundD(X: currency; d: integer): Extended;
procedure Delay(msecs: integer);
function Carga_Setting_Conn(): Boolean;
procedure GetDefault_Decinal_Thousand_Separator;
function Check_Host_IsAlive(cHost: string; nPort: integer): Boolean;
function Replicate(Caracter: string; Quant: integer): string;
function Inlist(aCadena: string; aLista: array of string): Boolean;
function Query_SelectGen_Result(cSql_Text: string; bShowMessage: Boolean = False; bSaveLogFile: Boolean = False): string;
function Query_SelectGen(cSql_Text: string; bShowMessage: Boolean = False; bSaveLogFile: Boolean = False): Boolean;
function FloatToStr3(fValue: Extended; nDigit: integer = 2): string;
function IsStrANumber(const s: string): Boolean;
Procedure LoadSerialPorts2(Items: TStrings);
function Decrypt(const InString: string; Salt: string): string;
function Encrypt(const InString: string; Salt: string): string;
function JSONObjectToDataRow(const AJson: widestring; const AValue: TDataSet): Boolean;
function CheckInternet: Boolean;
function tiempo_Trans_Result(pStartTime: DWORD; pEndTime: DWORD; iFlag: integer = 0): string;

function Replace_Year_in_Datetime(pDateTime: Tdatetime; pYear: integer): Tdatetime;
function Replace_Month_in_Datetime(pDateTime: Tdatetime; pMonth: integer): Tdatetime;
function Replace_Day_in_Datetime(pDateTime: Tdatetime; pDay: integer): Tdatetime;
function Replace_Minute_in_Datetime(pDateTime: Tdatetime; pMinute: integer): Tdatetime;
function Replace_Hour_in_Datetime(pDateTime: Tdatetime; pHour: integer): Tdatetime;

function Add_Minutes_in_Datetime(pDateTime: Tdatetime; pMinute: integer): Tdatetime;
function Add_Hours_in_Datetime(pDateTime: Tdatetime; pHour: integer): Tdatetime;
function Add_Years_in_Datetime(pDateTime: Tdatetime; pYear: integer): Tdatetime;
function Add_Months_in_Datetime(pDateTime: Tdatetime; pMonth: integer): Tdatetime;
function Add_Days_in_Datetime(pDateTime: Tdatetime; pDay: integer): Tdatetime;

procedure TxtFile_Write(FileName: string; cFull_Text: string);
function Sto_GetFmtFileVersion(const FileName: String = ''; const Fmt: String = '%d.%d.%d.%d'): String;
function RepeatString(const s: string; Count: cardinal): string;
function removeLeadingZeros(const Value: string): string;
function GetComputerNetName: string;
procedure Split(const Delimiter: Char; Input: string; const Strings: TStrings);
function CornerForm(form: TCustomForm; corner: TCorner): Boolean;
function GetUNCName(const LocalPath: string): string;
procedure FormDegrade(oForm: TForm);
procedure FormTransparence(oForm: TForm; iLimit: integer = 0);
function isValidPath(Value: string): Boolean;
function Get_File_Size2(sFileToExamine: string): integer;
function tiempo_Transcurrido(pStartTime: DWORD; pEndTime: DWORD): string;
function GetProgramFilesDir2: string;
function Par2(Num: integer): Boolean;
function esPrimo(X: integer): Boolean;
function TimeToDateTime(pTime: Ttime): Tdatetime;
function ReplaceDatePart(pDateTime: Tdatetime; pDateReplace: Tdatetime): Tdatetime;
function par(n: integer): Boolean;
function MapNetworkDriveDLG(const handle: THandle; const uncPath: string): string;
procedure LoadStringGrid(StringGrid: TStringGrid; const FileName: TFileName);
procedure SaveStringGrid(StringGrid: TStringGrid; const FileName: TFileName);
procedure AppendCurrent(DataSet: TDataSet);
procedure DataRefresh(var oDataset: TDataSet; pfield_Name: string);
function Strip(L, c: Char; Str: string): string;
procedure Poner_Facil_De_Inicio_Windows(pCierraSession: Boolean = True);
procedure ReiniciaWindows;
procedure CierraSessionWindows;
procedure OpcionesApagarWindows(Sender: TObject);
procedure QuitarEjecutarEnInicio(NombreEjecutable: string; SoloUnaVez, SoloUsuario: Boolean);
procedure EjecutarEnInicio(NombrePrograma, NombreEjecutable: string; SoloUnaVez, SoloUsuario: Boolean);
function SeEjecutaEnInicio(NombreEjecutable: string; SoloUnaVez, SoloUsuario: Boolean): Boolean;
procedure PrintLineOnDotMatrix(cPrinterName: string; cDocName: string; cString: string; bDobleCarr: Boolean; bTest: Boolean = False);
function CenterText(nWidth: integer; sText: string): string;
function CadLongitudFija(cadena: string; longitud: integer; posicionIzquierda: Boolean; valorRelleno: string): string;
procedure PrintLineToGeneric(const line: string);
function Ctrl_Resize: Boolean;
function FloatToStr2(Value: Extended): string;
procedure Set_Decinal_Thousand_Separator;
function SecToTime(Sec: integer): string;
function between(nval, nmin, nmax: Longint): Boolean;
function strTran(cText, cfor, cwith: string): string;
function EjecutarComando(comando: string): string;
function IsNumber(const c: Char): Boolean;
function FormatNumber(flt: Double; decimals: integer = 0; Thousands: Boolean = True): string; overload;
function FormatNumber(int: Int64; Thousands: Boolean = True): string; overload;
function FormatNumber(Str: string; Thousands: Boolean = True): string; overload;
function UnformatNumber(Val: string): string;
procedure FindAllFiles(const Path: string; Attr: integer; List: TStrings);
function GetWindowsTempDirectory: string;
function LastDayInMonth(const Year, Month: Word): Tdatetime;
function DayOfYear(const Year, Month, Day: Word): integer;
function HexToString(s: string): string;
function StringToHex(s: string): string;
function Win32CreateProcess(const FileName, Parameters: string; var ExitCode: DWORD; const Wait: DWORD = 0; const Hide: Boolean = False): Boolean;
function WinExecAndWait32(FileName: string; Visibility: integer): integer;
function RightStr(const Str: string; Size: Word): string;
function MidStr(const Str: string; From, Size: Word): string;
function LeftStr(const Str: string; Size: Word): string;
procedure SyncErrLog(const key: string; const level: integer; const description: string);
Function ReplaceNonAscii(const s: String): String;
procedure Chamadora;
function RetiraCaracteresEspeciais(Texto: string; Caracteres: array of Char): string;
function TrocaCaracterEspecial(aTexto: string; aLimExt: Boolean): string;

implementation

uses SplashForm;

procedure ProperCase(var oText: TDBEdit);
var
  GetString: string;
  GetLength: integer;
  i: integer;
  T: string;
begin
  if oText.SelLength > 0 then
    GetString := oText.Seltext
  else
    GetString := oText.text;
  GetLength := Length(GetString);
  if GetLength > 0 then
  begin
    for i := 0 to GetLength do
    begin
      if (GetString = ' ') or (i = 0) then
      begin
        if GetString[i + 1] in ['a' .. 'z'] then
        begin
          T := GetString[i + 1];
          T := UpperCase(T);
          GetString[i + 1] := T[1];
        end;
      end;
    end;
    if oText.SelLength > 0 then
      oText.Seltext := GetString
    else
      oText.text := GetString;
  end;
end;

function CornerForm(form: TCustomForm; corner: TCorner): Boolean;
var
  r: TRect;
begin
  Result := False;
  if SystemParametersInfo(SPI_GETWORKAREA, 0, @r, 0) then
  begin
    case corner of
      cLeftTop:
        begin
          form.Top := r.Top;
          form.Left := r.Left;
        end;
      cLeftButton:
        begin
          form.Left := r.Left;
          form.Top := r.Bottom - form.Height;
        end;
      cRightTop:
        begin
          form.Top := r.Top;
          form.Left := r.Right - form.Width;
        end;
      cRightButton:
        begin
          form.Top := r.Bottom - form.Height;
          form.Left := r.Right - form.Width;
        end;
    end;
    Result := True;
  end
  else
    RaiseLastOSError();
end;

procedure WriteToLog(const key: string; const level: integer; const description: string);
var
  DirectoryName: string;
  FileName: string;
  LogFile: textfile;
begin
  DirectoryName := ExcludeTrailingBackslash(ExtractFilePath(Application.ExeName)) + 'LOG';
  // Create directory, if necessary.
  if not DirectoryExists(DirectoryName) then
    ForceDirectories(DirectoryName);
  FileName := FormatDateTime('yyyymm', Now) + '.LOG';
  AssignFile(LogFile, DirectoryName + '\' + FileName);
  try
    if FileExists(DirectoryName + '\' + FileName) then
      Append(LogFile)
    else
      Rewrite(LogFile); // Create if new
    if level = 0 then
      WriteLn(LogFile) // blank line
    else
      WriteLn(LogFile, FormatDateTime('dd hh:nn:ss', Now), ' ', Format('%-16s', [key]), ' ', description);
    CloseFile(LogFile)
  except
    // Ignore exceptions while writing log files
  end;
end;

procedure SaveFileFromString(const FileName: TFileName; const content: string);
{ Writing a file from a string }
begin
  with TFileStream.Create(FileName, fmCreate) do
    try
      Write(Pointer(content)^, Length(content));
    finally
      Free;
    end;
end;

procedure CenterFormOverActive(AForm: TForm);
var
  ALeft, ATop: integer;
begin
  ALeft := Screen.ActiveForm.Left + (Screen.ActiveForm.Width div 2) - (AForm.Width div 2);
  ATop := Screen.ActiveForm.Top + (Screen.ActiveForm.Height div 2) - (AForm.Height div 2);
  { prevent form from being outside screen }
  if ALeft < 0 then
    ALeft := Screen.ActiveForm.Left;
  if ATop < 0 then
    ATop := Screen.ActiveForm.Top;
  if (ALeft + AForm.Width > Screen.Width) or (ATop + AForm.Height > Screen.Height) then
    CenterForm(AForm)
  else
    { prevents form being twice repainted! }
    AForm.SetBounds(ALeft, ATop, AForm.Width, AForm.Height);
end;

procedure CenterForm(AForm: TForm);
var
  ALeft, ATop: integer;
begin
  ALeft := (Screen.Width - AForm.Width) div 2;
  ATop := (Screen.Height - AForm.Height) div 2;
  { prevents form being twice repainted! }
  AForm.SetBounds(ALeft, ATop, AForm.Width, AForm.Height);
end;

procedure ShellExecute_AndWait(FileName: string; Params: string);
var
  exInfo: TShellExecuteInfo;
  Ph: DWORD;
begin
  FillChar(exInfo, SizeOf(exInfo), 0);
  with exInfo do
  begin
    cbSize := SizeOf(exInfo);
    fMask := SEE_MASK_NOCLOSEPROCESS or SEE_MASK_FLAG_DDEWAIT;
    Wnd := GetActiveWindow();
    exInfo.lpVerb := 'open';
    exInfo.lpParameters := PChar(Params);
    lpFile := PChar(FileName);
    nShow := SW_SHOWNORMAL;
  end;
  if ShellExecuteEx(@exInfo) then
    Ph := exInfo.hProcess
  else
  begin
    showmessage(SysErrorMessage(GetLastError));
    exit;
  end;
  while WaitForSingleObject(exInfo.hProcess, 50) <> WAIT_OBJECT_0 do
    Application.ProcessMessages;
  CloseHandle(Ph);
end;

procedure MoveDBGridColumns(DBGrid: TDBGridEh; FromColumn, ToColumn: integer);
begin
  THackAccess(DBGrid).MoveColumn(FromColumn, ToColumn);
end;

function GetWindowsDir: TFileName;
var
  WinDir: array [0 .. MAX_PATH - 1] of Char;
begin
  SetString(Result, WinDir, GetWindowsDirectory(WinDir, MAX_PATH));
  if Result = '' then
    raise Exception.Create(SysErrorMessage(GetLastError));
end;

function GetAppVersion(): string;
var
  Size, Size2: DWORD;
  Pt, Pt2: Pointer;
begin
  Size := GetFileVersionInfoSize(PChar(Application.ExeName), Size2);
  if Size > 0 then
  begin
    GetMem(Pt, Size);
    try
      GetFileVersionInfo(PChar(Application.ExeName), 0, Size, Pt);
      VerQueryValue(Pt, '\', Pt2, Size2);
      with TVSFixedFileInfo(Pt2^) do
      begin
        Result := IntToStr(HiWord(dwFileVersionMS)) + '.' + IntToStr(LoWord(dwFileVersionMS)) + '.' + IntToStr(HiWord(dwFileVersionLS)) + '.' + IntToStr(LoWord(dwFileVersionLS));
      end;
    finally
      FreeMem(Pt);
    end;
  end;
end;

function CreateUniqueFileName(sPath: string): string;
var
  chTemp: Char;
begin
  repeat
    Randomize;
    repeat
      chTemp := Chr(Random(43) + 47);
      if chTemp in ['0' .. '9', 'A' .. 'Z'] then
        Result := Result + chTemp;
    until Length(Result) = 12;
  until not FileExists(sPath + Result);
end;

function delete_Files(sPath: string; sExten: string): Boolean;
var
  SearchRec: TSearchRec;
begin
  if (FindFirst(sPath + sExten, faAnyfile - faDirectory, SearchRec) = 0) then
  begin
    repeat
      DeleteFile(sPath + SearchRec.name);
    until (FindNext(SearchRec) <> 0);
    FindClose(SearchRec);
  end;
  Result := True;
end;

function MakeRNDString(Chars: string; Count: integer): string;
var
  i, X: integer;
begin
  Result := '';
  for i := 0 to Count - 1 do
  begin
    X := Length(Chars) - Random(Length(Chars));
    Result := Result + Chars[X];
    Chars := Copy(Chars, 1, X - 1) + Copy(Chars, X + 1, Length(Chars));
  end;
end;

function LoadFileToString(const FileName: string): widestring;
var
  handle, Size: cardinal;
begin
  handle := CreateFile(PChar(FileName), GENERIC_READ, 0, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  if handle <> INVALID_HANDLE_VALUE then
    try
      Size := GetFileSize(handle, nil);
      SetLength(Result, integer(Size));
      ReadFile(handle, PChar(Result)^, Size, Size, nil);
    finally
      CloseHandle(handle);
    end
  else
    RaiseLastOSError;
end;

procedure SaveStringToFile(const Path, Data: string);
var
  fp: file of Byte;
begin
  AssignFile(fp, Path);
  FileMode := fmOpenWrite;
  Rewrite(fp);
  try
    BlockWrite(fp, Pointer(Data)^, Length(Data));
  finally
    CloseFile(fp);
  end;
end;

function FDOM(Date: Tdatetime): Tdatetime;
var
  wYear, wMonth, wDay: Word;
begin
  DecodeDate(Date, wYear, wMonth, wDay);
  Result := EncodeDate(wYear, wMonth, 1);
end;

function LDOM(Date: Tdatetime): Tdatetime;
var
  wYear, wMonth, wDay: Word;
begin
  DecodeDate(Date, wYear, wMonth, wDay);
  // (if Month < 12 then inc(Month)
  // else begin Month := 1; inc(Year) end;
  // Result := EncodeDate(Year, Month, 1) - 1;
  Result := EncodeDate(wYear, wMonth, MonthDays[IsLeapYear(wYear), wMonth]);
end;

function RandomWord(dictSize, lngStepSize, wordLen, minWordLen: integer): string;
begin
  Result := '';
  if (wordLen < minWordLen) and (minWordLen > 0) then
    wordLen := minWordLen
  else if (wordLen < 1) and (minWordLen < 1) then
    wordLen := 1;
  repeat
    Result := Result + Chr(Random(dictSize) + lngStepSize);
  until (Length(Result) = wordLen);
end;

function RemoveNonAlpha(srcStr: string): string;
var
  i: integer;
begin
  Result := '';
  for i := 0 to Length(srcStr) - 1 do
    if isCharAlpha(srcStr[i]) then
      Result := Result + srcStr[i];
end;

function RandomPassword(PLen: integer): string;
var
  Str: string;
  cResult: string;
begin
  Randomize;
  cResult := '';
  Str := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  repeat
    cResult := cResult + Str[Random(Length(Str)) + 1];
  until (Length(cResult) = PLen);
  Result := cResult;
end;

function isEmpty(s: string): Boolean; overload;
begin
  if (Trim(s) <> '') then
    Result := False
  else
    Result := True
end;

function isEmpty(s: single): Boolean; overload;
begin
  if (s <> 0) then
    Result := False
  else
    Result := True
end;

procedure Delete_IniFacilValue(cSeccion, cIdent: string);
var
  cGetDir: string;
  // oFileIni: TiniFile;
begin
  if oFileIni = nil then
    oFileIni := TiniFile.Create(utiles.cConfigIniFle);

  oFileIni.DeleteKey(cSeccion, cIdent);

  // freeandnil(oFileIni);
end;

function Read_IniFacilValue(cSeccion, cIdent, cType: string; vDefaValue: variant): variant;
var
  cGetDir: string;
  // oFileIni: TiniFile;
  vResult: variant;
begin
  {
    cType=s string
    cType=i integer
    cType=f extended
    cType=d Date
    cType=b Boollean
  }
  cType := UpperCase(Trim(cType));

  if FileExists(utiles.cConfigIniFle) = False then
  begin

    if ((cType = 'S') or (cType = 'C')) then
      vResult := '';

    if cType = 'I' then
      vResult := 0;

    if cType = 'F' then
      vResult := 0.00;

    if cType = 'D' then
      vResult := Now();

    if cType = 'DT' then
      vResult := Now();

    if cType = 'T' then
      vResult := time();

    if cType = 'B' then
      vResult := False;

    exit;
  end;

  if oFileIni = nil then
    oFileIni := TiniFile.Create(utiles.cConfigIniFle);

  if ((cType = 'S') or (cType = 'C')) then
  begin
    vResult := '';
    vResult := oFileIni.ReadString(cSeccion, cIdent, vDefaValue);

    if oFileIni.ValueExists(cSeccion, cIdent) = False then
      oFileIni.WriteString(cSeccion, cIdent, vResult);
  end;

  if cType = 'I' then
  begin
    vResult := 0;
    vResult := oFileIni.ReadInteger(cSeccion, cIdent, vDefaValue);

    if oFileIni.ValueExists(cSeccion, cIdent) = False then
      oFileIni.WriteInteger(cSeccion, cIdent, vResult);
  end;

  if cType = 'F' then
  begin
    vResult := 0.00;
    vResult := oFileIni.ReadFloat(cSeccion, cIdent, vDefaValue);

    if oFileIni.ValueExists(cSeccion, cIdent) = False then
      oFileIni.WriteFloat(cSeccion, cIdent, vResult);
  end;

  if cType = 'D' then
  begin
    vResult := oFileIni.ReadDate(cSeccion, cIdent, vDefaValue);

    if oFileIni.ValueExists(cSeccion, cIdent) = False then
      oFileIni.WriteDate(cSeccion, cIdent, vResult);
  end;

  if cType = 'DT' then
  begin
    vResult := oFileIni.ReadDateTime(cSeccion, cIdent, vDefaValue);

    if oFileIni.ValueExists(cSeccion, cIdent) = False then
      oFileIni.WriteDateTime(cSeccion, cIdent, vResult);
  end;

  if cType = 'T' then
  begin
    vResult := oFileIni.ReadTime(cSeccion, cIdent, vDefaValue);

    if oFileIni.ValueExists(cSeccion, cIdent) = False then
      oFileIni.WriteTime(cSeccion, cIdent, vResult);
  end;

  if cType = 'B' then
  begin
    vResult := False;
    vResult := oFileIni.ReadBool(cSeccion, cIdent, vDefaValue);

    if oFileIni.ValueExists(cSeccion, cIdent) = False then
      oFileIni.WriteBool(cSeccion, cIdent, vResult);
  end;

  Result := vResult;
  // freeandnil(oFileIni);
end;

procedure WriteIniFacilValue(cSeccion, cIdent, cType: string; vDataValue: variant);
var
  cGetDir: string;
  // oFileIni: TiniFile;
begin

  {
    cType=s string
    cType=i integer
    cType=f extended
    cType=d Date
    cType=b Boollean
  }
  if FileExists(utiles.cConfigIniFle) = False then
  begin
    exit;
  end;

  if oFileIni = nil then
    oFileIni := TiniFile.Create(utiles.cConfigIniFle);

  cType := UpperCase(Trim(cType));

  if ((cType = 'S') or (cType = 'C')) then
    oFileIni.WriteString(cSeccion, cIdent, vDataValue);

  if cType = 'I' then
    oFileIni.WriteInteger(cSeccion, cIdent, vDataValue);

  if cType = 'F' then
    oFileIni.WriteFloat(cSeccion, cIdent, vDataValue);

  if cType = 'D' then
    oFileIni.WriteDate(cSeccion, cIdent, vDataValue);

  if cType = 'DT' then
    oFileIni.WriteDateTime(cSeccion, cIdent, vDataValue);

  if cType = 'T' then
    oFileIni.WriteTime(cSeccion, cIdent, vDataValue);

  if cType = 'B' then
    oFileIni.WriteBool(cSeccion, cIdent, vDataValue);

  // freeandnil(oFileIni);
end;

procedure CloseIniFacilValue;
begin
  if oFileIni <> nil then
    freeandnil(oFileIni);
end;

function WriteRawDataToPrinter2(PrinterName: string; Str: string): Boolean;
var
  PrinterHandle: THandle;
  DocInfo: TDocInfo1;
  i: integer;
  B: Byte;
  Escritos: DWORD;
begin
  Result := False;
  if OpenPrinter(PChar(PrinterName), PrinterHandle, nil) then
    try
      FillChar(DocInfo, SizeOf(DocInfo), #0);
      with DocInfo do
      begin
        pDocName := PChar('RCTECH');
        pOutputFile := nil;
        pDataType := 'RAW';
      end;
      if StartDocPrinter(PrinterHandle, 1, @DocInfo) <> 0 then
        try
          if StartPagePrinter(PrinterHandle) then
            try
              while Length(Str) > 0 do
              begin
                if Copy(Str, 1, 1) = '\' then
                begin
                  if UpperCase(Copy(Str, 2, 1)) = 'X' then
                    Str[2] := '$';
                  if not TryStrToInt(Copy(Str, 2, 3), i) then
                    exit;
                  B := Byte(i);
                  Delete(Str, 1, 3);
                end
                else
                  B := Byte(Str[1]);
                Delete(Str, 1, 1);
                WritePrinter(PrinterHandle, @B, 1, Escritos);
              end;
              Result := True;
            finally
              EndPagePrinter(PrinterHandle);
            end;
        finally
          EndDocPrinter(PrinterHandle);
        end;
    finally
      ClosePrinter(PrinterHandle);
    end;
end;

function SaveSetting(pClaveReg: string): Boolean;
var
  sPass: string;
begin
  try

    if (oFileIni = nil) then
      oFileIni := TiniFile.Create(utiles.cConfigIniFle);

    if Trim(oSetting_Fac.clave) = '' then
      sPass := ''
    else
      sPass := oSetting_Fac.clave;

    with oFileIni do
    begin
      WriteString(pClaveReg, 'Servidor', Trim(oSetting_Fac.host));
      WriteString(pClaveReg, 'protocol', Trim(oSetting_Fac.protocol));
      WriteString(pClaveReg, 'Usuario', Trim(oSetting_Fac.usuario));
      WriteString(pClaveReg, 'Clave', sPass);
      WriteInteger(pClaveReg, 'Puerto', oSetting_Fac.puerto);
      WriteString(pClaveReg, 'base', Trim(oSetting_Fac.database));
      WriteString(pClaveReg, 'rutarep', Trim(oSetting_Fac.reportes));
      WriteString(pClaveReg, 'conectado', Trim(oSetting_Fac.estado));
      // Free;
    end;

    Result := True;
  except
    on E: Exception do
    begin
      Application.ShowException(E);
      Result := False;
    end;
  end;
end;

function GetSetting(pClaveReg: string): Boolean;
var
  sTmpP: string;
  sPath: string;
  sFile: string;
begin
  try
    if oFileIni = nil then
      oFileIni := TiniFile.Create(utiles.cConfigIniFle);

    with oSetting_Fac do
    begin
      sTmpP := oFileIni.ReadString(pClaveReg, 'clave', '');
      if Trim(sTmpP) = '' then
        clave := ''
      else
        clave := sTmpP;
      // clave      := Decrypt(sTmpP)

      host := oFileIni.ReadString(pClaveReg, 'Servidor', 'localhost');
      protocol := oFileIni.ReadString(pClaveReg, 'protocol', 'mysql-5');
      usuario := oFileIni.ReadString(pClaveReg, 'Usuario', 'root');
      puerto := oFileIni.ReadInteger(pClaveReg, 'puerto', ord(3306));
      database := oFileIni.ReadString(pClaveReg, 'base', 'dbName');
      reportes := oFileIni.ReadString(pClaveReg, 'reportes', sPath + 'Reportes');
      estado := oFileIni.ReadString(pClaveReg, 'conectado', '');
    end;
    Result := True;
    utiles.sSlectedHost := pClaveReg;
  except
    on E: Exception do
    begin
      Application.ShowException(E);
      Result := False;
      utiles.sSlectedHost := '';
    end;
  end;
end;

function iif(Test: Boolean; TrueR, FalseR: variant): variant;
begin
  if Test then
    Result := TrueR
  else
    Result := FalseR;
end;

procedure LogToFileV0(const s, FileName: string);
var
  FileMode: Word;
  LogLine: string;
begin
  if utiles.isEmpty(FileName) then
    exit;

  if FileExists(FileName) then
    FileMode := fmOpenWrite or fmShareDenyWrite
  else
    FileMode := fmCreate;
  with TFileStream.Create(FileName, FileMode) do
    try
      Seek(0, soFromEnd);
      LogLine := s + sLineBreak;
      Write(PChar(LogLine)^, Length(LogLine));
    finally
      Free;
    end;
end;

procedure LogToFile(const s, FileName: string);
var
  oFile: TStrings;
begin
  oFile := TStringList.Create;

  if FileExists(FileName) then
    oFile.LoadFromFile(FileName);

  oFile.Add(s);
  oFile.SaveToFile(FileName);
  freeandnil(oFile);
end;

{ ==================================================================================================
  //Este juego de funciones WaitStart,WaitSetMsg,WaitEnd es utilizado para mostrar un peque�o
  //popup que muestra un emnsaje en particular;
  //WaitStart inicia y muestra la ventana, WaitSetMsg presenta el mensaje de texto que se quiere mostrar
  //y WaitEnd lo libera.
  ---------------------------------------------1--------------------------------------------------- }

function WaitStart(TheParent: TComponent; sMsg: string): Boolean;
begin
  Result := False;
  if (nil = WaitForm) then
  begin
    WaitForm := TForm.Create(TheParent);
    with WaitForm do
    begin
      defaultmonitor := dmDesktop;
      Position := poScreenCenter;
      Width := 500;
      Height := 70;
      // color := clYellow;

      WaitLabel := TLabel.Create(WaitForm);
      // WaitLabel.Align := alClient;
      WaitLabel.Align := alTop;
      WaitLabel.Width := 45;
      WaitLabel.Alignment := taCenter;
      WaitLabel.Font.Size := 10;
      WaitLabel.ParentFont := False;
      WaitLabel.Caption := sMsg;
      WaitLabel.Parent := WaitForm;
      WaitLabel.AlignWithMargins := True;

      { WaitEdit := TEdit.Create(WaitForm);
        //WaitEdit.Align := alBottom;
        WaitEdit.text := '';
        WaitEdit.left := 189;
        WaitEdit.top := 48;
        WaitEdit.Height := 21;
        WaitEdit.Width := 121;
        //WaitEdit.color := clYellow;
        WaitEdit.taborder := 0;
        WaitEdit.ParentColor := true;
      }
      SetWindowLong(handle, GWL_STYLE, GetWindowLong(handle, GWL_STYLE) and not WS_CAPTION);
      ClientHeight := Height;

      Show;
      Update;
    end;
    Result := True;
  end;
end;

{ ---------------------------------------------2--------------------------------------------------- }

procedure WaitSetMsg(sMsg: string);
begin
  if (nil <> WaitForm) then
  begin
    WaitLabel.Caption := sMsg;
    WaitForm.Refresh;
  end;
end;

{ ---------------------------------------------3--------------------------------------------------- }

function WaitEnd: Boolean;
begin
  Result := False;
  if (nil <> WaitForm) then
  begin
    WaitForm.Hide;
    freeandnil(WaitForm);
    Result := True;
  end;
end;
{ =============================================================================================== }

// EX: PadL('123', 5, '0') ==> 00123

function PadL(ASource: string; ALimit: integer; APadChar: Char = ' '): string;
var
  i: integer;
begin
  Result := ASource;
  for i := 1 to ALimit - Length(Result) do
  begin
    Result := APadChar + Result;
  end;
end;

// EX: PadR('123', 5, '0') ==> 12300

function PadR(ASource: string; ALimit: integer; APadChar: Char = ' '): string;
var
  i: integer;
begin
  Result := ASource;
  for i := 1 to ALimit - Length(Result) do
  begin
    Result := Result + APadChar;
  end;
end;

function StrToFloat2(cStr: string): Extended;
var
  cValue: string;
begin
  cValue := utiles.iif(Trim(cStr) = '', '0.00', Trim(cStr));
  Result := StrToFloat(stripped(',', cValue));
end;

function stripped(stripchar: Char; Str: string): string;
var
  tmpstr: string;
begin
  tmpstr := Str;
  while pos(stripchar, tmpstr) > 0 do
    Delete(tmpstr, pos(stripchar, tmpstr), 1);
  stripped := tmpstr;

end;

{
  Sample:

  var
  Date3MonthsAfterNow: TDateTime;
  Date2YearsAgo: TDateTime;
  Date11DaysAfterNow: TDateTime;
  begin
  Date3MonthsAfterNow := DateTimeAdd(Now, dtpMonth, 3);
  Date2YearsAgo := DateTimeAdd(Now, dtpYear, -2); // negative is OK
  Date11DaysAfterNow := DateTimeAdd(Now, dtpDay, 11);
  end;
}

function DateTimeAdd(SrcDate: Tdatetime; DatePart: TDateTimePart; DiffValue: integer): Tdatetime;
var
  m, d, y: Word;
begin
  case DatePart of
    dtpHour: { hour }
      Result := SrcDate + (DiffValue / 24);
    dtpMinute: { Minute }
      Result := SrcDate + (DiffValue / 1440);
    dtpSecond: { Second }
      Result := SrcDate + (DiffValue / 86400);
    dtpMS: { Millisecond }
      Result := SrcDate + (DiffValue / 86400000);
    dtpDay: { Day }
      Result := SrcDate + DiffValue;
    dtpMonth: { Month }
      Result := IncMonth(SrcDate, DiffValue);
  else { Year }
    begin
      DecodeDate(SrcDate, y, m, d);
      Result := Trunc(EncodeDate(y + DiffValue, m, d)) + Frac(SrcDate);
    end;
  end;
end;

function CenterString(aStr: string; Len: integer): string;
var
  posStr: integer;
begin
  if Length(aStr) > Len then
    Result := Copy(aStr, 1, Len)
  else
  begin
    posStr := (Len - Length(aStr)) div 2;
    Result := Format('%*s', [Len, aStr + Format('%-*s', [posStr, ''])]);
  end;
end;

function query_updateg(text: string; bShowMessage: Boolean = False; bSaveLogFile: Boolean = False; bGrava: Boolean = False): Boolean;
var
  ex_query: TZQuery;
  cLogFleName, cErr_Data: string;
begin
  cLogFleName := ExtractFilePath(Application.ExeName) + 'ERROR_SIS.LOG';

  if (bShow_QryMessage = True) then
  begin
    if (bShowMessage = False) then
    begin
      bShowMessage := True;
      bSaveLogFile := True;
    end;
  end;

  ex_query := TZQuery.Create(nil);
  ex_query.Connection := oPublicCnn;

  ex_query.close;
  ex_query.SQL.Clear;
  ex_query.SQL.text := text;
  {
    if bGrava = true then
    begin
    if trim(text) <> '' then
    Form2.oLog_Save_Offline.Lines.Add(text + ';');
    end;
  }
  try
    ex_query.ExecSQL;
    Result := True;
  except
    on E: Exception do
    begin
      if (bSaveLogFile = True) then
      begin
        cErr_Data := Format('%s - %s - %s', [FormatDateTime('dd/mm/yyyy HH:mm:ss', Now()), E.Message, E.ClassName]);
        LogToFile(cErr_Data, cLogFleName);
        LogToFile('SQL EXPRESION: ' + text, cLogFleName);
      end;
      if (bShowMessage = True) then
        Application.ShowException(E);
      Result := False;
    end;
  end;
  freeandnil(ex_query);
end;

function Query_Selectg(var oQuery_In: TZQuery; cSql_Text: string; bShowMessage: Boolean = False; bSaveLogFile: Boolean = False): Boolean;
var
  cLogFleName, cErr_Data: string;
begin
  cLogFleName := ExtractFilePath(Application.ExeName) + 'ERROR_SIS.LOG';

  if (bShow_QryMessage = True) then
  begin
    if (bShowMessage = False) then
    begin
      bShowMessage := True;
      bSaveLogFile := True;
    end;
  end;

  if oQuery_In.Connection = nil then
    oQuery_In.Connection := oPublicCnn;

  oQuery_In.close;
  oQuery_In.SQL.Clear;
  oQuery_In.SQL.text := cSql_Text;
  try
    oQuery_In.open;

    if oQuery_In.fields[0].Value = null then
      Result := False
    else
    begin
      if oQuery_In.fields[0].text <> '' then
        Result := True
      else
        Result := False;
    end;
  except
    on E: Exception do
    begin
      if (bSaveLogFile = True) then
      begin
        cErr_Data := Format('%s - %s - %s', [FormatDateTime('dd/mm/yyyy HH:mm:ss', Now()), E.Message, E.ClassName]);
        LogToFile(cErr_Data, cLogFleName);
        LogToFile('SQL EXPRESION: ' + cSql_Text, cLogFleName);
      end;
      if (bShowMessage = True) then
        Application.ShowException(E);
      Result := False;
    end;
  end;
end;

function FormatSumadora_FloatToStr(fValue: Extended; DigitInt: integer; DigitFloat: integer): string;
var
  nValueIn: integer;
  iFactMul: integer;
  nTmp_Val: integer;
  fTmp_Val: Extended;
  cDecForm: string;
  cTmp_Int: string;
  cTmp_Dec: string;
  cRtValue: string;
begin
  nValueIn := 0;
  iFactMul := 0;
  nTmp_Val := 0;
  cDecForm := '';
  cTmp_Int := '';
  cTmp_Dec := '';
  cRtValue := '';

  nValueIn := Trunc(fValue);
  case DigitFloat of
    0:
      begin
        cDecForm := '#######0';
        iFactMul := 1;
      end;
    1:
      begin
        cDecForm := '#######0.0';
        iFactMul := 10;
      end;
    2:
      begin
        cDecForm := '#######0.00';
        iFactMul := 100;
      end;
    3:
      begin
        cDecForm := '#######0.000';
        iFactMul := 1000;
      end;
  else
    begin
      cDecForm := '#######0.00';
      iFactMul := 100;
    end;
  end;
  cTmp_Int := utiles.PadL(Trim(IntToStr(nValueIn)), DigitInt, '0');
  if DigitFloat > 0 then
  begin
    fTmp_Val := ((fValue - nValueIn) * iFactMul);
    cTmp_Dec := Trim(FormatFloat('#######0', fTmp_Val));
    cTmp_Dec := utiles.PadL(cTmp_Dec, DigitFloat, '0');
  end
  else
    cTmp_Dec := '';
  cRtValue := Trim(cTmp_Int) + Trim(cTmp_Dec);
  Result := cRtValue;
end;

{ --------------------------------------------------------------------------------------------
  // Devuelve -1, 0 o 1 de acuerdo al signo del argumento
  -------------------------------------------------------------------------------------------- }
function Sgn(X: single): integer;
begin
  if X < 0 then
    Result := -1
  else
  begin
    if X = 0 then
      Result := 0
    else
      Result := 1;
  end;
end;

{ --------------------------------------------------------------------------------------------
  // Devuelve el primer entero mayor que o igual al n�mero dado en valor absoluto
  // (se preserva el signo).
  // RoundUp(3.3) = 4    RoundUp(-3.3) = -4
  -------------------------------------------------------------------------------------------- }
function RoundUp(X: single): single;
begin
  Result := int(X) + Sgn(Frac(X));
end;

{ --------------------------------------------------------------------------------------------
  // Devuelve el primer entero menor que o igual al n�mero dado en valor absoluto
  // (se preserva el signo).
  //   RoundDn(3.7) = 3    RoundDn(-3.7) = -3
  -------------------------------------------------------------------------------------------- }
function RoundDn(X: single): single;
begin
  Result := int(X);
end;

{ -------------------------------------------------------------------------------------------------
  Estas funciones que acabamos de presentar siempre redondean el �ltimo d�gito entero, pero a veces
  necesitamos redondear por ejemplo la segunda cifra decimal o los miles, millones y billones. La siguiente funci�n realiza un "redondeo normal" tomando un par�metro adicional para indicar el d�gito a ser redondeado:
  // RoundD(123.456, 0) = 123.00
  // RoundD(123.456, 2) = 123.46
  // RoundD(123456, -3) = 123000
}
function RoundD(X: currency; d: integer): Extended;
var
  n: Extended;
begin

  n := IntPower(10, d);
  X := X * n;
  Result := (int(X) + int(Frac(X) * 2)) / n;
end;

procedure set_decimal_separator(pDecimal_Separator: Char);
begin
  utiles.cpDecimales := pDecimal_Separator;
  FormatSettings.DecimalSeparator := utiles.cpDecimales;
end;

procedure Delay(msecs: integer);
var
  FirstTickCount: Longint;
begin
  FirstTickCount := GetTickCount;
  repeat
    Sleep(1);
    // or use Application.ProcessMessages instead of Sleep
  until ((GetTickCount - FirstTickCount) >= Longint(msecs));
end;

function Carga_Setting_Conn(): Boolean;
begin
  try
    if ((utiles.oPublicCnn = nil) or (utiles.oPublicCnn.Connected = False)) then
    begin
      utiles.oPublicCnn := TZConnection.Create(nil);
    end;

    if ((utiles.oPublicCnnProc = nil) or (utiles.oPublicCnnProc.Connected = False)) then
    begin
      utiles.oPublicCnnProc := TZConnection.Create(nil);
    end;

    if (utiles.oPublicCnn.Connected = False) then
    begin
      if pos('MYSQL', UpperCase(utiles.oSetting_Fac.protocol)) > 0 then
      begin
        utiles.oPublicCnn.Properties.Clear;
        utiles.oPublicCnn.Properties.Add('CLIENT_MULTI_STATEMENTS=1');
      end;
      utiles.oPublicCnn.HostName := utiles.oSetting_Fac.host;
      utiles.oPublicCnn.protocol := Trim(utiles.oSetting_Fac.protocol);
      utiles.oPublicCnn.Port := utiles.oSetting_Fac.puerto;
      utiles.oPublicCnn.User := utiles.oSetting_Fac.usuario;
      utiles.oPublicCnn.Password := utiles.oSetting_Fac.clave;
      utiles.oPublicCnn.database := utiles.oSetting_Fac.database;
      utiles.oPublicCnn.Catalog := utiles.oSetting_Fac.database;
      if utiles.Check_Host_IsAlive(utiles.oSetting_Fac.host, utiles.oSetting_Fac.puerto) = True then
      begin
        utiles.oPublicCnn.Connected := True;
      end
      else
      begin
        bConnectionOk := False;
        Result := False;
        exit;
      end;
    end;

    if (utiles.oPublicCnnProc.Connected = False) then
    begin
      if pos('MYSQL', UpperCase(utiles.oSetting_Fac.protocol)) > 0 then
      begin
        utiles.oPublicCnnProc.Properties.Clear;
        utiles.oPublicCnnProc.Properties.Add('CLIENT_MULTI_STATEMENTS=1');
      end;
      utiles.oPublicCnnProc.HostName := utiles.oSetting_Fac.host;
      utiles.oPublicCnnProc.protocol := Trim(utiles.oSetting_Fac.protocol);
      utiles.oPublicCnnProc.Port := utiles.oSetting_Fac.puerto;
      utiles.oPublicCnnProc.User := utiles.oSetting_Fac.usuario;
      utiles.oPublicCnnProc.Password := utiles.oSetting_Fac.clave;
      utiles.oPublicCnnProc.database := utiles.oSetting_Fac.database;
      utiles.oPublicCnnProc.Catalog := utiles.oSetting_Fac.database;
      utiles.oPublicCnnProc.Connected := True;
    end;

    bConnectionOk := utiles.oPublicCnn.Connected;
    utiles.GetDefault_Decinal_Thousand_Separator;
    utiles.sSlectedHost := utiles.oPublicCnnProc.HostName;
    Result := oPublicCnn.Connected;
  except
    utiles.sSlectedHost := '';
    bConnectionOk := False;
    Result := bConnectionOk;
    exit;
  end;
end;

procedure GetDefault_Decinal_Thousand_Separator;
var
  Decimal: PChar;
  Thousand: PChar;
  tmp: string;
begin
  if ((cpDecimales <> #0) and (cpThousand <> #0)) then
    exit;

  Decimal := StrAlloc(10);
  GetLocaleInfo(LOCALE_SYSTEM_DEFAULT, LOCALE_SDECIMAL, Decimal, 10);
  tmp := Decimal;
  FormatSettings.DecimalSeparator := tmp[1];
  cpDecimales := tmp[1];

  Thousand := StrAlloc(10);
  GetLocaleInfo(LOCALE_SYSTEM_DEFAULT, LOCALE_STHOUSAND, Thousand, 10);
  tmp := Thousand;
  FormatSettings.ThousandSeparator := tmp[1];
  cpThousand := tmp[1];
end;

function Check_Host_IsAlive(cHost: string; nPort: integer): Boolean;
var
  IdTCPClient1: TIdTCPClient;
  cIpAdress: string;
  oFileIni: TiniFile;
  nValue: integer;
begin
  oFileIni := TiniFile.Create(utiles.cConfigIniFle);
  nValue := 0;
  if ((Trim(cHost) = '') and (nPort = 0)) then
  begin
    Result := False;
    exit;
  end;
  if ((Trim(cHost) = '') or (nPort = 0)) then
  begin
    Result := False;
    exit;
  end;

  nValue := oFileIni.ReadInteger('Fiscal_Opt', 'Ping_ON_Connect', 0);
  if (nValue = 1) then
  begin
    cIpAdress := networkFunctions.GetIp(cHost);
    if networkFunctions.Ping(cIpAdress, 50) = False then
    begin
      Result := False;
      exit;
    end;
  end;
  oFileIni.WriteInteger('Fiscal_Opt', 'Ping_ON_Connect', nValue);
  oFileIni.Free;

  IdTCPClient1 := TIdTCPClient.Create(nil);
  IdTCPClient1.host := cHost;
  IdTCPClient1.Port := nPort;
  IdTCPClient1.ConnectTimeout := 0;
  try
    begin
      IdTCPClient1.Connect;
      Result := True;
      freeandnil(IdTCPClient1);
      exit;
    end;
  except
    Result := False;
    freeandnil(IdTCPClient1);
    exit;
  end;
end;

{ --------------------------------------------------------------------------------------------
  esta funci�n duplica un caracter las cantidad de veces especificada.
  Cadena:=Replicate('=',20)
  devuelve a cadena '===================='
  ---------------------------------------------------------------------------------------------- }
function Replicate(Caracter: string; Quant: integer): string;
var
  i: integer;
begin
  Result := '';
  for i := 1 to Quant do
    Result := Result + Caracter;
end;

{ -------------------------------------------------------------------------------------------------
  esta funcion es original de Foxpro/Visual Foxpro, le agregas una lista de elementos y te devuelve
  true si la cadena contiene alguno de los elementos de la lista y false si no lo tiene.
  ejemplo de uso:

  VariableTexto:='gato';
  if Inlist(VariableTexto,['perro','gato','canario'])=true then
  begin
  //es un gato
  .....
  end;
  -------------------------------------------------------------------------------------------------- }
function Inlist(aCadena: string; aLista: array of string): Boolean;
var
  i: integer;
begin
  Result := False;
  for i := Low(aLista) to High(aLista) do
  begin
    if UpperCase(aCadena) = UpperCase(aLista[i]) then
    begin
      Result := True;
      break;
    end;
  end;
end;

function Query_SelectGen(cSql_Text: string; bShowMessage: Boolean = False; bSaveLogFile: Boolean = False): Boolean;
var
  oQuery_Loc: TZQuery;
  cLogFleName, cErr_Data: string;
begin
  cLogFleName := ExtractFilePath(Application.ExeName) + 'ERROR_SIS.LOG';

  if (bShow_QryMessage = True) then
  begin
    if (bShowMessage = False) then
    begin
      bShowMessage := True;
      bSaveLogFile := True;
    end;
  end;

  oQuery_Loc := TZQuery.Create(nil);
  oQuery_Loc.Connection := utiles.oPublicCnn;
  oQuery_Loc.close;
  oQuery_Loc.SQL.Clear;
  oQuery_Loc.SQL.text := cSql_Text;
  try
    oQuery_Loc.open;
    if oQuery_Loc.fields[0].text <> '' then
      Result := True
    else
      Result := False;
  except
    on E: Exception do
    begin
      if (bSaveLogFile = True) then
      begin
        cErr_Data := Format('%s - %s - %s', [FormatDateTime('dd/mm/yyyy HH:mm:ss', Now()), E.Message, E.ClassName]);
        LogToFile(cErr_Data, cLogFleName);
        LogToFile('SQL EXPRESION: ' + cSql_Text, cLogFleName);
      end;
      if (bShowMessage = True) then
        Application.ShowException(E);
      Result := False;
    end;
  end;
  freeandnil(oQuery_Loc);
end;

function Query_SelectGen_Result(cSql_Text: string; bShowMessage: Boolean = False; bSaveLogFile: Boolean = False): string;
var
  oQuery_Loc: TZQuery;
  cLogFleName, cErr_Data: string;
begin
  cLogFleName := ExtractFilePath(Application.ExeName) + 'ERROR_SIS.LOG';

  if (bShow_QryMessage = True) then
  begin
    if (bShowMessage = False) then
    begin
      bShowMessage := True;
      bSaveLogFile := True;
    end;
  end;

  oQuery_Loc := TZQuery.Create(nil);
  oQuery_Loc.Connection := utiles.oPublicCnn;
  oQuery_Loc.close;
  oQuery_Loc.SQL.Clear;
  oQuery_Loc.SQL.text := cSql_Text;
  try
    oQuery_Loc.open;
    if oQuery_Loc.fields[0].AsString <> '' then
      Result := oQuery_Loc.fields[0].AsString
    else
      Result := oQuery_Loc.fields[0].AsString;
  except
    on E: Exception do
    begin
      if (bSaveLogFile = True) then
      begin
        cErr_Data := Format('%s - %s - %s', [FormatDateTime('dd/mm/yyyy HH:mm:ss', Now()), E.Message, E.ClassName]);
        LogToFile(cErr_Data, cLogFleName);
        LogToFile('SQL EXPRESION: ' + cSql_Text, cLogFleName);
      end;
      if (bShowMessage = True) then
        Application.ShowException(E);
      Result := '';
    end;
  end;
  freeandnil(oQuery_Loc);
end;

function FloatToStr3(fValue: Extended; nDigit: integer = 2): string;
var
  cMask: string;
begin
  cMask := '%20.' + Trim(IntToStr(nDigit)) + 'f';
  Result := Trim(Format(cMask, [fValue]));
end;

{ -----------------------------------------------------------------------------------------------
  Esta función determina si una cadena contiene sólo números
  ------------------------------------------------------------------------------------------------ }
function IsStrANumber(const s: string): Boolean;
var
  P: PChar;
begin
  P := PChar(s);
  Result := False;
  while P^ <> #0 do
  begin
    if not(P^ in ['0' .. '9']) then
      exit;
    Inc(P);
  end;
  Result := True;
end;

Procedure LoadSerialPorts2(Items: TStrings);
var
  RegIni: TRegistry;
  AList: TStringList;
  loop: integer;
begin
  Items.Clear;
  RegIni := TRegistry.Create;
  with RegIni do
    try
      RootKey := HKEY_LOCAL_MACHINE;
      if KeyExists('HARDWARE') and OpenKey('HARDWARE', False) then
      begin
        if KeyExists('DEVICEMAP') and OpenKey('DEVICEMAP', False) then
        begin
          if KeyExists('SERIALCOMM') and OpenKey('SERIALCOMM', False) then
          begin
            AList := TStringList.Create;
            try
              GetValueNames(AList);
              loop := 0;
              while loop <= AList.Count - 1 do
              begin
                Items.Add(ReadString(AList[loop]));
                Inc(loop);
              end;
            finally
              AList.Free;
            end;
          end;
        end;
      end;
    finally
      RegIni.Free;
    end;
end;

function Encrypt(const InString: string; Salt: string): string;
var
  i: Byte;
  StartKey, MultKey, AddKey: Word;
begin
  Result := '';
  if (Salt = '') then
  begin
    Result := InString;
  end
  else
  begin
    StartKey := Length(Salt);
    MultKey := ord(Salt[1]);
    AddKey := 0;
    for i := 1 to Length(Salt) - 1 do
      AddKey := AddKey + ord(Salt[i]);
    for i := 1 to Length(InString) do
    begin
      Result := Result + Char(Byte(InString[i]) xor (StartKey shr 8));
      StartKey := (Byte(Result[i]) + StartKey) * MultKey + AddKey;
    end;
  end;
end;

function Decrypt(const InString: string; Salt: string): string;
var
  i: Byte;
  StartKey, MultKey, AddKey: Word;
begin
  Result := '';
  if (Salt = '') then
  begin
    Result := InString;
  end
  else
  begin
    StartKey := ord(Salt[1]);
    MultKey := Length(Salt);
    AddKey := 0;
    for i := 1 to Length(Salt) - 1 do
      AddKey := AddKey + ord(Salt[i]);
    for i := 1 to Length(InString) do
    begin
      Result := Result + Char(Byte(InString[i]) xor (StartKey shr 8));
      StartKey := (Byte(InString[i]) + StartKey) * MultKey + AddKey;
    end;
  end;
end;

function JSONObjectToDataRow(const AJson: widestring; const AValue: TDataSet): Boolean;
var
  IdxFld, IdxRecord: integer;
  oJson, oitem: TlkJSONbase;
  cField, cValue: string;
begin
  Result := False;
  oJson := TlkJSON.ParseText(AJson);
  for IdxRecord := 0 to pred(oJson.Count) do
  begin
    oitem := TlkJSONObject(oJson).child[IdxRecord];
    AValue.Append;
    for IdxFld := 0 to AValue.FieldDefs.Count - 1 do
    begin
      cField := AValue.FieldDefs[IdxFld].name;
      cValue := oitem.Field[cField].Value;
      AValue.FieldByName(cField).Value := Trim(cValue);
    end;
    AValue.post;
  end;
  oJson.Free;
end;

function CheckInternet: Boolean;
const
  // local system uses a modem to connect to the Internet.
  INTERNET_CONNECTION_MODEM = 1;
  // local system uses a local area network to connect to the Internet.
  INTERNET_CONNECTION_LAN = 2;
  // local system uses a proxy server to connect to the Internet.
  INTERNET_CONNECTION_PROXY = 4;
  // local system's modem is busy with a non-Internet connection.
  INTERNET_CONNECTION_MODEM_BUSY = 8;
var
  dwConnectionTypes: DWORD;
begin
  dwConnectionTypes := INTERNET_CONNECTION_MODEM + INTERNET_CONNECTION_LAN + INTERNET_CONNECTION_PROXY;
  Result := InternetGetConnectedState(@dwConnectionTypes, 0);
end;

function tiempo_Trans_Result(pStartTime: DWORD; pEndTime: DWORD; iFlag: integer = 0): string;
var
  ElapsedTime: DWORD;
  Estimated_hours: DWORD;
  Estimated_Minutes: DWORD;
  Estimated_seconds: DWORD;
begin
  ElapsedTime := pEndTime - pStartTime;
  // calculo de horas minutos y segundos
  Estimated_hours := (ElapsedTime div (3600 * 999)) mod 24;
  Estimated_Minutes := (ElapsedTime div (60 * 999)) mod 60;
  Estimated_seconds := (ElapsedTime div 999) mod 60;
  case iFlag of
    0:
      Result := Trim(IntToStr(Estimated_hours) + ':' + IntToStr(Estimated_Minutes) + ':' + IntToStr(Estimated_seconds));
    1:
      Result := Trim(IntToStr(Estimated_hours));
    2:
      Result := Trim(IntToStr(Estimated_Minutes));
    3:
      Result := Trim(IntToStr(Estimated_seconds));
    4:
    else
      Result := '';
  end;
end;

function Replace_Day_in_Datetime(pDateTime: Tdatetime; pDay: integer): Tdatetime;
begin
  Result := RecodeDate(pDateTime, YearOf(pDateTime), MonthOf(pDateTime), pDay);
end;

function Replace_Month_in_Datetime(pDateTime: Tdatetime; pMonth: integer): Tdatetime;
begin
  Result := RecodeDate(pDateTime, YearOf(pDateTime), pMonth, DayOf(pDateTime));
end;

function Replace_Year_in_Datetime(pDateTime: Tdatetime; pYear: integer): Tdatetime;
begin
  Result := RecodeDate(pDateTime, pYear, MonthOf(pDateTime), DayOf(pDateTime));
end;

function Replace_Hour_in_Datetime(pDateTime: Tdatetime; pHour: integer): Tdatetime;
begin
  Result := RecodeTime(pDateTime, pHour, MinuteOf(pDateTime), SecondOf(pDateTime), 0);
end;

function Replace_Minute_in_Datetime(pDateTime: Tdatetime; pMinute: integer): Tdatetime;
begin
  Result := RecodeTime(pDateTime, HourOf(pDateTime), pMinute, SecondOf(pDateTime), 0);
end;

function Add_Days_in_Datetime(pDateTime: Tdatetime; pDay: integer): Tdatetime;
begin
  Result := DateTimeAdd(pDateTime, dtpDay, pDay);
end;

function Add_Months_in_Datetime(pDateTime: Tdatetime; pMonth: integer): Tdatetime;
begin
  Result := DateTimeAdd(pDateTime, dtpMonth, pMonth);
end;

function Add_Years_in_Datetime(pDateTime: Tdatetime; pYear: integer): Tdatetime;
begin
  Result := DateTimeAdd(pDateTime, dtpYear, pYear);
end;

function Add_Hours_in_Datetime(pDateTime: Tdatetime; pHour: integer): Tdatetime;
begin
  Result := DateTimeAdd(pDateTime, dtpHour, pHour);
end;

function Add_Minutes_in_Datetime(pDateTime: Tdatetime; pMinute: integer): Tdatetime;
begin
  Result := DateTimeAdd(pDateTime, dtpMinute, pMinute);
end;

function DateForSQL(const pDate: TDate): string;
var
  y, m, d: Word;
begin
  DecodeDate(pDate, y, m, d);
  Result := Format('#%.*d-%.*d-%.*d#', [4, y, 2, m, 2, d]);
end;

function DateTimeForSQL(const pDateTime: Tdatetime): string;
begin
  Result := FormatDateTime('yyyy-mm-dd hh:nn:ss', pDateTime);
end;

procedure TxtFile_Write(FileName: string; cFull_Text: string);
var
  SomeTxtFile: textfile;
begin
  if Trim(cFull_Text) = '' then
    exit;
  if not FileExists(FileName) then
    exit;
  AssignFile(SomeTxtFile, FileName);
  Append(SomeTxtFile);

  WriteLn(SomeTxtFile, cFull_Text);
  CloseFile(SomeTxtFile);
end;

function Sto_GetFmtFileVersion(const FileName: String = ''; const Fmt: String = '%d.%d.%d.%d'): String;
var
  sFilename: String;
  iBufferSize: DWORD;
  iDummy: DWORD;
  pBuffer: Pointer;
  pFileInfo: Pointer;
  iVer: array [1 .. 4] of Word;
begin
  // set default value
  Result := '';
  // get filename of exe/dll if no filename is specified
  sFilename := FileName;
  if (sFilename = '') then
  begin
    // prepare buffer for path and terminating #0
    SetLength(sFilename, MAX_PATH + 1);
    SetLength(sFilename, GetModuleFileName(hInstance, PChar(sFilename), MAX_PATH + 1));
  end;
  // get size of version info (0 if no version info exists)
  iBufferSize := GetFileVersionInfoSize(PChar(sFilename), iDummy);
  if (iBufferSize > 0) then
  begin
    GetMem(pBuffer, iBufferSize);
    try
      // get fixed file info (language independent)
      GetFileVersionInfo(PChar(sFilename), 0, iBufferSize, pBuffer);
      VerQueryValue(pBuffer, '\', pFileInfo, iDummy);
      // read version blocks
      iVer[1] := HiWord(PVSFixedFileInfo(pFileInfo)^.dwFileVersionMS);
      iVer[2] := LoWord(PVSFixedFileInfo(pFileInfo)^.dwFileVersionMS);
      iVer[3] := HiWord(PVSFixedFileInfo(pFileInfo)^.dwFileVersionLS);
      iVer[4] := LoWord(PVSFixedFileInfo(pFileInfo)^.dwFileVersionLS);
    finally
      FreeMem(pBuffer);
    end;
    // format result string
    Result := Format(Fmt, [iVer[1], iVer[2], iVer[3], iVer[4]]);
  end;
end;

function RepeatString(const s: string; Count: cardinal): string;
var
  i: integer;
begin
  for i := 1 to Count do
    Result := Result + s;
end;

function removeLeadingZeros(const Value: string): string;
var
  i: integer;
begin
  for i := 1 to Length(Value) do
    if Value[i] <> '0' then
    begin
      Result := Copy(Value, i, MaxInt);
      exit;
    end;
  Result := '';
end;

function GetComputerNetName: string;
var
  NameBuffer: array [0 .. 255] of Char;
  NameString: String;
  Size: DWORD;
begin
  Result := '';

  try
    Size := 256;
    if GetComputerName(NameBuffer, Size) then
    begin
      NameString := NameBuffer;
      Result := Trim(NameString);
    end;
  except
    // eat errors
  end;
end;

procedure Split(const Delimiter: Char; Input: string; const Strings: TStrings);
begin
  Assert(Assigned(Strings));
  Strings.Clear;
  Strings.Delimiter := Delimiter;
  Strings.DelimitedText := Input;
end;

procedure FormTransparence(oForm: TForm; iLimit: integer = 0);
var
  CloseValue, Transparency: 0 .. 255;
begin
  if oForm.AlphaBlend = False then
  begin
    oForm.AlphaBlendValue := 255;
    oForm.AlphaBlend := True;
  end;
  Transparency := oForm.AlphaBlendValue;
  for CloseValue := Transparency downto iLimit do
  begin
    oForm.AlphaBlendValue := CloseValue;
    utiles.Delay(10);
    Application.ProcessMessages;
  end;
end;

procedure FormDegrade(oForm: TForm);
var
  i, Rows: integer;
begin
  Rows := oForm.ClientHeight div 24;
  for i := 0 to 24 do
  begin
    oForm.Canvas.Brush.Color := RGB(255 - (i * 2), 255 - i, 255);
    oForm.Canvas.FillRect(Rect(0, Rows * i, oForm.ClientWidth, Rows * i * 2))
  end;
end;

function GetUNCName(const LocalPath: string): string;
var
  BufferSize: DWORD;
  DummyBuffer: Byte;
  Buffer: Pointer;
  Error: DWORD;
begin
  BufferSize := 1;
  WNetGetUniversalName(PChar(LocalPath), UNIVERSAL_NAME_INFO_LEVEL, @DummyBuffer, BufferSize);
  Buffer := AllocMem(BufferSize);
  try
    Error := WNetGetUniversalName(PChar(LocalPath), UNIVERSAL_NAME_INFO_LEVEL, Buffer, BufferSize);
    if Error <> NO_ERROR then
    begin
      SetLastError(Error);
      RaiseLastWin32Error;
    end;
    Result := PUniversalNameInfo(Buffer)^.lpUniversalName
  finally
    FreeMem(Buffer);
  end;
end;

function Get_File_Size2(sFileToExamine: string): integer;
var
  SearchRec: TSearchRec;
  sgPath: string;
  inRetval, I1: integer;
begin
  sgPath := ExpandFileName(sFileToExamine);
  try
    inRetval := FindFirst(ExpandFileName(sFileToExamine), faAnyfile, SearchRec);
    if inRetval = 0 then
      I1 := SearchRec.Size
    else
      I1 := -1;
  finally
    FindClose(SearchRec);
  end;
  Result := I1;
end;

function isValidPath(Value: string): Boolean;
var
  s: string;
  i: integer;
begin
  s := UpperCase(Trim(Value));
  if (s[1] in ['A' .. 'Z']) and (s[2] = ':') and (s[3] = '\') then
  begin
    Result := True;
    for i := 4 to Length(s) do
      if s[i] in [#0 .. #31, #34, #42, #47, #58, #60, #62, #63] then
        Result := False
  end
  else
    Result := False;
end;

function tiempo_Transcurrido(pStartTime: DWORD; pEndTime: DWORD): string;
var
  ElapsedTime: DWORD;
  Estimated_hours: DWORD;
  Estimated_Minutes: DWORD;
  Estimated_seconds: DWORD;
begin
  ElapsedTime := pEndTime - pStartTime;
  // calculo de horas minutos y segundos
  Estimated_hours := (ElapsedTime div (3600 * 999)) mod 24;
  Estimated_Minutes := (ElapsedTime div (60 * 999)) mod 60;
  Estimated_seconds := (ElapsedTime div 999) mod 60;
  if (Estimated_hours + Estimated_Minutes) = 0 then
    Result := 'Tiempo Transcurrido: ' + IntToStr(Estimated_seconds) + ' Segundos. '
  else
    Result := 'Tiempo Transcurrido: ' + IntToStr(Estimated_hours) + ':' + IntToStr(Estimated_Minutes) + ':' + IntToStr(Estimated_seconds);
end;

function Par2(Num: integer): Boolean;
begin
  if Num mod 2 = 0 then
    Result := True
  else
    Result := False;
end;

function par(n: integer): Boolean;
asm
  and ax,1
  dec ax
end;

function GetProgramFilesDir2: string;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion', False);
    Result := Reg.ReadString('ProgramFilesDir');
  finally
    Reg.Free;
  end;
end;

function ReplaceDatePart(pDateTime: Tdatetime; pDateReplace: Tdatetime): Tdatetime;
var
  oDay, oMonth, oYear, oHour, oMinute, oSecond, oMilli: Word;
  rDay, rMonth, rYear: Word;
begin
  DecodeDateTime(pDateTime, oYear, oMonth, oDay, oHour, oMinute, oSecond, oMilli);
  DecodeDate(pDateReplace, rYear, rMonth, rDay);
  Result := EncodeDateTime(rYear, rMonth, rDay, oHour, oMinute, oSecond, oMilli);
end;

function TimeToDateTime(pTime: Ttime): Tdatetime;
begin
  Result := StrToDateTime(FormatDateTime('yyyy-mm-dd', Now) + ' ' + TimeToStr(pTime));
end;

function esPrimo(X: integer): Boolean;
var
  i, r: Longint;
begin
  r := Round(sqrt(X));
  for i := 2 to r do
    if (X mod i = 0) then
    begin
      esPrimo := False;
      exit;
    end;
  esPrimo := True;
end;

function MapNetworkDriveDLG(const handle: THandle; const uncPath: string): string;
{ Usage: MapNetworkDrive(Application.Handle, '\\server\shared-folder'); }
{ returns mapped drive ("z:") on success or uncPath on failure / cancel }
var
  cds: TConnectDlgStruct;
  netResource: TNetResource;
begin
  Result := uncPath;

  ZeroMemory(@netResource, SizeOf(TNetResource));
  netResource.dwType := RESOURCETYPE_DISK;
  netResource.lpRemoteName := PChar(uncPath);

  cds.cbStructure := SizeOf(TConnectDlgStruct);
  cds.hwndOwner := handle;
  cds.lpConnRes := @netResource;
  cds.dwFlags := CONNDLG_PERSIST;

  if WNetConnectionDialog1(cds) = NO_ERROR then
    Result := Chr(-1 + ord('A') + cds.dwDevNum) + DriveDelim;
end;

// Load a TStringGrid from a file
procedure LoadStringGrid(StringGrid: TStringGrid; const FileName: TFileName);
var
  f: textfile;
  iTmp, i, k: integer;
  strTemp: string;
begin
  AssignFile(f, FileName);
  Reset(f);
  with StringGrid do
  begin
    // Get number of columns
    Readln(f, iTmp);
    ColCount := iTmp;
    // Get number of rows
    Readln(f, iTmp);
    RowCount := iTmp;
    // loop through cells & fill in values
    for i := 0 to ColCount - 1 do
    begin
      for k := 0 to RowCount - 1 do
      begin
        Readln(f, strTemp);
        Cells[i, k] := strTemp;
      end;
    end;
  end;
  CloseFile(f);
end;

// Save a TStringGrid to a file
procedure SaveStringGrid(StringGrid: TStringGrid; const FileName: TFileName);
var
  f: textfile;
  i, k: integer;
begin
  AssignFile(f, FileName);
  Rewrite(f);
  with StringGrid do
  begin
    // Write number of Columns/Rows
    WriteLn(f, ColCount);
    WriteLn(f, RowCount);
    // loop through cells
    for i := 0 to ColCount - 1 do
    begin
      for k := 0 to RowCount - 1 do
      begin
        WriteLn(f, Cells[i, k]);
      end;
    end;
  end;
  CloseFile(f);
end;

{ ************************************************
  // procedure TfUtilesV20.AppendCurrent
  // Written By: Steve Zimmelman
  //
  // Will append an exact copy of the current
  // record of the dataset that is passed into
  // the procedure TfUtilesV20.and will return the dataset
  // in edit state with the record pointer on
  // the currently appended record.
  ************************************************ }
procedure AppendCurrent(DataSet: TDataSet);
var
  aField: variant;
  i: integer;
begin
  // Create a variant Array
  aField := VarArrayCreate([0, DataSet.Fieldcount - 1], VarVariant);
  // read values into the array
  for i := 0 to (DataSet.Fieldcount - 1) do
  begin
    aField[i] := DataSet.fields[i].Value;
  end;
  DataSet.Append;
  // Put array values into new the record
  for i := 0 to (DataSet.Fieldcount - 1) do
  begin
    DataSet.fields[i].Value := aField[i];
  end;
end;

procedure DataRefresh(var oDataset: TDataSet; pfield_Name: string);
var
  oldKey: integer;
begin
  oldKey := oDataset.FieldByName(pfield_Name).AsInteger;
  oDataset.Refresh;
  oDataset.Locate(pfield_Name, oldKey, []);
end;

{ ********************************************************************* }
{ Strip('L',' ',' bob') returns 'bob' }
{ Strip('R','5','56345') returns '5634' }
{ Strip('B','H','HASH') returns 'as' }
{ strip('A','E','fleetless') returns fltlss }
{ ********************************************************************* }

function Strip(L, c: Char; Str: string): string;
{ L is left,center,right,all,ends }
var
  i: Byte;
begin
  case Upcase(L) of
    'L':
      begin { Left }
        while (Str[1] = c) and (Length(Str) > 0) do
          Delete(Str, 1, 1);
      end;
    'R':
      begin { Right }
        while (Str[Length(Str)] = c) and (Length(Str) > 0) do
          Delete(Str, Length(Str), 1);
      end;
    'B':
      begin
        { Both left and right }
        while (Str[1] = c) and (Length(Str) > 0) do
          Delete(Str, 1, 1);
        while (Str[Length(Str)] = c) and (Length(Str) > 0) do
          Delete(Str, Length(Str), 1);
      end;
    'A':
      begin { All }
        i := 1;
        repeat
          if (Str[i] = c) and (Length(Str) > 0) then
            Delete(Str, i, 1)
          else
            i := succ(i);
        until (i > Length(Str)) or (Str = '');
      end;
  end;
  Strip := Str;
end; { Func Strip }

function SeEjecutaEnInicio(NombreEjecutable: string; SoloUnaVez, SoloUsuario: Boolean): Boolean;
{
  ENTRADA:
  NombreEjecutable    = Nombre del ejecutable a comprobar
  SoloUnaVez          = TRUE  para comprobar sólo el siguiente arranque
  FALSE para comprobar la ejecucion en todos los arranques
  SoloUsuario         = TRUE para comprobar sólo en el usuario en curso

  SALIDA:
  Devuelve TRUE si el programa se encuentra en el regitro, en la clave:
  HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run ó RunOnce ó bien en la clave
  HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run ó RunOnce en funcion de la ENTRADA
}
var
  Registro: TRegistry;
  RegInfo: TRegDataInfo;
  clave: string;
  Valores: TStringList;
  n: integer;

begin
  Result := False;
  clave := 'Software\Microsoft\Windows\CurrentVersion\Run';
  if SoloUnaVez then
    clave := clave + 'Once';

  Registro := TRegistry.Create;
  try
    // Seleccionamos HKEY_LOCAL_MACHINE o bien si no la cambiamos, se queda
    // HKEY_CURRENT_USER que es la clave por defecto al crear un TRegistry
    if not SoloUsuario then
      Registro.RootKey := HKEY_LOCAL_MACHINE;

    // Abrimos la clave en cuestión:
    if not Registro.OpenKey(clave, False) then
      raise Exception.Create('Error: No se pudo abrir la clave ' + clave + ' del registro de windows');

    Valores := TStringList.Create;
    try
      // Obtenemos una lista de los Nombres de los valores de la clave
      Registro.GetValueNames(Valores);

      // Comprobamos si esos valores son string, si lo son, los leemos, sino, lo borramos de la lista:
      for n := 0 to pred(Valores.Count) do
      begin
        // Comprobamos si se trata de un valor string:
        if Registro.GetDataInfo(Valores[n], RegInfo) then
        begin
          if (RegInfo.RegData = rdString) then
          begin
            if Lowercase(NombreEjecutable) = Lowercase(Registro.ReadString(Valores[n])) then
            begin
              Result := True;
              break;
            end;
          end;
        end
        else
          Valores[n] := '';
      end; // for n

    finally
      Valores.Free;
    end;
  finally
    Registro.Free;
  end;
end; // SeEjecutaEnInicio

procedure EjecutarEnInicio(NombrePrograma, NombreEjecutable: string; SoloUnaVez, SoloUsuario: Boolean);
{
  COMETIDO DE LA PROCEDURE:
  Añade un programa en el registro de Windows, para que se ejecute cuando Windows arranque.
  Se puede seleccionar que se arranque siempre o sólo una vez en el siguiente arranque y tambien
  si ha de ejecutarse en cada arranque de máquina o bien cuando el usuario en curso abra una sesion

  ENTRADA:
  NombrePrograma      = Nombre del programa
  NombreEjecutable    = Nombre del ejecutable del programa con el path completo
  SoloUnaVez          = TRUE  para comprobar sólo el siguiente arranque
  FALSE para comprobar la ejecucion en todos los arranques
  SoloUsuario         = TRUE para comprobar sólo en el usuario en curso
}

var
  Registro: TRegistry;
  clave: string;
begin
  clave := 'Software\Microsoft\Windows\CurrentVersion\Run';
  if SoloUnaVez then
    clave := clave + 'Once';

  Registro := TRegistry.Create;
  try
    // Seleccionamos HKEY_LOCAL_MACHINE o bien si no la cambiamos, se queda
    // HKEY_CURRENT_USER que es la clave por defecto al crear un TRegistry
    if not SoloUsuario then
      Registro.RootKey := HKEY_LOCAL_MACHINE;

    // Abrimos la clave en cuestión:
    if not Registro.OpenKey(clave, False) then
      raise Exception.Create('Error: No se pudo abrir la clave ' + clave + ' del registro de windows');
    // Escribimos el valor para que se arranque el programa especificado:
    Registro.WriteString(NombrePrograma, NombreEjecutable);
  finally
    Registro.Free;
  end;
end;
// procedure TfUtilesV20.EjecutarEnInicio

procedure QuitarEjecutarEnInicio(NombreEjecutable: string; SoloUnaVez, SoloUsuario: Boolean);
{
  COMETIDO DE LA PROCEDURE:
  Si el ejecutable 'NombreEjecutable' esta en el registro de Windows, en la clave
  que hace que se ejecute en cada arranque de Windows, la funcion lo borra de ahí.


  ENTRADA:
  NombreEjecutable    = Nombre del ejecutable del programa con el path completo
  SoloUnaVez          = TRUE  para borrar sólo del siguiente arranque
  FALSE para borrar la ejecucion en todos los arranques
  SoloUsuario         = TRUE para borrar sólo en el usuario en curso
}
var
  Registro: TRegistry;
  RegInfo: TRegDataInfo;
  clave: string;
  Valores: TStringList;
  n: integer;
begin
  clave := 'Software\Microsoft\Windows\CurrentVersion\Run';
  if SoloUnaVez then
    clave := clave + 'Once';

  Registro := TRegistry.Create;
  try
    // Seleccionamos HKEY_LOCAL_MACHINE o bien si no la cambiamos, se queda
    // HKEY_CURRENT_USER que es la clave por defecto al crear un TRegistry
    if not SoloUsuario then
      Registro.RootKey := HKEY_LOCAL_MACHINE;

    // Abrimos la clave en cuestión:
    if not Registro.OpenKey(clave, False) then
      raise Exception.Create('Error: No se pudo abrir la clave ' + clave + ' del registro de windows');

    Valores := TStringList.Create;
    try
      // Obtenemos una lista de los Nombres de los valores de la clave
      Registro.GetValueNames(Valores);

      // Comprobamos si el nombre del ejecutable figura en alguno de los valores
      for n := 0 to pred(Valores.Count) do
      begin
        // Comprobamos si se trata de un valor string:
        if Registro.GetDataInfo(Valores[n], RegInfo) then
        begin
          if (RegInfo.RegData = rdString) then
          begin
            if Lowercase(NombreEjecutable) = Lowercase(Registro.ReadString(Valores[n])) then
            begin
              // Si figura, borramos ese valor
              Registro.DeleteValue(Valores[n]);
            end;
          end;
        end;
      end; // for n

    finally
      Valores.Free;
    end;
  finally
    Registro.Free;
  end;
end; // procedure TfUtilesV20.QuitarEjecutarEnInicio
{
  //Comprobar si un programa se ejecuta en cada arranque de la máquina:
  if SeEjecutaEnInicio( 'c:\winnt\notepad.exe', FALSE, FALSE) then
  ShowMessage('Si, se ejecuta en cada arranque')
  else
  ShowMessage('NO, NO se ejecuta en cada arranque');

  //Hacer que se ejecute el Notepad.exe en cada arranque para todos los usuarios:
  EjecutarEnInicio('Block de Notas', 'c:\winnt\notepad.exe', FALSE, FALSE);

  //Hacer que deje de ejecutarse el Notepad.exe de cada arranque:
  QuitarEjecutarEnInicio('c:\winnt\notepad.exe', FALSE, FALSE);
}

procedure OpcionesApagarWindows(Sender: TObject);
var
  Shell: OleVariant;

begin
  Shell := CreateOleObject('shell.application');
  Shell.ShutDownWindows;
end;

procedure CierraSessionWindows;
begin
  ExitWindowsEx(0, 0);
  { EWX_LOGOFF - Cierra los procesos y la sesión del usuario. }
end;

procedure ReiniciaWindows;
begin
  ExitWindowsEx(2, 0);
  { EWX_REBOOT - Reboot. Debes tener privilegio SE_SHUTDOWN_NAME }
end;

procedure Poner_Facil_De_Inicio_Windows(pCierraSession: Boolean = True);
var
  cApp_Name: string;
begin
  cApp_Name := UpperCase(ExtractFileName(Application.ExeName));
  EjecutarEnInicio('RCTECH ' + cApp_Name, UpperCase(Application.ExeName), False, True);
  if pCierraSession = True then
    CierraSessionWindows;
end;

procedure PrintLineOnDotMatrix(cPrinterName: string; cDocName: string; cString: string; bDobleCarr: Boolean; bTest: Boolean = False);
// Uses WinSpool;
var
  handle: THandle;
  n: DWORD;
  DocInfo1: TDocInfo1;
  cText: string;
begin
  if not OpenPrinter(PChar(cPrinterName), handle, nil) then
  begin
    showmessage('Impresora «[' + cPrinterName + ']» No encontrada.');
    exit;
  end;

  with DocInfo1 do
  begin
    pDocName := PChar(cDocName);
    pOutputFile := nil;
    pDataType := 'RAW';
  end;

  StartDocPrinter(handle, 1, @DocInfo1);

  if bTest = True then
  begin
    cText := '1234567890123456789012345678901234567890' + #13 + #10;
    WritePrinter(handle, PChar(cText), Length(cText), n);
    exit;
  end;
  if bDobleCarr = False then
    cText := CadLongitudFija(cString, 40, False, ' ') + #13 + #10
  else
    cText := CadLongitudFija(cString, 40, False, ' ') + ' ' + CadLongitudFija(cString, 39, False, ' ') + #13 + #10;

  WritePrinter(handle, PChar(cText), Length(cText), n);

  EndPagePrinter(handle);
  EndDocPrinter(handle);

  ClosePrinter(handle);
end;

procedure PrintLineToGeneric(const line: string);
// Uses WinSpool;
var
  BytesWritten: DWORD;
  hPrinter: THandle;
  DocInfo: TDocInfo1;
const
  GenericPrinter: PChar = 'Factura';
  // Change to systems generic drivers name
begin
  if not OpenPrinter(GenericPrinter, hPrinter, nil) then
    raise Exception.Create('Printer not found');
  try
    DocInfo.pDocName := 'MyDocument';
    DocInfo.pOutputFile := nil;
    DocInfo.pDataType := 'RAW';
    if StartDocPrinter(hPrinter, 1, @DocInfo) = 0 then
      Abort;
    try
      if not StartPagePrinter(hPrinter) then
        Abort;
      try
        if not WritePrinter(hPrinter, @line[1], Length(line), BytesWritten) then
          Abort;
      finally
        EndPagePrinter(hPrinter);
      end;
    finally
      EndDocPrinter(hPrinter);
    end;
  finally
    ClosePrinter(hPrinter);
  end;
end;

function CadLongitudFija(cadena: string; longitud: integer; posicionIzquierda: Boolean; valorRelleno: string): string;
var
  i: integer;
begin
  if Length(cadena) > longitud then
    cadena := Copy(cadena, 1, longitud)
  else
  begin
    for i := 1 to longitud - Length(cadena) do
      if posicionIzquierda then
        cadena := valorRelleno + cadena
      else
        cadena := cadena + valorRelleno;
  end;
  Result := cadena;
end;

function CenterText(nWidth: integer; sText: string): string;
var
  nSpaces: integer;
begin
  nSpaces := (nWidth - Length(sText)) div 2;
  Result := Replicate(' ', nSpaces) + sText;
end;

function Ctrl_Resize: Boolean;
begin
  if oSetting_Fac.ResizeScrn = 0 then
    Result := False
  else
    Result := True
end;

{ -----------------------------------------------------------------------------------------------------
  El sistema contiene en una de sus tablas almacenada la notación de separador de miles y decimales
  esta información cuando el sistema inicia se carga en dos variables.
  en esta funcion se toma el valor de esas variables y se les asigna al la configuracion del software.
  J.G.G. junio 2010.
  ------------------------------------------------------------------------------------------------------ }
procedure Set_Decinal_Thousand_Separator;
begin
  FormatSettings.DecimalSeparator := cpDecimales;
  FormatSettings.ThousandSeparator := cpThousand;
end;

{ -------------------------------------------------------------------------------------------
  Devido a que esta funciona manda error cuando la totacion de decimales es coma ",", hemos
  creado esta funcion que lo que hace es colocar en punto '.' la notacion de decimales, hacer
  la operación y luego lo vuelve a colocar como estab en el sistema anteriormente
  J.G.G. julio 2010.
  -------------------------------------------------------------------------------------------- }
function FloatToStr2(Value: Extended): string;
begin
  FormatSettings.DecimalSeparator := '.';
  Result := floattostr(Value);
  Set_Decinal_Thousand_Separator;
end;

function strTran(cText, cfor, cwith: string): string;
var
  ntemp: Word;
  nreplen: Word;
begin
  cfor := UpperCase(cfor);
  nreplen := Length(cfor);
  for ntemp := 1 to Length(cText) do
  begin
    if (UpperCase(Copy(cText, ntemp, nreplen)) = cfor) then
    begin
      Delete(cText, ntemp, nreplen);
      Insert(cwith, cText, ntemp);
    end;
  end;
  Result := cText;
end;

{ -----------------------------------------------------------------------------------------------
  Esta función sólo funciona para datos numéricos he indica si un valor esta en el rango indicado
  ------------------------------------------------------------------------------------------------ }
function between(nval, nmin, nmax: Longint): Boolean;
begin
  Result := False;
  if (nval >= nmin) and (nval <= nmax) then
    Result := True;
end;

{ -----------------------------------------------------------------------------------------------
  Esta funcion convierte de segundos a horas en formato 'hh:mm:ss'.
  ------------------------------------------------------------------------------------------------ }
function SecToTime(Sec: integer): string;
var
  H, m, s: string;
  ZH, ZM, ZS: integer;
begin
  ZH := Sec div 3600;
  ZM := Sec div 60 - ZH * 60;
  ZS := Sec - (ZH * 3600 + ZM * 60);
  H := IntToStr(ZH);
  m := IntToStr(ZM);
  s := IntToStr(ZS);
  Result := H + ':' + m + ':' + s;
end;

function EjecutarComando(comando: string): string;
var
  Buffer: array [0 .. 4096] of Char;
  si: StartupInfo;
  sa: SECURITY_ATTRIBUTES;
  sd: SECURITY_DESCRIPTOR;
  pi: PROCESS_INFORMATION;
  newstdin, newstdout, read_stdout, write_stdin: THandle;
  exitcod, bread, avail: cardinal;
  sSym: string;
begin

  Application.CreateForm(TTSplashForm, tSplashForm);
  tSplashForm.ProgressBar1.Visible := False;
  tSplashForm.ProgressBar1.Min := 0;
  tSplashForm.ProgressBar1.Max := 0;
  tSplashForm.olMensage.Visible := False;
  sSym := '/';
  Result := '';
  sa.lpSecurityDescriptor := nil;
  sa.nLength := SizeOf(SECURITY_ATTRIBUTES);
  sa.bInheritHandle := True;
  if CreatePipe(newstdin, write_stdin, @sa, 0) then
  begin
    if CreatePipe(read_stdout, newstdout, @sa, 0) then
    begin
      GetStartupInfo(si);
      with si do
      begin
        dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
        wShowWindow := SW_HIDE;
        hStdOutput := newstdout;
        hStdError := newstdout;
        hStdInput := newstdin;
      end;
      FillChar(Buffer, SizeOf(Buffer), 0);
      GetEnvironmentVariable('COMSPEC', @Buffer, SizeOf(Buffer) - 1);
      StrCat(@Buffer, PChar(' /c ' + comando));
      if CreateProcess(nil, @Buffer, nil, nil, True, CREATE_NEW_CONSOLE, nil, nil, si, pi) then
      begin
        tSplashForm.Show;
        tSplashForm.olMensage.Visible := True;
        repeat
          PeekNamedPipe(read_stdout, @Buffer, SizeOf(Buffer) - 1, @bread, @avail, nil);
          if bread > 0 then
          begin
            FillChar(Buffer, SizeOf(Buffer), 0);
            ReadFile(read_stdout, Buffer, bread, bread, nil);
            Result := Result + string(PChar(@Buffer));
          end;
          if sSym = '/' then
            sSym := '-'
          else if sSym = '-' then
            sSym := '\'
          else if sSym = '\' then
            sSym := '/';
          tSplashForm.olMensage.Caption := sSym + 'Espere un momento por favor, mientras se ejecuta el comando:..';
          tSplashForm.Update;
          Application.ProcessMessages;
          GetExitCodeProcess(pi.hProcess, exitcod);
          Sleep(80);
        until (exitcod <> STILL_ACTIVE) and (bread = 0);
      end;
      tSplashForm.Free;
      CloseHandle(read_stdout);
      CloseHandle(newstdout);
    end;
    CloseHandle(newstdin);
    CloseHandle(write_stdin);
  end;
end;

{
  Sample:

  var
  Date3MonthsAfterNow: TDateTime;
  Date2YearsAgo: TDateTime;
  Date11DaysAfterNow: TDateTime;
  begin
  Date3MonthsAfterNow := DateTimeAdd(Now, dtpMonth, 3);
  Date2YearsAgo := DateTimeAdd(Now, dtpYear, -2); // negative is OK
  Date11DaysAfterNow := DateTimeAdd(Now, dtpDay, 11);
  end;
}
{ =============================================================================================== }

{ --------------------------------------------------------------------------------------------
  Unformat a formatted integer or float. Used for CSV export and composing WHERE clauses for grid editing.
  ---------------------------------------------------------------------------------------------- }
function UnformatNumber(Val: string): string;
begin
  Result := Val;
  if FormatSettings.ThousandSeparator <> FormatSettings.DecimalSeparator then
    Result := StringReplace(Result, FormatSettings.ThousandSeparator, '', [rfReplaceAll]);
  Result := StringReplace(Result, FormatSettings.DecimalSeparator, '.', [rfReplaceAll]);
end;

{ --------------------------------------------------------------------------------------------
  Return a formatted integer or float from a string
  @param string Text containing a number
  @return string
  ---------------------------------------------------------------------------------------------- }
function FormatNumber(Str: string; Thousands: Boolean = True): string; overload;
var
  i, P, Left: integer;
begin

  Result := StringReplace(Str, '.', FormatSettings.DecimalSeparator, [rfReplaceAll]);
  if Thousands then
  begin
    if ((Length(Result) >= 1) and (Result[1] = '0')) or ((Length(Result) >= 2) and (Result[1] = '-') and (Result[2] = '0')) then
      exit;
    P := pos(FormatSettings.DecimalSeparator, Result);
    if P = 0 then
      P := Length(Result) + 1;
    Left := 2;
    if (Length(Result) >= 1) and (Result[1] = '-') then
      Left := 3;
    if P > 0 then
      for i := P - 1 downto Left do
      begin
        if (P - i) mod 3 = 0 then
          Insert(FormatSettings.ThousandSeparator, Result, i);
      end;
  end;
end;

{ --------------------------------------------------------------------------------------------
  Return a formatted number from an integer
  @param int64 Number to format
  @return string
  ---------------------------------------------------------------------------------------------- }
function FormatNumber(int: Int64; Thousands: Boolean = True): string; overload;
begin
  Result := FormatNumber(IntToStr(int), Thousands);
end;

{ --------------------------------------------------------------------------------------------
  Return a formatted number from a float This function TfUtilesV20.is called by two overloaded functions
  @param double Number to format
  @param integer Number of decimals
  @return string
  ---------------------------------------------------------------------------------------------- }
function FormatNumber(flt: Double; decimals: integer = 0; Thousands: Boolean = True): string; overload;
begin
  Result := Format('%10.' + IntToStr(decimals) + 'f', [flt]);
  Result := Trim(Result);
  Result := FormatNumber(Result, Thousands);
end;

{ --------------------------------------------------------------------------------------------
  Return true if given character represents a number.
  Limitations: only recognizes ANSI numerals.
  Eligible for inlining, hope the compiler does this automatically.
  ---------------------------------------------------------------------------------------------- }
function IsNumber(const c: Char): Boolean;
var
  B: Word;
begin
  B := ord(c);
  Result := (B >= 48) and (B <= 57);
end;

{ --------------------------------------------------------------------------------------------
  esta función convierte de cadena a hexagesimal
  ---------------------------------------------------------------------------------------------- }
function StringToHex(s: string): string;
var
  i: integer;
begin
  Result := '';
  // Go throught every single characters, and convert them
  // to hexadecimal...
  for i := 1 to Length(s) do
    Result := Result + IntToHex(ord(s[i]), 2);
end;

{ --------------------------------------------------------------------------------------------
  esta función convierte de exagesimal a cadena
  ---------------------------------------------------------------------------------------------- }
function HexToString(s: string): string;
var
  i: integer;
begin
  Result := '';
  // Go throught every single hexadecimal characters, and convert
  // them to ASCII characters...
  for i := 1 to Length(s) do
  begin
    // Only process chunk of 2 digit Hexadecimal...
    if ((i mod 2) = 1) then
      Result := Result + Chr(StrToInt('0x' + Copy(s, i, 2)));
  end;
end;

{ --------------------------------------------------------------------------------------------
  // Esta función muestra el numero de dia que desde enero hasta la fecha x de un año
  //o de una fecha.
  // [Meeus91, p. 65]
  // DayOfYear(1978, 11, 14) = 318
  // DayOfYear(2000, 11, 14) = 319
  ---------------------------------------------------------------------------------------------- }
function DayOfYear(const Year, Month, Day: Word): integer;
var
  k: Word;
begin
  if IsLeapYear(Year) then
    k := 1
  else
    k := 2;
  Result := Trunc(275 * Month / 9) - k * Trunc((Month + 9) / 12) + Day - 30;
end; { DayOfYear }

{ --------------------------------------------------------------------------------------------
  Esta función muestra la fecha del correspondiente al ùltimo día del mes.
  ---------------------------------------------------------------------------------------------- }
function LastDayInMonth(const Year, Month: Word): Tdatetime;
begin
  if Month = 12 then
    Result := EncodeDate(Year + 1, 1, 1) - 1
  else
    Result := EncodeDate(Year, Month + 1, 1) - 1;
end;

{ ---------------------------------------------------------------------------------------------- }
{ Esta función muestra el devuelve el directorio temporal de la carpeta del windows. }
{ ---------------------------------------------------------------------------------------------- }
function GetWindowsTempDirectory: string;
var
  tempFolder: array [0 .. MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @tempFolder);
  Result := StrPas(tempFolder);
end;

{ ---------------------------------------------------------------------------------------------- }
{ Crear una Lista de todos los archivos de un directorio [Path]. }
{ Reading a directory content }
{ ---------------------------------------------------------------------------------------------- }
procedure FindAllFiles(const Path: string; Attr: integer; List: TStrings);
var
  Res: TSearchRec;
  EOFound: Boolean;
begin
  // Res := TSearchRec.create(nil);
  EOFound := False;
  if FindFirst(Path, Attr, Res) < 0 then
    exit
  else
  begin
    while not EOFound do
    begin
      List.Add(Res.name);
      EOFound := FindNext(Res) <> 0;
    end;
    FindClose(Res);
  end;
end;

function WinExecAndWait32(FileName: string; Visibility: integer): integer;
var
  zAppName: array [0 .. 512] of Char;
  zCurDir: array [0 .. 255] of Char;
  WorkDir: string;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  Res: UINT;
begin
  StrPCopy(zAppName, FileName);
  GetDir(0, WorkDir);
  StrPCopy(zCurDir, WorkDir);
  FillChar(StartupInfo, SizeOf(StartupInfo), #0);
  StartupInfo.cb := SizeOf(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;

  if not(CreateProcess(nil, zAppName, { pointer to command line string }
    nil, { pointer to process security attributes }
    nil, { pointer to thread security attributes }
    False, { handle inheritance flag }
    CREATE_NEW_CONSOLE or { creation flags }
    NORMAL_PRIORITY_CLASS, nil, { pointer to new environment block }
    nil, { pointer to current directory name }
    StartupInfo, { pointer to STARTUPINFO }
    ProcessInfo)) then { pointer to PROCESS_INF }
    Result := -1
  else
  begin
    WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
    GetExitCodeProcess(ProcessInfo.hProcess, Res);
    { Added v2.4.4 (JS) }
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
    Result := Res;
  end;
end;

function Win32CreateProcess(const FileName, Parameters: string;

  var ExitCode: DWORD;

  const Wait: DWORD = 0;

  const Hide: Boolean = False): Boolean;
var
  myInfo: SHELLEXECUTEINFO;
  iWaitRes: DWORD;
begin
  ZeroMemory(@myInfo, SizeOf(SHELLEXECUTEINFO));
  myInfo.cbSize := SizeOf(SHELLEXECUTEINFO);
  myInfo.fMask := SEE_MASK_NOCLOSEPROCESS or SEE_MASK_FLAG_NO_UI;
  myInfo.lpFile := PChar(FileName);
  myInfo.lpParameters := PChar(Parameters);
  if Hide then
    myInfo.nShow := SW_HIDE
  else
    myInfo.nShow := SW_SHOWNORMAL;
  ExitCode := 0;
  Result := ShellExecuteEx(@myInfo);
  if Result then
  begin
    while WaitForSingleObject(myInfo.hProcess, 100) = WAIT_TIMEOUT do
      Application.ProcessMessages;

    iWaitRes := WaitForSingleObject(myInfo.hProcess, 100);

    if (iWaitRes = WAIT_TIMEOUT) then
    begin
      Result := False;
      TerminateProcess(myInfo.hProcess, 0);
    end;
    GetExitCodeProcess(myInfo.hProcess, ExitCode);
    CloseHandle(myInfo.hProcess);
  end;
end;

function RightStr(const Str: string; Size: Word): string;
begin
  if Size > Length(Str) then
    Size := Length(Str);
  RightStr := Copy(Str, Length(Str) - Size + 1, Size)
end;

function MidStr(const Str: string; From, Size: Word): string;
begin
  MidStr := Copy(Str, From, Size)
end;

function LeftStr(const Str: string; Size: Word): string;
begin
  LeftStr := Copy(Str, 1, Size)
end;

procedure SyncErrLog(const key: string; const level: integer; const description: string);
var
  DirectoryName: string;
  FileName: string;
  LogFile: textfile;
begin
  DirectoryName := ExcludeTrailingBackslash(ExtractFilePath(Application.ExeName)) + 'LOG';
  // Create directory, if necessary.
  if not DirectoryExists(DirectoryName) then
    ForceDirectories(DirectoryName);
  FileName := FormatDateTime('yyyymm', Now) + '_ERR.LOG';
  AssignFile(LogFile, DirectoryName + '\' + FileName);
  try
    if FileExists(DirectoryName + '\' + FileName) then
      Append(LogFile) // If existing file
    else
      Rewrite(LogFile); // Create if new
    if level = 0 then
      WriteLn(LogFile) // blank line
    else
      WriteLn(LogFile, FormatDateTime('dd hh:nn:ss', Now), ' ', Format('%-16s', [key]), ' ', description);
    CloseFile(LogFile)
  except
    // Ignore exceptions while writing log files
  end;
end;

Function ReplaceNonAscii(const s: String): String;
var
  i, pos: integer;
const
  undesiredchars: String = '/ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÜÚÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùüúþÿ';
const
  replaces: String = '  AAAAAAACEEEEIIIIDNOOOOOxOUUUbBaaaaaaaceeeeiiiionooooo ouuuby';
Begin
  SetLength(Result, Length(s));
  for i := 1 to Length(s) do
  begin
    pos := ord(s[i]);
    if (s[i] in [#32, #48 .. #57, #65 .. #90, #97 .. #122]) then
      Result[i] := s[i]
    else
    begin
      pos := AnsiPos(s[i], undesiredchars);
      Result[i] := replaces[pos + 1];
    end;
  end;

end;

function RetiraCaracteresEspeciais(Texto: string; Caracteres: array of Char): string;
var
  Cont: Smallint;
  StrCaractere: string;
begin
  for Cont := 0 to Length(Caracteres) - 1 do
    Texto := StringReplace(Texto, Caracteres[Cont], ' ', [rfReplaceAll, rfIgnoreCase]);
  Result := Texto
end;

procedure Chamadora;
const
  Caracteres: array [0 .. 12] of Char = ('"', '!', '´', '`', '@', '$', '¬', '¨', '&', '*', '(', ')', '(');
var
  Texto: string;
begin
  Texto := '$adsf$¨$$¬';
  Texto := RetiraCaracteresEspeciais(Texto, Caracteres);
  showmessage(Texto);
end;

function TrocaCaracterEspecial(aTexto: string; aLimExt: Boolean): string;
const
  // Lista de caracteres especiais
  xCarEsp: array [1 .. 38] of String = ('á', 'à', 'ã', 'â', 'ä', 'Á', 'À', 'Ã', 'Â', 'Ä', 'é', 'è', 'É', 'È', 'í', 'ì', 'Í', 'Ì', 'ó', 'ò', 'ö', 'õ', 'ô', 'Ó', 'Ò', 'Ö', 'Õ', 'Ô',
    'ú', 'ù', 'ü', 'Ú', 'Ù', 'Ü', 'ç', 'Ç', 'ñ', 'Ñ');
  // Lista de caracteres para troca
  xCarTro: array [1 .. 38] of String = ('a', 'a', 'a', 'a', 'a', 'A', 'A', 'A', 'A', 'A', 'e', 'e', 'E', 'E', 'i', 'i', 'I', 'I', 'o', 'o', 'o', 'o', 'o', 'O', 'O', 'O', 'O', 'O',
    'u', 'u', 'u', 'u', 'u', 'u', 'c', 'C', 'n', 'N');
  // Lista de Caracteres Extras
  xCarExt: array [1 .. 48] of string = ('<', '>', '!', '@', '#', '$', '%', '¨', '&', '*', '(', ')', '_', '+', '=', '{', '}', '[', ']', '?', ';', ':', ',', '|', '*', '"', '~', '^',
    '´', '`', '¨', 'æ', 'Æ', 'ø', '£', 'Ø', 'ƒ', 'ª', 'º', '¿', '®', '½', '¼', 'ß', 'µ', 'þ', 'ý', 'Ý');
var
  xTexto: string;
  i: integer;
begin
  xTexto := aTexto;
  for i := 1 to 38 do
    xTexto := StringReplace(xTexto, xCarEsp[i], xCarTro[i], [rfReplaceAll]);
  // De acordo com o parâmetro aLimExt, elimina caracteres extras.
  if (aLimExt) then
    for i := 1 to 48 do
      xTexto := StringReplace(xTexto, xCarExt[i], '', [rfReplaceAll]);
  Result := xTexto;
end;

initialization

cTmpFlsPath := ExtractFilePath(Application.ExeName) + 'tmp';
if (DirectoryExists(cTmpFlsPath) = False) then
begin
{$IOCHECKS off}
  MkDir(cTmpFlsPath);
{$IOCHECKS on}
end;
cTmpFlsPath := IncludeTrailingBackslash(cTmpFlsPath);
cConfigIniFle := ChangeFileExt(Application.ExeName, '.ini');
oFileIni := TiniFile.Create(utiles.cConfigIniFle);
utiles.GetSetting('DB');

cUsa_Imp_Fiscal := '1';
sSlectedHost := '';
bShow_QryMessage := False;
cpDecimales := '.';
cpThousand := ',';
cApp_Fecha_sistema := Now;
cApp_imp_01 := '7';
cApp_imp_02 := '10';
cApp_imp_03 := '15';
cId_Estacion := '1';
cId_empresa := '1';

end.
