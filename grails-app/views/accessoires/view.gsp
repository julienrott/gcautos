<html>
    <head>
    	<title>${accessoire?.titre}</title>
		<meta name="layout" content="main" />
    </head>
    <body>
    
    	<div>&nbsp;</div>
    	
		<div class="voitureListe">
			<div class="row-fluid">
				<h2>${accessoire?.titre}</h2>
				<div class="customDivReset">${accessoire?.contenu}</div>
			</div>

			<sec:ifAllGranted roles="ROLE_ADMIN">
			<div class="row-fluid">
				<g:form controller="accessoires" action="save" name="form" id="${accessoire?.id}">
					<div><g:textField name="titre" value="${accessoire?.titre}" /></div>
					<div><textarea id="editor" name="contenu" class="tinymce">
						${accessoire?.contenu}
					</textarea></div>
					<g:submitButton name="enregistrer" value="enregistrer"/>
				</g:form>
			</div>
			</sec:ifAllGranted>
		</div>

    </body>
</html>
