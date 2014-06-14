<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
			<div class="span3"></div>
			<div class="span6 field">
				<h2>
					<img src="images/logo-small.png" style="margin-right: 40px">Register
				</h2>
				<div style="margin-top: 50px;padding-right: 50px">
					<form method="post" action="registerAction" name="registerAction">
						<div class="span5" align="right" style="line-height: 188%">
							<p>
								<strong>Username:</strong>
							</p>

							<p>
								<strong>First Name:</strong>
							</p>

							<p>
								<strong>Last Name:</strong>
							</p>

							<p>
								<strong>Password:</strong>
							</p>

							<p>
								<strong>Password again:</strong>
							</p>

							<p>
								<strong>Email:</strong>
							</p>
						</div>
						<div class="span5">
							<input type="text" name='studentId' required autofocus> <input
								type="text" name='firstName'> <input type="text"
								name='lastName'> <input type="password" name='password'
								required> <input type="password" name='password1'
								required> <input type="text" name='email'>
						</div>
						<div class="span12">
							<br /> <br />
							<button type="submit" class="btn submit btn-primary">Submit</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
