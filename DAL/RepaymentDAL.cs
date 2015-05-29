using Conn;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    /// <summary>
    /// 还款临时计划表
    /// </summary>
    public class RepaymentDAL
    {


        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(RepaymentModel model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into RepaymentInfoTemp(");
            strSql.Append("SumPrincipal,Principal,CurrInterest,RepaymentTime,status,Repayment)");
            strSql.Append(" values (");
            strSql.Append("@SumPrincipal,@Principal,@CurrInterest,@RepaymentTime,@status,@Repayment)");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
					new SqlParameter("@SumPrincipal", SqlDbType.Decimal,9),
					new SqlParameter("@Principal", SqlDbType.Decimal,9),
					new SqlParameter("@CurrInterest", SqlDbType.Decimal,9),
					new SqlParameter("@RepaymentTime", SqlDbType.DateTime),
					new SqlParameter("@status", SqlDbType.Int,4),
					new SqlParameter("@Repayment", SqlDbType.Int,4)};
            parameters[0].Value = model.SumPrincipal;
            parameters[1].Value = model.Principal;
            parameters[2].Value = model.CurrInterest;
            parameters[3].Value = model.RepaymentTime;
            parameters[4].Value = model.status;
            parameters[5].Value = model.Repayment;
            object obj = SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocal, CommandType.Text, strSql.ToString(), parameters);
            if (obj == null)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(obj);
            }
        }


        /// <summary>
        /// 删除一条数据
        /// </summary>
        public bool Delete(int Id)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from RepaymentInfoTemp ");
            strSql.Append(" where Id=@Id");
            SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
            parameters[0].Value = Id;

            int rows = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocal, CommandType.Text, strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        /// <summary>
        /// 返回信息
        /// </summary>
        /// <param name="loandID"></param>
        /// <returns></returns>
        public DataSet GetTableArray(int loandID)
        {

            DataSet ds = SqlHelper.ExecuteDataSet(SqlHelper.ConnectionStringLocal, CommandType.StoredProcedure, "Proc_AddRepaymentInfo");
            return ds;
        }
        //入库



    }

}
