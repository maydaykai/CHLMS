using Common;
using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class RepaymentRecordBLL
    {
        private RepaymentRecordDAL _dal = new RepaymentRecordDAL();
        public int Add(RepaymentRecordModel model)
        {
            model.CreateTime = DateTime.Now;
            model.CreateUserID = (int)SessionHelper.Get("UserID");
            return _dal.Add(model);
        }
        /// <summary>
        /// 查询临时数据
        /// </summary>
        /// <param name="orderBy"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="totalRows"></param>
        /// <returns></returns>
        public DataTable GetPageRepaymentList(string orderBy, int pageIndex, int pageSize, ref int totalRows, string where)
        {
            //  string where = "";SELECT a.*,b.BorrowMode,b.RepaymentMethod FROM RepaymentRecord a INNER JOIN dbo.Loan b ON a.LoanID=b.ID
            string files = "a.*,b.BorrowMode,b.RepaymentMethod,u.RealName";
            //where = "a.LoanID=0";
            return new BaseClass().GetPageDataTable(files, "RepaymentRecord a INNER JOIN dbo.Loan b ON a.LoanID=b.ID INNER JOIN dbo.[User]  u ON u.ID=a.CreateUserID ", where, orderBy, pageIndex, pageSize, ref totalRows);
        }
        public bool Delete(int ID)
        {
            return _dal.Delete(ID);
        }

        /// <summary>
        /// 查询已经生成的还款计划
        /// </summary>
        /// <param name="orderBy"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="totalRows"></param>
        /// <param name="where"></param>
        /// <returns></returns>
        public DataTable GetRepaymentCompleteList(string orderBy, int pageIndex, int pageSize, ref int totalRows, string where)
        {
            string files = "*,DATEDIFF(dd,BeginDate,EndDate)+1 AS [Days]";
            return new BaseClass().GetPageDataTable(files, "RepaymentComplete", where, orderBy, pageIndex, pageSize, ref totalRows);
        }
        /// <summary>
        /// 查询即将到期还款列表
        /// </summary>
        /// <param name="orderBy"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="totalRows"></param>
        /// <param name="where"></param>
        /// <returns></returns>
        public DataTable GetPageRepaymentPlanList(string orderBy, int pageIndex, int pageSize, ref int totalRows, string where)
        {
            string files = " a.ID,LoanNumber,UserID,PeNumber,RePrincipal,ReInterest,DATEDIFF(dd,GETDATE(),DATEADD(MONTH,b.LoanTerm,LoanDate)) as ExpireDays,a.Status,DATEADD(MONTH,b.LoanTerm,LoanDate) AS ExprieTime";
            string table = "RepaymentPlan  a INNER  JOIN  Loan b  ON a.LoanID=b.ID";
            return new BaseClass().GetPageDataTable(files, table, where, orderBy, pageIndex, pageSize, ref totalRows);
        }

        public Exist_RepaymentPlanModel RepaymentPlanModel(int LoadId, DateTime endTime)
        {
            Exist_RepaymentPlanModel model = new Exist_RepaymentPlanModel();
            DataSet ds = _dal.GetCurrRepaymentPlanInfo(LoadId, endTime);
            if (ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
            {
                model.IfOnPlan = Convert.ToBoolean(ds.Tables[0].Rows[0][0]);
            }
            if (ds.Tables[1] != null && ds.Tables[1].Rows.Count > 0)
            {
                model.planCount = Convert.ToInt32(ds.Tables[1].Rows[0][0]);
            }
            if (ds.Tables[2] != null && ds.Tables[2].Rows.Count > 0)
            {
                model.lasttime = Convert.ToDateTime(ds.Tables[2].Rows[0][0]);
            }
            if (ds.Tables[3] != null && ds.Tables[3].Rows.Count > 0)
            {
                model.TotalPan = Convert.ToInt32(ds.Tables[3].Rows[0][0]);
            }
            return model;
        }

        /// <summary>
        /// 查询已还款数据
        /// </summary>
        /// <param name="loadId"></param>
        /// <returns></returns>
        public DataTable GetCompleteRepaymentInfo(int loadId)
        {
            return _dal.GetCompleteRepaymentInfo(loadId);
        }
    }
}
