Imports Microsoft.VisualBasic

Public Class UserInfo
    Public Shared Function InfoString(ByVal Username As String, ByVal Level As String, ByVal Location As String) As String
        Return Username + "|" + Level + "|" + Location
    End Function

    Public Shared Function Username(ByVal UserInfo As String) As String
        Dim items() As String
        items = UserInfo.Split("|")
        Return items(0)
    End Function

    Public Shared Function Level(ByVal UserInfo As String) As String
        Dim items() As String
        items = UserInfo.Split("|")
        Return items(1)
    End Function

    Public Shared Function Location(ByVal UserInfo As String) As String
        Dim items() As String
        items = UserInfo.Split("|")
        Return items(2)
    End Function
End Class
