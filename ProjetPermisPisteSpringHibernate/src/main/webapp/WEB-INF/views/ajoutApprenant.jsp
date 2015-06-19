<%@ include file="head.jsp" %>


<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<form method="post" action="ajoutApprenant.htm">	 
				   <fieldset>
				   		<legend>Ajouter un apprenant </legend> <!-- Titre du fieldset --> 
				   		<input type="hidden" value="ajout" name="type"></input>
<!-- 				      	<p><label for="num">Numéro : </label><input name="num" type="text"></input></p> -->
				      	<p><label for="nom">Nom : </label><input name="nom" type="text"></input></p>
				      	<p><label for="prenom">Prenom : </label><input name="prenom" type="text"></input></p>
				      	
<!-- 				      	<p> -->
<!-- 				      		<label for="codecateg">Catégorie : </label> -->
<!-- 				      		<select name="codecateg"> -->
<!-- 							Afficher tous les paramètres de la requête HTTP (categories est une Map) -->
<%-- 								<c:forEach var="entry" items="${categories}" > --%>
<%-- 									<option value="${entry.codecateg}">${entry.libcateg} --%>
<%-- 								</c:forEach> --%>
<!-- 							</select>	 -->
<!-- 						</p> -->
<!-- 				      	<p> -->
<!-- 				      		<label for="codetranche">Tranche âge : </label> -->
<!-- 				      		<select name="codetranche"> -->
<!-- 							Afficher tous les paramètres de la requête HTTP (categories est une Map) -->
<%-- 								<c:forEach var="entry" items="${tranches}" > --%>
<%-- 									<option value="${entry.codetranche}">${entry.agemin} - ${entry.agemax} ans --%>
<%-- 								</c:forEach> --%>
<!-- 							</select>	 -->
<!-- 						</p> -->
<!-- 				      	<p> -->
<!-- 				      		<label for="quantiteDistribution">Quantité de distribution : </label><input name="quantiteDistribution" type="text"></input> -->
<!-- 				       			dans le catalogue -->
<!-- 							<select name="codecatalogue"> -->
<!-- 							Afficher tous les paramètres de la requête HTTP (categories est une Map) -->
<%-- 								<c:forEach var="entry" items="${catalogues}" > --%>
<%-- 									<option value="${entry.annee}">${entry.annee} --%>
<%-- 								</c:forEach> --%>
<!-- 							</select>	 -->
<!-- 						</p> -->
				   </fieldset>
				 <p><input type="submit" value="Envoyer" /> <input value="Reset" type="reset"/></p>
				</form>
		</div>
	</div>
</div>
</body>
</html>