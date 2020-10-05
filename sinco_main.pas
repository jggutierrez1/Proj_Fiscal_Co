unit sinco_main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.JSON,
  System.Classes, Vcl.Graphics, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.AppEvnts, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, ShellApi,
  Vcl.Buttons,
  AHK_FISCAL_LIB,
  REST.Types, REST.Client, REST.Authenticator.Simple, REST.Authenticator.OAuth,
  SuperObject, MemTableDataEh, MemTableEh, Vcl.Menus,
  Vcl.Imaging.pngimage, PngBitBtn,
  dxGDIPlusClasses, Vcl.onguard, Vcl.ogutil, inifiles, wininet, Data.DB,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxImage, DBCtrlsEh, Vcl.Mask,
  Data.Bind.Components, Data.Bind.ObjectScope, SynEditHighlighter,
  SynHighlighterJSON, SynEdit, SynMemo, ComObj;

type
  TfSinco_Main = class(TForm)
    StatusBar1: TStatusBar;
    TrayIcon1: TTrayIcon;
    ApplicationEvents1: TApplicationEvents;
    PageControl1: TPageControl;
    oTab_Main: TTabSheet;
    oPrinter_Img: TImage;
    olStatus_Print: TLabel;
    olStatus_Error: TLabel;
    oTab_Sett_01: TTabSheet;
    oMComment3: TMemo;
    Panel1: TPanel;
    Label35: TLabel;
    Label37: TLabel;
    Label36: TLabel;
    olStatus_Conn: TLabel;
    oMem_TelCte: TMemo;
    oMem_NomArt: TMemo;
    oMem_DirCte: TMemo;
    oMem_RucCte: TMemo;
    oMem_NomCte: TMemo;
    oLst_COM_Fiscal: TDBComboBoxEh;
    Panel2: TPanel;
    Label2: TLabel;
    oTimeVerif: TDBNumberEditEh;
    Label3: TLabel;
    oTimeCheck: TTimer;
    oTab_Sett_02: TTabSheet;
    PageControl2: TPageControl;
    TabSheet7: TTabSheet;
    Label6: TLabel;
    oHttp_Server: TEdit;
    RESTClient2: TRESTClient;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    oMem_Fac: TMemTableEh;
    oMem_Det: TMemTableEh;
    oMem_Facop_fecha: TDateTimeField;
    oMem_Facop_cod_cliente: TWideStringField;
    oMem_Facop_nom_cliente: TWideStringField;
    oMem_Facop_nip_cliente: TWideStringField;
    oMem_Facop_dir_cliente: TWideStringField;
    oMem_Facop_tel_cliente: TWideStringField;
    oMem_Facop_tipo: TIntegerField;
    oMem_Facop_subtotal: TFloatField;
    oMem_Facop_itbms: TFloatField;
    oMem_Facop_total: TFloatField;
    oMem_Facemp_imp1: TFloatField;
    oMem_Facemp_imp2: TFloatField;
    oMem_Facemp_imp3: TFloatField;
    oMem_Facemp_imp4: TFloatField;
    oMem_Facu_id: TIntegerField;
    oMem_Facu_de: TWideStringField;
    oMem_Facop_manejo: TFloatField;
    oMem_Facop_observ: TWideMemoField;
    oMem_Facop_desc: TFloatField;
    oMem_Facop_contado: TFloatField;
    oMem_Facop_credito: TFloatField;
    oMem_Facop_pagado: TFloatField;
    oMem_Facop_vuelto: TFloatField;
    oMem_Facop_forma_1: TFloatField;
    oMem_Facop_forma_2: TFloatField;
    oMem_Facop_forma_3: TFloatField;
    oMem_Facop_forma_4: TFloatField;
    oMem_Facop_forma_5: TFloatField;
    oMem_Facop_forma_6: TFloatField;
    oMem_Facop_forma_7: TFloatField;
    oMem_Facop_forma_8: TFloatField;
    oMem_Facop_forma_9: TFloatField;
    oMem_Facop_forma_10: TFloatField;
    oMem_Facop_forma_11: TFloatField;
    oMem_Facop_forma_12: TFloatField;
    oMem_Facop_forma_13: TFloatField;
    oMem_Facop_forma_14: TFloatField;
    oMem_Facop_forma_15: TFloatField;
    oMem_Facop_forma_16: TFloatField;
    oMem_Facop_forma_17: TFloatField;
    oMem_Facop_forma_18: TFloatField;
    oMem_Facop_forma_19: TFloatField;
    oMem_Facop_forma_20: TFloatField;
    oMem_Facop_totitems: TIntegerField;
    oMem_Facop_v_id: TIntegerField;
    oMem_Facop_v_de: TWideStringField;
    oMem_Facop_num_nco: TWideStringField;
    oMem_Facop_num_ncf: TWideStringField;
    oMem_Facop_numserie_if: TWideStringField;
    oMem_DetProd_id: TIntegerField;
    oMem_DetProd_Op_Id: TIntegerField;
    oMem_DetProd_Codigo: TWideStringField;
    oMem_DetProd_Descrip: TWideStringField;
    oMem_DetProd_Detalle: TWideStringField;
    oMem_DetProd_Cant: TFloatField;
    oMem_DetProd_Precio: TFloatField;
    oMem_DetProd_total: TFloatField;
    oMem_DetProd_Itbms: TFloatField;
    oMem_DetProd_Desc1: TFloatField;
    oMem_DetProd_Desc2: TFloatField;
    oMem_DetProd_Garant_Dias: TIntegerField;
    oMem_DetProd_Garant_Text: TWideStringField;
    oMem_Facop_recordtype: TWideStringField;
    oMem_Facop_status: TStringField;
    olStatus_Doc: TLabel;
    oCk_Matricial: TCheckBox;
    RESTClient3: TRESTClient;
    RESTRequest3: TRESTRequest;
    RESTResponse3: TRESTResponse;
    otVerifEsp_Stat_Int: TDBNumberEditEh;
    Label9: TLabel;
    Label10: TLabel;
    otVerifEsp_Erro_Int: TDBNumberEditEh;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    otVerifEsp_Stat_try: TDBNumberEditEh;
    otVerifEsp_Erro_try: TDBNumberEditEh;
    Label19: TLabel;
    otVerifFin_Stat_Int: TDBNumberEditEh;
    Label20: TLabel;
    Label21: TLabel;
    otVerifFin_Stat_try: TDBNumberEditEh;
    oTrayIconMenu: TPopupMenu;
    MostrarMFF1: TMenuItem;
    N1: TMenuItem;
    SalirdeMFF1: TMenuItem;
    oMem_Facop_num_corre: TStringField;
    oMem_Facop_num_rel: TStringField;
    oMem_Facop_id: TIntegerField;
    olWaitStop: TLabel;
    oImg_Semaf: TImage;
    oCk_Test_Mode: TCheckBox;
    Label1: TLabel;
    oHttp_Empr: TEdit;
    Label4: TLabel;
    oHttp_Sucu: TEdit;
    oMem_Facop_subtotalnet: TFloatField;
    oMem_Facop_suc_id: TIntegerField;
    oMem_Facop_test: TIntegerField;
    oMem_Facop_emp_id: TIntegerField;
    oCk_Test_Json: TCheckBox;
    oTab_Print: TTabSheet;
    Label5: TLabel;
    Label28: TLabel;
    oLst_Reimpr_Tipo: TDBComboBoxEh;
    PageControl3: TPageControl;
    oTab_Rang_Fech: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    Shape4: TShape;
    Shape3: TShape;
    orFec_Fin: TDBDateTimeEditEh;
    orFec_Ini: TDBDateTimeEditEh;
    orBtn_Doit_RFec: TPngBitBtn;
    oTab_Rang_Corr: TTabSheet;
    Label27: TLabel;
    Label29: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    orBtn_Doit_RDoc: TPngBitBtn;
    orSec_Ini: TDBNumberEditEh;
    orSec_Fin: TDBNumberEditEh;
    oBtn_quit: TPngBitBtn;
    oBtn_Minimize: TPngBitBtn;
    oBtn_CierreX: TPngBitBtn;
    oBtn_CierreZ: TPngBitBtn;
    oBtn_Detener: TPngBitBtn;
    oWait_Image: TImage;
    Label30: TLabel;
    oMenu: TMainMenu;
    SoporteTcnico1: TMenuItem;
    oParam_Serv: TMenuItem;
    oBtn_Sol_Data: TPngBitBtn;
    oBtn_Env_Data: TPngBitBtn;
    Label31: TLabel;
    Label32: TLabel;
    oObservacion: TMemo;
    oBtn_Save2: TPngBitBtn;
    oBtn_Save: TPngBitBtn;
    oBtn_Probar_Cnn: TPngBitBtn;
    oBtn_Status: TPngBitBtn;
    Label33: TLabel;
    Label34: TLabel;
    oCk_sw_manual: TDBCheckBoxEh;
    Label39: TLabel;
    oIntentos_no_recibe: TDBNumberEditEh;
    Label40: TLabel;
    N2: TMenuItem;
    oParam_Impr: TMenuItem;
    OgDaysCode1: TOgDaysCode;
    Label41: TLabel;
    Label43: TLabel;
    Label42: TLabel;
    cxImage1: TcxImage;
    oHttp_Result2: TSynMemo;
    SynJSONSyn1: TSynJSONSyn;
    Label38: TLabel;
    Label16: TLabel;
    oHttp_API_Put: TEdit;
    Label17: TLabel;
    oHttp_API_Get: TEdit;
    Label18: TLabel;
    Label22: TLabel;
    Label26: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label44: TLabel;
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure oBtn_Probar_CnnClick(Sender: TObject);
    procedure oBtn_StatusClick(Sender: TObject);
    procedure oBtn_SaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function print_doc_fiscal(pNum_Op: string): boolean;
    procedure oBtn_Sol_DataClick(Sender: TObject);
    function EnDeCrypt(const Value: String): String;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    function BestFit(const AInput: AnsiString): AnsiString;
    function CargaDataFact(opJsonFull: ISuperObject; var opTmpDb: TMemTableEh): integer;
    function CargaDataDet(opJsonFull: ISuperObject; var opTmpDb: TMemTableEh; cOp_id: string): integer;
    function Verifica_Status_Espe: boolean;
    function Verifica_Error_Imp: boolean;
    function Verifica_Status_Proc: boolean;
    procedure oBtn_Env_DataClick(Sender: TObject);
    procedure oTimeCheckTimer(Sender: TObject);
    procedure SalirdeMFF1Click(Sender: TObject);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure MostrarMFF1Click(Sender: TObject);
    procedure oBtn_quitClick(Sender: TObject);
    procedure verifica_stop();
    procedure Clear_Objects();
    procedure oCk_Test_ModeClick(Sender: TObject);
    procedure RESTRequest2HTTPProtocolError(Sender: TCustomRESTRequest);
    procedure RESTRequest3HTTPProtocolError(Sender: TCustomRESTRequest);
    procedure Mostrar_App();
    function Quita_caracteres(pStrVal: string): string;
    procedure oBtn_MinimizeClick(Sender: TObject);
    procedure oBtn_CierreXClick(Sender: TObject);
    procedure oBtn_CierreZClick(Sender: TObject);
    procedure Cargar_Fact;
    procedure orBtn_Doit_RDocClick(Sender: TObject);
    procedure orBtn_Doit_RFecClick(Sender: TObject);
    function Try_Open_Port(): boolean;
    procedure Cambiar_Semaforo(cFlag: string);
    procedure Reimprime_Por_Fecha;
    procedure Reimprime_Por_Rango;
    procedure Cambiar_Indic_Espera(cFlag: string);
    procedure orSec_IniExit(Sender: TObject);
    procedure orSec_FinExit(Sender: TObject);
    procedure orFec_IniExit(Sender: TObject);
    procedure orFec_FinExit(Sender: TObject);
    procedure oParam_ServClick(Sender: TObject);
    procedure DialogBoxAutoClose(const ACaption, APrompt: string; DuracaoEmSegundos: integer);
    procedure oParam_ImprClick(Sender: TObject);
    procedure OgDaysCode1Checked(Sender: TObject; Status: TCodeStatus);
    procedure OgDaysCode1GetKey(Sender: TObject; var Key: TKey);
    procedure OgDaysCode1GetCode(Sender: TObject; var Code: TCode);
    procedure OgDaysCode1ChangeCode(Sender: TObject; Code: TCode);
    procedure Activa_Botones(iOption: integer = 0);
    procedure Desactiva_Botones(iOption: integer = 0);
    procedure oBtn_DetenerClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RESTClient2HTTPProtocolError(Sender: TCustomRESTClient);
    procedure RESTClient3HTTPProtocolError(Sender: TCustomRESTClient);
    Function CheckUrl(pUrl: string; bShowError: boolean): integer;
    procedure ParseURL(const url: AnsiString; var Scheme, user, pass, host, port, path, extra: AnsiString);
    function Build_url_put(): string;
    function Build_url_get(): string;
  private
    { Private declarations }
    cSerial_Working: string;
    cJsonUpdate: Widestring;
    bSendOk: integer;
    bStop_Flg: boolean;
    bTm_work: boolean;
    bTest_Mode: boolean;
    bIgnore_Fis: boolean;
    iShoiceAct: integer;
    cRes_Path: string;
    iBusq_Ndata: integer;
    bNo_Imprime: boolean;
    cApp, cFPath, cPath, cExeF: string;
    bRESTRequest2_Err: boolean;
    bRESTRequest3_Err: boolean;
    cHttp_Error: Widestring;
  public
    { Public declarations }
  end;

var
  fSinco_Main: TfSinco_Main;

implementation

uses CommPortList, utiles, uLkJSON;
{$R *.dfm}

procedure TfSinco_Main.ApplicationEvents1Minimize(Sender: TObject);
begin
  { Hide the window and set its state variable to wsMinimized. }
  Hide();
  WindowState := wsMinimized;

  { Show the animated tray icon and also a hint balloon. }
  TrayIcon1.Visible := True;
  // TrayIcon1.Animate := True;
  // TrayIcon1.ShowBalloonHint;
end;

