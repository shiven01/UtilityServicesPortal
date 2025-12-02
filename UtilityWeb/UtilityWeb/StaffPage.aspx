<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffPage.aspx.cs" Inherits="UtilityWeb.StaffPage" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Staff Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h1 { color: #333; }
        h2 { color: #555; border-bottom: 1px solid #ccc; padding-bottom: 5px; }
        .info-box { background-color: #d4edda; padding: 15px; border-left: 4px solid #28a745; margin: 10px 0; }
        .warning-box { background-color: #fff3cd; padding: 15px; border-left: 4px solid #ffc107; margin: 10px 0; }
        table { border-collapse: collapse; width: 100%; margin: 10px 0; }
        th { background-color: #f0f0f0; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        .btn-delete { background-color: #dc3545; color: white; border: none; padding: 5px 15px; cursor: pointer; }
        .btn-delete:hover { background-color: #c82333; }
        .btn-logout { background-color: #6c757d; color: white; border: none; padding: 10px 20px; cursor: pointer; }
        .btn-logout:hover { background-color: #5a6268; }
        .btn-back { background-color: #007bff; color: white; border: none; padding: 10px 20px; cursor: pointer; text-decoration: none; }
        .btn-back:hover { background-color: #0056b3; }
        .message { padding: 10px; margin: 10px 0; border-radius: 5px; }
        .message-success { background-color: #d4edda; color: #155724; }
        .message-error { background-color: #f8d7da; color: #721c24; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Staff Dashboard</h1>
        
        <div class="info-box">
            <asp:Label ID="lblUser" runat="server" Font-Bold="true" />
            <br /><br />
            <a href="Default.aspx" class="btn-back">Back to Home</a>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn-logout" />
        </div>

        <hr />

        <!-- ========== MEMBER MANAGEMENT ========== -->
        <h2>Member Management</h2>
        <p>View and manage all registered member accounts. Passwords are stored as SHA256 hashes for security.</p>
        
        <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false" />

        <asp:GridView ID="gvMembers" runat="server" AutoGenerateColumns="false" 
            CssClass="member-table" GridLines="Both" EmptyDataText="No members registered yet."
            OnRowCommand="gvMembers_RowCommand" DataKeyNames="Username">
            <Columns>
                <asp:BoundField DataField="Username" HeaderText="Username" />
                <asp:BoundField DataField="PasswordHash" HeaderText="Password Hash (SHA256)" />
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" 
                            CommandName="DeleteMember" 
                            CommandArgument='<%# Eval("Username") %>'
                            CssClass="btn-delete"
                            OnClientClick="return confirm('Are you sure you want to delete this member?');" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#f0f0f0" Font-Bold="true" />
            <AlternatingRowStyle BackColor="#f9f9f9" />
        </asp:GridView>

        <hr />

        <!-- ========== STAFF FUNCTIONS INFO ========== -->
        <h2>Staff Functions</h2>
        <div class="warning-box">
            <p><strong>Available Actions:</strong></p>
            <ul>
                <li><strong>View Members:</strong> See all registered member accounts and their hashed passwords</li>
                <li><strong>Delete Members:</strong> Remove member accounts from the system (cannot be undone)</li>
            </ul>
            <p><em>Note: Staff accounts are managed separately in Staff.xml by administrators.</em></p>
        </div>

    </form>
</body>
</html>
