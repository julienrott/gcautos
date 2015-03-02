<div class="bg-white">
	<div>&nbsp;</div>
	<div class="voitureListe row">

		<div class="row ">
			<h2 class="col-md-10">
				{{#if isNewCar}}<span class="blink">Nouveauté : </span>{{/if}}
				{{titre}}
			</h2>
			<h2 class="h2 col-md-2">{{#if
				isSold}}Vendu(e){{else}}{{{prixVenteFormatted}}}&euro;{{/if}}</h2>
		</div>

		<div class="row col-md-12">{{{description}}}</div>

		<div class="row col-md-12">&nbsp;</div>

		<div class="row col-md-12">Titre {{input type='text'
			name='titre' value=titre}}</div>

		<div class="row col-md-12">Prix de vente {{input type='prixVente'
			name='prixVente' value=prixVente}}</div>

		<div class="row col-md-12">Type {{view Ember.Select
			content=vehicleTypes optionValuePath="content.type"
			optionLabelPath="content.label" value=vehicleType}}</div>

		<div class="row col-md-12">Mention {{view Ember.Select
			content=vehicleMentions optionValuePath="content.type"
			optionLabelPath="content.label" value=mention}}</div>

		<div class="row col-md-12">&nbsp;</div>

		<div class="row col-md-12">Description {{view App.TinymceView
			valueBinding='description' class='tinymce'}}</div>

		<div class="row col-md-12">&nbsp;</div>

		<div class="row col-md-12">
			<button {{action 'update'}} class="btn btn-primary">Enregistrer</button>
		</div>

		<div class="row col-md-12">&nbsp;</div>

		<div class="row col-md-12">
			<h2 class="col-md-12">Photos</h2>
		</div>

		<button {{action 'reloadCar'}} id="reloadCarBtn"
			style="display: none;">reload</button>

		<div class="row col-md-12">
			<div id="divAjaxUploader" class="col-md-2 btn btn-primary">{{view
				App.AjaxUploaderView}}</div>
		</div>

		<div class="row col-md-12">&nbsp;</div>

		<div class="row col-md-12 sortable">
			{{#each photo in photos}}
			<div class="photo photoSortable col-md-3" {{bind-attr data-id=photo.id}}>
				<img class="img-thumbnail col-md-12" {{bind-attr src=photo.url}} />

				<span {{action 'reloadPhoto' model.id
					photo.id}} class="glyphicon glyphicon-refresh refreshPhoto"
					title="Recharger"></span> <span {{bind-attr id=photo.id}}
					{{action 'deletePhoto' model.id photo.id}} class="deletePhoto"
					title="Supprimer"></span>
			</div>
			{{/each}}
		</div>
		
	</div>
	<div>&nbsp;</div>
</div>