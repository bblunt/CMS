<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Reports.aspx.vb" Inherits="Reports" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reports - Consumables Management System</title>
    <link rel="Shortcut Icon" href="~/Images/favicon.ico" type="image/x-icon" />
</head>
<body>
    <form id="frmReports" runat="server">
    <div>
        <center>
            <asp:ImageButton ID="imgBanner" runat="server" ImageUrl="~/Images/Banner.png"
                CausesValidation="false" />
            <br />
            <br />
            <asp:LinkButton ID="btnLogout" runat="server" Text="Logout" />
            <br />
            <br />
            <asp:Label ID="lblSelectReportType" runat="server" Text="Please Select the Report You Would Like:  " />
            <asp:DropDownList ID="ddlReportType" runat="server" AutoPostBack="true">
                <asp:ListItem Text="Consumables" Value="Consumables" />
                <asp:ListItem Text="Consumables with Suppliers and Prices" Value="ConsumablesWithSupplierCost" />
                <asp:ListItem Text="Consumables Inventory" Value="Inventory" />
                <asp:ListItem Text="Orders" Value="Orders" />
                <asp:ListItem Text="Suppliers" Value="Suppliers" />
            </asp:DropDownList>
            <br />
            <asp:Label ID="lblStartDate" runat="server" Text="Start Date:  " />
            <asp:TextBox ID="txtStartDate" runat="server" Text="01/01/1999" AutoPostBack="true" />
            <br />
            <asp:Label ID="lblEndDate" runat="server" Text="End Date:  " />
            <asp:TextBox ID="txtEndDate" runat="server" Text="05/10/2013" AutoPostBack="true" />
            <br />
            <asp:CheckBox ID="chkActive" runat="server" Text="Active Only" AutoPostBack="true" />
            <asp:GridView ID="gvReport" runat="server" AutoGenerateColumns="true" DataSourceID="dsReport"
                AllowSorting="true" Width="1058" BackColor="LightBlue" BorderColor="DarkBlue"
                ForeColor="Black">
                <AlternatingRowStyle BackColor="White" />
                <FooterStyle BackColor="WhiteSmoke" />
                <HeaderStyle BackColor="WhiteSmoke" Font-Bold="True" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                    HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
            </asp:GridView>
            <asp:SqlDataSource ID="dsReport" runat="server" 
                ConnectionString="<%$ ConnectionStrings:CMSConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:CMSConnectionString.ProviderName %>" 
                SelectCommand="GROUP1.&quot;REPORT_CONSUMABLES_SEL&quot;"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter Name="Start" Type="DateTime" DefaultValue="1999/01/01 00:00:00.0" />
                    <asp:Parameter Name="End" Type="DateTime" DefaultValue="2013/05/10 00:00:00.0" />
                    <asp:Parameter Name="SupplyID" Type="Int32" DefaultValue="0" />
                    <asp:Parameter Name="Active" Type="Char" DefaultValue="N" />
                </SelectParameters>
            </asp:SqlDataSource>
        </center>
    </div>
    </form>
</body>
</html>
