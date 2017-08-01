using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aaron_Young_pizza.App_Code;
using System.Net.Mail;

namespace Aaron_Young_pizza
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonResetPassword_Click(object sender, EventArgs e)
        {
            CustomerUtility customer = new CustomerUtility().getUser(TextBoxUserName.Text);
            if (!String.IsNullOrEmpty(customer.email) && customer.email.Equals(TextBoxEmail.Text))
            {
                int rand = new Random().Next(100000, 999999);
                string newpwd = "new" + rand;
                customer.resetPassword(newpwd);

                LabelMessage.Visible = true;
                LabelMessage.Text = "Your password has been reset as " + newpwd;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
                sendNotification(customer.email, newpwd);
            }
            else
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = "Your Email or UserName are not match!!";
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
        protected void sendNotification(string email, string newpwd)
        {//simple mail transfer protocol 
            SmtpClient smtpClient = new SmtpClient("smtp.office365.com", 587);
            smtpClient.UseDefaultCredentials = true;
            smtpClient.Credentials = new System.Net.NetworkCredential("bob.marmy.casablanca@outlook.com", "BobMarmy");
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.EnableSsl = true;
            MailMessage mail = new MailMessage();

            //Setting From , To and CC
            mail.From = new MailAddress("bob.marmy.casablanca@outlook.com");
            mail.To.Add(new MailAddress(email));
            mail.Subject = "Reset Password";
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = "Your password has been reset as " + newpwd;
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;
            smtpClient.Send(mail);
        }
    }
}