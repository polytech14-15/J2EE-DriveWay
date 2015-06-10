<%@ include file="head.jsp" %>

  <h1>Liste des Jeux</h1>
  
   <div class="col-md-6" >
   
 <table class="table table-striped">
 <thead>
    <tr>   
      <th>Numéro</th>
      <th>Libellé</th>
    </tr>
    </thead>
    <tbody>
  <c:forEach items="${mesJeux}" var="item" >
  <tr>
      <td>${item.numjeu}</td>
     <td>${item.libellejeu}</td>
  </tr>
 </c:forEach>	  
    </tbody>
  </table>
  
  </div>
  
</body>
</html>
