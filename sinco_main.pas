﻿unit sinco_main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.JSON,
  System.Classes, Vcl.Graphics, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.AppEvnts, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls,
  DBCtrlsEh, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh,
  ZAbstractTable, ZDataset, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZAbstractConnection, ZConnection,
  AHK_FISCAL_LIB,
  REST.Types, REST.Client, REST.Authenticator.Simple, REST.Authenticator.OAuth,
  Data.Bind.Components, Data.Bind.ObjectScope, SynEditHighlighter, SynHighlighterJSON, SynEdit, SynMemo,
  SuperObject, MemTableDataEh, MemTableEh, Vcl.Menus, IdIntercept, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent, Vcl.Imaging.pngimage, PngBitBtn,
  Vcl.BaseImageCollection, Vcl.ImageCollection, System.ImageList, Vcl.ImgList,
  dxGDIPlusClasses;

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
    oObservacion: TMemo;
    Panel1: TPanel;
    Label35: TLabel;
    Label37: TLabel;
    Label36: TLabel;
    oBtn_Probar_Cnn: TBitBtn;
    olStatus_Conn: TLabel;
    oBtn_Status: TBitBtn;
    oMem_TelCte: TMemo;
    oMem_NomArt: TMemo;
    oMem_DirCte: TMemo;
    oMem_RucCte: TMemo;
    oMem_NomCte: TMemo;
    oLst_COM_Fiscal: TDBComboBoxEh;
    Panel2: TPanel;
    oBtn_Save: TBitBtn;
    Label2: TLabel;
    oTimeVerif: TDBNumberEditEh;
    Label3: TLabel;
    oTimeCheck: TTimer;
    oTab_Sett_02: TTabSheet;
    SynJSONSyn1: TSynJSONSyn;
    PageControl2: TPageControl;
    TabSheet7: TTabSheet;
    oHttp_Result2: TSynMemo;
    oBtn_Sol_Data: TBitBtn;
    Label6: TLabel;
    oHttp_Server_Data: TEdit;
    RESTClient2: TRESTClient;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    ZConnection1: TZConnection;
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
    oBtn_Env_Data: TBitBtn;
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
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    otVerifFin_Stat_Int: TDBNumberEditEh;
    Label20: TLabel;
    Label21: TLabel;
    otVerifFin_Stat_try: TDBNumberEditEh;
    Label22: TLabel;
    Label23: TLabel;
    otVerifFin_Erro_Int: TDBNumberEditEh;
    Label24: TLabel;
    Label25: TLabel;
    otVerifFin_Erro_try: TDBNumberEditEh;
    Label26: TLabel;
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
    oHttp_Server_Empr: TEdit;
    Label4: TLabel;
    oHttp_Server_Sucu: TEdit;
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
    TabSheet3: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    Shape4: TShape;
    Shape3: TShape;
    orFec_Fin: TDBDateTimeEditEh;
    orFec_Ini: TDBDateTimeEditEh;
    orBtn_Doit_RFec: TPngBitBtn;
    TabSheet6: TTabSheet;
    Label27: TLabel;
    Label29: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    orBtn_Doit_RDoc: TPngBitBtn;
    orSec_Ini: TDBNumberEditEh;
    orSec_Fin: TDBNumberEditEh;
    oBtn_quit: TPngBitBtn;
    oBtn_Minimize: TPngBitBtn;
    oBtn_Print: TPngBitBtn;
    oBtn_CierreX: TPngBitBtn;
    oBtn_CierreZ: TPngBitBtn;
    oBtn_Cierres: TPngBitBtn;
    oTm_Wait_For_End_Trans: TTimer;
    oWait_Image: TImage;
    oBtn_manual: TPngBitBtn;
    Label30: TLabel;
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
    procedure oBtn_CierresClick(Sender: TObject);
    procedure Cargar_Fact;
    procedure oBtn_PrintClick(Sender: TObject);
    procedure oTm_Wait_For_End_TransTimer(Sender: TObject);
    procedure Hacer_Cierres;
    procedure orBtn_Doit_RDocClick(Sender: TObject);
    procedure oBtn_manualClick(Sender: TObject);
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
  TrayIcon1.Animate := True;
  TrayIcon1.ShowBalloonHint;
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
      ObjectFindClose(oItemsIter);
    end;
  except
    begin
      if (opTmpDb.State in [dSinsert, dsEdit]) then
      begin
        opTmpDb.cancel;
      end;
      oPrn_lists := nil;
      oFact_cabs := nil;
      utiles.LogToFile('ERROR EN LA ESTRUCTURA DEL DOCUMENTO (CABECERA) [' + cValue + ']', ExtractFilePath(application.ExeName) + '\JSON_GET.LOG');
      result := -1;
      EXIT;
    end;
  end;
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
  oItem: ISuperObject;
  oNode, oPrn_lists: ISuperObject;
  oFact_dets: ISuperObject;
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
        ObjectFindClose(oItemsIter);
      end;
    end;
  except
    begin
      if (opTmpDb.State in [dSinsert, dsEdit]) then
      begin
        opTmpDb.cancel;
      end;
      oPrn_lists := nil;
      oFact_dets := nil;
      utiles.LogToFile('ERROR EN LA ESTRUCTURA DEL DOCUMENTO (DETALLE) [' + cValue + ']', ExtractFilePath(application.ExeName) + '\JSON_GET.LOG');
      result := -1;
      EXIT;
    end;
  end;

  oPrn_lists := nil;
  oFact_dets := nil;
  oItem := nil;
  oNode := nil;
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
  jValue: TJSONValue;
  iStatusCode: integer;
  cPrepUrl: string;
  cUrlBase: string;
  cparEmpr: string;
  cParSucu: string;
  iCodigo: integer;
  cDetall: string;
