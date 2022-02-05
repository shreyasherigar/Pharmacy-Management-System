<%@page import="java.sql.*" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

<title>Pharm plus homepage</title>
<style>
	.navbar{
	font-size:16px;
	top:0;
	left:0;
	}
	.navbar-light .navbar-nav .nav-link{
		padding:0 20px;
		color:black;
		transition:0.3s ease;
	}
	.navbar-light .navbar-nav .nav-link :hover,
	.navbar-light .navbar-nav .nav-link.active{
	color:green;
	}
	.navbar-light .navbar-toggler {
	border:none;
	outline:none;
	}
	#bar{
		font-size:1.5rem;
		padding:0 7px;
		cursor:pointer;
		font-weight:500;
		transition:0.3s ease;
		color:green;
	}
	#bar:hover,
	#bar.active{
		color:white;
	}
	.header-content{
		
		color:white;
		text-align:center;
	}
	.header-content h2{
	font-size:4vmin;
	}
	.line{
		width:150px;
		height:4px;
		background:green;
		margin:10px auto;
	}
	.header-content h1{
		font-size:7vmin;
		margin-top:250px;
		}
		#home{
		width:100vw;
		height:100vh;
		background-image:url(photos/iimg.jpeg);
		background-position:top 60px center;
		background-size:cover;
		display:flex;
		align-item:flex-end;
		justify-content:center;
		}
		footer{
		background-color:black;
		}
		footer h5 {
			color:whitesmoke;
			font-weight:700;
			font-size:1.5rem;
		}
		footer h6 {
			color:whitesmoke;
			font-weight:700;
			font-size:1.0rem;
		}
		footer p{
			color:#999;
			font-size:0.8rem;
		}
			 .user_profile{
			         color: white;
			    display: flex;
			    justify-content: center;
			    align-items: center;
			    position: absolute;
			    margin: 18px 10px 10px 10px;
			    background:rgba(0,0,0,0.4);
			    border-radius:20px;
			        position: absolute;
    			top: 80px;
			         
			    }
				.user_profile img{
		     	 width:50px;
		     	 height:50px;
		     	 border:2px solid black;
		     	 border-radius:100%;
		     	 transition:all 0.2s ease-in-out;
		     	 
		    }
		    .user_profile .name{
		         margin: 3px;
		        font-family: merithwater;
		        /* font-weight: bold; */
		         font-size: 20px;
		         padding:5px 10px;
		       
		    }
		    .user_profile:hover{
		       
		        background-color:#6a6a6a66;
		        color:black;
		    }
		    .user_profile img:hover{
		    	transform:scale(1.2);
		    }
</style>
</head>
<body>
<%    
         String name=(String)session.getAttribute("user");
	  
         if(name!=null&&name.length()!=0){{
        	 session.setAttribute("username",name);
         }
     %>
	<nav class="navbar navbar-expand-lg navbar-light bg-light py-3 fixed-top">
  		<div class="container-fluid">
  		 <img src="photos/logo1.PNG" width=60px alt="">
       <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span><i id="bar"class="fal fa-bars"></i></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home.jsp"><b>Home</b></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="med.jsp"><b>Medcines</b></a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="health_care.jsp"><b>Healthcare products</b></a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="cart.jsp"><i  class="fas fa-cart-plus" ><b>Cart</b></i></a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="index.jsp"><b>Logout</b></a>
        </li>
       </ul>
       
    </div>
  </div>
</nav>
<div class="user_profile">
     	     <div class="logo">
     	        
     	        <img alt="user" src="photos/user2.png" >
     	     </div>
     	     <div class="name">
     	         <%=name %>
     	     </div>
    </div>
<section id="home">
		<div class="header-content">
			<h1>Pharm plus</h1>
			<div class="line"></div>
			<h2>Effective Medicines with home delivery</h2>
		</div>
	</section>
	<section id="brand"class="container">
	<div class="row">
		<img class="img-fluid col-lg-2 col-md-4 col-sm-6"src="photos/himage1.jpeg"alt="">
		<img class="img-fluid col-lg-2 col-md-4 col-sm-6"src="photos/himage2.jpeg"alt="">
		<img class="img-fluid col-lg-2 col-md-4 col-sm-6"src="photos/himage3.jpeg"alt="">
		<img class="img-fluid col-lg-2 col-md-4 col-sm-6"src="photos/himage4.jpeg"alt="">
		<img class="img-fluid col-lg-2 col-md-4 col-sm-6"src="photos/himage5.jpeg"alt="">
		<img class="img-fluid col-lg-2 col-md-4 col-sm-6"src="photos/himage6.jpeg"alt="">
	</div>
	</section>
	<section id="featured"clas="mt-5 py-5">
		<div class="container text-center mt-4 py-5">
			<hr>
		</div>
		<div class="row mx-auto container-fluid">
			<div class="product text-center col-lg-3 col-md-4 col-sm-12">
				<img class="img-fluid mb-3"src="photos/simg3.jpeg"alt="">
				<h5 class="p-name">Revital H</h5>
				<h4 class="p=price">$550.00</h4>
				<a href="health_care.jsp"><button type="button" class="btn btn-success">Buy Now</button></a>
				</div>
				<div class="product text-center col-lg-3 col-md-4 col-sm-12">
				<img class="img-fluid mb-3"src="photos/simg1.jpeg"alt="">
				<h5 class="p-name">Eltroxin 100 mcg Tablet </h5>
				<h4 class="p=price">$132.87</h4>
				<a href="med.jsp"><button type="button" class="btn btn-success">Buy Now</button></a>
				</div>
				<div class="product text-center col-lg-3 col-md-4 col-sm-12">
				<img class="img-fluid mb-3"src="photos/simg2.jpeg"alt="">
				<h5 class="p-name">Asthalin 100mcg Inhaler</h5>
				<h4 class="p=price">$106.88</h4>
				<a href="med.jsp"><button type="button" class="btn btn-success">Buy Now</button></a>
				</div>
				<div class="product text-center col-lg-3 col-md-4 col-sm-12">
				<img class="img-fluid mb-3"src="photos/simg4.jpeg"alt="">
				<h5 class="p-name">Protein Plus</h5>
				<h4 class="p=price">484.00</h4>
				<a href="health_care.jsp"><button type="button" class="btn btn-success">Buy Now</button></a>
				</div>
		</div>
	</section>
	<footer class="mt-4 py-5">
		<div class="row container mx-auto pt-4">
			<div class="footer-one col-lg-3 col-md-6 col-sm-12">
				<h5 class=pb-2>Contact us</h5>
				<div>
				<h6 class="text-uppercase">Address</h6>
				<p>udupi-576101</p>
				</div>
				<div>
				<h6 class="text-uppercase">phone</h6>
				<p>(+91)8152990056</p>
				</div>
				<div>
				<h6 class="text-uppercase">Email</h6>
				<p>dshreya000@gmail.com</p>
				</div>
			</div>
		</div>
	</footer>
		<%
         }else{
        	 response.sendRedirect("index.jsp");
         }
	%>
</body>
</html>