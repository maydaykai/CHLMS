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
        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string GetLoanList(int currentPage, int pageSize, string filter, string orderBy)
        {
            int totalRows = 0;
            DataTable dt = _bll.GetPageLoanList(orderBy, currentPage, pageSize, ref totalRows);
            //var jsondatas = new
            //    {
            //        draw = currentPage,
            //        recordsTotal = totalRows,
            //        recordsFiltered = totalRows,
            //        data = dt
            //    };
            return JsonConvert.SerializeObject(dt);
        }

        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string GetLoanTypeList()
        {
            return JsonConvert.SerializeObject(new LoanBLL().GetLoanTypeList());
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
            return "";
        }
    }
}
