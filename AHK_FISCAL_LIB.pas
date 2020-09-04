﻿unit AHK_FISCAL_LIB;

interface

uses

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, DBCtrls, Grids,
  ShellAPI, ADODB, FileCtrl, StrUtils, DateUtils,
  DB,
  ZConnection, MemTableDataEh, MemTableEh;

var
  cComm_FIS: Ansistring;
  bResult_Cmd: Boolean;
  sAliquota, sQtde: string;
  sTipoQtde, sTipoDesconto: string;
  bBreak_Proc: Boolean;
  HKA_FP_Status: ^Integer;
  HKA_ST_Status: String;
  HKA_FP_Error: ^Integer;
  HKA_ST_Error: String;
  // Funciones de Inicializaci�n
  fOFG_MontoPag, fOFG_MontoCer, fOFG_MontoDon, fOFG_MontCargo: extended;
  fOFG_MontDesc, fOFG_MontTotal: extended;
  cOFG_VarTipoV, cOFG_Num_corre, cOFG_Num_NCF, cOFG_Num_COO, cOFG_id_Empresa, cOFG_id_Sucursal: string;
  bAnular_Op: Boolean;
  bWaiting_Z: Boolean;
  bStop_Exit: Boolean;
  ctRif, ctDescripcion, ctDireccion, ctTelefono: string;
  ctCant, ctPrecio: string;
  cNum_Refere: string;
  cNum_Pedido: string;
  bFlag: Boolean;
  bHKALog: Boolean = true;
  fMontoEfe: extended;
  cSerieIMF: string;
  cPol_08, cPol_Ln: string;

  cMontoEfe, cMontoPag, cMontoChe, cMontoDeb, cMontoCre, cMontoCreV, cMontoCer, cMontoDon, cValorCarg: string;
  cMontoV6, cMontoV7, cMontoV8, cMontoV9, cMontoV10: string;
  cMontoV11, cMontoV12, cMontoV13, cMontoV14, cMontoV15: string;
  cMontoV16, cMontoV17, cMontoV18, cMontoV19, cMontoV20: string;

  fMontoPag, fMontoChe, fMontoDeb, fMontoCre, fMontoCreV, fMontoCer, fMontoDon, fMontoVue, fValorCarg: extended;
  fMontoV06, fMontoV07, fMontoV08, fMontoV09, fMontoV10: extended;
  fMontoV11, fMontoV12, fMontoV13, fMontoV14, fMontoV15: extended;
  fMontoV16, fMontoV17, fMontoV18, fMontoV19, fMontoV20: extended;
  cNumeroFinal: string;
  bv01: string;
  bv02: string;
  id_usuario: string;
  nom_usuario: string;
  LRC: variant;
  aCmd_Data: string[4];

const
  bDescMont = true;
  iDecimal = 3;
  bAgruped_Id_Prod = false;
  bIsRestaurante = false;
  { bPrn_DocNoF_003 = true; {Cierre X }
  { bPrn_DocNoF_004 = true; {Cierre Z }
  STX = $02;
  ENQ = $05;
  ETX = $03;
  EOT = $04;
  ACK = $06;
  NAK = $15;
  ETB = $17;
  // * -----------------Funciones productos The Factory HKA---------------------------------- */

function OpenFpctrl(lpcstr: Ansistring): Boolean; stdcall; external 'tfhkaif.dll';
function CloseFpctrl(): Boolean; stdcall; external 'tfhkaif.dll';
function CheckFprinter(): Boolean; stdcall; external 'tfhkaif.dll';
function SendCmd(status: Pointer; error: Pointer; cmd: Ansistring): Boolean; stdcall; external 'tfhkaif.dll';
function ReadFpStatus(status, error: Pointer): Boolean; stdcall; external 'tfhkaif.dll';
function SendNCmd(var status: Pointer; var error: Pointer; cmd: Ansistring): Boolean; stdcall; external 'tfhkaif.dll';
function SendFileCmd(var status: Pointer; var error: Pointer; FileName: Ansistring): Boolean; stdcall; external 'tfhkaif.dll';
function UploadReportCmd(status: Pointer; error: Pointer; cmd, FileName: Ansistring): Boolean; stdcall; external 'tfhkaif.dll';
function UploadReportDin(status: Pointer; error: Pointer; cmd, Cadena: Ansistring): Boolean; stdcall; external 'tfhkaif.dll';
function UploadStatusCmd(status: Pointer; error: Pointer; cmd, FileName: Ansistring): Boolean; stdcall; external 'tfhkaif.dll';
function UploadStatusDin(status: Pointer; error: Pointer; cmd, Cadena: Ansistring): Boolean; stdcall; external 'tfhkaif.dll';
{ =============================================================================== }

// * -----------------Funciones productos The Factory HKA---------------------------------- */
function HKA_ShowErrorByName(pShowMessage: Boolean; var pMessageError: string): Boolean;
function HKA_ShowStatusByName(pShowMessage: Boolean; var pStringStatus: string): Boolean;
// * ---------------------------------------------------------------------------------------*/

procedure Cierra_Comunicacion_Impresora;
procedure Abrir_Cupon(cRIF, cNombre, cDireccion, cTelefono: Ansistring);
procedure Anula_Cupon;
procedure Procesa_Detalle_Factura(opTabl_Det: TMemTableEh);
procedure Inicializa_Tipos;
procedure Abre_NotaDeCredito(cNombre, cDireccion, cDocuemntoEnlace, cRIF: string);
procedure Procesa_DesTot_Factura;
procedure Procesa_Forma_Pago(opTabl_Det: TMemTableEh);
procedure Cierra_Cupon(cMensage: string);
function Print_Doc_NoFiscal(pFileName: string; cTitulo: string): Boolean;
function Recupera_Numero_ComprobanteFiscal(iTipo: Integer = 0): string;
function Recupera_Numero_Serie: string;
function Procesa_Salida_Dinero(pValor: extended): Boolean;
function Procesa_Entrada_Dinero(pValor: extended): Boolean;
function Procesa_Fondo_Caja(pValor: extended): Boolean;
function Procesa_CierreX(bForceX: Boolean = false): Boolean;
function Procesa_CierreZ: Boolean;
function Reimprime_CierreZ(cInicioZ: string = ''; cFinZ: string = ''): Boolean;
function Reimprecion_Coo(iNum_Coo: Integer; iTipo: Integer = 0; oForm: Tform = nil): Boolean;
function Recupera_Numero_Cupon(iTipo: Integer = 0): string;
procedure Efectuar_Formas_Pagos(iFormaPago: Integer; fMonto: extended);
procedure AHK_Set_Data;
function Recupera_Numero_UltimaZ_AHK(var cUltimaZ: string): Boolean;
function Recupera_Fecha_UltimaZ_AHK(var FechaHora: TdateTime): Boolean;
function Verifica_Z: Boolean;
function Procesa_Pagos_AHK(pValor: extended; iFormaPago: Integer; iTipoOp: Integer = 1): Boolean;
function IMPF_Print_Lines_NoFiscal(cStringValue: string; bCenterText: Boolean = false; bEndFound: Boolean = false): Boolean;

procedure LinesToAHK(sValue: string; var oList: TStringList);
function Fecha_Hora_Ahk(var dFecha: TdateTime): Boolean;
procedure Espera_Proceso_IMPF; overload;
procedure Espera_Proceso_IMPF(var poText: TLabel); overload;
procedure Acciona_Gaveta_AHK;
procedure carga_fp(opTabl_Det: TMemTableEh);
function HKA_ShowStatusEspera(pShowMessage: Boolean; var pStringStatus: string): Boolean;
function HKA_ShowStatusProcesando(pShowMessage: Boolean; var pStringStatus: string; var poText: TLabel): Boolean;

implementation

uses utiles, sinco_main;

function Fecha_Hora_Ahk(var dFecha: TdateTime): Boolean;
var
  cFecha, cHoras: string;
  iY, iM, iD: Word;
  iHo, iMi, iSe: Word;
  cComando, cStringResult: Ansistring;
begin
  SetLength(cStringResult, 145);
  result := true;

  cComando := 'S1';
  if (bHKALog = true) then
    utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
  UploadStatusDin(@HKA_FP_Status, @HKA_FP_Error, cComando, cStringResult);
  if (utiles.isEmpty(cStringResult) = false) then
  begin
    cFecha := copy(trim(cStringResult), 123, 6);
    cHoras := copy(trim(cStringResult), 117, 6);
  end;

  try
    iY := StrToInt('20' + copy(cFecha, 5, 2));
    iM := StrToInt(copy(cFecha, 3, 2));
    iD := StrToInt(copy(cFecha, 1, 2));

    iHo := StrToInt(copy(cHoras, 1, 2));
    iMi := StrToInt(copy(cHoras, 3, 2));
    iSe := StrToInt(copy(cHoras, 5, 2));

    dFecha := EncodeDateTime(iY, iM, iD, iHo, iMi, iSe, 000);

    cFecha := DatetimeToStr(dFecha);
    exit;
  except
    result := false;
  end;
end;

function Reimprecion_Coo(iNum_Coo: Integer; iTipo: Integer = 0; oForm: Tform = nil): Boolean;
var
  iChoiceFIS: Integer;
  cComando: string;
  cNum_Coo: string;
begin
  utiles.WaitStart(oForm, 'Este proceso de reimpresi�n puede tardar varios minutos.' + #13 + 'Por favor espere mientras la impresora fiscal ejecuta la orden.');
  cNum_Coo := utiles.padl(trim(IntToStr(iNum_Coo)), 7, '0');
  case iTipo of
    1: { Factura }
      begin
        cComando := 'RF' + cNum_Coo + cNum_Coo;
        if (bHKALog = true) then
          utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
        SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);
      end;
    2: { Nota de Crédito }
      begin
        cComando := 'RC' + cNum_Coo + cNum_Coo;
        if (bHKALog = true) then
          utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
        SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);
      end;
    3: { Cierre X }
      begin
        cComando := 'RX' + cNum_Coo + cNum_Coo;
        // cComando := 'U3A00' + cNum_Coo + '00' + cNum_Coo;
        if (bHKALog = true) then
          utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
        SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);
      end;
    4: { Cierre Z }
      begin
        cComando := 'RZ' + cNum_Coo + cNum_Coo;
        if (bHKALog = true) then
          utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
        SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);
      end;
    5: { Cierre Z }
      begin
        cComando := 'RT' + cNum_Coo + cNum_Coo;
        if (bHKALog = true) then
          utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
        SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);
      end;
  end;
  utiles.WaitEnd;
