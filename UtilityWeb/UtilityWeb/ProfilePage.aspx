<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="UtilityWeb.ProfilePage" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Profile / Cookie Demo</title>
</head>
<body>
<form id="form1" runat="server">
    <h2>Profile & Cookie Demo</h2>
    <asp:Label ID="lblMessage" runat="server" />
    <br />

    <asp:Label Text="Display Name:" AssociatedControlID="txtName" runat="server" />
    <asp:TextBox ID="txtName" runat="server" />
    <br /><br />

    <asp:Label Text="Theme:" AssociatedControlID="ddlTheme" runat="server" />
    <asp:DropDownList ID="ddlTheme" runat="server">
        <asp:ListItem>Light</asp:ListItem>
        <asp:ListItem>Dark</asp:ListItem>
    </asp:DropDownList>
    <br /><br />

    <asp:Button ID="btnSave" runat="server" Text="Save Cookie" OnClick="btnSave_Click" />
    <asp:Button ID="btnLoad" runat="server" Text="Load Cookie" OnClick="btnLoad_Click" />
    <asp:Button ID="btnClear" runat="server" Text="Clear Cookie" OnClick="btnClear_Click" />

    <hr />
    <h3>Current Cookie</h3>
    <asp:Literal ID="litCookie" runat="server" />

    <hr />
    <h3>Captcha Demo</h3>
    <asp:PlaceHolder ID="phCaptcha" runat="server" />
</form>
</body>
</html>
