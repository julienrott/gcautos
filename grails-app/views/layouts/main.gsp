<%@ page import="fr.gcautos.Accessoire" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="fr" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="fr" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="fr" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="fr" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="fr" class="no-js"><!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title><g:layoutTitle default="Grails"/></title>
	<meta name="description" content="GC AUTOS : Situé à Matzenheim en Alsace (Bas-Rhin 67) Vente Véhicules neuf et occasions, vente et réparation de quads pour enfants ados et adultes, dirt bike, Buggy.">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
	<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
	<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
	
	<script type="text/javascript">
		var urlContext = '${grailsApplication.config.grails.serverURL}';
	</script>
	
		<asset:stylesheet src="application.css"/>
	<asset:javascript src="application.js"/>
	
	<sec:ifAllGranted roles="ROLE_ADMIN">
		<asset:javascript src="tiny_mce-3.5.8/jquery.tinymce.js"/>
	</sec:ifAllGranted>
	
	<g:layoutHead/>
</head>
<body>

	<div style="display: none;" itemscope
		itemtype="http://schema.org/LocalBusiness">

		<span itemprop="name">GC Autos</span> <span itemprop="description">GC
			AUTOS : Situé à Matzenheim en Alsace (Bas-Rhin 67) Vente Véhicules
			neuf et occasions, vente et réparation de quads pour enfants ados et
			adultes, dirt bike, Buggy.</span>
		<div itemprop="address" itemscope
			itemtype="http://schema.org/PostalAddress">
			<span itemprop="streetAddress">1 rue du Muhlwasser</span> <span
				itemprop="addressLocality">Matzenheim</span> <span
				itemprop="postalCode">67150</span> <span itemprop="addressCountry">France</span>
		</div>
		<span itemprop="telephone">06 63 56 43 43</span>
	</div>

	<script type="text/x-handlebars">
	<div class="navbar navbar-default navbar-fixed-top">
		<div class="container navbar-container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-navbar-collapse-1">
        			<span class="sr-only">Toggle navigation</span>
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>
      			</button>
      			{{#link-to 'index' title="GC AUTOS"}}
					<asset:image src="logo-bg.png" width="208" height="80" class="navbar-brand"/>
				{{/link-to}}
			</div>

			<div class="collapse navbar-collapse" id="main-navbar-collapse-1">

				<div class="nav navbar-nav navbar-right col-md-2">
					<div class="font-1"><a href="tel:+33663564343">Tel: 06 63 56 43 43</a></div>
				</div>
				<div class="nav navbar-nav navbar-right col-md-2">
					<div class="font-1">{{#link-to 'contact'}}Nous contacter{{/link-to}}</div>
				</div>
				
				<div class="nav navbar-nav navbar-right col-md-5">
					<iframe src="//www.facebook.com/plugins/like.php?href=https%3A%2F%2Fwww.facebook.com%2Fpages%2FGC-AUTOS-V%C3%A9hicules-Neufs-Occasions-Quads-Dirt-Bikes-Buggy-Alsace%2F234904276569945&amp;width&amp;layout=standard&amp;action=like&amp;show_faces=false&amp;share=false&amp;height=20&amp;" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:20px; width: 100%;" allowTransparency="true"></iframe>
				</div>
				
				<ul class="nav navbar-nav navbar-right nav-custom">
					<li>{{#link-to 'index'}}<span class="glyphicon glyphicon-home icon-white"></span>{{/link-to}}</li>
					<li>{{#link-to 'occasions'}}Occasions{{/link-to}}</li>
					<li>{{#link-to 'neuves'}}<g:message code="menu.neufs"/>{{/link-to}}</li>
					<li>{{#link-to 'quads'}}<g:message code="menu.quads"/>{{/link-to}}</li>
					<li>{{#link-to 'buggys'}}<g:message code="menu.buggys"/>{{/link-to}}</li>
					<li>{{#link-to 'dirts'}}<g:message code="menu.dirts"/>{{/link-to}}</li>
					<li>{{#link-to 'electriques'}}<g:message code="menu.electriques"/>{{/link-to}}</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Divers<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<g:each in="${Accessoire.list().sort{it.titre}}">
								<li>{{#link-to 'accessoires' ${it.id} }}${it.titre}{{/link-to}}</li>
							</g:each>
						</ul>
					</li>
					<sec:ifLoggedIn>
						<sec:ifAllGranted roles="ROLE_ADMIN">
							<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Admin menu<b class="caret"></b></a>
								<ul class="dropdown-menu">
									<li><g:link controller="voitures" action="create"><g:message code="menu.create.voiture"/></g:link></li>
									<li><g:link controller="photoSlider" ><g:message code="menu.manage.photoSlider"/></g:link></li>
									<li><g:link controller="accessoires" ><g:message code="menu.manage.accessoires"/></g:link></li>
								</ul>
							</li>
						</sec:ifAllGranted>
					</sec:ifLoggedIn>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="container main-container">
		
			{{outlet}}
			<g:layoutBody/>
		
		<div class="footer">
			<div class="row">
				<div id="divCB" class="col-md-8">
				    <span class="policy">Paiement par carte bancaire</span>
				    <asset:image src="cartes-bancaires.jpg" width="100" height="40"/>
				    <asset:image src="3x.jpg" width="90" height="40"/>
				</div>
				<div class="col-md-4">
					<div class="policy">GC Autos © <g:formatDate format="yyyy" date="${new Date()}"/>
						<sec:ifNotLoggedIn>
							<g:link controller="login" action="auth">Login</g:link>
						</sec:ifNotLoggedIn>
						<sec:ifLoggedIn>
							<g:form name="logoutform" controller="logout" >
								<g:link onclick="javascript:jQuery('#logoutform').submit();">Logout (<sec:username/>)</g:link>
							</g:form>
						</sec:ifLoggedIn>
					</div>
				</div>
			</div>

			<div class="row">&nbsp;</div>
			
			<div class="row">
				<div class="col-md-12">
					<script type="text/javascript" src="http://tags.clickintext.net/t2791gXkYV2dm" title="Classic (IAB) footer"></script>
				</div>
			</div>
	
		</div>
	</div>
	</script>
	
	<script type="text/x-handlebars" id="index">
		<!-- slider -->
		<div id="myCarousel" class="carousel slide">
			<div class="carousel-inner">
				{{#each model}}
					<div {{bind-attr class="css :item"}}>
						<img {{bind-attr src=url}}  width="100%" height="415"/>
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
				<asset:image src="livraison.jpg" width="213" height="124"/>
			</div>
			
			<div class="col-md-2">
				<div>&nbsp;</div>
				<div>&nbsp;</div>
				{{#link-to 'contact' class="blink big font-1"}}Nous contacter{{/link-to}}
				<div>&nbsp;</div>
				<div>&nbsp;</div>
			</div>
			
			<div class="col-md-5">
				<iframe src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2Fpages%2FGC-AUTOS-V%C3%A9hicules-Neufs-Occasions-Quads-Dirt-Bikes-Buggy-Alsace%2F234904276569945&amp;width&amp;height=300&amp;colorscheme=light&amp;show_faces=true&amp;header=true&amp;stream=false&amp;show_border=true&amp;" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:123px;" allowtransparency="true"></iframe>
			</div>
		</div>
	
		<div class="row">
			<div>&nbsp;</div>
		</div>
		
			<div class="row">
			<div class="col-md-12">
				<h2 class="col-md-12">Nos dernières <span class="h2">occasions</span></h2>
			</div>
			</div>
			
			<div id="voituresHome" class="row">
			<div class="col-md-12">
				
				{{#each v in voituresHome}}
					<div class="col-md-3">
						<div class="">
							{{#link-to 'detailsVoiture' v}}
								<img class="img-thumbnail " width="100%" {{bind-attr src=v.photo1}}>
							{{/link-to}}
						</div>
						<div class="lignes-2">
							<h2>{{#link-to 'detailsVoiture' v}}{{v.titre}}{{/link-to}}</h2>
							<h2 class="h2">{{#if v.isSold}}Vendu(e){{else}}{{{v.prixVente}}}&euro;{{/if}}</h2>
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
				<h2>&nbsp;Nos <span class="h2">Services</span></h2>
				<div class="col-md-12">
					<strong class="strong-1">{{service.titre}}</strong>
				</div>
				<div class="row">&nbsp;</div>
				<div class="row">&nbsp;</div>
				<div class="col-md-12">
					{{{service.contenu}}}
				</div>
			</div>
			{{/each}}

			<div class="col-md-6">
				<h2 class="">Nos <span class="h2 inner-ident-1">News</span></h2>
				<div class="">
				{{#each new in news}}
					<div class="">
						<div class="strong-1">{{{new.titre}}}</div>
						<div>{{{new.description}}}</div>
						<div class=""></div>
					</div>
				{{/each}}
				</div>
			</div>
		</div>
	</div>

	</script>
	
	<script type="text/x-handlebars" id="contact">
	<div class="bg-white">
		<section>
			<article>&nbsp;</article>
			<article>
				<center><h2 class="">Les véhicules sont visibles uniquement sur rendez-vous</h2></center>
			</article>
		</section>

		<div class="">&nbsp;</div>

		<div class="voitureListe">
			<div role="main">
				<section id="">
					<div class="">
						<div class="">
							<h2 class="">GC Autos</h2>
							<div class="">1 rue du Muhlwasser</div>
							<div class="">67150 Matzenheim</div>
							<div class="">Tel: 06 63 56 43 43</div>
							<div class="">email: <a href="mailto:gc.autos@orange.fr?subject=${'[Contact du site]'.encodeAsHTML()}">gc.autos[at]orange.fr</a></div>
						</div>
						<div class="clear"></div>
					</div>

					<article>&nbsp;</article>

				</section>
  			</div>
		</div>
		<div class="">&nbsp;</div>
	</div>
	</script>
	
	<script type="text/x-handlebars" id="accessoires">
	<div class="bg-white">
    	<div>&nbsp;</div>
    	
		<div class="voitureListe">
			<div class="row">
				<h2 class="col-md-12">{{titre}}</h2>
				<div class="col-md-12">{{{contenu}}}</div>
			</div>

			<sec:ifAllGranted roles="ROLE_ADMIN">
			<div class="row">
				<g:form controller="accessoires" action="save" name="form" id="${accessoire?.id}">
					<div><g:textField name="titre" value="${accessoire?.titre}" /></div>
					<div><textarea id="editor" name="contenu" class="tinymce">
						${accessoire?.contenu}
					</textarea></div>
					<g:submitButton name="enregistrer" value="enregistrer"/>
				</g:form>
			</div>
			</sec:ifAllGranted>
		</div>
		<div class="">&nbsp;</div>
	</div>
	</script>
	
		<script type="text/x-handlebars" id="listeVoitures">
		<div class="bg-white ">

		<div class="paginate">
			{{#each page in meta.pagesTotal}}
				{{#link-to meta.route (query-params page=page) class="step"}}
					{{page}}
				{{/link-to}}
			{{/each}}
		</div>

		{{#each voiture in model}}
		<div class="voitureListe">
			<div class="row">
				<h2 class="col-md-10">
					{{#link-to 'detailsVoiture' voiture}}
						{{#if voiture.isNew}}<span class="blink">Nouveauté : </span>{{/if}} {{voiture.titre}}
					{{/link-to}}
				</h2>
				<h2 class="h2 col-md-2">
					{{#if voiture.isSold}}Vendu(e){{else}}{{{voiture.prixVente}}}&euro;{{/if}}
				</h2>
			</div>

			<sec:ifAllGranted roles="ROLE_ADMIN">
				<div class="">
					{{#link-to 'editVoiture' voiture.id}}modifier{{/link-to}}&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<a href="${createLink(controller:'voitures', action:'delete', id:"")}">supprimer</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<div>&nbsp;</div>
				</div>
			</sec:ifAllGranted>

			<div class="row">
				<div class="col-md-12">
					{{{voiture.description}}}
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					{{#link-to 'detailsVoiture' voiture}}
						<img class="img-thumbnail col-md-6" {{bind-attr src=voiture.photo1}} />
					{{/link-to}}
					{{#link-to 'detailsVoiture' voiture}}
						<img class="img-thumbnail col-md-6" {{bind-attr src=voiture.photo2}} />
					{{/link-to}}
				</div>
			</div>
		</div>
		{{else}}
			<div class="">&nbsp;</div>
			<div class="">&nbsp;</div>
			<div class="">&nbsp;</div>
			
			<div class="voitureListe">
				<strong class="strong-1">
					Désolé, aucun véhicule n'est à vendre dans cette catégorie pour le moment. 
					Revenez vérifier régulièrement.
				</strong>
			</div>
		
			<div class="">&nbsp;</div>
			<div class="">&nbsp;</div>
			<div class="">&nbsp;</div>
		{{/each}}

		<div class="paginate">
			{{#each page in meta.pagesTotal}}
				{{#link-to meta.route (query-params page=page) class="step"}}
					{{page}}
				{{/link-to}}
			{{/each}}
		</div>

		</div>
		</script>
	
		<script type="text/x-handlebars" id="detailsVoiture">
		<div class="bg-white ">
		<div>&nbsp;</div>
		<div class="voitureListe">
			<div class="row">
				<h2 class="col-md-10">
					{{#if isNew}}<span class="blink">Nouveauté : </span>{{/if}} {{titre}}
				</h2>
				<h2 class="h2 col-md-2">
					{{#if isSold}}Vendu(e){{else}}{{{prixVente}}}&euro;{{/if}}
				</h2>
			</div>

			<sec:ifAllGranted roles="ROLE_ADMIN">
				<div class="">
					{{#link-to 'editVoiture' id}}modifier{{/link-to}}&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<a href="${createLink(controller:'voitures', action:'delete', id:"")}">supprimer</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<div>&nbsp;</div>
				</div>
			</sec:ifAllGranted>

			<div class="row">
				<div class="col-md-12">
					{{{description}}}
				</div>
			</div>

			{{#each photo in photos}}
			<div class="row">
				<div class="photo col-md-12">
					<img class="img-thumbnail col-md-12" {{bind-attr src=photo.url}} />
					<sec:ifAllGranted roles="ROLE_ADMIN">
						<span {{bind-attr id=photo.id}} {{action 'deletePhoto' model}} class="deletePhoto" title="Supprimer"></span>
					</sec:ifAllGranted>
				</div>
			</div>
			{{/each}}
		</div>
		<div>&nbsp;</div>
		</div>
		</script>
	
	<script type="text/x-handlebars" id="editVoiture">
	<div class="bg-white">
		<div>&nbsp;</div>
		<div class="voitureListe ">

			<div class="row ">
				<h2 class="col-md-12">
					{{#if isNew}}<span class="blink">Nouveauté : </span>{{/if}} {{titre}}
				</h2>
			</div>

			<div class="row col-md-12">
				{{{description}}}
			</div>

			<div class="row col-md-12">&nbsp;</div>

			<div class="row col-md-12">
				Titre {{input type='text' name='titre' value=titre}}
			</div>

			<div class="row col-md-12">
				Type {{view Ember.Select
					content=vehicleTypes
					optionValuePath="content.type"
					optionLabelPath="content.label"
					value=vehicleType}}
			</div>

			<div class="row col-md-12">
				Mention {{view Ember.Select
					content=vehicleMentions
					optionValuePath="content.type"
					optionLabelPath="content.label"
					value=mention}}
			</div>

			<div class="row col-md-12">&nbsp;</div>

			<div class="row col-md-12">
            	Description
				{{view App.TinymceView valueBinding='description' class='tinymce'}}
			</div>

			<div class="row col-md-12">&nbsp;</div>

			<div class="row col-md-12">
				<button {{action 'save'}}>Enregistrer</button>
			</div>

			<div class="row col-md-12">&nbsp;</div>

			<div class="row col-md-12">
				<h2 class="col-md-12">Photos</h2>
			</div>

			<button {{action 'reloadCar'}} id="reloadCarBtn" style="display: none;">reload</button>

			<div class="row col-md-12">
				<div id="divAjaxUploader" class="col-md-2 btn btn-primary">{{view App.AjaxUploaderView}}</div>
			</div>
			
			<div class="row col-md-12">&nbsp;</div>
			
			<div class="row ">
				{{#each photo in photos}}
					<div class="photo col-md-3">
						<img class="img-thumbnail col-md-12" {{bind-attr src=photo.url}} />
						<sec:ifAllGranted roles="ROLE_ADMIN">
							<span {{action 'reloadPhoto' model.id photo.id}} class="glyphicon glyphicon-refresh refreshPhoto" title="Recharger"></span>
							<span {{bind-attr id=photo.id}} {{action 'deletePhoto' model.id photo.id}} class="deletePhoto" title="Supprimer"></span>
						</sec:ifAllGranted>
					</div>
				{{/each}}
			</div>
		</div>
		<div>&nbsp;</div>
	</div>
	</script>
	
		<div id="spinner" class="spinner" style="display:none;">Chargement&hellip;</div>
		
		<g:if env="production">
			<script type="text/javascript">
				var _gaq = _gaq || [];
				_gaq.push([ '_setAccount', 'UA-3781580-4' ]);
				_gaq.push([ '_trackPageview' ]);
				(function() {
					var ga = document.createElement('script');
					ga.type = 'text/javascript';
					ga.async = true;
					ga.src = ('https:' == document.location.protocol ? 'https://ssl'
							: 'http://www')
							+ '.google-analytics.com/ga.js';
					var s = document.getElementsByTagName('script')[0];
					s.parentNode.insertBefore(ga, s);
				})();
			</script>
	
	
			<script type="text/javascript" src="http://tags.clickintext.net/t2ELJBbAJGQH2" title="Slide In"></script>
			<script type="text/javascript" src="http://tags.clickintext.net/t2vdfy9ppS6Qs" title="Site Under"></script>
	
		</g:if>
</body>
</html>
