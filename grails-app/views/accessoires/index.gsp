<html>
    <head>
    	<title><g:message code="menu.manage.accessoires"/></title>
			<meta name="layout" content="main" />
    </head>
    <body>
			<div class="subContent grid_6 span-20">
				<g:each in="${accessoires}">
					<div>
						<a href="${createLink(action:'view')}/${it.id}">${it.titre}</a> - <a href="${createLink(action:'delete')}/${it.id}">Supprimer</a>
					</div>
				</g:each>
				<g:form controller="accessoires" action="save" name="form">
					<g:textField name="titre" value="" />
					<g:submitButton name="ajouter" value="ajouter"/>
				</g:form>
				<div class="clear"></div>
			</div>

			<div class="subContent span-4 last scrollpub">
				<g:include view="ads/_ad-vertical.gsp"/>
			</div>

			<div class="clear"></div>

    </body>
</html>