begin
  if (TRIM(self.cJsonUpdate) = '') then
  begin
    ShowMessage('JSON DE ACTUALZIACION VACIO.');
    EXIT;
  end;
  self.oBtn_Sol_Data.Enabled := false;

  // self.cJsonUpdate :='{"op_emp_id": "1","op_suc_id": "0","op_num_corre": "2002002010","op_num_ncf": "00000362","op_num_nco": "00000362","op_numserie_if": "TFDM110000835","op_id": 411538,"op_status": "1","op_status_det" : "Todo Bien","op_test" : 1}';

  cUrlBase := TRIM(self.oHttp_Server_Data.Text);
  cparEmpr := TRIM(self.oHttp_Server_Empr.Text);
  cParSucu := TRIM(self.oHttp_Server_Sucu.Text);
  cPrepUrl := cUrlBase + '/DocumentosImpresos';

  TRY
    self.RESTClient3.BaseURL := TRIM(cPrepUrl);
    self.RESTClient3.Params.Clear;

    self.RESTRequest3.Method := REST.Types.rmPOST;
    self.RESTRequest3.Params.Clear;
    // self.RESTRequest3.Params.AddItem('body', trim(self.cJsonUpdate), TRESTRequestParameterKind.pkREQUESTBODY, [poDoNotEncode], TRESTContentType.ctAPPLICATION_JSON);
    self.RESTRequest3.Params.AddItem('', TRIM(self.cJsonUpdate), TRESTRequestParameterKind.pkREQUESTBODY, [poDoNotEncode], TRESTContentType.ctAPPLICATION_JSON);
    utiles.LogToFile(TRIM(self.cJsonUpdate), ExtractFilePath(application.ExeName) + '\JSON_SEND.LOG');

    self.RESTRequest3.Execute;
    jValue := self.RESTResponse3.JsonValue;
    self.oHttp_Result2.Text := jValue.ToString;
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

procedure TfSinco_Main.oBtn_manualClick(Sender: TObject);
begin
  if (self.oImg_Semaf.tag = 1) then
  begin
    self.oImg_Semaf.tag := 0;

    self.oBtn_manual.Caption := 'IR a Modo Manual';
    self.oBtn_Print.Enabled := false;
    self.iShoiceAct := 4;
    // 4=MODO AUTOMATICO
    self.oTm_Wait_For_End_Trans.Enabled := True;
  end
  ELSE
  begin
    self.oImg_Semaf.tag := 1;

    self.oBtn_manual.Caption := 'IR a Modo Automático';
    self.oBtn_Print.Enabled := True;
    self.iShoiceAct := 5;
    // 5=MODO MANUAL
    self.oTm_Wait_For_End_Trans.Enabled := True;
  end;
end;

procedure TfSinco_Main.oBtn_MinimizeClick(Sender: TObject);
begin
  // Minimize application instead of closing
  application.Minimize;
  // Remove the main form from the Task bar
  self.Hide;
end;

procedure TfSinco_Main.oBtn_PrintClick(Sender: TObject);
begin
  self.iShoiceAct := 1;
  self.oTm_Wait_For_End_Trans.Enabled := True;
end;

procedure TfSinco_Main.oBtn_Probar_CnnClick(Sender: TObject);
begin
  self.Label37.Caption := 'Serial  :';
  self.Label36.Caption := 'NINGUNO';
  self.olStatus_Conn.Font.Color := clGreen;
  self.olStatus_Conn.Caption := '';
  // self.oBtn_CierreX.Enabled := False;
  // self.oBtn_CierreZ.Enabled := False;
  self.cSerial_Working := '';
  AHK_FISCAL_LIB.cComm_FIS := TRIM(self.oLst_COM_Fiscal.Text);
  self.oBtn_Status.Enabled := false;

  AHK_FISCAL_LIB.CloseFpctrl();
  if (AHK_FISCAL_LIB.OpenFpctrl(AHK_FISCAL_LIB.cComm_FIS) = True) then
  begin
    // self.cSerial_Working := AHK_FISCAL_LIB.Recupera_Numero_Serie;
    // self.Label36.Caption := self.cSerial_Working;
    self.olStatus_Conn.Font.Color := clGreen;
    self.olStatus_Conn.Caption := 'Conexión éxitosa';
    // self.oBtn_CierreX.Enabled := True;
    // self.oBtn_CierreZ.Enabled := True;
    self.Label37.Caption := 'Serial: ';
    self.oBtn_Status.Enabled := True;
    // self.oBtn_CierreX.Enabled := True;
    // self.oBtn_CierreZ.Enabled := True;
  end
  else
  begin
    self.cSerial_Working := '';
    self.olStatus_Conn.Font.Color := clred;
    self.olStatus_Conn.Caption := 'No hay conexión con la impresora';
    // self.oBtn_CierreX.Enabled := False;
    // self.oBtn_CierreZ.Enabled := False;
    self.oBtn_Status.Enabled := false;
    // self.oBtn_CierreX.Enabled := False;
    // self.oBtn_CierreZ.Enabled := False;
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
  utiles.WriteIniFacilValue('TIMER_AFTER_PRINT', 'TIME_ERROR_SECONDS', 'I', self.otVerifFin_Erro_Int.Value);
  utiles.WriteIniFacilValue('TIMER_AFTER_PRINT', 'TIME_ERROR_INTENTS', 'I', self.otVerifFin_Erro_try.Value);

  utiles.WriteIniFacilValue('HTTP_SERVER_DATA', 'HOST_URL', 'S', self.oHttp_Server_Data.Text);
  utiles.WriteIniFacilValue('HTTP_SERVER_DATA', 'JSONDATA', 'S', '');

  utiles.WriteIniFacilValue('GENERAL', 'TEST_MODE', 'B', self.bTest_Mode);
  utiles.WriteIniFacilValue('GENERAL', 'TEST_JSON', 'B', self.oCk_Test_Json.Checked);

  ShowMessage('LOS DATOS DE LA CONFIGURACION HAN SIDO ALMACENADOS.');
End;

procedure TfSinco_Main.oBtn_Sol_DataClick(Sender: TObject);
var
  jValue: TJSONValue;
  cJsonResult: Widestring;
  FMessage: string;
  cPrepUrl: string;
  cUrlBase: string;
  cparEmpr: string;
  cParSucu: string;
  cValues: string;