end;

function HKA_ShowStatusByName(pShowMessage: Boolean; var pStringStatus: string): Boolean;
var
  nChoice: Integer;
  cStatus: string;
  bResult: Boolean;
begin
  bResult := ReadFpStatus(@HKA_FP_Status, @HKA_FP_Error);
  nChoice := Integer(HKA_FP_Status);
  case nChoice of
    0:
      cStatus := 'Status Desconocido.';
    1:
      cStatus := 'En modo prueba y en espera.';
    2:
      cStatus := 'En modo prueba y emisión de documentos fiscales.';
    3:
      cStatus := 'En modo prueba y emisión de documentos no fiscales.';
    4:
      cStatus := 'En modo fiscal y en espera.';
    5:
      cStatus := 'En modo fiscal y emisión de documentos fiscales.';
    6:
      cStatus := 'En modo fiscal y emisión de documentos no fiscales.';
    7:
      cStatus := 'En modo fiscal y cercana carga completa de la memoria fiscal y en espera.';
    8:
      cStatus := 'En modo fiscal y cercana carga completa de la memoria fiscal y en emisi�n de doscumentos fiscales.';
    9:
      cStatus := 'En modo fiscal y cercana carga completa de la memoria fiscal y en emisión de doscumentos no fiscales.';
    10:
      cStatus := 'En modo fiscal y carga completa de la memoria fiscal y en espera.';
    11:
      cStatus := 'En modo fiscal y carga completa de la memoria fiscal y en emisión de documentos fiscales.';
    12:
      cStatus := 'En modo fiscal y carga completa de la memoria fiscal y en emisión de documentos no fiscales.';
    else
      cStatus := 'Status Desconocido.';
  end;

  pStringStatus := UpperCase(trim(cStatus));
  AHK_FISCAL_LIB.HKA_ST_Status := pStringStatus;
  if (pShowMessage = true) then
    MessageDlg(cStatus, mtInformation, [mbOk], 0);

  if ((nChoice = 4) or (nChoice = 7)) then
    result := true
  else
    result := false;
end;

function HKA_ShowStatusEspera(pShowMessage: Boolean; var pStringStatus: string): Boolean;
var
  nChoice: Integer;
  cStatus: string;
  bResult: Boolean;
begin
  bResult := ReadFpStatus(@HKA_FP_Status, @HKA_FP_Error);
  nChoice := Integer(HKA_FP_Status);
  case nChoice of
    0:
      cStatus := 'Status Desconocido.';
    1:
      cStatus := 'En modo prueba y en espera.';
    2:
      cStatus := 'En modo prueba y emisión de documentos fiscales.';
    3:
      cStatus := 'En modo prueba y emisión de documentos no fiscales.';
    4:
      cStatus := 'En modo fiscal y en espera.';
    5:
      cStatus := 'En modo fiscal y emisión de documentos fiscales.';
    6:
      cStatus := 'En modo fiscal y emisión de documentos no fiscales.';
    7:
      cStatus := 'En modo fiscal y cercana carga completa de la memoria fiscal y en espera.';
    8:
      cStatus := 'En modo fiscal y cercana carga completa de la memoria fiscal y en emisi�n de doscumentos fiscales.';
    9:
      cStatus := 'En modo fiscal y cercana carga completa de la memoria fiscal y en emisión de doscumentos no fiscales.';
    10:
      cStatus := 'En modo fiscal y carga completa de la memoria fiscal y en espera.';
    11:
      cStatus := 'En modo fiscal y carga completa de la memoria fiscal y en emisión de documentos fiscales.';
    12:
      cStatus := 'En modo fiscal y carga completa de la memoria fiscal y en emisión de documentos no fiscales.';
    else
      cStatus := 'Status Desconocido.';
  end;

  pStringStatus := UpperCase(trim(cStatus));
  if (pShowMessage = true) then
    MessageDlg(cStatus, mtInformation, [mbOk], 0);

  if ((nChoice = 1) or (nChoice = 4) or (nChoice = 7) or (nChoice = 10)) then
    result := true
  else
    result := false;
end;

function HKA_ShowStatusProcesando(pShowMessage: Boolean; var pStringStatus: string; var poText: TLabel): Boolean;
var
  nChoice: Integer;
  cStatus: string;
  bResult: Boolean;
begin
  bResult := ReadFpStatus(@HKA_FP_Status, @HKA_FP_Error);
  nChoice := Integer(HKA_FP_Status);
  case nChoice of
    0:
      cStatus := 'Status Desconocido.';
    1:
      cStatus := 'En modo prueba y en espera.';
    2:
      cStatus := 'En modo prueba y emisión de documentos fiscales.';
    3:
      cStatus := 'En modo prueba y emisión de documentos no fiscales.';
    4:
      cStatus := 'En modo fiscal y en espera.';
    5:
      cStatus := 'En modo fiscal y emisión de documentos fiscales.';
    6:
      cStatus := 'En modo fiscal y emisión de documentos no fiscales.';
    7:
      cStatus := 'En modo fiscal y cercana carga completa de la memoria fiscal y en espera.';
    8:
      cStatus := 'En modo fiscal y cercana carga completa de la memoria fiscal y en emisi�n de doscumentos fiscales.';
    9:
      cStatus := 'En modo fiscal y cercana carga completa de la memoria fiscal y en emisión de doscumentos no fiscales.';
    10:
      cStatus := 'En modo fiscal y carga completa de la memoria fiscal y en espera.';
    11:
      cStatus := 'En modo fiscal y carga completa de la memoria fiscal y en emisión de documentos fiscales.';
    12:
      cStatus := 'En modo fiscal y carga completa de la memoria fiscal y en emisión de documentos no fiscales.';
    else
      cStatus := 'Status Desconocido.';
  end;
  poText.caption := 'STATUS FISCAL: ' + cStatus;
  poText.Repaint;
  pStringStatus := UpperCase(trim(cStatus));
  if (pShowMessage = true) then
    MessageDlg(cStatus, mtInformation, [mbOk], 0);

  if ((nChoice = 2) or (nChoice = 3) or (nChoice = 5) or (nChoice = 6) or (nChoice = 9) or (nChoice = 11) or (nChoice = 12)) then
    result := true
  else
    result := false;
end;

function HKA_ShowErrorByName(pShowMessage: Boolean; var pMessageError: string): Boolean;
var
  nChoice: Integer;
  cError: string;
  bResult: Boolean;
  bImportant: Boolean;
  iMatriz: Integer;
begin
  bResult := ReadFpStatus(@HKA_FP_Status, @HKA_FP_Error);
  nChoice := Integer(HKA_FP_Error);
  case nChoice of
    0:
      cError := 'No hay error.';
    1:
      begin
        cSerieIMF := utiles.Read_IniFacilValue('Fiscal_Opt', 'ModeloIMP', 'S', '');
        if (utiles.isEmpty(cSerieIMF) = false) then
        begin
          iMatriz := utiles.Read_IniFacilValue('Fiscal_Opt', 'MATRICIAL', 'I', 0);
          if (iMatriz = 1) then
          begin
            { Sólo esta activado para impresores matriciales. }
            cError := 'Fin de la entrega del papel.';
          end
          else
          begin
            cError := '';
            nChoice := 0;
          end;
        end;
      end;
    2:
      cError := 'Error mecánico en la entrega del papel.';
    3:
      cError := 'Fin de la entrega del papel y error mec�nico.';
    80:
      cError := 'Comando inválido, valor inválido.';
    84:
      cError := 'Tasa inválida.';
    88:
      cError := 'No hay asignadas directivas.';
    92:
      cError := 'Comando inválido.';
    96:
      cError := 'Error fiscal.';
    100:
      cError := 'Error de la memoria fiscal.';
    108:
      cError := 'Memoria fiscal llena.';
    112:
      cError := 'Buffer completo. (Debe enviar comando de reinicio.';
    128:
      cError := 'Error de comunicacián.';
    137:
      cError := 'No hay respuesta.';
    144:
      cError := 'Error LRC.';
    145:
      cError := 'Error Interno API.';
    153:
      cError := 'Error en la apertura del archivo.';
    else
      cError := 'Error desconocido.';
  end;

  pMessageError := UpperCase(trim(cError));
  AHK_FISCAL_LIB.HKA_ST_Error := pMessageError;
  if (nChoice <> 0) then
  begin
    if pShowMessage = true then
      MessageDlg('ERROR ENVIADO POR LA IMPRESORA FISCAL AHK: [' + cError + ']', mtError, [mbOk], 0);

    if (bHKALog = true) then
      utiles.LogToFile('*->' + cError + '<-*', ExtractFilePath(application.ExeName) + '\AHK.LOG');

    result := true;
  end
  else
  begin
    result := false;
  end;
