<%@page import="dao.ProductDAO"%>
<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Admin MOS Template</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Copyright" content="arirusmanto.com">
<meta name="description" content="Admin MOS Template">
<meta name="keywords" content="Admin Page">
<meta name="author" content="Ari Rusmanto">
<meta name="language" content="Bahasa Indonesia">

<link rel="shortcut icon" href="stylesheet/img/devil-icon.png"> <!--Pemanggilan gambar favicon-->
<link rel="stylesheet" type="text/css" href="/Watches/admin/mos-css/mos-style.css"> <!--pemanggilan file css-->
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div id="wrapper">
	
<jsp:include page="menu.jsp"></jsp:include>

	<div id="rightContent">
	<a href="/Watches/admin/insert_product.jsp" class="btn btn-success">Add new product</a>
<table class="data">
			<tr class="data">
				<th class="data" width="30px">ID</th>
				<th class="data">Name</th>
				<th class="data">Category Name</th>
				<th class="data">Description</th>
				<th class="data" >Price</th>
				<th class="data" width="75px"></th>
			</tr>
			<%for(Product p : ProductDAO.getAllProduct()){ %>
			<tr class="data">
				<td class="data" width="30px"><%=p.getId() %></td>
				<td class="data"><%=p.getName() %></td>
				<td class="data"><%=p.getName_cat() %></td>
				<td class="data"><%=p.getDesctiption() %></td>
				<td class="data" width="75px"><%=p.getPrice()%></td>
				<td class="data" width="75px">
				<center>
				<a href="/Watches/ProductServlet?id=<%=p.getId() %>&command=delete">Delete</a>&nbsp;&nbsp;&nbsp;
				<a href="/Watches/admin/update_product.jsp?id=<%=p.getId() %>"><img src="/Watches/admin/mos-css/img/detail.png"></a>
				</center>
				</td>
			</tr>
			<%} %>
		</table>
</div>
	
<div class="clear"></div>

</div>
</body>
</html>