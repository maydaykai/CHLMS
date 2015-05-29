using BLL;
using Common;
using Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

namespace WebUI.WebService
{
    [ServiceContract(Namespace = "WebUI.WebService")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class Repayment
    {
        RepaymentBLL _bll = new RepaymentBLL();
        // 要使用 HTTP GET，请添加 [WebGet] 特性。(默认 ResponseFormat 为 WebMessageFormat.Json)
        // 要创建返回 XML 的操作，
        //     请添加 [WebGet(ResponseFormat=WebMessageFormat.Xml)]，
        //     并在操作正文中包括以下行:
        //         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
        [OperationContract]
        public void DoWork()
        {
            // 在此处添加操作实现
            return;
        }

        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string GetRepaymentList(int currentPage, int pageSize, string orderBy, string where)
        {
            int totalRows = 0;
            DataTable dt = _bll.GetPageRepaymentList(orderBy, currentPage, pageSize, ref totalRows, where);
            return JsonConvert.SerializeObject(dt);
        }

        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string AddRepayment(RepaymentModel model)
        {

            return _bll.AddRepayment(model) > 1
                       ? JsonConvert.SerializeObject(AlertHelper.SuccessMessage())
                       : JsonConvert.SerializeObject(AlertHelper.ErrorMessage());

        }

        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string Delete(int Id)
        {

            return _bll.Delete(Id) == true
                       ? JsonConvert.SerializeObject(AlertHelper.DelSuccessMessage())
                       : JsonConvert.SerializeObject(AlertHelper.DelErrorMessage());

        }



        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string GetPageRepaymentPlanList(int currentPage, int pageSize, string orderBy, string where)
        {
            int totalRows = 0;
            DataTable dt = _bll.GetPageRepaymentPlanList(orderBy, currentPage, pageSize, ref totalRows, where);
            return JsonConvert.SerializeObject(dt);
        }


    }
}
