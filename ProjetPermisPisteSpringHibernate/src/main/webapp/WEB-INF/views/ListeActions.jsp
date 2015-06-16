<%@ include file="head.jsp"%>

<h1>Liste des Actions</h1>

<div class="col-md-6">

	<table class="table table-striped">
		<thead>
			<tr>
				<th>NumAction</th>				
				<th>Libelle</th>
				<th>Action parente</th>
				<th>Score minimum</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${lesActions}" var="uneAction">
				<tr>
					<td>${uneAction.numaction}</td>					
					<td>${uneAction.libaction}</td>
					<c:choose>
						<c:when test="${not empty uneAction.action}">
							<td>${uneAction.action.libaction}</td>
						</c:when>
						<c:otherwise>
							<td>""</td>
						</c:otherwise>
					</c:choose>
					<td>${uneAction.scoremin}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</div>

</body>
</html>
