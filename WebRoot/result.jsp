<%@include file="header.jsp"%>
<%@page import="uchange.models.*"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>

<div class="container-fluid">
	<div class="row-fluid">
		<h1>My Exchange Result</h1>

		<p />
		<%
			DAO dao = new DAO();
			List<Person> allPerson = dao.findAll(Person.class);
			int p2 = 0;
			int p3 = 0;
			Person p = (Person) ActionContext.getContext().getSession()
					.get("person");
			if (p.getItemNow().getId() != p.getItemOriginal().getId()) {
				for (p2 = 0; p2 < allPerson.size(); ++p2)
					if (allPerson.get(p2).getItemNow().getId() == p
							.getItemOriginal().getId())
						break;
				for (p3 = 0; p3 < allPerson.size(); ++p3)
					if (allPerson.get(p3).getItemOriginal().getId() == p
							.getItemNow().getId())
						break;
		%>
		<h4>
			You should give
			<a href="item_detail.jsp?itemID=<%=p.getItemOriginal().getId()%>"><%=p.getItemOriginal().getName()%></a>
			to <a href="profile.jsp?personID=<%=allPerson.get(p2).getId()%>"><%=allPerson.get(p2).getFirstName()%>
				<%=allPerson.get(p2).getLastName()%> (<%=allPerson.get(p2).getStudentId()%>)</a>
		</h4>
		<h4>
			You can get 
			<a href="item_detail.jsp?itemID=<%=p.getItemNow().getId()%>"><%=p.getItemNow().getName()%></a>
			from <a href="profile.jsp?personID=<%=allPerson.get(p3).getId()%>"><%=allPerson.get(p3).getFirstName()%>
				<%=allPerson.get(p3).getLastName()%> (<%=allPerson.get(p3).getStudentId()%>)</a>
		</h4>
		<%
			} else {
		%>
		<h4>No Exchange Needed.</h4>
		<%
			}
		%>
	</div>
</div>

<%@include file="footer.htm"%>