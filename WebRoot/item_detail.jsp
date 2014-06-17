<%@include file="header.jsp"%>
<%@page import="uchange.models.*"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>

<%
	Person me = (Person) ActionContext.getContext().getSession()
			.get("person");

	DAO dao = new DAO();
	Integer itemID = Integer.parseInt(request.getParameter("itemID"));
	Item item = (Item) dao.findById(Item.class, itemID);

	List<Person> allPerson = dao.findAll(Person.class);
	Person person = null;
	for (Person p : allPerson) {
		if (p.getItemNow().getId() == itemID) {
			person = p;
			break;
		}
	}

	List<Request> itemRequest = dao.findByProperty(Request.class,
			"item", item);
	List<Request> allRequest = dao.findAll(Request.class);

	int numRequest = 0;
	boolean acceptFlag = false;
	int requestID = 0;
	boolean sentFlag = false;
	for (Request r : allRequest) {
		if (r.getPerson().getId() == person.getId()
				&& r.getItem().getId() == me.getItemNow().getId()) {
			acceptFlag = true;
			requestID = r.getId();
		}
		if (r.getItem().getId() == item.getId()) {
			++numRequest;
			if (r.getPerson().getId() == me.getId()) {
				sentFlag = true;
			}
		}
	}
%>

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span8">
			<h1><%=item.getName()%></h1>

			<p />

			<div class="span11">
				<div class="well"><%=item.getDescription()%></div>
				<hr />
				<h4>
					Owner: <a href="profile.jsp?personID=<%=person.getId()%>"><%=person.getFirstName()%>
						<%=person.getLastName()%></a>
				</h4>
				<h4>
					Number of Request:
					<%=numRequest%></h4>
				<hr />
				<h3>Comments</h3>
				{% for each in comments %}
				<div class="well">
					<p>
						<small><a
							href="{% url 'user:profile' each.person.student_id %}">{{each.person.first_name}}
								{{each.person.last_name}}</a> posted on {{each.comment_time}} </small>
					</p>
					<p>{{each.content|safe|linebreaksbr}}</p>
				</div>
				{% endfor %}
				<form action="/home/item/{{item.id}}/post_comment/" method="post"
					style="margin-right:16px">
					{% csrf_token %}
					<p>
						<textarea rows="7" cols="20" name="content" style="width:100%"></textarea>
					</p>
					<button type="submit" class="btn submit btn-primary">Post
						Comment</button>
				</form>
			</div>
		</div>

		<div class="span4" style="background-color:#FFF6EC">
			<ul class="nav nav-tabs nav-stacked">
				<s:set name="myID" value="#session.person.getId()" />
				<%
					if (me.getId() == person.getId()) {
				%>
				<li><h4>This is your own item.</h4></li>
				<%
					} else {
						if (acceptFlag) {
				%>
				<li><h4>
						The owner of this item has been sent request to you! To exchange
						with him, just <a
							href="acceptAction?itemID=<%=itemID%>&requestID=<%=requestID%>"
							style="font-weight:bold;color:#F00">Accept</a>
					</h4>
				</li>
				<%
					} else if (sentFlag) {
				%>

				<li>You have already sent request.</li>
				<%
					} else {
				%>

				<li><a href="sendAction?itemID=<%=itemID%>">Send Request</a></li>

				<%
					}
					}
				%>

				<li><a href="item_history.jsp?itemID=<%=itemID%>">Exchange
						History</a></li>
			</ul>
		</div>
	</div>
</div>

<%@include file="footer.htm"%>