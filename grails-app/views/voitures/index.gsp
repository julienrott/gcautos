<html>
<head>
<title><g:message code="menu.occasions" /></title>
<meta name="layout" content="main" />
</head>
<body>

	<div class="">

		<div class="paginate">
			<g:paginate total="${vTotal}" max="4" />
		</div>
		
		<g:if test="${voitures.size() == 0 }">
		
			<div class="">&nbsp;</div>
			<div class="">&nbsp;</div>
			<div class="">&nbsp;</div>
			
			<div class="voitureListe">
				<strong class="strong-1">
					Désolé, aucun véhicule n'est à vendre dans cette catégorie pour le moment. 
					Revenez vérifier régulièrement.
				</strong>
			</div>
		
			<div class="">&nbsp;</div>
			<div class="">&nbsp;</div>
			<div class="">&nbsp;</div>
			
		</g:if>
		
		<g:each in="${voitures}" var="v">
			<div class="voitureListe">
				<div class="">
					<h2 class="span10">
						<a
							href="${createLink(controller:'voitures', action:'view', id:"$v.id")}"><g:if
								test="${v.mention==1}">
								<span class="blink">Nouveauté : </span>
							</g:if>
							${v.titre}</a>
					</h2>
					<h2 class="h2 span2">
						<g:if test="${v.mention==2}">Vendu(e)</g:if>
						<g:else>
							<g:formatNumber number="${v.prixVente }" format="###,##0" />&euro;</g:else>
					</h2>
				</div>

				<div class="links">
					<sec:ifAllGranted roles="ROLE_ADMIN">
						<a
							href="${createLink(controller:'voitures', action:'update', id:"$v.id")}">modifier</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				    		<a
							href="${createLink(controller:'voitures', action:'delete', id:"$v.id")}">supprimer</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			    		</sec:ifAllGranted>
				</div>

				<div>
					${v.description}
				</div>
				<div class="row-fluid">
					<g:if test="${v.photos?.titre?.size > 0}">
						<a
							href="${createLink(controller:'voitures', action:'view', id:"$v.id")}">
							<img class="img-polaroid span6"
							src="${createLink(controller:'voitures', action:'showPhoto', id:"${v.photos?.id[0]}", params:[type:'small'])}" />
						</a>
					</g:if>
					<g:if test="${v.photos?.titre?.size > 1}">
						<a
							href="${createLink(controller:'voitures', action:'view', id:"$v.id")}">
							<img class="img-polaroid span6"
							src="${createLink(controller:'voitures', action:'showPhoto', id:"${v.photos?.id[1]}", params:[type:'small'])}" />
						</a>
					</g:if>
				</div>

			</div>
		</g:each>
		
		<div class="paginate">
			<g:paginate total="${vTotal}" max="4" />
		</div>

	</div>

</body>
</html>
