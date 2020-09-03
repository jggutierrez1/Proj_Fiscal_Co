using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using TFHKADIR;                        // llamado a la Referencia TFHKADIR.DLL

namespace DemoInf_C_SharpNET
{
    public partial class Form1 : Form
    {

        //**************************************************************************************************************
        //*************************************************** Variables Generales **************************************
        //**************************************************************************************************************
        private Tfhka tf;
        static public string Puerto1;
        public string Puerto = "COM10", Comando;
        public int num_Inicial, num_Final;
        public string Fecha_Inicial, Fecha_Final, Modo, Trama;



        //**************************************************************************************************************
        //*************************************************** Inicio del Aplicativo ************************************
        //**************************************************************************************************************
        public Tfhka Tf
        {
            get { return tf; }
            set { tf = value; }
        }

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            comboBox1.SelectedIndex = 0;
                //instancio la dll con el puerto
                tf = new Tfhka(Puerto);
                if (tf.StatusPort == true)
                {
                    
                }
                else
                {

                    MessageBox.Show("Error en la apertura del puerto");
                }
        }


      

       
        

        

      

        private void button3_Click(object sender, EventArgs e)
        {

            if (tf.SendCmd("D") == true)
            {
                MessageBox.Show("Documento Impreso");
            }
            else
            {
                MessageBox.Show("Error en el envio");
            }

        }




        //**************************************************************************************************************
        //*************************************************** Reportes *************************************************
        //**************************************************************************************************************
        private void btnRepX_Click(object sender, EventArgs e)
        {
            if (tf.SendCmd("I0X") == true)
            {
                MessageBox.Show("Reporte Impreso");
            }
            else
            {
                MessageBox.Show("Error en el envio");
            }
        }

        private void btnRepZ_Click(object sender, EventArgs e)
        {
            if (tf.SendCmd("I0Z") == true)
            {
                MessageBox.Show("Reporte Impreso");
            }
            else
            {
                MessageBox.Show("Error en el envio");
            }
           
        }

        



        //**************************************************************************************************************
        //*************************************************** Status *************************************************
        //**************************************************************************************************************
        private void button5_Click(object sender, EventArgs e)
        {

                textBox1.Clear();
                

                if (tf.CheckFprinter() == true)
                {
                    tf.getS1PrinterData();

                    textBox1.Text = "Status -->   S1" + "\r\n";
                    textBox1.Text = textBox1.Text + "Cajero --> " + tf.S1Estado1.getCashierNumber() + "\r\n";
                    textBox1.Text = textBox1.Text + "# de Reportes en la Memoria Fiscal --> " + tf.S1Estado1.getFiscalReportsCounter() + "\r\n";
                    textBox1.Text = textBox1.Text + "Fecha y hora --> " + tf.S1Estado1.getCurrentPrinterDateTime() + "\r\n";
                    textBox1.Text = textBox1.Text + "# del Ultimo Reporte Z " + tf.S1Estado1.getDailyClosureCounter() + "\r\n";
                    textBox1.Text = textBox1.Text + "DV --> " + tf.S1Estado1.getDV() + "\r\n";
                    textBox1.Text = textBox1.Text + "# de la Ultima Factura  --> " + tf.S1Estado1.getLastInvoiceNumber() + "\r\n";
                    textBox1.Text = textBox1.Text + "# de la Ultima nota de Credito --> " + tf.S1Estado1.getLastNCNumber() + "\r\n";
                    textBox1.Text = textBox1.Text + "# de la Ultima nota de Debito --> " + tf.S1Estado1.getLastNDNumber() + "\r\n";
                    textBox1.Text = textBox1.Text + "# del ultimo documento No fiscal --> " + tf.S1Estado1.getNumberNonFiscalDocuments() + "\r\n";
                    textBox1.Text = textBox1.Text + "# de los DNF del dia --> " + tf.S1Estado1.getQuantityNonFiscalDocuments() + "\r\n";
                    textBox1.Text = textBox1.Text + "# de  facturas del dia --> " + tf.S1Estado1.getQuantityOfInvoicesToday() + "\r\n";
                    textBox1.Text = textBox1.Text + "# de notas de Credito del dia--> " + tf.S1Estado1.getQuantityOfNCsToday() + "\r\n";
                    textBox1.Text = textBox1.Text + "# de notas de Debito del dia --> " + tf.S1Estado1.getQuantityOfNDsToday() + "\r\n";
                    textBox1.Text = textBox1.Text + "Serial --> " + tf.S1Estado1.getRegisteredMachineNumber() + "\r\n";
                    textBox1.Text = textBox1.Text + "RUC --> " + tf.S1Estado1.getRUC() + "\r\n";
                    textBox1.Text = textBox1.Text + "Total de Ventas --> " + tf.S1Estado1.getTotalDailySales() + "\r\n";




                }
                else 
                {
                    
                }


            
        }

       


