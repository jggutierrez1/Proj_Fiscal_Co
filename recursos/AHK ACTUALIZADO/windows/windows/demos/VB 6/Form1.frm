VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   " The Factory HKA.  Demo  Informativo  V-1.3"
   ClientHeight    =   8535
   ClientLeft      =   150
   ClientTop       =   435
   ClientWidth     =   14010
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H8000000D&
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   150.548
   ScaleMode       =   6  'Millimeter
   ScaleWidth      =   247.121
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command7 
      Caption         =   "Subir X (Archivo)"
      Height          =   495
      Left            =   4680
      TabIndex        =   60
      Top             =   3960
      Width           =   975
   End
   Begin VB.CommandButton Command6 
      Caption         =   "Subir Z (Archivo)"
      Height          =   495
      Left            =   4680
      TabIndex        =   59
      Top             =   4560
      Width           =   975
   End
   Begin VB.Frame Frame16 
      Caption         =   "CheckFprinter"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1455
      Left            =   10920
      TabIndex        =   57
      Top             =   240
      Width           =   1455
      Begin VB.CommandButton Command4 
         Caption         =   "Solicitar"
         Height          =   495
         Left            =   240
         TabIndex        =   58
         Top             =   480
         Width           =   975
      End
   End
   Begin VB.Frame Frame4 
      Caption         =   "Status y Error"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1455
      Left            =   12480
      TabIndex        =   55
      Top             =   240
      Width           =   1455
      Begin VB.CommandButton Command5 
         Caption         =   "Solicitar"
         Height          =   495
         Left            =   240
         TabIndex        =   56
         Top             =   480
         Width           =   975
      End
   End
   Begin VB.Frame Frame7 
      Caption         =   "Documentos"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1335
      Left            =   3000
      TabIndex        =   21
      Top             =   240
      Width           =   6015
      Begin VB.CommandButton Command17 
         Caption         =   "Documento     No Fiscal"
         Height          =   495
         Left            =   4440
         TabIndex        =   53
         Top             =   480
         Width           =   1335
      End
      Begin VB.CommandButton Command11 
         Caption         =   "Nota de Credito"
         Height          =   495
         Left            =   1560
         TabIndex        =   27
         Top             =   480
         Width           =   1335
      End
      Begin VB.CommandButton Command10 
         Caption         =   "Nota de Debito"
         Height          =   495
         Left            =   3000
         TabIndex        =   26
         Top             =   480
         Width           =   1335
      End
      Begin VB.CommandButton btnVenta 
         Caption         =   " Factura"
         Height          =   495
         Left            =   120
         TabIndex        =   22
         Top             =   480
         Width           =   1335
      End
   End
   Begin VB.Frame Frame8 
      Caption         =   "Envio de Comandos por Archivos"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3615
      Left            =   120
      TabIndex        =   15
      Top             =   1800
      Width           =   3135
      Begin VB.Frame Frame1 
         Caption         =   "Directorio de Archivos"
         Height          =   2535
         Left            =   120
         TabIndex        =   17
         Top             =   240
         Width           =   2895
         Begin VB.DriveListBox Drive1 
            Height          =   330
            Left            =   120
            TabIndex        =   20
            Top             =   360
            Width           =   2655
         End
         Begin VB.DirListBox Dir1 
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   765
            Left            =   120
            TabIndex        =   19
            Top             =   720
            Width           =   2655
         End
         Begin VB.FileListBox File1 
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   870
            Left            =   120
            Pattern         =   "False"
            TabIndex        =   18
            Top             =   1560
            Width           =   2655
         End
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Enviar archvio de Comandos"
         Height          =   495
         Left            =   600
         TabIndex        =   16
         Top             =   2880
         Width           =   1815
      End
   End
   Begin VB.Frame Frame6 
      Caption         =   "Status y Reportes"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3615
      Left            =   3480
      TabIndex        =   12
      Top             =   1800
      Width           =   2295
      Begin VB.CommandButton Command19 
         Caption         =   "Subir S2"
         Height          =   495
         Left            =   120
         TabIndex        =   54
         Top             =   960
         Width           =   975
      End
      Begin VB.CommandButton Command12 
         Caption         =   "Subir S5"
         Enabled         =   0   'False
         Height          =   495
         Left            =   120
         TabIndex        =   37
         Top             =   2760
         Width           =   975
      End
      Begin VB.CommandButton btnSubirZ1 
         Caption         =   "Subir Z (Puntero)"
         Height          =   495
         Left            =   1200
         TabIndex        =   25
         Top             =   960
         Width           =   975
      End
      Begin VB.CommandButton btnSubirX 
         Caption         =   "Subir X (Puntero)"
         Height          =   495
         Left            =   1200
         TabIndex        =   24
         Top             =   360
         Width           =   975
      End
      Begin VB.CommandButton btnSubirS4 
         Caption         =   "Subir S4"
         Height          =   495
         Left            =   120
         TabIndex        =   23
         Top             =   2160
         Width           =   975
      End
      Begin VB.CommandButton btnSubirS3 
         Caption         =   "Subir S3"
         Height          =   495
         Left            =   120
         TabIndex        =   14
         Top             =   1560
         Width           =   975
      End
      Begin VB.CommandButton btnSubirS1 
         Caption         =   "Subir S1"
         Height          =   495
         Left            =   120
         TabIndex        =   13
         Top             =   360
         Width           =   975
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "Reportes"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1455
      Left            =   9360
      TabIndex        =   9
      Top             =   240
      Width           =   1335
      Begin VB.CommandButton btnReporteZ 
         Caption         =   "Realizar Z"
         Height          =   495
         Left            =   120
         TabIndex        =   11
         Top             =   840
         Width           =   975
      End
      Begin VB.CommandButton btnReporteX 
         Caption         =   "Realizar X"
         Height          =   495
         Left            =   120
         TabIndex        =   10
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Selección del Puerto"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1455
      Left            =   120
      TabIndex        =   5
      Top             =   120
      Width           =   2655
      Begin VB.ComboBox Combo1 
         Height          =   330
         Left            =   720
         TabIndex        =   36
         Top             =   360
         Width           =   1215
      End
      Begin VB.CommandButton PortClose 
         BackColor       =   &H8000000E&
         Caption         =   "Cerrar Puerto"
         Height          =   495
         Left            =   1440
         TabIndex        =   7
         Top             =   840
         Width           =   1095
      End
      Begin VB.CommandButton PortOpen 
         Caption         =   "Abrir puerto"
         Height          =   495
         Left            =   120
         TabIndex        =   6
         Top             =   840
         Width           =   1095
      End
   End
   Begin VB.Frame Frame5 
      Caption         =   "Ventana de Eventos"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2895
      Left            =   120
      TabIndex        =   0
      Top             =   5520
      Width           =   13815
      Begin VB.CommandButton LisrClear 
         Caption         =   "Borrar Log"
         Height          =   375
         Left            =   6120
         TabIndex        =   8
         Top             =   2400
         Width           =   1815
      End
      Begin VB.ListBox List1 
         BackColor       =   &H80000018&
         DragIcon        =   "Form1.frx":27A2
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   510
         Left            =   240
         TabIndex        =   4
         Top             =   1800
         Width           =   13335
      End
      Begin VB.TextBox txtResp 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1215
         Left            =   240
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   3
         Text            =   "Form1.frx":28EC
         Top             =   240
         Width           =   13335
      End
      Begin VB.Label Label2 
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   3480
         TabIndex        =   2
         Top             =   1680
         Width           =   1575
      End
      Begin VB.Label Label1 
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   240
         TabIndex        =   1
         Top             =   1680
         Width           =   975
      End
   End
   Begin VB.Frame Frame9 
      Caption         =   "Memoria Fiscal y Memoria de Auditoria"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3615
      Left            =   6000
      TabIndex        =   28
      Top             =   1800
      Width           =   7935
      Begin VB.Frame Frame10 
         Caption         =   "Por Rango de Nro"
         Height          =   1455
         Left            =   120
         TabIndex        =   41
         Top             =   2040
         Width           =   7695
         Begin VB.TextBox Text1 
            Alignment       =   2  'Center
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   960
            MaxLength       =   4
            TabIndex        =   50
            Text            =   "0001"
            Top             =   360
            Width           =   1335
         End
         Begin VB.TextBox Text2 
            Alignment       =   2  'Center
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   960
            MaxLength       =   4
            TabIndex        =   49
            Text            =   "0001"
            Top             =   840
            Width           =   1335
         End
         Begin VB.Frame Frame13 
            Caption         =   "Memoria Fiscal"
            Height          =   1215
            Left            =   2760
            TabIndex        =   44
            Top             =   120
            Width           =   1695
            Begin VB.CommandButton Command3 
               Caption         =   "Imprimir"
               Height          =   375
               Left            =   240
               TabIndex        =   46
               Top             =   240
               Width           =   1215
            End
            Begin VB.CommandButton Command9 
               Caption         =   "Archivo .txt"
               Height          =   375
               Left            =   240
               TabIndex        =   45
               Top             =   720
               Width           =   1215
            End
         End
         Begin VB.Frame Frame15 
            Caption         =   "Memoria de Auditoria"
            Height          =   1215
            Left            =   4800
            TabIndex        =   42
            Top             =   120
            Width           =   2775
            Begin VB.CommandButton Command14 
               Caption         =   "Imprimir Estado de la Memoria"
               Enabled         =   0   'False
               Height          =   615
               Left            =   1440
               TabIndex        =   52
               ToolTipText     =   "Función Disponible para el Modelo SPR-350"
               Top             =   360
               Width           =   1215
            End
            Begin VB.CommandButton btnImpAudNum 
               Caption         =   "Imprimir Copia Factura"
               Enabled         =   0   'False
               Height          =   615
               Left            =   120
               TabIndex        =   43
               ToolTipText     =   "Función Disponible para el Modelo SPR-350"
               Top             =   360
               Width           =   1215
            End
         End
         Begin VB.Label Label5 
            Caption         =   "Desde:"
            Height          =   255
            Left            =   120
            TabIndex        =   48
            Top             =   360
            Width           =   495
         End
         Begin VB.Label Label6 
            Caption         =   "Hasta:"
            Height          =   255
            Left            =   120
            TabIndex        =   47
            Top             =   840
            Width           =   495
         End
      End
      Begin MSComCtl2.DTPicker DTPicker4 
         Height          =   375
         Left            =   1080
         TabIndex        =   29
         Top             =   1200
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   661
         _Version        =   393216
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Format          =   38076417
         CurrentDate     =   39471
      End
      Begin VB.Frame Frame11 
         Caption         =   "Por Rango de Fecha"
         Height          =   1455
         Left            =   120
         TabIndex        =   30
         Top             =   360
         Width           =   7695
         Begin VB.Frame Frame14 
            Caption         =   "Memoria de Auditoria"
            Height          =   1215
            Left            =   4800
            TabIndex        =   34
            Top             =   120
            Width           =   2775
            Begin VB.CommandButton Command13 
               Caption         =   "Imprimir Estado de la Memoria"
               Enabled         =   0   'False
               Height          =   615
               Left            =   1440
               TabIndex        =   51
               ToolTipText     =   "Función Disponible para el Modelo SPR-350"
               Top             =   360
               Width           =   1215
            End
            Begin VB.CommandButton btnImpMemAudFech 
               Caption         =   "Imprimir Copia Factura"
               Enabled         =   0   'False
               Height          =   615
               Left            =   120
               TabIndex        =   35
               ToolTipText     =   "Función Disponible para el Modelo SPR-350"
               Top             =   360
               Width           =   1215
            End
         End
         Begin VB.Frame Frame12 
            Caption         =   "Memoria Fiscal"
            Height          =   1215
            Left            =   2760
            TabIndex        =   33
            Top             =   120
            Width           =   1695
            Begin VB.CommandButton Command8 
               Caption         =   "Archivo .txt"
               Height          =   375
               Left            =   240
               TabIndex        =   39
               Top             =   720
               Width           =   1215
            End
            Begin VB.CommandButton Command1 
               Caption         =   "Imprimir"
               Height          =   375
               Left            =   240
               TabIndex        =   38
               Top             =   240
               Width           =   1215
            End
         End
         Begin MSComCtl2.DTPicker DTPicker1 
            BeginProperty DataFormat 
               Type            =   0
               Format          =   "d/MM/yy"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   8202
               SubFormatType   =   0
            EndProperty
            Height          =   375
            Left            =   960
            TabIndex        =   40
            Top             =   360
            Width           =   1335
            _ExtentX        =   2355
            _ExtentY        =   661
            _Version        =   393216
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Format          =   38076417
            CurrentDate     =   39470
         End
         Begin VB.Label Label4 
            Caption         =   "Hasta:"
            Height          =   255
            Left            =   120
            TabIndex        =   32
            Top             =   840
            Width           =   495
         End
         Begin VB.Label Label3 
            Caption         =   "Desde:"
            Height          =   255
            Left            =   120
            TabIndex        =   31
            Top             =   360
            Width           =   495
         End
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim cmd As String
Dim msg As String, sAux As String
Dim bRet As Boolean
Dim Respuesta As Boolean
Dim status As Long
Dim error As Long
Dim Cadena As String
Dim NLineas As Integer
Dim FileName As String
Dim Data As String
Dim Variable_Control As String

