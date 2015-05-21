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
    public class LoanBLL
    {
        private LoanDAL _dal = new LoanDAL();
        #region 借款数据
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
        /// 添加借款并生成还款计划
        /// </summary>
        public bool AddLoan(LoanModel model)
        {
            return _dal.AddLoan(model);
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public LoanModel GetLoanModel(int id)
        {
            return _dal.GetLoanModel("ID=" + id);
        }

        #endregion
        #region 标种类型
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
        /// 添加标种类型
        /// </summary>
        public int AddLoanType(string name)
        {
            return _dal.AddLoanType(name);
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public DimLoanTypeModel GetLoanTypeModel(int id)
        {
            return _dal.GetLoanTypeModel("ID=" + id);
        }

        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool UpdateLoanType(DimLoanTypeModel model)
        {
            return _dal.UpdateLoanType(model);
        }
        #endregion
        #region 还款
        public DataTable GetRepayListByID(int loanID)
        {
            int totalRows = 0;
            string where = "LoanID=" + loanID;
            return new BaseClass().GetPageDataTable("*", "dbo.[RepaymentPlan]", where, "ID", 1, 100, ref totalRows);
        }
        /// <summary>
        /// 还款
        /// </summary>
        public bool RepayLoanByID(int repayID)
        {
            return _dal.RepayLoanByID(repayID);
        }
        #endregion
    }
}
