using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
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
    public class Customer
    {
        CustomerBLL _bll = new CustomerBLL();
        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string GetCustomerList(int currentPage, int pageSize, string filter, string orderBy)
        {
            int totalRows = 0;
            DataTable dt = _bll.GetPageCustomerList(orderBy, currentPage, pageSize, ref totalRows);
            return JsonConvert.SerializeObject(dt);
        }
        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string GetCustomerListDt(string jsondatas)
        {
            DataTablesModel model = JsonHelper.JsonDeserialize(jsondatas);
            int totalRows = 0;
            DataTable dt = _bll.GetPageCustomerList("ID", 1, 10, ref totalRows);
            return JsonHelper.SerializeDataTablesData(model.sEcho, totalRows, dt);
        }
        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string AddCustomer(CustomerModel model, int type)
        {
            string errorMsg = "";
            model.Name = StringHelper.GetFirstPYLetter(model.RealName);
            if (type == 1) //添加
            {
                if (!_bll.CustomerAddValidate(model, ref errorMsg))
                {
                    return JsonConvert.SerializeObject(AlertHelper.WarningMessage(errorMsg));
                }
                int id = _bll.AddCustomer(model);
                return id > 0
                           ? JsonConvert.SerializeObject(AlertHelper.SuccessMessage())
                           : JsonConvert.SerializeObject(AlertHelper.ErrorMessage());
            }
            return _bll.UpdateCustomer(model)
                       ? JsonConvert.SerializeObject(AlertHelper.SuccessMessage("修改成功"))
                       : JsonConvert.SerializeObject(AlertHelper.ErrorMessage("修改失败"));
        }
        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string GetCustomerModel(int id)
        {
            return JsonConvert.SerializeObject(_bll.GetCustomerModel(id));
        }
    }
}
