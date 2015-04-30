<div class="bg-white row">
	<div>&nbsp;</div>
	<div class="">
		<div class="col-xs-12">
			<h2 class="col-md-10">
				{{#if isNewCar}}<span class="blink">Nouveauté : </span>{{/if}}
				{{titre}}
			</h2>
			<h2 class="h2 col-md-2">{{#if
				isSold}}Vendu(e){{else}}{{{prixVenteFormatted}}}&euro;{{/if}}</h2>
		</div>

		<sec:ifAllGranted roles="ROLE_ADMIN">
			<div class="">
				{{#link-to 'editVoiture'
				id}}modifier{{/link-to}}&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				<div>&nbsp;</div>
			</div>
		</sec:ifAllGranted>

		<div class="col-xs-12">
			<div class="col-xs-12">{{{description}}}</div>
		</div>

		{{#each photo in photos}}
			<div class="photo col-xs-12 col-md-6">
				<img class="img-thumbnail col-md-12" {{bind-attr src=photo.url}} />
				<sec:ifAllGranted roles="ROLE_ADMIN">
					<span {{bind-attr id=photo.id}}
						{{action 'deletePhoto' model}} class="deletePhoto"
						title="Supprimer"></span>
				</sec:ifAllGranted>
			</div>
		{{/each}}
	</div>
	<div>&nbsp;</div>
</div>