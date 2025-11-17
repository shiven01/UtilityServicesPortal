using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace CalculatorService
{
    /// <summary>
    /// Calculator Service - Shiven Shekar
    /// </summary>
    [WebService(Namespace = "http://asu.edu/calculator/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    public class Calculator : System.Web.Services.WebService
    {
        /// <summary>
        /// Adds two numbers
        /// </summary>
        [WebMethod(Description = "Adds two numbers")]
        public double Add(double a, double b)
        {
            return a + b;
        }
    }
}