        //**************************************************************************************************************
        //************************************************* Documentos *************************************************
        //**************************************************************************************************************
        private void btnFactBasica_Click(object sender, EventArgs e)
        {

            if (tf.SendCmd("jRABCDEF-00056454") == true)
            {
                if (tf.SendCmd("jSDany Zambrano") == true)
                {                   
                        if (tf.SendCmd("@Producto en Promocion") == true)
                        {
                            if (tf.SendCmd("#000000024500002000Lapiz") == true)
                            {
                                if (tf.SendCmd("101") == true)
                                {
                                    MessageBox.Show("Factura Impresa");
                                }
                                else
                                {
                                    MessageBox.Show("Error en el envio");
                                }
                            }
                            else
                            {
                                MessageBox.Show("Error en el envio");
                            }
                        }
                        else
                        {
                            MessageBox.Show("Error en el envio");
                        }
                    }
                    else
                    {
                        MessageBox.Show("Error en el envio");
                    }
                }
                else
                {
                    MessageBox.Show("Error en el envio");
                }
            

        }

        private void btnFactDatCliente_Click(object sender, EventArgs e)
        {
            if (tf.SendCmd("jR12357578") == true)
                {
                if (tf.SendCmd("jSDany Zambrano") == true)
                {
                    if (tf.SendCmd("jFAABBCC8000001-00000034") == true)
                    {
                        if (tf.SendCmd("AProducto en Promocion") == true)
                        {
                            if (tf.SendCmd("d3000000024500002000Lapiz") == true)
                            {
                                if (tf.SendCmd("101") == true)
                                {
                                    MessageBox.Show("Nota de Debito procesado");
                                }
                                else
                                {
                                    MessageBox.Show("Error en el envio");
                                }
                            }
                            else
                            {
                                MessageBox.Show("Error en el envio");
                            }
                        }
                        else
                        {
                            MessageBox.Show("Error en el envio");
                        }
                    }
                    else
                    {
                        MessageBox.Show("Error en el envio");
                    }
                }
                else
                {
                    MessageBox.Show("Error en el envio");
                }

                }
            else
            {
                MessageBox.Show("Error en el envio");
            }
             
        }

        private void btnVtaDesc_Click(object sender, EventArgs e)
        {
           
                if (tf.CheckFprinter() == true)
                {
                   
                    Comando = "i01Nombre: Pedro Perez                     ";
                    tf.SendCmd(Comando);

                    Comando = "i02RIF/CI: V-12345678                      ";
                    tf.SendCmd(Comando);
                    Comando = "i03Nro.Fact.Devol: 00000012                ";
                    tf.SendCmd(Comando);
                    Comando = "i04Nro.Reg.Maquina: ABC0000000             ";
                    tf.SendCmd(Comando);
                    Comando = "i05Fecha: 10/03/2008    Hora: 10:04        ";
                    tf.SendCmd(Comando);
                    Comando = "d0000000002000001000PLU Exento                              ";
                    tf.SendCmd(Comando);
                    Comando = "d1000000002000001000PLU Tasa1                               ";
                    tf.SendCmd(Comando);
                    Comando = "f01000000004000";
                    tf.SendCmd(Comando);
                    Comando = "101";
                    tf.SendCmd(Comando);
                }
                else
                {
                  
                }

               

          
        }

        private void btnDev_Click(object sender, EventArgs e)
        {

         if (tf.SendCmd("jR12344567") == true)
                {
                if (tf.SendCmd("jSDany Zambrano") == true)
                {
                    if (tf.SendCmd("jFAABBCC8000001-00000034") == true)
                    {
                        if (tf.SendCmd("BProducto en Promocion") == true)
                        {
                            if (tf.SendCmd("`3000000024500002000Lapiz") == true)
                            {
                                if (tf.SendCmd("101") == true)
                                {
                                    MessageBox.Show("Nota de Debito procesado");
                                }
                                else
                                {
                                    MessageBox.Show("Error en el envio");
                                }
                            }
                            else
                            {
                                MessageBox.Show("Error en el envio");
                            }
                        }
                        else
                        {
                            MessageBox.Show("Error en el envio");
                        }
                    }
                    else
                    {
                        MessageBox.Show("Error en el envio");
                    }
                }
                else
                {
                    MessageBox.Show("Error en el envio");
                }
                }
         else
         {
             MessageBox.Show("Error en el envio");
         }
               
        }

       