FUNCTION TfSinco_Main.CargaDataFact(opJsonFull: ISuperObject; var opTmpDb: TMemTableEh): integer;
VAR
  cField: string;
  cValue, cStrVal: string;
  vValue: variant;
  oPrn_lists: ISuperObject;
  oFact_cabs: ISuperObject;
  oItemsIter: TSuperObjectIter;
  oFieldType: TFieldType;
  fs: TFormatSettings;
begin
  fs := TFormatSettings.Create;
  fs.DateSeparator := '-';
  fs.ShortDateFormat := 'yyyy-MM-dd';
  fs.TimeSeparator := ':';
  fs.ShortTimeFormat := 'hh:mm';
  fs.LongTimeFormat := 'hh:mm:ss';
  opTmpDb.EmptyTable;

  try
    for oPrn_lists in opJsonFull.O['print_list'] do
    begin
      oFact_cabs := oPrn_lists.O['fact_cab'];
      cValue := oFact_cabs.AsString;

      opTmpDb.Close;
      opTmpDb.Open;
      opTmpDb.Append;
      if ObjectFindFirst(oFact_cabs, oItemsIter) then
        repeat
          cField := oItemsIter.Key;
          cValue := oItemsIter.val.AsString;

          cField := oItemsIter.Key;

          cValue := Quita_caracteres(cValue);

          oFieldType := opTmpDb.FieldByName(cField).DataType;
          case oFieldType of
            Data.DB.ftUnknown:
              opTmpDb.FieldByName(cField).Value := null;
            Data.DB.ftString:
              begin
                vValue := oItemsIter.val.AsString;
                vValue := Quita_caracteres(vValue);
                opTmpDb.FieldByName(cField).AsString := vValue;
              end;
            Data.DB.ftInteger:
              begin
                vValue := oItemsIter.val.AsInteger;
                opTmpDb.FieldByName(cField).AsInteger := oItemsIter.val.AsInteger;
              end;
            Data.DB.ftSmallint:
              begin
                vValue := oItemsIter.val.AsInteger;
                opTmpDb.FieldByName(cField).AsInteger := oItemsIter.val.AsInteger;
              end;
            Data.DB.ftWord:
              begin
                opTmpDb.FieldByName(cField).Value := null;
              end;
            Data.DB.ftBoolean:
              begin
                vValue := oItemsIter.val.AsBoolean;
                opTmpDb.FieldByName(cField).AsBoolean := vValue;
              end;
            Data.DB.ftFloat:
              begin
                vValue := oItemsIter.val.AsDouble;
                opTmpDb.FieldByName(cField).AsFloat := oItemsIter.val.AsDouble;
              end;
            Data.DB.ftCurrency:
              begin
                vValue := oItemsIter.val.AsDouble;
                opTmpDb.FieldByName(cField).AsFloat := oItemsIter.val.AsDouble;
              end;
            Data.DB.ftBCD:
              begin
                opTmpDb.FieldByName(cField).Value := null;
              end;
            Data.DB.ftDate:
              begin
                vValue := oItemsIter.val.AsString + ' 01:00:00';
                opTmpDb.FieldByName(cField).AsDateTime := StrToDateTime(vValue, fs);
              end;
            Data.DB.ftDateTime:
              begin
                vValue := oItemsIter.val.AsString + ' 01:00:00';
                opTmpDb.FieldByName(cField).AsDateTime := StrToDateTime(vValue, fs);
              end;
            Data.DB.ftTime:
              begin
                vValue := oItemsIter.val.AsString;
                opTmpDb.FieldByName(cField).AsString := vValue;
              end;
            Data.DB.ftBytes:
              begin
                opTmpDb.FieldByName(cField).Value := null;
              end;
            Data.DB.ftVarBytes:
              begin
                opTmpDb.FieldByName(cField).Value := null;
              end;
            Data.DB.ftAutoInc:
              begin
                vValue := oItemsIter.val.AsInteger;
                opTmpDb.FieldByName(cField).AsInteger := oItemsIter.val.AsInteger;
              end;
            Data.DB.ftBlob:
              begin
                opTmpDb.FieldByName(cField).Value := null;
              end;
            Data.DB.ftMemo:
              begin
                vValue := oItemsIter.val.AsString;
                vValue := Quita_caracteres(vValue);
                opTmpDb.FieldByName(cField).AsWideString := vValue;
              end;
            Data.DB.ftWideString:
              begin
                vValue := oItemsIter.val.AsString;
                vValue := Quita_caracteres(vValue);
                opTmpDb.FieldByName(cField).AsWideString := vValue;
              end;
            Data.DB.ftWideMemo:
              begin
                vValue := oItemsIter.val.AsString;
                vValue := Quita_caracteres(vValue);
                opTmpDb.FieldByName(cField).AsWideString := vValue;
              end;
            Data.DB.ftGraphic:
              begin
                opTmpDb.FieldByName(cField).Value := null;
              end;
            Data.DB.ftFmtMemo:
              begin
                opTmpDb.FieldByName(cField).Value := null;
              end;
            Data.DB.ftParadoxOle:
              begin
                opTmpDb.FieldByName(cField).Value := null;
              end;
            Data.DB.ftDBaseOle:
              begin
                opTmpDb.FieldByName(cField).Value := null;
              end;
            Data.DB.ftTypedBinary:
              begin
                opTmpDb.FieldByName(cField).Value := null;
              end;
            else
              opTmpDb.FieldByName(cField).Value := null;
          end;

          if cField <> 'op_fecha' then
          begin;

          end;
        until not ObjectFindNext(oItemsIter);
      opTmpDb.Post;
      // ObjectFindClose(oItemsIter);
    end;
  except
    begin
      if (opTmpDb.State in [dSinsert, dsEdit]) then
      begin
        opTmpDb.cancel;
      end;
      ObjectFindClose(oItemsIter);
      oPrn_lists := nil;
      oFact_cabs := nil;
      utiles.LogToFile('Error en la estructura del documento (cabecera) [' + cValue + ']', ExtractFilePath(application.ExeName) + '\JSON_GET.LOG');
      result := -1;
      EXIT;
    end;
  end;
  ObjectFindClose(oItemsIter);
  oPrn_lists := nil;
  oFact_cabs := nil;
  opTmpDb.First();
  result := opTmpDb.RecordCount;
end;

FUNCTION TfSinco_Main.CargaDataDet(opJsonFull: ISuperObject; var opTmpDb: TMemTableEh; cOp_id: string): integer;
VAR
  cField: string;
  cValue: string;
  vValue: variant;
  // oItem: ISuperObject;
  oPrn_lists, oFact_dets: ISuperObject;
  oItemsIter: TSuperObjectIter;
  oFieldType: TFieldType;
  fs: TFormatSettings;
begin
  fs := TFormatSettings.Create;
  fs.DateSeparator := '-';
  fs.ShortDateFormat := 'yyyy-MM-dd';
  fs.TimeSeparator := ':';
  fs.ShortTimeFormat := 'hh:mm';
  fs.LongTimeFormat := 'hh:mm:ss';
  opTmpDb.EmptyTable;

  try
    for oPrn_lists in opJsonFull.O['print_list'] do
    begin
      for oFact_dets in oPrn_lists.O['fact_det'] do
      begin
        cValue := oFact_dets.AsString;

        opTmpDb.Close;
        opTmpDb.Open;
        opTmpDb.Append;
        if ObjectFindFirst(oFact_dets, oItemsIter) then
          repeat
            cField := oItemsIter.Key;

            cValue := oItemsIter.val.AsString;
            cValue := self.Quita_caracteres(cValue);

            oFieldType := opTmpDb.FieldByName(cField).DataType;
            case oFieldType of
              Data.DB.ftUnknown:
                opTmpDb.FieldByName(cField).Value := null;
              Data.DB.ftString:
                begin
                  vValue := oItemsIter.val.AsString;
                  vValue := self.Quita_caracteres(vValue);
                  opTmpDb.FieldByName(cField).AsString := vValue;
                end;
              Data.DB.ftInteger:
                begin
                  vValue := oItemsIter.val.AsInteger;
                  opTmpDb.FieldByName(cField).AsInteger := oItemsIter.val.AsInteger;
                end;
              Data.DB.ftSmallint:
                begin
                  vValue := oItemsIter.val.AsInteger;
                  opTmpDb.FieldByName(cField).AsInteger := oItemsIter.val.AsInteger;
                end;
              Data.DB.ftWord:
                begin
                  opTmpDb.FieldByName(cField).Value := null;
                end;
              Data.DB.ftBoolean:
                begin
                  vValue := oItemsIter.val.AsBoolean;
                  opTmpDb.FieldByName(cField).AsBoolean := vValue;
                end;
              Data.DB.ftFloat:
                begin
                  vValue := oItemsIter.val.AsDouble;
                  opTmpDb.FieldByName(cField).AsFloat := oItemsIter.val.AsDouble;
                end;
              Data.DB.ftCurrency:
                begin
                  vValue := oItemsIter.val.AsDouble;
                  opTmpDb.FieldByName(cField).AsFloat := oItemsIter.val.AsDouble;
                end;
              Data.DB.ftBCD:
                begin
                  opTmpDb.FieldByName(cField).Value := null;
                end;
              Data.DB.ftDate:
                begin
                  vValue := oItemsIter.val.AsString + ' 01:00:00';
                  opTmpDb.FieldByName(cField).AsDateTime := StrToDateTime(vValue, fs);
                end;
              Data.DB.ftDateTime:
                begin
                  vValue := oItemsIter.val.AsString + ' 01:00:00';
                  opTmpDb.FieldByName(cField).AsDateTime := StrToDateTime(vValue, fs);
                end;
              Data.DB.ftTime:
                begin
                  vValue := oItemsIter.val.AsString;
                  opTmpDb.FieldByName(cField).AsString := vValue;
                end;
              Data.DB.ftBytes:
                begin
                  opTmpDb.FieldByName(cField).Value := null;
                end;
              Data.DB.ftVarBytes:
                begin
                  opTmpDb.FieldByName(cField).Value := null;
                end;
              Data.DB.ftAutoInc:
                begin
                  vValue := oItemsIter.val.AsInteger;
                  opTmpDb.FieldByName(cField).AsInteger := oItemsIter.val.AsInteger;
                end;
              Data.DB.ftBlob:
                begin
                  opTmpDb.FieldByName(cField).Value := null;
                end;
              Data.DB.ftMemo:
                begin
                  vValue := oItemsIter.val.AsString;
                  vValue := self.Quita_caracteres(vValue);
                  opTmpDb.FieldByName(cField).AsWideString := vValue;
                end;
              Data.DB.ftWideString:
                begin
                  vValue := oItemsIter.val.AsString;
                  vValue := self.Quita_caracteres(vValue);
                  opTmpDb.FieldByName(cField).AsWideString := vValue;
                end;
              Data.DB.ftWideMemo:
                begin
                  vValue := oItemsIter.val.AsString;
                  vValue := self.Quita_caracteres(vValue);
                  opTmpDb.FieldByName(cField).AsWideString := vValue;
                end;
              Data.DB.ftGraphic:
                begin
                  opTmpDb.FieldByName(cField).Value := null;
                end;
              Data.DB.ftFmtMemo:
                begin
                  opTmpDb.FieldByName(cField).Value := null;
                end;
              Data.DB.ftParadoxOle:
                begin
                  opTmpDb.FieldByName(cField).Value := null;
                end;
              Data.DB.ftDBaseOle:
                begin
                  opTmpDb.FieldByName(cField).Value := null;
                end;
              Data.DB.ftTypedBinary:
                begin
                  opTmpDb.FieldByName(cField).Value := null;
                end;
              else
                opTmpDb.FieldByName(cField).Value := null;
            end;
          until not ObjectFindNext(oItemsIter);
        // opTmpDb.FieldByName('Prod_total').AsFloat := opTmpDb.FieldByName('Prod_Cant').AsFloat * opTmpDb.FieldByName('Prod_Precio').AsInteger;
        opTmpDb.Post;
        // ObjectFindClose(oItemsIter);
      end;
    end;
  except
    begin
      if (opTmpDb.State in [dSinsert, dsEdit]) then
      begin
        opTmpDb.cancel;
      end;
      ObjectFindClose(oItemsIter);
      oPrn_lists := nil;
      oFact_dets := nil;
      utiles.LogToFile('Error en la estructura del documento (detalle) [' + cValue + ']', ExtractFilePath(application.ExeName) + '\JSON_GET.LOG');
      result := -1;
      EXIT;
    end;
  end;
  ObjectFindClose(oItemsIter);
  oPrn_lists := nil;
  oFact_dets := nil;
  opTmpDb.First();
  result := opTmpDb.RecordCount;
end;

procedure TfSinco_Main.verifica_stop();
begin
  if (self.bStop_Flg = True) then
    self.Cambiar_Semaforo('A');
end;

procedure TfSinco_Main.oBtn_Env_DataClick(Sender: TObject);
var
  oResponse: ISuperObject;
  jValue1: TJSONValue;
  // iStatusCode: integer;
  cPrepUrl: string;
  iCodigo: integer;
  cDetall: string;
