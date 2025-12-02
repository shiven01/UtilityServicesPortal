<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UtilityWeb.Default" %>
<%@ Register TagPrefix="uc1" TagName="CaptchaControl" Src="~/Controls/CaptchaControl.ascx" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Utility Services Portal - CSE 445</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h1 { color: #333; }
        h2 { color: #555; border-bottom: 1px solid #ccc; padding-bottom: 5px; }
        h3 { color: #666; }
        table { border-collapse: collapse; width: 100%; margin: 10px 0; }
        th { background-color: #f0f0f0; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
        .tryit-section { background-color: #f9f9f9; padding: 15px; margin: 10px 0; border-radius: 5px; }
        .nav-button { padding: 10px 20px; margin: 5px; font-size: 14px; }
        .info-box { background-color: #e7f3ff; padding: 15px; border-left: 4px solid #2196F3; margin: 10px 0; }
        .test-info { background-color: #fff3cd; padding: 15px; border-left: 4px solid #ffc107; margin: 10px 0; }
        hr { margin: 20px 0; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Utility Services Portal - CSE 445 Assignments 5 & 6</h1>
        
        <!-- ========== APPLICATION INFORMATION ========== -->
        <h2>Application Information</h2>
        <div class="info-box">
            <p><strong>Purpose:</strong> This application demonstrates service-oriented architecture with local components and web services, implementing a complete user management system with secure authentication.</p>
            <p><strong>Features:</strong></p>
            <ul>
                <li>Member self-registration with CAPTCHA verification</li>
                <li>Secure login system with SHA256 password hashing</li>
                <li>Staff portal with administrative access</li>
                <li>Multiple web services for calculations and string manipulation</li>
                <li>Cookie-based user preferences</li>
                <li>Session-based visit tracking</li>
            </ul>
        </div>

        <!-- ========== HOW TO TEST ========== -->
        <h2>How to Test This Application</h2>
        <div class="test-info">
            <h3>For TA/Grader:</h3>
            <p><strong>Staff Login Credentials:</strong></p>
            <ul>
                <li>Username: <code>TA</code></li>
                <li>Password: <code>Cse445!</code></li>
            </ul>
            
            <h3>Test Cases:</h3>
            <ol>
                <li><strong>Member Registration:</strong> Click "Member Page" → "Register here" → Enter username, password, and CAPTCHA → Submit</li>
                <li><strong>Member Login:</strong> Use credentials created during registration</li>
                <li><strong>Staff Login:</strong> Click "Staff Page" → Enter TA credentials above</li>
                <li><strong>Hash Function:</strong> Enter any text below and click "Hash" to see SHA256 output</li>
                <li><strong>Calculator Service:</strong> Enter two numbers and click "Add"</li>
                <li><strong>String Service:</strong> Enter text and test Reverse, ToUpper, ToLower, Length operations</li>
                <li><strong>CAPTCHA:</strong> Test the CAPTCHA control below - enter the displayed code and click Validate</li>
                <li><strong>Cookies:</strong> Click "Open Profile Page" to test cookie storage</li>
            </ol>
            
            <h3>Login Redirection Logic:</h3>
            <ul>
                <li>If not logged in → Redirects to Login page</li>
                <li>If already logged in → Skips Login page, goes directly to Member/Staff page</li>
            </ul>
        </div>

        <!-- ========== NAVIGATION ========== -->
        <h2>Navigation</h2>
        <p>Access protected pages (implements login redirection - will skip login if already authenticated):</p>
        <asp:Button ID="btnMember" runat="server" Text="Member Page" OnClick="btnMember_Click" CssClass="nav-button" />
        <asp:Button ID="btnStaff" runat="server" Text="Staff Page" OnClick="btnStaff_Click" CssClass="nav-button" />
        
        <hr />

        <!-- ========== TEAM CONTRIBUTIONS ========== -->
        <h2>Team Contributions</h2>
        <p><strong>Percentage of Overall Contribution:</strong> Shiven Shekar: 50%, Yash Singh: 50%</p>
        
        <hr />

        <!-- ========== SERVICE DIRECTORY ========== -->
        <h2>Service Directory</h2>
        <p>All components and services used in this application:</p>
        
        <table>
            <tr>
                <th>Provider</th>
                <th>Component Type</th>
                <th>Operation</th>
                <th>Parameters</th>
                <th>Return Type</th>
                <th>Description</th>
            </tr>
            <!-- Shiven's Components -->
            <tr>
                <td>Shiven Shekar</td>
                <td>Global.asax</td>
                <td>Application_Start, Session_Start</td>
                <td>N/A</td>
                <td>void</td>
                <td>Initializes application; tracks visit count using Application State</td>
            </tr>
            <tr>
                <td>Shiven Shekar</td>
                <td>DLL (SecurityLib)</td>
                <td>HashString</td>
                <td>string input</td>
                <td>string</td>
                <td>Hashes string using SHA256; used for password storage</td>
            </tr>
            <tr>
                <td>Shiven Shekar</td>
                <td>WSDL Service</td>
                <td>Add</td>
                <td>double a, double b</td>
                <td>double</td>
                <td>Calculator service - adds two numbers</td>
            </tr>
            <tr>
                <td>Shiven Shekar</td>
                <td>ASPX Pages</td>
                <td>MemberRegister.aspx</td>
                <td>Username, Password, CAPTCHA</td>
                <td>Redirect</td>
                <td>Member self-registration with CAPTCHA and hashed password storage</td>
            </tr>
            <tr>
                <td>Shiven Shekar</td>
                <td>Session State</td>
                <td>Login Redirect Logic</td>
                <td>Session variables</td>
                <td>bool</td>
                <td>Manages authentication state; implements login redirection</td>
            </tr>
            <!-- Yash's Components -->
            <tr>
                <td>Yash Singh</td>
                <td>User Control</td>
                <td>CaptchaControl.ascx</td>
                <td>Image + Text Input</td>
                <td>bool</td>
                <td>Generates and validates CAPTCHA codes</td>
            </tr>
            <tr>
                <td>Yash Singh</td>
                <td>Cookie Component</td>
                <td>ProfilePage.aspx</td>
                <td>Name, Theme Preference</td>
                <td>string</td>
                <td>Saves and reads user preferences from cookies</td>
            </tr>
            <tr>
                <td>Yash Singh</td>
                <td>WSDL Service</td>
                <td>Reverse, ToUpper, ToLower, GetLength</td>
                <td>string input</td>
                <td>string/int</td>
                <td>Various string manipulation operations</td>
            </tr>
            <tr>
                <td>Yash Singh</td>
                <td>ASPX Pages</td>
                <td>MemberLogin, MemberPage, StaffLogin, StaffPage</td>
                <td>Username, Password</td>
                <td>Redirect</td>
                <td>Member and Staff authentication pages with XML credential storage</td>
            </tr>
            <tr>
                <td>Yash Singh</td>
                <td>Generic Handler</td>
                <td>CaptchaImage.ashx</td>
                <td>Session code</td>
                <td>image/png</td>
                <td>Generates CAPTCHA image from session-stored code</td>
            </tr>
        </table>
        
        <hr />

        <!-- ========== APPLICATION STATISTICS ========== -->
        <h2>TryIt: Application Statistics (Global.asax Component)</h2>
        <div class="tryit-section">
            <p><strong>Description:</strong> Demonstrates Application State managed by Global.asax event handlers.</p>
            <p><strong>Visit Count:</strong> <asp:Label ID="lblVisitCount" runat="server" Text="0" Font-Bold="true" /></p>
            <p><em>This counter increments each time a new session starts (Session_Start event).</em></p>
        </div>
        
        <hr />

        <!-- ========== HASH FUNCTION ========== -->
        <h2>TryIt: Hash Function (DLL Component - SecurityLib)</h2>
        <div class="tryit-section">
            <p><strong>Description:</strong> Tests the SHA256 hashing function from SecurityLib.dll. This is used to hash passwords before storing in XML files.</p>
            <p><strong>Test Case:</strong> Enter "Cse445!" to see the hash stored for the TA account.</p>
            <table>
                <tr>
                    <td>Input Text:</td>
                    <td><asp:TextBox ID="txtHashInput" runat="server" Text="test" Width="200px" /></td>
                </tr>
                <tr>
                    <td>Action:</td>
                    <td><asp:Button ID="btnHash" runat="server" Text="Hash" OnClick="btnHash_Click" /></td>
                </tr>
                <tr>
                    <td>Result:</td>
                    <td><asp:Label ID="lblHashResult" runat="server" Font-Bold="true" /></td>
                </tr>
            </table>
        </div>
        
        <hr />

        <!-- ========== CALCULATOR SERVICE ========== -->
        <h2>TryIt: Calculator Service (WSDL Web Service)</h2>
        <div class="tryit-section">
            <p><strong>Description:</strong> Tests the Calculator SOAP web service Add operation.</p>
            <p><strong>Test Case:</strong> Enter 10 and 5, expect result 15.</p>
            <table>
                <tr>
                    <td>Number 1:</td>
                    <td><asp:TextBox ID="txtNum1" runat="server" Text="10" Width="100px" /></td>
                </tr>
                <tr>
                    <td>Number 2:</td>
                    <td><asp:TextBox ID="txtNum2" runat="server" Text="5" Width="100px" /></td>
                </tr>
                <tr>
                    <td>Action:</td>
                    <td><asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" /></td>
                </tr>
                <tr>
                    <td>Result:</td>
                    <td><asp:Label ID="lblCalcResult" runat="server" Font-Bold="true" /></td>
                </tr>
            </table>
        </div>

        <hr />

        <!-- ========== CAPTCHA CONTROL ========== -->
        <h2>TryIt: CAPTCHA Control (User Control)</h2>
        <div class="tryit-section">
            <p><strong>Description:</strong> Tests the custom CAPTCHA user control. Enter the code shown in the image and click Validate.</p>
            <p><strong>Test Case:</strong> Type the exact characters shown, click Validate, expect "Captcha OK".</p>
            <uc1:CaptchaControl ID="CaptchaTry" runat="server" />
        </div>

        <hr />

        <!-- ========== COOKIE DEMO ========== -->
        <h2>TryIt: Cookie Component</h2>
        <div class="tryit-section">
            <p><strong>Description:</strong> Tests HTTP cookie storage for user preferences.</p>
            <p><strong>Test Case:</strong> Open the Profile Page, enter a name and theme, save, then refresh to see values persisted.</p>
            <asp:HyperLink ID="lnkProfile" runat="server" NavigateUrl="~/ProfilePage.aspx" Text="Open Profile Page" Font-Underline="true" />
        </div>

        <hr />

        <!-- ========== STRING SERVICE ========== -->
        <h2>TryIt: String Service (WSDL Web Service)</h2>
        <div class="tryit-section">
            <p><strong>Description:</strong> Tests the String manipulation SOAP web service with multiple operations.</p>
            <p><strong>Test Cases:</strong></p>
            <ul>
                <li>Enter "Hello" → Reverse → "olleH"</li>
                <li>Enter "hello" → ToUpper → "HELLO"</li>
                <li>Enter "HELLO" → ToLower → "hello"</li>
                <li>Enter "Hello" → Length → 5</li>
            </ul>
            <table>
                <tr>
                    <td>Text Input:</td>
                    <td><asp:TextBox ID="txtStringInput" runat="server" Width="200px" /></td>
                </tr>
                <tr>
                    <td>Actions:</td>
                    <td>
                        <asp:Button ID="btnReverse" runat="server" Text="Reverse" OnClick="btnReverse_Click" />
                        <asp:Button ID="btnToUpper" runat="server" Text="To Uppercase" OnClick="btnToUpper_Click" />
                        <asp:Button ID="btnToLower" runat="server" Text="To Lowercase" OnClick="btnToLower_Click" />
                        <asp:Button ID="btnLength" runat="server" Text="Length" OnClick="btnLength_Click" />
                    </td>
                </tr>
                <tr>
                    <td>Result:</td>
                    <td><asp:Label ID="lblStringResult" runat="server" Font-Bold="true" /></td>
                </tr>
            </table>
        </div>

        <hr />
        
        <!-- ========== FOOTER ========== -->
        <p style="text-align: center; color: #888; font-size: 12px;">
            CSE 445/598 - Distributed Software Development | Arizona State University | Fall 2025
        </p>
    </form>
</body>
</html>