end;

procedure Cierra_Comunicacion_Impresora;
begin
  CloseFpctrl;
end;

procedure Abrir_Cupon(cRIF, cNombre, cDireccion, cTelefono: Ansistring);
var
  iChoiceFIS: Integer;
  cComando: string;
  cMsgPromo: string;
  cTmNombre: string;
  oList: TStringList;
  iIdx: Integer;
  iCnt: Integer;
  iFlg_Ven, iFlg_Ref, iLen_Rif, iLen_Cte, iLen_Dir: Integer;
begin
  oList := TStringList.Create;
  iIdx := 0;
  iCnt := 0;
  iLen_Rif := 0;

  iFlg_Ref := utiles.Read_IniFacilValue('Fiscal_Opt', 'Referencia', 'I', 0);
  iLen_Rif := utiles.Read_IniFacilValue('Fiscal_Opt', 'AHK_Rif_Len', 'I', 20);
  iLen_Cte := utiles.Read_IniFacilValue('Fiscal_Opt', 'AHK_Cte_Len', 'I', 40);
  iLen_Dir := utiles.Read_IniFacilValue('Fiscal_Opt', 'AHK_Dir_Len', 'I', 133);

  cRIF := trim(cRIF);
  cNombre := trim(cNombre);
  cDireccion := trim(cDireccion);
  cTelefono := trim(cTelefono);

  if trim(cSerieIMF) = '' then
    cSerieIMF := Recupera_Numero_Serie;

  if utiles.isEmpty(cRIF) then
    cRIF := '000000000';
  {
    cValue := '0';
    iRetorno := Bematech_FI_HabilitaDesabilitaRetornoEstendidoMFD(Pchar(cValue));
  }
  if utiles.isEmpty(cDireccion) then
    cDireccion := 'SD';

  if utiles.isEmpty(cNombre) then
    cNombre := 'SN';

  bFlag := false;
  cRIF := trim(copy(trim(cRIF), 1, iLen_Rif));
  cComando := 'jR' + cRIF;
  if (bHKALog = true) then
    utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
  SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);

  { SOLO SOPORTA 40 CARACTERES POR LINEA. }
  // cTmNombre := 'CLIENTE:' + copy(trim(cNombre), 1, 40);
  cTmNombre := trim(copy(trim(cNombre), 1, iLen_Cte));
  cComando := 'jS' + cTmNombre;
  if (bHKALog = true) then
    utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
  SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);

  cNombre := trim(copy(trim(cNombre), iLen_Cte - 1, length(cNombre)));
  LinesToAHK(cNombre, oList);
  iIdx := 0;
  for iIdx := 0 to oList.Count - 1 do
  begin
    iCnt := iCnt + 1;
    cComando := 'j' + trim(IntToStr(iCnt)) + '' + oList[iIdx];
    if (bHKALog = true) then
      utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
    SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);
  end;

  { SOLO SOPORTA 40 CARACTERES POR LINEA. }
  cDireccion := 'DIRECCION:' + trim(copy(trim(cDireccion), 1, iLen_Dir));
  LinesToAHK(cDireccion, oList);
  iIdx := 0;
  for iIdx := 0 to oList.Count - 1 do
  begin
    iCnt := iCnt + 1;
    cComando := 'j' + trim(IntToStr(iCnt)) + '' + oList[iIdx];
    if (bHKALog = true) then
      utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
    SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);
  end;

  if trim(cNum_Refere) <> '' then
  begin
    if iFlg_Ref = 1 then
    begin
      cComando := 'j' + IntToStr(iCnt) + 'Nùm. Ref.#: ' + trim(cNum_Refere) + '';
      if (bHKALog = true) then
        utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
      SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);
    end;

    { if (fprincipal.iNoPed_Manual_Pos = 1) then }
    if (1 = 0) then
    begin
      cComando := 'j' + IntToStr(iCnt) + 'Núm. Ped.#: ' + trim(cNum_Pedido) + '';
      if (bHKALog = true) then
        utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
      SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);
    end;
  end;
end;

procedure Anula_Cupon;
var
  iChoiceFIS, nChoice: Integer;
  cComando: string;
  cStatus: string;
  bResult: Boolean;
begin
  begin
    bResult := ReadFpStatus(@HKA_FP_Status, @HKA_FP_Error);
    nChoice := Integer(HKA_FP_Status);
    cComando := '7';
    if (bHKALog = true) then
      utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
    SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);
  end;
end;

procedure Cierra_Cupon(cMensage: string);
var
  iChoiceFIS: Integer;
  cSql_Ln, cSqlLine, cString, cComando: string;
  fCargo: extended;
  oText: TStringList;
  i: Integer;
  iFlg_Ven, iFlg_Ref, iFlg_Caj, iFlg_Mes, iFlg_Com: Integer;
  cText_Cargo: string;
  cText_Total: string;
  fCta_Nvo_Salfo: extended;
  cTmp_Ref, cTmp_Ped, cTmp_Cor, cTmp_Cta: string;
  cTmp_val1, cTmp_val2, cTmp_val3: string;
  cTmp_val4, cTmp_val5, cTmp_val6: string;
  cValorTexto, cTipoCodigoB, cTextCodigoB: string;
  iFlg_Cor: Integer;
  iIdx: Integer;
begin
  iFlg_Ven := utiles.Read_IniFacilValue('Fiscal_Opt', 'Vendedor', 'I', 1);
  iFlg_Ref := utiles.Read_IniFacilValue('Fiscal_Opt', 'Referencia', 'I', 0);
  iFlg_Cor := utiles.Read_IniFacilValue('Fiscal_Opt', 'No_Correl', 'I', 0);

  iFlg_Caj := utiles.Read_IniFacilValue('Fiscal_Opt', 'Cajero', 'I', 1);
  iFlg_Com := utiles.Read_IniFacilValue('Fiscal_Opt', 'coment', 'I', 1);

  cTmp_Ref := '';
  cTmp_Ped := '';
  cTmp_Cor := '';
  cTmp_Cta := '';

  cTmp_val1 := cNum_Refere;
  cTmp_val2 := cNum_Pedido;
  cTmp_val3 := '';

  if (trim(cTmp_val1) <> '') then
    cTmp_Ref := '#Ref.: ' + cTmp_val1;

  if (trim(cTmp_val2) <> '') then
    cTmp_Ped := '#Ped.: ' + cTmp_val2;

  if (trim(cTmp_val3) <> '') then
    cTmp_Cta := '#Cta.: ' + utiles.padl(cTmp_val3, 4, '0');

  if (trim(cOFG_Num_corre) <> '') then
    cTmp_Cor := '#Cor.: ' + trim(cOFG_Num_corre);

  cText_Cargo := trim(utiles.Read_IniFacilValue('Fiscal_Opt', 'TextoCargo', 'S', 'Cargos/Servicio Sugerido'));

  cPol_08 := '';
  if trim(cPol_08) = '' then
    cPol_08 := '0';

  if (trim(cPol_08) = '0') then
  begin
    cText_Total := trim(utiles.Read_IniFacilValue('Fiscal_Opt', 'TotalDocum1', 'S', 'Total C/Servicio'));
  end
  else
  begin
    cText_Total := trim(utiles.Read_IniFacilValue('Fiscal_Opt', 'TotalDocum2', 'S', 'Cambio C/Servicio'));
  end;

  i := 0;
  begin
    if trim(cOFG_VarTipoV) = '16' then
    begin
      cComando := '100';
      if (bHKALog = true) then
        utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
      SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);
    end;
  end;
  freeandnil(oText);
end;

procedure Abre_NotaDeCredito(cNombre, cDireccion, cDocuemntoEnlace, cRIF: string);
var
  iDay, iMonth, iYear, iHour, iMinute, iSecond, iMilli: Word;
  cDia, cMes, cAno, cHora, cMinuto, cSegundo: string;
  cValue, cComando: string;
  iChoiceFIS: Integer;
  cTipo, crncComprador, cCOO, cNumeroSerie, cMsgPromo: string;
  cTmNombre: string;
  iFlg_Ven, iFlg_Ref, iLen_Rif, iLen_Cte, iLen_Dir: Integer;
begin
  cRIF := trim(cRIF);
  cNombre := trim(cNombre);
  cDireccion := trim(cDireccion);
  cDocuemntoEnlace := trim(cDocuemntoEnlace);

  cSerieIMF := trim(Recupera_Numero_Serie());

  iFlg_Ref := utiles.Read_IniFacilValue('Fiscal_Opt', 'Referencia', 'I', 0);
  iLen_Rif := utiles.Read_IniFacilValue('Fiscal_Opt', 'AHK_Rif_Len', 'I', 20);
  iLen_Cte := utiles.Read_IniFacilValue('Fiscal_Opt', 'AHK_Cte_Len', 'I', 40);
  iLen_Dir := utiles.Read_IniFacilValue('Fiscal_Opt', 'AHK_Dir_Len', 'I', 133);

  DecodeDateTime(utiles.cApp_Fecha_sistema, iYear, iMonth, iDay, iHour, iMinute, iSecond, iMilli);
  cDia := utiles.padl(trim(IntToStr(iDay)), 2, '0');
  cMes := utiles.padl(trim(IntToStr(iMonth)), 2, '0');
  cAno := utiles.RightStr(trim(IntToStr(iYear)), 2);

  DecodeDateTime(now(), iYear, iMonth, iDay, iHour, iMinute, iSecond, iMilli);
  cHora := utiles.padl(trim(IntToStr(iHour)), 2, '0');
  cMinuto := utiles.padl(trim(IntToStr(iMinute)), 2, '0');
  cSegundo := utiles.padl(trim(IntToStr(iSecond)), 2, '0');

  if cNombre = '' then
    cNombre := 'CONTADO';

  if cRIF = '' then
    cRIF := 'NULL';

  begin

    cRIF := trim(copy(trim(cRIF), 1, iLen_Rif));
    cTmNombre := trim(copy(trim(cNombre), 1, iLen_Cte));
    cDireccion := trim('DIRECCION:' + copy(trim(cDireccion), 1, iLen_Dir));

    cComando := 'jR' + PChar(cRIF);
    if (bHKALog = true) then
      utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
    SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);

    cComando := 'jS' + PChar(cTmNombre);
    if (bHKALog = true) then
      utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
    SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);

    cComando := 'jF' + PChar(cDocuemntoEnlace);
    if (bHKALog = true) then
      utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
    SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);

    cComando := 'j1' + 'Direccion: ' + PChar(cDireccion);
    if (bHKALog = true) then
      utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
    SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);
  end;
