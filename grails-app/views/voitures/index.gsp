<html>
    <head>
    	<title><g:message code="menu.occasions"/></title>
			<meta name="layout" content="main" />
    </head>
    <body>

        <g:each in="${voitures}" var="v">
        	<div class="voitureListe rounded">
				<p class="titrePrixVoiture">
					<span class="titreVoiture span-19" >
						<a href="${createLink(controller:'voitures', action:'view', id:"$v.id")}">${v.titre}</a>
					</span>
					<span class="prixVoiture span-4 last" >
						<g:formatNumber number="${v.prixVente }" format="###,##0" />&euro;
					</span>
				</p>
				
				<p class="links">
					<sec:ifAllGranted roles="ROLE_ADMIN">
		        		<a href="${createLink(controller:'voitures', action:'update', id:"$v.id")}">modifier</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
		        		<a href="${createLink(controller:'voitures', action:'delete', id:"$v.id")}">supprimer</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
	        		</sec:ifAllGranted>
				</p>
				
				<div class="span-15">
					<p>${v.description}</p>
				</div>
				
				<div class="span-8 last">
					<g:if test="${v.photos?.titre?.size > 0}">
						<a href="${createLink(controller:'voitures', action:'view', id:"$v.id")}">
							<img class="photosVoituresListe round" 
									src="${resource(dir:'static/images/'+v.id, file:'SMALL_' + 
											v.photos.titre[0], absolute:true, )}"/>
						</a>
					</g:if>
				</div>
				
			</div>
        </g:each>
    </body>
</html>
