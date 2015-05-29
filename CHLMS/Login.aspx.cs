using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Common;
using Model;

namespace WebUI
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                SessionHelper.Clear("UserID");
            }
        }

        protected void Btn_Click(object sender, EventArgs e)
        {
            var userName = txt_userName.Value;
            var password = txt_password.Value;
            if (string.IsNullOrEmpty(userName))
            {
                ClientScript.RegisterStartupScript(GetType(), "", "$.alertWarningHtml('alert-warning', '用户名不能为空');", true);
                return;
            }
            if (string.IsNullOrEmpty(password))
            {
                ClientScript.RegisterStartupScript(GetType(), "", "$.alertWarningHtml('alert-warning', '密码不能为空');", true);
                return;
            }
            password = MD5Helper.GetMd5Hash(password);
            UserModel info = new UserBLL().GetUserModel(userName, password);
            if (info != null)
            {
                string url = ConvertHelper.QueryString(Request, "nexturl", "");
                SessionHelper.Add("UserID", info.ID);
                SessionHelper.Add("UserInfo", info);
                Response.Redirect(!string.IsNullOrEmpty(url) ? url : "Index.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "", "$.alertWarningHtml('alert-warning', '用户名或密码错误');", true);
            }
        }
    }
}