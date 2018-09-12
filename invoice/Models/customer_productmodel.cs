using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace invoice.Models
{
    public class customer_productmodel
    {
        public string customername { get; set; }
        public string product { get; set; }
        public int quantity { get; set; }
        public DateTime date { get; set; }
    }
}