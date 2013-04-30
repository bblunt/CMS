<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Manager.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 481px;
            margin-left: 80px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 473px">
    
        <table class="style1">
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
&nbsp;&nbsp;&nbsp; <strong>
                    <asp:Label ID="Label1" runat="server" 
                        style="font-size: medium; text-decoration: underline" Text="Summary:"></asp:Label>
                    </strong>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem Value="Orders.aspx">Orders</asp:ListItem>
                        <asp:ListItem Value="Consumables.aspx">Consumables</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:GridView ID="GridView1" runat="server" Width="353px">
                    </asp:GridView>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:GridView ID="GridView2" runat="server" Width="353px">
                    </asp:GridView>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label2" runat="server" 
                        style="text-decoration: underline; font-weight: 700" Text="Need Ordered:"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
