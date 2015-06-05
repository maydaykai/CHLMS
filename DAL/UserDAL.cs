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
    public class UserDAL
    {
        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int AddUser(UserModel model)
        {
            var strSql = new StringBuilder();
            strSql.Append("insert into [User](");
            strSql.Append("LoginName,Password,RealName,CreateTime,IsActive,Email,Mobile,Type,LoanTypePermission");
            strSql.Append(") values (");
            strSql.Append("@LoginName,@Password,@RealName,@CreateTime,@IsActive,@Email,@Mobile,@Type,@LoanTypePermission");
            strSql.Append(") ");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
			            new SqlParameter("@LoginName", SqlDbType.NVarChar,50){Value= model.LoginName},
                        new SqlParameter("@Password", SqlDbType.NVarChar,100){Value= model.Password},
			            new SqlParameter("@RealName", SqlDbType.NVarChar,20){Value= model.RealName},
                        new SqlParameter("@CreateTime", SqlDbType.DateTime){Value= DateTime.Now},
                        new SqlParameter("@IsActive", SqlDbType.Bit,1){Value= model.IsActive},
                        new SqlParameter("@Email", SqlDbType.NVarChar,50){Value= model.Email},
                        new SqlParameter("@Mobile", SqlDbType.NVarChar,50){Value= model.Mobile},
                        new SqlParameter("@Type", SqlDbType.SmallInt,2){Value= model.Type},
                        new SqlParameter("@LoanTypePermission", SqlDbType.VarChar,50){Value= model.LoanTypePermission ?? ""},
                        };
            object obj = SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocal, CommandType.Text, strSql.ToString(), parameters);
            return obj == null ? 0 : Convert.ToInt32(obj);
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool UpdateUser(UserModel model)
        {
            var strSql = new StringBuilder();
            strSql.Append("update [User] set ");

            strSql.Append(" LoanTypePermission = @LoanTypePermission , ");
            strSql.Append(" LoginName = @LoginName , ");
            strSql.Append(" Password = @Password , ");
            strSql.Append(" RealName = @RealName , ");
            strSql.Append(" IsActive = @IsActive , ");
            strSql.Append(" Email = @Email , ");
            strSql.Append(" Mobile = @Mobile , ");
            strSql.Append(" Type = @Type  ");
            strSql.Append(" where ID=@ID ");

            SqlParameter[] parameters = {
			            new SqlParameter("@LoanTypePermission", SqlDbType.VarChar,50){Value= model.LoanTypePermission},
                        new SqlParameter("@LoginName", SqlDbType.NVarChar,50){Value= model.LoginName},
                        new SqlParameter("@Password", SqlDbType.NVarChar,100){Value= model.Password},
                        new SqlParameter("@RealName", SqlDbType.NVarChar,20){Value= model.RealName},
                        new SqlParameter("@ID", SqlDbType.Int){Value= model.ID},
                        new SqlParameter("@IsActive", SqlDbType.Bit,1){Value= model.IsActive},
                        new SqlParameter("@Email", SqlDbType.NVarChar,50){Value= model.Email},
                        new SqlParameter("@Mobile", SqlDbType.NVarChar,50){Value= model.Mobile},
                        new SqlParameter("@Type", SqlDbType.SmallInt,2){Value= model.Type},
                        };

            int rows = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocal, CommandType.Text, strSql.ToString(), parameters);
            return rows > 0;
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public UserModel GetUserModel(string strWhere)
        {

            var strSql = new StringBuilder();
            strSql.Append("select top 1 ID, LoginName, [Password], RealName, CreateTime, IsActive, Email, Mobile, [Type], LoanTypePermission  ");
            strSql.Append(" from [User] ");
            if (!string.IsNullOrEmpty(strWhere))
            {
                strSql.Append(" where " + strWhere);
            }

            UserModel model = new UserModel();
            DataSet ds = SqlHelper.ExecuteDataSet(SqlHelper.ConnectionStringLocal, CommandType.Text, strSql.ToString());

            if (ds.Tables[0].Rows.Count > 0)
            {
                #region 给对象赋值
                if (ds.Tables[0].Rows[0]["ID"].ToString() != "")
                {
                    model.ID = int.Parse(ds.Tables[0].Rows[0]["ID"].ToString());
                }
                if (ds.Tables[0].Rows[0]["LoginName"].ToString() != "")
                {
                    model.LoginName = ds.Tables[0].Rows[0]["LoginName"].ToString();
                }
                if (ds.Tables[0].Rows[0]["Password"].ToString() != "")
                {
                    model.Password = ds.Tables[0].Rows[0]["Password"].ToString();
                }
                if (ds.Tables[0].Rows[0]["RealName"].ToString() != "")
                {
                    model.RealName = ds.Tables[0].Rows[0]["RealName"].ToString();
                }
                if (ds.Tables[0].Rows[0]["CreateTime"].ToString() != "")
                {
                    model.CreateTime = DateTime.Parse(ds.Tables[0].Rows[0]["CreateTime"].ToString());
                }
                if (ds.Tables[0].Rows[0]["IsActive"].ToString() != "")
                {
                    if ((ds.Tables[0].Rows[0]["IsActive"].ToString() == "1") || (ds.Tables[0].Rows[0]["IsActive"].ToString().ToLower() == "true"))
                    {
                        model.IsActive = true;
                    }
                    else
                    {
                        model.IsActive = false;
                    }
                }
                if (ds.Tables[0].Rows[0]["Email"].ToString() != "")
                {
                    model.Email = ds.Tables[0].Rows[0]["Email"].ToString();
                }
                if (ds.Tables[0].Rows[0]["Mobile"].ToString() != "")
                {
                    model.Mobile = ds.Tables[0].Rows[0]["Mobile"].ToString();
                }
                if (ds.Tables[0].Rows[0]["Type"].ToString() != "")
                {
                    model.Type = int.Parse(ds.Tables[0].Rows[0]["Type"].ToString());
                }
                if (ds.Tables[0].Rows[0]["LoanTypePermission"].ToString() != "")
                {
                    model.LoanTypePermission = ds.Tables[0].Rows[0]["LoanTypePermission"].ToString();
                }
                #endregion
                return model;
            }
            return null;
        }

        /// <summary>
        /// 检测用户名是否存在 true为不存在
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public bool UserNameExists(string userName)
        {
            var strSql = new StringBuilder();
            SqlParameter[] parameters =
                {
                    new SqlParameter("@LoginName", SqlDbType.VarChar) {Value = userName}
                };
            strSql.Append("select count(1) from [User] where [LoginName]=@LoginName");
            int result = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocal, CommandType.Text, strSql.ToString(), parameters));
            return result <= 0;
        }


    }
}
