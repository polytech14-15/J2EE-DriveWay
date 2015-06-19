<%@ include file="head.jsp"%>



<h3>Informations</h3>
<h5>Nom : ${apprenant.nomapprenant}</h5>
<h5>Prénom : ${apprenant.prenomapprenant}</h5>

<h3>Liste des scores</h3>
<div class="col-md-6">
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Action</th>				
				<th>Score</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${apprenant.mesResultats}" var="resultats">
				<tr>
					<td>${resultats.action.libaction}</td>
					<td>${resultats.valeurdebut}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</div>

</body>
</html>
