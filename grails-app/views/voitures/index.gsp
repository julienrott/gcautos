<html>
    <head>
    	<title><g:message code="menu.occasions"/></title>
			<meta name="layout" content="main" />
    </head>
    <body>
			<div class="subContent span-20">
				<div class="paginate">
					<g:paginate total="${vTotal}" max="4"/>
				</div>
        <g:each in="${voitures}" var="v">
        	<div class="voitureListe rounded">
						<div class="titrePrixVoiture">
							<h2 class="titreVoiture span-15" >
								<a href="${createLink(controller:'voitures', action:'view', id:"$v.id")}"><g:if test="${v.mention==1}"><span class="blink">Nouveauté : </span></g:if>${v.titre}</a>
							</h2>
							<h2 class="h2 prixVoiture span-3 last" >
								<g:if test="${v.mention==2}">Vendu(e)</g:if>
								<g:else><g:formatNumber number="${v.prixVente }" format="###,##0" />&euro;</g:else>
							</h2>
						</div>

						<div class="clear"></div>
				
						<div class="links">
							<sec:ifAllGranted roles="ROLE_ADMIN">
				    		<a href="${createLink(controller:'voitures', action:'update', id:"$v.id")}">modifier</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				    		<a href="${createLink(controller:'voitures', action:'delete', id:"$v.id")}">supprimer</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			    		</sec:ifAllGranted>
						</div>

						<div class="clear"></div>

						<div>
							${v.description}
						</div>
						<div class="photoListe">
							<g:if test="${v.photos?.titre?.size > 0}">
								<a href="${createLink(controller:'voitures', action:'view', id:"$v.id")}">
									<img class="photosVoituresListe round" 
											src="${createLink(controller:'voitures', action:'showPhoto', id:"${v.photos?.id[0]}", params:[type:'small'])}"/>
								</a>
							</g:if>
							<g:if test="${v.photos?.titre?.size > 1}">
								<a href="${createLink(controller:'voitures', action:'view', id:"$v.id")}">
									<img class="photosVoituresListe round" 
											src="${createLink(controller:'voitures', action:'showPhoto', id:"${v.photos?.id[1]}", params:[type:'small'])}"/>
								</a>
							</g:if>
						</div>
				
					</div>
					<div class="clear"></div>
        </g:each>
				<div class="paginate">
					<g:paginate total="${vTotal}" max="4"/>
				</div>
			</div>

			<div class="subContent span-4 last scrollpub">
				<g:include view="ads/_clic-diffusion.gsp"/>
			</div>

			<div class="clear"></div>

    </body>
</html>
