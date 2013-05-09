<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Order.aspx.vb" Inherits="Order" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Place New Order - Consumables Management System</title>
    <link rel="Shortcut Icon" href="~/Images/favicon.ico" type="image/x-icon" />
</head>
<body>
    <form id="frmOrder" runat="server">
    <div>
        <center>
            <asp:ImageButton ID="imgBanner" runat="server" ImageUrl="~/Images/Banner.png"
                CausesValidation="false" />
            <br />
            <br />
            <asp:LinkButton ID="btnLogout" runat="server" Text="Logout" />
            <br />
            <br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
            <asp:Label ID="lblOrderID" runat="server" Visible="false" />
            <br />
            <asp:DetailsView ID="dvOrder" runat="server" DataSourceID="dsOrder" DefaultMode="Insert"
                AutoGenerateRows="false">
                <Fields>
                    <asp:TemplateField HeaderText="Consumable">
                        <InsertItemTemplate>
                            <asp:DropDownList ID="ddlConsumables" runat="server" DataSourceID="dsConsumables"
                                DataTextField="Name" DataValueField="Supply_ID" AutoPostBack="true"
                                OnSelectedIndexChanged="ConsumableChanged" />
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Supplier">
                        <InsertItemTemplate>
                            <asp:DropDownList ID="ddlSupplier" runat="server" DataSourceID="dsConsumableSupplier"
                                DataTextField="Company" DataValueField="Supplier_ID" />
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Location For Delivery">
                        <InsertItemTemplate>
                            <asp:DropDownList ID="ddlLocation" runat="server" DataSourceID="dsLocations"
                                DataTextField="Address" DataValueField="Location_ID" />
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Number to be Ordered">
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtNumToOrder" runat="server" />
                            <asp:RequiredFieldValidator ID="valNumToOrder" runat="server" 
                                ControlToValidate="txtNumToOrder" ErrorMessage="*" ForeColor="Red" />
                            <asp:CompareValidator ID="valNumToOrderNum" runat="server" ControlToValidate="txtNumToOrder" Type="Integer"
                                Operator="DataTypeCheck" Display="Dynamic" Text="Please enter valid numeric value." ForeColor="Red" />
                            <asp:RangeValidator ID="valNumToOrderRange" runat="server" ControlToValidate="txtNumToOrder" Type="Integer"
                                MinimumValue="1" MaximumValue="9999" Display="Dynamic" Text="Please enter a numer value greater than 0, but less than 9999."
                                ForeColor="Red" />
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="false" ItemStyle-HorizontalAlign="Center">
                        <InsertItemTemplate>
                            <asp:Button ID="btnInsert" runat="server" CommandName="Insert" Width="120" Text="Place Order" />
                        </InsertItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
            <br />
            <br />
            <asp:GridView ID="gvSuppliers" runat="server" AutoGenerateColumns="false" DataKeyNames="Supply_ID,Supplier_ID"
                DataSourceID="dsConsumableSupplier" AllowSorting="true">
                <Columns>
                    <asp:BoundField HeaderText="Consumable" DataField="Name" SortExpression="Name" />
                    <asp:BoundField HeaderText="Supplier" DataField="Company" SortExpression="Company" />
                    <asp:BoundField HeaderText="Price" DataField="Cost" SortExpression="Cost"
                        DataFormatString="{0:C2}" />
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <br />
            <br />
            <asp:LinkButton ID="hlkShowPastOrders" runat="server" Text="Show Past Orders" CausesValidation="false" />
            <asp:GridView ID="gvOrder" runat="server" AutoGenerateColumns="false" DataKeyNames="Order_ID"
                DataSourceID="dsOrder" AllowSorting="true" Width="1058" BackColor="LightBlue" BorderColor="DarkBlue"
                ForeColor="Black" Visible="false">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="Order ID" DataField="Order_ID" SortExpression="Order_ID" />
                    <asp:BoundField HeaderText="Subtotal" DataField="SubTotal" SortExpression="SubTotal"
                        DataFormatString="{0:C2}" />
                    <asp:BoundField HeaderText="Total Delivery Cost" DataField="Total_Delivery_Cost"
                        SortExpression="Total_Delivery_Cost" DataFormatString="{0:C2}" />
                    <asp:BoundField HeaderText="Tax" DataField="Tax" SortExpression="Tax" DataFormatString="{0:C2}" />
                    <asp:BoundField HeaderText="Total" DataField="Total" SortExpression="Total" DataFormatString="{0:C2}" />
                    <asp:BoundField HeaderText="Paid" DataField="Paid" SortExpression="Paid" />
                    <asp:BoundField HeaderText="Order Date" DataField="Order_Date" SortExpression="Order_Date" />
                    <asp:BoundField HeaderText="Minimum Shipping Time" DataField="Min_Shipping_Time"
                        SortExpression="Min_Shipping_Time" />
                    <asp:BoundField HeaderText="Maximum Shipping Time" DataField="Max_Shipping_Time"
                        SortExpression="Max_Shipping_Time" />
                    <asp:BoundField HeaderText="Actual Shipping Time" DataField="Actual_Shipping_Time"
                        SortExpression="Actual_Shipping_Time" />
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
            <asp:SqlDataSource ID="dsOrder" runat="server" 
                ConnectionString="<%$ ConnectionStrings:CMSConnectionString %>" 
                InsertCommand="GROUP1.&quot;SUPPLYORDER_INS&quot;" 
                InsertCommandType="StoredProcedure" 
                ProviderName="<%$ ConnectionStrings:CMSConnectionString.ProviderName %>" 
                SelectCommand="GROUP1.&quot;SUPPLYORDERS_SEL&quot;" 
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter Name="OrderID" Type="Int32" DefaultValue="0" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="OrderID" Type="Int32" DefaultValue="1" />
                    <asp:Parameter Name="SupplierID" Type="Int32" DefaultValue="200" />
                    <asp:Parameter Name="SupplyID" Type="Int32" DefaultValue="1" />
                    <asp:Parameter Name="LocationID" Type="Int32" DefaultValue="4" />
                    <asp:Parameter Name="NumToOrder" Type="Decimal" DefaultValue="5" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsConsumables" runat="server" 
                ConnectionString="<%$ ConnectionStrings:CMSConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:CMSConnectionString.ProviderName %>" 
                SelectCommand="GROUP1.&quot;SUPPLY_SEL&quot;" 
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter Name="SupplyID" Type="Int32" DefaultValue="0" />
                    <asp:Parameter Name="Active" Type="Char" DefaultValue="N" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsConsumableSupplier" runat="server" 
                ConnectionString="<%$ ConnectionStrings:CMSConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:CMSConnectionString.ProviderName %>" 
                SelectCommand="GROUP1.&quot;SUPPLIERSUPPLY_SEL&quot;" 
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter Name="SupplyID" Type="Int32" DefaultValue="0" />
                    <asp:Parameter Name="SupplierID" Type="Int32" DefaultValue="0" />
                    <asp:Parameter Name="Active" Type="Char" DefaultValue="N" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsLocations" runat="server" 
                ConnectionString="<%$ ConnectionStrings:CMSConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:CMSConnectionString.ProviderName %>" 
                SelectCommand="GROUP1.&quot;LOCATION_SEL&quot;" 
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter Name="LocationID" Type="Int32" DefaultValue="0" />
                    <asp:Parameter Name="Active" Type="Char" DefaultValue="N" />
                </SelectParameters>
            </asp:SqlDataSource>
        </center>
    </div>
    </form>
</body>
</html>
