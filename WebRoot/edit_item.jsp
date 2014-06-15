<%@include file="header.jsp"%>

<div class="container-fluid">
	<div class="row-fluid">
		<h1>Edit Item</h1>
		<br />

		<p />

		<div class="span11">
			<form action="editItemAction" name="editItemAction" method="post">
				<div class="span2" align="right" style="line-height: 180%">
					<p>
						<strong>name:</strong>
					</p>

					<p>
						<strong>description:</strong>
					</p>
				</div>
				<div class="span9" align="left">
					<input type="text" name='name'
						value="<s:property value="#session.person.getItemOriginal().getName()" />">
					<textarea rows="20" cols="20" name='description' style="width:100%"><s:property
							value="#session.person.getItemOriginal().getDescription()" /></textarea>
				</div>
				<div class="span12" align="center">
					<br />
					<button type="submit" class="btn submit btn-primary">Submit</button>
				</div>
			</form>

		</div>
	</div>
</div>

<%@include file="footer.htm"%>