end;

procedure Inicializa_Tipos;
var
  iChoiceFIS: Integer;
  cComando: string;
begin
  begin
    { 'p' para porcentual o 'q' para valor }
    if bDescMont = true then
      sTipoDesconto := 'q'
    else
      sTipoDesconto := 'p';
  end;
end;

procedure Procesa_Detalle_Factura(opTabl_Det: TMemTableEh);
var
  cCodigo, cDescripcion: string;
  cCantid, cPrecio, cValDes: string;
  fCantid, fPrecio, fValDes, fImpues: extended;
  cComando: string;
  cDecFormat: string;
  cDescrip: string;
  iMatriz: Integer;
begin

  cDescripcion := '';
  FormatSettings.DecimalSeparator := '.';
  { cSqlLine := '';
    cSqlLine := cSqlLine + 'SELECT ';
    cSqlLine := cSqlLine + '	Prod_id, ';
    cSqlLine := cSqlLine + '	Prod_Op_Id, ';
    cSqlLine := cSqlLine + '	Prod_Codigo, ';
    cSqlLine := cSqlLine + '  TRIM(CONCAT(TRIM(Prod_Descrip),",",TRIM(IFNULL(Prod_Detalle," ")))) AS Prod_Descrip, ';
    cSqlLine := cSqlLine + '	Prod_Descrip, ';
    cSqlLine := cSqlLine + '	Round(SUM(Prod_Cant), 3) AS Prod_Cant, ';
    cSqlLine := cSqlLine + '	Prod_Precio, ';
    cSqlLine := cSqlLine + ' 	(Round(Round(Prod_Cant, 3)  * Prod_Precio, 2)) AS Prod_total, ';
    cSqlLine := cSqlLine + '	Prod_Itbms, ';
    cSqlLine := cSqlLine + '	Prod_Desc1, ';
    cSqlLine := cSqlLine + '  Prod_Desc2, ';
    cSqlLine := cSqlLine + '  Prod_Garant_Dias, ';
    cSqlLine := cSqlLine + '  Prod_Garant_Text ';
    cSqlLine := cSqlLine + 'FROM op_det_fiscal ';
    cSqlLine := cSqlLine + 'WHERE Prod_Op_Id="' + trim(cNumeroFinal) + '"';

    if (bAgruped_Id_Prod = false) then
    cSqlLine := cSqlLine + 'GROUP BY Prod_Op_Id, Prod_Codigo, Prod_Precio '
    else
    begin
    cSqlLine := cSqlLine + 'GROUP BY Prod_id ';
    cSqlLine := cSqlLine + 'ORDER BY Prod_id ASC ';
    end;
  }

  Inicializa_Tipos;
  cDecFormat := utiles.iif(iDecimal = 3, '#######0.000', '#######0.00');
  bFlag := false;

  opTabl_Det.First;
  while not opTabl_Det.Eof do
  begin
    if (bBreak_Proc = true) then
    begin
      // Anula_Cupon;
      opTabl_Det.Next;
      continue;
    end;

    fCantid := Roundd(abs(opTabl_Det.FieldByName('Prod_Cant').AsFloat), 3);
    fPrecio := Roundd(abs(opTabl_Det.FieldByName('Prod_Precio').AsFloat), 2);
    fImpues := abs(opTabl_Det.FieldByName('Prod_Itbms').AsFloat);
    fValDes := abs(Roundd(fCantid * opTabl_Det.FieldByName('Prod_Desc1').AsFloat, 2));
    cCodigo := AnsileftStr(trim(opTabl_Det.FieldByName('Prod_Codigo').AsString), 13);

    if utiles.Read_IniFacilValue('Fiscal_Opt', 'AHK_Desc_CodNum', 'I', 0) = 1 then
    begin
      cDescrip := trim(opTabl_Det.FieldByName('Prod_Descrip').AsString);

      cComando := '@CODIGO:' + trim(cCodigo);
      if (bHKALog = true) then
        utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
      SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cComando));
    end
    else
      cDescrip := '|' + trim(cCodigo) + '|' + trim(opTabl_Det.FieldByName('Prod_Descrip').AsString);

    if (utiles.isEmpty(cSerieIMF) = false) then
    begin
      cSerieIMF := utiles.Read_IniFacilValue('Fiscal_Opt', 'ModeloIMP', 'S', '');
      iMatriz := utiles.Read_IniFacilValue('Fiscal_Opt', 'MATRICIAL', 'I', 0);
      if (iMatriz = 1) then
        cDescripcion := AnsileftStr(cDescrip, 113)
      else
        cDescripcion := AnsileftStr(cDescrip, 29);
    end
    else
      cDescripcion := AnsileftStr(cDescrip, 29);

    cCantid := FormatSumadora_FloatToStr(fCantid, 5, 3);
    cPrecio := FormatSumadora_FloatToStr(fPrecio, 8, 2);
    sTipoQtde := '';
    cComando := '';
    if (fImpues = 0) then
      sAliquota := ' ';
    if (fImpues = strtofloat2(utiles.cApp_imp_01)) then
      sAliquota := '!';
    if (fImpues = strtofloat2(utiles.cApp_imp_02)) then
      sAliquota := '"';
    if (fImpues = strtofloat2(utiles.cApp_imp_03)) then
      sAliquota := '#';

    if (trim(cOFG_VarTipoV) = '16') then
    begin
      if (fImpues = 0) then
        sAliquota := '0';

      if (sAliquota = '!') then
        sAliquota := '1';

      if (sAliquota = '"') then
        sAliquota := '2';

      if (sAliquota = '#') then
        sAliquota := '3';

      cComando := 'd' + sAliquota + PChar(cPrecio) + PChar(cCantid) + PChar(cDescripcion);
    end
    else
      cComando := sAliquota + PChar(cPrecio) + PChar(cCantid) + PChar(cDescripcion);

    if (bHKALog = true) then
      utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
    SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cComando));

    if (utiles.Read_IniFacilValue('Fiscal_Opt', 'AHK_Desc_CodBar', 'I', 0) = 1) then
    begin
      cComando := 'Y' + trim(cCodigo);
      if (bHKALog = true) then
        utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
      SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cComando));
    end;

    if (fValDes > 0) then
    begin
      { Realiza el descuento por linea. }
      if (bDescMont = true) then
        cValDes := utiles.FormatSumadora_FloatToStr(fValDes, 7, 2)
      else
        cValDes := utiles.FormatSumadora_FloatToStr(fValDes, 2, 2);

      cComando := sTipoDesconto + '-' + cValDes;
      if (bHKALog = true) then
        utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
      SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cComando));
    end;

    if (opTabl_Det.FieldByName('Prod_Garant_Dias').IsNull = false) then
    begin
      if (opTabl_Det.FieldByName('Prod_Garant_Dias').AsInteger > 0) then
      begin
        cComando := '@, [GARANTIA]: ' + UpperCase(trim(opTabl_Det.FieldByName('Prod_Garant_Dias').AsString + ' Meses'));
        if (bHKALog = true) then
          utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
        SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cComando));

        cComando := '@, [CONDICIONES]: ' + AnsileftStr(UpperCase(trim(opTabl_Det.FieldByName('Prod_Garant_Text').AsString)), 20);
        if (bHKALog = true) then
          utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
        SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cComando));
      end;
    end;

    opTabl_Det.Next;
  end;
end;

procedure Procesa_DesTot_Factura;
var
  cConst, cTipoDesc, cValorIncrDesc: string;
  iChoiceFIS: Integer;
  cComando: string;
begin
  Inicializa_Tipos;

  cConst := 'D';
  fOFG_MontDesc := utiles.Roundd(fOFG_MontDesc, 2);
  cValorIncrDesc := utiles.iif(fOFG_MontDesc = 0, '0000', padl(FormatFloat('###0', (fOFG_MontDesc * 100)), 4, '0'));

  begin

    if (fOFG_MontDesc = 0) then
      exit;

    { Coloca la etiqueta de subtotal }
    cComando := '3';
    if (bHKALog = true) then
      utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
    SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cComando));

    { Realiza el descuento blobal. }
    // cValorIncrDesc := IntToStr(trunc(fOFG_MontDesc * 100));
    cValorIncrDesc := utiles.padl(cValorIncrDesc, 9, '0');

    cComando := sTipoDesconto + '-' + cValorIncrDesc;
    if (bHKALog = true) then
      utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
    SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cComando));
  end;
end;

