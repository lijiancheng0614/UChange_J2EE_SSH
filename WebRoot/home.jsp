<%@include file="header.jsp"%>

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span8">
			<h1>
				Hello,
				<s:property value="#session.person.getFirstName()" />
				<s:property value="#session.person.getLastName()" />
			</h1>

			<s:if test="false">
				<a href="{% url 'user:request_list'%}">
					<h3>
						<font color=red font-weight=bold>You have
							{{number_of_requests}} requests now!</font>
					</h3> </a>
			</s:if>
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
				<li><a href="myprofile.jsp">My Profile</a></li>
				<s:if test="#itemNowName==#itemOriginalName">
					<li><a href="edit_item.jsp">Edit My Item</a></li>
				</s:if>
				<li><a href="item_list.jsp">Find Goods</a></li>
				<li><a href="myrequest.jsp">My Request
						({{number_of_myrequests}})</a></li>
				<li><a href="person_history.jsp">My Exchange History</a></li>
			</ul>
		</div>
	</div>
</div>

<%@include file="footer.htm"%>