using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using SecurityLib;

namespace UtilityWeb
{
    public partial class StaffLogin : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // If already logged in, skip login page and go to staff page
            if (Session["StaffLoggedIn"] != null)
            {
                Response.Redirect("StaffPage.aspx");
                return;
            }
        }
        protected void bttnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUser.Text.Trim();
            string password = txtPassword.Text.Trim();

            System.Diagnostics.Debug.WriteLine("RAW PASSWORD: [" + txtPassword.Text + "]");     //DEBUG
            System.Diagnostics.Debug.WriteLine("AFTER TRIM: [" + password + "]");               //DEBUG

            string hash = SecurityHelper.HashString(password);

            string file = Server.MapPath("~/App_Data/Staff.xml");
            XmlDocument doc = new XmlDocument();
            doc.Load(file);

            System.Diagnostics.Debug.WriteLine("Reading XML from: " + file);        //DEBUG

            XmlNode userNode = doc.SelectSingleNode($"/Staff/User[Username='{username}']");

            if (userNode != null)
            {
                string storedHash = userNode["passwordHash"].InnerText.Trim();

                System.Diagnostics.Debug.WriteLine("Computed hash: " + hash);       //DEBUG
                System.Diagnostics.Debug.WriteLine("Stored hash: " + storedHash);   //DEBUG

                if (storedHash.Equals(hash, StringComparison.OrdinalIgnoreCase))
                {
                    Session["StaffLoggedIn"] = username;
                    Response.Redirect("StaffPage.aspx");

                    return;
                }
            }

            lblMsg.Text = "Invalid staff username or password.";
        }
    }
}