        private void btnDocNoFisc_Click(object sender, EventArgs e)
        {
            if (tf.SendCmd("800Linea de Prueba 1") == true)
            {
                if (tf.SendCmd("80*Linea de Prueba 2") == true)
                {
                    if (tf.SendCmd("80>Linea de Prueba 3") == true)
                    {
                        if (tf.SendCmd("80!Linea de Prueba 4") == true)
                        {
                            if (tf.SendCmd("80$Linea de Prueba 5") == true)
                            {
                                if (tf.SendCmd("810Linea de Prueba 6") == true)
                                {
                                    MessageBox.Show("Documento No Fiscal Procesado");
                                }
                                else
                                {
                                    MessageBox.Show("Error en el envio");
                                }
                            }
                            else
                            {
                                MessageBox.Show("Error en el envio");
                            }
                        }
                        else
                        {
                            MessageBox.Show("Error en el envio");
                        }
                    }
                    else
                    {
                        MessageBox.Show("Error en el envio");
                    }
                }
                else
                {
                    MessageBox.Show("Error en el envio");
                }
            }
            else
            {
                MessageBox.Show("Error en el envio");
            }
               

        }

        private void button1_Click(object sender, EventArgs e)
        {
            groupBox1.Enabled = false;
            groupBox3.Enabled = true;
            grpReportes.Enabled = true;
            grpEjmOperBas.Enabled = true;
            groupBox2.Enabled = true;
            groupBox5.Enabled = true;
            groupBox4.Enabled = true;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (tf.ReadFpStatus() == true)
            {
                MessageBox.Show("Respuesta = " + tf.Status_Error);
            }
            else
            {
                MessageBox.Show("Error en el envio");
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            OpenFileDialog dlg = new OpenFileDialog();

            if (dlg.ShowDialog() == DialogResult.OK)
            {
                tf.SendFileCmd(dlg.FileName);
                

            }
        }

        private void button6_Click(object sender, EventArgs e)
        {
            try
            {
               
                DateTime DateIni = new DateTime(2011, 05, 09);
                DateTime DateEnd = new DateTime(2011, 05, 09);
                tf.getZReport(DateIni, DateEnd);
                

                if (tf.ReporteArrayPC1 != null)
                {

                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].NumeroDelUltimoReporteZ) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].FechaReporteZ) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].TotalVentasExento) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].TotalImpuestoA) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].TotalImpuestoB) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].TotalImpuestoC) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].TotalVentas) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].TotalNotaDeCredito) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].TotalNotaDeDebito) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].NumeroDeLaUltimaFactura) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].Fecha_HoradelaUltimaFactura) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].NumeroDeLaUltimaNotaDeCredito) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].NumeroDeLaUltimaNotaDeDebito) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].NumeroDelUltimoDocumentoNoFiscal) + "\n";



                    //Etiqueta_mensaje("Reporte Extraido...", 100);

                }
                else
                {
                    this.Cursor = Cursors.Default;
                    MessageBox.Show("Error en el Envio!!!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (PrinterExeption er)
            {
                this.Cursor = Cursors.Default;
                MessageBox.Show("Error en el Envio!!!" + er, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            try
            {
                // prueba por numero
                tf.getZReport(11, 11);


                if (tf.ReporteArrayPC1 != null)
                {

                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].NumeroDelUltimoReporteZ) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].FechaReporteZ) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].TotalVentasExento) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].TotalImpuestoA) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].TotalImpuestoB) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].TotalImpuestoC) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].TotalVentas) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].TotalNotaDeCredito) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].TotalNotaDeDebito) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].NumeroDeLaUltimaFactura) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].Fecha_HoradelaUltimaFactura) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].NumeroDeLaUltimaNotaDeCredito) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].NumeroDeLaUltimaNotaDeDebito) + "\n";
                    textBox1.Text = textBox1.Text + Convert.ToString(tf.ReporteArrayPC1[0].NumeroDelUltimoDocumentoNoFiscal) + "\n";



                    //Etiqueta_mensaje("Reporte Extraido...", 100);

                }
                else
                {
                    this.Cursor = Cursors.Default;
                    MessageBox.Show("Error en el Envio!!!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (PrinterExeption er)
            {
                this.Cursor = Cursors.Default;
                MessageBox.Show("Error en el Envio!!!" + er, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button8_Click(object sender, EventArgs e)
        {
           
        }

        








       
    





}       
    
}