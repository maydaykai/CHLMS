using System.Data;
using DAL;
using Model;

namespace BLL
{
    public class UserBLL
    {
        private UserDAL _dal = new UserDAL();

        /// <summary>
        /// 获取用户列表
        /// </summary>
        /// <param name="orderBy"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="filter"></param>
        /// <param name="totalRows"></param>
        /// <returns></returns>
        public DataTable GetPageUserList(string orderBy, int pageIndex, int pageSize, string filter, ref int totalRows)
        {
            return
                new BaseClass().GetPageDataTable(
                    "ID,LoginName,RealName,CASE [Type] WHEN 1 THEN '管理员' WHEN 2 THEN '财务人员' WHEN 3 THEN '营销部门负责人' WHEN 4 THEN '营销人员' END TypeStr,Mobile,Email,IsActive,CreateTime",
                    "dbo.[User]", filter, orderBy, pageIndex, pageSize, ref totalRows);
        }

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int AddUser(UserModel model)
        {
            return _dal.AddUser(model);
        }

        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool UpdateUser(UserModel model)
        {
            return _dal.UpdateUser(model);
        }

        /// <summary>
        /// 检测用户名是否存在 true为不存在
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public bool UserNameExists(string userName)
        {
            return _dal.UserNameExists(userName);
        }

        /// <summary>
        /// 登录验证
        /// </summary>
        public UserModel GetUserModel(string LoginName, string Password)
        {
            return _dal.GetUserModel("IsActive = 1 AND LoginName='" + LoginName + "' AND [Password]='" + Password + "'");
        }
        /// <summary>
        /// 根据ID获取model
        /// </summary>
        public UserModel GetUserModel(int UserID)
        {
            return _dal.GetUserModel("ID=" + UserID);
        }
    }
}
