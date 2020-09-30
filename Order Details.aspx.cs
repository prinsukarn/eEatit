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
    public partial class WebForm18 : System.Web.UI.Page
    {
        private SqlConnection con;
        private SqlCommand com;
        private string constr, query;
        private void connection()
        {
            constr = ConfigurationManager.ConnectionStrings["con"].ToString();
            con = new SqlConnection(constr);
            con.Open();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bindgrid();

            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        }
        private void Bindgrid()
        {
            connection();
            query = "SELECT orderdetails.datefororder,orderdetails.orderid,orderdetails.Itemid,orderdetails.Itemname,orderdetails.Price,orderdetails.Quantity,orderdetails.TotalPrice,Orderaddress.mobilenumber,Orderaddress.fullname,Orderaddress.address,Orderaddress.orderstatus from orderdetails,orderaddress where orderdetails.orderid=orderaddress.orderid";//not recommended this i have wrtten just for example,write stored procedure for security  
            com = new SqlCommand(query, con);

            GridView1.DataBind();
            con.Close();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ExportGridToExcel();
        }

       /* protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow row in GridView1.Rows)
                {
                    string orderid = row.Cells[1].Text;
                    RadioButton rb1 = (row.Cells[9].FindControl("RadioButton1") as RadioButton);
                    RadioButton rb2 = (row.Cells[9].FindControl("RadioButton2") as RadioButton);
                    string status;
                    if (rb2.Checked)
                    {
                        status = rb2.Text;
                    }
                    else
                    {
                        status = "Pending";
                    }
                    constr = ConfigurationManager.ConnectionStrings["con"].ToString();
                    con = new SqlConnection(constr);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Update Orderaddress set orderstatus=@a where orderid=@b", con);
                    cmd.Parameters.AddWithValue("@a", status);
                    cmd.Parameters.AddWithValue("@b", orderid);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                Response.Write("<script>alert('Status Updated Successfully')</script>");
            }
            catch
            {

            }
        }*/

        protected void LinkButton17_Click(object sender, EventArgs e)
        {
            
            LinkButton chk = (LinkButton)sender;
            GridViewRow gr = (GridViewRow)chk.Parent.Parent;
            GridViewRow gvrow = (GridViewRow)(sender as Control).Parent.Parent;
            string orderid = gvrow.Cells[1].Text;
            constr = ConfigurationManager.ConnectionStrings["con"].ToString();
            con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd = new SqlCommand("Update Orderaddress set orderstatus='Approved' where orderid=@b", con);
            cmd.Parameters.AddWithValue("@b", orderid);
            cmd.ExecuteNonQuery();
            con.Close();
            

        }

        private void ExportGridToExcel()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "EatiT" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GridView1.GridLines = GridLines.Both;
            GridView1.HeaderStyle.Font.Bold = true;
            GridView1.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }
    }
}