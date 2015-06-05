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
    public class RepaymentRecordDAL
    {
        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(RepaymentRecordModel model)
        {
            //StringBuilder strSql = new StringBuilder();
            //strSql.Append("insert into RepaymentRecord(");
            //strSql.Append("RepayDate,Principal,Interest,CreateTime,CreateUserID,LoanID)");
            //strSql.Append(" values (");
            //strSql.Append("@RepayDate,@Principal,@Interest,@CreateTime,@CreateUserID,@LoanID)");
            //strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
					new SqlParameter("@RepayDate", SqlDbType.DateTime),
					new SqlParameter("@Principal", SqlDbType.Decimal,9),
					new SqlParameter("@Interest", SqlDbType.Decimal,9),
					new SqlParameter("@CreateTime", SqlDbType.DateTime),
					new SqlParameter("@CreateUserID", SqlDbType.Int,4),
					new SqlParameter("@LoanID", SqlDbType.Int,4)};
            parameters[0].Value = model.RepayDate;
            parameters[1].Value = model.Principal;
            parameters[2].Value = model.Interest;
            parameters[3].Value = model.CreateTime;
            parameters[4].Value = model.CreateUserID;
            parameters[5].Value = model.LoanID;

            object obj = SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocal, CommandType.StoredProcedure, "Proc_RepaymentRecordAdd", parameters);
            return obj == null ? 0 : Convert.ToInt32(obj);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public bool Delete(int ID)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from RepaymentRecord ");
            strSql.Append(" where ID=@ID");
            SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
            parameters[0].Value = ID;

            int rows = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocal, CommandType.Text, strSql.ToString(), parameters);
            return rows > 0;
        }



        /// <summary>
        /// 查询是否按照还款计划还款
        /// </summary>
        /// <param name="LoadId"></param>
        /// <param name="endTime"></param>
        /// <returns></returns>
        public DataSet GetCurrRepaymentPlanInfo(int LoadId, DateTime endTime)
        {
            SqlParameter[] parameters = {
			            new SqlParameter("@LoadId", SqlDbType.Int,4){Value= LoadId},
                        new SqlParameter("@endTime", SqlDbType.DateTime){Value= endTime},
                        };
            DataSet ds = SqlHelper.ExecuteDataSet(SqlHelper.ConnectionStringLocal, CommandType.StoredProcedure, "Exist_RepaymentPlan", parameters);
            return ds;
        }

        /// <summary>
        /// 查询已还款数据
        /// </summary>
        /// <param name="loadId"></param>
        /// <returns></returns>
        public DataTable GetCompleteRepaymentInfo(int loadId)
        {
            const string sql = "SELECT SUM(Principal) SurPrincipal,SUM(Interest) SurInterest,(SELECT SUM((DATEDIFF(day,BeginDate,EndDate)+1) * Interest) FROM dbo.RepaymentComplete WHERE LoanID=@LoadId AND [Status]=1) ReInterest FROM dbo.RepaymentRecord WHERE LoanID=@LoadId";
            SqlParameter[] parameters = {
			            new SqlParameter("@LoadId", SqlDbType.Int,4){Value= loadId}
                        };
            DataSet ds = SqlHelper.ExecuteDataSet(SqlHelper.ConnectionStringLocal, CommandType.Text, sql, parameters);
            return ds != null ? ds.Tables[0] : null;
        }
    }
}
