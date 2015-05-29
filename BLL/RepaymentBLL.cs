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
    public class RepaymentBLL
    {
        private RepaymentDAL _dal = new RepaymentDAL();
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
            //  string where = "";
            string files = "Id,SumPrincipal,Principal,CurrInterest,RepaymentTime,status,Repayment";
            return new BaseClass().GetPageDataTable(files, "dbo.RepaymentInfoTemp", where, orderBy, pageIndex, pageSize, ref totalRows);
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
            string files = " a.ID,LoanNumber,UserID,PeNumber,RePrincipal,ReInterest,DATEDIFF(dd,DATEADD(MONTH,b.LoanTerm,LoanDate),GETDATE()) as ExpireDays,a.Status,DATEADD(MONTH,b.LoanTerm,LoanDate)";
            string table = "RepaymentPlan  a INNER  JOIN  Loan b  ON a.LoanID=b.ID";
            return new BaseClass().GetPageDataTable(files, table, where, orderBy, pageIndex, pageSize, ref totalRows);
        }

        public bool Delete(int Id)
        {
            return _dal.Delete(Id);
        }
        //添加信息

        public int AddRepayment(RepaymentModel model)
        {
            return _dal.Add(model);
        }
        //查询信息
        public DataSet GetTableArray(int loandID)
        {
            return _dal.GetTableArray(loandID);
        }
        //入库操作

        /// <summary>
        /// 计算天数
        /// </summary>
        /// <param name="type">0:按天 1:按月</param>
        /// <param name="statime">开始时间</param>
        /// <param name="endtime">结束时间</param>
        /// <returns></returns>
        public int ReturnDay(int type, DateTime statime, DateTime endtime)
        {
            int days = 0;
            switch (type)
            {
                case 0:
                    //注意月份
                    days = (endtime - statime).Days;
                    break;
                case 1: 
                    //按每月30天计算 唯一判断是否跨过2月份


                    break;

            }

            return days;
        }

        //保存xml信息到数据库

        public string RepaymentCompleteToXML(int loandID)
        {
            //
            StringBuilder repxml = new StringBuilder();
            DataSet ds = GetTableArray(loandID);
            //得到数据集合
            DataTable table_loanInfo = ds.Tables[0];//还款方式
            DataTable table_RepaymentInfoTempSum = ds.Tables[1];//当前需要生成的还款计划
            DataTable table_RepaymentInfoTemp = ds.Tables[2];//已经还款的利息金额
            DataTable table_RepaymentInfo = ds.Tables[3];//已经生成还款计划的数据
            decimal currpostRate = 0;//当期剩余利息
            if (table_loanInfo != null && table_loanInfo.Rows.Count > 0)
            {
                repxml.Append("<RepaymentInfoTemp>");

                //得到当前信息还款方式 利率 开始时间 期限 
                foreach (DataRow item in table_loanInfo.Rows)
                {
                    //本金 利率  开始时间 结束时间 当前还款日期 已还多少利息
                    //; item["LoanRate"].ToString(); item["LoanDate"].ToString();
                    string Principal = Convert.ToDecimal(item["Principal"].ToString()).ToString("F2");//每次还款金额
                    string LoanRate = item["LoanRate"].ToString();//利率
                    string EnterInterest = item["LoanRate"].ToString();//当前输入利息
                    DateTime starttime = Convert.ToDateTime(item["LoanDate"].ToString());//开始还款时间
                    DateTime currtime = Convert.ToDateTime(item["RepaymentTime"].ToString());// 指定还款时间
                    DateTime endtime = starttime.AddMonths(Convert.ToInt32(item["LoanTerm"].ToString()));// 此项目还款结束时间
                    int days = ReturnDay(Convert.ToInt32(item["BorrowMode"].ToString()), starttime, currtime);//天数
                    int CalculateDays = days;//本期计算利息的天数
                    //当前每天的利息是 (本金-已经还款的金额)*LoanRate天*days
                    decimal CurrRate = 12;
                    //当前还款本金 和金额  
                    //输入的利息是否满足当前天数*利率  =》当期剩余利息
                    currpostRate = currpostRate + 0;

                    repxml.Append("<li SumPrincipal=\"2\"  Principal=\"2\">");
                    repxml.Append("</li>");
                }
                repxml.Append("</RepaymentInfoTemp>");

            }
            //将返回的xml数据插入到数据库

            return repxml.ToString();
        }
    }
}
