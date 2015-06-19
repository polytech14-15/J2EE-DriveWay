<%@ include file="head.jsp"%>



<form method="post" action="afficherAction.htm">

	<fieldset>
		<label for="NumAction">Numéro action :</label> <input type="text"
			name="NumAction" id="NumAction" />
	</fieldset>

	<input type="submit" value="Envoyer" />
</form>


<c:if test="${not empty uneAction}">
	<h1>Action n°1</h1>

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
			</tbody>
		</table>
	</div>
</c:if>

</body>
</html>
