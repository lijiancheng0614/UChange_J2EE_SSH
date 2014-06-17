<%@include file="header.jsp"%>
<%@page import="uchange.models.*"%>

<%@page import="com.opensymphony.xwork2.ActionContext"%>

<%
	Person me = (Person) ActionContext.getContext().getSession()
			.get("person");
%>
<div class="container-fluid">
	<div class="row-fluid">
		<h1>Received Request</h1>

		<p />
		<ul class="nav nav-tabs nav-stacked">
			<%
				DAO dao = new DAO();
				List<Request> l = dao.findAll(Request.class);
				for (Request r : l)
					if (r.getItem().getId() == me.getItemNow().getId()) {
			%>
			<li><a
				href="item_detail.jsp?itemID=<%=r.getPerson().getItemNow().getId()%>">
					<%=r.getPerson().getFirstName()%> <%=r.getPerson().getLastName()%>
					(<%=r.getPerson().getStudentId()%>) -- <%=r.getPerson().getItemNow().getName()%></a>
			</li>
			<%
				}
			%>
		</ul>
	</div>
</div>

<%@include file="footer.htm"%>