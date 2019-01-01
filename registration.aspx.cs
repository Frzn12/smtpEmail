using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Web.Services;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using ASPSnippets.FaceBookAPI;
using System.Web.Script.Serialization;
using ASPSnippets.GoogleAPI;
using System.Data;
using System.Diagnostics;

namespace MTLjoodoh
{
	public partial class WebForm1 : System.Web.UI.Page
	{

		protected static string ReCaptcha_Key = "6Lfm-3YUAAAAAMtRSw2v23NCUNIew5GthWj2T59s";
		protected static string ReCaptcha_Secret = "6Lfm-3YUAAAAAHiGVsocdrR7EYTCEkp6oJ5Jwbxb";

		[WebMethod]
		public static string VerifyCaptcha(string response)
		{
			string url = "https://www.google.com/recaptcha/api/siteverify?secret=" + ReCaptcha_Secret + "&response=" + response;
			return (new WebClient()).DownloadString(url);
		}

		protected void Page_Load(object sender, EventArgs e)
		{
			
		}
		protected void Button1_Click(object sender, EventArgs e)
		{

			SqlConnection sql = new SqlConnection("Data Source=192.168.0.101;Initial Catalog=MTL;User ID=farzana;Password=farzana123; MultipleActiveResultSets=true");

			//to check if the account already exist
			SqlCommand ask = new SqlCommand("SELECT participantsID FROM Participants WHERE  email = @email", sql);//retrieve data from db first.
			SqlParameter par = new SqlParameter();
			par.ParameterName = "@email";//initialize parameter 
			par.Value = emailbox.Text;//initialize parameter from textbox
			ask.Parameters.Add(par);//to initialize that sql command with parameter from textbox.

			//to get sqldatareader to read the data in order to execute it from sqlcommand.
			//to check existence in db
			sql.Open();
			SqlDataReader read = ask.ExecuteReader();
			if (read.HasRows)
			{
				String msg = "Account already existed";
				ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + msg + "');", true);
				sql.Close();
			}

			else
			{
				using (sql)
				{
					string message = string.Empty;

					//account is not yet registered
					String query = " INSERT INTO Participants(participantsName,gender,icno,maritalStatus,email,password) VALUES( @1  ,   @2   ,  @3  ,  @4  ,  @5 ,  @6); SELECT SCOPE_IDENTITY() ";//insert into db

					SqlCommand comm = new SqlCommand();
					comm.CommandText = query;
				
					comm.Parameters.AddWithValue("@1", namebox.Text);
					comm.Parameters.AddWithValue("@2", genderbox.Text);
					comm.Parameters.AddWithValue("@3", icnobox.Text);
					comm.Parameters.AddWithValue("@4", statusbox.Text);
					comm.Parameters.AddWithValue("@5", emailbox.Text);
					comm.Parameters.AddWithValue("@6", pswrd.Text);
					comm.Connection = sql;
					int participantsID = Convert.ToInt32(comm.ExecuteScalar());
					comm.ExecuteNonQuery();
					sql.Close();// dispose sql connection to db
					SendActivationEmail(participantsID);//call method sendmail 
														//pop up to show successfully registered
					ScriptManager.RegisterStartupScript(this, this.GetType(),
					"alert",
					"alert('Successfully registered! A verification email has been sent into your mail box.');window.location ='homepage.aspx';", true);
				}
			}
		}

		private void SendActivationEmail(int participantsID)
		{
			SqlConnection sql = new SqlConnection("Data Source=192.168.0.101;Initial Catalog=MTL;User ID=farzana;Password=farzana123; MultipleActiveResultSets=true");
			string activationCode = Guid.NewGuid().ToString();
			using (sql)
			{
				using (SqlCommand cmd = new SqlCommand("INSERT INTO accountactivation VALUES(@participantsID, @activationCode)"))
				{
					using (SqlDataAdapter sda = new SqlDataAdapter())
					{
						cmd.CommandType = CommandType.Text;
						cmd.Parameters.AddWithValue("@participantsID", participantsID);
						cmd.Parameters.AddWithValue("@activationCode", activationCode);
						cmd.Connection = sql;
						sql.Open();
						cmd.ExecuteNonQuery();
						sql.Close();
						
					}
				}
			}
			try
			{
				using (MailMessage mm = new MailMessage("farzanaaqla@gmail.com", emailbox.Text))
				{
					mm.Subject = "Account Activation";
					string body = "Hello " + namebox.Text.Trim() + ",";
					body += "<br /><br />Please click the following link to activate your account";
					body += "<br /><a href = '" + Request.Url.AbsoluteUri.Replace("registration.aspx", "verification.aspx?ActivationCode=" + activationCode) + "'>Click here to activate your account.</a>";
					body += "<br /><br />Thanks";
					mm.Body = body;
					mm.IsBodyHtml = true;
					SmtpClient smtp = new SmtpClient();
					smtp.Host = "smtp.gmail.com";
					smtp.EnableSsl = true;
					NetworkCredential NetworkCred = new NetworkCredential("farzanaaqla@gmail.com", "uchiha12");
					smtp.UseDefaultCredentials = true;
					smtp.Credentials = NetworkCred;
					smtp.Port = 587;
					smtp.Send(mm);
				}

			}
			catch (Exception ex)
			{
				Console.WriteLine(ex);
			}

		}

		
	}
}

