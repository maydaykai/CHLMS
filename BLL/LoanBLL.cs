using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Model;

namespace BLL
{
    public class LoanBLL
    {
        private LoanDAL _dal = new LoanDAL();
        /// <summary>
        /// 获取借款列表
        /// </summary>
        /// <param name="orderBy"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="totalRows"></param>
        /// <returns></returns>
        public DataTable GetPageLoanList(string orderBy, int pageIndex, int pageSize, ref int totalRows)
        {
            string where = "";
            return new BaseClass().GetPageDataTable("L.ID,L.LoanNumber,T.Name LoanTypeName,L.LoanAmount,L.LoanRate,L.LoanTerm,M.Name RepaymentMethodName,CASE L.Status WHEN 1 THEN '借款成功' WHEN 2 THEN '还款成功' END StatusStr,L.LoanTime", "dbo.[Loan] L LEFT JOIN dbo.DimLoanType T ON L.LoanTypeID=T.ID LEFT JOIN dbo.DimRepaymentMethod M ON L.RepaymentMethod=M.ID", where, orderBy, pageIndex, pageSize, ref totalRows);
        }
        /// <summary>
        /// 获取标种类型列表
        /// </summary>
        /// <returns></returns>
        public DataTable GetLoanTypeList()
        {
            int totalRows = 0;
            return new BaseClass().GetPageDataTable("*", "dbo.[DimLoanType]", "", "ID", 1, 100, ref totalRows);
        }
        /// <summary>
        /// 添加借款并生成还款计划
        /// </summary>
        public bool AddLoan(LoanModel model)
        {
            return _dal.AddLoan(model);
        }
    }
}
