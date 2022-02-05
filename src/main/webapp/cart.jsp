<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart-EPharmacy</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

      <style >
      		*{
		      margin:0px;
		      padding:0px;
	 	      box-sizing:border-box;
	       }
      		body::before{
      		   content:"";
      		   background:url("photos/pharm3.jpeg")no-repeat center center/cover;
      		   width:100%;
      		   height:100%;
      		   position:absolute;
      		   top:0px;left:0px;
      		   z-index:-1; 
      		   opacity:0.6; 
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
		    .your_order{
				
					    
		    }
		    .your_order button{
		          position: absolute;
    /* float: right; */
                 right: 0;
                width: 8em;
                 margin: 20px 20px;
                
                font-size: 18px;
               background: green;
	  	    }
	  	    .order{
				Border:1px solid white;	  	    
	  	    }
	  	    .order div{
	  	        margin-left:20px;
	  	        line-height:30px;
	  	    }
	  	    .order div p{
	  	        margin-bottom:0px;
	  	        
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
	          <a class="nav-link " href="med.jsp"><b>Medcines</b></a>
	        </li>
	         <li class="nav-item">
	          <a class="nav-link" href="health_care.jsp"><b>Healthcare products</b></a>
	        </li>
	         <li class="nav-item">
	          <a class="nav-link active" href="cart.jsp"><i  class="fas fa-cart-plus" ><b>Cart</b></i></a>
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
    <div class="your_order">
    	<button type="button" class="btn btn-secondary"data-bs-toggle='modal' data-bs-target='#your_order'>Your orders</button>
    
    </div>
	<div class="medicine_section mt-2">
		<h1 style="text-align:center; font-family:merithwater; font-weight:35px; color:black;font-weight:bold; margin-top:80px;">Cart</h1>
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
           String ordermess=(String)request.getAttribute("ordermess");
           if(ordermess!=null){
        %>
        <p style="color:green; margin-top:2px; font-size:15px;text-align:center;font-weight:bold;    margin-bottom: 0px;"><%=ordermess%></p>
       <%
           }
        %>
     	<div class="box1 ">
          <div class="row justify-content-center" style="width: 100%;">
		     <div class="table-responsive-lg">
			    <table class="col-lg-8 col-10 col-sm-12 table  p-3 shadow-lg m-auto">
				  <thead class="thead">
					 <tr>
						<th >Product id</th><th>Product Name</th>
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
     	  					
     	  					 String qry="select * from cart";
     	  					 rs=st.executeQuery(qry);
     	  					if(rs.next()==false){
     	  	     	 %>
     	  	     	       	  	<tr><p style="color:green; text-align:center">No items currently available in cart.</p></tr>
     	  	     	 <%
     	  	     	       	 }else{
     	  	     	       	  	do{
     	  			 %>
     	  			        <tr>
     							<td><%=rs.getInt(1) %></td><<td><%=rs.getString(2) %></td>
     							<td><%=rs.getDouble(3) %></td><td><%=rs.getDouble(4) %></td>
     							<td><%=rs.getString(5) %></td><td style="width: 150px;">
	     							<button type="button" class="btn btn-danger badge" data-bs-toggle='modal' data-bs-target='#remove'>remove</button></td>
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
	       <%
	     if(!name.equals("admin@gmail.com")){
	    
	       out.println("<button type='button' class='btn btn-success add_item mt-2' data-bs-toggle='modal' data-bs-target='#order'>Place your order</button>");
	    
	     }
	     %>
	     </div>
	     
	     
	     <!-- Button trigger modal -->


		
      
      <div class="modal fade " id="remove" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content" style="width:30em;">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">Confirm remove?</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body" style="display:flex; justify-content:center;align-items:center;">
		        <form class="form col-lg-8 col-sm-12 shadow-lg  " action="delete_cart" method="post">
					          
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
		
		
		<!-- Order modal-->
		<div class="modal fade " id="order" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">Place your Order</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form class="form col-lg-8 col-sm-12 shadow-lg  m-auto " action="order" method="post">
					          
					          <div class="form-group m-2">
					              <label for="name">Name:</label>
					              <input type="text" name="name" placeholder="Enter your person" class="form-control mt-1">
					          </div>
					          <div class="form-group m-2">
									<label for="phone">Phone:</label>
									<input type="number" name="phone" class="form-control mt-1" placeholder="Enter your phone">
								</div>
			          	      
								<div class="form-group m-2">
									<label for="address">Address:</label>
									<textarea  name="address" class="form-control mt-1" placeholder="Enter your Address"></textarea>
								</div>
								
								
								<div class="form-group m-2">
									<label for="pincode">Pincode:</label>
									<input type="number" name="pincode" class="form-control mt-1" placeholder="Enter pincode">
								</div>
								
								<div class=" row justify-content-center buttons-set ">
									<button type="submit" class="col-4 btn btn-outline-success ">Order</button>
									<button type="reset" class="col-4 btn btn-outline-danger" data-bs-dismiss="modal">Close</button>
								</div>
      				 </form>
		      </div>
		      
		    </div>
		  </div>
		</div>
		
		
		<!-- Your orders modal --
			<!-- Modal -->
			<div class="modal fade" id="your_order" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h4 class="modal-title" id="staticBackdropLabel">Order details</h4>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			      <%
			          
			         
					  if(ordermess!=null){
						 	      

     	  				 try{
     	  					Class.forName("com.mysql.cj.jdbc.Driver");
     	  					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/pharmacy","root","root123");
     	  					Statement st1=con.createStatement();
     	  					
     	  					// String qry1="select concat(product_name,',') from cart";
     	  					   // ResultSet rs1=st1.executeQuery(qry1);
     	  					    
     	  					    
     	  					 String qry2="select price from cart";
     	  					    ResultSet rs2=st1.executeQuery(qry2);
     	  					   //String items="";
								//if(rs1.next()){
								//	items=rs1.getString(0);
								///}else{
								//	items="no items selected";
								//}
     	  					    double sum=0;
     	  					  while(rs2.next()){
     	  						  sum=sum+rs2.getDouble("price");
     	  					  }
     	  					 
     	  					 String NAME=(String)session.getAttribute("name");
     	  					String PHONE=(String)session.getAttribute("phone");
     	  					String ADDRESS=(String)session.getAttribute("address");
     	  					String PINCODE=(String)session.getAttribute("pincode");
     	  					
     	  			%>
     	  			
     	  			    <div class="order">
			              <div class="name">
			                 <p>Name: <%=NAME %></p>
			              </div>
			              <div class="phone">
			                 <p>Phone no: <%=PHONE %></p>
			              </div>
			              <div class="address">
			              		<p>Address: <%=ADDRESS %></p>
			              </div>
			              <div class="pincode">
			              		<p>Pincode: <%=PINCODE %></p>
			              </div>
			              <div class="order_type">
			                     <p>Order type: Cash on delivery</p>
			              </div>
			              <!-- 
			              <div class="ordered-items">
			                      <p>Ordered items: </p>   
			              </div>
			               
			              
			               -->

			              
     					  <div class="amount">
			                      <p>Total amount: Rs.<%=sum %></p>
			              
			              </div>
			          </div>
     	  			<%	     
     	  				  }catch(Exception ex){}
     				%>
     				
			          
			          <p style="color:green; text-align:center; margin:0px;">Your items will be delivered within 3 days.</p>
			      </div>
			      <%}else{
			    	   out.println("<h5 style='text-align:center;color:red;'>No orders have been placed.</h5>");
			      }
			      
			      %>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
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