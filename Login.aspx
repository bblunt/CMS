<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Consumables Management System</title>
    <link rel="Shortcut Icon" href="~/Images/favicon.ico" type="image/x-icon" />
</head>
<body>
    <form id="frmLogin" runat="server">
        <center>
            <asp:Image ID="imgBanner" runat="server" ImageUrl="~/Images/Banner.png" />
            <br />
            <br />
            <br />
            <br />
        <asp:Label ID="lblUsername" runat="server" Text="Username:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="valUsername" runat="server" 
            ControlToValidate="txtUsername" ErrorMessage="*" ForeColor="Red" />
        <br />
        <br />
        <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtPassword" runat="server" TextMode=Password />
        <asp:RequiredFieldValidator ID="valPassword" runat="server" 
            ControlToValidate="txtPassword" ErrorMessage="*" ForeColor="Red" />
        <br />
        <br />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <br />
        <asp:Button ID="btnLogin" runat="server" Text="Login" Width="115px" />
        <asp:Label ID="lblLoginAttempts" runat="server" Text="0" Visible="false" />
        </center>
        <asp:SqlDataSource ID="dsLogin" runat="server"
            ConnectionString="<%$ ConnectionStrings:CMSConnectionString %>"
            ProviderName="<%$ ConnectionStrings:CMSConnectionString.ProviderName %>"
            SelectCommand="GROUP1.&quot;CMSLogin_Sel&quot;"
            SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
    </form>
</body>
</html>