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

.field {
	background-color: #FCFCFA;
	margin: 20px;
	padding-top: 40px;
	padding-bottom: 40px;
	border-radius: 20px;
	-webkit-box-shadow: 0 0 30px rgba(0, 0, 0, 0.5);
	-moz-box-shadow: 0 0 30px rgba(0, 0, 0, 0.5);
	box-shadow: 0 0 30px rgba(0, 0, 0, 0.5);
}

div {
	font-size: 16px;
}
</style>
</head>

<body>
	<div class="container" align="center">
		<div class="row-fluid" style="margin-top: 40px">
			<div class="span2"></div>
			<div class="span8 field">
				<h2>
					<img src="images/logo-small.png" style="margin-right: 40px">Add
					Item
				</h2>
				<br />

				<form action="init_item" name="init_item" method="post">
					<div class="span3" align="right" style="line-height: 180%">
						<p>
							<strong>name:</strong>
						</p>

						<p>
							<strong>description:</strong>
						</p>
					</div>
					<div class="span7" align="left">
						<input type="text" name='name' />
						<textarea rows="20" cols="20" name='description'
							style="width:100%"></textarea>
					</div>
					<div class="span12">
						<br />
						<button type="submit" class="btn submit btn-primary">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
