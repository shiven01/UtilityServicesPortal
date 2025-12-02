<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffLogin.aspx.cs" Inherits="UtilityWeb.StaffLogin" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Staff Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Staff Login</h2>

        <asp:Label Text="Username:" runat="server" />
        <asp:TextBox ID="txtUser" runat="server" /><br /><br />

        <asp:Label Text="Password:" runat="server" />
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" /><br /><br />

        <asp:Button ID="bttnLogin" runat="server" Text="Login" OnClick="bttnLogin_Click" />

        <br /><br />
        <asp:Label ID="lblMsg" runat="server" ForeColor="Red" />
    </form>
</body>
</html>
