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
    public partial class WebForm27 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnchangepass_Click(object sender, EventArgs e)
        {
            lblmsg.Text = "";
            string constr = ConfigurationManager.ConnectionStrings["con"].ToString();
            SqlConnection conn = new SqlConnection(constr);
            SqlDataAdapter da = new SqlDataAdapter("select * from admin_master_table where admin_password='" + txtcurrentpass.Text + "'", conn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count == 0)
            {
                lblmsg.Text = "Invalid current password";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                da = new SqlDataAdapter("update admin_master_table  set admin_password='" + txtnewpass.Text + "'where admin_id='" + TextBox1.Text + "'", conn);
                da.Fill(dt);
                lblmsg.Text = "Password changed successfully";
                lblmsg.ForeColor = System.Drawing.Color.Green;
            }
        }
    }
}