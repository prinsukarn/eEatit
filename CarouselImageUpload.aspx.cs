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
    public partial class WebForm32 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            AddNewImage();
        }
        void AddNewImage()
        {
            //Response.Write("<script>alert('Testing');</script>");
            try
            {
                string filepath = "~/Carouselimg/food1.jpg";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("Carouselimg/" + filename));
                filepath = "~/Carouselimg/" + filename;

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO Carousel_table(Path,ImageNo) values(@Path,@ImageNo)", con);
                cmd.Parameters.AddWithValue("@ImageNo", TextBox1.Text.Trim());
               
                cmd.Parameters.AddWithValue("@Path", filepath);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Image Added Successfully.');</script>");
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
       
        void deleteImage()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from Carousel_table WHERE ImageNo='" + TextBox1.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Image Deleted Successfully');</script>");
               
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            deleteImage();
        }
    }
}