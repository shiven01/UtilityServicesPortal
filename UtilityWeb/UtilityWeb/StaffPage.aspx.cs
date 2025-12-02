using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace UtilityWeb
{
    public partial class StaffPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if staff is logged in
            if (Session["StaffLoggedIn"] == null)
            {
                Response.Redirect("StaffLogin.aspx");
                return;
            }

            lblUser.Text = $"Welcome, {Session["StaffLoggedIn"]}! You are logged in as Staff.";

            if (!IsPostBack)
            {
                LoadMembers();
            }
        }

        private void LoadMembers()
        {
            try
            {
                string xmlPath = Server.MapPath("~/App_Data/Member.xml");
                XmlDocument doc = new XmlDocument();
                doc.Load(xmlPath);

                DataTable dt = new DataTable();
                dt.Columns.Add("Username", typeof(string));
                dt.Columns.Add("PasswordHash", typeof(string));

                XmlNodeList users = doc.SelectNodes("/Members/User");
                foreach (XmlNode user in users)
                {
                    string username = user["Username"]?.InnerText ?? "Unknown";
                    string hash = user["passwordHash"]?.InnerText?.Trim() ?? "N/A";

                    dt.Rows.Add(username, hash);
                }

                gvMembers.DataSource = dt;
                gvMembers.DataBind();
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading members: " + ex.Message, false);
            }
        }

        protected void gvMembers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteMember")
            {
                string usernameToDelete = e.CommandArgument.ToString();
                DeleteMember(usernameToDelete);
            }
        }

        private void DeleteMember(string username)
        {
            try
            {
                string xmlPath = Server.MapPath("~/App_Data/Member.xml");
                XmlDocument doc = new XmlDocument();
                doc.Load(xmlPath);

                XmlNode userNode = doc.SelectSingleNode($"/Members/User[Username='{username}']");

                if (userNode != null)
                {
                    userNode.ParentNode.RemoveChild(userNode);
                    doc.Save(xmlPath);

                    ShowMessage($"Member '{username}' has been deleted successfully.", true);

                    // Reload the grid
                    LoadMembers();
                }
                else
                {
                    ShowMessage($"Member '{username}' not found.", false);
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error deleting member: " + ex.Message, false);
            }
        }

        private void ShowMessage(string message, bool isSuccess)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = isSuccess ? "message message-success" : "message message-error";
            lblMessage.Visible = true;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("StaffLoggedIn");
            Response.Redirect("Default.aspx");
        }
    }
}
