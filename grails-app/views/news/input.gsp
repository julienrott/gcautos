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

		<div class="subContent span-4 last scrollpub">
			<g:include view="ads/_ad-vertical.gsp"/>
		</div>

		<div class="clear"></div>

    </body>
</html>
