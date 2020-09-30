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
    public partial class WebForm4 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddRestaurant.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customers.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("ItemDirectory.aspx");

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Careerformslist.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("SpecialMenu.aspx");
        }

        /*protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("Restaurants.aspx");
        }*/

        protected void Button8_Click(object sender, EventArgs e)
        {
            Response.Redirect("Top Vendor.aspx");
        }

       /* protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrderDetails.aspx");
        }*/

        protected void Button10_Click(object sender, EventArgs e)
        {
            Response.Redirect("Order Details.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Change_Password.aspx");
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddAdmin.aspx");
        }

        /*protected void Button12_Click(object sender, EventArgs e)
        {
            try { 
            string filepath = "~/Carouselimg/food6.jpg";
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(Server.MapPath("Carouselimg/" + filename));
            filepath = "~/Carouselimg/food" + filename;


            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = new SqlCommand("INSERT INTO Carousel_table(carouselimage) values(@carouselimage)", con);
            cmd.Parameters.AddWithValue("@carouselimage", filepath);

            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Image added successfully.');</script>");
            }
            catch { }

        }*/

        protected void Button13_Click(object sender, EventArgs e)
        {
            Response.Redirect("Delete Admin.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("CarouselImageUpload.aspx");
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("News And Events.aspx");
        }
    }
}