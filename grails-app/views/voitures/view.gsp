<html>
    <head>
        <title><g:message code="menu.occasions"/></title>
		<meta name="layout" content="main" />
        
    </head>
    <body>
			<div class="subContent span-20">

				<div class="divPub"><script type="text/javascript">var TDIframe = TDIframe || {counter : 0, newTDId : function(){return 'TDId' + (this.counter += 1);}};TDIframe.url = 'http://anetfr.tradedoubler.com/anet-' + Math.random().toString().substring(2, 11) + '?type(iframe)loc(128735)';TDIframe.id = TDIframe.newTDId();document.write('<iframe id="' + TDIframe.id + '" src="" width="468" height="60" frameborder="0" border="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>');document.getElementById(TDIframe.id).src=TDIframe.url;</script></div>

				<div class="voitureListe">
				  <g:hiddenField id="id" name="id" value="${voiture?.id}"/>

				  <p class="titrePrixVoiture">
						<h2 class="titreVoiture span-15" >
							<g:if test="${voiture.mention==1}"><blink>Nouveauté : </blink></g:if>${voiture.titre}
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