Public Sub VerRespuesta()
    txtResp.Text = ""
    If (bRet = True) Then
        NLineas = LeerArchivo(App.Path & "\" & FileName)
        sAux = ""
        For i = 0 To NLineas - 1
          txtResp.Text = txtResp.Text & sLineas(i) + vbCrLf
       Next i
    Else
       txtResp.Text = "Sin respuesta"
    End If
End Sub

Public Sub Verdatos()
Dim i As Integer
    i = NLineas - 1
    If (bRet = True) Then
       'ver los datos del cliente
        txtResp.Text = txtResp.Text & "-------- Datos Máquina --------" & vbCrLf
        txtResp.Text = txtResp.Text & "RIF = " & Mid(sLineas(i), 56, 11) & vbCrLf
        txtResp.Text = txtResp.Text & "Serial IF = " & Mid(sLineas(i), 67, 10) & vbCrLf
        txtResp.Text = txtResp.Text & "Ultimo Z = " & Mid(sLineas(i), 48, 4) & vbCrLf
        txtResp.Text = txtResp.Text & "Ultima Factura = " & Mid(sLineas(i), 22, 8) & vbCrLf
        txtResp.Text = txtResp.Text & "# Clientes en el dia = " & Mid(sLineas(i), 30, 5) & vbCrLf
        txtResp.Text = txtResp.Text & "Ultimo No Fiscal = " & Mid(sLineas(i), 35, 8) & vbCrLf
        txtResp.Text = txtResp.Text & "# No Fiscales dia = " & Mid(sLineas(i), 43, 5) & vbCrLf
        txtResp.Text = txtResp.Text & "Fecha en IF = " & Mid(sLineas(i), 83, 6) & vbCrLf
        txtResp.Text = txtResp.Text & "Hora en IF = " & Mid(sLineas(i), 77, 4) & vbCrLf
    End If
End Sub


Private Sub btnImpAudNum_Click()
   '////////////////////////////////////////////////
   '// Lectura de La Memoria de auditoria por numero
   '///////////////////////////////////////////////

Dim Desde As String
Dim Hasta As String

ListOut ("**Impresión de los Datos de la Memoria de Auditoria por Rango de Números..**")
Desde = Text1.Text
Hasta = Text2.Text
If Desde <= Hasta Then
txtResp.Text = "Desde: " + Desde + "    " + "Hasta: " + Hasta

cmd = "R" & "F" & "000" & Desde & "000" & Hasta

bRet = SendCmd(status, error, cmd)
msg = "SendCmd = " + boolCheck(bRet) + " status = " + Hex$(status) + " error = " + Hex$(error)
ListOut (msg)
Else: MsgBox ("# Final debe ser Mayor que # Inicial")

End If
End Sub



Private Sub btnSubirS1_Click()
'////////////////////////////////////////////
'  Subir Satus 1
'////////////////////////////////////////////
    List1.Clear
    ListOut ("**Solicitando status S1...**")
    
     Cadena = (String(250, "*"))
    cmd = "S1"
    bRet = UploadStatusDin(status, error, cmd, Cadena)
    txtResp.Text = Cadena & vbCrLf


End Sub

Private Sub btnSubirX_Click()
'////////////////////////////////////////////
'  subir el Reporte X
'////////////////////////////////////////////
    Dim Cadena As String
    Dim bRet As Boolean
    List1.Clear
    ListOut ("**Solicitando Reporte...**")
    
    Cadena = (String(250, "*"))
    cmd = "U0X"
    bRet = UploadReportDin(status, error, cmd, Cadena)
    txtResp.Text = Cadena & vbCrLf
End Sub

Private Sub btnVenta_Click()
   '////////////////////////////////////////////////
   '// Factura
   '///////////////////////////////////////////////
    List1.Clear
    ListOut ("**Procesando Factura...**")

    cmd = "jR123456-asd"
    Respuesta = SendCmd(status, error, cmd)
    If Respuesta = True Then
        cmd = "jSDany Zambrano"
        Respuesta = SendCmd(status, error, cmd)
        If Respuesta = True Then
            cmd = "j1Direccion: Av Balboa"
            Respuesta = SendCmd(status, error, cmd)
            If Respuesta = True Then
                cmd = " 000000012300002000Lapiz"
                Respuesta = SendCmd(status, error, cmd)
                If Respuesta = True Then
                    cmd = "p-5000"
                    Respuesta = SendCmd(status, error, cmd)
                    If Respuesta = True Then
                       cmd = "101"
                        Respuesta = SendCmd(status, error, cmd)
                        If Respuesta = True Then
                            ListOut ("Documento = OK ")
                        Else
                            ListOut ("Error en el Envio")
                        End If
                    Else
                        ListOut ("Error en el Envio")
                    End If
                Else
                    ListOut ("Error en el Envio")
                End If
            Else
                ListOut ("Error en el Envio")
            End If
        Else
            ListOut ("Error en el Envio")
        End If
    Else
       ListOut ("Error en el Envio")
    End If

End Sub

Private Sub Command19_Click()
'////////////////////////////////////////////
'  Subir Satus 2
'////////////////////////////////////////////
    List1.Clear
    ListOut ("**Solicitando status S1...**")
    
     Cadena = (String(250, "*"))
    cmd = "S2"
    bRet = UploadStatusDin(status, error, cmd, Cadena)
    txtResp.Text = Cadena & vbCrLf
    
End Sub

Private Sub btnSubirS3_Click()
'////////////////////////////////////////////
'  Subir Satus 3
'////////////////////////////////////////////
    List1.Clear
    ListOut ("**Solicitando status S1...**")
    
     Cadena = (String(250, "*"))
    cmd = "S3"
    bRet = UploadStatusDin(status, error, cmd, Cadena)
    txtResp.Text = Cadena & vbCrLf
    


End Sub
Private Sub btnSubirS4_Click()
'////////////////////////////////////////////
'  Subir Satus 4
'////////////////////////////////////////////
    List1.Clear
    ListOut ("**Solicitando status S1...**")
    
     Cadena = (String(250, "*"))
    cmd = "S4"
    bRet = UploadStatusDin(status, error, cmd, Cadena)
    txtResp.Text = Cadena & vbCrLf
    
End Sub


Private Sub btnReporteX_Click()
'////////////////////////////////////////////
'  Reporte X
'////////////////////////////////////////////
    
    List1.Clear
    ListOut ("** Procesando Reporte, Por Favor Espere... **")
    cmd = "I0X"
    Respuesta = SendCmd(status, error, cmd)
    If Respuesta = True Then
       ListOut ("Reporte X = OK")
    Else
       ListOut ("Error en el Envio")
    End If
    
End Sub

Private Sub btnReporteZ_Click()
'////////////////////////////////////////////
'  Reporte Z
'////////////////////////////////////////////
    
    List1.Clear
    ListOut ("** Procesando Reporte, Por Favor Espere... **")
    cmd = "I0Z"
    Respuesta = SendCmd(status, error, cmd)
    If Respuesta = True Then
       ListOut ("Reporte Z = OK")
    Else
       ListOut ("Error en el Envio")
    End If
    
End Sub


Private Sub Command1_Click()

   '////////////////////////////////////////////
   '// Lectura de La Memoria Fiscal por Fecha
   '////////////////////////////////////////////

Dim Desde As String
Dim Hasta As String
Dim DiaInicio As String
Dim DiaFinal As String
Dim MesInicio As String
Dim MesFinal As String
Dim AñoInicio As String
Dim AñoFinal As String

ListOut ("**Impresión de los Datos de la Memoria Fiscal Por Fecha...**")
Desde = DTPicker1.Value
Hasta = DTPicker4.Value
If DTPicker1.Value <= DTPicker4.Value Then
txtResp.Text = "Desde: " + Desde + "    " + "Hasta: " + Hasta
DiaInicio = Format(DTPicker1.Value, "dd")
DiaFinal = Format(DTPicker4.Value, "dd")
MesInicio = Format(DTPicker1.Value, "mm")
MesFinal = Format(DTPicker4.Value, "mm")
AñoInicio = Format(DTPicker1.Value, "yy")
AñoFinal = Format(DTPicker4.Value, "yy")
cmd = "I2A" & DiaInicio & MesInicio & AñoInicio & DiaFinal & MesFinal & AñoFinal
bRet = SendCmd(status, error, cmd)
msg = "SendCmd = " + boolCheck(bRet) + " status = " + Hex$(status) + " error = " + Hex$(error)
ListOut (msg)
Else: MsgBox ("Fecha Final debe ser Mayor que Fecha Inicial")
End If

End Sub

Private Sub btnImpMemAudFech_Click()
  '////////////////////////////////////////////
   '// Lectura de La Memoria de auditoria por Fecha
   '////////////////////////////////////////////

Dim Desde As String
Dim Hasta As String
Dim DiaInicio As String
Dim DiaFinal As String
Dim MesInicio As String
Dim MesFinal As String
Dim AñoInicio As String
Dim AñoFinal As String

ListOut ("**Impresión de los Datos de la Memoria de Auditoria Por Fecha...**")
Desde = DTPicker1.Value
Hasta = DTPicker4.Value
If DTPicker1.Value <= DTPicker4.Value Then
txtResp.Text = "Desde: " + Desde + "    " + "Hasta: " + Hasta
DiaInicio = Format(DTPicker1.Value, "dd")
DiaFinal = Format(DTPicker4.Value, "dd")
MesInicio = Format(DTPicker1.Value, "mm")
MesFinal = Format(DTPicker4.Value, "mm")
AñoInicio = Format(DTPicker1.Value, "yy")
AñoFinal = Format(DTPicker4.Value, "yy")

cmd = "R" & "f" & "0" & AñoInicio & MesInicio & DiaInicio & "0" & AñoFinal & MesFinal & DiaFinal
bRet = SendCmd(status, error, cmd)
msg = "SendCmd = " + boolCheck(bRet) + " status = " + Hex$(status) + " error = " + Hex$(error)
ListOut (msg)
Else: MsgBox ("Fecha Final debe ser Mayor que Fecha Inicial")
End If



End Sub

Private Sub Command10_Click()
   '////////////////////////////////////////////////
   '// Nota de Debito
   '///////////////////////////////////////////////
    List1.Clear
    ListOut ("**Procesando Nota de Debito...**")

    cmd = "jR123456-asd"
    Respuesta = SendCmd(status, error, cmd)
    If Respuesta = True Then
        cmd = "jSDany Zambrano"
        Respuesta = SendCmd(status, error, cmd)
        If Respuesta = True Then
            cmd = "jFAABBCC80000001'00000022"
            Respuesta = SendCmd(status, error, cmd)
            If Respuesta = True Then
                cmd = "`0000000012300002000Lapiz"
                Respuesta = SendCmd(status, error, cmd)
                If Respuesta = True Then
                    cmd = "`1000000012300002000Cuaderno"
                    Respuesta = SendCmd(status, error, cmd)
                    If Respuesta = True Then
                       cmd = "101"
                        Respuesta = SendCmd(status, error, cmd)
                        If Respuesta = True Then
                            ListOut ("Documento = OK ")
                        Else
                            ListOut ("Error en el Envio")
                        End If
                    Else
                        ListOut ("Error en el Envio")
                    End If
                Else
                    ListOut ("Error en el Envio")
                End If
            Else
                ListOut ("Error en el Envio")
            End If
        Else
            ListOut ("Error en el Envio")
        End If
    Else
       ListOut ("Error en el Envio")
    End If

End Sub

Private Sub Command11_Click()
   '////////////////////////////////////////////////
   '// Nota de Credito
   '///////////////////////////////////////////////
    List1.Clear
    ListOut ("**Procesando Nota de Credito...**")

    cmd = "jR123456-asd"
    Respuesta = SendCmd(status, error, cmd)
    If Respuesta = True Then
        cmd = "jSDany Zambrano"
        Respuesta = SendCmd(status, error, cmd)
        If Respuesta = True Then
            cmd = "jFAABBCC80000001'00000022"
            Respuesta = SendCmd(status, error, cmd)
            If Respuesta = True Then
                cmd = "d0000000012300002000Lapiz"
                Respuesta = SendCmd(status, error, cmd)
                If Respuesta = True Then
                    cmd = "d1000000012300002000Cuaderno"
                    Respuesta = SendCmd(status, error, cmd)
                    If Respuesta = True Then
                       cmd = "101"
                        Respuesta = SendCmd(status, error, cmd)
                        If Respuesta = True Then
                            ListOut ("Documento = OK ")
                        Else
                            ListOut ("Error en el Envio")
                        End If
                    Else
                        ListOut ("Error en el Envio")
                    End If
                Else
                    ListOut ("Error en el Envio")
                End If
            Else
                ListOut ("Error en el Envio")
            End If
        Else
            ListOut ("Error en el Envio")
        End If
    Else
       ListOut ("Error en el Envio")
    End If

End Sub

Private Sub Command12_Click()
'////////////////////////////////////////////
'  Subir Satus 5
'////////////////////////////////////////////
    List1.Clear
    ListOut ("**Solicitando status S1...**")
    
     Cadena = (String(250, "*"))
    cmd = "S5"
    bRet = UploadStatusDin(status, error, cmd, Cadena)
    txtResp.Text = Cadena & vbCrLf
    
End Sub

Private Sub Command13_Click()
'////////////////////////////////////////////
'  Reporte X
'////////////////////////////////////////////
    
    List1.Clear
    ListOut ("** Imprimiendo Estado de la Memoria de Auditoria, Por Favor Espere... **")
    cmd = "E"
    Respuesta = SendCmd(status, error, cmd)
    If Respuesta = True Then
       ListOut ("Documento = OK")
    Else
       ListOut ("Error en el Envio")
    End If
    
End Sub

Private Sub Command14_Click()
    '////////////////////////////////////////////////
   '// Impresión del Estado de la Memoria de Auditoria
   '///////////////////////////////////////////////
    List1.Clear
    ListOut ("** Imprimiendo Estado de la Memoria de Auditoria, Por Favor Espere... **")
    cmd = "E"
    Respuesta = SendCmd(status, error, cmd)
    If Respuesta = True Then
       ListOut ("Documento = OK")
    Else
       ListOut ("Error en el Envio")
    End If
End Sub




Private Sub Command17_Click()
   '////////////////////////////////////////////////
   '// Documento No Fiscal
   '///////////////////////////////////////////////
    List1.Clear
    ListOut ("**Procesando Documento No Fiscal...**")

    cmd = "800Prueba de Documento No Fical, Linea 1"
    Respuesta = SendCmd(status, error, cmd)
    If Respuesta = True Then
        cmd = "800Prueba de Documento No Fical, Linea 2"
        Respuesta = SendCmd(status, error, cmd)
        If Respuesta = True Then
            cmd = "80*Prueba de Documento No Fical, Linea 3"
            Respuesta = SendCmd(status, error, cmd)
            If Respuesta = True Then
                cmd = "80!Prueba de Documento No Fical, Linea 4"
                Respuesta = SendCmd(status, error, cmd)
                If Respuesta = True Then
                    cmd = "80$Prueba de Documento No Fical, Linea 5"
                    Respuesta = SendCmd(status, error, cmd)
                    If Respuesta = True Then
                       cmd = "810Prueba de Documento No Fical, Linea 6"
                        Respuesta = SendCmd(status, error, cmd)
                        If Respuesta = True Then
                            ListOut ("Documento = OK ")
                        Else
                            ListOut ("Error en el Envio")
                        End If
                    Else
                        ListOut ("Error en el Envio")
                    End If
                Else
                    ListOut ("Error en el Envio")
                End If
            Else
                ListOut ("Error en el Envio")
            End If
        Else
            ListOut ("Error en el Envio")
        End If
    Else
       ListOut ("Error en el Envio")
    End If

End Sub




Private Sub Command3_Click()

   '////////////////////////////////////////////////
   '// Lectura de La Memoria Fiscal por numero de Z
   '///////////////////////////////////////////////

Dim Desde As String
Dim Hasta As String

ListOut ("**Impresión de los Datos de la Memoria Fiscal Por Numero de Z...**")
Desde = Text1.Text
Hasta = Text2.Text
If Desde <= Hasta Then
txtResp.Text = "Z Desde: " + Desde + "    " + " Z Hasta: " + Hasta
cmd = "I3A" & "00" & Desde & "00" & Hasta
bRet = SendCmd(status, error, cmd)
msg = "SendCmd = " + boolCheck(bRet) + " status = " + Hex$(status) + " error = " + Hex$(error)
ListOut (msg)
Else: MsgBox ("Z Final debe ser Mayor que Z Inicial")
End If

End Sub

Private Sub Command4_Click()
'////////////////////////////////////////////
'         Chequear Impresora
'////////////////////////////////////////////
List1.Clear

ListOut ("**Chequeando Impresora**")

bRet = CheckFprinter()

If bRet = True Then
     ListOut ("Impresora Conectada")
Else
     ListOut ("Error en la Conexion")
End If
End Sub

Private Sub Command5_Click()
'////////////////////////////////////////////
'  Solicitar el Status
'////////////////////////////////////////////
List1.Clear
ListOut ("**Solicitando status y error de la Impresora**")
bRet = ReadFpStatus(status, error)
msg = "Respuesta = " + boolCheck(bRet) + "           STATUS = " + Hex$(status) + "           ERROR = " + Hex$(error)
ListOut (msg)
End Sub

Private Sub Command6_Click()
'////////////////////////////////////////////
'  subir el Reporte Z
'////////////////////////////////////////////
    Dim Ruta_Archivo As String
    Dim bRet As Boolean
    List1.Clear
    ListOut ("**Solicitando Reporte...**")
    
    Ruta_Archivo = "Reporte.txt"
    cmd = "U0Z"
    bRet = UploadReportCmd(status, error, cmd, Ruta_Archivo)



End Sub

Private Sub Command7_Click()
'////////////////////////////////////////////
'  subir el Reporte X
'////////////////////////////////////////////
    Dim Ruta_Archivo As String
    Dim bRet As Boolean
    List1.Clear
    ListOut ("**Solicitando Reporte...**")
    
    Ruta_Archivo = "Reporte.txt"
    cmd = "U0X"
    bRet = UploadReportCmd(status, error, cmd, Ruta_Archivo)
    



End Sub

Private Sub Command8_Click()
   '////////////////////////////////////////////
   '// Carga de la Memoria Fiscal por Fecha
   '////////////////////////////////////////////

Dim Desde As String
Dim Hasta As String
Dim DiaInicio As String
Dim DiaFinal As String
Dim MesInicio As String
Dim MesFinal As String
Dim AñoInicio As String
Dim AñoFinal As String

ListOut ("**Carga de los Datos de la Memoria Fiscal Por Fecha...**")
Desde = DTPicker1.Value
Hasta = DTPicker4.Value
If DTPicker1.Value <= DTPicker4.Value Then
txtResp.Text = "Desde: " + Desde + "    " + "Hasta: " + Hasta
DiaInicio = Format(DTPicker1.Value, "dd")
DiaFinal = Format(DTPicker4.Value, "dd")
MesInicio = Format(DTPicker1.Value, "mm")
MesFinal = Format(DTPicker4.Value, "mm")
AñoInicio = Format(DTPicker1.Value, "yy")
AñoFinal = Format(DTPicker4.Value, "yy")
cmd = "U2A" & DiaInicio & MesInicio & AñoInicio & DiaFinal & MesFinal & AñoFinal
FileName = "Lectura.txt"
bRet = UploadReportCmd(status, error, cmd, FileName)
msg = "UploadReportCmd = " + boolCheck(bRet) + " status = " + Hex$(status) + " error = " + Hex$(error)
ListOut (msg)
VerRespuesta
Else: MsgBox ("Fecha Final debe ser Mayor que Fecha Inicial")
End If
End Sub

Private Sub Command9_Click()
   '////////////////////////////////////////////////
   '// Lectura de La Memoria Fiscal por numero de Z
   '///////////////////////////////////////////////

Dim Desde As String
Dim Hasta As String

ListOut ("**Carga de los Datos de la Memoria Fiscal Por Numero de Z...**")
Desde = Text1.Text
Hasta = Text2.Text
If Desde <= Hasta Then
txtResp.Text = "Z Desde: " + Desde + "    " + " Z Hasta: " + Hasta
cmd = "U3A" & "00" & Desde & "00" & Hasta
FileName = "Reporte.txt"
bRet = UploadReportCmd(status, error, cmd, FileName)
msg = "UploadReportCmd = " + boolCheck(bRet) + " status = " + Hex$(status) + " error = " + Hex$(error)
ListOut (msg)
VerRespuesta
Else: MsgBox ("Z Final debe ser Mayor que Z Inicial")

End If
End Sub

Private Sub Drive1_Change()

On Error GoTo Mensajedeerror
Dir1.Path = Drive1.Drive
Exit Sub

Mensajedeerror:
If Err.Number = 68 Then
MsgBox ("La Unidad no Existe o no esta Disponible")
End If

End Sub

Private Sub Command2_Click()

   '////////////////////////////////////////////
    '// File Command Submit
    '////////////////////////////////////////////
    Dim bRet As Boolean
    Dim lRet As Long
    Dim status As Long
    Dim error As Long
    Dim cmd As String
    Dim msg As String
    Dim Buf As String
    Dim File_Path As String
    Dim FName As String
    

 ListOut ("**File Command Submitting**")
    File_Path = File1.Path
    If Right$(File_Path, 1) = "\" Then File_Path = Left$(File_Path, 2)
    FName = File_Path & "\" & File1.FileName
    lRet = SendFileCmd(status, error, FName)
    
    msg = "SendFileCmd = " + Str$(lRet) + " status = " + Hex$(status) + " error = " + Hex$(error)
    ListOut (msg)

End Sub

Private Sub Dir1_Change()

File1.Path = Dir1.Path
File1.Pattern = "*.dat"

End Sub

Private Sub Form_Load()
    Dim Puerto As String
    
     For i = 1 To 4
       Puerto = "COM" + CStr(i)
       Combo1.AddItem Puerto
     Next i
     Combo1.Text = "COM1"
   
    List1.Clear
    DTPicker1.Value = Date - 1
    DTPicker4.Value = Date
  
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    CloseFpctrl
End Sub







Private Sub PortOpen_Click()
'//////////////////////////////////////////////////
' Apertura del Puerto
'//////////////////////////////////////////////////
Dim bRet As Boolean
Dim Puerto As String

Puerto = Combo1.Text

ListOut ("**Open COM PORT**")
bRet = OpenFpctrl(Puerto)

msg = "OpenFpctrl = " + boolCheck(bRet)
ListOut (msg)

If bRet = True Then
    txtResp.Text = ""
    Frame2.Enabled = True
    Frame7.Enabled = True
    Frame8.Enabled = True
    Frame4.Enabled = True
    Frame6.Enabled = True
    Frame3.Enabled = True
    Frame9.Enabled = True
    Frame5.Enabled = True
    btnImpMemAudFech.Enabled = True
    btnImpAudNum.Enabled = True
    Command12.Enabled = True
    Command13.Enabled = True
    Command14.Enabled = True
End If

End Sub
Private Sub PortClose_Click()
'////////////////////////////////////////////////////
' Cerrar Puerto
'////////////////////////////////////////////////////
Dim bRet As Boolean

    ListOut ("**Close COM Port**")
    bRet = CloseFpctrl()
    
    msg = "CloseFpctrl = " + boolCheck(bRet)
    ListOut (msg)

End Sub

Private Function boolCheck(bVal As Boolean) As String

If bVal = False Then
    boolCheck = "False"
Else
    boolCheck = "True"
End If

End Function

Private Sub LisrClear_Click()
    List1.Clear
End Sub
Private Sub ListOut(msg As String)
Dim msg2 As String
Dim cnt As Long

    msg2 = Time
    msg2 = msg2 + "     " + msg

    List1.AddItem (msg2)
    cnt = List1.ListCount
    List1.ListIndex = (cnt - 1)
    List1.Refresh
    
End Sub



Private Sub btnSubirZ1_Click()
'////////////////////////////////////////////
'  subir el Reporte Z
'////////////////////////////////////////////
    List1.Clear
    ListOut ("**Solicitando Reporte...**")
    
     Cadena = (String(250, "*"))
    cmd = "U0Z"
    bRet = UploadReportDin(status, error, cmd, Cadena)
    txtResp.Text = Cadena & vbCrLf
End Sub


