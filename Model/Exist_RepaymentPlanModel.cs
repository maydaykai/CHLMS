using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    /// <summary>
    /// 查询是否按照还款计划
    /// </summary>
    public class Exist_RepaymentPlanModel
    {
        /// <summary>
        /// 是否按照还款计划
        /// </summary>
        public bool IfOnPlan { get; set; }

        /// <summary>
        /// 最后一次还款时间
        /// </summary>
        public DateTime lasttime { get; set; }

        /// <summary>
        /// 当天的还款次数
        /// </summary>
        public int planCount { get; set; }

        /// <summary>
        /// 是否按照还款计划成立的条件下 判断是否按照还款计划
        /// </summary>
        public int TotalPan { get; set; }

        public string lasttimeStr
        {
            get { return lasttime.ToString("yyyy-MM-dd hh:mm:ss"); }
        }
    }
}
