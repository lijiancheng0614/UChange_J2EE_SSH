<%@include file="header.jsp"%>
<%@page import="uchange.models.*"%>

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span8">
			<h1>
				<s:property value="#session.person.getFirstName()" />
				<s:property value="#session.person.getLastName()" />
			</h1>
			<h4>
				Student ID:
				<s:property value="#session.person.getStudentId()" />
			</h4>
			<h4>
				Email:
				<s:property value="#session.person.getEmail()" />
			</h4>
		</div>

		<div class="span4" style="background-color:#FFF6EC">
			<ul class="nav nav-tabs nav-stacked">
				<li><a href="edit_profile.jsp">Edit My Profile</a>
				</li>
			</ul>
		</div>
	</div>
</div>

<%@include file="footer.htm"%>