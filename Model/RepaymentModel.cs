using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class RepaymentModel
    {

        /// <summary>
        /// ID
        /// </summary>
        public int ID { get; set; }

        /// <summary>
        /// 初始本金
        /// </summary>
        public decimal SumPrincipal { get; set; }

        /// <summary>
        /// 本金
        /// </summary>
        public decimal Principal { get; set; }

        /// <summary>
        /// 当前利息
        /// </summary>
        public decimal CurrInterest
        {
            get;
            set;
        }
        /// <summary>
        /// 还款日期
        /// </summary>
        public DateTime RepaymentTime
        {
            get;
            set;
        }

        public int PeNumber { get; set; }

        /// <summary>
        /// 还款方式
        /// </summary>
        public int Repayment
        {
            get;
            set;
        }


        /// <summary>
        /// 状态
        /// </summary>
        public int status
        {
            get;
            set;
        }

    }
}
