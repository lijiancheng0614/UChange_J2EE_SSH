<%@include file="header.jsp"%>
<%@page import="uchange.models.*"%>
<%@page import="java.sql.Timestamp"%>

<%
	DAO dao = new DAO();
	Integer personID = Integer.parseInt(request
			.getParameter("personID"));
	Person person = (Person) dao.findById(Person.class, personID);
%>
<div class="container-fluid">
	<div class="row-fluid">
		<h1>
			Exchange History of <a
				href="profile.jsp?personID=<%=person.getId()%>"><%=person.getFirstName()%>
				<%=person.getLastName()%></a>
		</h1>

		<p />

		<h4><%=person.getItemOriginal().getName()%></h4>

		<%
			List<Deal> l = dao.findByProperty(Deal.class, "p2", person);
			int i;
			for (i = 0; i < l.size(); ++i) {
		%>
		<p>
			<font size=3> --> <%=l.get(i).getDealTime().toLocaleString()%></font>
		</p>
		<h4><%=l.get(i).getItem().getName()%></h4>
		<%
			}
		%>
	</div>
</div>

<%@include file="footer.htm"%>