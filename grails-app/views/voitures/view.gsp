<html>
    <head>
        <title><g:message code="menu.occasions"/></title>
		<meta name="layout" content="main" />
		
        <script type="text/javascript">
        	dojo.addOnLoad(function(){updatePhotos(false);});
        </script>
        
    </head>
    <body>
      <g:hiddenField id="id" name="id" value="${voiture?.id}"/>
        
      <p class="titrePrixVoiture">
				<h2 class="titreVoiture span-19" >
					${voiture.titre}
				</h2>
				<h2 class="h2 prixVoiture span-4 last" >
					<g:formatNumber number="${voiture.prixVente }" format="###,##0" />&euro;
				</h2>
			</p>

			<div style="clear: both;">&nbsp;</div>

			<div><strong class="strong-1">da:</strong><span class="block">${formatDate(format:'dd/MM/yyyy',date:voiture?.dateAchat)}<span></div>
			<div><strong class="strong-1">dv:</strong><span class="block">${formatDate(format:'dd/MM/yyyy',date:voiture?.dateVente)}<span></div>

      <p class="links">
				<sec:ifAllGranted roles="ROLE_ADMIN">
      		<a href="${createLink(controller:'voitures', action:'update', id:"$voiture.id")}">modifier</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
      		<a href="${createLink(controller:'voitures', action:'delete', id:"$voiture.id")}">supprimer</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
    		</sec:ifAllGranted>
			</p>
					
      <p>${voiture.description}</p>
      
      <div id="response"></div>
  
      <div id="photos" class="photos"></div>
    </body>
</html>
