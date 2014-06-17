<%@include file="header.jsp"%>
<%@page import="uchange.models.*"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>

<%
	Person person = (Person) ActionContext.getContext().getSession()
			.get("person");
	DAO dao = new DAO();
	List<Request> allRequest = dao.findAll(Request.class);

	int numMyRequest = 0;
	int numReceivedRequest = 0;
	for (Request r : allRequest) {
		if (r.getPerson().getId() == person.getId())
			++numMyRequest;
		if (r.getItem().getId() == person.getItemNow().getId())
			++numReceivedRequest;
	}

	List<Control> l = dao.findAll(Control.class);
	Control control = l.get(0);
	int ResultSwitch = control.getResultSwitch();
	if (ResultSwitch == 1) {
%>
<div class="container-fluid">
	<div class="row-fluid">
		<h1>My Exchange Result</h1>

		<p />
		<%
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
			You should give <a
				href="item_detail.jsp?itemID=<%=p.getItemOriginal().getId()%>"><%=p.getItemOriginal().getName()%></a>
			to <a href="profile.jsp?personID=<%=allPerson.get(p2).getId()%>"><%=allPerson.get(p2).getFirstName()%>
				<%=allPerson.get(p2).getLastName()%> (<%=allPerson.get(p2).getStudentId()%>)</a>
		</h4>
		<h4>
			You can get <a
				href="item_detail.jsp?itemID=<%=p.getItemNow().getId()%>"><%=p.getItemNow().getName()%></a>
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
<%
	} else {
%>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span8">
			<h1>
				Hello,
				<s:property value="#session.person.getFirstName()" />
				<s:property value="#session.person.getLastName()" />
			</h1>

			<%
				if (numReceivedRequest > 0) {
			%>
			<a href="request_list.jsp">
				<h3>
					<font color=red font-weight=bold>You have <%=numReceivedRequest%>
						requests now!</font>
				</h3> </a>
			<%
				}
			%>
			<s:else>
				<p>No request at the moment.</p>
			</s:else>

			<s:set name="itemNowName"
				value="#session.person.getItemNow().getName()" />
			<s:set name="itemOriginalName"
				value="#session.person.getItemOriginal().getName()" />
			<h4>
				Item Owned Now: <a
					href="item_detail.jsp?itemID=<s:property value="#session.person.getItemNow().getId()" />">
					<s:property value="itemNowName" /> </a>
			</h4>
			<br />
			<p>
				<s:if test="#itemNowName==#itemOriginalName">
				 Find something to <font size=5>change now!</font>
				</s:if>
				<s:else>
				From <font size=5> <s:property value="itemOriginalName" /> </font>
				to <font size=5> <s:property value="itemNowName" /> </font>
				</s:else>
			</p>
			<p />
		</div>

		<div class="span4" style="background-color:#FFF6EC">
			<ul class="nav nav-tabs nav-stacked">
				<li><a href="myprofile.jsp">My Profile</a>
				</li>
				<s:if test="#itemNowName==#itemOriginalName">
					<li><a href="edit_item.jsp">Edit My Item</a></li>
				</s:if>
				<li><a href="item_list.jsp" style="text-decoration:none">Item
						list</a></li>
				<li><a href="myrequest.jsp">My Request <span
						class="badge badge-warning pull-right"><%=numMyRequest%></span> </a></li>
				<li><a href="request_list.jsp">Received Request <span
						class="badge badge-warning pull-right"><%=numReceivedRequest%></span>
				</a></li>
				<li><a
					href="person_history.jsp?personID=<s:property value="#session.person.getId()" />">My
						Exchange History</a>
				</li>
			</ul>
		</div>
	</div>
</div>
<%
	}
%>
<%@include file="footer.htm"%>