<html>
    <head>
    	<title><g:message code="menu.occasions"/></title>
			<meta name="layout" content="main" />
    </head>
    <body>
			<div class="subContent span-20">
        <g:each in="${voitures}" var="v">
        	<div class="voitureListe rounded">
						<div class="titrePrixVoiture">
							<h2 class="titreVoiture span-15" >
								<a href="${createLink(controller:'voitures', action:'view', id:"$v.id")}">${v.titre}</a>
							</h2>
							<h2 class="h2 prixVoiture span-3 last" >
								<g:formatNumber number="${v.prixVente }" format="###,##0" />&euro;
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
			</div>

			<div class="subContent span-4 last">
				<script type="text/javascript"><!--
				google_ad_client = "ca-pub-6056271097061513";
				/* gcautos */
				google_ad_slot = "0844335337";
				google_ad_width = 160;
				google_ad_height = 600;
				//-->
				</script>
				<script type="text/javascript"
				src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
				</script>
			</div>

			<div class="clear"></div>

    </body>
</html>
