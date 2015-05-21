using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;

namespace WebUI
{
    public partial class BasePage : System.Web.UI.Page
    {
        protected int UserID;
        public BasePage()
        {
            this.Page.PreLoad += BaseLoad;
        }
        protected void BaseLoad(object sender, EventArgs e)
        {
            if (!SessionHelper.Exists("UserID"))
            {
                if (!string.IsNullOrEmpty(Request.RawUrl))
                {
                    Response.Write(
                        "<script type=\"text/javascript\">top.window.location='Login.aspx?nexturl=" +
                        Request.RawUrl + " '</script>");
                    Response.End();
                }
                else
                {
                    Response.Write(
                        "<script type=\"text/javascript\">top.window.location='Login.aspx'</script>");
                    Response.End();
                }
            }
            else
            {
                UserID = ConvertHelper.ToInt(SessionHelper.Get("UserID").ToString());
            }
        }
    }
}