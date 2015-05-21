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
        /// <summary>
        /// 添加借款并生成还款计划
        /// </summary>
        public bool AddLoan(LoanModel model)
        {
            SqlParameter[] parameters = {
			            new SqlParameter("@LoanDate", SqlDbType.DateTime){Value= model.LoanTime},
                        new SqlParameter("@UserID", SqlDbType.Int,4){Value= model.UserID},
                        new SqlParameter("@LoanAmount", SqlDbType.Decimal,9){Value= model.LoanAmount},
                        new SqlParameter("@LoanRate", SqlDbType.Decimal,9){Value= model.LoanRate},
                        new SqlParameter("@LoanTerm", SqlDbType.Int,4){Value= model.LoanTerm},
                        new SqlParameter("@RepaymentMethod", SqlDbType.Int,4){Value= model.RepaymentMethod},
                        new SqlParameter("@LoanTypeID", SqlDbType.Int,4){Value= model.LoanTypeID},
                        new SqlParameter("@LoanCustomerID", SqlDbType.Int,4){Value= model.LoanCustomerID},
                        new SqlParameter("@ret",SqlDbType.Int,4){Direction = ParameterDirection.ReturnValue} //定义返回值参数
                        };
            SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocal, CommandType.StoredProcedure, "[dbo].[Proc_AddLoan]", parameters);
            int num = Convert.ToInt32(parameters[8].Value);
            return num > 0;
        }
    }
}
