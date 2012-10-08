<html>
    <head>
    	<title><g:message code="menu.manage.accessoires"/></title>
			<meta name="layout" content="main" />
    </head>
    <body>
			<div class="span-20">
				<h2>${accessoire?.titre}</h2>
				<div class="customDivReset">${accessoire?.contenu}</div>

				<sec:ifAllGranted roles="ROLE_ADMIN">
					<g:form controller="accessoires" action="save" name="form" id="${accessoire?.id}">
						<div><g:textField name="titre" value="${accessoire?.titre}" /></div>
						<div><textarea id="editor" name="contenu" style="width:100%;height:500px;">
							${accessoire?.contenu}
						</textarea></div>
						<g:submitButton name="enregistrer" value="enregistrer"/>
					</g:form>
				</sec:ifAllGranted>
				<div class="clear"></div>
			</div>

			<div class="subContent span-4 last scrollpub">
				<g:include view="ads/_clic-diffusion.gsp"/>
			</div>

			<div class="clear"></div>

    </body>
</html>
