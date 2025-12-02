<%@ WebHandler Language="C#" Class="CaptchaImage" %>

using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.Web;
using System.Web.SessionState;


public class CaptchaImage : IHttpHandler, IRequiresSessionState
{
    private const string sessionKey = "CaptchaCode";

    public void ProcessRequest(HttpContext context)
    {
        var code = context.Session[sessionKey] as string ?? "ERROR";

        using(var bmp = new Bitmap(200, 60))
        using(var g = Graphics.FromImage(bmp))
        {
            g.Clear(Color.White);
            using (var font = new Font("Arial", 28, FontStyle.Bold))
            using (var brush = new SolidBrush(Color.Black))
            {
                    g.DrawString(code, font, brush, 10, 10);
            }

            context.Response.ContentType = "image/png";
            bmp.Save(context.Response.OutputStream, ImageFormat.Png);
        }
    }

    public bool IsReusable => false;
}