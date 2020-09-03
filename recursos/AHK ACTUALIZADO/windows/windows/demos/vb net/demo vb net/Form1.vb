Public Class Form1

'Declarar la dll "TFHKADIR"
    Dim tfhka As New TFHKADIR.Tfhka("COM1")
    Dim respuesta As Boolean
    Private fdlg As OpenFileDialog = New OpenFileDialog()



    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        'Apertura del Puerto

        tfhka.CloseFpctrl()

        respuesta = tfhka.OpenFpctrl(ComboBox1.Text)

        If (respuesta) Then
            GroupBox2.Enabled = True
            GroupBox3.Enabled = True
            GroupBox4.Enabled = True
            GroupBox5.Enabled = True
            GroupBox1.Visible = False
        End If
    End Sub

    Private Sub Button6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button6.Click
        Dim comando As String

        comando = "I0X"
        respuesta = tfhka.SendCmd(comando)

        If (respuesta) Then
            MessageBox.Show("Reporte X Procesado")
        End If
    End Sub

   
    Private Sub Button14_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button14.Click
        Dim estaPrint As TFHKADIR.PrinterStatus

        estaPrint = tfhka.getPrinterStatus()

        If (respuesta) Then
            MessageBox.Show("Estado: " & estaPrint.PrinterStatusCode & " Error: " & estaPrint.PrinterErrorCode)
        End If
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        ComboBox1.SelectedIndex = 0


    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click

        Dim comando As String

        comando = "jRABCDEF-12345"
        If (tfhka.SendCmd(comando)) Then
            comando = "jSDany Zambrano"
            If (tfhka.SendCmd(comando)) Then
                comando = "j1Direccion: Aquilino de la Guardia"
                If (tfhka.SendCmd(comando)) Then
                    comando = "@Producto en Promocion"
                    If (tfhka.SendCmd(comando)) Then
                        comando = "!000000123400001000Lapiz"
                        If (tfhka.SendCmd(comando)) Then
                            comando = "!000000120800001000Lapiz"
                            If (tfhka.SendCmd(comando)) Then
                                comando = "!000000129900001000Lapiz"
                                If (tfhka.SendCmd(comando)) Then
                                    comando = "!000000129900010000Lapiz"
                                    tfhka.SendCmd("y10202")
                                    If (tfhka.SendCmd(comando)) Then
                                        comando = "201000000005000"
                                        If (tfhka.SendCmd(comando)) Then
                                            comando = "202000000012902"
                                            If (tfhka.SendCmd(comando)) Then
                                                MessageBox.Show("Factura Procesada!")
                                            End If
                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If
                End If
            End If
        End If

    End Sub

    Private Sub Button7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button7.Click
        Dim comando As String

        comando = "I0Z"
        respuesta = tfhka.SendCmd(comando)

        If (respuesta) Then
            MessageBox.Show("Reporte Z Procesado")
        End If
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        Dim comando As String

        comando = "jRABCDEF-12345"
        If (tfhka.SendCmd(comando)) Then
            comando = "jSDany Zambrano"
            If (tfhka.SendCmd(comando)) Then
                comando = "jFAABBCC800001-00000021"
                If (tfhka.SendCmd(comando)) Then
                    comando = "j1linea de dato de cliente"
                    If (tfhka.SendCmd(comando)) Then
                        comando = "d0000000123400002000Lapiz"
                        If (tfhka.SendCmd(comando)) Then
                            comando = "d1000000045800001000Reloj"
                            If (tfhka.SendCmd(comando)) Then
                                comando = "101"
                                If (tfhka.SendCmd(comando)) Then
                                    MessageBox.Show("Nota de credito Procesada!")
                                End If
                            End If
                        End If
                    End If
                End If
            End If
        End If
    End Sub

    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        Dim comando As String

        comando = "jRABCDEF-12345"
        If (tfhka.SendCmd(comando)) Then
            comando = "jSDany Zambrano"
            If (tfhka.SendCmd(comando)) Then
                comando = "jFAABBCC800001-00000021"
                If (tfhka.SendCmd(comando)) Then
                    comando = "j1linea de dato de cliente"
                    If (tfhka.SendCmd(comando)) Then
                        comando = "`0000000123400002000Lapiz"
                        If (tfhka.SendCmd(comando)) Then
                            comando = "`1000000045800001000Reloj"
                            If (tfhka.SendCmd(comando)) Then
                                comando = "101"
                                If (tfhka.SendCmd(comando)) Then
                                    MessageBox.Show("Nota de Debito Procesada!")
                                End If
                            End If
                        End If
                    End If
                End If
            End If
        End If
    End Sub

    Private Sub Button8_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button8.Click
        Dim comando As String

        comando = "800Linea de prueba 1"
        If (tfhka.SendCmd(comando)) Then
            comando = "80*Linea de prueba 2"
            If (tfhka.SendCmd(comando)) Then
                comando = "80>Linea de prueba 3"
                If (tfhka.SendCmd(comando)) Then
                    comando = "80$Linea de prueba 4"
                    If (tfhka.SendCmd(comando)) Then
                        comando = "80!Linea de prueba 5"
                        If (tfhka.SendCmd(comando)) Then
                            comando = "800Linea de prueba 6"
                            If (tfhka.SendCmd(comando)) Then
                                comando = "810Linea de prueba 7"
                                If (tfhka.SendCmd(comando)) Then
                                    MessageBox.Show("Documento No Fiscal Procesado!")
                                End If
                            End If
                        End If
                    End If
                End If
            End If
        End If
    End Sub

    Private Sub Button10_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button10.Click

        If (tfhka.CheckFprinter() = True) Then

            tfhka.getS1PrinterData()

            TextBox1.Text += "Numero de Cajero = " + tfhka.S1Estado1.getCashierNumber().ToString() & vbCrLf
            TextBox1.Text += "Contador de Reportes de Memoria Fiscal = " + tfhka.S1Estado1.getFiscalReportsCounter().ToString() & vbCrLf
            TextBox1.Text += "Fecha Actual  = " + tfhka.S1Estado1.getCurrentPrinterDateTime().ToString() & vbCrLf
            TextBox1.Text += "Contador de Cierres Diarios (Z) = " + tfhka.S1Estado1.getDailyClosureCounter().ToString() & vbCrLf
            TextBox1.Text += "DV = " + tfhka.S1Estado1.getDV().ToString() & vbCrLf
            TextBox1.Text += "# de la ultima Factura = " + tfhka.S1Estado1.getLastInvoiceNumber().ToString() & vbCrLf
            TextBox1.Text += "# de la ultima Nota de credito = " + tfhka.S1Estado1.getLastNCNumber().ToString() & vbCrLf
            TextBox1.Text += "# de la ultima Nota de Debito = " + tfhka.S1Estado1.getLastNDNumber().ToString() & vbCrLf
            TextBox1.Text += "# de docuementos no fiscales = " + tfhka.S1Estado1.getNumberNonFiscalDocuments().ToString() & vbCrLf
            TextBox1.Text += "# del Ultimo Documento No Fiscal = " + tfhka.S1Estado1.getQuantityNonFiscalDocuments().ToString() & vbCrLf

            TextBox1.Text += "# de facturas del dia = " + tfhka.S1Estado1.getQuantityOfInvoicesToday().ToString() & vbCrLf
            TextBox1.Text += "# de notas de credito del dia = " + tfhka.S1Estado1.getQuantityOfNCsToday().ToString() & vbCrLf
            TextBox1.Text += "# de notas de debito del dia = " + tfhka.S1Estado1.getQuantityOfNDsToday().ToString() & vbCrLf
            TextBox1.Text += "Serial de la Maquina " + tfhka.S1Estado1.getRegisteredMachineNumber().ToString() & vbCrLf

            TextBox1.Text += "RUC = " + tfhka.S1Estado1.getRUC().ToString() & vbCrLf
            TextBox1.Text += "Total de Ventas del dia = " + tfhka.S1Estado1.getTotalDailySales().ToString() & vbCrLf



        End If



    End Sub

    Private Sub Button9_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button9.Click

        If fdlg.ShowDialog() = DialogResult.OK Then
            If (tfhka.SendFileCmd(fdlg.FileName)) Then
                MessageBox.Show("Archivo Enviado!")
            End If
        End If
        
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)



    End Sub
End Class
