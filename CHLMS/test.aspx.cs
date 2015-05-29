using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebUI
{
    public partial class test : System.Web.UI.Page
    {
        RepaymentBLL _bll = new RepaymentBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            //测试页面
            DateTime time1 = Convert.ToDateTime("2015-02-05 16:29:30.367");
            DateTime time2 = Convert.ToDateTime("2015-03-01 16:29:30.367");
            _bll.ReturnDay(0, time1, time2);
            _bll.ReturnDay(1, time1, time2);
            _bll.RepaymentCompleteToXML(7);
        }
    }
}