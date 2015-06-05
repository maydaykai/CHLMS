using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class DataTablesModel
    {
        public int sEcho { get; set; }
        public string iColumns { get; set; }
        public string sColumns { get; set; }
        public int iDisplayStart { get; set; }
        public int iDisplayLength { get; set; }
        public string sSearch { get; set; }
    }
}
