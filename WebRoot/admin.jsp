<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@page import="uchange.models.*"%>
<%
	DAO dao = new DAO();
	List<Control> l = dao.findAll(Control.class);
	Control control = l.get(0);
	int ResultSwitch = control.getResultSwitch();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<base href="<%=basePath%>">

<title>UChange</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/bootstrap.css" />
<style type="text/css">
body {
	background-color: #F2F5FF;
}

p,h1,h2,h3,h4 {
	line-height: 150%;
}

table {
	background-color: #FCFCFA;
	margin-top: 20px;
	-webkit-box-shadow: 0 0 30px rgba(0, 0, 0, 0.5);
	-moz-box-shadow: 0 0 30px rgba(0, 0, 0, 0.5);
	box-shadow: 0 0 30px rgba(0, 0, 0, 0.5);
}

td {
	-webkit-box-shadow: 0 0 4px rgba(0, 0, 0, 0.5);
	-moz-box-shadow: 0 0 4px rgba(0, 0, 0, 0.5);
	box-shadow: 0 0 4px rgba(0, 0, 0, 0.5);
}

a {
	color: #DB7E56;
}
</style>
</head>

<body>
	<script src="http://code.jquery.com/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
	<div class="container" align="center" style="margin-top: 20px">
		<table class="table table-bordered" style="border-radius: 20px">
			<thead>
				<td
					style="border-top-left-radius: 20px;border-top-right-radius: 20px">
					<div class="container-fluid">
						<div class="row-fluid">
							<div class="span8">
								<img src="images/logo.png">
							</div>
							<div class="span4">
								<h4 class="text-right">admin</h4>
							</div>
						</div>
					</div></td>
			</thead>
			<tbody>
				<tr>
					<td style="border-top-style:none">
						<button class="btn btn-large" type="button">
							<a href="index.jsp" style="text-decoration:none">Log out</a>
						</button></td>
				</tr>
				<tr>
					<td>
						<div class="container-fluid">
							<div class="row-fluid">
								<form method="post" action="resultSwitchAction"
									name="resultSwitchAction">
									<p>
										Result Switch State:
										<%=ResultSwitch%></p>
									<button type="submit" class="btn submit btn-warning">Result
										Switch</button>
								</form>
								<h1>Item List</h1>

								<p />
								<ul class="nav nav-tabs nav-stacked">
									<%
										List<Item> itemList = dao.findAll(Item.class);
										for (Item item : itemList) {
									%>
									<li><%=item.getName()%></li>
									<%
										}
									%>
								</ul>
								<hr />
								<h1>Exchange Result Board</h1>

								<p />
								<%
									List<Person> allPerson = dao.findAll(Person.class);
									int p2 = 0;
									for (Person p : allPerson)
										if (p.getItemNow().getId() != p.getItemOriginal().getId()) {
											for (p2 = 0; p2 < allPerson.size(); ++p2)
												if (allPerson.get(p2).getItemNow().getId() == p
														.getItemOriginal().getId())
													break;
								%>
								<h4>
									<a href="profile.jsp?personID=<%=p.getId()%>"> <%=p.getFirstName()%>
										<%=p.getLastName()%> (<%=p.getStudentId()%>)</a> should give <a
										href="item_detail.jsp?itemID=<%=p.getItemOriginal().getId()%>"><%=p.getItemOriginal().getName()%></a>
									to <a
										href="profile.jsp?personID=<%=allPerson.get(p2).getId()%>"><%=allPerson.get(p2).getFirstName()%>
										<%=allPerson.get(p2).getLastName()%> (<%=allPerson.get(p2).getStudentId()%>)</a>
								</h4>
								<%
									}
								%>
							</div>
						</div> <%@include file="footer.htm"%>