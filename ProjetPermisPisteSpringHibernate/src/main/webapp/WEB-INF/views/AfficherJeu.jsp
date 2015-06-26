<%@ include file="head.jsp"%>

<script type="text/javascript">
	$(document).on("click", ".envoyerScore", function() {
		var array = new Array();
		console.log("fejgerjgtorjg");
		var apprenant = $( "#apprenant" ).val();
		var date = new Date($.now());
		console.log(apprenant);
		$(".question").each(function(index) {
			var score = 0;
			$(this).find("input:checked").each(function(index) {
				score = score + $(this).data("score");
				console.log("incremente : " + $(this).data("score"));

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
		console.log(scores);
		$.ajax({
			url : 'genererScore.htm', // La ressource ciblée
			type : 'GET', // Le type de la requête HTTP.
			dataType : 'json',
			data : {
				"scores" : JSON.stringify(scores)
			},
			success : function(data) {
				var source = $("#entry-template").html();
				var template = Handlebars.compile(source);
				$("#content-placeholder").html(template(context));
				$("#myModal").modal('show');
			},
			error : function(data) {
				console.log(data);
			}
		});
	});
</script>

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3>C'est parti !!</h3>
			<p>
				<h4>Veuillez choisir un apprenant : </h4>
				<br />
				<select size="1" id="apprenant">
					<c:forEach items="${apprenants}" var="apprenant">
						<option value="${apprenant.numapprenant}">${apprenant.prenomapprenant} ${apprenant.nomapprenant}
					</c:forEach>
				</select>
			</p>

			<c:forEach items="${jeu.actions}" var="action">
				<div class="question" data-numaction="${action.numaction}">
					<p>
						<h4><u>Question :</u> ${action.libaction}</h4>
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