begin
  FMessage := '';
  self.Clear_Objects();

  self.oBtn_Sol_Data.Enabled := false;
  cUrlBase := TRIM(self.oHttp_Server_Data.Text);
  cparEmpr := TRIM(self.oHttp_Server_Empr.Text);
  cParSucu := TRIM(self.oHttp_Server_Sucu.Text);

  cPrepUrl := cUrlBase + '/DocumentosPendientes/' + cparEmpr + '/' + cParSucu + '?test=' + utiles.iif(self.oCk_Test_Mode.Checked = True, '1', '0');
  try
    self.RESTClient2.BaseURL := cPrepUrl;
    self.RESTRequest2.Params.Clear;
    self.RESTRequest2.Execute;
    jValue := self.RESTResponse2.JsonValue;
    cJsonResult := jValue.ToString;
  except
    begin
      utiles.LogToFile('POST-DATA: ' + IntToStr(RESTResponse2.StatusCode) + ':' + RESTResponse2.StatusText, ExtractFilePath(application.ExeName) + '\HTTP_ERROR.LOG');
      cJsonResult := '{"print_list":{"fact_cabs":[],"fact_dets":{}}}';
    end;
  end;

  self.oHttp_Result2.Text := cJsonResult;
  if not((TRIM(cJsonResult) = '{"print_list":{"fact_cabs":[],"fact_dets":{}}}') or (TRIM(cJsonResult) = '{"print_list":[]}')) then
  begin
    utiles.LogToFile(cJsonResult, ExtractFilePath(application.ExeName) + '\JSON_GET.LOG');
  end;

  self.oHttp_Result2.Refresh;
  self.oBtn_Sol_Data.Enabled := True;
end;

procedure TfSinco_Main.Clear_Objects();
begin
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
end;

procedure TfSinco_Main.orBtn_Doit_RDocClick(Sender: TObject);
begin
  // REIMPRESION POR RANGO DE CORRELATIVOS
  self.orBtn_Doit_RDoc.Enabled := false;
  self.iShoiceAct := 6;
  self.oTm_Wait_For_End_Trans.Enabled := True;
  // self.Reimprime_Por_Rango;
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
  // REIMPRESION POR RANGO DE FECHA
  self.iShoiceAct := 7;
  self.oTm_Wait_For_End_Trans.Enabled := True;
  // self.Reimprime_Por_Fecha;
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
  bPrueba_loop: boolean;
begin
  bPrueba_loop := false;
  self.oTimeCheck.Enabled := false;
  self.bTm_work := True;

  if utiles.CheckInternet() = false then
  begin
    self.Cambiar_Semaforo('R');

    self.olStatus_Error.Caption := 'SE PERDIO LA COMUNICASION CON EL INTERNET, EN ESPERA DE CONEXION:...';
    self.olStatus_Error.Color := $000000B3;
    self.olStatus_Error.Refresh;
    self.bTm_work := false;
    self.oTimeCheck.Enabled := True;
    EXIT;
  end
  else
  begin
    self.olStatus_Error.Color := clGreen;
    self.olStatus_Error.Repaint;
  end;

  if (self.bStop_Flg = True) then
  begin
    self.Cambiar_Semaforo('R');

    self.oBtn_CierreX.Enabled := True;
    self.oBtn_CierreZ.Enabled := True;
    self.olWaitStop.Visible := false;
    self.bTm_work := false;
    self.oBtn_Cierres.Caption := 'VOLVER A MODO FACTURACION';
    self.oTimeCheck.Enabled := True;
    EXIT;
  end
  else
  begin
    self.Cambiar_Semaforo('V');
  end;

  self.Cambiar_Semaforo('R');
  if (bPrueba_loop = false) then
    self.Cargar_Fact()
  else
  begin
    sleep(1000);
  end;

  if (self.bStop_Flg = True) then
  begin
    self.Cambiar_Semaforo('R');

    self.oBtn_CierreX.Enabled := True;
    self.oBtn_CierreZ.Enabled := True;
    self.olWaitStop.Visible := false;
    self.bTm_work := false;
    self.oBtn_Cierres.Caption := 'VOLVER A MODO FACTURACION';
    EXIT;
  end
  else
  begin
    self.Cambiar_Semaforo('V');
  end;
  self.bTm_work := false;
  self.oTimeCheck.Enabled := True;

  if (bPrueba_loop = True) then
  begin
    self.oTimeCheck.Enabled := True;
    self.bTm_work := false;
  end;
end;

