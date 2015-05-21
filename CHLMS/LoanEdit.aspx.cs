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

        }

        //protected void Btn_Click(object sender, EventArgs e)
        //{
        //    var loanCustomerID = ConvertHelper.ToInt(sel_customerID.Value);
        //    var loanAmount = ConvertHelper.ToDecimal(txt_loanAmount.Value);
        //    var loanTypeID = ConvertHelper.ToInt(sel_loanTypeID.Value);
        //    var repaymentmethod = ConvertHelper.ToInt(sel_repaymentmethod.Value);
        //    var loanTerm = ConvertHelper.ToInt(txt_loanTerm.Value);
        //    var loanRate = ConvertHelper.ToDecimal(txt_loanRate.Value);
        //    var agent = ConvertHelper.ToInt(sel_agent.Value);
        //    var loanTime = ConvertHelper.ToDateTime(txt_loanTime.Value);
        //    LoanModel model = new LoanModel
        //        {
        //            LoanCustomerID = loanCustomerID,
        //            LoanAmount = loanAmount,
        //            LoanTypeID = loanTypeID,
        //            RepaymentMethod = repaymentmethod,
        //            LoanTerm = loanTerm,
        //            LoanRate = loanRate,
        //            UserID = agent,
        //            LoanTime = loanTime,
        //            CreateTime = DateTime.Now,
        //            Status = 1
        //        };
        //    //new LoanBLL().AddLoan(model);
        //}
    }
}