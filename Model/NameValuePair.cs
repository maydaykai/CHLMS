using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    [DataContract]
    public class NameValuePair<TName, TValue>
    {
        [DataMember(Name = "name")]
        public TName Name { get; set; }

        [DataMember(Name = "value")]
        public TValue Value { get; set; }

        public NameValuePair(TName name, TValue value)
        {
            Name = name;
            Value = value;
        }

        public NameValuePair() { }
    }
}
