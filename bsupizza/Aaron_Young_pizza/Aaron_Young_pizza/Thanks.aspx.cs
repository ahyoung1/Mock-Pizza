using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Aaron_Young_pizza
{
    public partial class Thanks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Write("<script language=javascript> var agree; agree=confirm('You have to log in first'); location.replace('Login.aspx');</script>");
            }
            else if (Session["order_in_process"] == null || Session["order_in_process"].Equals(false))
            {
                Response.Write("<script language=javascript> var agree; agree=confirm('You have to place an order first'); location.replace('Order.aspx');</script>");
            }
            else
            {
                TY_TB.Text = TY_TB.Text + ", " + Session["user"].ToString() + "!";
                Session["order_in_process"] = false;
                Response.AddHeader("refresh", "5; url=Home.aspx");
            }
        }
    }
}