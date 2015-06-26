<%@ include file="head.jsp"%>

<script type="text/javascript">
	$(document).on("click", ".envoyerScore", function() {
		var array = new Array();
		console.log("fejgerjgtorjg");
		var apprenant = $("#apprenant").val();
		var date = new Date($.now());
		$(".question").each(function(index) {
			var score = 0;
			$(this).find("input:checked").each(function(index) {
				score = score + $(this).data("score");
			});
			var score = {
				idAction : $(this).data("numaction"),
				score : score
			}
			array[index] = score;
		});

		var scores = {
			scores : array,
			idApprenant : apprenant,
			date : date
		};
		$.ajax({
			url : 'genererScore.htm', // La ressource ciblée
			type : 'GET', // Le type de la requête HTTP.
			dataType : 'json',
			data : {
				"scores" : JSON.stringify(scores)
			},
			success : function(data) {
				scores['total'] = data;
				var source = $("#entry-template").html();
				var template = Handlebars.compile(source);
				var context = {
					context : scores
				};
				console.log(context);
				$("#content-placeholder").html(template(context));
				$("#myModal").modal('show');
			},
			error : function(data) {
				console.log(data);
			}
		});
	});
</script>

<!-- Template handlebars : Modal HTML -->
<script id="entry-template" type="text/x-handlebars-template">
<div id="myModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header"><h3>Resultats</h3></div>
			<div class="modal-body">
				<h5>Id : {{context.idApprenant}}</h5>
				<h5>Date : {{context.date}}</h5>

				<h3>Scores</h3>
					{{#if context.scores}}
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Numéro Action</th>
								<th>Score</th>
							</tr>
						</thead>
						<tbody>
							{{#each context.scores}}
									<tr>
										<td>{{this.idAction}}</td>
										<td>{{this.score}}</td>								
									</tr>
								{{/each}}
						</tbody>
					</table>
					{{/if}}
				<h4>Score total : {{context.total}}</h4>
			</div>

		</div>
	</div>
</div>
</script>

<div id="content-placeholder"></div>

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3>C'est parti !!</h3>
			<p>
			<h4>Veuillez choisir un apprenant :</h4>
			<br /> <select size="1" id="apprenant">
				<c:forEach items="${apprenants}" var="apprenant">
					<option value="${apprenant.numapprenant}">${apprenant.prenomapprenant}
						${apprenant.nomapprenant}
				</c:forEach>
			</select>
			</p>

			<c:forEach items="${jeu.actions}" var="action">
				<div class="question" data-numaction="${action.numaction}">
					<p>
					<h4>
						<u>Question :</u> ${action.libaction}
					</h4>
					<c:forEach items="${action.indicateurs}" var="indicateur">
						<input type="checkbox"
							name="${action.numaction} - ${indicateur.numindic}"
							data-score="${indicateur.poids}"> ${indicateur.libindic}
							<br />
					</c:forEach>
					</p>
				</div>
			</c:forEach>
			<button type="button" class="btn btn-default btn-xs envoyerScore">Envoyer</button>

		</div>
	</div>
</div>


</body>
</html>
