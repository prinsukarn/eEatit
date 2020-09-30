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
    public partial class WebForm22 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        protected void Page_Load(object sender, EventArgs e)
        {

            fillRestaurantItemName();
            GridView1.DataBind();
        }

        /*protected void Button4_Click(object sender, EventArgs e)
        {
            getBookByID();
        }*/

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkIfItemExists())
            {
                Response.Write("<script>alert('Item already exists with this item ID.');</script>");
            }
            else
            {
                addNewItem();
            }
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
            if (checkIfItemExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from Specialitem_Master_table WHERE SItem_ID='" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Item Deleted Successfully');</script>");

                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Item ID');</script>");
            }
        }

        void updateItem()
        {
            try
            {
                if (checkIfItemExists())
                {
                    string SCuisines = "";
                    foreach (int i in ListBox1.GetSelectedIndices())
                    {
                        SCuisines = SCuisines + ListBox1.Items[i] + ",";
                    }
                    SCuisines = SCuisines.Remove(SCuisines.Length - 1);

                    string filepath = "~/image/eat.JPG";
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

                    SqlCommand cmd = new SqlCommand("UPDATE Specialitem_Master_table SET SItem_ID=@SItem_ID,SItem_Name=@SItem_Name,SRestaurant_Name=@SRestaurant_Name,SCuisine=@SCuisine,SPrice=@SPrice,Item_desc=@Item_desc,Sitem_imagelink=@Sitem_imagelink WHERE SItem_ID='" + TextBox1.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@SItem_ID", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@SCuisine", SCuisines);
                    cmd.Parameters.AddWithValue("@SItem_Name", DropDownList3.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@SRestaurant_Name", DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@SPrice", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@SItem_desc", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@Sitem_imagelink", filepath);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Item updated successfully.');</script>");
                    GridView1.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Item does not exist.');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void fillRestaurantItemName()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT Item_Name from Item_Master_tbl;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList3.DataSource = dt;
                DropDownList3.DataValueField = "Item_Name";
                DropDownList3.DataBind();

                cmd = new SqlCommand("SELECT Restaurant_Name from Restaurant_master_tbl;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                DropDownList2.DataSource = dt;
                DropDownList2.DataValueField = "Restaurant_Name";
                DropDownList2.DataBind();

            }
            catch (Exception ex)
            {

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

                SqlCommand cmd = new SqlCommand("SELECT * from Specialitem_Master_table where SItem_ID='" + TextBox1.Text.Trim() + "';", con);
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
        void addNewItem()
        {
            try
            {
                string SCuisines = "";
                foreach (int i in ListBox1.GetSelectedIndices())
                {
                    SCuisines = SCuisines + ListBox1.Items[i] + ",";
                }
                SCuisines = SCuisines.Remove(SCuisines.Length - 1);

                string filepath = "~/image/eat.JPG";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("image/" + filename));
                filepath = "~/image/" + filename;


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO Specialitem_Master_table(SItem_ID,SItem_Name,SRestaurant_Name,SCuisine,SPrice,SItem_desc,Sitem_imagelink) values(@SItem_ID,@SItem_Name,@SRestaurant_Name,@SCuisine,@SPrice,@SItem_desc,@Sitem_imagelink)", con);

                cmd.Parameters.AddWithValue("@SItem_ID", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@SCuisine", SCuisines);
                cmd.Parameters.AddWithValue("@SItem_Name", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@SRestaurant_Name", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@SPrice", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@SItem_desc", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@Sitem_imagelink", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Item added successfully.');</script>");
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
       /* void getBookByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from Specialitem_Master_table WHERE SItem_ID='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {

                    TextBox10.Text = dt.Rows[0]["Price"].ToString().Trim();
                    TextBox6.Text = dt.Rows[0]["Item_desc"].ToString();

                    DropDownList2.SelectedValue = dt.Rows[0]["SItem_Name"].ToString().Trim();
                    DropDownList3.SelectedValue = dt.Rows[0]["SRestaurant_Name"].ToString().Trim();

                    ListBox1.ClearSelection();
                    string[] SCuisine = dt.Rows[0]["SCuisine"].ToString().Trim().Split(',');
                    for (int i = 0; i < SCuisine.Length; i++)
                    {
                        for (int j = 0; j < ListBox1.Items.Count; j++)
                        {
                            if (ListBox1.Items[j].ToString() == SCuisine[i])
                            {
                                ListBox1.Items[j].Selected = true;

                            }
                        }
                    }
                    global_filepath = dt.Rows[0]["Sitem_imagelink"].ToString();

                }
                else
                {
                    Response.Write("<script>alert('Invalid Item ID');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }*/
    }
}