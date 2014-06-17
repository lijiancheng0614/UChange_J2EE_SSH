<%@include file="header.jsp"%>
<%@page import="uchange.models.*"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>

<div class="container-fluid">
	<div class="row-fluid">
		<form method="post" action="resultSwitchAction"
			name="resultSwitchAction">
			<button type="submit" class="btn submit btn-primary">ResultSwitch</button>
		</form>

		<h1>Exchange Result Board</h1>

		<p />
		<%
			DAO dao = new DAO();
			List<Person> allPerson = dao.findAll(Person.class);
			int p2 = 0;
			for (Person p : allPerson)
				if (p.getItemNow().getId() != p.getItemOriginal().getId()) {
					for (p2 = 0; p2 < allPerson.size(); ++p2)
						if (allPerson.get(p2).getItemNow().getId() == p
								.getItemOriginal().getId())
							break;
		%>
		<h4>
			<a href="profile.jsp?personID=<%=p.getId()%>"> <%=p.getFirstName()%>
				<%=p.getLastName()%> (<%=p.getStudentId()%>)</a> should give <a
				href="item_detail.jsp?itemID=<%=p.getItemOriginal().getId()%>"><%=p.getItemOriginal().getName()%></a>
			to <a href="profile.jsp?personID=<%=allPerson.get(p2).getId()%>"><%=allPerson.get(p2).getFirstName()%>
				<%=allPerson.get(p2).getLastName()%> (<%=allPerson.get(p2).getStudentId()%>)</a>
		</h4>
		<%
			}
		%>
	</div>
</div>
<%@include file="footer.htm"%>