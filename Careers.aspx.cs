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
    public partial class WebForm7 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            addCareerRequest();
        }
        void addCareerRequest()
        {
            try
            {

                string filepath = "~/image/eat.JPG";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("image/" + filename));
                filepath = "~/image/" + filename;


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO Career_Master_table(Name,Contact_No,CV,Email,Post,Permanent_Address,Temporary_Address,Date_Of_Birth,Province) values(@Name,@Contact_No,@CV,@Email,@Post,@Permanent_Address,@Temporary_Address,@Date_Of_Birth,@Province)", con);

                cmd.Parameters.AddWithValue("@Name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Contact_No", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Post", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@Permanent_Address", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@Temporary_Address", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@Date_Of_Birth", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("Province", DropDownList1.SelectedItem.Value);

                cmd.Parameters.AddWithValue("@CV", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Details sent successfully.We will contact you soon.');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}