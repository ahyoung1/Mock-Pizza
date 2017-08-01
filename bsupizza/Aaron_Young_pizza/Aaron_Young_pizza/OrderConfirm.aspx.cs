using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aaron_Young_pizza.App_Code;

namespace Aaron_Young_pizza
{
    public partial class OrderConfirm : System.Web.UI.Page
    {
        String addressId = "";
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
        }

        protected void ButtonCheckOut_Click(object sender, EventArgs e)
        {
            AddressUtility adr = new AddressUtility();
            if (String.IsNullOrEmpty(addressId))
            {
                /*if (adr.addressIsRepeat())
                {
                    addressId = adr.Delivery_ID;
                    DropDownList1.Items.FindByValue(addressId).Selected = true;
                }
                else
                {*/
                    adr.Address_Type = TextBoxAddressType.Text;
                    adr.UserName = Session["user"].ToString();
                    adr.Phone = TextBoxPhone.Text;
                    adr.AddressLine1 = TextBoxAddressLine1.Text;
                    adr.AddressLine2 = TextBoxAddressLine2.Text;
                    adr.ZipCode = TextBoxZipCode.Text;
                    adr.insertAddress();
                    addressId = adr.Delivery_ID;
                //}
            }
            ShoppingCartUtility cart = new ShoppingCartUtility();
            cart.ID = Request.QueryString["id"].ToString();
            cart.readRecordById();
            OrderUtility order = new OrderUtility();
            order.PizzaSize = cart.PizzaSize;
            order.PizzaStyle = cart.PizzaStyle;
            order.Price = cart.Price;
            order.Toppings = cart.Toppings;
            order.UserName = cart.UserName;
            order.Delivery_ID = addressId;
            order.insertOrder();
            cart.removeRecord();
            Response.Redirect("Thanks.aspx?OrderID=" + order.OrderId);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            AddressUtility adr = new AddressUtility();
            adr.Delivery_ID = DropDownList1.SelectedValue;
            adr.selectAddress();
            TextBoxAddressType.Text = adr.Address_Type;
            TextBoxAddressLine1.Text = adr.AddressLine1;
            TextBoxAddressLine2.Text = adr.AddressLine2;
            TextBoxZipCode.Text = adr.ZipCode;
            TextBoxPhone.Text = adr.Phone;
            addressId = adr.Delivery_ID;
        }
    }
}