procedure TfSinco_Main.oTm_Wait_For_End_TransTimer(Sender: TObject);
begin
  self.oTm_Wait_For_End_Trans.Interval := 500;
  case self.iShoiceAct of
    1:
      begin
        // IMPRIMIR FACTURA MANUALMENTE
        if (self.bTm_work = false) then
        begin
          self.Cambiar_Indic_Espera('OFF');
          self.oTimeCheck.Enabled := false;
          self.oTm_Wait_For_End_Trans.Enabled := false;
          self.iShoiceAct := 0;
          self.Cargar_Fact();
        end
        else
          self.Cambiar_Indic_Espera('ON');
      end;
    2:
      begin
        if (self.bTm_work = false) then
        begin
          self.Cambiar_Indic_Espera('OFF');
          self.oTimeCheck.Enabled := false;
          self.oTm_Wait_For_End_Trans.Enabled := false;
          self.iShoiceAct := 0;

          self.oTab_Sett_01.TabVisible := false;
          self.oTab_Sett_02.TabVisible := false;

          self.Hacer_Cierres();
        end
        else
          self.Cambiar_Indic_Espera('ON');
      end;
    3:
      begin
        if (self.bTm_work = false) then
        begin
          self.Cambiar_Indic_Espera('OFF');
          self.oTimeCheck.Enabled := false;
          self.oTm_Wait_For_End_Trans.Enabled := false;
          self.iShoiceAct := 0;

          self.oTab_Sett_01.TabVisible := True;
          self.oTab_Sett_02.TabVisible := True;

        end
        else
          self.Cambiar_Indic_Espera('ON');
      end;
    4:
      begin
        if (self.bTm_work = false) then
        begin
          // MODO AUTOMATICO
          self.Cambiar_Indic_Espera('OFF');
          self.oTimeCheck.Enabled := false;
          self.oTm_Wait_For_End_Trans.Enabled := false;
          self.iShoiceAct := 0;

          self.oTab_Sett_01.TabVisible := false;
          self.oTab_Sett_02.TabVisible := false;
          self.oTimeCheck.Enabled := True;
          self.Cambiar_Semaforo('V');
        end
        else
          self.Cambiar_Indic_Espera('ON');
      end;
    5:
      begin
        // MODO MANUAL
        if (self.bTm_work = false) then
        begin
          self.Cambiar_Indic_Espera('OFF');
          self.oTimeCheck.Enabled := false;
          self.oTm_Wait_For_End_Trans.Enabled := false;
          self.iShoiceAct := 0;

          self.oTab_Sett_01.TabVisible := false;
          self.oTab_Sett_02.TabVisible := false;
          self.Cambiar_Semaforo('S');
        end
        else
          self.Cambiar_Indic_Espera('ON');
      end;
    6:
      begin
        // REIMPRESION POR RANGO DE CORRELATIVOS
        if (self.bTm_work = false) then
        begin
          self.Cambiar_Indic_Espera('OFF');
          self.oTimeCheck.Enabled := false;
          self.oTm_Wait_For_End_Trans.Enabled := false;
          self.iShoiceAct := 0;

          self.Reimprime_Por_Rango;
          self.orBtn_Doit_RDoc.Enabled := true;
        end
        else
          self.Cambiar_Indic_Espera('ON');
      end;
    7:
      begin
        // REIMPRESION POR RANGO DE FECHA
        if (self.bTm_work = false) then
        begin
          self.Cambiar_Indic_Espera('OFF');
          self.oTimeCheck.Enabled := false;
          self.oTm_Wait_For_End_Trans.Enabled := false;
          self.iShoiceAct := 0;

          self.Reimprime_Por_Fecha;
          self.orBtn_Doit_RFec.Enabled := true;
        end
        else
          self.Cambiar_Indic_Espera('ON');
      end;
    8:
      begin

      end;
    9:
      begin

      end;
    10:
      begin

      end
    else
      begin
        self.oTimeCheck.Enabled := false;
        self.iShoiceAct := 0;
      end;
  end;
end;

procedure TfSinco_Main.oBtn_CierresClick(Sender: TObject);
begin
  self.iShoiceAct := 2;
  self.oTm_Wait_For_End_Trans.Enabled := True;
end;

procedure TfSinco_Main.FormCreate(Sender: TObject);
var
  oMyIcon: TIcon;
  cPassword: string;
begin
  self.cRes_Path := ExtractFileDir(ParamStr(0)) + '\Images';

  self.iShoiceAct := 0;
  self.bIgnore_Fis := false;
  self.bTest_Mode := false;
  self.bStop_Flg := false;
  self.bSendOk := 0;
  self.bTm_work := false;
  self.cJsonUpdate := '';
  { Load the tray icons. }

  { Set up a hint message and the animation interval. }
  self.TrayIcon1.Hint := '(M.I.F) Módulo de impresion fiscal (esta en ejecusión)';
  self.TrayIcon1.AnimateInterval := 200;

  { Set up a hint balloon. }
  self.TrayIcon1.BalloonTitle := 'Restaurar la ventana.';
  self.TrayIcon1.BalloonHint := 'Doble click en el icono para restaurar la aplicasion.';
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
  self.otVerifEsp_Erro_Int.Value := utiles.Read_IniFacilValue('TIMER_BEFORE_PRINT', 'TIME_ERROR_SECONDS', 'I', 3);
  self.otVerifEsp_Erro_try.Value := utiles.Read_IniFacilValue('TIMER_BEFORE_PRINT', 'TIME_ERROR_INTENTS', 'I', 10);

  self.otVerifFin_Stat_Int.Value := utiles.Read_IniFacilValue('TIMER_AFTER_PRINT', 'TIME_STATUS_SECONDS', 'I', 3);
  self.otVerifFin_Stat_try.Value := utiles.Read_IniFacilValue('TIMER_AFTER_PRINT', 'TIME_STATUS_INTENTS', 'I', 20);
  self.otVerifFin_Erro_Int.Value := utiles.Read_IniFacilValue('TIMER_AFTER_PRINT', 'TIME_ERROR_SECONDS', 'I', 3);
  self.otVerifFin_Erro_try.Value := utiles.Read_IniFacilValue('TIMER_AFTER_PRINT', 'TIME_ERROR_INTENTS', 'I', 10);

  self.bTest_Mode := utiles.Read_IniFacilValue('GENERAL', 'TEST_MODE', 'B', false);
  self.oCk_Test_Json.Checked := utiles.Read_IniFacilValue('GENERAL', 'TEST_JSON', 'B', false);

  self.oCk_Matricial.Checked := utiles.Read_IniFacilValue('Fiscal_Opt', 'MATRICIAL', 'B', True);

  self.Label36.Caption := self.cSerial_Working;

  self.oHttp_Result2.Text := '';

  self.oHttp_Server_Data.Text := utiles.Read_IniFacilValue('HTTP_SERVER_DATA', 'HOST_URL', 'S', '');
  self.oHttp_Server_Empr.Text := utiles.Read_IniFacilValue('HTTP_SERVER_DATA', 'HOST_EMP', 'S', '');
  self.oHttp_Server_Sucu.Text := utiles.Read_IniFacilValue('HTTP_SERVER_DATA', 'HOST_suc', 'S', '');

  self.oTimeCheck.Interval := (self.oTimeVerif.Value * 1000);
  self.oTimeCheck.Enabled := false;
  self.oTab_Sett_01.TabVisible := false;
  self.oTab_Sett_02.TabVisible := false;
  self.PageControl1.ActivePage := self.oTab_Main;
end;

