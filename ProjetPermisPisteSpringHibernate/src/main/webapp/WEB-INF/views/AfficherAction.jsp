<%@ include file="head.jsp"%>

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3>Afficher une action</h3>
			<form method="post" action="afficherAction.htm">

				<fieldset>
					<label for="NumAction">Action :</label>
			<select size="1" id="action" name="action">
				<c:forEach items="${actions}" var="action">
					<option value="${action.numaction}">${action.numaction} - ${action.libaction}
				</c:forEach>
			</select>
				</fieldset>

				<input type="submit" value="Envoyer" />
			</form>


			<c:if test="${not empty uneAction}">
				<h1>Action ${uneAction.numaction}</h1>
				<h4>Libellé : ${uneAction.libaction}</h4>
				
				<h4>Indicateurs :</h4>
				<div class="col-md-12">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Numéro</th>
								<th>Libelle</th>
								<th>Poids</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${uneAction.indicateurs}" var="indicateur">
							<tr>
								<td>${indicateur.numindic}</td>
								<td>${indicateur.libindic}</td>
								<td>${indicateur.poids}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				<h4>Règles :</h4>
				<div class="col-md-12">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Numéro</th>
								<th>Libelle</th>
								<th>Score minimum</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${uneAction.regles}" var="regle">
							<tr>
								<td>${regle.numregle}</td>
								<td>${regle.libregle}</td>
								<td>${regle.scoremin}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				<h4>Objectifs :</h4>
				<div class="col-md-12">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Numéro</th>
								<th>Libelle</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${uneAction.objectifs}" var="objectif">
							<tr>
								<td>${objectif.numobjectif}</td>
								<td>${objectif.libobectif}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:if>
		</div>
	</div>
</div>
</body>
</html>
