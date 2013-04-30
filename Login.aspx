<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Consumables Management System</title>
</head>
<body>
    <center>
    <form id="frmLogin" runat="server">
        <asp:Label ID="lblUsername" runat="server" Text="Username:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="valUsername" runat="server" 
            ControlToValidate="TxtUsername" ErrorMessage="*"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="valPassword" runat="server" 
            ControlToValidate="TxtPassword" ErrorMessage="*"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br />
        <br />
        <br />
        <asp:Button ID="btnLogin" runat="server" Text="Login" Width="115px" />
        </center>
    </form>
</body>
</html>