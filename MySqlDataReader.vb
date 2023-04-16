Friend Class MySqlDataReader
    Public Property HasRows As Boolean

    Public Shared Widening Operator CType(v As MySql.Data.MySqlClient.MySqlDataReader) As MySqlDataReader
        Throw New NotImplementedException()
    End Operator
End Class