procedure carga_fp(opTabl_Det: TMemTableEh);
begin
  fOFG_MontoDon := 0.00;

  fValorCarg := opTabl_Det.FieldByName('op_manejo').AsFloat;
  fOFG_MontDesc := opTabl_Det.FieldByName('op_desc').AsFloat;
  fOFG_MontTotal := opTabl_Det.FieldByName('op_total').AsFloat;
  fMontoVue := opTabl_Det.FieldByName('op_vuelto').AsFloat;
  fMontoPag := opTabl_Det.FieldByName('op_pagado').AsFloat;
  fMontoPag := fMontoPag - fValorCarg;
  fMontoEfe := opTabl_Det.FieldByName('op_forma_1').AsFloat;
  fMontoChe := opTabl_Det.FieldByName('op_forma_2').AsFloat;
  fMontoDeb := opTabl_Det.FieldByName('op_forma_3').AsFloat;
  fMontoCre := opTabl_Det.FieldByName('op_forma_4').AsFloat;
  fMontoCreV := opTabl_Det.FieldByName('op_credito').AsFloat;
  fMontoCer := opTabl_Det.FieldByName('op_forma_5').AsFloat;
  fMontoV06 := opTabl_Det.FieldByName('op_forma_6').AsFloat;
  fMontoV07 := opTabl_Det.FieldByName('op_forma_7').AsFloat;
  fMontoV08 := opTabl_Det.FieldByName('op_forma_8').AsFloat;
  fMontoV09 := opTabl_Det.FieldByName('op_forma_9').AsFloat;
  fMontoV10 := opTabl_Det.FieldByName('op_forma_10').AsFloat;
  fMontoV11 := opTabl_Det.FieldByName('op_forma_11').AsFloat;
  fMontoV12 := opTabl_Det.FieldByName('op_forma_12').AsFloat;
  fMontoV13 := opTabl_Det.FieldByName('op_forma_13').AsFloat;
  fMontoV14 := opTabl_Det.FieldByName('op_forma_14').AsFloat;
  fMontoV15 := opTabl_Det.FieldByName('op_forma_15').AsFloat;
  fMontoV16 := opTabl_Det.FieldByName('op_forma_16').AsFloat;
  fMontoV17 := opTabl_Det.FieldByName('op_forma_17').AsFloat;
  fMontoV18 := opTabl_Det.FieldByName('op_forma_18').AsFloat;
  fMontoV19 := opTabl_Det.FieldByName('op_forma_19').AsFloat;
  fMontoV20 := opTabl_Det.FieldByName('op_forma_20').AsFloat;

  fMontoDon := fOFG_MontoDon;
  fMontoVue := 0.00;
end;

procedure Procesa_Forma_Pago(opTabl_Det: TMemTableEh);
var
  cFormaPago, cValorPago: string;
  iChoiceFIS: Integer;
  cComando, cString: string;
  oList: TStringList;
  iIdx, iCnt: Integer;
  iFlg_Ven, iFlg_Ref, iFlg_Caj, iFlg_BarT: Integer;
  cText_Cargo: string;
  cText_Total: string;
  iGargo_In_FP: Integer;
begin
  iFlg_BarT := 0;
  iIdx := 0;
  iCnt := 0;
  oList := TStringList.Create;
  oList.Clear;

  fValorCarg := fOFG_MontCargo;

  FormatSettings.DecimalSeparator := '.';
  carga_fp(opTabl_Det);

  cPol_08 := '';
  if trim(cPol_08) = '' then
    cPol_08 := '0';
  iGargo_In_FP := StrToInt(cPol_08);

  if (fMontoEfe > 0) and (fMontoEfe >= fValorCarg) then
  begin
    if (iGargo_In_FP = 1) then
      fMontoEfe := (fMontoEfe + fMontoVue)
    else
      fMontoEfe := (fMontoEfe + fMontoVue) - fValorCarg;
    { 1- Efectivo }
  end
  else
  begin
    if (fMontoChe > 0) and (fMontoChe >= fValorCarg) then
    begin
      if (iGargo_In_FP = 0) then
        fMontoChe := fMontoChe - fValorCarg;
      { 2- Cheque }
    end
    else
    begin
      if (fMontoDeb > 0) and (fMontoDeb >= fValorCarg) then
      begin
        if (iGargo_In_FP = 0) then
          fMontoDeb := fMontoDeb - fValorCarg;
        { 3- tarjetas de D�bito }
      end
      else
      begin
        if (fMontoCre > 0) and (fMontoCre >= fValorCarg) then
        begin
          if (iGargo_In_FP = 0) then
            fMontoCre := fMontoCre - fValorCarg;
          { 4- tarjetas de Cr�dito }
        end
        else
        begin
          if (fMontoCer > 0) and (fMontoCer >= fValorCarg) then
          begin
            if (iGargo_In_FP = 0) then
              fMontoCer := fMontoCer - fValorCarg;
            { 5- Certificados de Regalo }
          end
          else
          begin
            if (fMontoV06 > 0) and (fMontoV06 >= fValorCarg) then
            begin
              if (iGargo_In_FP = 0) then
                fMontoV06 := fMontoV06 - fValorCarg;
              { 6- Abonos de Apartados }
            end
            else
            begin
              if (fMontoV07 > 0) and (fMontoV07 >= fValorCarg) then
              begin
                if (iGargo_In_FP = 0) then
                  fMontoV07 := fMontoV07 - fValorCarg;
                { 7- Adicional 1 }
              end
              else
              begin
                if (fMontoV08 > 0) and (fMontoV08 >= fValorCarg) then
                begin
                  if (iGargo_In_FP = 0) then
                    fMontoV08 := fMontoV08 - fValorCarg;
                  { 8- Adicional 2 }
                end
                else
                begin
                  if (fMontoV09 > 0) and (fMontoV09 >= fValorCarg) then
                  begin
                    if (iGargo_In_FP = 0) then
                      fMontoV09 := fMontoV09 - fValorCarg;
                    { 9- Cuenta de Cr�dito. }
                  end
                  else
                  begin
                    if (fMontoV10 > 0) and (fMontoV10 >= fValorCarg) then
                    begin
                      if (iGargo_In_FP = 0) then
                        fMontoV10 := fMontoV10 - fValorCarg;
                      { 10- Donaciones. }
                    end
                    else
                    begin
                      if (fMontoV11 > 0) and (fMontoV11 >= fValorCarg) then
                      begin
                        if (iGargo_In_FP = 0) then
                          fMontoV11 := fMontoV11 - fValorCarg;
                        { 11- Cargos Adicionales. }
                      end
                      else
                      begin
                        if (fMontoV12 > 0) and (fMontoV12 >= fValorCarg) then
                        begin
                          if (iGargo_In_FP = 0) then
                            fMontoV12 := fMontoV12 - fValorCarg;
                        end
                        else
                        begin
                          if (fMontoV13 > 0) and (fMontoV13 >= fValorCarg) then
                          begin
                            if (iGargo_In_FP = 0) then
                              fMontoV13 := fMontoV13 - fValorCarg;
                          end
                          else
                          begin
                            if (fMontoV14 > 0) and (fMontoV14 >= fValorCarg) then
                            begin
                              if (iGargo_In_FP = 0) then
                                fMontoV14 := fMontoV14 - fValorCarg;
                            end
                            else
                            begin
                              if (fMontoV15 > 0) and (fMontoV15 >= fValorCarg) then
                              begin
                                if (iGargo_In_FP = 0) then
                                  fMontoV15 := fMontoV15 - fValorCarg;
                              end
                              else
                              begin
                                if (fMontoV16 > 0) and (fMontoV16 >= fValorCarg) then
                                begin
                                  if (iGargo_In_FP = 0) then
                                    fMontoV16 := fMontoV16 - fValorCarg;
                                end
                                else
                                begin
                                  if (fMontoV17 > 0) and (fMontoV17 >= fValorCarg) then
                                  begin
                                    if (iGargo_In_FP = 0) then
                                      fMontoV17 := fMontoV17 - fValorCarg;
                                  end
                                  else
                                  begin
                                    if (fMontoV18 > 0) and (fMontoV18 >= fValorCarg) then
                                    begin
                                      if (iGargo_In_FP = 0) then
                                        fMontoV18 := fMontoV18 - fValorCarg;
                                    end
                                    else
                                    begin
                                      if (fMontoV19 > 0) and (fMontoV19 >= fValorCarg) then
                                      begin
                                        if (iGargo_In_FP = 0) then
                                          fMontoV19 := fMontoV19 - fValorCarg;
                                      end
                                      else
                                      begin
                                        if (fMontoV20 > 0) and (fMontoV20 >= fValorCarg) then
                                        begin
                                          if (iGargo_In_FP = 0) then
                                            fMontoV20 := fMontoV20 - fValorCarg;
                                        end
                                      end;
                                    end;
                                  end;
                                end;
                              end;
                            end;
                          end;
                        end;
                      end;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;

  begin
    iFlg_Ven := utiles.Read_IniFacilValue('Fiscal_Opt', 'Vendedor', 'I', 0);
    iFlg_Ref := utiles.Read_IniFacilValue('Fiscal_Opt', 'Referencia', 'I', 0);
    iFlg_Caj := utiles.Read_IniFacilValue('Fiscal_Opt', 'Cajero', 'I', 0);

    cText_Cargo := trim(utiles.Read_IniFacilValue('Fiscal_Opt', 'TextoCargo', 'S', 'Cargos/Servicio Sugerido'));

    cPol_08 := '';
    if (trim(cPol_08) = '') then
      cPol_08 := '0';
    if (trim(cPol_08) = '0') then
    begin
      cText_Total := trim(utiles.Read_IniFacilValue('Fiscal_Opt', 'TotalDocum1', 'S', 'Total C/Servicio'));
    end
    else
    begin
      cText_Total := trim(utiles.Read_IniFacilValue('Fiscal_Opt', 'TotalDocum2', 'S', 'Cambio C/Servicio'));
    end;

    if (trim(fSinco_Main.oObservacion.Text) <> '') then
    begin
      iCnt := iCnt + 1;
      cComando := 'j' + trim(IntToStr(iCnt)) + '' + 'Observación:';
      if (bHKALog = true) then
        utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
      SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);

      iIdx := 0;
      iCnt := 1;
      for iIdx := 0 to 3 do
      begin
        iCnt := iCnt + 1;
        cComando := 'j' + trim(IntToStr(iCnt)) + '' + fSinco_Main.oObservacion.Lines[iIdx];
        if (bHKALog = true) then
          utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
        SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);
      end;

    end;

    if (abs(fOFG_MontCargo) > 0) then
    begin
      iCnt := iCnt + 1;
      cString := utiles.padl(cText_Cargo + ': ' + trim(FormatFloat('###,##0.00', fOFG_MontCargo)) + ' ', 40, ' ');
      cComando := 'j' + trim(IntToStr(iCnt)) + '' + cString;
      if (bHKALog = true) then
        utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
      SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);

      iCnt := iCnt + 1;
      cString := utiles.padl(replicate('-', 39), 48, ' ');
      cComando := 'j' + trim(IntToStr(iCnt)) + '' + cString;
      if (bHKALog = true) then
        utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
      SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);

      iCnt := iCnt + 1;
      cString := utiles.padl(cText_Total + ': ' + trim(FormatFloat('###,##0.00', fOFG_MontTotal)) + ' ', 40, ' ');

      cComando := 'j' + trim(IntToStr(iCnt)) + '' + cString;
      if (bHKALog = true) then
        utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
      SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);

      iCnt := iCnt + 1;
      cString := replicate('-', 48);
      cComando := 'j' + trim(IntToStr(iCnt)) + '' + cString;
      if (bHKALog = true) then
        utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
      SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);
    end;

    if (iFlg_Ref = 1) then
    begin
      iCnt := iCnt + 1;
      cString := utiles.iif(iFlg_Ref = 0, '', 'Referencia: ' + trim(cNum_Refere) + ' ');
      cComando := 'j' + trim(IntToStr(iCnt)) + '' + copy(trim(cString), 1, 39);
      if (bHKALog = true) then
        utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
      SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);
    end;

    if (iFlg_Ven = 1) then
    begin
      iCnt := iCnt + 1;
      cString := ' Vend. Global:[' + bv01 + '/' + bv02 + '] ';
      cComando := 'j' + trim(IntToStr(iCnt)) + '' + copy(trim(cString), 1, 39);
      if (bHKALog = true) then
        utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
      SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);
    end;

    iCnt := iCnt + 1;
    cString := '[' + cNumeroFinal + ']';
    cComando := 'j' + trim(IntToStr(iCnt)) + '' + copy(trim(cString), 1, 39);
    if (bHKALog = true) then
      utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
    SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);

    iFlg_BarT := utiles.Read_IniFacilValue('Fiscal_Opt', 'AHK_BarCodT', 'I', 0);
    if (iFlg_BarT = 1) then
    begin
      cComando := 'y' + trim(cNumeroFinal);
      if (bHKALog = true) then
        utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
      SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);
    end;
  end;

  if (fMontoEfe > 0) then
    Efectuar_Formas_Pagos(1, fMontoEfe);

  if (fMontoChe > 0) then
    Efectuar_Formas_Pagos(2, fMontoChe);

  if (fMontoDeb > 0) then
    Efectuar_Formas_Pagos(3, fMontoDeb);

  if (fMontoCre > 0) then
    Efectuar_Formas_Pagos(4, fMontoCre);

  if (fMontoCer > 0) then
    Efectuar_Formas_Pagos(5, fMontoCer);

  if (fMontoV06 > 0) then
    Efectuar_Formas_Pagos(6, fMontoV06);

  if (fMontoV07 > 0) then
    Efectuar_Formas_Pagos(7, fMontoV07);

  if (fMontoV08 > 0) then
    Efectuar_Formas_Pagos(8, fMontoV08);

  if (fMontoV09 > 0) then
    Efectuar_Formas_Pagos(9, fMontoV09);

  if (fMontoV10 > 0) then
    Efectuar_Formas_Pagos(10, fMontoV10);

  if (fMontoV11 > 0) then
  begin
    if (iGargo_In_FP = 1) then
      Efectuar_Formas_Pagos(11, fMontoV11);
  end;

  if (fMontoV12 > 0) then
    Efectuar_Formas_Pagos(12, fMontoV12);

  if (fMontoV13 > 0) then
    Efectuar_Formas_Pagos(13, fMontoV13);

  if (fMontoV14 > 0) then
    Efectuar_Formas_Pagos(14, fMontoV14);

  if (fMontoV15 > 0) then
    Efectuar_Formas_Pagos(15, fMontoV15);

  if (fMontoV16 > 0) then
    Efectuar_Formas_Pagos(16, fMontoV16);

  if (fMontoV17 > 0) then
    Efectuar_Formas_Pagos(17, fMontoV17);

  if (fMontoV18 > 0) then
    Efectuar_Formas_Pagos(18, fMontoV18);

  if (fMontoV19 > 0) then
    Efectuar_Formas_Pagos(19, fMontoV19);

  if (fMontoV20 > 0) then
    Efectuar_Formas_Pagos(20, fMontoV20);
