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
				for (Item item : l) {
			%>
			<li><a href="item_detail.jsp?itemID=<%=item.getId()%>"> <%=item.getName()%>
			</a>
			</li>
			<%
				}
			%>
		</ul>
	</div>
</div>

<%@include file="footer.htm"%>