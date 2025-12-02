<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberPage.aspx.cs" Inherits="UtilityWeb.MemberPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Member Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Welcome, Member!</h2>

        <asp:Label ID="lblUser" runat="server"></asp:Label>
        <br /><br />

        <asp:Button ID="bttnLogout" runat="server" Text="Logout" OnClick="bttnLogout_Click" />
    </form>
</body>
</html>
