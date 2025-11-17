using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using SecurityLib;

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
    }
}