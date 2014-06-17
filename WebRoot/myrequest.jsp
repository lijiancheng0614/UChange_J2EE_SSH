<%@include file="header.jsp"%>
<%@page import="uchange.models.*"%>

<%@page import="com.opensymphony.xwork2.ActionContext"%>

<%
	Person me = (Person) ActionContext.getContext().getSession()
			.get("person");
%>

<div class="container-fluid">
	<div class="row-fluid">
		<h1>My Request</h1>

		<p />
		<ul class="nav nav-tabs nav-stacked">
			<%
				DAO dao = new DAO();
				List<Request> l = dao.findByProperty(Request.class, "person", me);
				for (Request r : l) {
			%>
			<li><a href="item_detail.jsp?itemID=<%=r.getItem().getId()%>"><%=r.getItem().getName()%></a>
			</li>
			<%
				}
			%>
		</ul>
	</div>
</div>
<%@include file="footer.htm"%>