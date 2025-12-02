<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberRegister.aspx.cs" Inherits="UtilityWeb.MemberRegister" %>
<%@ Register TagPrefix="uc1" TagName="CaptchaControl" Src="~/Controls/CaptchaControl.ascx" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Member Registration</title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Member Registration</h1>
        <p>Create a new account to access member features.</p>
        
        <table>
            <tr>
                <td>Username:</td>
                <td><asp:TextBox ID="txtUsername" runat="server" /></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" /></td>
            </tr>
            <tr>
                <td>Confirm Password:</td>
                <td><asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <h3>Verify you are human:</h3>
                    <asp:Image ID="imgCaptcha" runat="server" ImageUrl="~/CaptchaImage.ashx" />
                    <asp:Button ID="btnRefreshCaptcha" runat="server" Text="Refresh" OnClick="btnRefreshCaptcha_Click" CausesValidation="false" />
                    <br />
                    <asp:TextBox ID="txtCaptcha" runat="server" placeholder="Enter code above" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
                </td>
            </tr>
        </table>
        
        <p><asp:Label ID="lblMessage" runat="server" ForeColor="Red" /></p>
        
        <p>Already have an account? <a href="MemberLogin.aspx">Login here</a></p>
        <p><a href="Default.aspx">Back to Home</a></p>
    </form>
</body>
</html>