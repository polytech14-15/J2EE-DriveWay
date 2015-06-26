<%@ include file="head.jsp"%>

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3>Afficher les missions d'un jeu</h3>
			<form method="post" action="afficherMissions.htm">

				<fieldset>
					<label for="NumJeu">Jeu :</label> <select size="1" id="numJeu"
						name="numJeu">
						<c:forEach items="${jeux}" var="jeu">
							<option value="${jeu.numjeu}">${jeu.numjeu}-
								${jeu.libellejeu}
						</c:forEach>
					</select>
				</fieldset>

				<input type="submit" value="Envoyer" />
			</form>


			<c:if test="${not empty unJeu}">
				<h1>Jeu ${unJeu.numjeu} : ${unJeu.libellejeu}</h1>
				<h2>Missions :</h2>
				<c:forEach items="${unJeu.missions}" var="mission">
					<div class="col-md-12">
						<table class="table table-striped">
							<caption>${mission.nummission}- ${mission.libmission }</caption>
							<thead>
								<tr>
									<th>Numéro objectif</th>
									<th>Libelle objectif</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${mission.objectifs}" var="objectif">
									<tr>
										<td>${objectif.numobjectif}</td>
										<td>${objectif.libobectif}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
</div>
</body>
</html>
