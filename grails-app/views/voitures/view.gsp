<html>
    <head>
        <title><g:message code="menu.occasions"/></title>
		<meta name="layout" content="main" />
        
    </head>
    <body>
			<div class="row-fluid">

				<div class="divPub">
				    <g:include view="ads/_ad-horizontal-haut.gsp"/>
			    </div>

				<div class="voitureListe">
				  <g:hiddenField id="id" name="id" value="${voiture?.id}"/>

				  <p class="titrePrixVoiture">
						<h2 class="titreVoiture span-15" >
							<g:if test="${voiture.mention==1}"><span class="blink">Nouveauté : </span></g:if>${voiture.titre}
						</h2>
						<h2 class="h2 prixVoiture span-3 last">
							<g:if test="${voiture.mention==2}">Vendu(e)</g:if>
							<g:else><g:formatNumber number="${voiture.prixVente }" format="###,##0" />&euro;</g:else>
						</h2>
					</p>

					<div class="clear"></div>
				
				  <p class="links">
						<sec:ifAllGranted roles="ROLE_ADMIN">
				  		<a href="${createLink(controller:'voitures', action:'update', id:"$voiture.id")}">modifier</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				  		<a href="${createLink(controller:'voitures', action:'delete', id:"$voiture.id")}">supprimer</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						</sec:ifAllGranted>
					</p>

					<div class="clear"></div>

					<!--<div><strong class="strong-1">Date d'achat : </strong><span class="block">${formatDate(format:'dd/MM/yyyy',date:voiture?.dateAchat)}<span></div>
					<div><strong class="strong-1">Date de vente : </strong><span class="block">${formatDate(format:'dd/MM/yyyy',date:voiture?.dateVente)}<span></div>-->

					<div class="clear"></div>
	
				  <div>${voiture.description}</div>
				  
				  <div id="response"></div>
		
				  <div id="photos" class="photos"></div>

				</div>
				
				<div class="divPub">
				    <g:include view="ads/_ad-horizontal-bas.gsp"/>
			    </div>

			</div>

			<div class="subContent span-4 last scrollpub">
				<g:include view="ads/_ad-vertical.gsp"/>
			</div>

			<div class="clear"></div>

    </body>
</html>