end;

procedure Efectuar_Formas_Pagos(iFormaPago: Integer; fMonto: extended);
var
  cTable_Tp, cComando, cFormaPago: string;
  iFlag1, iFlag2: Integer;
  cMonto: string;
  iUsa_Tp_Est: Integer;

begin
  cTable_Tp := 'tipo_pago';
  iUsa_Tp_Est := 0;

  if (iUsa_Tp_Est = 1) then
    cTable_Tp := 'tipo_pago_est';

  begin
    // cMonto := IntToStr(trunc(fMonto * 100));
    cMonto := trim(FormatFloat('###########0', (fMonto * 100)));
    cMonto := utiles.padl(cMonto, 12, '0');
    case iFormaPago of
      01:
        cFormaPago := '01';
      02:
        cFormaPago := '02';
      03:
        cFormaPago := '03';
      04:
        cFormaPago := '04';
      05:
        cFormaPago := '05';
      06:
        cFormaPago := '06';
      07:
        cFormaPago := '07';
      08:
        cFormaPago := '08';
      09:
        cFormaPago := '09';
      10:
        cFormaPago := '10';
      11:
        cFormaPago := '11';
      12:
        cFormaPago := '12';
      13:
        cFormaPago := '13';
      14:
        cFormaPago := '14';
      15:
        cFormaPago := '15';
      16:
        cFormaPago := '16';
      17:
        cFormaPago := '17';
      18:
        cFormaPago := '18';
      19:
        cFormaPago := '19';
      20:
        cFormaPago := '20';
    end;

    // if (trim(cOFG_VarTipoV) = '16') then
    // cComando := '1' + cFormaPago + cMonto
    // else
    cComando := '2' + cFormaPago + cMonto;

    if (bHKALog = true) then
      utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
    SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);
  end;
end;

function Recupera_Numero_ComprobanteFiscal(iTipo: Integer = 0): string;
var
  cNumeroComprobanteFiscal: string;
  iCuenta: Integer;
  cUltimaZ: string;
  cComando, cStringResult: Ansistring;
begin
  cNumeroComprobanteFiscal := '';
  SetLength(cStringResult, 250);
  begin
    cComando := 'S1';
    if (bHKALog = true) then
      utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');

    UploadStatusDin(@HKA_FP_Status, @HKA_FP_Error, cComando, cStringResult);
    // UploadStatusDin(@HKA_FP_Status, @HKA_FP_Error, cComando, cStringResult);

    if utiles.isEmpty(cStringResult) = false then
    begin
      case iTipo of
        1: { Factura }
          begin
            cNumeroComprobanteFiscal := copy(cStringResult, 24 - 2, 8);
          end;
        2: { Nota de Cr�dito }
          begin
            cNumeroComprobanteFiscal := copy(cStringResult, 39 - 4, 8);
          end;
        3: { Cierre X }
          begin

          end;
        4: { Cierre Z }
          begin
            cNumeroComprobanteFiscal := '0';
            Recupera_Numero_UltimaZ_AHK(cUltimaZ);
            cNumeroComprobanteFiscal := cUltimaZ;
          end;
      end;
    end;
  end;
  result := cNumeroComprobanteFiscal;
end;

function Recupera_Numero_Cupon(iTipo: Integer = 0): string;
var
  cNumeroCupon: string;
  iCuenta: Integer;
  cUltimaZ: string;
  cComando, cStringResult: Ansistring;
begin
  cNumeroCupon := '';
  SetLength(cStringResult, 250);

  cComando := 'S1';
  if (bHKALog = true) then
    utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
  UploadStatusDin(@HKA_FP_Status, @HKA_FP_Error, cComando, cStringResult);
  if utiles.isEmpty(cStringResult) = false then
  begin
    case iTipo of
      1: { Factura }
        begin
          cNumeroCupon := copy(cStringResult, 24 - 2, 8);
        end;
      2: { Nota de Cr�dito }
        begin
          cNumeroCupon := copy(cStringResult, 39 - 4, 8);
        end;
      3: { Cierre X }
        begin
          cNumeroCupon := copy(cStringResult, 61, 8);
        end;
      4: { Cierre Z }
        begin
          cNumeroCupon := '0';
          Recupera_Numero_UltimaZ_AHK(cUltimaZ);
          cNumeroCupon := cUltimaZ;
        end;
      5: { Doc. No fiscal }
        begin
          cNumeroCupon := copy(cStringResult, 61, 8);
        end;
    end;
  end;
  result := cNumeroCupon;
