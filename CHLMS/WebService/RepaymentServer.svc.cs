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

namespace WebUI.js.WebService
{
    [ServiceContract(Namespace = "WebUI.WebService")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class RepaymentServer
    {
        RepaymentRecordBLL _bll = new RepaymentRecordBLL();
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
        /// <summary>
        /// 查询
        /// </summary>
        /// <param name="currentPage"></param>
        /// <param name="pageSize"></param>
        /// <param name="orderBy"></param>
        /// <param name="where"></param>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string GetRepaymentList(int currentPage, int pageSize, string orderBy, string where)
        {
            int totalRows = 0;
            DataTable dt = _bll.GetPageRepaymentList(orderBy, currentPage, pageSize, ref totalRows, where);
            return JsonConvert.SerializeObject(dt);
        }

        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string Add(RepaymentRecordModel model)
        {

            return _bll.Add(model) > 1
                       ? JsonConvert.SerializeObject(AlertHelper.SuccessMessage())
                       : JsonConvert.SerializeObject(AlertHelper.ErrorMessage());

        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string Delete(int Id)
        {

            return _bll.Delete(Id) == true
                       ? JsonConvert.SerializeObject(AlertHelper.DelSuccessMessage())
                       : JsonConvert.SerializeObject(AlertHelper.DelErrorMessage());

        }

        /// <summary>
        /// 查询即将到期的还款
        /// </summary>
        /// <param name="currentPage"></param>
        /// <param name="pageSize"></param>
        /// <param name="orderBy"></param>
        /// <param name="where"></param>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string GetPageRepaymentPlanList(int currentPage, int pageSize, string orderBy, string where)
        {
            int totalRows = 0;
            DataTable dt = _bll.GetPageRepaymentPlanList(orderBy, currentPage, pageSize, ref totalRows, where);
            return JsonConvert.SerializeObject(dt);
        }

        /// <summary>
        /// 查询已经生成的还款计划
        /// </summary>
        /// <param name="currentPage"></param>
        /// <param name="pageSize"></param>
        /// <param name="orderBy"></param>
        /// <param name="where"></param>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string GetRepaymentCompleteList(int currentPage, int pageSize, string orderBy, string where)
        {
            int totalRows = 0;
            DataTable dt = _bll.GetRepaymentCompleteList(orderBy, currentPage, pageSize, ref totalRows, where);
            return JsonConvert.SerializeObject(dt);
        }

        /// <summary>
        /// 查询输入当前还款信息
        /// </summary>
        /// <param name="LoadId"></param>
        /// <param name="endTime"></param>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string RepaymentPlanModel(int LoadId, DateTime endTime)
        {

            Exist_RepaymentPlanModel dt = _bll.RepaymentPlanModel(LoadId, endTime);
            return JsonConvert.SerializeObject(dt);
        }

        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string GetCompleteRepaymentInfo(int loadId)
        {
            return JsonConvert.SerializeObject(_bll.GetCompleteRepaymentInfo(loadId));
        }

        // 在此处添加更多操作并使用 [OperationContract] 标记它们
    }
}
