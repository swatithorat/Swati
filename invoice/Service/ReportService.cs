using invoice.Models;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace invoice.Services
{
    public class ReportService
    {
        public void GenerateInvoiceReport(double Sum, List<tblcustomer> customer, List<tblproduct> reportModelList, HttpResponseBase response, HttpServerUtilityBase server)
        {

            if (reportModelList.Count() > 0)
            {
                string TodaysDate = DateTime.Now.ToString("dd MMM yyyy");
                LocalReport localReport = new LocalReport();

                localReport.ReportPath = server.MapPath("~/Reports/" + "invoice_report.rdlc");

                //Passing Parameters                
                localReport.SetParameters(new ReportParameter("TodaysDate", TodaysDate));
                localReport.SetParameters(new ReportParameter("Sum", Sum.ToString()));
                ReportDataSource CustomerDataSource = new ReportDataSource("Cutomer", customer);
                localReport.DataSources.Add(CustomerDataSource);

                localReport.Refresh();
                ReportDataSource reportDataSource = new ReportDataSource("DataSet1", reportModelList);
                localReport.DataSources.Add(reportDataSource);

                localReport.Refresh();
                
                string extensionString = "Pdf";
                string outputType = "Pdf";

                ReportExportHelper(localReport, outputType, "Invoice", true, extensionString, response);
            }

        }

        public void GenerateCustomerReport(HttpResponseBase response, HttpServerUtilityBase server)
        {
            using (var db = new InvoiceEntities1())
            {
                var reportModelList = db.tblcustomers.ToList();

                if (reportModelList.Count() > 0)
                {

                    LocalReport localReport = new LocalReport();

                    localReport.ReportPath = server.MapPath("~/Reports/" + "Customer.rdlc");

                    //Passing Parameters                

                    ReportDataSource reportDataSource = new ReportDataSource("customerds", reportModelList);
                    localReport.DataSources.Clear();
                    localReport.DataSources.Add(reportDataSource);

                    localReport.Refresh();

                    string extensionString = "Pdf";
                    string outputType = "Pdf";

                    ReportExportHelper(localReport, outputType, "Invoice", true, extensionString, response);
                }
            }
        }

        public static void ReportExportHelper(LocalReport localReport, string OutputType, string outPutFileName, bool isLandScap, string extension, HttpResponseBase Response)
        {
            string reportType = OutputType;
            string mimeType;
            string encoding;
            string fileNameExtension;

            //The DeviceInfo settings should be changed based on the reportType
            //http://msdn2.microsoft.com/en-us/library/ms155397.aspx

            string deviceInfo = "";
            if (isLandScap)
            {
                deviceInfo =
            "<DeviceInfo>" +
            "  <OutputFormat>PDF</OutputFormat>" +
            "  <PageWidth>8.5in</PageWidth>" +
            "  <PageHeight>8.5in</PageHeight>" +
            "  <MarginTop>0.2in</MarginTop>" +
            "  <MarginLeft>0.2in</MarginLeft>" +
            "  <MarginRight>0.2in</MarginRight>" +
            "  <MarginBottom>0.2in</MarginBottom>" +
            "</DeviceInfo>";
            }
            else
            {
                deviceInfo =
              "<DeviceInfo>" +
           "  <OutputFormat>PDF</OutputFormat>" +
           "  <PageWidth>8.5in</PageWidth>" +
           "  <PageHeight>8.5in</PageHeight>" +
           "  <MarginTop>0.2in</MarginTop>" +
           "  <MarginLeft>0.2in</MarginLeft>" +
           "  <MarginRight>0.2in</MarginRight>" +
           "  <MarginBottom>0.2in</MarginBottom>" +
           "</DeviceInfo>";
            }

            Warning[] warnings;
            string[] streams;
            byte[] renderedBytes;

            //Render the report
            renderedBytes = localReport.Render(
                reportType,
                deviceInfo,
                out mimeType,
                out encoding,
                out fileNameExtension,
                out streams,
                out warnings);

            Response.Clear();
            Response.ContentType = mimeType;
            Response.AddHeader("content-disposition", "attachment; filename=" + outPutFileName + "." + extension);
            Response.BinaryWrite(renderedBytes);
            Response.End();
        }
    }
}
