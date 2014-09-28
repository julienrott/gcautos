<div class="bg-white">
	<div>&nbsp;</div>

	<div class="voitureListe">
		<div class="row">
			<h2 class="col-md-12">{{titre}}</h2>
			<div class="col-md-12">{{{contenu}}}</div>
		</div>

		<sec:ifAllGranted roles="ROLE_ADMIN">
			<div class="row">
				<g:form controller="accessoires" action="save" name="form"
					id="${accessoire?.id}">
					<div>
						<g:textField name="titre" value="${accessoire?.titre}" />
					</div>
					<div>
						<textarea id="editor" name="contenu" class="tinymce">
						${accessoire?.contenu}
					</textarea>
					</div>
					<g:submitButton name="enregistrer" value="enregistrer" />
				</g:form>
			</div>
		</sec:ifAllGranted>
	</div>
	<div class="">&nbsp;</div>
</div>