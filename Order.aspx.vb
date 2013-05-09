
Partial Class Order
    Inherits System.Web.UI.Page

    Protected Sub imgBanner_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles imgBanner.Click
        Me.Response.Redirect("~/Manager.aspx")
    End Sub

    Protected Sub btnLogout_Click(sender As Object, e As System.EventArgs) Handles btnLogout.Click
        Me.Response.Redirect("~/Login.aspx")
    End Sub

    Protected Sub hlkShowPastOrders_Click(sender As Object, e As System.EventArgs) Handles hlkShowPastOrders.Click
        If Me.gvOrder.Visible = False Then
            Me.gvOrder.Visible = True
            Me.hlkShowPastOrders.Text = "Hide Past Orders"
        Else
            Me.gvOrder.Visible = False
            Me.hlkShowPastOrders.Text = "Show Past Orders"
        End If
    End Sub

    Protected Sub dvOrder_DataBound(sender As Object, e As System.EventArgs) Handles dvOrder.DataBound
        Me.dsConsumableSupplier.SelectParameters.Item("SupplyID").DefaultValue = _
            CType(Me.dvOrder.FindControl("ddlConsumables"), WebControls.DropDownList).SelectedItem.Value
        Me.dsConsumableSupplier.DataBind()
    End Sub

    Protected Sub ConsumableChanged(sender As Object, e As System.EventArgs)
        Me.dsConsumableSupplier.SelectParameters.Item("SupplyID").DefaultValue = _
            CType(Me.dvOrder.FindControl("ddlConsumables"), WebControls.DropDownList).SelectedItem.Value
        Me.dsConsumableSupplier.DataBind()
    End Sub

    Protected Sub dvOrder_ItemInserting(sender As Object, e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles dvOrder.ItemInserting
        Dim pOrderId As System.Int32 = CInt(Int((100000 - 100 + 4) * Rnd() + 7))
        Me.lblOrderID.Visible = True
        Me.lblOrderID.Text = System.Convert.ToString(pOrderId)
        Me.dsOrder.InsertParameters.Item("OrderID").DefaultValue = pOrderId
        Me.dsOrder.InsertParameters.Item("SupplierID").DefaultValue = _
            CType(Me.dvOrder.FindControl("ddlSupplier"), WebControls.DropDownList).SelectedItem.Value
        Me.dsOrder.InsertParameters.Item("SupplyID").DefaultValue = _
            CType(Me.dvOrder.FindControl("ddlConsumables"), WebControls.DropDownList).SelectedItem.Value
        Me.dsOrder.InsertParameters.Item("LocationID").DefaultValue = _
            CType(Me.dvOrder.FindControl("ddlLocation"), WebControls.DropDownList).SelectedItem.Value
        Me.dsOrder.InsertParameters.Item("NumToOrder").DefaultValue = _
            System.Convert.ToDecimal(CType(Me.dvOrder.FindControl("txtNumToOrder"), WebControls.TextBox).Text)
        Me.lblOrderID.Visible = False
    End Sub

    Protected Sub dvOrder_ItemInserted(sender As Object, e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles dvOrder.ItemInserted
        Me.lblMessage.Visible = True
        Me.lblOrderID.Visible = True
        Me.lblMessage.Text = "Order #: " & Me.lblOrderID.Text & " placed successfully!"
        Me.lblOrderID.Visible = False
        Me.dvOrder.ChangeMode(DetailsViewMode.Insert)
        Me.gvOrder.DataBind()
    End Sub
End Class
