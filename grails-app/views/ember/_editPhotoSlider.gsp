<div class="bg-white">
	<div>&nbsp;</div>

	<div class="voitureListe row">
		{{#each photo in model}}
		<div class="photo photoSortable col-md-3" {{bind-attr data-id=photo.id}}>
			<img class="img-thumbnail col-md-12" {{bind-attr src=photo.url}} />

			<span {{bind-attr id=photo.id}}
				{{action 'deletePhoto' photo.id}} class="deletePhoto"
				title="Supprimer"></span>
		</div>
		{{/each}}
		
		<div class="row col-md-12">
			<div id="divAjaxUploader" class="col-md-2 btn btn-primary">{{view
				App.AjaxUploaderPhotoSliderView}}</div>
		</div>
		
	</div>

	<button {{action 'reloadPhotos'}} id="reloadPhotosBtn"
			style="display: none;">reload</button>
			
	<div>&nbsp;</div>
</div>