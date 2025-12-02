<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffPage.aspx.cs" Inherits="UtilityWeb.StaffPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Staff Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Welcome, Staff!</h2>

        <asp:Label ID="lblUser" runat="server"></asp:Label>
        <br /><br />

        <asp:Button ID="bttnLogout" runat="server" Text="Logout" OnClick="bttnLogout_Click" />
    </form>
</body>
</html>
