<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Manager.aspx.vb" Inherits="Manager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Summary - Consumables Management System</title>
    <link rel="Shortcut Icon" href="~/Images/favicon.ico" type="image/x-icon" />
</head>
<body>
    <form id="frmManager" runat="server">
    <div>
    <center>
        <asp:Image ID="imgBanner" runat="server" ImageUrl="~/Images/Banner.png" />
            <br />
            <br />
            <asp:HyperLink ID="hlkViewReports" runat="server" Text="View Reports" NavigateUrl="~/Reports.aspx" />
            <br />
            <asp:HyperLink ID="hlkPlaceOrder" runat="server" Text="Place New Order" NavigateUrl="~/Order.aspx" />
            <br />
            <br />
            <br />
        </center>
        <left>
            <asp:Label ID="lblConsumablesThatNeedOrdered" runat="server" 
                Text="Consumables Needing to be Ordered:" Font-Size="Large"></asp:Label>
        </left>
        <center>
            <asp:GridView ID="gvNeedsOrdering" runat="server" AutoGenerateColumns="False" DataKeyNames=""
                DataSourceID="dsNeedsOrdering" AllowSorting="true" Width="1058" BackColor="LightBlue" BorderColor="DarkBlue"
                ForeColor="Black">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="Consumable" DataField="Name" SortExpression="Name" />
                    <asp:BoundField HeaderText="Quantity On Hand" DataField="Quantity_On_Hand" SortExpression="Quantity_On_Hand" />
                    <asp:BoundField HeaderText="Quantity When More Needed" DataField="Economic_Order_Quantity" SortExpression="Economic_Order_Quantity" />
                    <asp:BoundField HeaderText="Last Ordered" DataField="Last_Order" SortExpression="Last_Order" />
                </Columns>
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
            <br />
            <br />
        </center>
        <left>
            <asp:Label ID="lblSummary" runat="server" Text="Summary:" Font-Size="Large"></asp:Label>
        </left>
        <center>
            <asp:GridView ID="gvSummary" runat="server" AutoGenerateColumns="False" DataKeyNames="Supply_ID"
                DataSourceID="dsSummary" AllowSorting="true" Width="1058" BackColor="LightBlue" BorderColor="DarkBlue"
                ForeColor="Black">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="Consumable" DataField="Name" SortExpression="Name" />
                    <asp:BoundField HeaderText="Quantity On Hand" DataField="Quantity_On_Hand" SortExpression="Quantity_On_Hand" />
                    <asp:BoundField HeaderText="Quantity When More Needed" DataField="Economic_Order_Quantity" SortExpression="Economic_Order_Quantity" />
                    <asp:BoundField HeaderText="Last Ordered" DataField="Last_Order" SortExpression="Last_Order" />
                </Columns>
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
        <asp:SqlDataSource ID="dsSummary" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CMSConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:CMSConnectionString.ProviderName %>" 
            SelectCommand="GROUP1.&quot;CURINVENTORY_SEL&quot;" 
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter Name="LOCATION_ID" Type="Int32" DefaultValue="0" />
                <asp:Parameter Name="ACTIVE" Type="Char" DefaultValue="Y" />
                <asp:Parameter Name="NeedsOrdering" Type="Char" DefaultValue="N" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsNeedsOrdering" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CMSConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:CMSConnectionString.ProviderName %>" 
            SelectCommand="GROUP1.&quot;CURINVENTORY_SEL&quot;" 
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter Name="LOCATION_ID" Type="Int32" DefaultValue="0" />
                <asp:Parameter Name="ACTIVE" Type="Char" DefaultValue="Y" />
                <asp:Parameter Name="NeedsOrdering" Type="Char" DefaultValue="Y" />
            </SelectParameters>
        </asp:SqlDataSource>
    </center>
    </div>
    </form>
</body>
</html>