<html>
    <head>
        <title><g:message code="menu.occasions"/></title>
		<meta name="layout" content="main" />
		
        <script type="text/javascript">
        	dojo.addOnLoad(function(){updatePhotos(false);});
        </script>
        
    </head>
    <body>
        <div id="post" class="voitureListe rounded">
	        <g:hiddenField id="id" name="id" value="${voiture?.id}"/>
	        
	        <p class="titrePrixVoiture">
				<span class="titreVoiture span-19" >
					${voiture.titre}
				</span>
				<span class="prixVoiture span-4 last" >
					<g:formatNumber number="${voiture.prixVente }" format="###,##0" />&euro;
				</span>
			</p>
			<div style="clear: both;">&nbsp;</div>
			
	        <p class="links">
				<sec:ifAllGranted roles="ROLE_ADMIN">
	        		<a href="${createLink(controller:'voitures', action:'update', id:"$voiture.id")}">modifier</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
	        		<a href="${createLink(controller:'voitures', action:'delete', id:"$voiture.id")}">supprimer</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
        		</sec:ifAllGranted>
			</p>
					
	        <p>${voiture.description}</p>
	        
	        <div id="response"></div>
	    
	        <div id="photos" class="photos"></div>
        </div>
    </body>
</html>