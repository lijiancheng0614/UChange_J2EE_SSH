<%@include file="header.jsp"%>

<div class="container-fluid">
	<div class="row-fluid">
		<h1>Edit Profile</h1>

		<p>If you do not want to change password, leave 'password' empty.</p>

		<form action="editProfileAction" name="editProfileAction"
			method="post">
			<s:if test="hasActionErrors()">
				<div class="alert alert-error" style="margin-right:100px">
					<s:actionerror />
				</div>
			</s:if>
			<div class="span2" align="right" style="line-height: 280%">
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
			<div class="span9">
				<p>
					<input type="text" name='firstName'
						value="<s:property value="#session.person.getFirstName()" />">
				</p>

				<p>
					<input type="text" name='lastName'
						value="<s:property value="#session.person.getLastName()" />">
				</p>

				<p>
					<input type="password" name='password'>
				</p>

				<p>
					<input type="password" name='password1'>
				</p>

				<p>
					<input type="text" name='email'
						value='<s:property value="#session.person.getEmail()" />'>
				</p>
			</div>
			<div class="span10 offset2">
				<br />
				<button type="submit" class="btn submit btn-primary">Submit</button>
			</div>
		</form>
	</div>
</div>

<%@include file="footer.htm"%>