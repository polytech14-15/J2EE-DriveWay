<%@ include file="head.jsp"%>

<script type="text/javascript">
	function getActions(numApprenant) {
		console.log("salut");
		$.ajax({
			url : 'afficherApprenant.htm', // La ressource cibl�e
			type : 'GET', // Le type de la requ�te HTTP.
			dataType : 'json',
			data : 'numApprenant=' + numApprenant,
			success : function(data) {
				var context = {
					apprenant : data
				};
				console.log(context);
				var source = $("#entry-template").html();
				var template = Handlebars.compile(source);
				$("#content-placeholder").html(template(context));
				$("#myModal").modal('show');

			},
			error : function(data) {
				console.log(data);
			}
		});
		console.log("salut");
	}
</script>

<!-- Modal HTML -->
<script id="entry-template" type="text/x-handlebars-template">
<div id="myModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">Informations</div>
			<div class="modal-body">
				<h5>Nom : {{apprenant.nom}}</h5>
				<h5>Pr�nom : {{apprenant.prenom}}</h5>

				<h3>Liste des r�alisations</h3>
					{{#if apprenant.actions}}
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Num�ro Action</th>
								<th>Libell� Action</th>
								<th>Score obtenu</th>
								<th>Date</th>
							</tr>
						</thead>
						<tbody>
							{{#each apprenant.actions}}
									<tr>
										<td>{{this.numaction}}</td>
										<td>{{this.libaction}}</td>
										<td>{{this.scoremin}}</td>	
										<td>{{this.date}}</td>									
									</tr>
								{{/each}}
						</tbody>
					</table>
					{{else}}
						{{apprenant.prenom}} {{apprenant.nom}} n'a effectu� aucune action ...
					{{/if}}

			</div>

		</div>
	</div>
</div>
</script>

<div id="content-placeholder"></div>
<h3>Liste des apprenants</h3>
<div class="col-md-6">
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Num�ro</th>
				<th>Nom</th>
				<th>Pr�nom</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${fn:length( apprenants) > 0}">
				<c:forEach items="${apprenants}" var="apprenant">
					<tr>
						<td>${apprenant.numapprenant}</td>
						<td>${apprenant.nomapprenant}</td>
						<td>${apprenant.prenomapprenant}</td>
						<td><button type="button" class="btn btn-default"
								onclick="getActions('${apprenant.numapprenant}')">Actions</button></td>

					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>

</div>

</body>
</html>
