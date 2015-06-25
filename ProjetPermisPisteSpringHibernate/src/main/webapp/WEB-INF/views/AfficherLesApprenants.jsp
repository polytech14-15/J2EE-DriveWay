<%@ include file="head.jsp"%>

<script type="text/javascript">
	function getActions(numApprenant) {
		console.log("salut");
		$.ajax({
			url : 'afficherApprenant.htm', // La ressource ciblée
			type : 'GET', // Le type de la requête HTTP.
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
				<h5>Nom : {{apprenant.nomapprenant}}</h5>
				<h5>Prénom : {{apprenant.prenomapprenant}}</h5>

				<h3>Liste des scores</h3>
				<div class="col-md-6">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Action</th>
								<th>Score début</th>
								<th>Score fin</th>
							</tr>
						</thead>
						<tbody>
							{{#each apprenant.obtients}}
									<tr>
										<td>aaa</td>
										<td>{{this.valeurdebut}}</td>
										<td>{{this.valeurfin}}</td>										
									</tr>
								{{/each}}
						</tbody>
					</table>

				</div>
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
				<th>Numéro</th>
				<th>Nom</th>
				<th>Prénom</th>
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
