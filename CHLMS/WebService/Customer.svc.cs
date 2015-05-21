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
    public class Customer
    {
        CustomerBLL _bll = new CustomerBLL();
        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string GetCustomerList(int currentPage, int pageSize, string filter, string orderBy)
        {
            int totalRows = 0;
            DataTable dt = _bll.GetPageCustomerList(orderBy, currentPage, pageSize, ref totalRows);
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
        public string AddCustomer(CustomerModel model)
        {
            string errorMsg = "";
            if (!_bll.CustomerAddValidate(model,ref errorMsg))
            {
                return JsonConvert.SerializeObject(AlertHelper.WarningMessage(errorMsg));
            }
            int id = _bll.AddCustomer(model);
            return id > 0
                       ? JsonConvert.SerializeObject(AlertHelper.SuccessMessage())
                       : JsonConvert.SerializeObject(AlertHelper.ErrorMessage());
        }
    }
}
