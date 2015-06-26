<%@ include file="head.jsp"%>

<script>
	$(function() {
		$(".column").sortable({
			connectWith : ".column",
			handle : ".portlet-header",
			cancel : ".portlet-toggle",
			placeholder : "portlet-placeholder ui-corner-all"
		});

		$(".portlet")
				.addClass(
						"ui-widget ui-widget-content ui-helper-clearfix ui-corner-all")
				.find(".portlet-header")
				.addClass("ui-widget-header ui-corner-all")
				.prepend(
						"<span class='ui-icon ui-icon-minusthick portlet-toggle'></span>");

		$(".portlet-toggle").click(function() {
			var icon = $(this);
			icon.toggleClass("ui-icon-minusthick ui-icon-plusthick");
			icon.closest(".portlet").find(".portlet-content").toggle();
		});
	});
</script>


<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3>Liste des jeux</h3>
			<c:forEach items="${jeux}" var="jeux">
				<div class="column">
					<div class="portlet">
						<div class="portlet-header">${jeux.numjeu}. ${jeux.libellejeu}</div>
						<div class="portlet-content">
						<a href="afficherJeu.htm?id=${jeux.numjeu}"><button type="button" class="btn btn-default btn-xs">Jouer</button></a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
</body>
</html>
