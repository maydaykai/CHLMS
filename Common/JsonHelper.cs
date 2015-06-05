using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Runtime.Serialization.Json;
using Model;
using Newtonsoft.Json;

namespace Common
{
    public class JsonHelper
    {
        /// <summary>
        /// datatables 返回数据组装
        /// </summary>
        /// <param name="sEcho"></param>
        /// <param name="totalRow"></param>
        /// <param name="dt"></param>
        /// <returns></returns>
        public static string SerializeDataTablesData(int sEcho, int totalRow, DataTable dt)
        {
            StringBuilder json = new StringBuilder();
            json.Append("{\"sEcho\":" + sEcho.ToString() + ",");
            json.Append("\"iTotalRecords\":" + totalRow.ToString() + ",");
            json.Append("\"iTotalDisplayRecords\":" + totalRow.ToString() + ",");
            json.Append("\"aaData\":[");
            //json.AppendFormat("{\"sEcho\":{0},\n \"iTotalRecords\":{1},\n \"iTotalDisplayRecords\": {2},\n \"aaData\":[", sEcho, totalRow, totalRow);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                json.Append("{");
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    json.Append("\"");
                    json.Append(dt.Columns[j].ColumnName);
                    json.Append("\":\"");
                    json.Append(dt.Rows[i][j].ToString());
                    json.Append("\",");
                }
                json.Remove(json.Length - 1, 1);
                json.Append("},");
            }
            json.Remove(json.Length - 1, 1);
            json.Append("]}");

            return json.ToString();
        }
        /// <summary>
        /// JSON反序列化
        /// </summary>
        public static DataTablesModel JsonDeserialize(string jsondatas)
        {
            List<NameValuePair<string, string>> list = JsonConvert.DeserializeObject<List<NameValuePair<string, string>>>(jsondatas);
            DataTablesModel model = new DataTablesModel();
            PropertyInfo[] properties = model.GetType().GetProperties(BindingFlags.Instance | BindingFlags.Public);
            foreach (NameValuePair<string, string> info in list)
            {
                foreach (PropertyInfo item in properties)
                {
                    if (info.Name.Equals(item.Name))
                        item.SetValue(model, Convert.ChangeType(info.Value, item.PropertyType), null);
                }
            }
            return model;
        }
    }
}
