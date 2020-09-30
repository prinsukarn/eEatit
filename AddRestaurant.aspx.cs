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
    public partial class WebForm3 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
        //Add
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckRestaurantExists())
            {

                Response.Write("<script>alert('Restaurant Already Exist with this ID');</script>");
            }
            else
            {
                AddNewRestaurant();
            }
        }
        //Update
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (CheckRestaurantExists())
            {
                updateRestaurant();
            }
            else
            {
                Response.Write("<script>alert('Restaurant with this ID does not exists.');</script>");
            }
        }
        //Delete
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (CheckRestaurantExists())
            {
                deleteRestaurant();

            }
            else
            {
                Response.Write("<script>alert('Restaurant does not exist');</script>");
            }
        }
        /*//Get
        protected void Button4_Click(object sender, EventArgs e)
        {
            getRestaurant();
        }
        void getRestaurant()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Restaurant_master_tbl where Restaurant_ID='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Restaurant ID');</script>");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }*/
        bool CheckRestaurantExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from Restaurant_master_tbl where Restaurant_ID='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        void AddNewRestaurant()
        {
            //Response.Write("<script>alert('Testing');</script>");
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
                SqlCommand cmd = new SqlCommand("INSERT INTO Restaurant_master_tbl(Restaurant_ID,Restaurant_Name,Contact_Person,Contact_no,Restaurant_Address,Restaurant_Email,Restaurant_imagelink) values(@Restaurant_ID,@Restaurant_Name,@Contact_Person,@Contact_no,@Restaurant_Address,@Restaurant_Email,@Restaurant_imagelink)", con);
                cmd.Parameters.AddWithValue("@Restaurant_ID", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Restaurant_Name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Contact_Person", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@Contact_no", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@Restaurant_Address", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Restaurant_Email", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@Restaurant_imagelink", filepath);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Restaurant Added Successfully.');</script>");
                GridView1.DataBind();
                clearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void updateRestaurant()
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE Restaurant_master_tbl SET Restaurant_Name=@Restaurant_Name,Contact_Person=@Contact_Person,Contact_no=@Contact_no,Restaurant_Address=@Restaurant_Address,Restaurant_Email= @Restaurant_Email WHERE Restaurant_ID='" + TextBox1.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@Restaurant_Name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Contact_Person", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@Contact_no", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@Restaurant_Address", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Restaurant_Email", TextBox5.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Restaurant Updated Successfully');</script>");
                GridView1.DataBind();
                clearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
        void deleteRestaurant()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from Restaurant_master_tbl WHERE Restaurant_ID='" + TextBox1.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Restaurant Deleted Successfully');</script>");
                GridView1.DataBind();
                clearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void clearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
        }
    }
}