begin
self.bSendOk := 0;
  if (TRIM(self.cJsonUpdate) = '') then
  begin
    DialogBoxAutoClose('Alerta', 'JSON de actualización vacío.', 10);
    // ShowMessage('JSON de actualización vacío.');
    EXIT;
  end;
  self.oBtn_Sol_Data.Enabled := false;

  // self.cJsonUpdate :='{"op_emp_id": "1","op_suc_id": "0","op_num_corre": "2002002010","op_num_ncf": "00000362","op_num_nco": "00000362","op_numserie_if": "TFDM110000835","op_id": 411538,"op_status": "1","op_status_det" : "Todo Bien","op_test" : 1}';

  cPrepUrl := self.Build_url_put();
   utiles.LogToFile('URL : ' +TRIM(cPrepUrl), ExtractFilePath(application.ExeName) + '\JSON_SEND.LOG');
   utiles.LogToFile('JSON: ' +TRIM(self.cJsonUpdate), ExtractFilePath(application.ExeName) + '\JSON_SEND.LOG');
  //if (self.CheckUrl(cPrepUrl, false) >= 300) then
  //begin
  //  utiles.LogToFile('POST-DATA: ' + self.cHttp_Error, ExtractFilePath(application.ExeName) + '\HTTP_ERROR.LOG');
  //  self.bSendOk := -1;
  //  EXIT;
  //end;

  TRY
    self.RESTClient3.BaseURL := TRIM(cPrepUrl);
    self.RESTClient3.Params.Clear;

    self.RESTRequest3.Method := REST.Types.rmPOST;
    self.RESTRequest3.Params.Clear;
    // self.RESTRequest3.Params.AddItem('body', trim(self.cJsonUpdate), TRESTRequestParameterKind.pkREQUESTBODY, [poDoNotEncode], TRESTContentType.ctAPPLICATION_JSON);
    self.RESTRequest3.Params.AddItem('', TRIM(self.cJsonUpdate), TRESTRequestParameterKind.pkREQUESTBODY, [poDoNotEncode], TRESTContentType.ctAPPLICATION_JSON);
    utiles.LogToFile(TRIM(self.cJsonUpdate), ExtractFilePath(application.ExeName) + '\JSON_SEND.LOG');

    self.RESTRequest3.Execute;
    jValue1 := self.RESTResponse3.JsonValue;
    self.oHttp_Result2.Text := jValue1.ToString;
    utiles.LogToFile(TRIM(self.oHttp_Result2.Text), ExtractFilePath(application.ExeName) + '\JSON_SEND.LOG');
    self.oHttp_Result2.Refresh;
    oResponse := SO(self.oHttp_Result2.Text);
    iCodigo := oResponse.O['codigo'].AsInteger;
    cDetall := oResponse.O['mensaje'].AsString;
    if (iCodigo = 100) then
    begin
      self.oBtn_Sol_Data.Enabled := True;
      self.bSendOk := 1;
    end
    else
    begin
      messagedlg(cDetall, mtInformation, [mbOK], 0);
      self.bSendOk := 2;
    end;
  except
    begin
      utiles.LogToFile('POST-DATA: ' + IntToStr(RESTResponse3.StatusCode) + ':' + RESTResponse3.StatusText, ExtractFilePath(application.ExeName) + '\HTTP_ERROR.LOG');
      self.bSendOk := -1;
    end;
  end;
  oResponse := NIL;
end;

procedure TfSinco_Main.oBtn_MinimizeClick(Sender: TObject);
begin
  // Minimize application instead of closing
  application.Minimize;
  // Remove the main form from the Task bar
  self.Hide;
end;

procedure TfSinco_Main.oBtn_Probar_CnnClick(Sender: TObject);
begin
  if (self.oTab_Sett_01.tabvisible = True) then
  begin
    self.Label37.Caption := 'Serial  :';
    // self.Label36.Caption := 'NINGUNO';
    self.olStatus_Conn.Font.Color := clGreen;
    self.olStatus_Conn.Caption := '';
    self.cSerial_Working := '';
  end;
  AHK_FISCAL_LIB.cComm_FIS := TRIM(self.oLst_COM_Fiscal.Text);
  self.oBtn_Status.Enabled := false;

  AHK_FISCAL_LIB.CloseFpctrl();
  if (AHK_FISCAL_LIB.OpenFpctrl(AHK_FISCAL_LIB.cComm_FIS) = True) then
  begin
    self.cSerial_Working := AHK_FISCAL_LIB.Recupera_Numero_Serie;
    self.Label36.Caption := self.cSerial_Working;
    if (self.oTab_Sett_01.tabvisible = True) then
    begin
      self.olStatus_Conn.Font.Color := clGreen;
      self.olStatus_Conn.Caption := 'Conexión éxitosa';
      self.Label37.Caption := 'Serial: ';
      self.oBtn_Status.Enabled := True;
    end;
    self.olStatus_Error.Caption := 'Sin errores.';
    self.olStatus_Error.repaint;
  end
  else
  begin
    self.olStatus_Error.Caption := 'No hay conexión con la impresora fiscal.';
    self.olStatus_Error.repaint;

    if (self.oTab_Sett_01.tabvisible = True) then
    begin
      self.cSerial_Working := '';
      self.olStatus_Conn.Font.Color := clred;
      self.olStatus_Conn.Caption := 'No hay conexión con la impresora fiscal';
      self.oBtn_Status.Enabled := false;
    end;
  end;

  AHK_FISCAL_LIB.CloseFpctrl();
end;

procedure TfSinco_Main.oBtn_SaveClick(Sender: TObject);
var
  cPassword: string;
begin
  utiles.WriteIniFacilValue('AHK', 'COM_PORT', 'S', TRIM(self.oLst_COM_Fiscal.Text));
  utiles.WriteIniFacilValue('Fiscal_Opt', 'ModeloIMP', 'S', TRIM(self.cSerial_Working));
  utiles.WriteIniFacilValue('Fiscal_Opt', 'MATRICIAL', 'B', self.oCk_Matricial.Checked);

  utiles.WriteIniFacilValue('TIMER_FIND_DATA', 'TIME_SECONDS', 'I', self.oTimeVerif.Value);

  utiles.WriteIniFacilValue('TIMER_BEFORE_PRINT', 'TIME_STATUS_SECONDS', 'I', self.otVerifEsp_Stat_Int.Value);
  utiles.WriteIniFacilValue('TIMER_BEFORE_PRINT', 'TIME_STATUS_INTENTS', 'I', self.otVerifEsp_Stat_try.Value);
  utiles.WriteIniFacilValue('TIMER_BEFORE_PRINT', 'TIME_ERROR_SECONDS', 'I', self.otVerifEsp_Erro_Int.Value);
  utiles.WriteIniFacilValue('TIMER_BEFORE_PRINT', 'TIME_ERROR_INTENTS', 'I', self.otVerifEsp_Erro_try.Value);

  utiles.WriteIniFacilValue('TIMER_AFTER_PRINT', 'TIME_STATUS_SECONDS', 'I', self.otVerifFin_Stat_Int.Value);
  utiles.WriteIniFacilValue('TIMER_AFTER_PRINT', 'TIME_STATUS_INTENTS', 'I', self.otVerifFin_Stat_try.Value);

  // utiles.WriteIniFacilValue('HTTP_SERVER_DATA', 'HOST_URL', 'S', self.oHttp_Server.Text);
  utiles.WriteIniFacilValue('HTTP_SERVER_DATA', 'URL_BASE', 'S', self.oHttp_Server.Text);
  utiles.WriteIniFacilValue('HTTP_SERVER_DATA', 'API_GET', 'S', self.oHttp_API_Get.Text);
  utiles.WriteIniFacilValue('HTTP_SERVER_DATA', 'API_PUT', 'S', self.oHttp_API_Put.Text);
  utiles.WriteIniFacilValue('HTTP_SERVER_DATA', 'HOST_EMP', 'S', self.oHttp_Empr.Text);
  utiles.WriteIniFacilValue('HTTP_SERVER_DATA', 'HOST_suc', 'S', self.oHttp_Sucu.Text);
  utiles.WriteIniFacilValue('HTTP_SERVER_DATA', 'JSONDATA', 'S', '');

  utiles.WriteIniFacilValue('GENERAL', 'TEST_MODE', 'B', self.bTest_Mode);
  utiles.WriteIniFacilValue('GENERAL', 'TEST_JSON', 'B', self.oCk_Test_Json.Checked);

  utiles.WriteIniFacilValue('TIMER_BEFORE_MANUAL', 'ACTIVE', 'B', self.oCk_sw_manual.Checked);
  utiles.WriteIniFacilValue('TIMER_BEFORE_MANUAL', 'VALUE', 'I', self.oIntentos_no_recibe.Value);

  ShowMessage('Los datos de la configuración, han sido almacenados.');
End;

procedure TfSinco_Main.oBtn_Sol_DataClick(Sender: TObject);
var
  oResponse: ISuperObject;
  jValue2: TJSONValue;
  cJsonResult: Widestring;
  FMessage: string;
  cPrepUrl: string;
  cValues: string;
  cScheme, cuser, cpass, chost, cport, cPath, cextra: AnsiString;
begin
  FMessage := '';
  self.Clear_Objects();
  self.oBtn_Sol_Data.Enabled := false;

  if (utiles.CheckInternet() = false) then
  begin
    if (self.PageControl1.activepage = oTab_Sett_02) then
      messagedlg('Error de comunicación/internet.', mtInformation, [mbOK], 0);
    self.oBtn_Sol_Data.Enabled := True;
    // self.Activa_Botones(0);
    self.bNo_Imprime := false;
    EXIT;
  end;

  cPrepUrl := self.Build_url_get();
  if (self.CheckUrl(cPrepUrl, false) >= 300) then
  begin
    utiles.LogToFile('POST-DATA: ' + self.cHttp_Error, ExtractFilePath(application.ExeName) + '\HTTP_ERROR.LOG');

    self.bNo_Imprime := True;

    if (self.PageControl1.activepage = oTab_Sett_02) then
      messagedlg(self.cHttp_Error, mtInformation, [mbOK], 0);
    self.oBtn_Sol_Data.Enabled := True;
    // self.Activa_Botones(0);
    self.bNo_Imprime := false;
    EXIT;
  end;

  try
    self.bRESTRequest2_Err := false;
    self.RESTClient2.BaseURL := cPrepUrl;
    self.RESTRequest2.Params.Clear;
    self.RESTRequest2.Execute;
    jValue2 := self.RESTResponse2.JsonValue;
    self.oHttp_Result2.Text := cJsonResult;

    if (self.bRESTRequest2_Err = True) then
    begin
      self.olStatus_Doc.Caption := 'Error de comunicasion con el servidor.';
      self.olStatus_Doc.Refresh;

      cJsonResult := '{"print_list":[]}';
    end
    else
    begin
      jValue2 := self.RESTResponse2.JsonValue;
      cJsonResult := jValue2.ToString;
    end;
  except
    on e: Exception do
    begin
      utiles.LogToFile('POST-DATA: ' + IntToStr(RESTResponse2.StatusCode) + ':' + RESTResponse2.StatusText, ExtractFilePath(application.ExeName) + '\HTTP_ERROR.LOG');
      cJsonResult := '{"print_list":{"fact_cabs":[],"fact_dets":{}}}';
    end;
  end;

  self.oHttp_Result2.Text := cJsonResult;
  if not((TRIM(cJsonResult) = '{"print_list":{"fact_cabs":[],"fact_dets":{}}}') or (TRIM(cJsonResult) = '{"print_list":[]}')) then
  begin
    utiles.LogToFile(cJsonResult, ExtractFilePath(application.ExeName) + '\JSON_GET.LOG');
    self.iBusq_Ndata := 0;
  end
  else
  begin
    if (self.oCk_sw_manual.Checked = True) then
      inc(self.iBusq_Ndata)
    else
      self.iBusq_Ndata := 0;
  end;

  self.oHttp_Result2.Refresh;
  self.oBtn_Sol_Data.Enabled := True;
end;

procedure TfSinco_Main.Clear_Objects();
begin
  self.RESTRequest3.ClearBody;
  // self.RESTRequest3.Params.Clear;

  self.RESTRequest2.ClearBody;
  self.RESTRequest2.Params.Clear;
  self.oHttp_Result2.Text := '';
end;

procedure TfSinco_Main.oBtn_StatusClick(Sender: TObject);
var
  sStatus: string;
begin
  if (AHK_FISCAL_LIB.OpenFpctrl(AHK_FISCAL_LIB.cComm_FIS) = True) then
  begin
    if (AHK_FISCAL_LIB.CheckFprinter() = True) then
    begin
      AHK_FISCAL_LIB.HKA_ShowStatusByName(True, sStatus)
    end;
  end;
  AHK_FISCAL_LIB.CloseFpctrl();
end;

procedure TfSinco_Main.oCk_Test_ModeClick(Sender: TObject);
begin
  self.bTest_Mode := self.oCk_Test_Mode.Checked;
  self.bNo_Imprime := self.oCk_Test_Mode.Checked;
end;

procedure TfSinco_Main.OgDaysCode1ChangeCode(Sender: TObject; Code: TCode);
var
  IniFile: TIniFile;
  S, cFileName: string;
begin
  cFileName := ExtractFilePath(application.ExeName) + '\BASICVALUES.INI';
  IniFile := TIniFile.Create(cFileName);
  try
    S := BufferToHex(Code, SizeOf(Code));
    IniFile.WriteString('Keys', 'key_app', S);
  finally
    IniFile.Free;
  end;
end;

procedure TfSinco_Main.OgDaysCode1Checked(Sender: TObject; Status: TCodeStatus);
begin
  case Status of
    ogValidCode:
      begin
        { code is valid but may still be expired }
      end;
    ogInvalidCode:
      begin
        { code is invalid }
      end;
    ogPastEndDate:
      begin
        { end date has been reached }
      end;
    ogDayCountUsed:
      begin
        ShowMessage('Expiro el tiempo de evaluación');
        application.terminate;
        { number of days authorized have been used }
      end;
    ogRunCountUsed:
      begin
        { number of runs authorized have been used }
      end;
    ogNetCountUsed:
      begin
        { number of authorized users has been exceeded }
      end;
    ogCodeExpired:
      begin
        { expiration date has been reached }
      end;
  end;

  if (Status <> ogValidCode) then
  begin
    if fileexists(self.cFPath) then
      ShellExecute(Handle, 'open', PChar(self.cFPath), PChar(self.cApp), '', SW_SHOWNORMAL)
    else
    begin
      application.terminate;
      System.halt;
    end;
  end;

end;

procedure TfSinco_Main.OgDaysCode1GetCode(Sender: TObject; var Code: TCode);
var
  IniFile: TIniFile;
  S, cFileName: string;
begin
  cFileName := ExtractFilePath(application.ExeName) + '\BASICVALUES.INI';
  IniFile := TIniFile.Create(cFileName);
  try
    S := IniFile.ReadString('Keys', 'key_app', '');
    HexToBuffer(S, Code, SizeOf(Code));
  finally
    IniFile.Free;
  end;
end;

procedure TfSinco_Main.OgDaysCode1GetKey(Sender: TObject; var Key: TKey);
const
  cKey_Value: TKey = ($0E, $29, $80, $B1, $9B, $92, $DD, $0A, $2D, $65, $1B, $43, $0E, $C0, $EF, $19);
begin
  Key := cKey_Value;
end;

