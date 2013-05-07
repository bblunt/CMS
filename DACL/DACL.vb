Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Data

Public Class DACL
    Protected Shared Sub DebugWriteLine(ByVal Line As String)
        System.Diagnostics.Debug.Indent()
        Try
            System.Diagnostics.Debug.WriteLine(System.DateTime.Now.ToString() & ":" & Microsoft.VisualBasic.ControlChars.Tab & Line)
        Finally
            System.Diagnostics.Debug.Unindent()
        End Try
        System.Diagnostics.Debug.Flush()
    End Sub
    Protected Shared Sub DebugWriteLine(ByVal StartDateTime As System.DateTime, ByVal Text As String)
        Dim pMilliseconds As String = System.DateTime.Now.Subtract(StartDateTime).Milliseconds.ToString()
        DACL.DebugWriteLine(pMilliseconds.PadLeft(4 - pMilliseconds.Length) & _
            " milliseconds:" & Microsoft.VisualBasic.ControlChars.Tab & Text)
    End Sub

    Private Shared Function GetConnection(ByVal DBConnection As DBConnections) As String
        Return ConfigurationManager.ConnectionStrings("cms").ConnectionString
    End Function

    Public Shared Function QuerySql(ByVal SQL As String) As DataTable
        Return QuerySql(SQL, DBConnections.CMS)
    End Function

    Public Shared Function QuerySql(ByVal SQL As String, ByVal DBConnection As DBConnections) As DataTable
        Dim pDataSet As DataSet = New DataSet()
        Using pConnection As New SqlConnection(GetConnection(DBConnection))
            pConnection.Open()
            Using pCommand As SqlCommand = pConnection.CreateCommand()
                pCommand.CommandType = CommandType.Text
                pCommand.CommandText = SQL
                Using pAdapter As New SqlDataAdapter(pCommand)
                    pAdapter.Fill(pDataSet)
                End Using
            End Using
        End Using

        Return pDataSet.Tables(0)
    End Function
    Public Shared Function QuerySP(ByVal SPName As String, _
    ByVal Parameters As System.Collections.Generic.List(Of System.Data.SqlClient.SqlParameter), _
    Optional ByVal DataSetIndex As System.Int32 = 0, Optional ByVal CommandTimeout As System.Int32 = 60) As System.Data.DataTable
        Return DACL.QuerySP(SPName, Parameters, DACL.DBConnections.CMS, DataSetIndex, CommandTimeout)
    End Function
    Protected Shared Function QuerySP(ByVal SPName As String, _
    ByVal Parameters As System.Collections.Generic.List(Of System.Data.SqlClient.SqlParameter), ByVal DBConnection As DACL.DBConnections, _
    Optional ByVal DataSetIndex As System.Int32 = 0, Optional ByVal CommandTimeout As System.Int32 = 60) As System.Data.DataTable
        Dim pDataSet As System.Data.DataSet = DACL.ExecuteSP(SPName, Parameters, DBConnection, CommandTimeout)
        Return pDataSet.Tables.Item(System.Math.Min(DataSetIndex, pDataSet.Tables.Count - 1))
    End Function

    Public Shared Function QuerySPWithReturnValue(ByVal SPName As String, ByVal Parameters As List(Of SqlParameter)) As Boolean
        Dim pDataSet As DataSet = New DataSet()
        Using pConnection As New SqlConnection(GetConnection(DBConnections.CMS))
            pConnection.Open()
            Using pCommand As SqlCommand = pConnection.CreateCommand()
                pCommand.CommandType = CommandType.StoredProcedure
                pCommand.CommandText = SPName
                For Each pParameter As SqlParameter In Parameters
                    pCommand.Parameters.Add(pParameter)
                Next
                pCommand.Parameters("@ReturnVal").Direction = ParameterDirection.Output
                Using pAdapter As New SqlDataAdapter(pCommand)
                    pAdapter.Fill(pDataSet)
                    Return CBool(pCommand.Parameters("@ReturnVal").Value)
                End Using
            End Using
        End Using
        Return False
    End Function

    Public Shared Function ExecuteSPWithReturnValue(ByVal SPName As String) As System.Int32
        Return DACL.ExecuteSPWithReturnValue(SPName, Nothing, DACL.DBConnections.CMS)
    End Function

    Protected Shared Function ExecuteSPWithReturnValue(ByVal SPName As String, _
    ByVal SqlParameters As System.Collections.Generic.List(Of System.Data.SqlClient.SqlParameter), _
    ByVal DBConnection As DACL.DBConnections) As System.Int32
        If SPName Is Nothing Then
            Return 0
        Else
            Dim pSqlConnection As System.Data.SqlClient.SqlConnection = _
                New System.Data.SqlClient.SqlConnection(DACL.GetConnection(DBConnection))
            If pSqlConnection Is Nothing Then
                Return 0
            Else
                pSqlConnection.Open()
                Try
                    Dim pSqlCommand As System.Data.SqlClient.SqlCommand = pSqlConnection.CreateCommand()
                    If pSqlCommand Is Nothing Then
                        Return 0
                    Else
                        pSqlCommand.CommandType = System.Data.CommandType.StoredProcedure
                        pSqlCommand.CommandText = SPName
                        pSqlCommand.CommandTimeout = 60  ' 1 minute
                        pSqlCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Return_Value", System.Data.DbType.Int32))
                        pSqlCommand.Parameters.Item("@Return_Value").Direction = System.Data.ParameterDirection.ReturnValue
                        If SqlParameters IsNot Nothing Then
                            For Each pSqlParameter As System.Data.SqlClient.SqlParameter In SqlParameters
                                pSqlCommand.Parameters.Add(pSqlParameter)
                            Next
                        End If
                        pSqlCommand.ExecuteNonQuery()
                        Return System.Convert.ToInt32(pSqlCommand.Parameters.Item("@Return_Value").Value)
                    End If
                Finally
                    pSqlConnection.Close()
                End Try
            End If
        End If
    End Function

    Public Shared Function ExecuteSP(ByVal SPName As String, ByVal Parameters As List(Of SqlParameter)) As DataSet
        Return ExecuteSP(SPName, Parameters, DBConnections.CMS)
    End Function

    Public Shared Function ExecuteSP(ByVal SPName As String, _
    ByVal SqlParameters As System.Collections.Generic.List(Of System.Data.SqlClient.SqlParameter), _
    ByVal DBConnection As DACL.DBConnections, Optional ByVal CommandTimeout As System.Int32 = 60) As System.Data.DataSet
        If SPName Is Nothing Then
            Return Nothing
        Else
            Dim pSqlConnection As System.Data.SqlClient.SqlConnection = _
                New System.Data.SqlClient.SqlConnection(DACL.GetConnection(DBConnection))
            If pSqlConnection Is Nothing Then
                Return Nothing
            Else
