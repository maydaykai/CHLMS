using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Common;
using Model;

namespace WebUI.UserControl
{
    public partial class Header : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionHelper.Exists("UserID"))
            {
                var UserID = ConvertHelper.ToInt(SessionHelper.Get("UserID").ToString());
                UserModel info = new UserBLL().GetUserModel(UserID);
                userName.InnerHtml = info.RealName + "<b class='caret'></b>";
            }
        }
    }
}