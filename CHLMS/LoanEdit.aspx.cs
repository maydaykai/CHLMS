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
    public partial class LoanEdit : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            InitAgent();
        }
        private void InitAgent()
        {
            int totalRows = 0;
            sel_customerID.DataSource = new CustomerBLL().GetPageCustomerList("ID", 1, 100, ref totalRows);
            sel_customerID.DataValueField = "ID";
            sel_customerID.DataTextField = "Name";
            sel_customerID.Rows = 1;
            sel_customerID.DataBind();
            sel_customerID.Items.Insert(0, new ListItem("--请选择--", "0"));


            sel_loanTypeID.DataSource = new LoanBLL().GetLoanTypeList();
            sel_loanTypeID.DataValueField = "ID";
            sel_loanTypeID.DataTextField = "Name";
            sel_loanTypeID.Rows = 1;
            sel_loanTypeID.DataBind();
            sel_loanTypeID.Items.Insert(0, new ListItem("--请选择--", "0"));
        }
    }
}