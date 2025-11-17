<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UtilityWeb.Default" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Utility Services Portal</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Utility Services Portal - CSE 445 Assignment 5</h1>
            
            <h2>Application Information</h2>
            <p>This application demonstrates service-oriented architecture with local components and web services.</p>
            
            <h3>How to Test:</h3>
            <ul>
                <li>Use the TryIt sections below to test each component</li>
                <li>Enter test values and click buttons to see results</li>
            </ul>
            
            <h3>Navigation (Assignment 6):</h3>
            <asp:Button ID="btnMember" runat="server" Text="Member Page" Enabled="false" />
            <asp:Button ID="btnStaff" runat="server" Text="Staff Page" Enabled="false" />
            <p><em>Note: Member and Staff pages will be implemented in Assignment 6</em></p>
            
            <hr />
            
            <h2>Service Directory</h2>
            <table border="1" cellpadding="5">
                <tr>
                    <th>Provider</th>
                    <th>Component Type</th>
                    <th>Operation</th>
                    <th>Parameters</th>
                    <th>Return Type</th>
                    <th>Description</th>
                </tr>
                <tr>
                    <td>Shiven Shekar</td>
                    <td>Global.asax</td>
                    <td>Application_Start, Session_Start</td>
                    <td>N/A</td>
                    <td>void</td>
                    <td>Tracks visit count</td>
                </tr>
                <tr>
                    <td>Shiven Shekar</td>
                    <td>DLL</td>
                    <td>HashString</td>
                    <td>string input</td>
                    <td>string</td>
                    <td>Hashes string using SHA256</td>
                </tr>
                <tr>
                    <td>Shiven Shekar</td>
                    <td>WSDL Service</td>
                    <td>Add</td>
                    <td>double a, double b</td>
                    <td>double</td>
                    <td>Adds two numbers</td>
                </tr>
            </table>
            
            <hr />
            
            <h2>Application Statistics (Global.asax Component)</h2>
            <p>Visit Count: <asp:Label ID="lblVisitCount" runat="server" Text="0"></asp:Label></p>
            
            <hr />
            
            <h2>TryIt: Hash Function (DLL Component)</h2>
            <p>Input Text: <asp:TextBox ID="txtHashInput" runat="server" Text="test"></asp:TextBox></p>
            <asp:Button ID="btnHash" runat="server" Text="Hash" OnClick="btnHash_Click" />
            <p>Result: <asp:Label ID="lblHashResult" runat="server"></asp:Label></p>
            
            <hr />
            
            <h2>TryIt: Calculator Service (Web Service Component)</h2>
            <p>Number 1: <asp:TextBox ID="txtNum1" runat="server" Text="10"></asp:TextBox></p>
            <p>Number 2: <asp:TextBox ID="txtNum2" runat="server" Text="5"></asp:TextBox></p>
            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
            <p>Result: <asp:Label ID="lblCalcResult" runat="server"></asp:Label></p>
        </div>
    </form>
</body>
</html>