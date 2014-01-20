<html>
    <head>
        <title>${voiture.titre}</title>
		<meta name="layout" content="main" />
        
    </head>
    <body>
			<div class="row-fluid">
				
				<div>&nbsp;</div>

				<div class="voitureListe">
				  <g:hiddenField id="id" name="id" value="${voiture?.id}"/>

				  <div class="row-fluid">
						<h2 class="span10" >
							<g:if test="${voiture.mention==1}"><span class="blink">Nouveauté : </span></g:if>${voiture.titre}
						</h2>
						<h2 class="h2 span2">
							<g:if test="${voiture.mention==2}">Vendu(e)</g:if>
							<g:else><g:formatNumber number="${voiture.prixVente }" format="###,##0" />&euro;</g:else>
						</h2>
				  </div>
				
				  <div class="">
					<sec:ifAllGranted roles="ROLE_ADMIN">
			  		<a href="${createLink(controller:'voitures', action:'update', id:"$voiture.id")}">modifier</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			  		<a href="${createLink(controller:'voitures', action:'delete', id:"$voiture.id")}">supprimer</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<div>&nbsp;</div>
					</sec:ifAllGranted>
				  </div>

				  <div>${voiture.description}</div>
				  
				  <div id="response"></div>
		
				  <div id="photos"></div>

				</div>

			</div>

    </body>
</html>
