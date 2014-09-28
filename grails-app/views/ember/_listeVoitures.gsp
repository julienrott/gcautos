<div class="bg-white ">

	<div class="paginate">{{#each page in meta.pagesTotal}}
		{{#link-to meta.route (query-params page=page) class="step"}} {{page}}
		{{/link-to}} {{/each}}</div>

	{{#each voiture in model}}
	<div class="voitureListe">
		<div class="row">
			<h2 class="col-md-10">
				{{#link-to 'detailsVoiture' voiture}} {{#if voiture.isNewCar}}<span
					class="blink">Nouveauté : </span>{{/if}} {{voiture.titre}}
				{{/link-to}}
			</h2>
			<h2 class="h2 col-md-2">{{#if
				voiture.isSold}}Vendu(e){{else}}{{{voiture.prixVenteFormatted}}}&euro;{{/if}}
			</h2>
		</div>

		<sec:ifAllGranted roles="ROLE_ADMIN">
			<div class="">
				{{#link-to 'editVoiture' voiture.id}}modifier{{/link-to}}&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				<a {{action 'deleteCar' voiture.id}} href="#">supprimer</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				<div>&nbsp;</div>
			</div>
		</sec:ifAllGranted>

		<div class="row">
			<div class="col-md-12">{{{voiture.description}}}</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				{{#link-to 'detailsVoiture' voiture}} <img
					class="img-thumbnail col-md-6" {{bind-attr src=voiture.photo1}} />
				{{/link-to}} {{#link-to 'detailsVoiture' voiture}} <img
					class="img-thumbnail col-md-6" {{bind-attr src=voiture.photo2}} />
				{{/link-to}}
			</div>
		</div>
	</div>
	{{else}}
	<div class="">&nbsp;</div>
	<div class="">&nbsp;</div>
	<div class="">&nbsp;</div>

	<div class="voitureListe">
		<strong class="strong-1"> Désolé, aucun véhicule n'est à
			vendre dans cette catégorie pour le moment. Revenez vérifier
			régulièrement. </strong>
	</div>

	<div class="">&nbsp;</div>
	<div class="">&nbsp;</div>
	<div class="">&nbsp;</div>
	{{/each}}

	<div class="paginate">{{#each page in meta.pagesTotal}}
		{{#link-to meta.route (query-params page=page) class="step"}} {{page}}
		{{/link-to}} {{/each}}</div>

</div>