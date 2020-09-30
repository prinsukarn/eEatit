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
    public partial class WebForm1 : System.Web.UI.Page
    {
       protected void Page_Load(object sender, EventArgs e)
        {
            setimage();
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Restaurants.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddToCart.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AboutUs.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("RequestForm.aspx");
        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            setimage();
        }
        void setimage()
        {
            Random ran = new Random();
            int i = ran.Next(1,10);
            Image3.ImageUrl = "~/Carouselimg/food" + i.ToString() + ".jpg";
        }

        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Response.Redirect("AddToCart.aspx?Iname="+e.CommandArgument.ToString());
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Response.Redirect("AddToCart.aspx?Iname=" + e.CommandArgument.ToString());
        }
    }
}