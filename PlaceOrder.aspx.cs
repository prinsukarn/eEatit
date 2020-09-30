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
    public partial class WebForm19 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
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
                Label2.Text = DateTime.Now.ToString();
                findorderid();
                Label3.Text = GridView1.Rows.Count.ToString();

            }
        }
        public void findorderid()
        {
            string pass = "abcdefghijklmnopqrstuvwxyz123456789";
            Random r = new Random();
            char[] mypass = new char[5];
            for (int i = 0; i < 5; i++)
            {
                mypass[i] = pass[(int)(35 * r.NextDouble())];
            }
            string orderid;
            orderid = "Order" + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(mypass);
            Label1.Text = orderid;
        }
        public void saveaddress()
        {
            String updatepass = "insert into Orderaddress(orderid,address,mobilenumber,fullname) values('" + Label1.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "')";
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandText = updatepass;
            cmd1.Connection = con;
            cmd1.ExecuteNonQuery();
            con.Close();

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
        protected void Button1_Click(object sender, EventArgs e)
        {
            try { 
            DataTable dt;
            dt = (DataTable)Session["Buyitems"];

            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                String updatepass = "insert into orderdetails(orderid,sno,Itemid,Itemname,Price,Quantity,datefororder,TotalPrice) values('" + Label1.Text + "'," + dt.Rows[i]["sno"] + "," + dt.Rows[i]["Itemid"] + ",'" + dt.Rows[i]["Itemname"] + "'," + dt.Rows[i]["Price"] + "," + dt.Rows[i]["Quantity"] + ",'" + Label2.Text + "',"+dt.Rows[i]["TotalPrice"]+")";
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = updatepass;
                cmd1.Connection = con;
                cmd1.ExecuteNonQuery();
                con.Close();
            }
            saveaddress();
            Response.Redirect("Invoice.aspx?orderid=" + Label1.Text);
            }
            catch
            {

            }
        }
    }
}