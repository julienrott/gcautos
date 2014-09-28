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
			<button {{action 'createCar'}} class="btn btn-primary">Enregistrer</button>
		</div>

	</div>
	<div>&nbsp;</div>
</div>