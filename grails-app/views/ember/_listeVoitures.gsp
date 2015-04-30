<div class="bg-white">

	<div class="paginate row">{{#each page in meta.pagesTotal}}
		{{#link-to meta.route (query-params page=page) class="step"}} {{page}}
		{{/link-to}} {{/each}}</div>

	<div class="row">
		{{#each voiture in model}}
		<div class="col-xs-12 col-sm-6 col-md-4 sm-small-padding clear-block">
			<div class="row">
				<div class="col-sm-6">
					{{#if voiture.isNewCar}}<div class="ribbon"><p>Nouveauté</p></div>{{/if}}
					{{#link-to 'detailsVoiture' voiture}} <img
						class="img-thumbnail" {{bind-attr src=voiture.photo1}} />
					{{/link-to}} {{#link-to 'detailsVoiture' voiture}}
					{{/link-to}}
				</div>

				<div class="col-sm-6">
					<h2 class="h2 col-xs-12">{{#if
						voiture.isSold}}Vendu(e){{else}}{{{voiture.prixVenteFormatted}}}&euro;{{/if}}
					</h2>
					<h4 class="h4 lignes-4 col-xs-12">
						{{#link-to 'detailsVoiture' voiture}}{{voiture.titre}}{{/link-to}}
					</h4>
				</div>
			</div>

			<sec:ifAllGranted roles="ROLE_ADMIN">
				<div class="">
					{{#link-to 'editVoiture' voiture.id}}modifier{{/link-to}}&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<a {{action 'deleteCar' voiture.id}} href="#">supprimer</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<div>&nbsp;</div>
				</div>
			</sec:ifAllGranted>

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
	</div>

	<div class="paginate row">{{#each page in meta.pagesTotal}}
		{{#link-to meta.route (query-params page=page) class="step"}} {{page}}
		{{/link-to}} {{/each}}</div>

</div>