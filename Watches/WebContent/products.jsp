<!DOCTYPE html>
<%@page import="model.Cart"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Product"%>
<html>
<head>
<title> Shop Watches </title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--jQuery(necessary for Bootstrap's JavaScript plugins)-->
<script src="js/jquery-1.11.0.min.js"></script>
<!--Custom-Theme-files-->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--start-menu-->
<script src="js/simpleCart.min.js"> </script>
<link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/memenu.js"></script>
<script>$(document).ready(function(){$(".memenu").memenu();});</script>	
<!--dropdown-->
<script src="js/jquery.easydropdown.js"></script>			
</head>
<body> 

 <%
	Cart cart = null;
 	if(session.getAttribute("cart")!=null){
 		cart = (Cart) session.getAttribute("cart");
 	}
 	else{
 		cart = new Cart();
 		session.setAttribute("cart", cart);
 	}
	
 %>
	<!--top-header-->
	<div class="top-header">
		<div class="container">
			<div class="top-header-main">
				<div class="col-md-6 top-header-left">
					<div class="drop">
						<div class="box">
							<select tabindex="4" class="dropdown drop">
								<option value="" class="label">Dollar :</option>
								<option value="1">Dollar</option>
								<option value="2">Euro</option>
							</select>
						</div>
						<div class="box1">
							<select tabindex="4" class="dropdown">
								<option value="" class="label">English :</option>
								<option value="1">English</option>
								<option value="2">French</option>
								<option value="3">German</option>
							</select>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="col-md-6 top-header-left">
					<div class="cart box_1">
						<a href="checkout.jsp">
							<div class="total">
								<span class="simpleCart_total"></span></div>
								<img src="images/cart-1.png" alt="" />
						</a>
						<p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>
						<div class="clearfix"> </div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--top-header-->
	<!--start-logo-->
	<div class="logo">
		<a href="index.jsp"><h1> Shop  Watches</h1></a>
	</div>
	<!--start-logo-->
	<!--bottom-header-->
	<div class="header-bottom">
		<div class="container">
			<div class="header">
				<div class="col-md-9 header-left">
				<div class="top-nav">
					<ul class="memenu skyblue"><li class="active"><a href="index.jsp">Home</a></li>
						<li class="grid"><a href="#">Men</a>
							<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>Shop</h4>
										<ul>
											<li><a href="products.jsp">New Arrivals</a></li>
											<li><a href="products.jsp">Blazers</a></li>
											<li><a href="products.jsp">Swem Wear</a></li>
											<li><a href="products.jsp">Accessories</a></li>
											<li><a href="products.jsp">Handbags</a></li>
											<li><a href="products.jsp">T-Shirts</a></li>
											<li><a href="products.jsp">Watches</a></li>
											<li><a href="products.jsp">My Shopping Bag</a></li>
										</ul>
									</div>
									<div class="col1 me-one">
										<h4>Style Zone</h4>
										<ul>
											<li><a href="products.jsp">Shoes</a></li>
											<li><a href="products.jsp">Watches</a></li>
											<li><a href="products.jsp">Brands</a></li>
											<li><a href="products.jsp">Coats</a></li>
											<li><a href="products.jsp">Accessories</a></li>
											<li><a href="products.jsp">Trousers</a></li>
										</ul>	
									</div>
									<div class="col1 me-one">
										<h4>Popular Brands</h4>
										<ul>
											<li><a href="products.jsp">499 Store</a></li>
											<li><a href="products.jsp">Fastrack</a></li>
											<li><a href="products.jsp">Casio</a></li>
											<li><a href="products.jsp">Fossil</a></li>
											<li><a href="products.jsp">Maxima</a></li>
											<li><a href="products.jsp">Timex</a></li>
											<li><a href="products.jsp">TomTom</a></li>
											<li><a href="products.jsp">Titan</a></li>
										</ul>	
									</div>
								</div>
							</div>
						</li>
						<li class="grid"><a href="#">Women</a>
							<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>Shop</h4>
										<ul>
											<li><a href="products.jsp">New Arrivals</a></li>
											<li><a href="products.jsp">Blazers</a></li>
											<li><a href="products.jsp">Swem Wear</a></li>
											<li><a href="products.jsp">Accessories</a></li>
											<li><a href="products.jsp">Handbags</a></li>
											<li><a href="products.jsp">T-Shirts</a></li>
											<li><a href="products.jsp">Watches</a></li>
											<li><a href="products.jsp">My Shopping Bag</a></li>
										</ul>
									</div>
									<div class="col1 me-one">
										<h4>Style Zone</h4>
										<ul>
											<li><a href="products.jsp">Shoes</a></li>
											<li><a href="products.jsp">Watches</a></li>
											<li><a href="products.jsp">Brands</a></li>
											<li><a href="products.jsp">Coats</a></li>
											<li><a href="products.jsp">Accessories</a></li>
											<li><a href="products.jsp">Trousers</a></li>
										</ul>
									</div>
									<div class="col1 me-one">
										<h4>Popular Brands</h4>
										<ul>
											<li><a href="products.jsp">499 Store</a></li>
											<li><a href="products.jsp">Fastrack</a></li>
											<li><a href="products.jsp">Casio</a></li>
											<li><a href="products.jsp">Fossil</a></li>
											<li><a href="products.jsp">Maxima</a></li>
											<li><a href="products.jsp">Timex</a></li>
											<li><a href="products.jsp">TomTom</a></li>
											<li><a href="products.jsp">Titan</a></li>
										</ul>	
									</div>
								</div>
							</div>
						</li>
						<li class="grid"><a href="#">Kids</a>
							<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>Shop</h4>
										<ul>
											<li><a href="products.jsp">New Arrivals</a></li>
											<li><a href="products.jsp">Blazers</a></li>
											<li><a href="products.jsp">Swem Wear</a></li>
											<li><a href="products.jsp">Accessories</a></li>
											<li><a href="products.jsp">Handbags</a></li>
											<li><a href="products.jsp">T-Shirts</a></li>
											<li><a href="products.jsp">Watches</a></li>
											<li><a href="products.jsp">My Shopping Bag</a></li>
										</ul>
									</div>
									<div class="col1 me-one">
										<h4>Style Zone</h4>
										<ul>
											<li><a href="products.jsp">Shoes</a></li>
											<li><a href="products.jsp">Watches</a></li>
											<li><a href="products.jsp">Brands</a></li>
											<li><a href="products.jsp">Coats</a></li>
											<li><a href="products.jsp">Accessories</a></li>
											<li><a href="products.jsp">Trousers</a></li>
										</ul>	
									</div>
									<div class="col1 me-one">
										<h4>Popular Brands</h4>
										<ul>
											<li><a href="products.jsp">499 Store</a></li>
											<li><a href="products.jsp">Fastrack</a></li>
											<li><a href="products.jsp">Casio</a></li>
											<li><a href="products.jsp">Fossil</a></li>
											<li><a href="products.jsp">Maxima</a></li>
											<li><a href="products.jsp">Timex</a></li>
											<li><a href="products.jsp">TomTom</a></li>
											<li><a href="products.jsp">Titan</a></li>
										</ul>	
									</div>
								</div>
							</div>
						</li>
						
						<li class="grid"><a href="contact.jsp">Contact</a>
						</li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="col-md-3 header-right"> 
				<div class="search-bar">
					<input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
					<input type="submit" value="">
				</div>
			</div>
			<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--bottom-header-->
	<!--start-breadcrumbs-->
	<div class="breadcrumbs">
		<div class="container">
			<div class="breadcrumbs-main">
				<ol class="breadcrumb">
					<li><a href="index.jsp">Home</a></li>
					<li class="active">New Products</li>
				</ol>
			</div>
		</div>
	</div>
	<!--end-breadcrumbs-->
	<!--prdt-starts-->
	<div class="prdt"> 
		<div class="container">
			<div class="prdt-top">
				<div class="col-md-12 prdt-left">
					<div class="product-one">
					<% for(Product p : ProductDAO.getAllProduct()){ %>
						<div class="col-md-4 product-left p-left">
							<div class="product-main simpleCart_shelfItem">
								<a href="single.jsp" class="mask"><img class="img-responsive zoom-img" src="images/p-1.png" alt="" /></a>
								<div class="product-bottom">
									<h3><%= p.getName() %></h3>
									<p><%= p.getName_cat() %></p>
									<h4><a class="item_add" href="CartServlet?command=plus&id_pro=<%=p.getId()%>"><i></i></a> <span class=" item_price">$ <%= p.getPrice() %></span></h4>
								</div>
								<div class="srch srch1">
									<span>-50%</span>
								</div>
							</div>
						</div>
						<%} %>
						
						<div class="clearfix"></div>
					</div>
				
				</div>	
				
				
		</div>
	</div>
	<!--product-end-->
	<!--information-starts-->
	<div class="information">
		<div class="container">
			<div class="infor-top">
				<div class="col-md-3 infor-left">
					<h3>Follow Us</h3>
					<ul>
						<li><a href="#"><span class="fb"></span><h6>Facebook</h6></a></li>
						<li><a href="#"><span class="twit"></span><h6>Twitter</h6></a></li>
						<li><a href="#"><span class="google"></span><h6>Google+</h6></a></li>
					</ul>
				</div>
				<div class="col-md-3 infor-left">
					<h3>Information</h3>
					<ul>
						<li><a href="#"><p>Specials</p></a></li>
						<li><a href="#"><p>New Products</p></a></li>
						<li><a href="#"><p>Our Stores</p></a></li>
						<li><a href="contact.jsp"><p>Contact Us</p></a></li>
						<li><a href="#"><p>Top Sellers</p></a></li>
					</ul>
				</div>
				<div class="col-md-3 infor-left">
					<h3>My Account</h3>
					<ul>
						<li><a href="account.jsp"><p>My Account</p></a></li>
						<li><a href="#"><p>My Credit slips</p></a></li>
						<li><a href="#"><p>My Merchandise returns</p></a></li>
						<li><a href="#"><p>My Personal info</p></a></li>
						<li><a href="#"><p>My Addresses</p></a></li>
					</ul>
				</div>
				<div class="col-md-3 infor-left">
					<h3>Store Information</h3>
					<h4>Datvietsoftware
						<span>To ky.</span>
						Quang Trung Software Company.</h4>
					<h5>0123456789</h5>	
					<p><a href="mailto:example@email.com">Nguyenngocvu969@gmail.com</a></p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--information-end-->
	<!--footer-starts-->
	<div class="footer">
		<div class="container">
			<div class="footer-top">
				<div class="col-md-6 footer-left">
					<form>
						<input type="text" value="Enter Your Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter Your Email';}">
						<input type="submit" value="Subscribe">
					</form>
				</div>
				<div class="col-md-6 footer-right">					
					<p>Copyright © 2017 All Rights Reserved | Design by  <a href="#" target="_blank">Shop Watches</a> </p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--footer-end-->	
</body>
</html>