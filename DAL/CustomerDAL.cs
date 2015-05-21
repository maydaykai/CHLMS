using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Conn;
using Model;

namespace DAL
{
    public class CustomerDAL
    {
        /// <summary>
        /// 客户添加验证
        /// </summary>
        /// <param name="model"></param>
        /// <param name="errorMsg"></param>
        /// <returns></returns>
        public bool CustomerAddValidate(CustomerModel model, ref string errorMsg)
        {
            SqlParameter[] paras = {
                new SqlParameter("@Name", SqlDbType.VarChar,50){Value = model.Name},
                new SqlParameter("@Mobile", SqlDbType.VarChar,20){Value = model.Mobile},
                new SqlParameter("@Identity", SqlDbType.VarChar,20){Value = model.Identity},
                new SqlParameter("@ErrorMsg", SqlDbType.NVarChar,100){Direction = ParameterDirection.Output}
                };
            string sql = "[dbo].[Proc_CustomerAddValidate]";
            object num = SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocal, CommandType.StoredProcedure, sql, paras);
            errorMsg = paras[3].Value.ToString();
            return Convert.ToInt32(num) > 0;
        }
        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int AddCustomer(CustomerModel model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into Customer(");
            strSql.Append("Name,RealName,Mobile,[Identity],Address,CreateTime,CreateUserID");
            strSql.Append(") values (");
            strSql.Append("@Name,@RealName,@Mobile,@Identity,@Address,@CreateTime,@CreateUserID");
            strSql.Append(") ");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
			            new SqlParameter("@Name", SqlDbType.VarChar,50){Value= model.Name},
                        new SqlParameter("@RealName", SqlDbType.NVarChar,50){Value= model.RealName},
                        new SqlParameter("@Mobile", SqlDbType.VarChar,20){Value= model.Mobile},
                        new SqlParameter("@Identity", SqlDbType.VarChar,20){Value= model.Identity},
                        new SqlParameter("@Address", SqlDbType.NVarChar,100){Value= model.Address},
                        new SqlParameter("@CreateTime", SqlDbType.DateTime){Value= DateTime.Now},
                        new SqlParameter("@CreateUserID", SqlDbType.Int,4){Value= model.CreateUserID},
                        };
            object obj = SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocal, CommandType.Text, strSql.ToString(), parameters);
            return obj == null ? 0 : Convert.ToInt32(obj);
        }
    }
}
