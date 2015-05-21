using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Common
{
    public class ConvertHelper
    {
        /// <summary>
        /// 转换成整数
        /// </summary>
        public static int ToInt(string str)
        {
            int i = 0;
            return int.TryParse(str, out i) ? i : 0;
        }

        /// <summary>
        /// 转换成Bool值
        /// </summary>
        public static bool ToBool(string str)
        {
            bool i = false;
            Boolean.TryParse(str, out i);
            return i;
        }

        /// <summary>
        /// 转换成时间
        /// </summary>
        public static DateTime ToDateTime(string str)
        {
            DateTime dt = DateTime.Now;
            if (string.IsNullOrEmpty(str))
                return dt;
            DateTime.TryParse(str, out dt);
            return dt;
        }

        /// <summary>
        /// 转换成数字
        /// </summary>
        public static Decimal ToDecimal(string str)
        {
            Decimal d = 0;
            if (string.IsNullOrEmpty(str))
                return d;
            Decimal.TryParse(str, out d);
            return d;
        }

        /// <summary>
        /// 接收查询参数，返回字符串值
        /// </summary>
        public static string QueryString(HttpRequest request, string param, string defaultValue)
        {
            if (request.Params[param] != null && !string.IsNullOrEmpty(request.Params[param]))
            {
                return request.Params[param].Trim();
            }
            return defaultValue;
        }

        /// <summary>
        /// 接收查询参数，返回整型值
        /// </summary>
        public static int QueryString(HttpRequest request, string param, int defValue)
        {
            if (request.Params[param] != null && !string.IsNullOrEmpty(request.Params[param]))
            {
                return ToInt(request.Params[param].Trim());
            }
            return defValue;
        }

        /// <summary>
        /// 根据身份证号码获取性别
        /// </summary>
        /// <param name="IDNum"></param>
        /// <returns></returns>
        public static char getSexByIDCard(string IDNum)
        {
            if (IDNum.Length == 15 && (Int32.Parse(IDNum.Substring(14, 1)) / 2) * 2 == Int32.Parse(IDNum.Substring(14, 1)))
            {
                return '女';
            }
            else if (IDNum.Length == 18 && (Int32.Parse(IDNum.Substring(16, 1)) / 2) * 2 == Int32.Parse(IDNum.Substring(16, 1)))
            {
                return '女';
            }
            else
            {
                return '男';
            }
        }
        /// <summary>
        /// 根据身份证号码获取生日
        /// </summary>
        /// <param name="IDNum"></param>
        /// <returns></returns>
        public static DateTime getBirthdayByIDCard(string IDNum)
        {
            if (string.IsNullOrEmpty(IDNum))
            {
                return ToDateTime("1970-01-01");
            }
            string tmpStr = "";
            if (IDNum.Length == 15)
            {
                tmpStr = IDNum.Substring(6, 6);
                tmpStr = "19" + tmpStr;
            }
            else
            {
                tmpStr = IDNum.Substring(6, 8);
            }
            return new DateTime(Int32.Parse(tmpStr.Substring(0, 4)), Int32.Parse(tmpStr.Substring(4, 2)), Int32.Parse(tmpStr.Substring(6)));
        }
    }
}
