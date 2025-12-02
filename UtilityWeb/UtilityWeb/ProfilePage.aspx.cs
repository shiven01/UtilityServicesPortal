using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UtilityWeb.Controls;

namespace UtilityWeb
{
    public partial class ProfilePage : Page
    {
        private const string cookieName = "UserProfile";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString["try"] == "captcha")
            {
               phCaptcha.Controls.Add(LoadControl("~/Controls/CaptchaControl.ascx"));
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var cookie = new HttpCookie(cookieName);
            cookie["DisplayName"] = txtName.Text;
            cookie["Theme"] = ddlTheme.SelectedValue;
            cookie.Expires = DateTime.Now.AddDays(30);
            Response.Cookies.Add(cookie);
        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
            var cookie = Request.Cookies[cookieName];
            if (cookie != null)
            {
                txtName.Text = cookie["DisplayName"];
                ddlTheme.SelectedValue = cookie["Theme"];
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Response.Cookies.Add(new HttpCookie(cookieName) { Expires = DateTime.Now.AddDays(-1) });
        }
    }
}