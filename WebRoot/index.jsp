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
	if (l.size() == 0) {
		Control control = new Control();
		control.setResultSwitch(0);
		dao.save(control);
	}
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
	padding: 40px;
	border-radius: 20px;
	-webkit-box-shadow: 0 0 30px rgba(0, 0, 0, 0.5);
	-moz-box-shadow: 0 0 30px rgba(0, 0, 0, 0.5);
	box-shadow: 0 0 30px rgba(0, 0, 0, 0.5);
}
</style>
</head>

<body>
	<div class="container" align="center">
		<div class="row-fluid" style="margin-top: 40px">
			<img src="images/logo.png">

			<p />

			<div class="span3"></div>
			<div class="span6 field">
				<form action="loginAction" name="loginAction" method="post">
					<s:if test="hasActionErrors()">
						<div class="alert alert-error">
							<s:actionerror />
						</div>
					</s:if>
					<p>
						<input type="text" placeholder="username" name='studentId'
							required autofocus>
					</p>

					<p>
						<input type="password" placeholder="password" name='password'
							required>
					</p>

					<button type="submit" class="btn submit btn-primary"
						style="margin-right: 30px">Login</button>
					<button class="btn" type="button" style="margin-left: 30px">
						<a href="register.jsp" style="text-decoration:none">Sign Up</a>
					</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
