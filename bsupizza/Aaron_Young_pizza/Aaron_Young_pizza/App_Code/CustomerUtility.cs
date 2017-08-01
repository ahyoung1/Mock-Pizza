using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Aaron_Young_pizza.App_Code
{
    public class CustomerUtility{
        public string userName { get; set; }
        public string fName { get; set; }
        public string lName { get; set; }
        public string email { get; set; }
        public string country { get; set; }
        public string password { get; set; }
        public string age { get; set; }
        public char gender { get; set; }
        public CustomerUtility(){
      
        }
        public void insertData(){
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["pizzaDB"].ConnectionString);
            conn.Open();
            string insertString = "insert into Customer (UserName, FName, LName, Email, Country, Password, Age, Gender) values (@UserName, @FName, @LName, @Email, @Country, @Password, @Age, @Gender)";
            SqlCommand cmd = new SqlCommand(insertString, conn);
            cmd.Parameters.AddWithValue("@UserName", userName);
            cmd.Parameters.AddWithValue("@FName", fName);
            cmd.Parameters.AddWithValue("@LName", lName);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Country", country);
            cmd.Parameters.AddWithValue("@Password", EncryptPassword.encryptString(password));
            cmd.Parameters.AddWithValue("@Age", Convert.ToInt32(age));
            cmd.Parameters.AddWithValue("@Gender", gender);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public bool isRegistered()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["pizzaDB"].ConnectionString);
            conn.Open();
            string checkUser = "select * from Customer where UserName=@userName";
            SqlCommand cmd = new SqlCommand(checkUser, conn);
            cmd.Parameters.AddWithValue("@userName", userName);
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
                ///SOMETHING HERERERERERERE????????
                dr.Close();
                conn.Close();
                return true;
            }
            else
            {
                dr.Close();
                conn.Close();
                return false;
            }
        }
        public bool checkPassword()
        {
            String hashedPassword = EncryptPassword.encryptString(password);
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["pizzaDB"].ConnectionString);
            conn.Open();
            string checkUser = "select * from Customer where UserName=@userName";
            SqlCommand cmd = new SqlCommand(checkUser, conn);
            cmd.Parameters.AddWithValue("@userName", userName);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read()){
                    if (dr["Password"].ToString().Equals(hashedPassword))
                    //ERROR HERE????
                    {
                        dr.Close();
                        conn.Close();
                        return true;
                    }
                    else
                    {
                        dr.Close();
                        conn.Close();
                        return false;
                    }
            }
            //should proooooooobably have something else here
            dr.Close();
            conn.Close();
            return false;
        }
        public CustomerUtility getUser(string userName)
        {
            CustomerUtility customer = new CustomerUtility();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["pizzaDB"].ConnectionString);
            conn.Open();
            string checkUser = "select UserName, FName, LName, Email, Country, [Password], Age, Gender from Customer where UserName=@userName";
            SqlCommand comd = new SqlCommand(checkUser, conn);
            comd.Parameters.AddWithValue("@userName", userName);
            SqlDataReader dr = comd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
                customer.userName = dr[0].ToString();
                customer.fName = dr[1].ToString();
                customer.lName = dr[2].ToString();
                customer.email = dr[3].ToString();
                customer.country = dr[4].ToString();
                customer.password = dr[5].ToString();
                customer.age = dr[6].ToString();
                customer.gender = dr[7].ToString().ToCharArray()[0];
            }
            dr.Close();
            conn.Close();
            return customer;
        }
        public void resetPassword(string newpwd)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["pizzaDB"].ConnectionString);
            conn.Open();
            string checkUser = "update Customer set Customer.Password = @password where Customer.UserName = @userName";
            SqlCommand comd = new SqlCommand(checkUser, conn);
            comd.Parameters.AddWithValue("@userName", userName);
            comd.Parameters.AddWithValue("@password", EncryptPassword.encryptString(newpwd));
            comd.ExecuteNonQuery();
            conn.Close();
        }
    }
}