<html>
    <head>
    	<title><g:message code="menu.occasions"/></title>
			<meta name="layout" content="main" />
    </head>
    <body>

        <g:each in="${voitures}" var="v">
        	<div class="voitureListe rounded">
						<div class="titrePrixVoiture">
							<h2 class="titreVoiture span-21" >
								<a href="${createLink(controller:'voitures', action:'view', id:"$v.id")}">${v.titre}</a>
							</h2>
							<h2 class="h2 span-4 last" >
								<g:formatNumber number="${v.prixVente }" format="###,##0" />&euro;
							</h2>
						</div>
				
						<div class="span-24">
							<p>${v.description}</p>
						</div>
				
						<div class="links span-24">
							<sec:ifAllGranted roles="ROLE_ADMIN">
				    		<a href="${createLink(controller:'voitures', action:'update', id:"$v.id")}">modifier</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				    		<a href="${createLink(controller:'voitures', action:'delete', id:"$v.id")}">supprimer</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			    		</sec:ifAllGranted>
						</div>
				
						<div class="photoListe">
							<g:if test="${v.photos?.titre?.size > 0}">
								<a href="${createLink(controller:'voitures', action:'view', id:"$v.id")}">
									<img class="photosVoituresListe round" 
											src="${createLink(controller:'voitures', action:'showPhoto', id:"${v.photos?.id[0]}")}"/>
								</a>
							</g:if>
						</div>
				
					</div>
					<div class="clear"></div>
        </g:each>
    </body>
</html>
