using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class RepaymentRecordModel
    {
        public int ID
        {
            set;
            get;
        }
        /// <summary>
        /// 还款时间
        /// </summary>
        public DateTime? RepayDate
        {
            set;
            get;
        }
        /// <summary>
        /// 还款本金
        /// </summary>
        public decimal? Principal
        {
            set;
            get;
        }
        /// <summary>
        /// 还款利息
        /// </summary>
        public decimal? Interest
        {
            set;
            get;
        }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime? CreateTime
        {
            set;
            get;
        }
        /// <summary>
        /// 创建人ID
        /// </summary>
        public int? CreateUserID
        {
            set;
            get;
        }
        /// <summary>
        /// 借款表ID
        /// </summary>
        public int? LoanID
        {
            set;
            get;
        }
        //按天还是按月
        public int BorrowMod { get; set; }
        /// <summary>
        /// 还款方式
        /// </summary>
        public int RepaymentRecord { get; set; }


        public string BorrowModeStr
        {

            get
            {
                if (BorrowMod == 0)
                {
                    return "按天";
                }
                else
                    return "按月";

            }
        }

        public string RepaymentRecordStr
        {

            get
            {
                string relust = string.Empty;
                switch (RepaymentRecord)
                {
                    case 1: relust = "按月付息到期还本"; break;
                    case 2: relust = "按月平息"; break;


                }
                return relust;
            }
        }
    }
}
