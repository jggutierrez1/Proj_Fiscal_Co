Attribute VB_Name = "mdutil"
Public Const FORMATO_ENTERO_2 As String = "00"
Public Const FORMATO_ENTERO_3 As String = "000"
Public Const FORMATO_ENTERO_4 As String = "0000"
Public Const FORMATO_ENTERO_5 As String = "00000"
Public Const FORMATO_ENTERO_6 As String = "000000"
Public Const FORMATO_ENTERO_9 As String = "000000000"
Public Const FORMATO_ENTERO_12 As String = "000000000000"
Public Const FORMATO_ENTERO_13 As String = "0000000000000"

Public Const FORMATO_PRECIO As String = "0000000000"
Public Const FORMATO_CANTIDAD As String = "00000000"
Public Const FORMATO_DECIMAL As String = "#0.00"

Public Sub Espera(ByVal Tiempo As Double)
    Dim Start As Double
    Start = Timer
    While Timer < Start + Tiempo
        DoEvents
    Wend
End Sub
