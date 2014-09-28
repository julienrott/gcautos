<div class="bg-white">
	<div>&nbsp;</div>
	<div class="voitureListe row">

		<div class="">
			<div class="strong-1">{{{titre}}}</div>
			<div>{{{description}}}</div>
			<div class=""></div>
		</div>

		<div>&nbsp;</div>
	
		<div class="">
			<div class="strong-1">{{input type='text' name='titre' value=titre}}</div>
			
			<div>&nbsp;</div>
		
			<div>{{view App.TinymceView valueBinding='description' class='tinymce'}}</div>
			
			<div>&nbsp;</div>
			
			<div class="row col-md-12">
				<button {{action 'createNews'}} class="btn btn-primary">Enregistrer</button>
			</div>
			
		</div>

	</div>
	<div>&nbsp;</div>
</div>