using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EatiT.com
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty((string)Session["role"]))
                {
                    LinkButton4.Visible = true;
                    //LinkButton5.Visible = true;

                    LinkButton1.Visible = false;
                    LinkButton2.Visible = false;
                    LinkButton3.Visible = false;
                    LinkButton7.Visible = false;
                }
                else if (Session["role"].Equals("user"))
                {
                    LinkButton4.Visible = false;
                    //LinkButton5.Visible = false;

                    LinkButton1.Visible = false;
                    LinkButton2.Visible = true;
                    LinkButton3.Visible = true;
                    LinkButton7.Visible = true;
                }
                else if (Session["role"].Equals("admin"))
                {
                    LinkButton4.Visible = false;
                    //LinkButton5.Visible = false;

                    LinkButton1.Visible = false;
                    LinkButton2.Visible = false;

                    LinkButton3.Visible = false;
                    LinkButton7.Visible = true;
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("customer-loginform.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Userprofile.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Notifications.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Wishlist.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            LinkButton4.Visible = true;
            //LinkButton5.Visible = true;

            LinkButton1.Visible = false;
            LinkButton2.Visible = false;

            LinkButton3.Visible = false;
            LinkButton7.Visible = false;
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("AboutUs.aspx");
        }

        protected void LinkButton14_Click(object sender, EventArgs e)
        {
            Response.Redirect("Careers.aspx");
        }

        protected void LinkButton15_Click(object sender, EventArgs e)
        {

            Response.Redirect("FAQ's.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContactUS.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContactUs.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("RequestForm.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("TermsandConditions.aspx");
        }

        protected void LinkButton13_Click(object sender, EventArgs e)
        {
            Response.Redirect("TermsandConditions.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Notifications.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddToCart.aspx?Category=Food");
        }

        protected void LinkButton17_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddToCart.aspx?Category=Grocery");
        }

        protected void LinkButton18_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddToCart.aspx?Category=Dairy");
        }

        protected void LinkButton19_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddToCart.aspx?Category=Bakery");
        }

        protected void LinkButton21_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddToCart.aspx?Category=Medicine");
        }

        protected void LinkButton22_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddToCart.aspx?Category=Liquors");
        }
        protected void LinkButton20_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddToCart.aspx?Category=Meat & Fish");
        }
        protected void LinkButton23_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddToCart.aspx?Category=Kirana Items");
        }

        protected void LinkButton16_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddToCart.aspx?Iname=" + TextBox1.Text);
           
        }

        /*protected void LinkButton16_Click(object sender, EventArgs e)
        {
            var searchText = Server.UrlEncode(TextBox1.Text); // URL encode in case of special characters
            Response.Redirect("~/AddToCart.aspx?srch=" + searchText);

        }*/

        /*protected void LinkButton8_Click1(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }*/
    }
}