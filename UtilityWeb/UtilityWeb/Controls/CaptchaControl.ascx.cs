using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace UtilityWeb.Controls
{
    public partial class CaptchaControl : UserControl
    {
        private const string sessionKey = "CaptchaCode";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[sessionKey] == null)
                Session[sessionKey] = GenerateCaptchaCode();
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Session[sessionKey] = GenerateCaptchaCode();
            lblResult.Text = "";
        }

        protected void btnValidate_Click(object sender, EventArgs e)
        {
            var expectedResult = (string)Session[sessionKey];
            var got = txtCaptchaInput.Text?.Trim();

            lblResult.Text = string.Equals(expectedResult, got, StringComparison.OrdinalIgnoreCase)
                ? "Captcha OK"
                : "Captcha NOT OK";
        }

        private string GenerateCaptchaCode()
        {
            const string chars = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
            var rng = new Random();
            var code = new char[6];
            for (int i = 0; i < code.Length; i++)
                code[i] = chars[rng.Next(chars.Length)];
            return new string(code);
        }
    }
}