using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EatiT.com
{
    public partial class WebForm26 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            DataTable dt = new DataTable();
            dt = (DataTable)Session["Buyitems"];
            if (dt != null)
            {
                Label7.Text = dt.Rows.Count.ToString();

            }
            else
            {
                Label7.Text = "0";
            }
            string id = Request.QueryString["Iname"];
    

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DropDownList dlist = (DropDownList)(e.Item.FindControl("DropDownList1"));
            Response.Redirect("OrderNow.aspx?Item_ID=" + e.CommandArgument.ToString() + "&Quantity=" + dlist.SelectedItem.ToString());

        }        //order
        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DropDownList dlist = (DropDownList)(e.Item.FindControl("DropDownList1"));
            Response.Redirect("OrderNow.aspx?Item_ID=" + e.CommandArgument.ToString() + "&Quantity=" + dlist.SelectedItem.ToString());

        }
       

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddToCart.aspx?Category=Food");
           
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddToCart.aspx?Category=Grocery");
          
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddToCart.aspx?Category=Dairy");
           
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddToCart.aspx?Category=Kirana Items");
           

        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddToCart.aspx?Category=Bakery");
         
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddToCart.aspx?Category=Meat & Fish");
       
        }
        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
{

}

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddToCart.aspx?Category=Liquors");
         
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddToCart.aspx?Category=Medicine");
        
        }

        protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DropDownList dlist = (DropDownList)(e.Item.FindControl("DropDownList1"));
            Response.Redirect("OrderNow.aspx?Item_ID=" + e.CommandArgument.ToString() + "&Quantity=" + dlist.SelectedItem.ToString());

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {

            Response.Redirect("AddToCart.aspx?Category=null");
        }

        /*protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }*/
    }
}