using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Model;

namespace BLL
{
    public class CustomerBLL
    {
        private CustomerDAL _dal = new CustomerDAL();
        /// <summary>
        /// 获取客户列表
        /// </summary>
        /// <param name="orderBy"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="totalRows"></param>
        /// <returns></returns>
        public DataTable GetPageCustomerList(string orderBy, int pageIndex, int pageSize, ref int totalRows)
        {
            string where = "";
            return new BaseClass().GetPageDataTable("ID,Name,RealName,Mobile,[Identity],CreateTime", "dbo.Customer", where, orderBy, pageIndex, pageSize, ref totalRows);
        }

        /// <summary>
        /// 客户添加验证
        /// </summary>
        /// <param name="model"></param>
        /// <param name="errorMsg"></param>
        /// <returns></returns>
        public bool CustomerAddValidate(CustomerModel model, ref string errorMsg)
        {
            return _dal.CustomerAddValidate(model, ref errorMsg);
        }

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int AddCustomer(CustomerModel model)
        {
            return _dal.AddCustomer(model);
        }
    }
}
