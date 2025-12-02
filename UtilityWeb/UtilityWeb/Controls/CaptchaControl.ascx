<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CaptchaControl.ascx.cs" Inherits="UtilityWeb.Controls.CaptchaControl" %>
<div style="border:1px solid #ccc; padding:8px; width:340px;">
    <asp:Label ID="lblCaptchaTitle" runat="server" Text="Please enter the text from the image:" />
    <br />
    <img id="imgCaptcha" src='<%= ResolveUrl("~/CaptchaImage.ashx?rnd=" + Guid.NewGuid().ToString()) %>' alt="captcha" />
    <asp:Button ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" />
    <br />
    <asp:TextBox ID="txtCaptchaInput" runat="server" Width="160px"></asp:TextBox>
    <asp:Button ID="btnValidate" runat="server" Text="Validate" OnClick="btnValidate_Click" />
    <asp:Label ID="lblResult" runat="server" Text="" Style="margin-left:8px;"></asp:Label>
</div>
