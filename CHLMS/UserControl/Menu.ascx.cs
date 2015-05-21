using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;

namespace WebUI.UserControl
{
    public partial class Menu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionHelper.Exists("UserID"))
            {
                var UserID = ConvertHelper.ToInt(SessionHelper.Get("UserID").ToString());
                if (UserID != 1)
                {
                    uList.Visible = false;
                    lTypeList.Visible = false;
                }
            }
        }
    }
}