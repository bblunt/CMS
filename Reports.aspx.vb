
Partial Class Reports
    Inherits System.Web.UI.Page

    Protected Sub imgBanner_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles imgBanner.Click
        Me.Response.Redirect("~/Manager.aspx")
    End Sub

    Protected Sub btnLogout_Click(sender As Object, e As System.EventArgs) Handles btnLogout.Click
        Me.Response.Redirect("~/Login.aspx")
    End Sub
End Class
