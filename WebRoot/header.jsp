<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
								<h4 class="text-right">
									<s:property value="#session.person.getStudentId()" />
								</h4>
							</div>
						</div>
					</div>
				</td>
			</thead>
			<tbody>
				<tr>
					<td style="border-top-style:none">
						<button class="btn btn-large" type="button">
							<a href="home.jsp" style="text-decoration:none">Home</a>
						</button>
						<button class="btn btn-large" type="button">
							<a href="item_list.jsp" style="text-decoration:none">Item
								list</a>
						</button>
						<button class="btn btn-large" type="button">
							<a href="myrequest.jsp" style="text-decoration:none">My
								request</a>
						</button>
						<button class="btn btn-large" type="button">
							<a href="request_list.jsp" style="text-decoration:none">Received
								request</a>
						</button>
						<button class="btn btn-large" type="button">
							<a href="index.jsp" style="text-decoration:none">Log out</a>
						</button>
					</td>
				</tr>
				<tr>
					<td>