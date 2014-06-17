<%@include file="header.jsp"%>
<%@page import="uchange.models.*"%>
<%@page import="java.sql.Timestamp"%>

<%
	DAO dao = new DAO();
	Integer itemID = Integer.parseInt(request.getParameter("itemID"));
	Item item = (Item) dao.findById(Item.class, itemID);
%>

<div class="container-fluid">
	<div class="row-fluid">
		<h1>
			Exchange History of <a
				href="item_detail.jsp?itemID=<%=item.getId()%>"><font
				color=#DB7E56><%=item.getName()%></font> </a>
		</h1>

		<p />
		<%
			List<Deal> l = dao.findByProperty(Deal.class, "item", item);
			if (l.size() > 0) {
				int i;
				for (i = 0; i < l.size(); ++i) {
		%>
		<h4><%=l.get(i).getP1().getFirstName()%>
			<%=l.get(i).getP1().getLastName()%>
			(<%=l.get(i).getP1().getStudentId()%>)
		</h4>

		<p>
			<font size=3> --> <%=l.get(i).getDealTime().toLocaleString()%></font>
		</p>
		<%
			}
		%>
		<h4><%=l.get(i-1).getP2().getFirstName()%>
			<%=l.get(i-1).getP2().getLastName()%>
			(<%=l.get(i-1).getP2().getStudentId()%>)
		</h4>
		<%
			}
		%>
	</div>
</div>

<%@include file="footer.htm"%>