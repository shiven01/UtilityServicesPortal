using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using SecurityLib;
using System.CodeDom;
using UtilityWeb.StringSvc;

namespace UtilityWeb
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Display visit count from Global.asax
                if (Application["VisitCount"] != null)
                {
                    lblVisitCount.Text = Application["VisitCount"].ToString();
                }
            }
        }

        // Hash function (DLL)
        protected void btnHash_Click(object sender, EventArgs e)
        {
            string input = txtHashInput.Text;
            string hashed = SecurityHelper.HashString(input);
            lblHashResult.Text = hashed;
        }

        // Calculator service
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            double num1 = Convert.ToDouble(txtNum1.Text);
            double num2 = Convert.ToDouble(txtNum2.Text);

            CalcService.CalculatorSoapClient client = new CalcService.CalculatorSoapClient();
            double result = client.Add(num1, num2);

            lblCalcResult.Text = result.ToString();
        }

        //StringService
        protected void btnReverse_Click(object sender, EventArgs e)
        {
            var client = new StringSvc.StringService();
            string input = txtStringInput.Text;
            string result = client.reverseString(input);
            lblStringResult.Text = result;
        }

        protected void btnToUpper_Click(object sender, EventArgs e)
        {
            var client = new StringSvc.StringService();
            string input = txtStringInput.Text;
            string result = client.toUpperCase(input);
            lblStringResult.Text = result;
        }

        protected void btnToLower_Click(object sender, EventArgs e)
        {
            var client = new StringSvc.StringService();
            string input = txtStringInput.Text;
            string result = client.toLowerCase(input);
            lblStringResult.Text = result;
        }

        protected void btnLength_Click(object sender, EventArgs e)
        {
            var client = new StringSvc.StringService();
            string input = txtStringInput.Text;
            int len = client.GetLength(input);
            lblStringResult.Text = len.ToString();
        }

        // Navigation - check session before redirecting
        protected void btnMember_Click(object sender, EventArgs e)
        {
            if (Session["MemberLoggedIn"] != null)
            {
                // Already logged in - go directly to member page
                Response.Redirect("MemberPage.aspx");
            }
            else
            {
                // Not logged in - go to login page
                Response.Redirect("MemberLogin.aspx");
            }
        }

        protected void btnStaff_Click(object sender, EventArgs e)
        {
            if (Session["StaffLoggedIn"] != null)
            {
                // Already logged in - go directly to staff page
                Response.Redirect("StaffPage.aspx");
            }
            else
            {
                // Not logged in - go to login page
                Response.Redirect("StaffLogin.aspx");
            }
        }
    }
}