procedure TfSinco_Main.oParam_ImprClick(Sender: TObject);
begin
  if (self.bStop_Flg = True) then
  begin
    if (self.oParam_Impr.Checked = True) then
    begin
      self.oTab_Sett_01.tabvisible := True;
      self.PageControl1.activepage := self.oTab_Sett_01;
    end
    else
    begin
      self.oTab_Sett_01.tabvisible := false;
      self.PageControl1.activepage := self.oTab_Main;
    end;
  end;
end;

procedure TfSinco_Main.oParam_ServClick(Sender: TObject);
begin
  if (self.bStop_Flg = True) then
  begin
    if (self.oParam_Serv.Checked = True) then
    begin
      self.oTab_Sett_02.tabvisible := True;
      self.PageControl1.activepage := self.oTab_Sett_02;
    end
    else
    begin
      self.oTab_Sett_02.tabvisible := false;
      self.PageControl1.activepage := self.oTab_Main;
    end;
  end;
end;

procedure TfSinco_Main.orBtn_Doit_RDocClick(Sender: TObject);
begin
  self.orBtn_Doit_RDoc.Enabled := false;

  self.oTab_Main.tabvisible := false;
  self.oTab_Rang_Fech.tabvisible := false;
  self.SoporteTcnico1.Enabled := false;
  self.oParam_Impr.Checked := false;
  self.oParam_Serv.Checked := false;
  self.oTab_Sett_01.tabvisible := false;
  self.oTab_Sett_02.tabvisible := false;
  self.PageControl1.repaint;
  self.PageControl3.repaint;
  self.oTab_Rang_Fech.Enabled := false;

  if (self.bNo_Imprime = false) then
  begin
    self.Reimprime_Por_Rango;
  end
  else
    sleep(3000);

  self.oTab_Rang_Fech.Enabled := True;
  self.oTab_Main.tabvisible := True;
  self.oTab_Rang_Fech.tabvisible := True;
  self.PageControl1.repaint;
  self.PageControl3.repaint;

  self.orBtn_Doit_RDoc.Enabled := True;
end;

procedure TfSinco_Main.Reimprime_Por_Rango;
var
  cFisc_Cmd: string;
  cSec_Ini, cSec_Fin: string;
begin
  self.Cambiar_Semaforo('A');
  {
    F=Para facturas almacenadas en memoria de auditoria.
    C=Para notas de crédito almacenadas en la memoria de auditoria.
    D=Para notas de débito almacenadas en la memoria de auditoria.
    T=Todos los documentos no fiscales.
    X=Reporte X.
    Z=Para reportes Z, almacenadas en la memoria de auditoria.
  }

  {
    1=Factura
    2=Devolucion de Venta
    3=Nota de Debito
    4=CierreX
    5=CierreZ
  }
  cFisc_Cmd := '';
  case self.oLst_Reimpr_Tipo.Value of
    1:
      begin
        cFisc_Cmd := 'F';
      end;
    2:
      begin
        cFisc_Cmd := 'C';
      end;
    3:
      begin
        cFisc_Cmd := 'D';
      end;
    4:
      begin
        cFisc_Cmd := 'X';
      end;
    5:
      begin
        cFisc_Cmd := 'Z';
      end;
  end;

  cSec_Ini := utiles.PadL(TRIM(IntToStr(self.orSec_Ini.Value)), 7, '0');
  cSec_Fin := utiles.PadL(TRIM(IntToStr(self.orSec_Fin.Value)), 7, '0');
  cFisc_Cmd := 'R' + cFisc_Cmd + cSec_Ini + cSec_Fin;

  if (self.Try_Open_Port() = True) then
  begin
    self.Cambiar_Semaforo('R');
    if (bHKALog = True) then
      utiles.LogToFile(cFisc_Cmd, ExtractFilePath(application.ExeName) + '\AHK.LOG');
    SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cFisc_Cmd));
  end;
  AHK_FISCAL_LIB.Espera_Proceso_IMPF(self.olWaitStop);
  self.Cambiar_Semaforo('V');
end;

procedure TfSinco_Main.orBtn_Doit_RFecClick(Sender: TObject);
begin
  self.orBtn_Doit_RFec.Enabled := false;

  self.oTab_Main.tabvisible := false;
  self.oParam_Impr.Checked := false;
  self.oParam_Serv.Checked := false;
  self.oTab_Sett_01.tabvisible := false;
  self.oTab_Sett_02.tabvisible := false;
  self.oTab_Rang_Corr.tabvisible := false;
  self.PageControl1.repaint;
  self.PageControl3.repaint;
  self.oTab_Rang_Corr.Enabled := false;

  if (self.bNo_Imprime = false) then
  begin
    self.Reimprime_Por_Fecha;
  end
  else
    sleep(3000);

  self.oTab_Rang_Corr.Enabled := True;
  self.oTab_Main.tabvisible := True;
  self.oTab_Rang_Corr.tabvisible := True;
  self.PageControl1.repaint;
  self.PageControl3.repaint;

  self.orBtn_Doit_RFec.Enabled := True;
end;

procedure TfSinco_Main.orFec_FinExit(Sender: TObject);
begin
  if (self.orFec_Fin.Value < self.orFec_Ini.Value) then
    self.orFec_Fin.Value := self.orFec_Ini.Value;
end;

procedure TfSinco_Main.orFec_IniExit(Sender: TObject);
begin
  if (self.orFec_Ini.Value = null) then
    self.orFec_Ini.Value := now();

  if (self.orFec_Ini.Value > self.orFec_Fin.Value) then
    self.orFec_Fin.Value := self.orFec_Ini.Value;
end;

procedure TfSinco_Main.orSec_FinExit(Sender: TObject);
begin
  if (self.orSec_Fin.Value < self.orSec_Ini.Value) then
    self.orSec_Fin.Value := self.orSec_Ini.Value;
end;

procedure TfSinco_Main.orSec_IniExit(Sender: TObject);
begin
  if (self.orSec_Ini.Value < 1) then
    self.orSec_Ini.Value := 1;

  if (self.orSec_Ini.Value > self.orSec_Fin.Value) then
    self.orSec_Fin.Value := self.orSec_Ini.Value;
end;

procedure TfSinco_Main.Reimprime_Por_Fecha;
var
  cFisc_Cmd: string;
  cFech_Ini, cFech_Fin: string;
begin
  self.Cambiar_Semaforo('A');
  {
    F=Para facturas almacenadas en memoria de auditoria.
    C=Para notas de crédito almacenadas en la memoria de auditoria.
    D=Para notas de débito almacenadas en la memoria de auditoria.
    T=Todos los documentos no fiscales.
    X=Reporte X.
    Z=Para reportes Z, almacenadas en la memoria de auditoria.
  }

  {
    1=Factura
    2=Devolucion de Venta
    3=Nota de Debito
    4=CierreX
    5=CierreZ
  }
  cFisc_Cmd := '';
  case self.oLst_Reimpr_Tipo.Value of
    1:
      begin
        cFisc_Cmd := 'f';
      end;
    2:
      begin
        cFisc_Cmd := 'c';
      end;
    3:
      begin
        cFisc_Cmd := 'd';
      end;
    4:
      begin
        cFisc_Cmd := 'x';
      end;
    5:
      begin
        cFisc_Cmd := 'z';
      end;
  end;

  cFech_Ini := FormatDateTime('YYYYMMDD', self.orFec_Ini.Value);
  cFech_Fin := FormatDateTime('YYYYMMDD', self.orFec_Fin.Value);
  cFisc_Cmd := 'R' + cFisc_Cmd + '0' + COPY(cFech_Ini, 2, 6) + '0' + COPY(cFech_Fin, 2, 6);

  if (self.Try_Open_Port() = True) then
  begin
    self.Cambiar_Semaforo('R');
    if (bHKALog = True) then
      utiles.LogToFile(cFisc_Cmd, ExtractFilePath(application.ExeName) + '\AHK.LOG');
    SendCmd(@HKA_FP_Status, @HKA_FP_Error, PChar(cFisc_Cmd));
    AHK_FISCAL_LIB.Espera_Proceso_IMPF(self.olWaitStop);
    self.Cambiar_Semaforo('V');
  end;
end;

procedure TfSinco_Main.oTimeCheckTimer(Sender: TObject);
var
  cPrepUrl: string;
begin
  bRESTRequest2_Err := false;
  bRESTRequest3_Err := false;

  self.bTm_work := True;
  self.oTimeCheck.Enabled := false;

  Desactiva_Botones(0);

  self.oTab_Print.tabvisible := false;
  self.oTab_Print.repaint;

  if (utiles.CheckInternet() = false) then
  begin
    utiles.LogToFile('POST-DATA: Se perdió la comunicación con el internet. En espera de conexión.', ExtractFilePath(application.ExeName) + '\HTTP_ERROR.LOG');

    self.Cambiar_Semaforo('A');
    self.olStatus_Doc.Caption := 'Se perdió la comunicación con el internet. En espera de conexión.';
    self.olStatus_Doc.Color := $000000B3;
    self.olStatus_Doc.repaint;
    self.bTm_work := false;
    self.oTimeCheck.Enabled := True;
    self.oBtn_Detener.Enabled := True;
    self.oBtn_Detener.repaint;
    self.Activa_Botones(0);
    EXIT;
  end;

  cPrepUrl := self.Build_url_get();
  if (self.CheckUrl(cPrepUrl, false) >= 300) then
  begin
    utiles.LogToFile('POST-DATA: ' + self.cHttp_Error, ExtractFilePath(application.ExeName) + '\HTTP_ERROR.LOG');

    self.Cambiar_Semaforo('A');
    self.olStatus_Doc.Caption := self.cHttp_Error;
    self.olStatus_Doc.Color := $000000B3;
    self.olStatus_Doc.repaint;
    self.bTm_work := false;
    self.oTimeCheck.Enabled := True;
    self.oBtn_Detener.Enabled := True;
    self.oBtn_Detener.repaint;
    self.Activa_Botones(0);
    EXIT;
  end;

  if (self.bStop_Flg = True) then
  begin
    self.Cambiar_Semaforo('R');
    self.olStatus_Doc.Caption := 'Sistema detenido manualmente.';
    self.olStatus_Doc.Font.Color := clred;
    self.olStatus_Doc.repaint;
    self.bTm_work := false;
    self.oTimeCheck.Enabled := false;
    self.oTab_Print.tabvisible := True;
    self.oTab_Print.repaint;
    self.Activa_Botones(0);
    self.oBtn_Detener.Caption := 'Reanudar.';
    self.oBtn_Detener.Enabled := True;
    self.olWaitStop.Caption := 'Sin mensajes.';
    self.olWaitStop.repaint;
    EXIT;
  end;

  self.Cambiar_Semaforo('V');

  if (self.oCk_sw_manual.Checked = True) then
  begin
    if (self.iBusq_Ndata >= self.oIntentos_no_recibe.Value) then
    begin
      self.bStop_Flg := True;
      self.Cambiar_Indic_Espera('ON');
      self.Cambiar_Semaforo('R');
      self.olStatus_Doc.Caption := 'Sistema detenido por inactividad. Activar manual.';
      self.olStatus_Doc.Font.Color := clred;
      self.olStatus_Doc.repaint;
      self.oTimeCheck.Enabled := false;
      self.bTm_work := false;
      self.oTab_Print.tabvisible := True;
      self.oTab_Print.repaint;
      self.Activa_Botones(0);
      self.oBtn_Detener.Caption := 'Reanudar.';
      self.oBtn_Detener.Enabled := True;
      self.olWaitStop.Caption := 'Sin mensajes.';
      self.olWaitStop.repaint;
      self.iBusq_Ndata := 0;
      EXIT;
    end;
  end;

  self.olStatus_Error.Caption := 'Sin errores.';
  self.olStatus_Error.Color := clGreen;
  self.olStatus_Error.repaint;

  self.Cambiar_Semaforo('R');

  if (self.bNo_Imprime = false) then
  begin
    self.Cargar_Fact();
  end
  else
    sleep(1000);

  self.Cambiar_Semaforo('V');

  self.bTm_work := false;
  self.oBtn_Detener.Enabled := True;
  self.oBtn_Detener.repaint;
  self.oBtn_quit.Enabled := True;
  self.oBtn_quit.repaint;
  self.oBtn_Minimize.Enabled := True;
  self.oBtn_Minimize.repaint;
  self.oTimeCheck.Enabled := True;
  self.olStatus_Doc.Caption := 'En espera de nuevos documentos.';
  self.olStatus_Doc.Font.Color := clWindowText;
  self.olStatus_Doc.repaint;
  self.olWaitStop.Caption := 'Sin mensajes.';
  self.olWaitStop.repaint;
  self.Cambiar_Indic_Espera('OFF');
end;

procedure TfSinco_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caNone;
end;

procedure TfSinco_Main.FormCreate(Sender: TObject);
var
  oMyIcon: TIcon;
  cPassword: string;
