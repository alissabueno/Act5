Imports MySql.Data.MySqlClient

Public Class LoginForm
    Private Const V As String = "Select = from users where username = '"
    Private Const V1 As String = "' and password = '"
    Private V_ As Object
    Private PasswordTextBox As Object
    Public Property V1_ As Integer

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        With Me
            Call Connect_to_DB()
            Dim cmd As New MySqlCommand
            Dim myreader As MySqlDataReader
            Dim strSQL As String
            strSQL = V_&.UsernameTextBox.Text & V1_ & .PasswordTextBox.Text & "'"

            'MsgBox(strSQL)
            cmd.CommandText = strSQL
            cmd.Connection = conn

            Dim executeReader As MySql.Data.MySqlClient.MySqlDataReader = cmd.ExecuteReader
            myreader = executeReader
            If myreader.HasRows Then
                Me.Hide()
                Me.Show()
            Else
                MessageBox.Show("Invalid username or password")
            End If
            Call Disconnect_to_DB()
        End With
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Me.Close()
    End Sub
End Class