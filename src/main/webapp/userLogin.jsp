<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!Doctype html>
<html>
<head>
<link rel="stylesheet"href="style.css">

<meta charset="ISO-8859-1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	
	<title>Login</title>
</head>
<body>
	<form action="userLogin" method="post" style="width: 371px;height: 537px;">
	<div>
	</div>
		<h1>Customer Login</h1>
		<div class="textBox">
			<input type="text" class="form-control" name="email" placeholder="Email address" required="required">
		</div>
		<div class="textBox">
            <input type="password" class="form-control" name="password" placeholder="Password" required="required">
        </div>
		<!--  <input type="submit"value="Login" class="loginbtn">
		<div class="signup">-->
		<div class="signup">
            <button type="submit" class="btn btn-success btn-lg btn-block">Login</button>
        </div>
        <div class="mt-4" style="color:white;">
			Don't have an account??
		</div>
		<a href="register.jsp">Sign up</a>
	<%
	    String mess=(String)request.getAttribute("mess0");
	   if(mess!=null){
	%>
	   <p style="color:red;"><%=mess %></p>
	 <%
	 } %>
	 <%
	    String mess1=(String)request.getAttribute("mess1");
	   if(mess1!=null){
	%>
	   <p style="color:green;"><%=mess1 %></p>
	 <%
	 } %>
	</form>
</body>
</html>