<%@ include file="head.jsp"%>



<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3>C'est parti !!</h3>
			<c:forEach items="${jeu.actions}" var="action">
			<p>
			Question : ${action.libaction}<br />
			Reponse(s) possible(s) : <br />
			<c:forEach items="${action.indicateurs}" var="indicateur">
			<INPUT type="checkbox" name="${action.numaction} - ${indicateur.numindic}" value="${indicateur.poids}"> ${indicateur.libindic}
				<br />
				</c:forEach>
			</c:forEach>
			</p>
		</div>
	</div>
</div>
</body>
</html>
