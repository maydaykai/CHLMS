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
        /// 借款标状态 1,借款成功；2，还款完成；
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
        public DateTime LoanTime
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
    }
}

