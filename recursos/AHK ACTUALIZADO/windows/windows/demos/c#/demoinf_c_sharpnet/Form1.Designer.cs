namespace DemoInf_C_SharpNET
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.grpEjmOperBas = new System.Windows.Forms.GroupBox();
            this.btnDocNoFisc = new System.Windows.Forms.Button();
            this.btnDev = new System.Windows.Forms.Button();
            this.btnFactDatCliente = new System.Windows.Forms.Button();
            this.btnFactBasica = new System.Windows.Forms.Button();
            this.grpReportes = new System.Windows.Forms.GroupBox();
            this.button6 = new System.Windows.Forms.Button();
            this.btnRepZ = new System.Windows.Forms.Button();
            this.btnRepX = new System.Windows.Forms.Button();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.button3 = new System.Windows.Forms.Button();
            this.button5 = new System.Windows.Forms.Button();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.button1 = new System.Windows.Forms.Button();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.button2 = new System.Windows.Forms.Button();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.button4 = new System.Windows.Forms.Button();
            this.button7 = new System.Windows.Forms.Button();
            this.grpEjmOperBas.SuspendLayout();
            this.grpReportes.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox5.SuspendLayout();
            this.SuspendLayout();
            // 
            // grpEjmOperBas
            // 
            this.grpEjmOperBas.Controls.Add(this.btnDocNoFisc);
            this.grpEjmOperBas.Controls.Add(this.btnDev);
            this.grpEjmOperBas.Controls.Add(this.btnFactDatCliente);
            this.grpEjmOperBas.Controls.Add(this.btnFactBasica);
            this.grpEjmOperBas.Enabled = false;
            this.grpEjmOperBas.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grpEjmOperBas.Location = new System.Drawing.Point(6, 292);
            this.grpEjmOperBas.Name = "grpEjmOperBas";
            this.grpEjmOperBas.Size = new System.Drawing.Size(550, 106);
            this.grpEjmOperBas.TabIndex = 3;
            this.grpEjmOperBas.TabStop = false;
            this.grpEjmOperBas.Text = "Operaciones Basicas";
            // 
            // btnDocNoFisc
            // 
            this.btnDocNoFisc.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDocNoFisc.Location = new System.Drawing.Point(417, 23);
            this.btnDocNoFisc.Name = "btnDocNoFisc";
            this.btnDocNoFisc.Size = new System.Drawing.Size(110, 65);
            this.btnDocNoFisc.TabIndex = 4;
            this.btnDocNoFisc.Text = "Documento \r\nNo Fiscal";
            this.btnDocNoFisc.UseVisualStyleBackColor = true;
            this.btnDocNoFisc.Click += new System.EventHandler(this.btnDocNoFisc_Click);
            // 
            // btnDev
            // 
            this.btnDev.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDev.Location = new System.Drawing.Point(148, 23);
            this.btnDev.Name = "btnDev";
            this.btnDev.Size = new System.Drawing.Size(110, 65);
            this.btnDev.TabIndex = 2;
            this.btnDev.Text = "Nota de Debito";
            this.btnDev.UseVisualStyleBackColor = true;
            this.btnDev.Click += new System.EventHandler(this.btnDev_Click);
            // 
            // btnFactDatCliente
            // 
            this.btnFactDatCliente.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnFactDatCliente.Location = new System.Drawing.Point(286, 23);
            this.btnFactDatCliente.Name = "btnFactDatCliente";
            this.btnFactDatCliente.Size = new System.Drawing.Size(110, 65);
            this.btnFactDatCliente.TabIndex = 1;
            this.btnFactDatCliente.Text = "Nota de Credito";
            this.btnFactDatCliente.UseVisualStyleBackColor = true;
            this.btnFactDatCliente.Click += new System.EventHandler(this.btnFactDatCliente_Click);
            // 
            // btnFactBasica
            // 
            this.btnFactBasica.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnFactBasica.Location = new System.Drawing.Point(18, 23);
            this.btnFactBasica.Name = "btnFactBasica";
            this.btnFactBasica.Size = new System.Drawing.Size(110, 65);
            this.btnFactBasica.TabIndex = 0;
            this.btnFactBasica.Text = "Factura";
            this.btnFactBasica.UseVisualStyleBackColor = true;
            this.btnFactBasica.Click += new System.EventHandler(this.btnFactBasica_Click);
            // 
            // grpReportes
            // 
            this.grpReportes.Controls.Add(this.button7);
            this.grpReportes.Controls.Add(this.button6);
            this.grpReportes.Controls.Add(this.btnRepZ);
            this.grpReportes.Controls.Add(this.btnRepX);
            this.grpReportes.Enabled = false;
            this.grpReportes.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grpReportes.Location = new System.Drawing.Point(6, 163);
            this.grpReportes.Name = "grpReportes";
            this.grpReportes.Size = new System.Drawing.Size(370, 95);
            this.grpReportes.TabIndex = 17;
            this.grpReportes.TabStop = false;
            this.grpReportes.Text = "Reportes";
            // 
            // button6
            // 
            this.button6.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F);
            this.button6.Location = new System.Drawing.Point(187, 27);
            this.button6.Name = "button6";
            this.button6.Size = new System.Drawing.Size(82, 48);
            this.button6.TabIndex = 6;
            this.button6.Text = "Upload Fecha Z";
            this.button6.UseVisualStyleBackColor = true;
            this.button6.Click += new System.EventHandler(this.button6_Click);
            // 
            // btnRepZ
            // 
            this.btnRepZ.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F);
            this.btnRepZ.Location = new System.Drawing.Point(99, 27);
            this.btnRepZ.Name = "btnRepZ";
            this.btnRepZ.Size = new System.Drawing.Size(82, 48);
            this.btnRepZ.TabIndex = 5;
            this.btnRepZ.Text = "Reporte Z";
            this.btnRepZ.UseVisualStyleBackColor = true;
            this.btnRepZ.Click += new System.EventHandler(this.btnRepZ_Click);
            // 
            // btnRepX
            // 
            this.btnRepX.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F);
            this.btnRepX.Location = new System.Drawing.Point(13, 27);
            this.btnRepX.Name = "btnRepX";
            this.btnRepX.Size = new System.Drawing.Size(80, 48);
            this.btnRepX.TabIndex = 4;
            this.btnRepX.Text = "Reporte X";
            this.btnRepX.UseVisualStyleBackColor = true;
            this.btnRepX.Click += new System.EventHandler(this.btnRepX_Click);
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.button3);
            this.groupBox2.Enabled = false;
            this.groupBox2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox2.Location = new System.Drawing.Point(448, 20);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(127, 111);
            this.groupBox2.TabIndex = 18;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Programacion";
            // 
            // button3
            // 
            this.button3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F);
            this.button3.Location = new System.Drawing.Point(24, 27);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(97, 54);
            this.button3.TabIndex = 4;
            this.button3.Text = "Imprimir Programacion";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // button5
            // 
            this.button5.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F);
            this.button5.Location = new System.Drawing.Point(37, 38);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(80, 75);
            this.button5.TabIndex = 4;
            this.button5.Text = "S1";
            this.button5.UseVisualStyleBackColor = true;
            this.button5.Click += new System.EventHandler(this.button5_Click);
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.button5);
            this.groupBox4.Controls.Add(this.textBox1);
            this.groupBox4.Enabled = false;
            this.groupBox4.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox4.Location = new System.Drawing.Point(6, 404);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(550, 152);
            this.groupBox4.TabIndex = 20;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Status";
            // 
            // textBox1
            // 
            this.textBox1.BackColor = System.Drawing.Color.White;
            this.textBox1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.textBox1.Location = new System.Drawing.Point(159, 14);
            this.textBox1.Multiline = true;
            this.textBox1.Name = "textBox1";
            this.textBox1.ReadOnly = true;
            this.textBox1.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.textBox1.Size = new System.Drawing.Size(368, 121);
            this.textBox1.TabIndex = 0;
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.comboBox1);
            this.groupBox1.Controls.Add(this.button1);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(19, 17);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(130, 114);
            this.groupBox1.TabIndex = 19;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Puerto";
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Items.AddRange(new object[] {
            "COM1",
            "COM2",
            "COM3",
            "COM4"});
            this.comboBox1.Location = new System.Drawing.Point(28, 32);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(73, 21);
            this.comboBox1.TabIndex = 5;
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F);
            this.button1.Location = new System.Drawing.Point(8, 68);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(110, 35);
            this.button1.TabIndex = 4;
            this.button1.Text = "Open";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.button2);
            this.groupBox3.Enabled = false;
            this.groupBox3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox3.Location = new System.Drawing.Point(182, 17);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(127, 114);
            this.groupBox3.TabIndex = 19;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Status y Error";
            // 
            // button2
            // 
            this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F);
            this.button2.Location = new System.Drawing.Point(20, 38);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(90, 50);
            this.button2.TabIndex = 4;
            this.button2.Text = "Solicitar";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // groupBox5
            // 
            this.groupBox5.Controls.Add(this.button4);
            this.groupBox5.Enabled = false;
            this.groupBox5.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox5.Location = new System.Drawing.Point(315, 17);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Size = new System.Drawing.Size(127, 114);
            this.groupBox5.TabIndex = 20;
            this.groupBox5.TabStop = false;
            this.groupBox5.Text = "Archivo";
            // 
            // button4
            // 
            this.button4.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F);
            this.button4.Location = new System.Drawing.Point(20, 38);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(90, 50);
            this.button4.TabIndex = 4;
            this.button4.Text = "Enviar";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // button7
            // 
            this.button7.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F);
            this.button7.Location = new System.Drawing.Point(275, 27);
            this.button7.Name = "button7";
            this.button7.Size = new System.Drawing.Size(85, 48);
            this.button7.TabIndex = 7;
            this.button7.Text = "Upload Num Z";
            this.button7.UseVisualStyleBackColor = true;
            this.button7.Click += new System.EventHandler(this.button7_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(583, 565);
            this.Controls.Add(this.groupBox5);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.grpReportes);
            this.Controls.Add(this.grpEjmOperBas);
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Demo Informativo Básico en C#";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.grpEjmOperBas.ResumeLayout(false);
            this.grpReportes.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox3.ResumeLayout(false);
            this.groupBox5.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox grpEjmOperBas;
        private System.Windows.Forms.Button btnFactBasica;
        private System.Windows.Forms.Button btnFactDatCliente;
        private System.Windows.Forms.Button btnDev;
        private System.Windows.Forms.Button btnDocNoFisc;
        private System.Windows.Forms.GroupBox grpReportes;
        private System.Windows.Forms.Button btnRepZ;
        private System.Windows.Forms.Button btnRepX;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.GroupBox groupBox5;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button button6;
        private System.Windows.Forms.Button button7;
    }
}

