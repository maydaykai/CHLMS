using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using BLL;
using Common;
using Model;
using Newtonsoft.Json;

namespace WebUI.WebService
{
    [ServiceContract(Namespace = "WebUI.WebService")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class Loan
    {
        LoanBLL _bll = new LoanBLL();
        #region 借款
        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string GetLoanList(int currentPage, int pageSize, string filter, string orderBy, int userId)
        {
            int totalRows = 0;
            string where = "";
            UserModel user = new UserBLL().GetUserModel(userId);
            if (user.Type == 4)
                where += "UserID=" + userId;
            DataTable dt = _bll.GetPageLoanList(where, orderBy, currentPage, pageSize, ref totalRows);
            return JsonConvert.SerializeObject(dt);
        }
        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string AddLoan(LoanModel model, int type)
        {
            if (type == 1) //添加
            {
                return _bll.AddLoan(model)
                           ? JsonConvert.SerializeObject(AlertHelper.SuccessMessage())
                           : JsonConvert.SerializeObject(AlertHelper.ErrorMessage());
            }
            return _bll.BuildPlan(model)
                       ? JsonConvert.SerializeObject(AlertHelper.SuccessMessage())
                       : JsonConvert.SerializeObject(AlertHelper.ErrorMessage());
        }

        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string GetLoanModel(int id)
        {
            return JsonConvert.SerializeObject(_bll.GetLoanModel(id));
        }
        #endregion
        #region 标种类型
        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string GetLoanTypeList()
        {
            return JsonConvert.SerializeObject(new LoanBLL().GetLoanTypeList());
        }
        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string GetLoanTypeModel(int id)
        {
            return JsonConvert.SerializeObject(new LoanBLL().GetLoanTypeModel(id));
        }
        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string AddLoanType(DimLoanTypeModel model, int type)
        {
            if (type == 1) //添加
            {
                return _bll.AddLoanType(model.Name) > 0
                           ? JsonConvert.SerializeObject(AlertHelper.SuccessMessage())
                           : JsonConvert.SerializeObject(AlertHelper.ErrorMessage());
            }
            return _bll.UpdateLoanType(model)
                       ? JsonConvert.SerializeObject(AlertHelper.SuccessMessage("修改成功"))
                       : JsonConvert.SerializeObject(AlertHelper.ErrorMessage("修改失败"));
        }
        #endregion
        #region 还款
        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string GetRepayListByID(int loanID)
        {
            return JsonConvert.SerializeObject(new LoanBLL().GetRepayListByID(loanID));
        }
        [OperationContract]

        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string RepayLoanByID(int repayID)
        {
            return _bll.RepayLoanByID(repayID)
                       ? JsonConvert.SerializeObject(AlertHelper.SuccessMessage("还款成功"))
                       : JsonConvert.SerializeObject(AlertHelper.ErrorMessage("还款失败"));
        }

        #endregion
    }
}
