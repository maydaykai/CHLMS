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
    public class User
    {
        UserBLL _bll = new UserBLL();
        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string GetUserList(int currentPage, int pageSize, string filter, string orderBy)
        {
            int totalRows = 0;
            DataTable dt = _bll.GetPageUserList(orderBy, currentPage, pageSize, filter, ref totalRows);
            return JsonConvert.SerializeObject(dt);
        }

        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string AddUser(UserModel model, int type)
        {
            if (type == 1) //添加
            {
                if (!_bll.UserNameExists(model.LoginName))
                {
                    return JsonConvert.SerializeObject(AlertHelper.WarningMessage("用户名已存在"));
                }
                model.Password = MD5Helper.GetMd5Hash(model.Password);
                int id = _bll.AddUser(model);
                return id > 0
                           ? JsonConvert.SerializeObject(AlertHelper.SuccessMessage())
                           : JsonConvert.SerializeObject(AlertHelper.ErrorMessage());
            }
            UserModel info = _bll.GetUserModel(model.ID);
            if(!info.Password.Equals(model.Password))
                model.Password = MD5Helper.GetMd5Hash(model.Password);
            return _bll.UpdateUser(model) 
                       ? JsonConvert.SerializeObject(AlertHelper.SuccessMessage("修改成功"))
                       : JsonConvert.SerializeObject(AlertHelper.ErrorMessage("修改失败"));
        }

        [OperationContract]
        [WebInvoke(BodyStyle = WebMessageBodyStyle.WrappedRequest, Method = "POST")]
        public string GetUserModel(int id)
        {
            return JsonConvert.SerializeObject(_bll.GetUserModel(id));
        }
    }
}
