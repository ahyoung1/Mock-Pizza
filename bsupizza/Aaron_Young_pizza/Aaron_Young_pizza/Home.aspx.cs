using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aaron_Young_pizza.App_Code;

namespace Aaron_Young_pizza
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                LabelWelcome.Text = "<center>Please <a href='Login.aspx'>log in</a> first, " + LabelWelcome.Text +"</center>";
            }
            else
            {
                LabelWelcome.Text = "<center>"+Session["user"].ToString() + ", " + LabelWelcome.Text+"</center>";
            }
        }

        protected void ButtonContact_Click(object sender, EventArgs e)
        {
            ContactUtility con = new ContactUtility();
            con.Name = TextBoxName.Text;
            con.Content = TextBoxContact.Text;
            con.insertLog();
            LabelMessage.Text = "Sending Successful!";
            ButtonContact.Visible = false;
            LabelMessage.Visible = true;
        }
    }
}