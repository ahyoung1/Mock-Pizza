using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using Aaron_Young_pizza.App_Code;

namespace Aaron_Young_pizza
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBoxFName.Focus();
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            CustomerUtility customer = new CustomerUtility();
            customer.userName = TextBoxUName.Text;
            customer.fName = TextBoxFName.Text;
            customer.lName = TextBoxLName.Text;
            customer.email = TextBoxEmail.Text;
            customer.country = DDL_Coutnry.SelectedItem.ToString();
            customer.password = TB_Password.Text;
            customer.age = TB_Age.Text;
            if (RB_Female.Checked){
                customer.gender = 'F';
            }
            else{
                customer.gender = 'M';
            }
            if (customer.isRegistered())
            {
                Label10.Text = "This user already exists, please log in";
                Label10.ForeColor = System.Drawing.Color.Red;
                Response.AddHeader("refresh", "4;url=Login.aspx");
            }
            else
            {
                customer.insertData();
                Label10.Text = "You have registered with BSU Pizza successfully!";
                Label10.ForeColor = System.Drawing.Color.Red;
                Response.AddHeader("refresh", "2; url=Login.aspx");
            }
        }
    }
}