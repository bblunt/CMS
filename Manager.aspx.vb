
Partial Class Manager
    Inherits System.Web.UI.Page

    Protected Sub btnLogout_Click(sender As Object, e As System.EventArgs) Handles btnLogout.Click
        Me.Response.Redirect("~/Login.aspx")
    End Sub
End Class
