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

	$(document).on("click", ".modifierApprenant", function () {
	    var num = $(this).data('numero');
	    var nom = $(this).data('nom');
	    var prenom = $(this).data('prenom');
	    $(".modal-body #id").val( num );
	    $(".modal-body #nom").val( nom );
	    $(".modal-body #prenom").val( prenom );
	});
</script>

<!-- Modal HTML -->
<script id="entry-template" type="text/x-handlebars-template">
<div id="myModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">Informations</div>
			<div class="modal-body">
				<h5>Nom : {{apprenant.nom}}</h5>
				<h5>Prénom : {{apprenant.prenom}}</h5>

				<h3>Liste des réalisations</h3>
					{{#if apprenant.actions}}
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Numéro Action</th>
								<th>Libellé Action</th>
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
						{{apprenant.prenom}} {{apprenant.nom}} n'a effectué aucune action ...
					{{/if}}

			</div>

		</div>
	</div>
</div>
</script>

<div id="content-placeholder"></div>

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3>Liste des apprenants</h3>
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
						<td>
						<button type="button" class="btn btn-default" onclick="getActions('${apprenant.numapprenant}')">Infos</button>
				       	<form id="delForm" method="post" action="supprimerApprenant.htm" onsubmit="">
							<input type="hidden" name="id" value="${apprenant.numapprenant}" id="id"/>
						</form>
						<div class="btn-group" role="group">
						<button type="button" class="btn btn-default modifierApprenant" data-toggle="modal" data-target="#modifierModal" data-numero="${apprenant.numapprenant}" data-nom="${apprenant.nomapprenant}" data-prenom="${apprenant.prenomapprenant}">Modifier</button>
				       	<button type="submit" class="btn btn-default" form="delForm" onclick="return confirm('Etes-vous sûr de vouloir supprimer cet apprenant ?');">Supprimer</button>
				       	</div>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>

		</div>
	</div>
</div>

<!-- Modal -->
				<div class="modal fade" id="modifierModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">Modifier l'Apprenant</h4>
							</div>
							<div class="modal-body">
								<form method="post" action="modifierApprenant.htm">	 
								   <fieldset>
								   		<input type="hidden" value="modifier" name="type"></input>
								      	<p><label for="id">Numéro : </label><input id="id" name="id" type="text"  placeholder="" readonly></input></p>
								      	<p><label for="nom">Nom : </label><input id="nom" name="nom" type="text"></input></p>
								      	<p><label for="prenom">Prénom : </label><input id="prenom" name="prenom" type="text"></input></p>
								   </fieldset>
								 <p><input type="submit" value="Modifier" />
								</form>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->

</body>
</html>
