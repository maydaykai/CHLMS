using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common;
using Conn;

namespace DAL
{
    public class BaseClass
    {
        /// <summary>
        /// 根据条件返回datatable
        /// </summary>
        /// <param name="Fields">返回字段</param>
        /// <param name="Tables">表名</param>
        /// <param name="Where">查询条件</param>
        /// <param name="OrderBy">排序</param>
        /// <param name="PageIndex">当前页码</param>
        /// <param name="PageSize">每页行数</param>
        /// <param name="TotalRows">总行数</param>
        /// <returns></returns>
        public DataTable GetPageDataTable(string Fields, string Tables, string Where, string OrderBy, int PageIndex, int PageSize, ref int TotalRows)
        {
            string sql1 = "SELECT COUNT(*) FROM " + Tables;
            if (!string.IsNullOrEmpty(Where))
            {
                sql1 = sql1 + " WHERE " + Where;
            }
            object obj = SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocal, CommandType.Text, sql1);
            TotalRows = obj != null ? ConvertHelper.ToInt(obj.ToString()) : 0;
            if (TotalRows > 0)
            {
                string sql2 = "SELECT (ROW_NUMBER() OVER(ORDER BY " + OrderBy + ")) AS rownum, " + Fields + " FROM " + Tables;
                if (!string.IsNullOrEmpty(Where))
                {
                    sql2 = sql2 + " WHERE " + Where;
                }
                sql2 = "SELECT * FROM (" + sql2 + ") tmp WHERE rownum BETWEEN " + ((PageIndex - 1) * PageSize + 1) + " AND " + PageIndex * PageSize;
                DataSet ds = SqlHelper.ExecuteDataSet(SqlHelper.ConnectionStringLocal, CommandType.Text, sql2);
                return ds != null ? ds.Tables[0] : null;
            }
            return null;
        }
    }
}
