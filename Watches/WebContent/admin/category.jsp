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
<jsp:include page="header.jsp"></jsp:include>

<div id="wrapper">
	
<jsp:include page="menu.jsp"></jsp:include>

	<div id="rightContent">
	<a href="/Watches/admin/insert_category.jsp" class="btn btn-success">Add new category</a>
<table class="data">
			<tr class="data">
				<th class="data" width="30px">id</th>
				<th class="data">Name</th>
				<th class="data"></th>
			</tr>
			<%for(Category c : CategoryDAO.getAllCategory()){ %>
			<tr class="data">
				<td class="data" width="30px"><%=c.getId() %></td>
				<td class="data" style="text-align: center;"><%= c.getName() %></td>
				<td class="data" width="75px">
				<center>
				<a href="/Watches/CategoryServlet?id=<%=c.getId() %>&command=delete">Delete</a>&nbsp;&nbsp;&nbsp;
				<a href="/Watches/admin/update_category.jsp?id=<%=c.getId() %>"><img src="/Watches/admin/mos-css/img/detail.png"></a>
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