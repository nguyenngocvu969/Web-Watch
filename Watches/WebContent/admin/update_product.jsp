<%@page import="dao.ProductDAO"%>
<%@page import="model.Product"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="model.Category"%>
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
<%
	Product p = null;
String sl = "";
	if(request.getParameter("id")!=null){
		p = ProductDAO.getProductByid(Integer.parseInt(request.getParameter("id")));
	}
%>
<jsp:include page="header.jsp"></jsp:include>

<div id="wrapper">
	
<jsp:include page="menu.jsp"></jsp:include>

	<div id="rightContent">
	<h3>Insert product</h3>
	
		<form action="/Watches/ProductServlet" method="post">
		<input type="hidden" name="command" value="update">
		<input type="hidden" name="id" value="<%=p.getId()
		%>">
		<table width="95%">
			<tr><td><b>Name product: </b></td><td><input type="text" name="name" value="<%=p.getName() %>" class="panjang"></td></tr>
			<tr><td><b>Category: </b></td><td>
				<select class="panjang" name="id_cat">
				<%for(Category c: CategoryDAO.getAllCategory()){ %>
					<%if(c.getId()==p.getId_cat()){ %>
					<option value="<%=c.getId()%>" selected><%= c.getName() %></option>
					<%}else{ %>
					<option value="<%=c.getId()%>" ><%= c.getName() %></option>
					<%}} %>
				</select>
			</td></tr>
			<tr><td><b>Description: </b></td><td><input type="text" name="description" value="<%=p.getDesctiption() %>" class="panjang"></td></tr>
			<tr><td><b>Price: </b></td><td><input type="number" name="price" value="<%=p.getPrice() %>" class="panjang"></td></tr>
			<tr><td></td><td>
			<input type="submit" class="button" value="Submit">
			</td></tr>
		</table>
		</form>
	</div>
	
<div class="clear"></div>

</div>
</body>
</html>