end;

function Recupera_Numero_Serie: string;
var
  cMFDSerie: string;
  iCuenta: Integer;
  cPathFile: string;
  cComando, cStringResult: Ansistring;
begin
  cMFDSerie := '';
  cStringResult := '';
  SetLength(cStringResult, 250);
  cComando := 'S1';
  if (bHKALog = true) then
    utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
  UploadStatusDin(@HKA_FP_Status, @HKA_FP_Error, cComando, cStringResult);
  // UploadReportDin(@HKA_FP_Status, @HKA_FP_Error, cComando, cStringResult);
  if utiles.isEmpty(cStringResult) = false then
  begin
    cMFDSerie := copy(cStringResult, 118 - 14, 13);
  end;
  cMFDSerie := trim(cMFDSerie);
  result := cMFDSerie;
end;

function Print_Doc_NoFiscal(pFileName: string; cTitulo: string): Boolean;
var
  oBouche: TStringList;
  iIndex: Integer;
  cString, cString2, cIndice: string;
  iChoiceFIS: Integer;
  cComando: string;
begin

  oBouche := TStringList.Create;
  oBouche.Clear;
  if fileExists(pFileName) then
  begin
    oBouche.LoadFromFile(pFileName);

    cString2 := '80>' + utiles.CenterString(cTitulo, 45) + #10;
    if (bHKALog = true) then
      utiles.LogToFile(cString2, ExtractFilePath(application.ExeName) + '\AHK.LOG');
    SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cString2) + #10);

    cString2 := '80>' + utiles.CenterString('_________________________________________', 45);
    if (bHKALog = true) then
      utiles.LogToFile(cString2, ExtractFilePath(application.ExeName) + '\AHK.LOG');
    SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cString2) + #10);
  end;

  for iIndex := 0 to oBouche.Count - 1 do
  begin
    cString := oBouche[iIndex];
    if trim(cString) = '' then
      cString := '.';
    cString := StringReplace(cString, #13, #32, [rfReplaceAll]);
    cString := StringReplace(cString, #10, #32, [rfReplaceAll]);

    cString2 := '80>';
    if (bHKALog = true) then
      utiles.LogToFile(cString2, ExtractFilePath(application.ExeName) + '\AHK.LOG');
    SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cString2 + cString) + #10);

    if bBreak_Proc = true then
      exit;

    utiles.Delay(5);
  end;

  cString2 := '810';
  if (bHKALog = true) then
    utiles.LogToFile(cString2, ExtractFilePath(application.ExeName) + '\AHK.LOG');
  SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cString2));

  result := true;
  freeandnil(oBouche);
end;

function Procesa_Salida_Dinero(pValor: extended): Boolean;
var
  cValor: string;
  iChoiceFIS: Integer;
  cComando: string;
begin
  if (pValor = 0) then
  begin
    result := true;
    exit;
  end;

  cValor := IntToStr(trunc(pValor * 100));
  cValor := utiles.padl(cValor, 12, '0');

  cComando := '9001' + cValor;
  if (bHKALog = true) then
    utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
  SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cComando));

  cComando := 't';
  if (bHKALog = true) then
    utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
  SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cComando));

  result := not bBreak_Proc;
end;

function Procesa_Entrada_Dinero(pValor: extended): Boolean;
var
  cValor: string;
  cFormaPago: string;
  iChoiceFIS: Integer;
  cComando: string;
begin
  if (pValor = 0) then
  begin
    result := true;
    exit;
  end;

  cValor := IntToStr(trunc(pValor * 100));
  cValor := utiles.padl(cValor, 12, '0');

  cComando := '9101' + cValor;
  if (bHKALog = true) then
    utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
  SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cComando));

  cComando := 't';
  if (bHKALog = true) then
    utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
  SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cComando));
  result := not bBreak_Proc;
end;

function Procesa_Fondo_Caja(pValor: extended): Boolean;
var
  cValor: string;
  cIndice: string;
  cFormaPago: string;
  iChoiceFIS: Integer;
  cComando: string;
begin
  if (pValor = 0) then
  begin
    result := true;
    exit;
  end;

  cValor := IntToStr(trunc(pValor * 100));
  cValor := utiles.padl(cValor, 11, '0');

  cComando := '9101' + cValor;
  if (bHKALog = true) then
    utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
  SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cComando));

  cComando := 't';
  if (bHKALog = true) then
    utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
  SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cComando));
  result := not bBreak_Proc;
end;

function Procesa_Pagos_AHK(pValor: extended; iFormaPago: Integer; iTipoOp: Integer = 1): Boolean;
var
  cMonto, cFormaPago, cComando: string;
  fMonto: extended;
  bResp: Boolean;
begin
  fMonto := pValor;
  cMonto := trim(FormatFloat('###########0', (fMonto * 100)));
  cMonto := utiles.padl(cMonto, 12, '0');
  case iFormaPago of
    1:
      cFormaPago := '01';
    2:
      cFormaPago := '02';
    3:
      cFormaPago := '03';
    4:
      cFormaPago := '04';
    5:
      cFormaPago := '05';
    6:
      cFormaPago := '06';
    7:
      cFormaPago := '07';
    8:
      cFormaPago := '08';
    9:
      cFormaPago := '09';
    10:
      cFormaPago := '10';
  end;

  cComando := '';
  if (iTipoOp = 1) then
    cComando := '91' + cFormaPago + cMonto
  else
    cComando := '90' + cFormaPago + cMonto;

  if (bHKALog = true) then
    utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
  SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cComando));

  cComando := 't';
  if (bHKALog = true) then
    utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
  SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cComando));
  sleep(1000);
end;

function Procesa_CierreX(bForceX: Boolean = false): Boolean;
var
  bResp: Boolean;
  cComando: string;
  cString: string;
  iPrint_X: Integer;
begin

  if (bForceX = false) then
    iPrint_X := utiles.Read_IniFacilValue('Fiscal_Opt', 'XReport', 'I', 1)
  else
    iPrint_X := 1;

  if (iPrint_X <> 0) then
  begin
    if (iPrint_X = 2) then
      cComando := 'I1X' { Reporte de Cajeros }
    else
      cComando := 'I0X' { Reporte de X };

    if (bHKALog = true) then
      utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
    bResp := SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cComando));
    Espera_Proceso_IMPF;

    if (bBreak_Proc = true) then
      result := false
    else
      result := true;
  end
  else
    result := true;
end;

function Procesa_CierreZ: Boolean;
var
  bResp: Boolean;
  cComando: string;
begin
  cComando := 'I0Z';
  if (bHKALog = true) then
    utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
  SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cComando));
  Espera_Proceso_IMPF;

  if (bBreak_Proc = true) then
    result := false
  else
    result := true;
end;

function Reimprime_CierreZ(cInicioZ: string = ''; cFinZ: string = ''): Boolean;
var
  cComando: string;
  oFile: TStringList;
  cPathFile: string;
  cUltimaZ: string;
begin
  if ((trim(cInicioZ) = '') and (trim(cFinZ) = '')) then
  begin
    Recupera_Numero_UltimaZ_AHK(cUltimaZ);
    cInicioZ := cUltimaZ;
    cFinZ := cUltimaZ;
  end;
  cComando := 'U4Z' + cInicioZ + cFinZ;
  if (bHKALog = true) then
    utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
  SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cComando));
  Espera_Proceso_IMPF;

  if bBreak_Proc = true then
    result := false
  else
    result := true;
end;

procedure AHK_Set_Data;
var
  i: Integer;
  cComando: string;
  cNum_Medio, cDes_Medio, cImp: string;
  fImp: extended;
  cSql_Ln: string;
begin
  { i := 0;
    cNum_Medio := '';
    cDes_Medio := '';

    oQry := Tzquery.Create(nil);
    oQry.Connection := utiles.oPublicCnn;
    cSql_Ln := 'SELECT * FROM tipo_pago ORDER BY tipo_p_id';
    utiles.query_selectg(oQry, cSql_Ln);
    if not((oQry.isEmpty = true) or (oQry.Eof = true)) then
    begin
    while not oQry.Eof do
    begin
    cNum_Medio := utiles.padl(trim(oQry.FieldByName('tipo_p_id').AsString), 2, '0');
    cDes_Medio := LeftStr(trim(oQry.FieldByName('tipo_p_nombre').AsString), 13);
    cComando := 'PE' + cNum_Medio + cDes_Medio;
    if (bHKALog = true) then
    utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
    SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);
    oQry.Next;
    end;
    end;

    oQry.Close;
    cSql_Ln := '';
    cSql_Ln := cSql_Ln + 'SELECT ';
    cSql_Ln := cSql_Ln + '  emp_imp,emp_imp2,emp_imp3 ';
    cSql_Ln := cSql_Ln + 'FROM empresas ';
    cSql_Ln := cSql_Ln + 'WHERE (suc_id="' + trim(utiles.cId_empresa) + '")';
    cSql_Ln := cSql_Ln + 'ORDER BY emp_id LIMIT 1';
    utiles.query_selectg(oQry, cSql_Ln);

    if not((oQry.isEmpty = true) or (oQry.Eof = true)) then
    begin
    fImp := oQry.FieldByName('emp_imp').AsFloat;
    cImp := IntToStr(trunc(fImp * 100));
    cComando := 'PT0' + cImp;
    if (bHKALog = true) then
    utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
    SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);

    fImp := oQry.FieldByName('emp_imp2').AsFloat;
    cImp := IntToStr(trunc(fImp * 100));
    cComando := 'PT0' + cImp;
    if (bHKALog = true) then
    utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
    SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);

    fImp := oQry.FieldByName('emp_imp3').AsFloat;
    cImp := IntToStr(trunc(fImp * 100));
    cComando := 'PT0' + cImp;
    if (bHKALog = true) then
    utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
    SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);
    end;
  }