begin
  self.cHttp_Error := '';

  bRESTRequest2_Err := false;
  bRESTRequest3_Err := false;

  self.bNo_Imprime := false;
  self.cPath := ExtractFilePath(application.ExeName);
  self.cExeF := 'pskill.exe';
  self.cFPath := self.cPath + '\pskill.exe';
  self.cApp := ExtractFileName(application.ExeName) + ' -nobanner';

  self.cRes_Path := ExtractFileDir(ParamStr(0)) + '\Images';

  self.iBusq_Ndata := 0;
  self.iShoiceAct := 0;
  self.bIgnore_Fis := false;
  self.bTest_Mode := false;
  self.bStop_Flg := false;
  self.bSendOk := 0;
  self.bTm_work := false;
  self.cJsonUpdate := '';
  { Load the tray icons. }

  { Set up a hint message and the animation interval. }
  self.TrayIcon1.Hint := '(M.I.F) Módulo de impresión fiscal (está en ejecución).';
  self.TrayIcon1.AnimateInterval := 200;

  { Set up a hint balloon. }
  self.TrayIcon1.BalloonTitle := 'Restaurar la ventana.';
  self.TrayIcon1.BalloonHint := 'Doble clic en el icono para restaurar la aplicación.';
  self.TrayIcon1.BalloonFlags := bfInfo;

  utiles.bConnectionOk := false;

  if (utiles.oPublicCnnProc <> nil) then
    utiles.oPublicCnnProc.Connected := false;

  if (utiles.oPublicCnn <> nil) then
    utiles.oPublicCnn.Connected := false;

  // utiles.Carga_Setting_Conn();
  self.oLst_COM_Fiscal.Items.Clear;
  CommPortList.GetPortList(self.oLst_COM_Fiscal.Items);
  self.oLst_COM_Fiscal.Value := utiles.Read_IniFacilValue('AHK', 'COM_PORT', 'S', 'COM1');
  self.cSerial_Working := utiles.Read_IniFacilValue('Fiscal_Opt', 'ModeloIMP', 'S', '');

  self.oTimeVerif.Value := utiles.Read_IniFacilValue('TIMER_FIND_DATA', 'TIME_SECONDS', 'I', 5);

  self.otVerifEsp_Stat_Int.Value := utiles.Read_IniFacilValue('TIMER_BEFORE_PRINT', 'TIME_STATUS_SECONDS', 'I', 3);
  self.otVerifEsp_Stat_try.Value := utiles.Read_IniFacilValue('TIMER_BEFORE_PRINT', 'TIME_STATUS_INTENTS', 'I', 10);
  self.otVerifFin_Stat_Int.Value := utiles.Read_IniFacilValue('TIMER_AFTER_PRINT', 'TIME_STATUS_SECONDS', 'I', 3);
  self.otVerifFin_Stat_try.Value := utiles.Read_IniFacilValue('TIMER_AFTER_PRINT', 'TIME_STATUS_INTENTS', 'I', 20);

  self.otVerifEsp_Erro_Int.Value := utiles.Read_IniFacilValue('TIMER_BEFORE_PRINT', 'TIME_ERROR_SECONDS', 'I', 3);
  self.otVerifEsp_Erro_try.Value := utiles.Read_IniFacilValue('TIMER_BEFORE_PRINT', 'TIME_ERROR_INTENTS', 'I', 10);

  self.oCk_sw_manual.Checked := utiles.Read_IniFacilValue('TIMER_BEFORE_MANUAL', 'ACTIVE', 'B', True);
  self.oIntentos_no_recibe.Value := utiles.Read_IniFacilValue('TIMER_BEFORE_MANUAL', 'VALUE', 'I', 30);

  self.bTest_Mode := utiles.Read_IniFacilValue('GENERAL', 'TEST_MODE', 'B', false);
  self.oCk_Test_Json.Checked := utiles.Read_IniFacilValue('GENERAL', 'TEST_JSON', 'B', false);

  self.oCk_Matricial.Checked := utiles.Read_IniFacilValue('Fiscal_Opt', 'MATRICIAL', 'B', True);

  self.Label36.Caption := self.cSerial_Working;

  self.oHttp_Result2.Text := '';

  // self.oHttp_Server.Text := utiles.Read_IniFacilValue('HTTP_SERVER_DATA', 'HOST_URL', 'S', '');

  self.oHttp_Server.Text := utiles.Read_IniFacilValue('HTTP_SERVER_DATA', 'URL_BASE', 'S', '');
  self.oHttp_API_Get.Text := utiles.Read_IniFacilValue('HTTP_SERVER_DATA', 'API_GET', 'S', '');
  self.oHttp_API_Put.Text := utiles.Read_IniFacilValue('HTTP_SERVER_DATA', 'API_PUT', 'S', '');
  self.oHttp_Empr.Text := utiles.Read_IniFacilValue('HTTP_SERVER_DATA', 'HOST_EMP', 'S', '');
  self.oHttp_Sucu.Text := utiles.Read_IniFacilValue('HTTP_SERVER_DATA', 'HOST_suc', 'S', '');

  self.oTimeCheck.Interval := (self.oTimeVerif.Value * 1000);
  self.oTimeCheck.Enabled := false;
  self.oTab_Sett_01.tabvisible := false;
  self.oTab_Sett_02.tabvisible := false;
  self.PageControl1.activepage := self.oTab_Main;
end;

procedure TfSinco_Main.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (self.bStop_Flg = True) then
  begin
    if Shift = [ssShift, ssCtrl] then
    begin
      if (Key = VK_F10) then
      begin
        if (self.SoporteTcnico1.Enabled = True) then
        begin
          // self.N2.Visible := false;
          self.SoporteTcnico1.Enabled := false;
        end
        ELSE
        begin
          // self.N2.Visible := True;
          self.SoporteTcnico1.Enabled := True;
        end;
        Key := 0;
      end;
    end;
  end;
end;

procedure TfSinco_Main.FormShow(Sender: TObject);
var
  cFile: string;
begin
  if (self.oCk_Matricial.Checked = false) then
  begin
    cFile := self.cRes_Path + '\bixolon_printer.png';
  end
  else
  begin
    cFile := self.cRes_Path + '\dascom_printer.png';
  end;
  self.oPrinter_Img.Picture.LoadFromFile(cFile);

  self.oCk_Test_Mode.Checked := self.bTest_Mode;
  self.oMem_Fac.EmptyTable;
  self.oMem_Det.EmptyTable;
  self.oTimeCheck.Enabled := True;

  self.Cambiar_Semaforo('A');

  self.oLst_Reimpr_Tipo.ItemIndex := 0;
  self.orFec_Fin.Value := now();
  self.orFec_Ini.Value := now();
  self.orSec_Ini.Value := 1;
  self.orSec_Fin.Value := 1;
end;

procedure TfSinco_Main.MostrarMFF1Click(Sender: TObject);
begin
  { Hide the tray icon and show the window,
    setting its state property to wsNormal. }
  self.Mostrar_App();
  {
    self.TrayIcon1.Visible := false;
    self.Show();
    self.WindowState := wsNormal;
    application.BringToFront();
  }
end;

procedure TfSinco_Main.TrayIcon1DblClick(Sender: TObject);
begin
  { Hide the tray icon and show the window,
    setting its state property to wsNormal. }
  self.TrayIcon1.Visible := false;
  self.Show();
  self.WindowState := wsNormal;
  application.BringToFront();
end;

function TfSinco_Main.print_doc_fiscal(pNum_Op: string): boolean;
var
  cDocuemntoEnlace, cMsgPromocional: string;
  cResult: string;
  cSqlLine: string;
  iConta, iIdx: integer;
  cCod_Fp, cCadena: string;
  cTextInf, cStr_Refe: string;
  cSql_Ln: string;
  sStatus: string;
