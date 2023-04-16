Imports MySql.Data.MySqlClient
Module Module1
    Public conn As New MySql.Data.MySqlClient.MySqlConnection
    Public myConnectionString As String

    Public Sub Connect_to_DB()
        myConnectionString = "server=127.0.0.1;" _
                    & "uid=root;" _
                    & "pwd=Nugagawen3;" _
                    & "database=sampledb"

        Try
            conn.ConnectionString = myConnectionString
            conn.Open()
            MsgBox("Connection Successful!")

        Catch ex As MySql.Data.MySqlClient.MySqlException
            MsgBox(Err.Number & " " & Err.Description)
            Select Case ex.Number
                Case 0
                    MsgBox("Cannot Connect to Server")
                Case 1045
                    MsgBox("Invalid Username or Password")
            End Select

        End Try
    End Sub

    Public Sub Disconnect_to_DB()
        conn.Close()
        conn.Dispose()
    End Sub
End Module