end;

function Recupera_Numero_UltimaZ_AHK(var cUltimaZ: string): Boolean;
var
  cComando: string;
  cMessage: string;
  cStringResult: string;
begin
  try
    SetLength(cStringResult, 250);
    Anula_Cupon;

    cComando := 'U0Z';
    if (bHKALog = true) then
      utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');

    UploadReportDin(@HKA_FP_Status, @HKA_FP_Error, cComando, cStringResult);
    Espera_Proceso_IMPF;
    if trim(cStringResult) <> '' then
    begin
      cUltimaZ := copy(cStringResult, 1, 4);
      result := true;
    end
    else
    begin
      cMessage := 'Hubo un error al tratar de recuperar información de la última Z en la IMPRESORA FISCAL AHK.';
      MessageDlg(cMessage, mtWarning, [mbOk], 0);
      cUltimaZ := '0';
      result := false;
    end;
  except
    result := false;
  end;
end;

function Recupera_Fecha_UltimaZ_AHK(var FechaHora: TdateTime): Boolean;
var
  cComando: string;
  cFecha, cHora: string;
  dFecha: TdateTime;
  oDay, oMonth, oYear, oHour, oMinute: Word;
  cDay, cMonth, cYear, cHour, cMinute: string;
  cStringResult: string;
begin
  try
    SetLength(cStringResult, 250);

    Anula_Cupon;

    cComando := 'U0Z';
    if (bHKALog = true) then
      utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
    UploadReportDin(@HKA_FP_Status, @HKA_FP_Error, cComando, cStringResult);
    Espera_Proceso_IMPF;
    if trim(cStringResult) <> '' then
    begin
      cFecha := copy(cStringResult, 5, 6);
      cHora := copy(cStringResult, 11, 4);

      cDay := copy(cFecha, 5, 2);
      cMonth := copy(cFecha, 3, 2);
      cYear := copy(cFecha, 1, 2);
      cHour := copy(cHora, 1, 2);
      cMinute := copy(cHora, 3, 2);

      oYear := 2000 + StrToInt(cYear);
      oMonth := StrToInt(cMonth);
      oDay := StrToInt(cDay);
      oHour := StrToInt(cHour);
      oMinute := StrToInt(cMinute);

      FechaHora := EncodeDate(oYear, oMonth, oDay) + EncodeTime(oHour, oMinute, 0, 0);
      // cFecha:= FormatDatetime('yyyy-mm-dd H:mm:ss am/pm',dResult);

      result := true;
    end
    else
      result := false;
  except
    result := false;
  end;
end;

function Verifica_Z: Boolean;
var
  iChoiceFIS: Integer;
  cComando: string;
  dUltimaZ1d, dUltimaZ2d: TdateTime;
  cUltimaZ1d, cUltimaZ2d: string;

  dUltimaZ1dh, dUltimaZ2dh: TdateTime;
  cUltimaZ1dh, cUltimaZ2dh: string;

  cData, cHora: string;
  oDay, oMonth, oYear, oHour, oMinute, oSecond, oMilli: Word;
  bFirstTime: Boolean;
  v: string;
begin
  v := FormatSettings.shortdateformat;

  bFirstTime := false;

  begin
    if Recupera_Fecha_UltimaZ_AHK(dUltimaZ1dh) = true then
    begin
      DecodeDateTime(dUltimaZ1dh, oYear, oMonth, oDay, oHour, oMinute, oSecond, oMilli);

      dUltimaZ1d := EncodeDateTime(oYear, oMonth, oDay, 0, 0, 0, 0);

      cUltimaZ1dh := FormatDatetime('dd/mm/yyyy H:mm:ss am/pm', dUltimaZ1dh);
      cUltimaZ1d := FormatDatetime('dd/mm/yyyy', dUltimaZ1d);

      dUltimaZ2d := utiles.DateTimeAdd(dUltimaZ1d, dtpDay, 1);
      dUltimaZ2dh := utiles.DateTimeAdd(dUltimaZ1dh, dtpDay, 1);

      cUltimaZ2d := FormatDatetime('dd/mm/yyyy', dUltimaZ2d);
      cUltimaZ2dh := FormatDatetime('dd/mm/yyyy H:mm:ss am/pm', dUltimaZ2dh);

      if (now() < dUltimaZ2d) then
      begin
        cComando := 'No es posible hacer un reporte Z en este momento.' + #13 + 'El último reporte fue: [' + cUltimaZ1dh + '].' + #10 +
          'El siguiente reporte Z deverá realizarse mas o menos a las [' + cUltimaZ2d + ']';

        MessageDlg(cComando, mtWarning, [mbOk], 0);
        result := false;
        exit;
      end
      else
      begin
        result := true;
        exit;
      end;
    end
    else
    begin
      cComando := 'Hubo un error al tratar de recuperar informaci�n de la �ltima Z en la IMPRESORA FISCAL AHK.';
      MessageDlg(cComando, mtWarning, [mbOk], 0);
      result := false;
      exit;
    end;
  end;

  FormatSettings.shortdateformat := v;
end;

function IMPF_Print_Lines_NoFiscal(cStringValue: string; bCenterText: Boolean = false; bEndFound: Boolean = false): Boolean;
var
  cString2: string;
  iChoiceFIS: Integer;
  cComando: string;
begin
  if bCenterText = true then
    cString2 := '80>' + utiles.CenterString(cStringValue, 45) + #10
  else
    cString2 := '80>' + copy(cStringValue, 1, 45) + #10;
  if (bHKALog = true) then
    utiles.LogToFile(cString2, ExtractFilePath(application.ExeName) + '\AHK.LOG');
  SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cString2) + #10);
  // Delay(50);

  if bEndFound = true then
  begin
    cString2 := '810';
    if (bHKALog = true) then
      utiles.LogToFile(cString2, ExtractFilePath(application.ExeName) + '\AHK.LOG');
    SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cString2));
  end;
end;

procedure LinesToAHK(sValue: string; var oList: TStringList);
var
  nInicio, nFin: Integer;
  bEof: Boolean;
  cString: string;
  nLen: Integer;
begin
  bEof := false;
  nInicio := 0;
  nFin := 40;
  oList.Clear;
  sValue := UpperCase(trim(sValue));
  nLen := length(sValue);
  while not bEof do
  begin

    cString := copy(sValue, nInicio, nFin);
    oList.Add(cString);
    nInicio := nInicio + (nFin + 1);
    if (nInicio > nLen) then
      bEof := true;
  end;

end;

procedure Espera_Proceso_IMPF; overload;
var
  bExit, bResult: Boolean;
  nChoice: Integer;
begin
  bExit := false;
  nChoice := 0;
  bResult := false;

  while bExit = false do
  begin
    bResult := ReadFpStatus(@HKA_FP_Status, @HKA_FP_Error);
    nChoice := Integer(HKA_FP_Status);
    application.ProcessMessages;
    { 4= En Modo Fiscal y en Espera }
    if (nChoice = 4) then
      bExit := true;
  end;
end;

procedure Espera_Proceso_IMPF(var poText: TLabel); overload;
var
  bExit, bResult: Boolean;
  nChoice: Integer;
begin
  bExit := false;
  nChoice := 0;
  bResult := false;

  while bExit = false do
  begin
    bResult := ReadFpStatus(@HKA_FP_Status, @HKA_FP_Error);
    nChoice := Integer(HKA_FP_Status);
    application.ProcessMessages;
    poText.caption := 'En espera que el impresor este disponible:..';
    poText.Repaint;
    { 4= En Modo Fiscal y en Espera }
    if (nChoice = 4) then
    begin
      poText.caption := '';
      poText.Repaint;

      bExit := true;
    end;
  end;
end;

procedure Acciona_Gaveta_AHK;
var
  cComando: string;
  iMatriz: Integer;
begin
  if (utiles.isEmpty(cSerieIMF) = false) then
  begin
    cSerieIMF := utiles.Read_IniFacilValue('Fiscal_Opt', 'ModeloIMP', 'S', '');
  end;
  iMatriz := utiles.Read_IniFacilValue('Fiscal_Opt', 'MATRICIAL', 'I', 0);
  if (iMatriz = 1) then
    exit;
  cComando := '9001000000000000'; { Permite la Apertura de la Gaveta de Dinero }
  if (bHKALog = true) then
    utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
  SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);

  cComando := 't';
  if (bHKALog = true) then
    utiles.LogToFile(cComando, ExtractFilePath(application.ExeName) + '\AHK.LOG');
  SendCmd(@HKA_FP_Status, @HKA_FP_Error, cComando);
end;

initialization

cOFG_id_Empresa := '0';
cOFG_id_Sucursal := '0';
utiles.set_decimal_separator('.');
cNum_Refere := '';
cNum_Pedido := '';
bv01 := '';
bv02 := '';

end.
