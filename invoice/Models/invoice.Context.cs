﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace invoice.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class InvoiceEntities1 : DbContext
    {
        public InvoiceEntities1()
            : base("name=InvoiceEntities1")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<tblcustomer> tblcustomers { get; set; }
        public DbSet<tblproduct> tblproducts { get; set; }
        public DbSet<customerproduct> customerproducts { get; set; }
    }
}
