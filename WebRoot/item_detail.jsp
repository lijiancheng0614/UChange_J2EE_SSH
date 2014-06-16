<%@include file="header.jsp"%>
<%@page import="uchange.models.*"%>

<%
	DAO dao = new DAO();
	Integer itemID = Integer.parseInt(request.getParameter("itemID"));
	Item item = (Item) dao.findById(Item.class, itemID);
	List<Person> allPerson = dao.findAll(Person.class);
	int i = 0;
	for (; i < allPerson.size(); ++i) {
		if (allPerson.get(i).getItemNow().getId() == itemID)
			break;
	}
	Person person = allPerson.get(i);
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
					Owner: <a
						href="profile.jsp?personID=<%=person.getId()%>"><%=person.getFirstName()%>
						<%=person.getLastName()%></a>
				</h4>
				<h4>Number of Request: {{count}}</h4>
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
				{% if self %}
				<li><h4>This is your own item.</h4>
				</li> {% endif %} {% if accept %}
				<li><h4>
						The owner of this item has been sent request to you! To exchange
						with him, just <a href="{% url 'user:accept' item.id %}"
							style="font-weight:bold;color:#F00">Accept</a>
					</h4></li> {% endif %} {% if request %}
				<li><a href="{% url 'user:request' item.id %}">Send Request</a>
				</li> {% endif %} {% if not self and not accept and not request %}
				<li>You have already sent request.</li> {% endif %}
				<li><a href="{% url 'user:item_history' item.id %}">Exchange
						History</a>
				</li>
			</ul>
		</div>
	</div>
</div>

<%@include file="footer.htm"%>