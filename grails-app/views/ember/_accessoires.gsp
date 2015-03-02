<div class="bg-white">
	<div>&nbsp;</div>

	<div class="voitureListe">
		<div class="row">
			<h2 class="col-md-12">{{titre}}</h2>
			<div class="col-md-12">{{{contenu}}}</div>
		</div>

		<sec:ifAllGranted roles="ROLE_ADMIN">
			<div class="row">
				<g:form controller="accessoires" action="save" name="form" id="">
					<div class="col-md-1">Titre : </div>
					<div class="col-md-11">
						{{input type='text' name='titre' value=titre class='col-md-12'}}
					</div>
					<div>&nbsp;</div>
					<div>&nbsp;</div>
					<div class="col-md-12">{{view App.TinymceView valueBinding='contenu'  class='tinymce'}}</div>
					<div class="col-md-12">
						<button {{action 'update'}} class="btn btn-primary">Enregistrer</button>
					</div>
				</g:form>
			</div>
		</sec:ifAllGranted>
	</div>
	<div class="">&nbsp;</div>
</div>