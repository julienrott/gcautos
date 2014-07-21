<html>
<head>
<title>${title}</title>
<meta name="layout" content="main" />
</head>
<body>

	<div class="row-fluid">
		<div>&nbsp;</div>
	</div>
	
	<div class="">

		<div class="paginate">
			<g:paginate total="${vTotal}" max="4" />
		</div>
		
		<div class="row-fluid">
			<div class="offset2">
				<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
				<!-- leaderboard -->
				<ins class="adsbygoogle"
				     style="display:inline-block;width:728px;height:90px"
				     data-ad-client="ca-pub-5871598473810001"
				     data-ad-slot="3730173376"></ins>
				<script>
				(adsbygoogle = window.adsbygoogle || []).push({});
				</script>
			</div>
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
				<div class="row-fluid">
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
			    		<div>&nbsp;</div>
					</sec:ifAllGranted>
				</div>

				<div>
					${v.description}
				</div>
				<div class="row-fluid">
					<a
						href="${createLink(controller:'voitures', action:'view', id:"$v.id")}">
						<img class="img-polaroid span6"
								src="${createLink(controller:'voitures', action:'showPhoto', id:"${photosVoitures[v.id].id[0]}", params:[type:'small'])}" />
					</a>
					<a
						href="${createLink(controller:'voitures', action:'view', id:"$v.id")}">
						<img class="img-polaroid span6"
								src="${createLink(controller:'voitures', action:'showPhoto', id:"${photosVoitures[v.id].id[1]}", params:[type:'small'])}" />
					</a>
				</div>

			</div>
			
			<div class="row-fluid">
				<div class="offset2">
					<script type="text/javascript" src="http://tags.clickintext.net/t2W0wMXjn3ggJ" title="Classic (IAB)"></script>
				</div>
			</div>
			
		</g:each>
		
		<div class="paginate">
			<g:paginate total="${vTotal}" max="4" />
		</div>
		
		<div class="row-fluid">
			<div class="offset2">
				<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
				<!-- leaderboard -->
				<ins class="adsbygoogle"
				     style="display:inline-block;width:728px;height:90px"
				     data-ad-client="ca-pub-5871598473810001"
				     data-ad-slot="3730173376"></ins>
				<script>
				(adsbygoogle = window.adsbygoogle || []).push({});
				</script>
			</div>
		</div>
		
	</div>

</body>
</html>
