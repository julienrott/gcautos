
<!-- slider -->
<div id="myCarousel" class="carousel slide bg-white">
	<div class="row">
		<div class="col-md-2 center">
			<div class="visible-md-*">&nbsp;</div>
			<div class="visible-md-*">&nbsp;</div>
			<div class="visible-md-*">&nbsp;</div>
			<asset:image src="livraison.jpg" width="213" height="124" />
			<div>&nbsp;</div>
			<div>&nbsp;</div>
			{{#link-to 'contact' class="blink big font-1"}}Nous contacter{{/link-to}}
		</div>
		
		<div class="col-md-7">
			<div class="carousel-inner">
				{{#each model}}
				<div {{bind-attr class="css :item"}}>
					<img {{bind-attr src=url}} width="100%" height="415" />
				</div>
				{{/each}}
			</div>
		</div>
		
		<div class="col-md-3">
			<div class="visible-md-*">&nbsp;</div>
			<div class="fb-page" data-href="https://www.facebook.com/pages/GCautos/234904276569945?fref=ts" data-hide-cover="false" data-show-facepile="true" data-show-posts="false"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/pages/GCautos/234904276569945?fref=ts"><a href="https://www.facebook.com/pages/GCautos/234904276569945?fref=ts">GCautos</a></blockquote></div></div>
		</div>
		
	</div>
</div>
<!-- end slider -->

<div class="bg-grey">

	<div class="row">
		<div class="col-md-12">
			<h2 class="col-md-12">
				Nos dernières <span class="h2">occasions</span>
			</h2>
		</div>
	</div>

	<div id="voituresHome" class="row">
		<div class="col-md-12">

			{{#each v in voituresHome}}
			<div class="col-md-3">
				<div class="">
					{{#link-to 'detailsVoiture' v}} <img class="img-thumbnail "
						width="100%" {{bind-attr src=v.photo1}}> {{/link-to}}
				</div>
				<div class="lignes-2">
					<h2>{{#link-to 'detailsVoiture' v}}{{v.titre}}{{/link-to}}</h2>
					<h2 class="h2">{{#if
						v.isSold}}Vendu(e){{else}}{{{v.prixVente}}}&euro;{{/if}}</h2>
				</div>
				<div class="lignes-6">{{{v.description}}}</div>
			</div>
			{{/each}}

		</div>
	</div>
</div>

<div class="bg-white">
	<div class="row">
		<div>&nbsp;</div>
	</div>

	<div class="row">

		<sec:ifAllGranted roles="ROLE_ADMIN">
			<div class="modal fade" id="modalEditService">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			        <h4 class="modal-title">Nos services</h4>
			      </div>
			      <div class="modal-body">
			        {{view App.TinymceView id='serviceContenu' class='tinymce'}}
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
			        <button type="button" class="btn btn-primary" id="saveServiceBtn" {{action 'saveService'}}>Enregistrer</button>
			      </div>
			    </div>
			  </div>
			</div>
		</sec:ifAllGranted>
		
		{{#each service in services}}
		<div class="col-md-6">
			<h2>
				&nbsp;Nos <span class="h2">Services</span>
			</h2>
			
			<sec:ifAllGranted roles="ROLE_ADMIN">
				<a href="#" {{action 'showEditService'}}>Modifier</a>
			</sec:ifAllGranted>
			
			<div class="col-md-12">
				<strong class="strong-1">{{service.titre}}</strong>
			</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="col-md-12">{{{service.contenu}}}</div>
		</div>
		{{/each}}

		<div class="col-md-6">
			<h2 class="">
				Nos <span class="h2 inner-ident-1">News</span>
			</h2>
			
			<sec:ifAllGranted roles="ROLE_ADMIN">
				{{#link-to 'createNews'}}Ajouter une news{{/link-to}}
			</sec:ifAllGranted>
			
			<div class="">
				{{#each new in news}}
				<div class="">
					<div class="strong-1">{{{new.titre}}}</div>
					
					<sec:ifAllGranted roles="ROLE_ADMIN">
						<a href="#" {{action 'deleteNews' new.id}}>Supprimer</a>
					</sec:ifAllGranted>
					
					<div>{{{new.description}}}</div>
					<div class=""></div>
				</div>
				{{/each}}
			</div>
		</div>
	</div>
</div>