procedure TfSinco_Main.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_F10) then
  begin
    if (self.oTab_Sett_01.TabVisible = True) then
    begin
      self.iShoiceAct := 4;
      self.oTm_Wait_For_End_Trans.Enabled := True;
    end
    ELSE
    begin
      // self.oWaitForStart.Enabled := False;
      self.iShoiceAct := 3;
      self.oTm_Wait_For_End_Trans.Enabled := True;
    end;
    Key := 0;
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

  cMsgPromocional := 'Gracias por su compra';

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
    ShowMessage(sStatus + ' EL CUPON EM CURSO SERA ANULADO.');
    AHK_FISCAL_LIB.Anula_Cupon;
    result := false;
    EXIT;
  end;
  result := True;

  AHK_FISCAL_LIB.cOFG_VarTipoV := TRIM(self.oMem_Fac.FieldByName('op_tipo').AsString);

  utiles.WaitSetMsg('Ejecutando impresión de documento en equipo fiscal:..');

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

procedure TfSinco_Main.RESTRequest2HTTPProtocolError(Sender: TCustomRESTRequest);
begin
  self.olStatus_Error.Caption := 'HUBO UN ERROR AL TRATAR DE RECUPERAR LO DATOS:...';
  self.olStatus_Error.Color := $000000B3;
  self.olStatus_Error.Refresh;
  utiles.LogToFile(TRIM(self.cJsonUpdate), ExtractFilePath(application.ExeName) + '\HTTP_GET_ERROR.LOG');
end;

procedure TfSinco_Main.RESTRequest3HTTPProtocolError(Sender: TCustomRESTRequest);
begin
  self.olStatus_Error.Caption := 'HUBO UN ERROR AL TRATAR DE REALIZAR EL ENVIO:...';
  self.olStatus_Error.Color := $000000B3;
  self.olStatus_Error.Refresh;
  utiles.LogToFile(TRIM(self.cJsonUpdate), ExtractFilePath(application.ExeName) + '\HTTP_SEND_ERROR.LOG');
end;

procedure TfSinco_Main.SalirdeMFF1Click(Sender: TObject);
begin
  Close;
  application.Terminate;
  System.halt;
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
  self.oBtn_CierreZ.Enabled := false;
  self.oBtn_Probar_CnnClick(self);
  AHK_FISCAL_LIB.CloseFpctrl();
  if (AHK_FISCAL_LIB.OpenFpctrl(AHK_FISCAL_LIB.cComm_FIS) = True) then
  begin
    self.Verifica_Status_Espe();
    self.Verifica_Error_Imp();

    if (AHK_FISCAL_LIB.CheckFprinter() = True) then
    begin
      messagedlg('ESPERE AL QUE EL IMPRESOR TERMINE DE IMPRIMIR EL DOCUMENTO, [PUDEN SER VARIAS PAGINAS]', mtInformation, [mbOK], 0);

      AHK_FISCAL_LIB.HKA_ShowStatusByName(false, sStatus);
      self.olStatus_Print.Caption := UpperCase(TRIM(sStatus));

      self.olStatus_Doc.Caption := 'IMPRIMIENDO REPORTE DE CIERRE X';
      self.olStatus_Doc.Repaint;

      AHK_FISCAL_LIB.Procesa_CierreX();
      AHK_FISCAL_LIB.Espera_Proceso_IMPF(self.olWaitStop);
      // self.oBtn_CierreX.Enabled := True;

    end;
  end;
  self.olStatus_Doc.Caption := 'PROCESO DE IMPRESION DE REPORTE DE CIERRE X FINALIZADO';
  self.olStatus_Doc.Repaint;

  self.oBtn_CierreZ.Enabled := True;
end;

procedure TfSinco_Main.oBtn_CierreZClick(Sender: TObject);
var
  sStatus: string;
begin
  self.oBtn_CierreX.Enabled := false;
  self.oBtn_CierreZ.Enabled := false;

  self.oBtn_Probar_CnnClick(self);
  AHK_FISCAL_LIB.CloseFpctrl();
  if (AHK_FISCAL_LIB.OpenFpctrl(AHK_FISCAL_LIB.cComm_FIS) = True) then
  begin
    self.Verifica_Status_Espe();
    self.Verifica_Error_Imp();

    if (AHK_FISCAL_LIB.CheckFprinter() = True) then
    begin

      messagedlg('ESPERE AL QUE EL IMPRESOR TERMINE DE IMPRIMIR EL DOCUMENTO, [PUDEN SER VARIAS PAGINAS]', mtInformation, [mbOK], 0);

      AHK_FISCAL_LIB.HKA_ShowStatusByName(false, sStatus);
      self.olStatus_Print.Caption := UpperCase(TRIM(sStatus));

      // if (AHK_FISCAL_LIB.Verifica_Z() = True) then
      begin
        self.olStatus_Doc.Caption := 'IMPRIMIENDO REPORTE DE CIERRE Z';
        self.olStatus_Doc.Repaint;

        AHK_FISCAL_LIB.Procesa_CierreZ();
        AHK_FISCAL_LIB.Espera_Proceso_IMPF(self.olWaitStop);
        messagedlg('EL CIERRE Z (CIERRE DE DIA), HA SIDO IMRESO. NO SERA POSIBLE HACER OTRO CIERRE Z HASTA EL DIA DE MAÑANA.', mtWarning, [mbOK], 0);
      end;

    end;

  end;
  self.olStatus_Doc.Caption := 'PROCESO DE IMPRESION DE REPORTE DE CIERRE Z FINALIZADO';
  self.olStatus_Doc.Repaint;
end;

procedure TfSinco_Main.oBtn_quitClick(Sender: TObject);
begin
  self.TrayIcon1.Visible := false;
  self.TrayIcon1.Animate := false;
  self.TrayIcon1.CleanupInstance;

  Close;
  application.Terminate;
  System.halt;
end;

function TfSinco_Main.Verifica_Status_Espe: boolean;
var
  cMyStatus: string;
  bResult: boolean;
  I: integer;
  iVerifEsp_Stat_Int, iVerifEsp_Stat_try: integer;
