using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EatiT.com
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label12.Text = Request.QueryString["orderid"];
            Label12.Text = Label12.Text;
            findorderdate(Label12.Text);
            findaddress(Label12.Text);
            showgrid(Label12.Text);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            exportpdf();
        }
        private void exportpdf()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=OrderInvoice.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            Panel1.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }
        private void findorderdate(string Orderid)
        {
            SqlConnection con = new SqlConnection(strcon);
            String myquery = "SELECT * FROM orderdetails WHERE orderid='" + Orderid + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Label9.Text = ds.Tables[0].Rows[0]["datefororder"].ToString();
            }
            con.Close();
        }
        private void findaddress(string Orderid)
        {
            SqlConnection con = new SqlConnection(strcon);
            String myquery = "SELECT * FROM Orderaddress WHERE orderid='" + Orderid + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Label10.Text = ds.Tables[0].Rows[0]["address"].ToString();
                Label13.Text = ds.Tables[0].Rows[0]["fullname"].ToString();
                Label14.Text = ds.Tables[0].Rows[0]["mobilenumber"].ToString();
            }
            con.Close();
        }
        private void showgrid(string orderid)
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("sno");
            dt.Columns.Add("Itemid");
            dt.Columns.Add("Itemname");
            dt.Columns.Add("Quantity");
            dt.Columns.Add("Price");
            dt.Columns.Add("Totalprice");
            SqlConnection con = new SqlConnection(strcon);
            String myquery = "SELECT * FROM orderdetails WHERE orderid='" + orderid + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            int totalrows = ds.Tables[0].Rows.Count;
            int i = 0;
            int grandtotal = 0;
            while (i < totalrows)
            {
                dr = dt.NewRow();
                da.Fill(ds);
                dr["sno"] = ds.Tables[0].Rows[i]["sno"].ToString();
                dr["Itemid"] = ds.Tables[0].Rows[i]["Itemid"].ToString();
                dr["Itemname"] = ds.Tables[0].Rows[i]["Itemname"].ToString();
                dr["Quantity"] = ds.Tables[0].Rows[i]["Quantity"].ToString();
                dr["Price"] = ds.Tables[0].Rows[i]["Price"].ToString();
                int price = Convert.ToInt16(ds.Tables[0].Rows[i]["Price"].ToString());
                int quantity = Convert.ToInt16(ds.Tables[0].Rows[i]["Quantity"].ToString());
                int Totalprice = price * quantity;
                dr["Totalprice"] = Totalprice;
                grandtotal = grandtotal + Totalprice;
                dt.Rows.Add(dr);
                i = i + 1;
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
            Label11.Text = grandtotal.ToString();

        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }
    }
}