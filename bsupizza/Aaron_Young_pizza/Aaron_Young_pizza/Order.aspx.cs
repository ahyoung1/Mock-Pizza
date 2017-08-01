using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aaron_Young_pizza.App_Code;

namespace Aaron_Young_pizza
{
    public partial class Order : System.Web.UI.Page
    {
        decimal price = 0;
        protected void updatePrice()
        {
            price = Convert.ToDecimal(DropDownListPizzaSize.SelectedValue);
            for (int i = 0; i < CheckBoxListToppings.Items.Count; i++)
            {
                if (CheckBoxListToppings.Items[i].Selected)
                {
                    price += 1;
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Write("<script language=javascript> var agree; agree=confirm('You have to log in first'); location.replace('Login.aspx');</script>");
            }
            this.updatePrice();
            LabelPrice.Text = "Total price: "+ price;
        }

        protected void CheckBoxListToppings_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (CheckBoxListToppings.Items.FindByText("Grilled Chicken").Selected)
            {
                ImageChicken.Visible = true;
            }
            else
            {
                ImageChicken.Visible = false;
            }
            if (CheckBoxListToppings.Items.FindByText("Pepperoni").Selected)
            {
                ImagePepperoni.Visible = true;
            }
            else
            {
                ImagePepperoni.Visible = false;
            }
            if (CheckBoxListToppings.Items.FindByText("Steak").Selected)
            {
                ImageSteak.Visible = true;
            }
            else
            {
                ImageSteak.Visible = false;
            }
        }

        protected void ButtonNext_Click(object sender, EventArgs e)
        {
            updatePrice();
            string toppings = "";
            for (int i = 0; i < CheckBoxListToppings.Items.Count; i++)
            {
                if (CheckBoxListToppings.Items[i].Selected)
                {
                    toppings += CheckBoxListToppings.Items[i].Text + ", ";
                }
            }
            ShoppingCartUtility cart = new ShoppingCartUtility();
            cart.PizzaSize = DropDownListPizzaSize.SelectedItem.ToString();
            cart.PizzaStyle = DropDownListPizzaStyle.SelectedItem.ToString();
            cart.Price = (double)price * (1.07);
            cart.Toppings = toppings;
            cart.UserName = Session["user"].ToString();
            cart.insertShoppingCart();
            Session["order_in_process"] = true;
            Response.Redirect("OrderConfirm.aspx?id=" + cart.ID);
        }
    }
}