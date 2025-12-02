<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberLogin.aspx.cs" Inherits="UtilityWeb.MemberLogin" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Member Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Member Login</h2>
        
        <table>
            <tr>
                <td>Username:</td>
                <td><asp:TextBox ID="txtUser" runat="server" /></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="bttnLogin" runat="server" Text="Login" OnClick="bttnLogin_Click" />
                </td>
            </tr>
        </table>
        
        <p><asp:Label ID="lblMsg" runat="server" ForeColor="Red" /></p>
        
        <p>Don't have an account? <a href="MemberRegister.aspx">Register here</a></p>
        <p><a href="Default.aspx">Back to Home</a></p>
    </form>
</body>
</html>