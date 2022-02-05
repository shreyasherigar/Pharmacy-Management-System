<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>home page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <style>
       .bg img{
          width:100%;
          height:600px;
       }
    
    </style>
</head>
<body>
	
   <div class="container-fluid">
	<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
			<a href="home.html" class="navbar-brand"><img style="height:80px;width:150px" src="photos/logo.jpg" alt="logo"></a>
			<div class="collapse navbar-collapse" id="place">
			<div class="collapse navbar-collapse"id="place">
 				 <div class="container-fluid align:center">
				<ul class="navbar-nav ms-auto">
				
					<li class="navbar-item active" id="menu-gap">
						<a href="home.jsp" class="navbar-link btn btn-light badge-pill active">Home</a>
					</li>
					<li class="navbar-item" id="menu-gap">
						<a href="med.jsp" class="navbar-link btn btn-light badge-pill">Medicines</a>
					</li>
					<li class="navbar-item" id="menu-gap">
						<a href="health_care.jsp" class="navbar-link btn btn-light badge-pill">Health care products</a>
					</li>
					
					</ul>
					</div>
					<ul class="navbar-nav ms-auto">
				
					<li class="navbar-item" id="menu-gap">
						<a href="cart.jsp" class="navbar-link btn btn-light badge-pill">Cart</a>
					</li>
					<li class="navbar-item" id="menu-gap">
						<a href="index.jsp" class="navbar-link btn btn-light badge-pill">Logout</a>
					</li>
				</ul>
				
			</div>
		</div>
	</nav>
	   <div class="bg">
 		 <img src="photos/bg2.PNG" alt="image">
	   </div>
	   
	   <h1>Online Pharmacy store</h1>
	  <hr>
	  <div class="item">
	     
	  
	  </div>
 	</div>
 	 <%    
         String name=(String)session.getAttribute("user");
	  
         if(name!=null&&name.length()!=0){{
        	 session.setAttribute("username",name);
         }
     %>
      <h1><%=name %></h1>
   			 <!--  <div class="col-sm">
   		 			<div class="card col-lg-6 col-sm-8">
  					<img src="photos/pimg4.jpeg" class="card-img-top" alt="...">
					<div class="card-body">
   				    <h5 class="card-title">Medicine</h5>
    				<a href="#" class=" btn btn-success">Order</a>
  					</div>
					</div>	
				</div>
				<div class="col-sm">
					<div class="card col-lg-8 col-sm-8">
  					<img src="photos/himg1.jpeg" class="card-img-top" alt="...">
					<div class="card-body">
   				    <h5 class="card-title">Healthcare Products</h5>
    				<a href="m2.html" class=" btn btn-success">Order</a>
  					</div>
					</div>   -->
					
				
						
				
		<%
         }else{
        	 response.sendRedirect("index.jsp");
         }
	%>
		
	
</body>
</html>
