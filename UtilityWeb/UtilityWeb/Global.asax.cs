using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace UtilityWeb
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            // Initialize visit counter
            Application["VisitCount"] = 0;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            // Increment counter when new session starts
            Application.Lock();
            Application["VisitCount"] = (int)Application["VisitCount"] + 1;
            Application.UnLock();
        }
    }
}