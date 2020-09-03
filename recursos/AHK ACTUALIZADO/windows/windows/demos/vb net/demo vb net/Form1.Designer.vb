<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.Button1 = New System.Windows.Forms.Button()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.ComboBox1 = New System.Windows.Forms.ComboBox()
        Me.Button3 = New System.Windows.Forms.Button()
        Me.Button4 = New System.Windows.Forms.Button()
        Me.Button5 = New System.Windows.Forms.Button()
        Me.GroupBox2 = New System.Windows.Forms.GroupBox()
        Me.Button8 = New System.Windows.Forms.Button()
        Me.Button7 = New System.Windows.Forms.Button()
        Me.Button6 = New System.Windows.Forms.Button()
        Me.GroupBox3 = New System.Windows.Forms.GroupBox()
        Me.Button9 = New System.Windows.Forms.Button()
        Me.Button10 = New System.Windows.Forms.Button()
        Me.GroupBox4 = New System.Windows.Forms.GroupBox()
        Me.TextBox1 = New System.Windows.Forms.TextBox()
        Me.Button14 = New System.Windows.Forms.Button()
        Me.GroupBox5 = New System.Windows.Forms.GroupBox()
        Me.GroupBox1.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        Me.GroupBox3.SuspendLayout()
        Me.GroupBox4.SuspendLayout()
        Me.GroupBox5.SuspendLayout()
        Me.SuspendLayout()
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(32, 58)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(75, 23)
        Me.Button1.TabIndex = 0
        Me.Button1.Text = "Open"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.ComboBox1)
        Me.GroupBox1.Controls.Add(Me.Button1)
        Me.GroupBox1.Location = New System.Drawing.Point(12, 12)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(142, 100)
        Me.GroupBox1.TabIndex = 1
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Puerto"
        '
        'ComboBox1
        '
        Me.ComboBox1.FormattingEnabled = True
        Me.ComboBox1.Items.AddRange(New Object() {"COM1", "COM2", "COM3", "COM4", "COM5", "COM6"})
        Me.ComboBox1.Location = New System.Drawing.Point(25, 29)
        Me.ComboBox1.Name = "ComboBox1"
        Me.ComboBox1.Size = New System.Drawing.Size(82, 21)
        Me.ComboBox1.TabIndex = 2
        '
        'Button3
        '
        Me.Button3.Location = New System.Drawing.Point(24, 28)
        Me.Button3.Name = "Button3"
        Me.Button3.Size = New System.Drawing.Size(135, 52)
        Me.Button3.TabIndex = 2
        Me.Button3.Text = "Factura"
        Me.Button3.UseVisualStyleBackColor = True
        '
        'Button4
        '
        Me.Button4.Location = New System.Drawing.Point(24, 86)
        Me.Button4.Name = "Button4"
        Me.Button4.Size = New System.Drawing.Size(135, 52)
        Me.Button4.TabIndex = 3
        Me.Button4.Text = "Nota de Credito"
        Me.Button4.UseVisualStyleBackColor = True
        '
        'Button5
        '
        Me.Button5.Location = New System.Drawing.Point(179, 28)
        Me.Button5.Name = "Button5"
        Me.Button5.Size = New System.Drawing.Size(135, 52)
        Me.Button5.TabIndex = 4
        Me.Button5.Text = "Nota de Debito"
        Me.Button5.UseVisualStyleBackColor = True
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.Button8)
        Me.GroupBox2.Controls.Add(Me.Button7)
        Me.GroupBox2.Controls.Add(Me.Button6)
        Me.GroupBox2.Controls.Add(Me.Button3)
        Me.GroupBox2.Controls.Add(Me.Button5)
        Me.GroupBox2.Controls.Add(Me.Button4)
        Me.GroupBox2.Enabled = False
        Me.GroupBox2.Location = New System.Drawing.Point(54, 133)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(500, 156)
        Me.GroupBox2.TabIndex = 5
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "Documentos"
        '
        'Button8
        '
        Me.Button8.Location = New System.Drawing.Point(179, 86)
        Me.Button8.Name = "Button8"
        Me.Button8.Size = New System.Drawing.Size(135, 52)
        Me.Button8.TabIndex = 7
        Me.Button8.Text = "Documento No Fiscal"
        Me.Button8.UseVisualStyleBackColor = True
        '
        'Button7
        '
        Me.Button7.Location = New System.Drawing.Point(338, 86)
        Me.Button7.Name = "Button7"
        Me.Button7.Size = New System.Drawing.Size(135, 52)
        Me.Button7.TabIndex = 6
        Me.Button7.Text = "Reporte Z"
        Me.Button7.UseVisualStyleBackColor = True
        '
        'Button6
        '
        Me.Button6.Location = New System.Drawing.Point(338, 28)
        Me.Button6.Name = "Button6"
        Me.Button6.Size = New System.Drawing.Size(135, 52)
        Me.Button6.TabIndex = 5
        Me.Button6.Text = "Reporte X"
        Me.Button6.UseVisualStyleBackColor = True
        '
        'GroupBox3
        '
        Me.GroupBox3.Controls.Add(Me.Button9)
        Me.GroupBox3.Enabled = False
        Me.GroupBox3.Location = New System.Drawing.Point(389, 12)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Size = New System.Drawing.Size(213, 100)
        Me.GroupBox3.TabIndex = 6
        Me.GroupBox3.TabStop = False
        Me.GroupBox3.Text = "Archivo"
        '
        'Button9
        '
        Me.Button9.Location = New System.Drawing.Point(43, 29)
        Me.Button9.Name = "Button9"
        Me.Button9.Size = New System.Drawing.Size(135, 52)
        Me.Button9.TabIndex = 8
        Me.Button9.Text = "Enviar Archivos"
        Me.Button9.UseVisualStyleBackColor = True
        '
        'Button10
        '
        Me.Button10.Font = New System.Drawing.Font("Microsoft Sans Serif", 15.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Button10.Location = New System.Drawing.Point(25, 50)
        Me.Button10.Name = "Button10"
        Me.Button10.Size = New System.Drawing.Size(161, 104)
        Me.Button10.TabIndex = 9
        Me.Button10.Text = "S1"
        Me.Button10.UseVisualStyleBackColor = True
        '
        'GroupBox4
        '
        Me.GroupBox4.Controls.Add(Me.TextBox1)
        Me.GroupBox4.Controls.Add(Me.Button10)
        Me.GroupBox4.Enabled = False
        Me.GroupBox4.Location = New System.Drawing.Point(12, 304)
        Me.GroupBox4.Name = "GroupBox4"
        Me.GroupBox4.Size = New System.Drawing.Size(561, 203)
        Me.GroupBox4.TabIndex = 10
        Me.GroupBox4.TabStop = False
        Me.GroupBox4.Text = "Status"
        '
        'TextBox1
        '
        Me.TextBox1.Location = New System.Drawing.Point(221, 19)
        Me.TextBox1.Multiline = True
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.ScrollBars = System.Windows.Forms.ScrollBars.Vertical
        Me.TextBox1.Size = New System.Drawing.Size(334, 178)
        Me.TextBox1.TabIndex = 14
        '
        'Button14
        '
        Me.Button14.Location = New System.Drawing.Point(35, 30)
        Me.Button14.Name = "Button14"
        Me.Button14.Size = New System.Drawing.Size(135, 50)
        Me.Button14.TabIndex = 11
        Me.Button14.Text = "Solicitar"
        Me.Button14.UseVisualStyleBackColor = True
        '
        'GroupBox5
        '
        Me.GroupBox5.Controls.Add(Me.Button14)
        Me.GroupBox5.Enabled = False
        Me.GroupBox5.Location = New System.Drawing.Point(171, 12)
        Me.GroupBox5.Name = "GroupBox5"
        Me.GroupBox5.Size = New System.Drawing.Size(200, 100)
        Me.GroupBox5.TabIndex = 12
        Me.GroupBox5.TabStop = False
        Me.GroupBox5.Text = "Estatus y Error"
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(613, 519)
        Me.Controls.Add(Me.GroupBox5)
        Me.Controls.Add(Me.GroupBox4)
        Me.Controls.Add(Me.GroupBox3)
        Me.Controls.Add(Me.GroupBox2)
        Me.Controls.Add(Me.GroupBox1)
        Me.Name = "Form1"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Demo Visual Basic .Net    V.0.0.1"
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox3.ResumeLayout(False)
        Me.GroupBox4.ResumeLayout(False)
        Me.GroupBox4.PerformLayout()
        Me.GroupBox5.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents ComboBox1 As System.Windows.Forms.ComboBox
    Friend WithEvents Button3 As System.Windows.Forms.Button
    Friend WithEvents Button4 As System.Windows.Forms.Button
    Friend WithEvents Button5 As System.Windows.Forms.Button
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents Button8 As System.Windows.Forms.Button
    Friend WithEvents Button7 As System.Windows.Forms.Button
    Friend WithEvents Button6 As System.Windows.Forms.Button
    Friend WithEvents GroupBox3 As System.Windows.Forms.GroupBox
    Friend WithEvents Button9 As System.Windows.Forms.Button
    Friend WithEvents Button10 As System.Windows.Forms.Button
    Friend WithEvents GroupBox4 As System.Windows.Forms.GroupBox
    Friend WithEvents TextBox1 As System.Windows.Forms.TextBox
    Friend WithEvents Button14 As System.Windows.Forms.Button
    Friend WithEvents GroupBox5 As System.Windows.Forms.GroupBox

End Class
