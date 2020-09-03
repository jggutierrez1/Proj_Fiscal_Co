Attribute VB_Name = "mdArchivo"
Public Const MAX_LINEAS As Integer = 10001

Public sLineas(0 To MAX_LINEAS) As String


'Funcion: LeerArchivo
'Permite leer un archivo de texto plano, por ejemplo un archivo PRGB.01
Public Function LeerArchivo(sNombreArchivo As String) As Integer
Dim NumeroArchivo
Dim i As Integer

   NumeroArchivo = FreeFile   ' Obtiene un número
     
' de archivo que no se ha utilizado.
   Open sNombreArchivo For Input As #NumeroArchivo
   
   i = 0
   While Not EOF(NumeroArchivo) And i < MAX_LINEAS
    Line Input #NumeroArchivo, sLineas(i)
    i = i + 1
   Wend
   
   LeerArchivo = i
   
   Close #NumeroArchivo   ' Cierra el archivo.
    
End Function

'Funcion: GrabarArchivo
'Permite escribir en un archivo de texto plano, por ejemplo un archivo PRGB.01
Public Function GrabarArchivo(sNombreArchivo As String, NLineas As Integer) As Integer
Dim NumeroArchivo
Dim i As Integer

   NumeroArchivo = FreeFile   ' Obtiene un número
   
' de archivo que no se ha utilizado.
   Open sNombreArchivo For Output As #NumeroArchivo
   
   For i = 0 To NLineas
    Print #NumeroArchivo, sLineas(i)
   Next i
   
   Close #NumeroArchivo   ' Cierra el archivo.

    GrabarArchivo = i
    
End Function



