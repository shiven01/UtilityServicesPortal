using System;
using System.Web.UI;
using System.Xml;
using SecurityLib;

namespace UtilityWeb
{
    public partial class MemberRegister : Page
    {
        private const string CaptchaSessionKey = "CaptchaCode";

        protected void Page_Load(object sender, EventArgs e)
        {
            // If already logged in, redirect to member page
            if (Session["MemberLoggedIn"] != null)
            {
                Response.Redirect("MemberPage.aspx");
                return;
            }

            // Generate captcha on first load
            if (!IsPostBack)
            {
                GenerateNewCaptcha();
            }
        }

        protected void btnRefreshCaptcha_Click(object sender, EventArgs e)
        {
            GenerateNewCaptcha();
            lblMessage.Text = "";
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;
            string captchaInput = txtCaptcha.Text.Trim();

            // Validate inputs
            if (string.IsNullOrEmpty(username))
            {
                lblMessage.Text = "Username is required.";
                return;
            }

            if (string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Password is required.";
                return;
            }

            if (password != confirmPassword)
            {
                lblMessage.Text = "Passwords do not match.";
                return;
            }

            // Validate CAPTCHA
            string expectedCaptcha = Session[CaptchaSessionKey] as string;
            if (!string.Equals(captchaInput, expectedCaptcha, StringComparison.OrdinalIgnoreCase))
            {
                lblMessage.Text = "CAPTCHA verification failed. Please try again.";
                GenerateNewCaptcha();
                return;
            }

            // Check if username already exists
            string xmlPath = Server.MapPath("~/App_Data/Member.xml");
            XmlDocument doc = new XmlDocument();
            doc.Load(xmlPath);

            XmlNode existingUser = doc.SelectSingleNode($"/Members/User[Username='{username}']");
            if (existingUser != null)
            {
                lblMessage.Text = "Username already exists. Please choose another.";
                GenerateNewCaptcha();
                return;
            }

            // Hash password using SecurityLib DLL
            string hashedPassword = SecurityHelper.HashString(password);

            // Add new user to XML
            XmlNode membersNode = doc.SelectSingleNode("/Members");

            XmlElement userElement = doc.CreateElement("User");

            XmlElement usernameElement = doc.CreateElement("Username");
            usernameElement.InnerText = username;
            userElement.AppendChild(usernameElement);

            XmlElement passwordElement = doc.CreateElement("passwordHash");
            passwordElement.InnerText = hashedPassword;
            userElement.AppendChild(passwordElement);

            membersNode.AppendChild(userElement);
            doc.Save(xmlPath);

            // Registration successful - redirect to login
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Registration successful! Redirecting to login...";

            // Redirect after short delay (or immediately)
            Response.Redirect("MemberLogin.aspx?registered=true");
        }

        private void GenerateNewCaptcha()
        {
            const string chars = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
            var rng = new Random();
            var code = new char[6];
            for (int i = 0; i < code.Length; i++)
                code[i] = chars[rng.Next(chars.Length)];

            Session[CaptchaSessionKey] = new string(code);

            // Force image refresh by adding timestamp
            imgCaptcha.ImageUrl = "~/CaptchaImage.ashx?t=" + DateTime.Now.Ticks;
        }
    }
}