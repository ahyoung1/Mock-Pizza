using Aaron_Young_pizza.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Aaron_Young_pizza
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            userName_TB.Focus();
        }

        protected void login_BTN_Click(object sender, EventArgs e)
        {
            CustomerUtility customer = new CustomerUtility();
            customer.userName = userName_TB.Text;
            customer.password = password_TB.Text;
            if (customer.checkPassword())
            {
                Session["user"] = userName_TB.Text;
                message_LBL.Enabled = true;
                message_LBL.Visible = true;
                message_LBL.Text = "Welcome back!";
                message_LBL.ForeColor = System.Drawing.Color.Red;
                Response.AddHeader("refresh", "2; url=Home.aspx");
            }
            else
            {
                message_LBL.Enabled = true;
                message_LBL.Visible = true;
                message_LBL.Text = "Username and password combination is not correct!";
                message_LBL.ForeColor = System.Drawing.Color.Red;
                resetLink_BTN.Visible = true;
                resetLink_BTN.Enabled = true;
            }
        }
    }
}