Attribute VB_Name = "mdFPCtrl"
'//////////////////////////////////////////////////////////
'// Fiscal Printer library definitions
'//////////////////////////////////////////////////////////
Declare Function OpenFpctrl Lib "tfhkaif.dll" (ByVal lpPortName As String) As Long
Declare Function CloseFpctrl Lib "tfhkaif.dll" () As Long
Declare Function CheckFprinter Lib "tfhkaif.dll" () As Long
Declare Function ReadFpStatus Lib "tfhkaif.dll" (status As Long, error As Long) As Long
Declare Function SendCmd Lib "tfhkaif.dll" (status As Long, error As Long, ByVal cmd As String) As Long
Declare Function SendNCmd Lib "tfhkaif.dll" (status As Long, error As Long, ByVal buffer As String) As Long
Declare Function SendFileCmd Lib "tfhkaif.dll" (status As Long, error As Long, ByVal file As String) As Long
Declare Function UploadReportCmd Lib "tfhkaif.dll" (status As Long, error As Long, ByVal cmd As String, ByVal file As String) As Long
Declare Function UploadStatusCmd Lib "tfhkaif.dll" (status As Long, error As Long, ByVal cmd As String, ByVal file As String) As Long
Declare Function UploadReportDin Lib "tfhkaif.dll" (status As Long, error As Long, ByVal cmd As String, ByVal Cadena As String) As Long
Declare Function UploadStatusDin Lib "tfhkaif.dll" (status As Long, error As Long, ByVal cmd As String, ByVal Cadena As String) As Long



'//status
Public Const FPCTL_NON_STATUS = &H0
Public Const FPCTL_NON_FISCAL_IN_IDLE = &H1
Public Const FPCTL_NON_FISCAL_IN_TRANSACTION = &H2
Public Const FPCTL_NON_FISCAL_NON_TRANSACTION = &H3
Public Const FPCTL_FISCAL_IN_IDLE = &H4
Public Const FPCTL_FISCAL_IN_TRANSACTION = &H5
Public Const FPCTL_FISCAL_NON_TRANSACTION = &H6
Public Const FPCTL_FISCAL_MEMORY_NEAR_FULL_IN_TRANSACTION = &H7
Public Const FPCTL_FISCAL_MEMORY_NEAR_FULL_NON_TRANSACTION = &H8
Public Const FPCTL_FISCAL_MEMORY_NEAR_FULL_IN_IDLE = &H9
Public Const FPCTL_FISCAL_MEMORY_FULL_IN_TRANSACTION = &HA
Public Const FPCTL_FISCAL_MEMORY_FULL_IN_NON_TRANSACTION = &HB
Public Const FPCTL_FISCAL_MEMORY_FULL_IN_IDLE = &HC
Public Const FPCTL_SENDNCMD_SUCCESS = &H0

'// error
Public Const FPCTL_ERROR_NO_ERROR = &H0
Public Const FPCTL_ERROR_PAPER_END = &H1
Public Const FPCTL_ERROR_PRINTER_MECHA_ERROR = &H2
Public Const FPCTL_ERROR_PAPER_END_MECHA_ERROR = &H3
Public Const FPCTL_ERROR_COMMAND_INVALID_VAL = &H50
Public Const FPCTL_ERROR_COMMAND_INVALID_TAX = &H54
Public Const FPCTL_ERROR_NOT_ASSIGNED_CLERK = &H58
Public Const FPCTL_ERROR_INVALID_COMMAND = &H5C
Public Const FPCTL_ERROR_FISCAL_ERROR = &H60
Public Const FPCTL_ERROR_FISCAL_MEMORY_ERROR = &H64
Public Const FPCTL_ERROR_FISCAL_MEMORY_FULL = &H6C

Public Const FPCTL_ERROR_BUFFER_FULL = &H70
Public Const FPCTL_ERROR_ANSWERED_NAK = &H80
Public Const FPCTL_ERROR_NOT_ANSWERED = &H89
Public Const FPCTL_ERROR_UNKNOWN_ANSWERED = &H90
Public Const FPCTL_ERROR_COMM_API = &H91
Public Const FPCTL_ERROR_FILE_OPEN = &H99



