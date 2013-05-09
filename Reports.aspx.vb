
Partial Class Reports
    Inherits System.Web.UI.Page

    Protected Sub imgBanner_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles imgBanner.Click
        Me.Response.Redirect("~/Manager.aspx")
    End Sub
End Class
