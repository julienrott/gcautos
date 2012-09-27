<html>
    <head>
    	<title><g:message code="menu.news"/></title>
		<meta name="layout" content="main" />
    </head>
    <body>
		<div class="subContent grid_6 span-20">
	    <g:form action="update" name="newsForm">
	        <g:hiddenField name="id" value="${news?.id}" />
			<div>Titre: <input type="text" name="titre" value="${news.titre}"></div>
			<div>Contenu:<br/><textarea name="description" style="height: 65px;">${news.description}</textarea></div>
			<div class="clear"></div>
			<g:submitButton name="Enregistrer" value="Enregistrer" />
		</g:form>
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
