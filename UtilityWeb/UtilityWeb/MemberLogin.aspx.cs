using System;
using System.Web.UI;
using System.Xml;
using SecurityLib;

namespace UtilityWeb
{
    public partial class MemberLogin : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // If already logged in, skip login page and go to member page
            if (Session["MemberLoggedIn"] != null)
            {
                Response.Redirect("MemberPage.aspx");
                return;
            }
        }

        protected void bttnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUser.Text.Trim();
            string password = txtPassword.Text.Trim();
            string hash = SecurityHelper.HashString(password);

            string file = Server.MapPath("~/App_Data/Member.xml");
            XmlDocument doc = new XmlDocument();
            doc.Load(file);

            XmlNode userNode = doc.SelectSingleNode($"/Members/User[Username='{username}']");
            if (userNode != null)
            {
                string storedHash = userNode["passwordHash"].InnerText.Trim();
                if (storedHash.Equals(hash, StringComparison.OrdinalIgnoreCase))
                {
                    Session["MemberLoggedIn"] = username;
                    Response.Redirect("MemberPage.aspx");
                    return;
                }
            }
            lblMsg.Text = "Invalid member username or password.";
        }
    }
}