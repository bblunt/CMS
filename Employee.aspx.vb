
Partial Class Employee
    Inherits System.Web.UI.Page

    Protected Sub btnLogout_Click(sender As Object, e As System.EventArgs) Handles btnLogout.Click
        Me.Response.Redirect("~/Login.aspx")
    End Sub

    Protected Sub gvConsumables_RowUpdating(sender As Object, e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gvConsumables.RowUpdating
        Me.dsConsumables.UpdateParameters.Item("Location_ID").DefaultValue = e.Keys.Item("Location_ID")
        Me.dsConsumables.UpdateParameters.Item("Delivery_ID").DefaultValue = e.Keys.Item("Delivery_ID")
        Me.dsConsumables.UpdateParameters.Item("NewQuantity").DefaultValue = _
            CType(Me.gvConsumables.Rows(e.RowIndex).FindControl("txtQuantityOnHand"), WebControls.TextBox).Text
    End Sub
End Class
