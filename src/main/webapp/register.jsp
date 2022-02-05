<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
<title>Registration Form</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style>
	body {
		background-image:url(photos/pharm5.jfif);
	
		min-height:75ch;
	}
	form{
	text-align: center;
	background-color:black;
	width:350px;
	height: 500px;
	padding: 75px 50px;
	position:absolute;
	left:50%;
	top:50%;
	transform: translate(-50%,-50%);
     }
     h2{
     	color:white;
     }
     .form-group{
	height:45px;
	width:100%;
	border:none;
	
	font-size: 10px;
	}
</style>
</head>
<body>
<div class="signup-form">
    <form action="UserRegister" method="post">
		<h2>Register</h2>
		<p class="hint-text" style="color:white;">Create your account.</p>
        <div class="form-group">
		
				<input type="text" class="form-control" name="username" placeholder="Name" required="required">
				
		        	
        </div>
        <div class="form-group">
        	<input type="email" class="form-control" name="email" placeholder="Email" required="required">
        </div>
		<div class="form-group">
            <input type="password" class="form-control" name="password" placeholder="Password" required="required">
        </div>
		<div class="form-group">
            <input type="password" class="form-control" name="confirm_password" placeholder="Confirm Password" required="required">
        </div>        
		<div class="form-group">
            <button type="submit" class="btn btn-success btn-lg btn-block">Register Now</button>
        </div>
        <%
           String mess=(String)request.getAttribute("mess1");
           if(mess!=null){
        %>
            <p Style="Password:ze"><%=mess %></p>
        <%
           }
        %>
	<div class="text-center mt-4" style="color:white;">Already have an account? <a href="userLogin.jsp">Sign in</a></div>
	</form>
</div>
</body>
</html>
