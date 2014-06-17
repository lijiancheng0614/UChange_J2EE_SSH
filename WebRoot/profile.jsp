<%@include file="header.jsp"%>
<%@page import="uchange.models.*"%>

<%
	DAO dao = new DAO();
	Integer personID = Integer.parseInt(request
			.getParameter("personID"));
	Person person = (Person) dao.findById(Person.class, personID);
%>

<div class="container-fluid">
	<div class="row-fluid">
		<h1><%=person.getFirstName()%>
			<%=person.getLastName()%></h1>

		<p />
		<h4>
			Item Owned Now: <a
				href="item_detail.jsp?itemID=<%=person.getItemNow().getId()%>"><%=person.getItemNow().getName()%></a>
		</h4>
		<h4>
			Student ID:
			<%=person.getStudentId()%></h4>
		<h4>
			Email:
			<%=person.getEmail()%></h4>

		<p />
		<li><h4>
				<a href="person_history.jsp?personID=<%=person.getId()%>">Exchange
					History</a>
			</h4></li>
	</div>
</div>

<%@include file="footer.htm"%>