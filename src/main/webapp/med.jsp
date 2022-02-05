<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Medicines</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

      <style >
      		
      		body::before{
      		   content:"";
      		   background:url("photos/iimg.jpeg")no-repeat center center/cover;
      		   width:100%;
      		   height:100%;
      		   position:absolute;
      		   top:0px;left:0px;
      		   z-index:-1; 
      		   opacity:0.8; 
      		}
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
				
      		thead{
       			 background-color:rgba(250,250,250,0.5);
      		}
      		  thead th{
       			 color:black;
  			  }
  			  tbody{
  			  	background-color:rgba(0,0,0,0.5);
  			  }
  			  
   			 tbody td{
      				color:white;
   			 }
    	   tbody :hover{
       			 color:white;
      			 background-color:black;
   			 }
   			 .modal-content{
				   background-color:#282828;
				   color:white;
				   border-radius:10px; 
				}
				.modal-dialog{
				   
				   max-width: 600px;
			       margin: 1.75rem auto;
			       
				
				}
				.m-auto {
			      margin: none!important;
			    }
			    
			    .form{
			      width:100%;
			      display: flex;
				    justify-content: center;
				    align-items: center;
				    flex-direction: column;
			    }
				.form-group{
				  width:500px;
				}
				.buttons-set{
				  display:flex;
				  flex-direction:row;
				    margin: 10px;
			       padding: 10px;
			       width:100%;
				}
				.buttons-set button{
				   margin:10px;
				   padding:5px;
				}
				.add_item{
					    display: flex;
                        justify-content: center;
                    align-items: center;
                    margin: auto;
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
          <a class="nav-link " aria-current="page" href="home.jsp"><b>Home</b></a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="med.jsp"><b>Medcines</b></a>
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
	<div class="medicine_section mt-2">
		<h1 style="text-align:center; font-family:merithwater; font-weight:35px; color:black;font-weight:bold;margin-top:80px;">Medicines available</h1>
          <%
           String mess=(String)request.getAttribute("mess1");
           
           if(mess!=null){
        %>
           <p style="color:green; margin-top:2px; font-size:15px;text-align:center;font-weight:bold;    margin-bottom: 0px;"><%=mess%></p>
        <%
           }
        %>
        <%
           String mess1=(String)request.getAttribute("delmess");
           
           if(mess1!=null){
        %>
           <p style="color:red; margin-top:2px; font-size:15px;text-align:center;font-weight:bold;    margin-bottom: 0px;"><%=mess1%></p>
        <%
           }
        %>
        
        <%
           String mess2=(String)request.getAttribute("cart_mess");
           
           if(mess2!=null){
        %>
           <p style="color:green; margin-top:2px; font-size:15px;text-align:center;font-weight:bold;    margin-bottom: 0px;"><%=mess2%></p>
        <%
           }
        %>
     	<div class="box1">
          <div class="row justify-content-center" style="width: 100%;">
		     <div class="table-responsive-lg">
			    <table class="col-lg-8 col-10 col-sm-12 table  p-3 shadow-lg mx-auto">
				  <thead class="thead">
					 <tr>
						<th >Product id</th><th>Medicine Name</th>
						<th>Price</th><th>Weight in mg</th><th style="width: 150px;">Expiry date</th><th></th>
						
					 </tr>
				  </thead>
				  <tbody class="tbody" >
							<%
     	  				// String pin=request.getParameter("search");
     	  				// System.out.println(pin);
     	  				 
     	  				
     	  				 Statement st=null;
     	  				 ResultSet rs=null;
     	  				
     	  				
     	  				 try{
     	  					Class.forName("com.mysql.cj.jdbc.Driver");
     	  					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/pharmacy","root","root123");
     	  					st=con.createStatement();
     	  					
     	  					 String qry="select * from medicines";
     	  					 rs=st.executeQuery(qry);
     	  					if(rs.next()==false){
     	  	     	 %>
     	  	     	       	  	<tr><p style="color:green; text-align:center">No items currently available.</p></tr>
     	  	     	 <%
     	  	     	       	 }else{
     	  	     	       	  	do{
     	  			 %>
     	  			        <tr>
     							<td><%=rs.getInt(1) %></td><<td><%=rs.getString(2) %></td>
     							<td><%=rs.getDouble(3) %></td><td><%=rs.getDouble(4) %></td>
     							<td><%=rs.getString(5) %></td><td style="width: 150px;">
     							<%if(name.equals("admin@gmail.com")) {%>
	     							
	     							  <button type="button" class="btn btn-danger badge" data-bs-toggle='modal' data-bs-target='#remove'>remove</button></td>
	     							
	     						<%}else{
	     							%>
	     							<form action="Add_to_cart_med" method="post">
	     							
	     							  <button type="button" class="btn btn-success badge" data-bs-toggle='modal' data-bs-target='#product_id'>Add to cart</button></td>
	     							 </form>
	     							<%
	     							}
	     							%>
	     						
     						 </tr>
     				<%
     	  	     	       	  	}while(rs.next());
     	      	     	  		     }
     	  				  }catch(Exception ex){}
     	  				
     				%>
					
				  </tbody>
			    </table>
			
			
		     </div>
	     </div>
	     </div>
	     <%
	     if(name.equals("admin@gmail.com")){
	    
	       out.println("<button type='button' class='btn btn-success add_item' data-bs-toggle='modal' data-bs-target='#addItems'>Add items</button>");
	    
	     }
	     %>
	     
     </div>
	
	  
		
		<!-- Add items -->
			<div class="modal fade " id="addItems" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">Add items</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form class="form col-lg-8 col-sm-12 shadow-lg  m-auto" action="medicine" method="post">
					          
					          <div class="form-group m-2">
					              <label for="product_id">Product id:</label>
					              <input type="number" name="product_id" placeholder="Enter product id" class="form-control mt-1">
					          </div>
					          <div class="form-group m-2">
									<label for="name">Medicine name:</label>
									<input type="text" name="name" class="form-control mt-1" placeholder="Enter Medicine name">
								</div>
			          	      <div class="form-group m-2">
					              <label for="price" >Price:</label>
					              <input type="number" name="price" placeholder="Enter the price" class="form-control mt-1">
					          </div>
								<div class="form-group m-2">
					              <label for="weight" >Weight in mg:</label>
					              <input type="number" name="weight" placeholder="Enter weight in miligrams" class="form-control mt-1">
					          </div>
								
								
								<div class="form-group m-2">
									<label for="Expiry_date">Expiry date:</label>
									<input type="date" name="Expiry_date" class="form-control mt-1" placeholder="Enter the expire date of the product">
								</div>
								
								<div class=" row justify-content-center buttons-set ">
									<button type="submit" class="col-4 btn btn-outline-success ">Add </button>
									<button type="reset" class="col-4 btn btn-outline-danger" data-bs-dismiss="modal">Close</button>
								</div>
      				 </form>
		      </div>
		      
		    </div>
		  </div>
		</div>
		
		
		<div class="modal fade " id="product_id" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content" style="width:30em;">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">Add to cart</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body" style="display:flex; justify-content:center;align-items:center;">
		        <form class="form col-lg-8 col-sm-12 shadow-lg  " action="Add_to_cart_med" method="post">
					          
					          <div class="form-group m-2" style="width:380px;">
					              <label for="product_id">Product id:</label>
					              <input type="number" name="product_id" placeholder="Enter product id" class="form-control mt-1">
					          </div>
								
								<div class=" row justify-content-center buttons-set ">
									<button type="submit" class="col-4 btn btn-outline-success ">Add </button>
									<button type="reset" class="col-4 btn btn-outline-danger" data-bs-dismiss="modal">Close</button>
								</div>
      				 </form>
		      </div>
		      
		    </div>
		  </div>
		</div>
		
		<div class="modal fade " id="remove" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content" style="width:30em;">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">Confirm remove?</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body" style="display:flex; justify-content:center;align-items:center;">
		        <form class="form col-lg-8 col-sm-12 shadow-lg  " action="delete_med" method="post">
					          
					          <div class="form-group m-2" style="width:380px;">
					              <label for="product_id">Product id:</label>
					              <input type="number" name="product_id" placeholder="Enter product id" class="form-control mt-1">
					          </div>
								
								<div class=" row justify-content-center buttons-set ">
									<button type="submit" class="col-4 btn btn-outline-success ">remove </button>
									<button type="reset" class="col-4 btn btn-outline-danger" data-bs-dismiss="modal">Close</button>
								</div>
      				 </form>
		      </div>
		      
		    </div>
		  </div>
		</div>
		<%
         }else{
        	 response.sendRedirect("index.jsp");
         }
	%>
</body>
</html>