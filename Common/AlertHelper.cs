using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    public class AlertHelper
    {
        public static object SuccessMessage(string msg = "添加成功")
        {
            return new { result = "success", message = msg };
        }
        public static object WarningMessage(string msg)
        {
            return new { result = "warning", message = msg };
        }
        public static object ErrorMessage(string msg = "添加失败")
        {
            return new { result = "danger", message = msg };
        }
    }
}
