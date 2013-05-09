
Partial Class Reports
    Inherits System.Web.UI.Page

    Protected Sub imgBanner_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles imgBanner.Click
        Me.Response.Redirect("~/Manager.aspx")
    End Sub

    Protected Sub btnLogout_Click(sender As Object, e As System.EventArgs) Handles btnLogout.Click
        Me.Response.Redirect("~/Login.aspx")
    End Sub

    Protected Sub ddlReportType_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlReportType.SelectedIndexChanged
        If Me.ddlReportType.SelectedItem.Value = "Consumables" Then
            Me.Response.Redirect("~/Reports.aspx")
        ElseIf Me.ddlReportType.SelectedItem.Value = "ConsumablesWithSupplierCost" Then
            Me.dsReport.SelectCommand = "GROUP1.""REPORT_CONSUMABLESWITHSUPPLIERCOST_SEL"""
            Me.dsReport.DataBind()
        ElseIf Me.ddlReportType.SelectedItem.Value = "Inventory" Then
            Me.dsReport.SelectCommand = "GROUP1.""REPORT_INVENTORY_SEL"""
            Me.dsReport.DataBind()
        ElseIf Me.ddlReportType.SelectedItem.Value = "Orders" Then
            Me.dsReport.SelectCommand = "GROUP1.""REPORT_ORDERS_SEL"""
            Me.dsReport.DataBind()
        ElseIf Me.ddlReportType.SelectedItem.Value = "Suppliers" Then
            Me.dsReport.SelectCommand = "GROUP1.""REPORT_SUPPLIERS_SEL"""
            Me.dsReport.DataBind()
        End If
    End Sub

    Protected Sub txtStartDate_TextChanged(sender As Object, e As System.EventArgs) Handles txtStartDate.TextChanged
        Me.dsReport.SelectParameters.Item("Start").DefaultValue = _
            System.Convert.ToString(DateTime.ParseExact(Me.txtStartDate.Text, "MM/dd/yyyy", System.Globalization.CultureInfo.InvariantCulture))
        Me.dsReport.DataBind()
    End Sub

    Protected Sub txtEndDate_TextChanged(sender As Object, e As System.EventArgs) Handles txtEndDate.TextChanged
        Me.dsReport.SelectParameters.Item("End").DefaultValue = _
            System.Convert.ToString(DateTime.ParseExact(Me.txtEndDate.Text, "MM/dd/yyyy", System.Globalization.CultureInfo.InvariantCulture))
        Me.dsReport.DataBind()
    End Sub

    Protected Sub chkActive_CheckedChanged(sender As Object, e As System.EventArgs) Handles chkActive.CheckedChanged
        If Me.chkActive.Checked = True Then
            Me.dsReport.SelectParameters.Item("Active").DefaultValue = "Y"
            Me.dsReport.DataBind()
        Else
            Me.dsReport.SelectParameters.Item("Active").DefaultValue = "N"
            Me.dsReport.DataBind()
        End If
    End Sub
End Class
