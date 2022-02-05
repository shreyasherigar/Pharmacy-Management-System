<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!Doctype html>
<html>
<head>
<style>
		*{
	font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
	margin: 0;
	padding: 0;
	text-decoration: none;
	box-sizing: border-box;
		
}
 

body{
	min-height:75ch;
	background-image:url(photos/pharm5.jfif);
	
}
form{
	text-align: center;
	background-color:grey;
	width:350px;
	height: 500px;
	padding: 75px 50px;
	position:absolute;
	left:50%;
	top:50%;
	transform: translate(-50%,-50%);
}
h1{
	align-self: center;
	margin-bottom: 45px;

}
.textBox{
	
	position: relative;
	margin: 35px 0;
	color:grey;
}
.textBox input {
	
	outline: none;
	width:100%;
	font-size: medium;

}
.loginbtn{
	height: 60px;
	width:500%;
	border:none;
	
	font-size: 8px;
}
.loginbtn:hover{
	background-position: right;
}
.signup{
	color:black;
	margin-top: 45px;
	text-align: center;

}
.signup a{
	color: black;
}

</style>

<meta charset="ISO-8859-1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	
	<title>Admin Login</title>
</head>
<body>
	<form action="adminLogin" method="post">
	
		<h1>Admin Login</h1>
		<div class="TextBox mt-4">
			<input type="text" class="form-control" name="email" placeholder="Email address" required="required">
		</div>
		<div class="TextBox mt-4">
            <input type="password" class="form-control" name="password" placeholder="Password" required="required">
        </div>
		<!--  <input type="submit"value="Login" class="loginbtn">
		<div class="signup">-->
		<div class="signup">
            <button type="submit" class="btn btn-success btn-lg btn-block">Login</button>
        </div>
        <%
           String mess=(String)request.getAttribute("mess");
           
           if(mess!=null){
        %>
           <p style="color:red; margin-top:20px; font-size:18px;font-weight:bold;"><%=mess%></p>
        <%
           }
        %>
	</form>
</body>
</html>