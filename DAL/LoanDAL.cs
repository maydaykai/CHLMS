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
    public class LoanDAL
    {
        #region 借款数据
        /// <summary>
        /// 确认借款并生成还款计划
        /// </summary>
        public bool BuildPlan(LoanModel model)
        {
            SqlParameter[] parameters = {
			            new SqlParameter("@LoanDate", SqlDbType.Date){Value= model.LoanDate},
                        new SqlParameter("@LoanID", SqlDbType.Int,4){Value= model.ID},
                        new SqlParameter("@LoanAmount", SqlDbType.Decimal,9){Value= model.LoanAmount},
                        new SqlParameter("@LoanRate", SqlDbType.Decimal,9){Value= model.LoanRate},
                        new SqlParameter("@LoanTerm", SqlDbType.Int,4){Value= model.LoanTerm},
                        new SqlParameter("@RepaymentMethod", SqlDbType.Int,4){Value= model.RepaymentMethod},
                        new SqlParameter("@BorrowMode", SqlDbType.SmallInt){Value= model.BorrowMode},
                        new SqlParameter("@CalculateHead", SqlDbType.SmallInt){Value= model.CalculateHead},
                        new SqlParameter("@LoanTypeID", SqlDbType.Int,4){Value= model.LoanTypeID},
                        new SqlParameter("@LoanCustomerID", SqlDbType.Int,4){Value= model.LoanCustomerID},
                        new SqlParameter("@ret",SqlDbType.Int,4){Direction = ParameterDirection.ReturnValue} //定义返回值参数
                        };
            SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocal, CommandType.StoredProcedure, "[dbo].[Proc_AddLoan]", parameters);
            int num = Convert.ToInt32(parameters[10].Value);
            return num > 0;
        }
        /// <summary>
        /// 添加借款等待确认
        /// </summary>
        public bool AddLoan(LoanModel model)
        {
            const string sql = "INSERT INTO dbo.Loan ( LoanCustomerID, LoanNumber, LoanAmount, LoanRate, LoanTerm, RepaymentMethod, BorrowMode,  CalculateHead, LoanTypeID, [Status], UserID, CreateTime, LoanDate) VALUES (@LoanCustomerID, dbo.GetLoanNumber(@LoanDate), @LoanAmount, @LoanRate, @LoanTerm, @RepaymentMethod, @BorrowMode, @CalculateHead, @LoanTypeID, 1, @UserID, GETDATE(), @LoanDate);SELECT @@IDENTITY;";
            SqlParameter[] parameters = {
			            new SqlParameter("@LoanDate", SqlDbType.Date){Value= model.LoanDate},
                        new SqlParameter("@UserID", SqlDbType.Int,4){Value= model.UserID},
                        new SqlParameter("@LoanAmount", SqlDbType.Decimal,9){Value= model.LoanAmount},
                        new SqlParameter("@LoanRate", SqlDbType.Decimal,9){Value= model.LoanRate},
                        new SqlParameter("@LoanTerm", SqlDbType.Int,4){Value= model.LoanTerm},
                        new SqlParameter("@RepaymentMethod", SqlDbType.Int,4){Value= model.RepaymentMethod},
                        new SqlParameter("@BorrowMode", SqlDbType.SmallInt){Value= model.BorrowMode},
                        new SqlParameter("@CalculateHead", SqlDbType.SmallInt){Value= model.CalculateHead},
                        new SqlParameter("@LoanTypeID", SqlDbType.Int,4){Value= model.LoanTypeID},
                        new SqlParameter("@LoanCustomerID", SqlDbType.Int,4){Value= model.LoanCustomerID}
                        };
            object obj = SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocal, CommandType.Text, sql, parameters);
            return obj != null && Convert.ToInt32(obj) > 0;
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public LoanModel GetLoanModel(string strWhere)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("select top 1 ID, Status, CreateTime, LoanDate, UserID, CalculateHead, IfOnPlan, LoanCustomerID, LoanNumber, LoanAmount, LoanRate, LoanTerm, BorrowMode, RepaymentMethod, LoanTypeID  ");
            strSql.Append(" from Loan ");
            if (!string.IsNullOrEmpty(strWhere))
            {
                strSql.Append(" where " + strWhere);
            }

            LoanModel model = new LoanModel();
            DataSet ds = SqlHelper.ExecuteDataSet(SqlHelper.ConnectionStringLocal, CommandType.Text, strSql.ToString());

            if (ds.Tables[0].Rows.Count > 0)
            {
                #region 给对象赋值
                if (ds.Tables[0].Rows[0]["ID"].ToString() != "")
                {
                    model.ID = int.Parse(ds.Tables[0].Rows[0]["ID"].ToString());
                }
                if (ds.Tables[0].Rows[0]["Status"].ToString() != "")
                {
                    model.Status = int.Parse(ds.Tables[0].Rows[0]["Status"].ToString());
                }
                if (ds.Tables[0].Rows[0]["CreateTime"].ToString() != "")
                {
                    model.CreateTime = DateTime.Parse(ds.Tables[0].Rows[0]["CreateTime"].ToString());
                }
                if (ds.Tables[0].Rows[0]["LoanDate"].ToString() != "")
                {
                    model.LoanDate = DateTime.Parse(ds.Tables[0].Rows[0]["LoanDate"].ToString());
                }
                if (ds.Tables[0].Rows[0]["UserID"].ToString() != "")
                {
                    model.UserID = int.Parse(ds.Tables[0].Rows[0]["UserID"].ToString());
                }
                if (ds.Tables[0].Rows[0]["CalculateHead"].ToString() != "")
                {
                    model.CalculateHead = int.Parse(ds.Tables[0].Rows[0]["CalculateHead"].ToString());
                }
                if (ds.Tables[0].Rows[0]["IfOnPlan"].ToString() != "")
                {
                    if ((ds.Tables[0].Rows[0]["IfOnPlan"].ToString() == "1") || (ds.Tables[0].Rows[0]["IfOnPlan"].ToString().ToLower() == "true"))
                    {
                        model.IfOnPlan = true;
                    }
                    else
                    {
                        model.IfOnPlan = false;
                    }
                }
                if (ds.Tables[0].Rows[0]["LoanCustomerID"].ToString() != "")
                {
                    model.LoanCustomerID = int.Parse(ds.Tables[0].Rows[0]["LoanCustomerID"].ToString());
                }
                if (ds.Tables[0].Rows[0]["LoanNumber"].ToString() != "")
                {
                    model.LoanNumber = ds.Tables[0].Rows[0]["LoanNumber"].ToString();
                }
                if (ds.Tables[0].Rows[0]["LoanAmount"].ToString() != "")
                {
                    model.LoanAmount = decimal.Parse(ds.Tables[0].Rows[0]["LoanAmount"].ToString());
                }
                if (ds.Tables[0].Rows[0]["LoanRate"].ToString() != "")
                {
                    model.LoanRate = decimal.Parse(ds.Tables[0].Rows[0]["LoanRate"].ToString());
                }
                if (ds.Tables[0].Rows[0]["LoanTerm"].ToString() != "")
                {
                    model.LoanTerm = int.Parse(ds.Tables[0].Rows[0]["LoanTerm"].ToString());
                }
                if (ds.Tables[0].Rows[0]["BorrowMode"].ToString() != "")
                {
                    model.BorrowMode = int.Parse(ds.Tables[0].Rows[0]["BorrowMode"].ToString());
                }
                if (ds.Tables[0].Rows[0]["RepaymentMethod"].ToString() != "")
                {
                    model.RepaymentMethod = int.Parse(ds.Tables[0].Rows[0]["RepaymentMethod"].ToString());
                }
                if (ds.Tables[0].Rows[0]["LoanTypeID"].ToString() != "")
                {
                    model.LoanTypeID = int.Parse(ds.Tables[0].Rows[0]["LoanTypeID"].ToString());
                }
                #endregion
                return model;
            }
            return null;
        }
        #endregion
        #region 标种类型
        /// <summary>
        /// 添加标种类型
        /// </summary>
        public int AddLoanType(string name)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into DimLoanType(");
            strSql.Append("Name");
            strSql.Append(") values (");
            strSql.Append("@Name");
            strSql.Append(") ");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters =
                {
                    new SqlParameter("@Name", SqlDbType.NVarChar, 20) {Value = name},
                };
            object obj = SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocal, CommandType.Text, strSql.ToString(),
                                                 parameters);
            return obj == null ? 0 : Convert.ToInt32(obj);

        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public DimLoanTypeModel GetLoanTypeModel(string strWhere)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("select top 1 ID, Name  ");
            strSql.Append(" from DimLoanType ");
            if (!string.IsNullOrEmpty(strWhere))
            {
                strSql.Append(" where " + strWhere);
            }

            DimLoanTypeModel model = new DimLoanTypeModel();
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
                #endregion
                return model;
            }
            return null;
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool UpdateLoanType(DimLoanTypeModel model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update DimLoanType set ");

            strSql.Append(" Name = @Name  ");
            strSql.Append(" where ID=@ID ");

            SqlParameter[] parameters = {
			            new SqlParameter("@ID", SqlDbType.Int,4){Value= model.ID},
			            new SqlParameter("@Name", SqlDbType.NVarChar,20){Value= model.Name},
                        };

            int rows = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocal, CommandType.Text, strSql.ToString(), parameters);
            return rows > 0;
        }
        #endregion
        #region 还款
        /// <summary>
        /// 还款
        /// </summary>
        public bool RepayLoanByID(int repayID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update RepaymentPlan set ");
            strSql.Append(" Status = @Status ");
            strSql.Append(" where ID=@ID ");

            SqlParameter[] parameters = {
			            new SqlParameter("@ID", SqlDbType.Int,4){Value= repayID},
                        new SqlParameter("@Status", SqlDbType.SmallInt,2){Value= 1}
                        };

            int rows = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocal, CommandType.Text, strSql.ToString(), parameters);
            return rows > 0;
        }
        #endregion
    }
}