begin
  iVerifEsp_Stat_Int := self.otVerifEsp_Stat_Int.Value * 1000;
  iVerifEsp_Stat_try := self.otVerifEsp_Stat_try.Value;

  bResult := false;
  cMyStatus := '';
  self.olStatus_Print.Caption := cMyStatus;
  self.olStatus_Print.Repaint;
  for I := 1 to iVerifEsp_Stat_try do
  begin
    if (AHK_FISCAL_LIB.HKA_ShowStatusEspera(false, cMyStatus) = false) then
    begin
      application.ProcessMessages;
      SleepEx(iVerifEsp_Stat_Int, True);
      application.ProcessMessages;
      bResult := True;
      self.olStatus_Print.Caption := cMyStatus + ' [' + TRIM(IntToStr(I)) + ' DE ' + TRIM(IntToStr(iVerifEsp_Stat_try)) + '] Intentos:..';
      self.olStatus_Print.Repaint;
    end
    else
    begin
      bResult := false;
      break;
    end;
  end;
  self.olStatus_Print.Caption := cMyStatus;
  self.olStatus_Print.Repaint;
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
  self.olStatus_Print.Repaint;
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
      self.olStatus_Print.Caption := 'ESPERANDO FIN DE LA IMPRESION FISCAL [' + TRIM(utiles.FloatToStr3(iConsumid, 0)) + ' DE ' + TRIM(utiles.FloatToStr3(iRestante, 3)) +
        ' Segundos:..';
      self.olStatus_Print.Repaint;

      AHK_FISCAL_LIB.HKA_ShowErrorByName(false, cMyError);
      self.olStatus_Error.Caption := cMyError;
      if (TRIM(UpperCase(cMyError)) = TRIM(UpperCase('Fin de la entrega del papel.'))) then
        self.olStatus_Error.Color := $000000B3
      else
        self.olStatus_Error.Color := clGreen;
      self.olStatus_Error.Repaint;

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
  self.olStatus_Print.Repaint;
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

  cMyError := 'VERIFICANDO IMPRESORA:..';
  self.olStatus_Error.Caption := cMyError;
  self.olStatus_Error.Repaint;
  for I := 1 to iVerifEsp_Erro_try do
  begin
    if (AHK_FISCAL_LIB.HKA_ShowErrorByName(false, cMyError) = True) then
    begin
      application.ProcessMessages;
      SleepEx(iVerifEsp_Erro_Int, True);
      application.ProcessMessages;
      bResult := True;
      self.olStatus_Error.Caption := cMyError + ' [' + TRIM(IntToStr(I)) + ' DE ' + TRIM(IntToStr(iVerifEsp_Erro_try)) + '] Intentos:..';
      self.olStatus_Error.Color := $000000B3;
      self.olStatus_Error.Repaint;
    end
    else
    begin
      self.olStatus_Error.Color := clGreen;
      self.olStatus_Error.Repaint;

      bResult := false;
      break;
    end;

    if (TRIM(UpperCase(cMyError)) = TRIM(UpperCase('Fin de la entrega del papel.'))) then
    begin
      self.olStatus_Error.Caption := cMyError + ' [' + TRIM(IntToStr(I)) + ' DE ' + TRIM(IntToStr(iVerifEsp_Erro_try)) + '] Intentos:..';
      self.olStatus_Error.Color := $000000B3;
      self.olStatus_Error.Repaint;
      bResult := false;
      break;
    end;

  end;
  self.olStatus_Error.Caption := cMyError;
  self.olStatus_Error.Repaint;
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
  sJsonStrn: string;
  cOp_id: string;
  sJsonUpdate: string;
  iLen: integer;
  oJsonTestTx: TStringList;
  oFileStream: TFileStream;
  cFle_Json_Demo: string;
