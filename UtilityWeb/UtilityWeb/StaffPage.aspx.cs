using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UtilityWeb
{
    public partial class StaffPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["StaffLoggedIn"] == null)
                {
                    Response.Redirect("StaffLogin.aspx");

                    return;
                }

                lblUser.Text = $"You are logged in as: {Session["StaffLoggedIn"]}";
            }
        }

        protected void bttnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("StaffLoggedIn");
            Response.Redirect("Default.aspx");
        }
    }
}