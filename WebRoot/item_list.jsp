<%@include file="header.jsp"%>
<%@page import="uchange.models.*"%>

<div class="container-fluid">
	<div class="row-fluid">
		<h1>Item List</h1>

		<p />
		<ul class="nav nav-tabs nav-stacked">
			<%
				DAO itemDAO = new DAO();
				List<Item> l = itemDAO.findAll(Item.class);
				for (int i = 0; i < l.size(); i++) {
			%>
			<li><a
				href="item_detail.jsp?itemID=<%=l.get(i).getId()%>">
					<%=l.get(i).getName()%> </a>
			</li>
			<%
				}
			%>
		</ul>
	</div>
</div>

<%@include file="footer.htm"%>