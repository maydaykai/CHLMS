using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    //借款表
    public class LoanModel
    {

        /// <summary>
        /// ID
        /// </summary>
        public int ID
        {
            get;
            set;
        }
        /// <summary>
        /// 借款编号
        /// </summary>
        public string LoanNumber
        {
            get;
            set;
        }
        /// <summary>
        /// 借款人ID 关联客户表
        /// </summary>
        public int LoanCustomerID
        {
            get;
            set;
        }
        /// <summary>
        /// 借款金额
        /// </summary>
        public decimal LoanAmount
        {
            get;
            set;
        }
        /// <summary>
        /// 年利率
        /// </summary>
        public decimal LoanRate
        {
            get;
            set;
        }
        /// <summary>
        /// 借款期限(按月)
        /// </summary>
        public int LoanTerm
        {
            get;
            set;
        }
        /// <summary>
        /// 还款方式
        /// </summary>
        public int RepaymentMethod
        {
            get;
            set;
        }
        /// <summary>
        /// 标种类型
        /// </summary>
        public int LoanTypeID
        {
            get;
            set;
        }
        /// <summary>
        /// 借款标状态 1,申请成功(等待确认)；2，借款成功(还款中)；3，作废；4，还款成功；
        /// </summary>
        public int Status
        {
            get;
            set;
        }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime CreateTime
        {
            get;
            set;
        }
        /// <summary>
        /// 借款时间
        /// </summary>
        public DateTime LoanDate
        {
            get;
            set;
        }
        /// <summary>
        /// 经办人
        /// </summary>
        public int UserID
        {
            get;
            set;
        }

        public bool IfOnPlan { get; set; }

        public string EndTime
        {
            get
            {
                return LoanDate.AddMonths(LoanTerm).ToString("yyyy-MM-dd");

            }

        }
        public string critemToString
        {
            get
            {
                return LoanDate.ToString("yyyy-MM-dd");

            }

        }
        public string RepaymentMethodStr
        {

            get
            {
                string relust = string.Empty;
                switch (RepaymentMethod)
                {
                    case 1: relust = "按月付息到期还本"; break;
                    case 2: relust = "按月平息"; break;
                    case 3: relust = "按天计息按月还款"; break;
                    case 4: relust = "按月等额本息"; break;
                }
                return relust;
            }
        }
        /// <summary>
        /// 借款期限方式：0：按天借款 1：按月借款
        /// </summary>
        public int BorrowMode
        { get; set; }
        /// <summary>
        /// 0：算头不算尾；1：算头算尾
        /// </summary>
        public int CalculateHead
        { get; set; }
    }
}

