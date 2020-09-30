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
    public partial class WebForm14 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                fillRestaurantName();
            }
            GridView1.DataBind();
        }
        //go
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

                    SqlCommand cmd = new SqlCommand("DELETE from Item_List_table WHERE Item_ID='" + TextBox1.Text.Trim() + "'", con);

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
                    string Cuisines = "";
                    foreach (int i in ListBox1.GetSelectedIndices())
                    {
                        Cuisines = Cuisines + ListBox1.Items[i] + ",";
                    }
                    Cuisines = Cuisines.Remove(Cuisines.Length - 1);

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

                    SqlCommand cmd = new SqlCommand("UPDATE Item_List_table SET Item_ID=@Item_ID,Item_Name=@Item_Name,Restaurant_Name=@Restaurant_Name,Cuisine=@Cuisine,Price=@Price,Item_desc=@Item_desc,item_imagelink=@item_imagelink,Item_Category=@Item_Category WHERE Item_ID='" + TextBox1.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@Item_ID", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@Cuisine", Cuisines);
                    cmd.Parameters.AddWithValue("@Item_Name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@Restaurant_Name", DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@Price", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@Item_desc", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@item_imagelink", filepath);
                    cmd.Parameters.AddWithValue("@Item_Category", DropDownList1.SelectedItem.Value);

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
        bool checkIfItemExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Item_List_table where Item_ID='" + TextBox1.Text.Trim() + "';", con);
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
                string Cuisines = "";
                foreach (int i in ListBox1.GetSelectedIndices())
                {
                    Cuisines = Cuisines + ListBox1.Items[i] + ",";
                }
                Cuisines = Cuisines.Remove(Cuisines.Length - 1);

                string filepath = "~/image/eat.JPG";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("image/" + filename));
                filepath = "~/image/" + filename;


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO Item_List_table(Item_ID,Item_Name,Restaurant_Name,Cuisine,Price,Item_desc,item_imagelink,Item_Category) values(@Item_ID,@Item_Name,@Restaurant_Name,@Cuisine,@Price,@Item_desc,@item_imagelink,@Item_Category)", con);

                cmd.Parameters.AddWithValue("@Item_ID", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Cuisine", Cuisines);
                cmd.Parameters.AddWithValue("@Item_Name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Restaurant_Name", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Price", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@Item_desc", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@item_imagelink", filepath);
                cmd.Parameters.AddWithValue("@Item_Category", DropDownList1.SelectedItem.Value);

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
                SqlCommand cmd = new SqlCommand("SELECT * from Item_List_table WHERE Item_ID='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {

                    TextBox10.Text = dt.Rows[0]["Price"].ToString().Trim();
                    TextBox6.Text = dt.Rows[0]["Item_desc"].ToString();

                    //DropDownList2.SelectedValue = dt.Rows[0]["Item_Name"].ToString().Trim();
                    DropDownList2.SelectedValue = dt.Rows[0]["Restaurant_Name"].ToString().Trim();

                    ListBox1.ClearSelection();
                    string[] Cuisine = dt.Rows[0]["Cuisine"].ToString().Trim().Split(',');
                    for (int i = 0; i < Cuisine.Length; i++)
                    {
                        for (int j = 0; j < ListBox1.Items.Count; j++)
                        {
                            if (ListBox1.Items[j].ToString() == Cuisine[i])
                            {
                                ListBox1.Items[j].Selected = true;

                            }
                        }
                    }
                    global_filepath = dt.Rows[0]["item_imagelink"].ToString();

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