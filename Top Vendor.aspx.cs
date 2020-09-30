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
    public partial class WebForm30 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillRestaurantName();
            }
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (CheckRestaurantExists())
            {

                Response.Write("<script>alert('Vendor Already Exist with this ID');</script>");
            }
            else
            {
                AddNewRestaurant();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (CheckRestaurantExists())
            {
                updateRestaurant();
            }
            else
            {
                Response.Write("<script>alert('Vendor with this ID does not exists.');</script>");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (CheckRestaurantExists())
            {
                deleteRestaurant();

            }
            else
            {
                Response.Write("<script>alert('Vendor does not exist');</script>");
            }
        }
        void fillRestaurantName()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT Restaurant_Name from Restaurant_master_tbl;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList2.DataSource = dt;
                DropDownList2.DataValueField = "Restaurant_Name";
                DropDownList2.DataBind();
                con.Close();

            }
            catch (Exception ex)
            {

            }
        }
        bool CheckRestaurantExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from Top_Vendor_Table where TopVendor_ID='" + TextBox1.Text.Trim() + "';", con);
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
                SqlCommand cmd = new SqlCommand("INSERT INTO Top_Vendor_Table(TopVendor_ID,Vendor_Name,Contact_Person,Contact_Number,Vendor_Address,Vendor_Email,Vendor_ImageLink) values(@TopVendor_ID,@Vendor_Name,@Contact_Person,@Contact_Number,@Vendor_Address,@Vendor_Email,@Vendor_ImageLink)", con);
                cmd.Parameters.AddWithValue("@TopVendor_ID", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Vendor_Name", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Contact_Person", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@Contact_Number", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@Vendor_Address", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Vendor_Email", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@Vendor_ImageLink", filepath);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Vendor Added Successfully.');</script>");
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

                SqlCommand cmd = new SqlCommand("UPDATE Top_Vendor_Table SET Vendor_Name=@Vendor_Name,Contact_Person=@Contact_Person,Contact_Number=@Contact_Number,Vendor_Address=@Vendor_Address,Vendor_Email= @Vendor_Email WHERE TopVendor_ID='" + TextBox1.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@Vendor_Name", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Contact_Person", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@Contact_Number", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@Vendor_Address", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Vendor_Email", TextBox5.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Vendor Updated Successfully');</script>");
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

                SqlCommand cmd = new SqlCommand("DELETE from Top_Vendor_Table WHERE TopVendor_ID='" + TextBox1.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Vendor Deleted Successfully');</script>");
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
            
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";

        }
    }
}