#If DEBUG Then
                Dim pBeforeOpenDateTime As System.DateTime = System.DateTime.Now
#End If
                pSqlConnection.Open()
                Try
                    Dim pSqlCommand As System.Data.SqlClient.SqlCommand = pSqlConnection.CreateCommand()
                    If pSqlCommand Is Nothing Then
                        Return Nothing
                    Else
                        pSqlCommand.CommandType = System.Data.CommandType.StoredProcedure
                        pSqlCommand.CommandText = SPName
                        pSqlCommand.CommandTimeout = CommandTimeout
                        If SqlParameters IsNot Nothing Then
                            For Each pSqlParameter As System.Data.SqlClient.SqlParameter In SqlParameters
                                pSqlCommand.Parameters.Add(pSqlParameter)
                            Next
                        End If
                        Dim pSqlDataAdapter As System.Data.SqlClient.SqlDataAdapter = New System.Data.SqlClient.SqlDataAdapter(pSqlCommand)
                        If pSqlDataAdapter Is Nothing Then
                            Return Nothing
                        Else
                            Dim pDataSet As System.Data.DataSet = New System.Data.DataSet()
                            If pDataSet Is Nothing Then
                                Return Nothing
                            Else
                                pSqlDataAdapter.Fill(pDataSet)
                                Return pDataSet
                            End If
                        End If
                    End If
                Finally
                    pSqlConnection.Close()
#If DEBUG Then
                    DACL.DebugWriteLine(pBeforeOpenDateTime, SPName)
#End If
                End Try
            End If
        End If
    End Function

    Public Shared Function ExecuteSPNonQuery(ByVal CommandText As String) As Integer
        Return DACL.ExecuteSPNonQuery(CommandText, Nothing, DACL.DBConnections.CMS)
    End Function
    Public Shared Function ExecuteSPNonQuery(ByVal CommandText As String, _
    ByVal DBConnection As DACL.DBConnections) As Integer
        Return DACL.ExecuteSPNonQuery(CommandText, Nothing, DBConnection)
    End Function
    Public Shared Function ExecuteSPNonQuery(ByVal CommandText As String, _
    ByVal SqlParameters As System.Collections.Generic.List(Of System.Data.SqlClient.SqlParameter)) As Integer
        Return DACL.ExecuteSPNonQuery(CommandText, SqlParameters, DACL.DBConnections.CMS)
    End Function
    Public Shared Function ExecuteSPNonQuery(ByVal CommandText As String, _
    ByVal SqlParameters As System.Collections.Generic.List(Of System.Data.SqlClient.SqlParameter), _
    ByVal DBConnection As DACL.DBConnections) As Integer
        Dim pSqlConnection As New System.Data.SqlClient.SqlConnection(DACL.GetConnection(DBConnection))
        pSqlConnection.Open()
        Try
            Dim pSqlCommand As System.Data.SqlClient.SqlCommand = pSqlConnection.CreateCommand()
            pSqlCommand.CommandType = System.Data.CommandType.StoredProcedure
            If CommandText IsNot Nothing Then pSqlCommand.CommandText = CommandText
            pSqlCommand.CommandTimeout = 60  ' 1 minute
            If SqlParameters IsNot Nothing Then
                For Each pSqlParameter As System.Data.SqlClient.SqlParameter In SqlParameters
                    pSqlCommand.Parameters.Add(pSqlParameter)
                Next
            End If
            Return pSqlCommand.ExecuteNonQuery()
        Finally
            pSqlConnection.Close()
        End Try
    End Function
    Public Enum DBConnections
        CMS
    End Enum
End Class