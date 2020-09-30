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
    public partial class WebForm31 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            addNewItem();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            updateItem();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            deleteItemByID();
        }
        void deleteItemByID()
        {
           
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from Notice_Board_Table WHERE Notice_Number='" + TextBox3.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Notice Deleted Successfully');</script>");

                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

       
        }
        void updateItem()
        {
            try
            {
                if (checkIfItemExists())
                {
                    string filepath = "~/image/food3.jpg";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;

                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("image/" + filename));
                        filepath = "~/image/" + filename;
                    }

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("UPDATE Notice_Board_Table SET Notice_Number=@Notice_Number,Notice_Head=@Notice_Head,Notice_Body=@Notice_Body,Notice_imglink=@Notice_imglink WHERE Notice_Number='" + TextBox3.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@Item_ID", TextBox3.Text.Trim());

                    cmd.Parameters.AddWithValue("@Notice_Head", TextBox1.Text.Trim());

                    cmd.Parameters.AddWithValue("@Price", TextBox2.Text.Trim());

                    cmd.Parameters.AddWithValue("@Notice_imglink", filepath);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Notice updated successfully.');</script>");
                    GridView1.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Notice does not with this Notice Number');</script>");
                }

            }
            
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void addNewItem()
        {
            try
            {
                if (checkIfItemExists())
                {

                    Response.Write("<script>alert('Notice Already Exists with this Notice Number');</script>");
                   
                }
                else
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

                    SqlCommand cmd = new SqlCommand("INSERT INTO Notice_Board_Table(Notice_Number,Notice_Head,Notice_Body,Notice_imglink) values(@Notice_Number,@Notice_Head,@Notice_Body,@Notice_imglink)", con);

                    cmd.Parameters.AddWithValue("@Notice_Number", TextBox3.Text.Trim());

                    cmd.Parameters.AddWithValue("@Notice_Head", TextBox1.Text.Trim());

                    cmd.Parameters.AddWithValue("@Notice_Body", TextBox2.Text.Trim());

                    cmd.Parameters.AddWithValue("@Notice_imglink", filepath);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Notice added successfully.');</script>");
                    GridView1.DataBind();
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        bool checkIfItemExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Notice_Board_Table where Notice_Number='" + TextBox3.Text.Trim() + "';", con);
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

    }
}