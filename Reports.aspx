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
        </center>
    </div>
    </form>
</body>
</html>
