<%@ include file="head.jsp"%>

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h1>Liste des Actions</h1>


			<table class="table table-striped">
				<thead>
					<tr>
						<th>NumAction</th>
						<th>Libelle</th>
						<th>Score minimum</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${lesActions}" var="uneAction">
						<tr>
							<td>${uneAction.numaction}</td>
							<td>${uneAction.libaction}</td>
							<td>${uneAction.scoremin}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>
</div>
</body>
</html>
