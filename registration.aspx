<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="MTLjoodoh.WebForm1" %>

<!DOCTYPE html>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
<script src="script.js" type="text/javascript"></script>
<link href="style.css" rel="stylesheet" />

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src='https://www.google.com/recaptcha/api.js'></script>
	<script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
	<meta name="google-signin-client_id" content="399176930580-bo9litns3ih7d4t2pi3h1ru4tk58rvf0.apps.googleusercontent.com" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="script.js"></script>
    <script src="scripts/angular-resource.min.js"></script>
	<title>Registration | MTL</title>
	<link href="w3.css" rel="stylesheet" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body class="register">
	<div class="w3-bar w3-border w3-black">
		<a href="#" class="w3-bar-item w3-button">Personality Test</a>
		<a href="#" class="w3-bar-item w3-button">Wedding Planner</a>
		<a href="login.aspx" class="w3-bar-item w3-button w3-black w3-right">Login</a>
	</div>
	<div id="fb-root"></div>
	<script>(function (d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) return;
			js = d.createElement(s); js.id = id;
			js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.2&appId=632704617125812&autoLogAppEvents=1';
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));</script><br /><br />
	<form id="form1" runat="server">

        <div class="formregister" style="align-content:center;">
		<div class="h1">
			<asp:Label ID="headerReg" runat="server" CssClass="head" Font-Bold="True" Font-Overline="False" Font-Size="XX-Large" Font-Strikeout="False" Text="Registration"></asp:Label>
			</div>
    	<p>			
			<asp:Label ID="Label2" runat="server" Font-Overline="True" Font-Strikeout="False" Text="Name" CssClass="form-group"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:TextBox ID="namebox" runat="server"  BackColor="#99CCFF"  ValidateRequestMode="Enabled" BorderStyle="None" Height="38px" Width="366px" BorderColor="#FFCCFF" ></asp:TextBox>
			<asp:RequiredFieldValidator runat="server" Text="*Required" ControlToValidate="namebox" Display="Dynamic"></asp:RequiredFieldValidator>	
		</p>
			<p>
				<asp:Label ID="Label3" runat="server" BorderStyle="None" Font-Overline="True" Font-Size="Medium" Text="Gender"></asp:Label>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:DropDownList ID="genderbox" runat="server" BackColor="#99CCFF" Font-Overline="False" BorderStyle="None" Height="38px" Width="366px">
				<asp:ListItem>-Gender-</asp:ListItem>
				<asp:ListItem>Male</asp:ListItem>
				<asp:ListItem>Female</asp:ListItem>
			</asp:DropDownList>
				<asp:RequiredFieldValidator runat="server" Text="*Required" ControlToValidate="genderbox" Display="Dynamic"></asp:RequiredFieldValidator>
				
			</p>
			<p>
				<asp:Label ID="Label4" runat="server" BorderStyle="None" Font-Overline="True" Font-Strikeout="False" Text="IC Number"></asp:Label>
				&nbsp;
				<asp:TextBox ID="icnobox" runat="server"  BackColor="#99CCFF" BorderStyle="None" Height="38px" Width="366px"></asp:TextBox>
				<asp:RequiredFieldValidator runat="server" Text="*Required" ControlToValidate="icnobox" Display="Dynamic"></asp:RequiredFieldValidator>
			</p>
			<p>
				<asp:Label ID="Label5" runat="server" BorderStyle="None" Font-Overline="True" Text="Marital Status"></asp:Label>
				&nbsp;
			<asp:DropDownList ID="statusbox" runat="server"  BackColor="#99CCFF" CausesValidation="True" EnableTheming="True" BorderStyle="None" Height="38px" Width="366px">
				<asp:ListItem>-Status-</asp:ListItem>
				<asp:ListItem>Single</asp:ListItem>
				<asp:ListItem>Married</asp:ListItem>
				<asp:ListItem>Divorce</asp:ListItem>
			</asp:DropDownList>
				<asp:RequiredFieldValidator runat="server" Text="*Required" ControlToValidate="icnobox" Display="Dynamic"></asp:RequiredFieldValidator>
				
			</p>
			<p>
				<asp:Label ID="Label7" runat="server" Font-Overline="True" Text="Email"></asp:Label>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:TextBox ID="emailbox" runat="server"  TextMode="Email" BackColor="#99CCFF" BorderColor="#000099" BorderStyle="None" Height="35px" Width="364px"></asp:TextBox>
				<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="emailbox" ErrorMessage="Invalid email address" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
				<asp:RequiredFieldValidator runat="server" Text="*Required" ControlToValidate="emailbox" Display="Dynamic"></asp:RequiredFieldValidator>
			</p>
			<p>
				<asp:Label ID="Label8" runat="server" Font-Overline="True" Text="Password"></asp:Label>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:TextBox ID="pswrd"  runat="server" BackColor="#99CCFF" BorderStyle="None" Height="36px" Width="365px" TextMode="Password"></asp:TextBox>
				<asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="pswrd" ErrorMessage="Minimum length is 8" Display="Dynamic"></asp:CustomValidator>
				<asp:RequiredFieldValidator runat="server" Text="*Required" ControlToValidate="pswrd" Display="Dynamic"></asp:RequiredFieldValidator>
			</p>
		</div>
		<br />
			<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
			<script type="text/javascript" src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
				async defer></script>
			<!--widget-->
			<script type="text/javascript">
				var onloadCallback = function () {
					grecaptcha.render('dvCaptcha', {
						'sitekey': '6Lfm-3YUAAAAAMtRSw2v23NCUNIew5GthWj2T59s',
						'callback': function (response) {
							$.ajax({
								type: "POST",
								url: "registration.aspx/VerifyCaptcha",
								data: "{response: '" + response + "'}",
								contentType: "application/json; charset=utf-8",
								dataType: "json",
								success: function (r) {
									var captchaResponse = jQuery.parseJSON(r.d);
									if (captchaResponse.success) {
										$("[id*=txtCaptcha]").val(captchaResponse.success);
										$("[id*=rfvCaptcha]").hide();
									} else {
										$("[id*=txtCaptcha]").val("");
										$("[id*=rfvCaptcha]").show();
										var error = captchaResponse["error-codes"][0];
										$("[id*=rfvCaptcha]").html("RECaptcha error. " + error);
									}
								}
							});
						}
					});
				};
	
			</script>
			<div id="dvCaptcha">
			</div>
			<asp:TextBox ID="txtCaptcha" runat="server" Style="display: none" />
			
			<script>
				{
					"success": true | false,
						"challenge_ts": timestamp,  // timestamp of the challenge load (ISO format yyyy-MM-dd'T'HH:mm:ssZZ)
							"hostname": string;         // the hostname of the site where the reCAPTCHA was solved
								
				}
			</script>
			<br />
		<p>
			<asp:Button ID="Button1" runat="server" BackColor="#00CCFF" BorderStyle="None" Height="38px" Width="366px" Text="Submit"   Font-Size="Large" OnClick="Button1_Click" />
			
		</p>
		
		<br />
		
	
	</form>
	
		<footer class="w3-container w3-padding-64 w3-center w3-opacity">
			<div class="w3-xlarge w3-padding-32">
				<i class="fa fa-facebook-official w3-hover-opacity"></i>
				<i class="fa fa-instagram w3-hover-opacity"></i>
				<i class="fa fa-snapchat w3-hover-opacity"></i>
				<i class="fa fa-pinterest-p w3-hover-opacity"></i>
				<i class="fa fa-twitter w3-hover-opacity"></i>
				<i class="fa fa-linkedin w3-hover-opacity"></i>
			</div>
		</footer>
</body>
</html>
