Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data.SqlClient
Imports System.Data

Partial Class Login
    Inherits System.Web.UI.Page

    Dim pNumLoginAttempts As System.Int32

    Protected Sub btnLogin_Click(sender As Object, e As System.EventArgs) Handles btnLogin.Click
        'Page.Validate()
        'If IsValid Then
        '    Dim pUsername As System.String = Me.txtUsername.Text
        '    Dim pPassword As System.String = Me.txtPassword.Text
        '    Dim pSuccess As System.Boolean = False
        '    Dim pLevel As System.String = ""
        '    Dim pLocation As System.String = ""
        '    Dim cms As SqlConnection = _
        '        New SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("CMSConnectionString").ConnectionString)
        '    Dim pCommand As SqlCommand = New SqlCommand("CALL CMSLogin_Sel", cms)

        '    cms.Open()
        '    pCommand.CommandType = CommandType.StoredProcedure
        '    pCommand.Parameters.AddWithValue("@Username", pUsername)
        '    pCommand.Parameters.AddWithValue("@Password", pPassword)
        '    pCommand.Parameters.Add("@Success", SqlDbType.Char, 1)
        '    pCommand.Parameters.Add("@Level", SqlDbType.Int)
        '    pCommand.Parameters.Add("@Location", SqlDbType.Int)
        '    pCommand.Parameters("@Success").Direction = ParameterDirection.Output
        '    pCommand.Parameters("@Level").Direction = ParameterDirection.Output
        '    pCommand.Parameters("@Location").Direction = ParameterDirection.Output
        '    pCommand.ExecuteNonQuery()
        '    If System.Convert.ToChar(pCommand.Parameters("@Success").Value) = "T" Then
        '        pSuccess = True
        '    Else
        '        pSuccess = False
        '    End If
        '    pLevel = System.Convert.ToInt32(pCommand.Parameters("@Level").Value)
        '    pLocation = System.Convert.ToInt32(pCommand.Parameters("@Location").Value)
        '    cms.Close()

        '    If pSuccess Then
        '        If pLevel = 1 Then
        '            Me.Response.Redirect("~/Manager.aspx")
        '        ElseIf pLevel = 2 Then
        '            Me.Response.Redirect("~/Employee.aspx")
        '        End If
        '    Else
        '        If pNumLoginAttempts < 3 Then
        '            pNumLoginAttempts += 1
        '        Else
        '            Me.btnLogin.Enabled = False
        '        End If
        '    End If
        'End If
        'string UserName = UserNameTextBox.Text;
        'string Password = PasswordTextBox.Text;
        'string ConfirmPassword = ConfirmPasswordTextBox.Text;
        'string Email = EmailTextBox.Text;
        'string Country = CountryTextBox.Text;
        'SqlConnection con = new SqlConnection("Data Source=.; uid=sa; pwd=wintellect;database=Rohatash;");
        'con.Open();
        'SqlCommand cmd = new SqlCommand("spuserdetail", con);
        'cmd.CommandType = CommandType.StoredProcedure;
        'cmd.Parameters.AddWithValue("@UserName", UserName);
        'cmd.Parameters.AddWithValue("@Password", Password);
        'cmd.Parameters.AddWithValue("@Email", Email);
        'cmd.Parameters.AddWithValue("@Country", Country);
        'cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
        'cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
        'cmd.ExecuteNonQuery();
        'message = (string)cmd.Parameters["@ERROR"].Value;
        'con.Close();
    End Sub
End Class
