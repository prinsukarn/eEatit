using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EatiT.com
{
    public partial class WebForm17 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    DataTable dt = new DataTable();
                    DataRow dr;
                    dt.Columns.Add("sno");
                    dt.Columns.Add("Itemid");
                    dt.Columns.Add("Itemname");
                    dt.Columns.Add("Quantity");
                    dt.Columns.Add("Price");
                    dt.Columns.Add("Totalprice");
                    //dt.Columns.Add("Itemimage");
                    if (Request.QueryString["Item_ID"] != null)
                    {
                        if (Session["Buyitems"] == null)
                        {
                            dr = dt.NewRow();
                            SqlConnection con = new SqlConnection(strcon);
                            String myquery = "SELECT * FROM Item_List_table WHERE Item_ID=" + Request.QueryString["Item_ID"];
                            SqlCommand cmd = new SqlCommand();
                            cmd.CommandText = myquery;
                            cmd.Connection = con;
                            SqlDataAdapter da = new SqlDataAdapter();
                            da.SelectCommand = cmd;
                            DataSet ds = new DataSet();
                            da.Fill(ds);
                            dr["sno"] = 1;
                            dr["Itemid"] = ds.Tables[0].Rows[0]["Item_ID"].ToString();
                            dr["Itemname"] = ds.Tables[0].Rows[0]["Item_Name"].ToString();
                            dr["Quantity"] = Request.QueryString["Quantity"];
                            dr["Price"] = ds.Tables[0].Rows[0]["Price"].ToString();
                            //dr["Itemimage"] = ds.Tables[0].Rows[0]["Item_imagelink"].ToString();
                            int price = Convert.ToInt16(ds.Tables[0].Rows[0]["Price"].ToString());
                            int quantity = Convert.ToInt16(Request.QueryString["Quantity"].ToString());
                            int Totalprice = price * quantity;
                            dr["Totalprice"] = Totalprice;

                            dt.Rows.Add(dr);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                            Session["Buyitems"] = dt;
                            GridView1.FooterRow.Cells[4].Text = "Total Amount";
                            GridView1.FooterRow.Cells[5].Text = grandtotal().ToString();
                            Response.Redirect("OrderNow.aspx");
                        }
                        else
                        {
                            dt = (DataTable)Session["Buyitems"];
                            int sr;
                            sr = dt.Rows.Count;

                            dr = dt.NewRow();
                            SqlConnection con = new SqlConnection(strcon);
                            String myquery = "SELECT * FROM Item_List_table  WHERE Item_ID=" + Request.QueryString["Item_ID"];
                            SqlCommand cmd = new SqlCommand();
                            cmd.CommandText = myquery;
                            cmd.Connection = con;
                            SqlDataAdapter da = new SqlDataAdapter();
                            da.SelectCommand = cmd;
                            DataSet ds = new DataSet();
                            da.Fill(ds);
                            dr["sno"] = sr + 1;
                            dr["Itemid"] = ds.Tables[0].Rows[0]["Item_ID"].ToString();
                            dr["Itemname"] = ds.Tables[0].Rows[0]["Item_Name"].ToString();
                            dr["Quantity"] = Request.QueryString["Quantity"];
                            dr["Price"] = ds.Tables[0].Rows[0]["Price"].ToString();
                            //dr["Itemimage"] = ds.Tables[0].Rows[0]["Item_imagelink"].ToString();
                            int price = Convert.ToInt16(ds.Tables[0].Rows[0]["Price"].ToString());
                            int quantity = Convert.ToInt16(Request.QueryString["Quantity"].ToString());
                            int Totalprice = price * quantity;
                            dr["Totalprice"] = Totalprice;

                            dt.Rows.Add(dr);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                            Session["Buyitems"] = dt;
                            GridView1.FooterRow.Cells[4].Text = "Total Amount";
                            GridView1.FooterRow.Cells[5].Text = grandtotal().ToString();
                            Response.Redirect("OrderNow.aspx");


                        }
                    }
                    else
                    {
                        dt = (DataTable)Session["Buyitems"];
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        if (GridView1.Rows.Count > 0)
                        {
                            GridView1.FooterRow.Cells[4].Text = "Total Amount";
                            GridView1.FooterRow.Cells[5].Text = grandtotal().ToString();
                        }
                    }
                    Label1.Text = GridView1.Rows.Count.ToString();

                }
            }
            catch
            {

            }
        }
        public int grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["Buyitems"];
            int nrow = dt.Rows.Count;
            int i = 0;
            int gtotal = 0;
            while (i < nrow)
            {
                gtotal = gtotal + Convert.ToInt32(dt.Rows[i]["Totalprice"].ToString());
                i = i + 1;
            }
            return gtotal;
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["Buyitems"];

            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int sr;
                int srl;
                string qdata;
                string dtdata;
                sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
                TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
                qdata = cell.Text;
                dtdata = sr.ToString();
                srl = Convert.ToInt32(qdata);
                if (sr == srl)
                {
                    dt.Rows[i].Delete();
                    dt.AcceptChanges();
                    break;

                }

            }
            for (int i = 1; i <= dt.Rows.Count; i++)
            {
                dt.Rows[i - 1]["sno"] = i;
                dt.AcceptChanges();

            }
            Session["Buyitems"] = dt;
            Response.Redirect("OrderNow.aspx");
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("PlaceOrder.aspx");
        }
    }
}