<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Employee.aspx.vb" Inherits="Employee" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Consumables Entry - Consumables Management System</title>
    <link rel="Shortcut Icon" href="~/Images/favicon.ico" type="image/x-icon" />
</head>
<body>
    <form id="frmEmployee" runat="server">
    <div>
        <center>
        <asp:Image ID="imgBanner" runat="server" ImageUrl="~/Images/Banner.png" />
        <br />
        <br />
        <asp:LinkButton ID="btnLogout" runat="server" Text="Logout" />
        <br />
        <br />
        </center>
        <left>
        <asp:Label ID="lblConsumables" runat="server" 
        Text="Current Consumable Levels:" Font-Size="Large"></asp:Label>
        </left>
        <center>
        <br />
        <asp:GridView ID="gvConsumables" runat="server" AutoGenerateColumns="False" DataKeyNames="Supply_ID,Delivery_ID"
            DataSourceID="dsConsumables" AllowSorting="true" Width="1058" BackColor="LightBlue" BorderColor="DarkBlue"
            ForeColor="Black">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Consumable">
                    <ItemTemplate>
                        <asp:Label ID="lblConsumable" runat="server" Text='<%# Eval("Name")%>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity On Hand">
                    <ItemTemplate>
                        <asp:Label ID="lblQuantityOnHand" runat="server" Text='<%# Eval("Quantity_On_Hand")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtQuantityOnHand" runat="server" Text='<%# Eval("Quantity_On_Hand")%>' />
                        <asp:RequiredFieldValidator ID="valQuantityOnHand" runat="server" 
                            ControlToValidate="txtQuantityOnHand" ErrorMessage="*" ForeColor="Red" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity When More Needed">
                    <ItemTemplate>
                        <asp:Label ID="lblEconomicOrderQuantity" runat="server" Text='<%# Eval("Economic_Order_Quantity")%>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Ordered">
                    <ItemTemplate>
                        <asp:Label ID="lblLastOrder" runat="server" Text='<%# Eval("Last_Order")%>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="true" ButtonType="Link" UpdateText="Save"
                    ItemStyle-HorizontalAlign="Center" ControlStyle-ForeColor="Blue"
                    ControlStyle-Font-Underline="false" />
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
        <asp:SqlDataSource ID="dsConsumables" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CMSConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:CMSConnectionString.ProviderName %>" 
            SelectCommand="GROUP1.&quot;CURINVENTORY_SEL&quot;" 
            SelectCommandType="StoredProcedure" 
            UpdateCommand="GROUP1.&quot;CURINVENTORY_UPD&quot;" 
            UpdateCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter Name="Location_ID" Type="Int32" DefaultValue="0" />
                <asp:Parameter Name="Active" Type="Char" DefaultValue="Y" />
                <asp:Parameter Name="NeedsOrdering" Type="Char" DefaultValue="N" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Delivery_ID" Type="Int32" DefaultValue="0" />
                <asp:Parameter Name="NewQuantity" Type="Decimal" DefaultValue="0" />
            </UpdateParameters>
        </asp:SqlDataSource>
        </center>
    </div>
    </form>
</body>
</html>
