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
        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool UpdateCustomer(CustomerModel model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update Customer set ");

            strSql.Append(" [Name] = @Name , ");
            strSql.Append(" RealName = @RealName , ");
            strSql.Append(" Mobile = @Mobile , ");
            strSql.Append(" [Identity] = @Identity , ");
            strSql.Append(" [Address] = @Address ");
            strSql.Append(" where ID=@ID ");

            SqlParameter[] parameters = {
			            new SqlParameter("@Name", SqlDbType.VarChar,50){Value= model.Name},
                        new SqlParameter("@RealName", SqlDbType.NVarChar,50){Value= model.RealName},
                        new SqlParameter("@Mobile", SqlDbType.VarChar,20){Value= model.Mobile},
                        new SqlParameter("@ID", SqlDbType.Int){Value= model.ID},
                        new SqlParameter("@Identity", SqlDbType.VarChar,20){Value= model.Identity},
                        new SqlParameter("@Address", SqlDbType.NVarChar,100){Value= model.Address}
                        };

            int rows = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocal, CommandType.Text, strSql.ToString(), parameters);
            return rows > 0;
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public CustomerModel GetCustomerModel(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select top 1 ID, Name, RealName, Mobile, [Identity], [Address], CreateTime, CreateUserID  ");
            strSql.Append(" from Customer ");
            if (!string.IsNullOrEmpty(strWhere))
            {
                strSql.Append(" where " + strWhere);
            }

            CustomerModel model = new CustomerModel();
            DataSet ds = SqlHelper.ExecuteDataSet(SqlHelper.ConnectionStringLocal, CommandType.Text, strSql.ToString());

            if (ds.Tables[0].Rows.Count > 0)
            {
                #region 给对象赋值
                if (ds.Tables[0].Rows[0]["ID"].ToString() != "")
                {
                    model.ID = int.Parse(ds.Tables[0].Rows[0]["ID"].ToString());
                }
                if (ds.Tables[0].Rows[0]["Name"].ToString() != "")
                {
                    model.Name = ds.Tables[0].Rows[0]["Name"].ToString();
                }
                if (ds.Tables[0].Rows[0]["RealName"].ToString() != "")
                {
                    model.RealName = ds.Tables[0].Rows[0]["RealName"].ToString();
                }
                if (ds.Tables[0].Rows[0]["Mobile"].ToString() != "")
                {
                    model.Mobile = ds.Tables[0].Rows[0]["Mobile"].ToString();
                }
                if (ds.Tables[0].Rows[0]["Identity"].ToString() != "")
                {
                    model.Identity = ds.Tables[0].Rows[0]["Identity"].ToString();
                }
                if (ds.Tables[0].Rows[0]["Address"].ToString() != "")
                {
                    model.Address = ds.Tables[0].Rows[0]["Address"].ToString();
                }
                if (ds.Tables[0].Rows[0]["CreateTime"].ToString() != "")
                {
                    model.CreateTime = DateTime.Parse(ds.Tables[0].Rows[0]["CreateTime"].ToString());
                }
                if (ds.Tables[0].Rows[0]["CreateUserID"].ToString() != "")
                {
                    model.CreateUserID = int.Parse(ds.Tables[0].Rows[0]["CreateUserID"].ToString());
                }
                #endregion
                return model;
            }
            return null;
        }
    }
}
