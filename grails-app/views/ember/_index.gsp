
<!-- slider -->
<div id="myCarousel" class="carousel slide">
	<div class="carousel-inner">
		{{#each model}}
		<div {{bind-attr class="css :item"}}>
			<img {{bind-attr src=url}} width="100%" height="415" />
		</div>
		{{/each}}
	</div>
</div>
<!-- end slider -->

<div class="bg-grey">

	<div class="row">
		<div>&nbsp;</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<h2 class="span12 center">
				<span>Les véhicules sont visibles uniquement sur rendez-vous</span>
			</h2>
		</div>
	</div>

	<div class="row center">
		<div class="col-md-5">
			<asset:image src="livraison.jpg" width="213" height="124" />
		</div>

		<div class="col-md-2">
			<div>&nbsp;</div>
			<div>&nbsp;</div>
			{{#link-to 'contact' class="blink big font-1"}}Nous
			contacter{{/link-to}}
			<div>&nbsp;</div>
			<div>&nbsp;</div>
		</div>

		<div class="col-md-5">
			<iframe
				src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2Fpages%2FGC-AUTOS-V%C3%A9hicules-Neufs-Occasions-Quads-Dirt-Bikes-Buggy-Alsace%2F234904276569945&amp;width&amp;height=300&amp;colorscheme=light&amp;show_faces=true&amp;header=true&amp;stream=false&amp;show_border=true&amp;"
				scrolling="no" frameborder="0"
				style="border: none; overflow: hidden; height: 123px;"
				allowtransparency="true"></iframe>
		</div>
	</div>

	<div class="row">
		<div>&nbsp;</div>
	</div>

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
		{{#each service in services}}
		<div class="col-md-6">
			<h2>
				&nbsp;Nos <span class="h2">Services</span>
			</h2>
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