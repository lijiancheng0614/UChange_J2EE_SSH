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
/*
 * form - sign in
 * --------------------------------------------------
 */
.form-signin {
	max-width: 50%;
	min-width: 200px;
	margin: 40px auto 20px;
	text-align: center;
	background-color: #FCFCFA;
	padding-top: 40px;
	padding-bottom: 40px;
	padding-left: 100px;
	border-radius: 20px;
	-webkit-box-shadow: 0 0 30px rgba(0, 0, 0, 0.5);
	-moz-box-shadow: 0 0 30px rgba(0, 0, 0, 0.5);
	box-shadow: 0 0 30px rgba(0, 0, 0, 0.5);
	border-radius: 20px;
}

.form-signin .form-signin-heading {
	margin-bottom: 10px;
}

.form-signin .checkbox,.form-signin label,.form-signin textarea,.form-signin input
	{
	height: auto;
	padding: 4px 4px;
}

.form-signin label {
	margin-left: -16%;
}

.form-signin .controls {
	margin-left: -50%;
}

body {
	background-color: #F2F5FF;
}

div,label {
	font-size: 16px;
}
</style>
</head>

<body>

	<div class="container" align="center">
		<form class="form-horizontal form-signin" method="post"
			action="registerAction" name="registerAction">
			<h2>
				<img src="images/logo-small.png" style="margin-right: 40px">Register
			</h2>
			<br />
			<s:if test="hasActionErrors()">
				<div class="alert alert-error" style="margin-right:100px">
					<s:actionerror />
				</div>
			</s:if>
			<div class="control-group">
				<label class="control-label" for="studentId">Student ID</label>
				<div class="controls">
					<input type="text" id="studentId" name="studentId" required
						autofocus>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="firstName">First Name</label>
				<div class="controls">
					<input type="text" id="firstName" name="firstName">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="lastName">Last Name</label>
				<div class="controls">
					<input type="text" id="lastName" name="lastName">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="email">Email</label>
				<div class="controls">
					<input type="text" id="email" name="email">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="password">Password</label>
				<div class="controls">
					<input type="password" id="password" name="password" required>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="password1">Password again</label>
				<div class="controls">
					<input type="password" id="password1" name="password1" required>
				</div>
			</div>
			<br />
			<button type="submit" class="btn submit btn-primary">Submit</button>
		</form>
	</div>

</body>
</html>
