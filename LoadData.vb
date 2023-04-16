Imports System.Data.SqlClient
Imports System.IO
Imports MySql.Data.MySqlClient
Imports System.Diagnostics
Public Class Form2
    Private Sub Form2_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Me.Visible = True
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim openFileDialog1 As New OpenFileDialog()

        ' Set the filter to allow only CSV files to be selected.
        openFileDialog1.Filter = "CSV files (*.csv)|*.csv"

        ' Display the dialog box and wait for the user to select a file.
        If openFileDialog1.ShowDialog() = DialogResult.OK Then
            ' Get the selected file name and display it in a TextBox.
            Dim fileName As String = openFileDialog1.FileName
            Me.TextBox1.Text = fileName

            ' Load the CSV file into a DataTable.
            Dim dt As New DataTable()
            Using sr As New StreamReader(fileName)
                Dim header As Boolean = True
                While Not sr.EndOfStream
                    Dim line As String = sr.ReadLine()
                    Dim values As String() = line.Split(","c)
                    If header Then
                        For Each value In values
                            dt.Columns.Add(value)
                        Next
                        header = False
                    Else
                        dt.Rows.Add(values)
                    End If
                End While
            End Using

            Me.DataGridView1.DataSource = dt
        End If
    End Sub


    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim backup As New SaveFileDialog
        backup.InitialDirectory = "C://"
        backup.Title = "Database Backup"
        backup.CheckFileExists = False
        backup.CheckPathExists = False
        backup.DefaultExt = "sql"
        backup.Filter = "sql files (*.sql)|*.sql|All files (*.*)|*.*"
        backup.RestoreDirectory = True

        If backup.ShowDialog = Windows.Forms.DialogResult.OK Then
            Dim con As MySqlConnection = New MySqlConnection("server=localhost;user=root;password=Nugagawen3;database=sampledb;charset=utf8")
            Dim cmd As MySqlCommand = New MySqlCommand
            cmd.Connection = con
            con.Open()
            Dim mb As MySqlBackup = New MySqlBackup(cmd)
            mb.ExportToFile(backup.FileName)
            con.Close()
        ElseIf backup.ShowDialog = Windows.Forms.DialogResult.Cancel Then
            Return
        End If

        MsgBox("Database backup complete")

    End Sub
End Class