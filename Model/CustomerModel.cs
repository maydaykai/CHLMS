using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    //客户表
    public class CustomerModel
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
        /// 用户名
        /// </summary>
        public string Name
        {
            get;
            set;
        }
        /// <summary>
        /// 真实姓名
        /// </summary>
        public string RealName
        {
            get;
            set;
        }
        /// <summary>
        /// 手机号码
        /// </summary>
        public string Mobile
        {
            get;
            set;
        }
        /// <summary>
        /// 身份证号码
        /// </summary>
        public string Identity
        {
            get;
            set;
        }
        /// <summary>
        /// 地址
        /// </summary>
        public string Address
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
        /// 创建人ID
        /// </summary>
        public int CreateUserID
        {
            get;
            set;
        }

    }
}