begin
  if (self.oCk_Test_Json.Checked = True) then
  begin
    self.olStatus_Error.Caption := 'CARGANDO JSON DE PRUEBAS [data_test.json]:..';
    self.olStatus_Error.Repaint;

    cFle_Json_Demo := ExtractFilePath(application.ExeName) + 'data_test.json';
    if fileexists(cFle_Json_Demo) then
    begin
      oJsonTestTx := TStringList.Create;
      oFileStream := TFileStream.Create(cFle_Json_Demo, fmShareDenyNone);
      oJsonTestTx.LoadFromStream(oFileStream);
      if (TRIM(oJsonTestTx.Text) = '') then
      begin
        self.olStatus_Error.Caption := 'ARCHIVO [data_test.json], VACIO!!!:..';
        self.olStatus_Error.Repaint;
      end;

      oFileStream.Destroy();
    end;
  end;

  // self.Enabled := False;
  self.verifica_stop();

  self.olStatus_Error.Caption := 'EN ESPERA DEL ESTATUS DE IMPRESORA:..';
  self.olStatus_Error.Repaint;

  self.olStatus_Print.Caption := 'EN ESPERA DE STATUS DE ERRORES:..';
  self.olStatus_Print.Repaint;

  self.oBtn_Probar_CnnClick(self);
  self.olStatus_Print.Caption := UpperCase(TRIM(self.olStatus_Conn.Caption));
  self.olStatus_Print.Repaint;

  if (TRIM(self.olStatus_Conn.Caption) = UpperCase('No hay conexión con la impresora')) then
  begin
    // self.Enabled := True;
    oJsonFull := nil;
    EXIT;
  end;
  if (self.oCk_Test_Json.Checked = True) then
  begin
    if (TRIM(oJsonTestTx.Text) <> '') then
      self.oHttp_Result2.Text := oJsonTestTx.Text;
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
    self.olStatus_Doc.Caption := 'EN ESPERA DE NUEVOS DOCUMENTOS:..';
    self.olStatus_Error.Repaint;
    // Json no valido
    // self.Enabled := True;
    oJsonFull := nil;
    EXIT;
  end;

  iLen := oJsonFull['print_list'].AsArray.Length;
  // iLen := oJsonFull['print_list.fact_cab'].AsArray.Length;
  if (iLen = 0) then
  begin
    self.olStatus_Doc.Caption := 'EN ESPERA DE NUEVOS DOCUMENTOS:..';
    self.olStatus_Error.Repaint;
    // Json no valido
    // self.Enabled := True;
    oJsonFull := nil;
    EXIT;
  end;

  self.oMem_Fac.EmptyTable;
  self.oMem_Det.EmptyTable;

  if (self.CargaDataFact(oJsonFull, oMem_Fac) <= 0) then
  begin
    ShowMessage('SE DETECTO UN ERROR EN AL DESCRIPCION DE LOS PRODUCTOS DEL DOCUMENTO.' + #13 + 'SE CANCELARA LA IMPRESION DE NUEVOS DOCUMENTOS POR ERROR DE LA IMPRESORA FISCAL.');
    self.cJsonUpdate := '';
    self.cJsonUpdate := self.cJsonUpdate + '{"op_emp_id":"' + TRIM(self.oHttp_Server_Empr.Text) + '",';
    self.cJsonUpdate := self.cJsonUpdate + '"op_suc_id":"' + TRIM(self.oHttp_Server_Sucu.Text) + '",';
    self.cJsonUpdate := self.cJsonUpdate + '"op_num_corre": "",';
    self.cJsonUpdate := self.cJsonUpdate + '"op_num_ncf": "",';
    self.cJsonUpdate := self.cJsonUpdate + '"op_num_nco": "",';
    self.cJsonUpdate := self.cJsonUpdate + '"op_numserie_if": "' + TRIM(AHK_FISCAL_LIB.cSerieIMF) + '",';
    self.cJsonUpdate := self.cJsonUpdate + '"op_id":0,';
    self.cJsonUpdate := self.cJsonUpdate + '"op_status": "1",';
    self.cJsonUpdate := self.cJsonUpdate + '"op_status_det":"ERROR DE CABECERA DE FACTURA",';
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

    self.olStatus_Doc.Caption := 'IMPRIMIENDO CLIENTE:[' + self.oMem_Fac.FieldByName('op_nom_cliente').AsString + '], DOCUMENTO:[' + self.oMem_Fac.FieldByName('op_num_corre')
      .AsString + '], VALOR:[' + utiles.FloatToStr3(self.oMem_Fac.FieldByName('op_total').AsFloat, 3) + ']';
    self.olStatus_Doc.Repaint;

    if (self.CargaDataDet(oJsonFull, oMem_Det, cOp_id) <= 0) then
    begin
      ShowMessage('SE DETECTO UN ERROR EN AL DESCRIPCION DE LOS PRODUCTOS DEL DOCUMENTO.' + #13 +
        'SE CANCELARA LA IMPRESION DE NUEVOS DOCUMENTOS POR ERROR DE LA IMPRESORA FISCAL.');
      self.cJsonUpdate := '';
      self.cJsonUpdate := self.cJsonUpdate + '{"op_emp_id":"' + TRIM(self.oHttp_Server_Empr.Text) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_suc_id":"' + TRIM(self.oHttp_Server_Sucu.Text) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_corre": "' + TRIM(self.oMem_Fac.FieldByName('op_num_corre').AsString) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_ncf": "",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_nco": "",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_numserie_if": "' + TRIM(AHK_FISCAL_LIB.cSerieIMF) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_id":' + TRIM(cOp_id) + ',';
      self.cJsonUpdate := self.cJsonUpdate + '"op_status": "1",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_status_det": "ERROR DE DETALLE DE FACTURA",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_test":"' + iif(self.bTest_Mode = True, '1', '0') + '"}';
      self.oBtn_Env_DataClick(self);
      oJsonFull := nil;
      EXIT;
    end;
    { ------------------VERIFICASION DE ERRORES---------------------------- }

    if (self.Verifica_Status_Espe() = True) then
    begin
      ShowMessage('SE CANCELARA LA IMPRESION DE NUEVOS DOCUMENTOS, SE SOBREPASO EL LIMITE DE ESPERA PARA IMPRESION (15 Seg.).');
      // self.Enabled := True;

      self.cJsonUpdate := '';
      self.cJsonUpdate := self.cJsonUpdate + '{"op_emp_id":"' + TRIM(self.oHttp_Server_Empr.Text) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_suc_id":"' + TRIM(self.oHttp_Server_Sucu.Text) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_corre": "' + TRIM(AHK_FISCAL_LIB.cOFG_Num_corre) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_ncf": "",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_nco": "",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_numserie_if": "' + TRIM(AHK_FISCAL_LIB.cSerieIMF) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_id":' + TRIM(cOp_id) + ',';
      self.cJsonUpdate := self.cJsonUpdate + '"op_status": "1",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_status_det": "SE CANCELARA LA IMPRESION DE NUEVOS DOCUMENTOS, SE SOBREPASO EL LIMITE DE ESPERA PARA IMPRESION (15 Seg.).",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_test":"' + iif(self.bTest_Mode = True, '1', '0') + '"}';
      self.oBtn_Env_DataClick(self);

      oJsonFull := nil;
      EXIT;
    end;
    { --------------------------------------------------------------------- }

    { ------------------VERIFICASION DE ERRORES---------------------------- }
    if (self.Verifica_Error_Imp() = True) then
    begin
      ShowMessage('SE CANCELARA LA IMPRESION DE NUEVOS DOCUMENTOS POR ERROR DE LA IMPRESORA FISCAL');
      // self.Enabled := True;

      self.cJsonUpdate := '';
      self.cJsonUpdate := self.cJsonUpdate + '{"op_emp_id":"' + TRIM(self.oHttp_Server_Empr.Text) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_suc_id":"' + TRIM(self.oHttp_Server_Sucu.Text) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_corre": "' + TRIM(AHK_FISCAL_LIB.cOFG_Num_corre) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_ncf": "",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_nco": "",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_numserie_if": "' + TRIM(AHK_FISCAL_LIB.cSerieIMF) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_id":' + TRIM(cOp_id) + ',';
      self.cJsonUpdate := self.cJsonUpdate + '"op_status": "1",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_status_det": "SE CANCELARA LA IMPRESION DE NUEVOS DOCUMENTOS POR ERROR DE LA IMPRESORA FISCAL",';
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
      self.cJsonUpdate := self.cJsonUpdate + '{"op_emp_id":"' + TRIM(self.oHttp_Server_Empr.Text) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_suc_id":"' + TRIM(self.oHttp_Server_Sucu.Text) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_corre": "' + TRIM(AHK_FISCAL_LIB.cOFG_Num_corre) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_ncf": "' + AHK_FISCAL_LIB.cOFG_Num_NCF + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_nco": "' + AHK_FISCAL_LIB.cOFG_Num_COO + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_numserie_if": "' + TRIM(AHK_FISCAL_LIB.cSerieIMF) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_id":' + TRIM(cOp_id) + ',';
      self.cJsonUpdate := self.cJsonUpdate + '"op_status": "0",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_status_det": "OK",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_test":"' + iif(self.bTest_Mode = True, '1', '0') + '"}';

      self.olStatus_Print.Caption := 'ACTUALZIANDO STATUS DE FALLA EN LA NUBE.';
      self.olStatus_Print.Repaint;

    end
    ELSE
    begin
      self.cJsonUpdate := '';
      self.cJsonUpdate := self.cJsonUpdate + '{"op_emp_id":"' + TRIM(self.oHttp_Server_Empr.Text) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_suc_id":"' + TRIM(self.oHttp_Server_Sucu.Text) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_corre": "' + TRIM(AHK_FISCAL_LIB.cOFG_Num_corre) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_ncf": "",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_num_nco": "",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_numserie_if": "' + TRIM(AHK_FISCAL_LIB.cSerieIMF) + '",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_id":' + TRIM(cOp_id) + ',';
      self.cJsonUpdate := self.cJsonUpdate + '"op_status": "1",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_status_det": "ERROR DE LA IMPRESORA FISCAL",';
      self.cJsonUpdate := self.cJsonUpdate + '"op_test":"' + iif(self.bTest_Mode = True, '1', '0') + '"}';

      self.olStatus_Print.Caption := 'ACTUALZIANDO STATUS DE PROCESADO EN LA NUBE.';
      self.olStatus_Print.Repaint;
    end;
    self.oBtn_Env_DataClick(self);

    if (self.bSendOk = 1) then
    begin

    end
    ELSE if (self.bSendOk = 2) then
    begin
      ShowMessage('EL DOCUMENTO SE ENTREGO AL SERVIDIOR Y SE RESOPONDIO CON ERROR.');
      oJsonFull := nil;
      EXIT;
    end
    else if (self.bSendOk = -1) then
    begin
      ShowMessage('NO ES POSIBLE ESTABLECER CONTACTO CON LA NUBE DEL SISTEMA PARA ACTUALZIAR LA FACTURA.');
      oJsonFull := nil;
      EXIT;
    end;

    self.oMem_Fac.Next;
  end;
  AHK_FISCAL_LIB.CloseFpctrl;
  self.verifica_stop();

  self.oMem_Fac.EmptyTable;
  self.oMem_Det.EmptyTable;

  self.olStatus_Doc.Caption := 'EN ESPERA DE NUEVOS DOCUMENTOS:..';
  self.olStatus_Error.Repaint;

  self.olStatus_Print.Caption := 'EN ESPERA DE STATUS DE ERRORES:..';
  self.olStatus_Print.Repaint;

  self.olStatus_Error.Caption := 'EN ESPERA DEL ESTATUS DE IMPRESORA:..';
  self.olStatus_Error.Repaint;
  // self.Enabled := True;
  oJsonFull := nil;
end;

procedure TfSinco_Main.Hacer_Cierres;
begin
  if (self.Try_Open_Port() = True) then
  begin
    IF (TRIM(self.oBtn_Cierres.Caption) = 'Cierres Fis.') then
    begin
      // self.oBtn_Cierres.Enabled := False;
      self.olWaitStop.Visible := True;
      if (self.bTm_work = false) then
      begin
        self.oTimeCheck.Enabled := false;
        self.bStop_Flg := True;

        self.oBtn_Print.Enabled := false;
        self.oBtn_Minimize.Enabled := false;
        self.oBtn_CierreX.Enabled := True;
        self.oBtn_CierreZ.Enabled := True;
        self.olWaitStop.Visible := false;
        self.bTm_work := false;
        self.oBtn_Cierres.Caption := 'Volver M. Normal';
        self.Cambiar_Semaforo('R');
      end
      else
      begin
        self.Cambiar_Semaforo('A');
        self.bStop_Flg := True;
      end;
    end
    else
    begin
      self.Cambiar_Semaforo('A');

      self.oBtn_Print.Enabled := True;
      self.oBtn_Minimize.Enabled := True;
      self.oBtn_CierreX.Enabled := false;
      self.oBtn_CierreZ.Enabled := false;
      self.oBtn_Cierres.Caption := 'Cierres Fis.';
      // self.oBtn_Cierres.Enabled := True;
      self.bStop_Flg := false;
      self.bTm_work := false;
      self.oTimeCheck.Enabled := True;
    end;
  end;
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
    self.oImg_Semaf.Repaint;
  end
  else if (cFlag = 'V') then
  begin
    self.oImg_Semaf.Picture.LoadFromFile(self.cRes_Path + '\verde.png');
    self.oImg_Semaf.Repaint;
  end
  else if (cFlag = 'A') then
  begin
    self.oImg_Semaf.Picture.LoadFromFile(self.cRes_Path + '\amarillo.png');
    self.oImg_Semaf.Repaint;
  end
  else if (cFlag = 'S') then
  begin
    self.oImg_Semaf.Picture.LoadFromFile(self.cRes_Path + '\icons8_stop_sign_32.png');
    self.oImg_Semaf.Repaint;
  end;

end;

procedure TfSinco_Main.Cambiar_Indic_Espera(cFlag: string);
begin
  if (cFlag = 'ON') then
  begin
    self.oWait_Image.Picture.LoadFromFile(self.cRes_Path + '\stopwatch_32.png');
    self.oWait_Image.Visible := True;
    self.oWait_Image.Repaint;
    sleep(500);

  end
  else if (cFlag = 'OFF') then
  begin
    self.oWait_Image.Visible := false;
    self.oWait_Image.Repaint;
  end;
end;

end.
