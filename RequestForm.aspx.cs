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
    public partial class WebForm20 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            sendclientrequest();
        }
        void sendclientrequest()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO client_request_table(Fullname,ContactNo,Email_id,Restaurant_name,Address,Description) values(@Fullname,@ContactNo,@Email_id,@Restaurant_name,@Address,@Description)", con);
                cmd.Parameters.AddWithValue("@Fullname", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@ContactNo", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Email_id", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@Restaurant_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@Description", TextBox6.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Thank You.We will contact you soon.');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}