begin

  AHK_FISCAL_LIB.cNumeroFinal := pNum_Op;

  utiles.WaitStart(self, 'Iniciando impresión de documento en equipo fiscal:..');

  self.oMem_NomCte.Clear;
  self.oMem_DirCte.Clear;
  self.oMem_RucCte.Clear;
  self.oMem_TelCte.Clear;
  self.oMem_NomArt.Clear;

  AHK_FISCAL_LIB.fMontoEfe := 0;
  AHK_FISCAL_LIB.cOFG_Num_corre := self.oMem_Fac.FieldByName('op_num_corre').AsString;
  AHK_FISCAL_LIB.fOFG_MontTotal := self.oMem_Fac.FieldByName('op_pagado').AsFloat;
  AHK_FISCAL_LIB.cNum_Refere := TRIM(self.oMem_Fac.FieldByName('op_num_corre').AsString);
  AHK_FISCAL_LIB.cOFG_id_Empresa := TRIM(self.oMem_Fac.FieldByName('op_emp_id').AsString);
  AHK_FISCAL_LIB.cOFG_id_Sucursal := TRIM(self.oMem_Fac.FieldByName('op_suc_id').AsString);

  utiles.cId_empresa := TRIM(self.oMem_Fac.FieldByName('op_emp_id').AsString);

  cMsgPromocional := 'Gracias por su compra.';

  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';

  self.oMem_NomCte.Lines.Add(TRIM(self.oMem_Fac.FieldByName('op_nom_cliente').AsString));
  self.oMem_RucCte.Lines.Add(TRIM(self.oMem_Fac.FieldByName('op_nip_cliente').AsString));
  self.oMem_DirCte.Lines.Add(TRIM(self.oMem_Fac.FieldByName('op_dir_cliente').AsString));
  self.oMem_TelCte.Lines.Add(TRIM(self.oMem_Fac.FieldByName('op_tel_cliente').AsString));

  if (TRIM(self.oMem_Fac.FieldByName('op_dir_cliente').AsString) <> '') then
  begin
    self.oMem_DirCte.Lines.Add(#10);
    self.oMem_DirCte.Lines.Add('TELEFONO:' + TRIM(self.oMem_Fac.FieldByName('op_tel_cliente').AsString));
  end;

  self.oMem_NomArt.Clear;

  if (AHK_FISCAL_LIB.HKA_ShowStatusByName(false, sStatus) = false) then
  begin
    DialogBoxAutoClose('Alerta', sStatus + ' El cupón en curso será anulado.', 10);
    // ShowMessage(sStatus + ' El cupón en curso será anulado.');
    AHK_FISCAL_LIB.Anula_Cupon;
    result := false;
    EXIT;
  end;
  result := True;

  AHK_FISCAL_LIB.cOFG_VarTipoV := TRIM(self.oMem_Fac.FieldByName('op_tipo').AsString);

  utiles.WaitSetMsg('Ejecutando impresión de documento en equipo fiscal.');

  if (TRIM(AHK_FISCAL_LIB.cOFG_VarTipoV) = '16') then
  begin
    cDocuemntoEnlace := TRIM(self.oMem_Fac.FieldByName('op_num_rel').AsString);

    AHK_FISCAL_LIB.Abre_NotaDeCredito(TRIM(self.oMem_Fac.FieldByName('op_nom_cliente').AsString), TRIM(self.oMem_Fac.FieldByName('op_dir_cliente').AsString), cDocuemntoEnlace,
      TRIM(self.oMem_Fac.FieldByName('op_nip_cliente').AsString));
  end
  else
    AHK_FISCAL_LIB.Abrir_Cupon(self.oMem_RucCte.Text, self.oMem_NomCte.Text, self.oMem_DirCte.Text, TRIM(self.oMem_Fac.FieldByName('op_tel_cliente').AsString));

  if (bBreak_Proc = True) then
    EXIT;

  { Impresion del detalle. }
  AHK_FISCAL_LIB.Procesa_Detalle_Factura(self.oMem_Det);

  if (bBreak_Proc = True) then
    EXIT;

  { Descuentos de los totales }
  fOFG_MontDesc := self.oMem_Fac.FieldByName('op_desc').AsFloat;

  AHK_FISCAL_LIB.Procesa_DesTot_Factura;

  if (bBreak_Proc = True) then
    EXIT;

  { forma de pago }
  fOFG_MontCargo := self.oMem_Fac.FieldByName('op_manejo').AsFloat;

  AHK_FISCAL_LIB.fOFG_MontoCer := 0.00;
  AHK_FISCAL_LIB.fOFG_MontoDon := 0.00;

  AHK_FISCAL_LIB.Procesa_Forma_Pago(self.oMem_Fac);;

  if (bBreak_Proc = True) then
    EXIT;

  { cierra factura }
  AHK_FISCAL_LIB.Cierra_Cupon(cMsgPromocional);

  AHK_FISCAL_LIB.Espera_Proceso_IMPF(self.olWaitStop);

  AHK_FISCAL_LIB.cOFG_Num_NCF := '';
  if (utiles.inlist(TRIM(AHK_FISCAL_LIB.cOFG_VarTipoV), ['2', '14'])) then
    AHK_FISCAL_LIB.cOFG_Num_NCF := AHK_FISCAL_LIB.Recupera_Numero_ComprobanteFiscal(1)
  ELSE if (TRIM(AHK_FISCAL_LIB.cOFG_VarTipoV) = '16') then
    AHK_FISCAL_LIB.cOFG_Num_NCF := AHK_FISCAL_LIB.Recupera_Numero_ComprobanteFiscal(2);

  if (utiles.isEmpty(AHK_FISCAL_LIB.cOFG_Num_NCF) = false) then
  begin
    self.oMem_Fac.Edit;
    self.oMem_Fac.FieldByName('op_num_ncf').AsString := TRIM(AHK_FISCAL_LIB.cOFG_Num_NCF);
    self.oMem_Fac.Post;

    utiles.WriteIniFacilValue('AHK', 'Ult_DocFis', 'S', AHK_FISCAL_LIB.cOFG_Num_NCF);
  end;

  AHK_FISCAL_LIB.cOFG_Num_COO := '';
  if (utiles.inlist(TRIM(AHK_FISCAL_LIB.cOFG_VarTipoV), ['2', '14'])) then
    AHK_FISCAL_LIB.cOFG_Num_COO := AHK_FISCAL_LIB.Recupera_Numero_Cupon(1)
  else if (TRIM(AHK_FISCAL_LIB.cOFG_VarTipoV) = '16') then
    AHK_FISCAL_LIB.cOFG_Num_COO := AHK_FISCAL_LIB.Recupera_Numero_Cupon(2);

  if (utiles.isEmpty(AHK_FISCAL_LIB.cOFG_Num_COO) = false) then
  begin
    self.oMem_Fac.Edit;
    self.oMem_Fac.FieldByName('op_num_nco').AsString := TRIM(AHK_FISCAL_LIB.cOFG_Num_COO);
    self.oMem_Fac.Post;
  end;

  if (utiles.isEmpty(AHK_FISCAL_LIB.cSerieIMF) = false) then
  begin
    self.oMem_Fac.Edit;
    self.oMem_Fac.FieldByName('op_numserie_if').AsString := TRIM(AHK_FISCAL_LIB.cSerieIMF);
    self.oMem_Fac.Post;
  end;

  // DEVOLUCION Y MANEJO DE EFECTIVO
  if (TRIM(AHK_FISCAL_LIB.cOFG_VarTipoV) = '16') then
  begin

    if (ROUNDD(AHK_FISCAL_LIB.fMontoEfe, 2) > 0.00) then
    begin
      sleep(100);
      AHK_FISCAL_LIB.Procesa_Salida_Dinero(AHK_FISCAL_LIB.fMontoEfe + AHK_FISCAL_LIB.fOFG_MontCargo);
    end;
  end;

  if (bAnular_Op = True) then
  begin
    // AHK_FISCAL_LIB.Fiscal_Check_Operation(self, AHK_FISCAL_LIB.cOFG_VarTipoV, AHK_FISCAL_LIB.cOFG_Num_corre);
  end;

  utiles.WaitEnd;
end;

procedure TfSinco_Main.RESTClient2HTTPProtocolError(Sender: TCustomRESTClient);
begin
  self.bRESTRequest2_Err := True;
  self.olStatus_Error.Caption := 'Hubo un error al tratar de realizar la conexión con el servidor.';
  self.olStatus_Error.Color := $000000B3;
  self.olStatus_Error.Refresh;
  utiles.LogToFile(TRIM(self.cJsonUpdate), ExtractFilePath(application.ExeName) + '\HTTP_SEND_ERROR.LOG');
end;

procedure TfSinco_Main.RESTClient3HTTPProtocolError(Sender: TCustomRESTClient);
begin
  self.bRESTRequest3_Err := True;
  self.olStatus_Error.Caption := 'Hubo un error al tratar de realizar el envio al servidor.';
  self.olStatus_Error.Color := $000000B3;
  self.olStatus_Error.Refresh;
  utiles.LogToFile(TRIM(self.cJsonUpdate), ExtractFilePath(application.ExeName) + '\HTTP_SEND_ERROR.LOG');
end;

procedure TfSinco_Main.RESTRequest2HTTPProtocolError(Sender: TCustomRESTRequest);
begin
  self.bRESTRequest2_Err := True;
  self.olStatus_Error.Caption := 'Hubo un error al tratar de recuperar lo datos.';
  self.olStatus_Error.Color := $000000B3;
  self.olStatus_Error.Refresh;
  utiles.LogToFile(TRIM(self.cJsonUpdate), ExtractFilePath(application.ExeName) + '\HTTP_GET_ERROR.LOG');
end;

procedure TfSinco_Main.RESTRequest3HTTPProtocolError(Sender: TCustomRESTRequest);
begin
  self.bRESTRequest3_Err := True;
  self.olStatus_Error.Caption := 'Hubo un error al tratar de realizar él envió.';
  self.olStatus_Error.Color := $000000B3;
  self.olStatus_Error.Refresh;
  utiles.LogToFile(TRIM(self.cJsonUpdate), ExtractFilePath(application.ExeName) + '\HTTP_SEND_ERROR.LOG');
end;

procedure TfSinco_Main.SalirdeMFF1Click(Sender: TObject);
begin
  Close;
  if fileexists(self.cFPath) then
    ShellExecute(Handle, 'open', PChar(self.cFPath), PChar(self.cApp), '', SW_SHOWNORMAL)
  else
  begin
    application.terminate;
    System.halt;
  end;
end;

function TfSinco_Main.EnDeCrypt(const Value: String): String;
var
  CharIndex: integer;
begin
  result := Value;
  for CharIndex := 1 to Length(Value) do
    result[CharIndex] := chr(not(ord(Value[CharIndex])));
end;

function TfSinco_Main.BestFit(const AInput: AnsiString): AnsiString;
const
  CodePage = 20127; // 20127 = us-ascii
var
  WS: Widestring;
begin
  WS := Widestring(AInput);
  SetLength(result, WideCharToMultiByte(CodePage, 0, PWideChar(WS), Length(WS), nil, 0, nil, nil));
  WideCharToMultiByte(CodePage, 0, PWideChar(WS), Length(WS), PAnsiChar(result), Length(result), nil, nil);
end;

procedure TfSinco_Main.oBtn_CierreXClick(Sender: TObject);
var
  sStatus: string;
begin
  self.oBtn_CierreX.Enabled := false;

  self.oBtn_Minimize.Enabled := false;
  self.oBtn_quit.Enabled := false;
  self.oBtn_CierreZ.Enabled := false;
  self.oBtn_Detener.Enabled := false;
  self.oTab_Print.tabvisible := false;
  self.SoporteTcnico1.Enabled := false;
  self.oParam_Impr.Checked := false;
  self.oParam_Serv.Checked := false;
  self.oTab_Sett_01.tabvisible := false;
  self.oTab_Sett_02.tabvisible := false;
  self.PageControl1.repaint;

  if (self.bNo_Imprime = false) then
  begin
    self.oBtn_Probar_CnnClick(self);
    AHK_FISCAL_LIB.CloseFpctrl();
    if (AHK_FISCAL_LIB.OpenFpctrl(AHK_FISCAL_LIB.cComm_FIS) = True) then
    begin
      self.Verifica_Status_Espe();
      self.Verifica_Error_Imp();

      if (AHK_FISCAL_LIB.CheckFprinter() = True) then
      begin
        messagedlg('Espere al que el impresor termine de imprimir el documento, [pueden ser varias páginas].', mtInformation, [mbOK], 0);

        AHK_FISCAL_LIB.HKA_ShowStatusByName(false, sStatus);
        self.olStatus_Print.Caption := UpperCase(TRIM(sStatus));

        self.olStatus_Doc.Caption := 'Imprimiendo reporte de cierre [X].';
        self.olStatus_Doc.repaint;

        AHK_FISCAL_LIB.Procesa_CierreX();
        AHK_FISCAL_LIB.Espera_Proceso_IMPF(self.olWaitStop);
        // self.oBtn_CierreX.Enabled := True;

      end;
    end;
  end
  else
    sleep(3000);

  self.olStatus_Doc.Caption := 'Proceso de impresión de reporte de cierre [X] finalizado.';
  self.olStatus_Doc.repaint;

  self.oBtn_CierreZ.Enabled := True;
  self.oBtn_Detener.Enabled := True;

  self.oTab_Print.tabvisible := True;
  self.PageControl1.repaint;
  self.oBtn_Minimize.Enabled := True;
  self.oBtn_quit.Enabled := True;

  self.oBtn_CierreX.Enabled := True;
end;

procedure TfSinco_Main.oBtn_CierreZClick(Sender: TObject);
var
  sStatus: string;
begin
  self.oBtn_CierreZ.Enabled := false;

  self.oBtn_Minimize.Enabled := false;
  self.oBtn_quit.Enabled := false;
  self.oBtn_CierreX.Enabled := false;
  self.oBtn_Detener.Enabled := false;
  self.oTab_Print.tabvisible := false;
  self.SoporteTcnico1.Enabled := false;
  self.oParam_Impr.Checked := false;
  self.oParam_Serv.Checked := false;
  self.oTab_Sett_01.tabvisible := false;
  self.oTab_Sett_02.tabvisible := false;
  self.PageControl1.repaint;

  if (self.bNo_Imprime = false) then
  begin
    self.oBtn_Probar_CnnClick(self);
    AHK_FISCAL_LIB.CloseFpctrl();
    if (AHK_FISCAL_LIB.OpenFpctrl(AHK_FISCAL_LIB.cComm_FIS) = True) then
    begin
      self.Verifica_Status_Espe();
      self.Verifica_Error_Imp();

      if (AHK_FISCAL_LIB.CheckFprinter() = True) then
      begin

        messagedlg('Espere al que el impresor termine de imprimir el documento, [pueden ser varias páginas].', mtInformation, [mbOK], 0);

        AHK_FISCAL_LIB.HKA_ShowStatusByName(false, sStatus);
        self.olStatus_Print.Caption := UpperCase(TRIM(sStatus));

        // if (AHK_FISCAL_LIB.Verifica_Z() = True) then
        begin
          self.olStatus_Doc.Caption := 'Imprimiendo reporte de cierre [Z].';
          self.olStatus_Doc.repaint;

          AHK_FISCAL_LIB.Procesa_CierreZ();
          AHK_FISCAL_LIB.Espera_Proceso_IMPF(self.olWaitStop);
          messagedlg('El cierre [Z] (cierre de día), ha sido impreso.' + chr(13) + 'No será posible hacer otro cierre [Z] hasta el día de mañana.', mtWarning, [mbOK], 0);
        end;

      end;

    end;
  end
  else
    sleep(3000);
  self.olStatus_Doc.Caption := 'Proceso de impresión de reporte de cierre [Z], finalizado.';
  self.olStatus_Doc.repaint;

  self.oBtn_CierreX.Enabled := True;
  self.oBtn_Detener.Enabled := True;

  self.oTab_Print.tabvisible := True;
  self.PageControl1.repaint;
  self.oBtn_Minimize.Enabled := True;
  self.oBtn_quit.Enabled := True;

  self.oBtn_CierreZ.Enabled := True;
end;

procedure TfSinco_Main.oBtn_DetenerClick(Sender: TObject);
begin
  self.oBtn_Detener.Enabled := false;
  self.oBtn_CierreX.Enabled := false;
  self.oBtn_CierreZ.Enabled := false;
  self.oBtn_quit.Enabled := false;
  self.oTab_Print.tabvisible := false;
  self.SoporteTcnico1.Enabled := false;
  self.oParam_Impr.Checked := false;
  self.oParam_Serv.Checked := false;
  self.oTab_Sett_01.tabvisible := false;
  self.oTab_Sett_02.tabvisible := false;
  self.PageControl1.repaint;

  if (self.bStop_Flg = false) then
  begin
    if (self.oCk_sw_manual.Checked = True) then
      self.iBusq_Ndata := 0;

    self.bStop_Flg := True;
    self.Cambiar_Indic_Espera('ON');
    self.oBtn_Detener.Caption := 'Reanudar';
    self.olStatus_Doc.Caption := 'Reanudando búsqueda de facturas.';
    self.olWaitStop.Caption := 'Deteniendo servicio.';
    self.olWaitStop.repaint;
  end
  else
  begin
    self.bStop_Flg := false;
    self.Cambiar_Indic_Espera('OFF');
    self.oBtn_Detener.Caption := 'Detener';
    self.bTm_work := false;
    self.oTimeCheck.Enabled := True;
    self.olWaitStop.Caption := 'Reanudando servicio.';
    self.olWaitStop.repaint;
  end;
end;

procedure TfSinco_Main.oBtn_quitClick(Sender: TObject);
begin
  self.TrayIcon1.Visible := false;
  // self.TrayIcon1.Animate := false;
  self.TrayIcon1.CleanupInstance;

  Close;
  if fileexists(self.cFPath) then
    ShellExecute(Handle, 'open', PChar(self.cFPath), PChar(self.cApp), '', SW_SHOWNORMAL)
  else
  begin
    application.terminate;
    System.halt;
  end;

end;

function TfSinco_Main.Verifica_Status_Espe: boolean;
var
  cMyStatus, cMyError: string;
  bResult: boolean;
  I: integer;
  iVerifEsp_Stat_Int, iVerifEsp_Stat_try: integer;
begin
  iVerifEsp_Stat_Int := self.otVerifEsp_Stat_Int.Value * 1000;
  iVerifEsp_Stat_try := self.otVerifEsp_Stat_try.Value;

  bResult := false;
  cMyStatus := '';
  self.olStatus_Print.Caption := cMyStatus;
  self.olStatus_Print.repaint;
  for I := 1 to iVerifEsp_Stat_try do
  begin
    if (AHK_FISCAL_LIB.HKA_ShowStatusEspera(false, cMyStatus) = false) then
    begin
      application.ProcessMessages;
      SleepEx(iVerifEsp_Stat_Int, True);
      application.ProcessMessages;
      bResult := True;
      AHK_FISCAL_LIB.HKA_ShowErrorByName(false, cMyError);
      self.olStatus_Print.Caption := cMyError + ' [' + TRIM(IntToStr(I)) + ' de ' + TRIM(IntToStr(iVerifEsp_Stat_try)) + '] Intentos:..';
      self.olStatus_Print.repaint;
    end
    else
    begin
      bResult := false;
      break;
    end;
  end;
  self.olStatus_Print.Caption := cMyStatus;
  self.olStatus_Print.repaint;
  result := bResult;
end;

function TfSinco_Main.Verifica_Status_Proc: boolean;
var
  cMyStatus: string;
  bResult: boolean;
  I: integer;
  iConsumid, iRestante: extended;
  cMyError: string;
  iVerifFin_Stat_Int, iVerifFin_Stat_try: integer;
begin
  iVerifFin_Stat_Int := self.otVerifFin_Stat_Int.Value * 1000;
  iVerifFin_Stat_try := self.otVerifFin_Stat_try.Value;

  bResult := false;
  cMyStatus := '';
  cMyError := '';
  self.olStatus_Print.Caption := cMyStatus;
  self.olStatus_Print.repaint;
  for I := 1 to iVerifFin_Stat_try do
  begin
    if (AHK_FISCAL_LIB.HKA_ShowStatusProcesando(false, cMyStatus, self.olWaitStop) = True) then
    begin
      application.ProcessMessages;
      SleepEx(iVerifFin_Stat_Int, True);
      application.ProcessMessages;
      bResult := True;
      iConsumid := ((iVerifFin_Stat_Int / 1000) * I);
      iRestante := ((iVerifFin_Stat_Int / 1000) * iVerifFin_Stat_try);
      self.olStatus_Print.Caption := 'Esperando fin de la impresión fiscal [' + TRIM(utiles.FloatToStr3(iConsumid, 0)) + ' de ' + TRIM(utiles.FloatToStr3(iRestante, 3)) +
        ' Segundos:..';
      self.olStatus_Print.repaint;

      AHK_FISCAL_LIB.HKA_ShowErrorByName(false, cMyError);
      self.olStatus_Error.Caption := cMyError;
      if (TRIM(UpperCase(cMyError)) = TRIM(UpperCase('Fin de la entrega del papel.'))) then
        self.olStatus_Error.Color := $000000B3
      else
        self.olStatus_Error.Color := clGreen;
      self.olStatus_Error.repaint;

      // self.Verifica_Error_Imp();
      bResult := True;
    end
    else
    begin
      bResult := false;
      break;
    end;
  end;
  self.olStatus_Print.Caption := cMyStatus;
  self.olStatus_Print.repaint;
  result := bResult;
end;

function TfSinco_Main.Verifica_Error_Imp: boolean;
var
  cMyError: string;
  bResult: boolean;
  I: integer;
  iVerifEsp_Erro_Int, iVerifEsp_Erro_try: integer;
begin
  iVerifEsp_Erro_Int := self.otVerifEsp_Erro_Int.Value * 1000;
  iVerifEsp_Erro_try := self.otVerifEsp_Erro_try.Value;

  cMyError := 'Verificando errores en la impresora...';
  self.olStatus_Error.Caption := cMyError;
  self.olStatus_Error.repaint;
  for I := 1 to iVerifEsp_Erro_try do
  begin
    if (AHK_FISCAL_LIB.HKA_ShowErrorByName(false, cMyError) = True) then
    begin
      application.ProcessMessages;
      SleepEx(iVerifEsp_Erro_Int, True);
      application.ProcessMessages;
      bResult := True;
      self.olStatus_Error.Caption := cMyError + ' [' + TRIM(IntToStr(I)) + ' DE ' + TRIM(IntToStr(iVerifEsp_Erro_try)) + '] Intentos...';
      self.olStatus_Error.Color := $000000B3;
      self.olStatus_Error.repaint;
    end
    else
    begin
      // self.olStatus_Error.Caption := 'Sin errores.';
      self.olStatus_Error.Color := clGreen;
      self.olStatus_Error.repaint;

      bResult := false;
      break;
    end;

    if (TRIM(UpperCase(cMyError)) = TRIM(UpperCase('Fin de la entrega del papel.'))) then
    begin
      self.olStatus_Error.Caption := cMyError + ' [' + TRIM(IntToStr(I)) + ' DE ' + TRIM(IntToStr(iVerifEsp_Erro_try)) + '] Intentos...';
      self.olStatus_Error.Color := $000000B3;
      self.olStatus_Error.repaint;
      bResult := false;
      break;
    end;

  end;
  self.olStatus_Error.Caption := cMyError;
  self.olStatus_Error.repaint;
  result := bResult;
end;

procedure TfSinco_Main.Mostrar_App();
begin
  self.TrayIcon1.Visible := false;
  self.Show();
  self.WindowState := wsNormal;
  application.BringToFront();
end;

function TfSinco_Main.Quita_caracteres(pStrVal: string): string;
var
  cStrVal: string;
  cResult: string;
begin
  cStrVal := TRIM(pStrVal);
  cStrVal := stringreplace(cStrVal, '\r', #13, [rfReplaceAll, rfIgnoreCase]);
  cStrVal := stringreplace(cStrVal, '\n', #10, [rfReplaceAll, rfIgnoreCase]);
  cStrVal := stringreplace(cStrVal, '\t', ' ', [rfReplaceAll, rfIgnoreCase]);
  cStrVal := stringreplace(cStrVal, '\$', '$', [rfReplaceAll, rfIgnoreCase]);
  cStrVal := stringreplace(cStrVal, '\\ ', '\', [rfReplaceAll, rfIgnoreCase]);
  cStrVal := stringreplace(cStrVal, ';', ' ', [rfReplaceAll, rfIgnoreCase]);
  cStrVal := stringreplace(cStrVal, '´', '', [rfReplaceAll, rfIgnoreCase]);
  cStrVal := stringreplace(cStrVal, '/', ' ', [rfReplaceAll, rfIgnoreCase]);
  cStrVal := stringreplace(cStrVal, '\', ' ', [rfReplaceAll, rfIgnoreCase]);
  cStrVal := stringreplace(cStrVal, ':', '', [rfReplaceAll, rfIgnoreCase]);
  cResult := cStrVal;
  result := cResult;
end;

procedure TfSinco_Main.Cargar_Fact;
VAR
  oJsonFull: ISuperObject;
  oJsonTestTx: TStringList;
  oFileStream: TFileStream;
  sJsonStrn: string;
  cOp_id: string;
  sJsonUpdate: string;
  iLen: integer;
  cFle_Json_Demo: string;
begin
  if (self.oCk_Test_Json.Checked = True) then
  begin
    self.olStatus_Doc.Caption := 'Cargando JSON de pruebas [data_test.json].';
    self.olStatus_Doc.repaint;

    cFle_Json_Demo := ExtractFilePath(application.ExeName) + 'data_test.json';
    if fileexists(cFle_Json_Demo) then
    begin
      oJsonTestTx := TStringList.Create;
      oFileStream := TFileStream.Create(cFle_Json_Demo, fmShareDenyNone);
      oJsonTestTx.LoadFromStream(oFileStream);
      if (TRIM(oJsonTestTx.Text) = '') then
      begin
        self.olStatus_Doc.Caption := 'Archivo JSON [data_test.json], vacío.';
        self.olStatus_Doc.repaint;
      end;
      freeandnil(oFileStream);
    end;
  end;

  // self.Enabled := False;
  self.verifica_stop();

  self.olStatus_Print.Caption := 'En espera del estatus de impresora.';
  self.olStatus_Print.repaint;

  self.olStatus_Error.Caption := 'Sin errores.';
  self.olStatus_Error.repaint;

  self.oBtn_Probar_CnnClick(self);
  self.olStatus_Print.Caption := TRIM(self.olStatus_Conn.Caption);
  self.olStatus_Print.repaint;

  if (TRIM(self.olStatus_Conn.Caption) = UpperCase('No hay conexión con la impresora fiscal')) then
  begin
    // self.Enabled := True;
    oJsonFull := nil;
    EXIT;
  end;
  if (self.oCk_Test_Json.Checked = True) then
  begin
    if (oJsonTestTx <> nil) then
    begin
      if (TRIM(oJsonTestTx.Text) <> '') then
        self.oHttp_Result2.Text := oJsonTestTx.Text;
      freeandnil(oJsonTestTx);
    end;
  end
  else
    self.oBtn_Sol_DataClick(self);

  sJsonStrn := self.BestFit(self.oHttp_Result2.Text);
  sJsonStrn := stringreplace(sJsonStrn, '\r', ' ', [rfReplaceAll]);
  sJsonStrn := stringreplace(sJsonStrn, #$D, '', [rfReplaceAll]);
  sJsonStrn := stringreplace(sJsonStrn, #$A, '', [rfReplaceAll]);

  oJsonFull := SO(sJsonStrn);
  if ((not Assigned(oJsonFull)) or (TRIM(self.oHttp_Result2.Text) = '{"print_list":{"fact_cab":[],"fact_det":{}}}')) then
  begin
    self.olStatus_Doc.Caption := 'En espera de nuevos documentos.';
    self.olStatus_Doc.repaint;
    // Json no valido
    // self.Enabled := True;
    oJsonFull := nil;
    EXIT;
  end;

  iLen := oJsonFull['print_list'].AsArray.Length;
  // iLen := oJsonFull['print_list.fact_cab'].AsArray.Length;
  if (iLen = 0) then
  begin
    self.olStatus_Doc.Caption := 'En espera de nuevos documentos.';
    self.olStatus_Doc.repaint;
    // Json no valido
    // self.Enabled := True;
    oJsonFull := nil;
    EXIT;
  end;

  self.oMem_Fac.EmptyTable;
  self.oMem_Det.EmptyTable;

  if (self.CargaDataFact(oJsonFull, oMem_Fac) <= 0) then
  begin
    DialogBoxAutoClose('Alerta', 'Se detectó un error en la descripción de los productos del documento.' + #13 +
      'Se cancelará la impresión de nuevos documentos por error de la impresora fiscal.', 10);
    // ShowMessage('Se detectó un error en la descripción de los productos del documento.' + #13 + 'Se cancelará la impresión de nuevos documentos por error de la impresora fiscal.');
    self.cJsonUpdate := '';
    self.cJsonUpdate := self.cJsonUpdate + '{"op_emp_id":"' + TRIM(self.oHttp_Empr.Text) + '",';
    self.cJsonUpdate := self.cJsonUpdate + '"op_suc_id":"' + TRIM(self.oHttp_Sucu.Text) + '",';
    self.cJsonUpdate := self.cJsonUpdate + '"op_num_corre": "",';
    self.cJsonUpdate := self.cJsonUpdate + '"op_num_ncf": "",';
    self.cJsonUpdate := self.cJsonUpdate + '"op_num_nco": "",';
    self.cJsonUpdate := self.cJsonUpdate + '"op_numserie_if": "' + TRIM(AHK_FISCAL_LIB.cSerieIMF) + '",';
    self.cJsonUpdate := self.cJsonUpdate + '"op_id":0,';
    self.cJsonUpdate := self.cJsonUpdate + '"op_status": "1",';
    self.cJsonUpdate := self.cJsonUpdate + '"op_status_det":"Error de cabecera de factura",';
    self.cJsonUpdate := self.cJsonUpdate + '"op_test":"' + iif(self.bTest_Mode = True, '1', '0') + '"}';
    self.oBtn_Env_DataClick(self);
    oJsonFull := nil;
    EXIT;
  end;

  self.oMem_Fac.Filter := 'op_tipo=2';
  self.oMem_Fac.Filtered := false;
  self.oMem_Fac.SortOrder := 'op_id';
  self.oMem_Fac.First;

  self.verifica_stop();
  AHK_FISCAL_LIB.CloseFpctrl;
  AHK_FISCAL_LIB.OpenFpctrl(AHK_FISCAL_LIB.cComm_FIS);

  if (self.oMem_Fac.RecordCount > 0) then
  begin
    self.Mostrar_App();
  end;

  self.oMem_Fac.First;
  while NOT(self.oMem_Fac.Eof) do
  Begin
    self.verifica_stop();
    self.bSendOk := 0;
    cOp_id := self.oMem_Fac.FieldByName('op_id').AsString;

    self.olStatus_Doc.Caption := 'Imprimiendo cliente:[' + self.oMem_Fac.FieldByName('op_nom_cliente').AsString + '], documento:[' + self.oMem_Fac.FieldByName('op_num_corre')
      .AsString + '], valor:[' + utiles.FloatToStr3(self.oMem_Fac.FieldByName('op_total').AsFloat, 3) + ']';
    self.olStatus_Doc.repaint;

    if (self.CargaDataDet(oJsonFull, oMem_Det, cOp_id) <= 0) then
    begin
      DialogBoxAutoClose('Alerta', 'Se detectó un error en la descripción de los productos del documento.' + #13 +
        'Se cancelará la impresión de nuevos documentos por error de la impresora fiscal.', 10);
      // ShowMessage('Se detectó un error en la descripción de los productos del documento.' + #13 + 'Se cancelará la impresión de nuevos documentos por error de la impresora fiscal.');
      self.cJsonUpdate := '';
      self.cJsonUpdate := self.cJsonUpdate + '{"op_emp_id":"' + TRIM(self.oHttp_Empr.Text) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_suc_id":"' + TRIM(self.oHttp_Sucu.Text) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_corre": "' + TRIM(self.oMem_Fac.FieldByName('op_num_corre').AsString) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_ncf": "",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_nco": "",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_numserie_if": "' + TRIM(AHK_FISCAL_LIB.cSerieIMF) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_id":' + TRIM(cOp_id) + ',';
      self.cJsonUpdate := self.cJsonUpdate + '"op_status": "1",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_status_det": "Error de detalle de factura.",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_test":"' + iif(self.bTest_Mode = True, '1', '0') + '"}';
      self.oBtn_Env_DataClick(self);
      oJsonFull := nil;
      EXIT;
    end;
    { ------------------VERIFICASION DE ERRORES---------------------------- }

    if (self.Verifica_Status_Espe() = True) then
    begin
      DialogBoxAutoClose('Alerta', 'Se cancelará la impresión de del documento. Se sobrepaso el límite de espera para impresión (15 segundos).', 10);
      // ShowMessage('Se cancelará la impresión de del documento. Se sobrepaso el límite de espera para impresión (15 segundos).');
      // self.Enabled := True;

      self.cJsonUpdate := '';
      self.cJsonUpdate := self.cJsonUpdate + '{"op_emp_id":"' + TRIM(self.oHttp_Empr.Text) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_suc_id":"' + TRIM(self.oHttp_Sucu.Text) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_corre": "' + TRIM(AHK_FISCAL_LIB.cOFG_Num_corre) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_ncf": "",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_nco": "",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_numserie_if": "' + TRIM(AHK_FISCAL_LIB.cSerieIMF) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_id":' + TRIM(cOp_id) + ',';
      self.cJsonUpdate := self.cJsonUpdate + '"op_status": "1",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_status_det": "Se cancelará la impresión de del documento. Se sobrepaso el límite de espera para impresión (15 segundos).",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_test":"' + iif(self.bTest_Mode = True, '1', '0') + '"}';
      self.oBtn_Env_DataClick(self);

      oJsonFull := nil;
      EXIT;
    end;
    { --------------------------------------------------------------------- }

    { ------------------VERIFICASION DE ERRORES---------------------------- }
    if (self.Verifica_Error_Imp() = True) then
    begin
      DialogBoxAutoClose('Alerta', 'Se cancelará la impresión del documento por error de la impresora fiscal.', 10);
      // ShowMessage('Se cancelará la impresión del documento por error de la impresora fiscal.');
      // self.Enabled := True;

      self.cJsonUpdate := '';
      self.cJsonUpdate := self.cJsonUpdate + '{"op_emp_id":"' + TRIM(self.oHttp_Empr.Text) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_suc_id":"' + TRIM(self.oHttp_Sucu.Text) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_corre": "' + TRIM(AHK_FISCAL_LIB.cOFG_Num_corre) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_ncf": "",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_nco": "",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_numserie_if": "' + TRIM(AHK_FISCAL_LIB.cSerieIMF) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_id":' + TRIM(cOp_id) + ',';
      self.cJsonUpdate := self.cJsonUpdate + '"op_status": "1",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_status_det": "Se cancelará la impresión del documento por error de la impresora fiscal.",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_test":"' + iif(self.bTest_Mode = True, '1', '0') + '"}';
      self.oBtn_Env_DataClick(self);

      oJsonFull := nil;
      EXIT;
    end;
    { --------------------------------------------------------------------- }

    { ------------------IMPRESION DEL DOCUEMNTO---------------------------- }
    if self.print_doc_fiscal(cOp_id) = false then
    begin
      // self.Enabled := True;
      oJsonFull := nil;
      EXIT;
    end;

    self.cJsonUpdate := '';

    if (self.Verifica_Status_Espe() = false) then
    begin
    end;

    if (self.Verifica_Error_Imp() = false) then
    begin
      self.cJsonUpdate := '';
      self.cJsonUpdate := self.cJsonUpdate + '{"op_emp_id":"' + TRIM(self.oHttp_Empr.Text) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_suc_id":"' + TRIM(self.oHttp_Sucu.Text) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_corre": "' + TRIM(AHK_FISCAL_LIB.cOFG_Num_corre) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_ncf": "' + AHK_FISCAL_LIB.cOFG_Num_NCF + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_nco": "' + AHK_FISCAL_LIB.cOFG_Num_COO + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_numserie_if": "' + TRIM(AHK_FISCAL_LIB.cSerieIMF) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_id":' + TRIM(cOp_id) + ',';
      self.cJsonUpdate := self.cJsonUpdate + '"op_status": "0",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_status_det": "OK",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_test":"' + iif(self.bTest_Mode = True, '1', '0') + '"}';

      self.olStatus_Print.Caption := 'Actualizando status de falla en la nube.';
      self.olStatus_Print.repaint;

    end
    ELSE
    begin
      self.cJsonUpdate := '';
      self.cJsonUpdate := self.cJsonUpdate + '{"op_emp_id":"' + TRIM(self.oHttp_Empr.Text) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_suc_id":"' + TRIM(self.oHttp_Sucu.Text) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_corre": "' + TRIM(AHK_FISCAL_LIB.cOFG_Num_corre) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_ncf": "",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_nco": "",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_numserie_if": "' + TRIM(AHK_FISCAL_LIB.cSerieIMF) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_id":' + TRIM(cOp_id) + ',';
      self.cJsonUpdate := self.cJsonUpdate + '"op_status": "1",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_status_det": "Error de la impresora fiscal.",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_test":"' + iif(self.bTest_Mode = True, '1', '0') + '"}';

      self.olStatus_Print.Caption := 'Actualizando estatus de [procesado] en la nube.';
      self.olStatus_Print.repaint;
    end;
    self.oBtn_Env_DataClick(self);

    if (self.bSendOk = 1) then
    begin

    end
    ELSE if (self.bSendOk = 2) then
    begin
      // DialogBoxAutoClose('Alerta','El documento se entregó al servidor y respondió con error.',10);
      // ShowMessage('El documento se entregó al servidor y respondió con error.');
      oJsonFull := nil;
      EXIT;
    end
    else if (self.bSendOk = -1) then
    begin
      DialogBoxAutoClose('Alerta', 'No es posible establecer contacto con la nube del sistema para actualizar la factura.', 10);
      // ShowMessage('No es posible establecer contacto con la nube del sistema para actualizar la factura.');
      oJsonFull := nil;
      EXIT;
    end;

    self.oMem_Fac.Next;
  end;
  AHK_FISCAL_LIB.CloseFpctrl;
  self.verifica_stop();

  self.oMem_Fac.EmptyTable;
  self.oMem_Det.EmptyTable;

  self.olStatus_Doc.Caption := 'En espera de nuevos documentos.';
  self.olStatus_Doc.repaint;

  self.olStatus_Error.Caption := 'Sin errores.';
  self.olStatus_Error.repaint;

  self.olStatus_Print.Caption := 'En espera del estatus de impresora.';
  self.olStatus_Print.repaint;
  // self.Enabled := True;
  oJsonFull := nil;
end;

function TfSinco_Main.Try_Open_Port(): boolean;
var
  bResult: boolean;
begin
  AHK_FISCAL_LIB.CloseFpctrl();
  AHK_FISCAL_LIB.cComm_FIS := TRIM(self.oLst_COM_Fiscal.Text);
  bResult := AHK_FISCAL_LIB.OpenFpctrl(AHK_FISCAL_LIB.cComm_FIS);
  if (bResult = false) then
  begin
    self.olStatus_Conn.Font.Color := clred;
    self.olStatus_Conn.Caption := 'No hay conexión con la impresora';
    self.oBtn_Status.Enabled := false;
  end;
  result := bResult
end;

procedure TfSinco_Main.Cambiar_Semaforo(cFlag: string);
begin
  if (cFlag = 'R') then
  begin
    self.oImg_Semaf.Picture.LoadFromFile(self.cRes_Path + '\rojo.png');
    self.oImg_Semaf.repaint;
  end
  else if (cFlag = 'V') then
  begin
    self.oImg_Semaf.Picture.LoadFromFile(self.cRes_Path + '\verde.png');
    self.oImg_Semaf.repaint;
  end
  else if (cFlag = 'A') then
  begin
    self.oImg_Semaf.Picture.LoadFromFile(self.cRes_Path + '\amarillo.png');
    self.oImg_Semaf.repaint;
  end
  else if (cFlag = 'S') then
  begin
    self.oImg_Semaf.Picture.LoadFromFile(self.cRes_Path + '\icons8_stop_sign_32.png');
    self.oImg_Semaf.repaint;
  end;

end;

procedure TfSinco_Main.Cambiar_Indic_Espera(cFlag: string);
begin
  if (cFlag = 'ON') then
  begin
    self.oWait_Image.Picture.LoadFromFile(self.cRes_Path + '\stopwatch_32.png');
    self.oWait_Image.Visible := True;
    self.oWait_Image.repaint;
    sleep(500);

  end
  else if (cFlag = 'OFF') then
  begin
    self.oWait_Image.Visible := false;
    self.oWait_Image.repaint;
  end;
end;

procedure TfSinco_Main.DialogBoxAutoClose(const ACaption, APrompt: string; DuracaoEmSegundos: integer);
var
  Form: TForm;
  Prompt: TLabel;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: integer;
  nX, Lines: integer;

  function GetAveCharSize(Canvas: TCanvas): TPoint;
  var
    I: integer;
    Buffer: array [0 .. 51] of Char;
  begin
    for I := 0 to 25 do
      Buffer[I] := chr(I + ord('A'));
    for I := 0 to 25 do
      Buffer[I + 26] := chr(I + ord('a'));
    GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(result));
    result.X := result.X div 52;
  end;

begin
  Form := TForm.Create(application);
  Lines := 0;

  For nX := 1 to Length(APrompt) do
    if APrompt[nX] = #13 then
      inc(Lines);

  with Form do
    try
      Font.Name := 'Arial'; // mcg
      Font.Size := 10; // mcg
      Font.Style := [fsBold];
      Canvas.Font := Font;
      DialogUnits := GetAveCharSize(Canvas);
      // BorderStyle    := bsDialog;
      BorderStyle := bsToolWindow;
      FormStyle := fsStayOnTop;
      BorderIcons := [];
      Caption := ACaption;
      ClientWidth := MulDiv(Screen.Width div 4, DialogUnits.X, 4);
      ClientHeight := MulDiv(23 + (Lines * 10), DialogUnits.Y, 8);
      Position := poScreenCenter;

      Prompt := TLabel.Create(Form);
      with Prompt do
      begin
        Parent := Form;
        AutoSize := True;
        Left := MulDiv(8, DialogUnits.X, 4);
        Top := MulDiv(8, DialogUnits.Y, 8);
        Caption := APrompt;
      end;

      Form.Width := Prompt.Width + Prompt.Left + 50; // mcg fix

      Show;
      application.ProcessMessages;
    finally
      sleep(DuracaoEmSegundos * 1000);
      Form.Free;
    end;
end;

procedure TfSinco_Main.Desactiva_Botones(iOption: integer = 0);
begin
  if ((iOption = 0) or (iOption = 1)) then
  begin
    self.oBtn_Detener.Enabled := false;
    self.oBtn_Detener.repaint;
  end;

  if ((iOption = 0) or (iOption = 2)) then
  begin
    self.oBtn_CierreX.Enabled := false;
    self.oBtn_CierreX.repaint;
    self.oBtn_CierreZ.Enabled := false;
    self.oBtn_CierreZ.repaint;
  end;

  if ((iOption = 0) or (iOption = 3)) then
  begin
    if (self.oTab_Sett_01.tabvisible = True) then
    begin
      self.oTab_Sett_01.Enabled := false;
      self.oTab_Sett_01.repaint;
    end;
    if (self.oTab_Sett_02.tabvisible = True) then
    begin
      self.oTab_Sett_02.Enabled := false;
      self.oTab_Sett_02.repaint;
    end;
  end;
  if ((iOption = 0) or (iOption = 4)) then
  begin
    self.SoporteTcnico1.Enabled := false;
  end;
  if ((iOption = 0) or (iOption = 5)) then
    self.oBtn_Minimize.Enabled := false;
  if ((iOption = 0) or (iOption = 6)) then
    self.oBtn_quit.Enabled := false;
end;

procedure TfSinco_Main.Activa_Botones(iOption: integer = 0);
begin
  if ((iOption = 0) or (iOption = 1)) then
  begin
    self.oBtn_Detener.Enabled := True;
    self.oBtn_Detener.repaint;
  end;

  if ((iOption = 0) or (iOption = 2)) then
  begin
    self.oBtn_CierreX.Enabled := True;
    self.oBtn_CierreX.repaint;
    self.oBtn_CierreZ.Enabled := True;
    self.oBtn_CierreZ.repaint;
  end;

  if ((iOption = 0) or (iOption = 3)) then
  begin
    if (self.oTab_Sett_01.tabvisible = True) then
    begin
      self.oTab_Sett_01.Enabled := True;
      self.oTab_Sett_01.repaint;
    end;
    if (self.oTab_Sett_02.tabvisible = True) then
    begin
      self.oTab_Sett_02.Enabled := True;
      self.oTab_Sett_02.repaint;
    end;
  end;

  if ((iOption = 0) or (iOption = 4)) then
  begin
    // self.SoporteTcnico1.Enabled := True;
  end;
  if ((iOption = 0) or (iOption = 5)) then
    self.oBtn_Minimize.Enabled := True;
  if ((iOption = 0) or (iOption = 6)) then
    self.oBtn_quit.Enabled := True;
end;

procedure TfSinco_Main.ParseURL(const url: AnsiString; var Scheme, user, pass, host, port, path, extra: AnsiString);
var
  resto, tmp: AnsiString;
begin
  {
    http://login:password@somehost.somedomain.com:8080/some_path/something_else.html?param1=val&param2=val#nose
    \__/   \___/ \______/ \_____________________/ \__/\____________________________/ \___________________/ \__/
    |       |      |               |               |                |                        |              |
    Scheme Username Password       Host            Port             Path                    Query         Fragment
  }

  Scheme := '';
  user := '';
  pass := '';
  host := '';
  port := '';
  path := '';
  extra := '';

  resto := url;
  Scheme := COPY(resto, 1, pos('://', resto) - 1);
  resto := COPY(resto, pos('://', resto) + Length('://'), maxint);

  tmp := COPY(resto, 1, pos('@', resto) - 1);
  if tmp <> '' then
  begin
    // tiene user y pass
    user := COPY(tmp, 1, pos(':', tmp) - 1);
    pass := COPY(tmp, pos(':', tmp) + 1, maxint);
    resto := COPY(resto, pos('@', resto) + 1, maxint);
  end;

  tmp := COPY(resto, 1, pos(':', resto) - 1);
  if tmp <> '' then
  begin
    // trae puerto
    host := tmp;
    port := COPY(resto, pos(':', resto) + 1, pos('/', resto) - 1);
    resto := COPY(resto, pos('/', resto) + 1, maxint);
  end
  else
  begin
    // no trae puerto
    host := COPY(resto, 1, pos('/', resto) - 1);
    resto := COPY(resto, pos('/', resto) + 1, maxint);
  end;

  tmp := COPY(resto, 1, pos('?', resto) - 1);
  if tmp <> '' then
  begin
    // trae param
    path := tmp;
    extra := COPY(resto, pos('?', resto) + 1, maxint);

  end
  else
  begin
    path := resto;
    extra := '';
  end;

end;

Function TfSinco_Main.CheckUrl(pUrl: string; bShowError: boolean): integer;
var
  oHttp: variant;
begin
  self.cHttp_Error := '';
  oHttp := createoleobject('WinHttp.WinHttpRequest.5.1');
  oHttp.Open('GET', pUrl, false);
  oHttp.send;
  self.cHttp_Error := IntToStr(oHttp.Status) + ' ' + oHttp.StatusText;

  if ((oHttp.Status <> 200) and (bShowError = True)) then
  begin
    ShowMessage(IntToStr(oHttp.Status) + ' ' + oHttp.StatusText);
  end;
  result := oHttp.Status
end;

function TfSinco_Main.Build_url_get(): string;
var
  cUrl_Bas: string;
  cAPI_Get: string;
  cparEmpr: string;
  cParSucu: string;
  cUrl_Str: string;
begin
  cUrl_Bas := TRIM(self.oHttp_Server.Text);
  cAPI_Get := TRIM(self.oHttp_API_Get.Text);
  cparEmpr := TRIM(self.oHttp_Empr.Text);
  cParSucu := TRIM(self.oHttp_Sucu.Text);

  // cPrepUrl := cUrlBase + '/DocumentosPendientes/' + cparEmpr + '/' + cParSucu + '?test=' + utiles.iif(self.oCk_Test_Mode.Checked = True, '1', '0');
  cUrl_Str := '';
  cUrl_Str := cUrl_Str + cUrl_Bas + '/' + cAPI_Get;
  cUrl_Str := cUrl_Str + utiles.iif(TRIM(cparEmpr) <> '', '/' + cparEmpr, '');
  cUrl_Str := cUrl_Str + utiles.iif(TRIM(cParSucu) <> '', '/' + cParSucu, '');
  cUrl_Str := cUrl_Str + '?test=' + utiles.iif(self.oCk_Test_Mode.Checked = True, '1', '0');
  utiles.LogToFile('URL GET:' + cUrl_Str, ExtractFilePath(application.ExeName) + '\JSON_GET.LOG');
  result := cUrl_Str;
end;

function TfSinco_Main.Build_url_put(): string;
var
  cUrl_Bas: string;
  cAPI_Put: string;
  cUrl_Str: string;
begin
  cUrl_Bas := TRIM(self.oHttp_Server.Text);
  cAPI_Put := TRIM(self.oHttp_API_Put.Text);
  cUrl_Str := cUrl_Bas + '/' + cAPI_Put;
  utiles.LogToFile('URL PUT:' + cUrl_Str, ExtractFilePath(application.ExeName) + '\JSON_PUT.LOG');

  result := cUrl_Str;
end;

end.
