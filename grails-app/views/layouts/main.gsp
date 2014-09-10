<%@ page import="com.gcautos.domain.Accessoire" %>
<!doctype html>
<html lang="fr">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title><g:layoutTitle default="GC Autos"/></title>
	<meta name="description" content="GC AUTOS : Situé à Matzenheim en Alsace (Bas-Rhin 67) Vente Véhicules neuf et occasions, vente et réparation de quads pour enfants ados et adultes, dirt bike, Buggy.">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<style>
	body{
		padding-top: 92px;
	}
	</style>

	<r:require modules="jquery,bootstrap-css,bootstrap-responsive-css,myStyle,fileuploader"/>

	<script type="text/javascript">
		var urlContext = '${grailsApplication.config.grails.serverURL}';
	</script>

	<g:layoutHead/>
	<r:layoutResources />
</head>
<body>
	<div style="display: none;" itemscope
			itemtype="http://schema.org/LocalBusiness">
		
		<span itemprop="name">GC Autos</span>
		<span itemprop="description">GC AUTOS : Situé à Matzenheim en Alsace (Bas-Rhin 67) Vente Véhicules neuf et occasions, vente et réparation de quads pour enfants ados et adultes, dirt bike, Buggy.</span>
		<div itemprop="address" itemscope
				itemtype="http://schema.org/PostalAddress">
			<span itemprop="streetAddress">1 rue du Muhlwasser</span>
			<span itemprop="addressLocality">Matzenheim</span>
			<span itemprop="postalCode">67150</span>
			<span itemprop="addressCountry">France</span>
		</div>
		<span itemprop="telephone">06 63 56 43 43</span>
	</div>

<script type="text/x-handlebars">
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner navbar-inner-custom">
			<div class="container">
			
				<div class="divtel pull-right span3">
					<div class="font-1">Tel: 06 63 56 43 43</div>
					<div class="font-1">{{#link-to 'contact'}}Nous contacter{{/link-to}}</div>
				</div>
				
				<div class="pull-right span3">
					<iframe src="//www.facebook.com/plugins/like.php?href=https%3A%2F%2Fwww.facebook.com%2Fpages%2FGC-AUTOS-V%C3%A9hicules-Neufs-Occasions-Quads-Dirt-Bikes-Buggy-Alsace%2F234904276569945&amp;width&amp;layout=standard&amp;action=like&amp;show_faces=false&amp;share=false&amp;height=40&amp;" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:40px;" allowTransparency="true"></iframe>
				</div>
				
				<button data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar" type="button">
	            	<span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		        </button>
		        
		        <div class="span4" style="margin-left: 0;">
					{{#link-to 'index' title="GC AUTOS"}}
						<img src="${createLinkTo(dir:'img', file: 'logo-bg.png')}"/>
					{{/link-to}}
				</div>
				
		        <div class="nav-collapse collapse">
					<ul class="nav nav-pills pull-right">
						<li>{{#link-to 'index'}}<i class="icon-home icon-white"></i>{{/link-to}}</li>
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
	</div>
	
	<div class="container narrow">
		
		<!-- <div class="container content row-fluid"> -->
		<div class="content row-fluid">
			
			
				{{outlet}}
			
		
			<g:layoutBody/>
		</div>
		
		<div class="footer row-fluid">
			<div class="row-fluid">
				<ul class="list-1 span2">
					<li class="active-2">{{#link-to 'index' title="GC AUTOS"}}HOME{{/link-to}}</a></li>
				</ul>
				<div id="divCB" class="span6">
				    <span class="policy">Paiement par carte bancaire</span>
				    <img src="${createLinkTo(dir: "images", file: "cartes-bancaires.jpg")}"/>
				    <img src="${createLinkTo(dir: "images", file: "3x.jpg")}"/>
				</div>
				<div class="span4">
					<div class="policy">GC Autos © <g:formatDate format="yyyy" date="${new Date()}"/> <a href="#">Privacy Policy</a>
						<sec:ifNotLoggedIn>
							<g:link controller="login" action="auth">Login</g:link>
						</sec:ifNotLoggedIn>
						<sec:ifLoggedIn>
							<g:link controller="logout">Logout (<sec:username/>)</g:link>
						</sec:ifLoggedIn>
					</div>
				</div>
			</div>

			<div class="row-fluid">&nbsp;</div>
			
			<div class="row-fluid">
				<div class="offset2">
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
	
		<div class="row-fluid">
			<div>&nbsp;</div>
		</div>
		
		<div class="row-fluid">
			<h2 class="span12 center">
				<span>Les véhicules sont visibles uniquement sur rendez-vous</span>
			</h2>
		</div>
		<div class="row-fluid center">
			<div class="span5">
				<img src="${resource(dir: 'images', file: 'livraison.jpg')}">
			</div>
			
			<div class="span2">
				<div>&nbsp;</div>
				<div>&nbsp;</div>
				{{#link-to 'contact' class="blink big"}}Nous contacter{{/link-to}}
				<div>&nbsp;</div>
				<div>&nbsp;</div>
			</div>
			
			<div class="span5">
				<iframe src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2Fpages%2FGC-AUTOS-V%C3%A9hicules-Neufs-Occasions-Quads-Dirt-Bikes-Buggy-Alsace%2F234904276569945&amp;width&amp;height=300&amp;colorscheme=light&amp;show_faces=true&amp;header=true&amp;stream=false&amp;show_border=true&amp;" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:123px;" allowtransparency="true"></iframe>
			</div>
		</div>
	
		<div class="row-fluid">
			<div>&nbsp;</div>
		</div>
		
		<div class="margin10">
			<h2 class="span12">Nos dernières <span class="h2">occasions</span></h2>
			
			<div id="voituresHome" class="row-fluid">
				
				{{#each v in voituresHome}}
					<div class="span3">
						<div class="span12">
							{{#link-to 'detailsVoiture' v}}
								<img class="img-polaroid span12" width="100%" {{bind-attr src=v.photo1}}>
							{{/link-to}}
						</div>
						<div class="lignes-2 span12">
							<h2>{{#link-to 'detailsVoiture' v}}{{v.titre}}{{/link-to}}</h2>
							<h2 class="h2">{{#if v.isSold}}Vendu(e){{else}}{{{v.prixVente}}}&euro;{{/if}}</h2>
						</div>
						<div class="lignes-6 span12">{{{v.description}}}</div>
					</div>
				{{/each}}
				
			</div>
		</div>
	</div>

		<div class="row-fluid">
			<div>&nbsp;</div>
		</div>
		
		<div class="row-fluid">
			<div class="span6">
				<h2>&nbsp;Nos <span class="h2">Services</span></h2>
				<div id="service" class="margin10"></div>
			</div>

			<div class="span6">
				<h2 class="ident-bot-5 ident-top-2">Nos <span class="h2 inner-ident-1">News</span></h2>
				<div class="block-2">
					<div id="news" class="margin10"></div>
				</div>
			</div>
		</div>

	</script>
	
	<script type="text/x-handlebars" id="contact">
		<section>
			<article>&nbsp;</article>
			<article>
				<center><h2 class="ident-bot-5 ident-top-2">Les véhicules sont visibles uniquement sur rendez-vous</h2></center>
			</article>
		</section>

		<div class="">&nbsp;</div>

		<div class="voitureListe">
			<div role="main">
				<section id="content-2">
					<div class="container_12">
						<div class="ident-bot-4">
							<h2 class="ident-bot-5 ident-top-2">GC Autos</h2>
							<div class="font-3">1 rue du Muhlwasser</div>
							<div class="font-3">67150 Matzenheim</div>
							<div class="font-3">Tel: 06 63 56 43 43</div>
							<div class="font-3">email: <a href="mailto:gc.autos@orange.fr?subject=${'[Contact du site]'.encodeAsHTML()}">gc.autos[at]orange.fr</a></div>
						</div>
						<div class="clear"></div>
					</div>

					<article>&nbsp;</article>

				</section>
  			</div>
		</div>
	</script>
	
	<script type="text/x-handlebars" id="accessoires">

    	<div>&nbsp;</div>
    	
		<div class="voitureListe">
			<div class="row-fluid">
				<h2>{{titre}}</h2>
				<div class="customDivReset">{{{contenu}}}</div>
			</div>

			<sec:ifAllGranted roles="ROLE_ADMIN">
			<div class="row-fluid">
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

	</script>
	
	<script type="text/x-handlebars" id="listeVoitures">
		<div class="paginate">
			{{#each page in meta.pagesTotal}}
				{{#link-to meta.route (query-params page=page) class="step"}}
					{{page}}
				{{/link-to}}
			{{/each}}
		</div>

		{{#each voiture in model}}
		<div class="voitureListe">
			<div class="row-fluid">
				<h2 class="span10">
					{{#link-to 'detailsVoiture' voiture}}
						{{#if voiture.isNew}}<span class="blink">Nouveauté : </span>{{/if}} {{voiture.titre}}
					{{/link-to}}
				</h2>
				<h2 class="h2 span2">
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

			<div>
				{{{voiture.description}}}
			</div>

			<div class="row-fluid">
					{{#link-to 'detailsVoiture' voiture}}
						<img class="img-polaroid span6" {{bind-attr src=voiture.photo1}} />
					{{/link-to}}
					{{#link-to 'detailsVoiture' voiture}}
						<img class="img-polaroid span6" {{bind-attr src=voiture.photo2}} />
					{{/link-to}}
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
				{{#link-to 'occasions' (query-params page=page) class="step"}}
					{{page}}
				{{/link-to}}
			{{/each}}
		</div>

	</script>
	
	<script type="text/x-handlebars" id="detailsVoiture">
		<div>&nbsp;</div>
		<div class="voitureListe">
			<div class="row-fluid">
				<h2 class="span10">
					{{#if isNew}}<span class="blink">Nouveauté : </span>{{/if}} {{titre}}
				</h2>
				<h2 class="h2 span2">
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

			<div>
				{{{description}}}
			</div>

			<div class="row-fluid">
				{{#each photo in photos}}
					<div class="photo span5">
						<img class="img-polaroid span12" {{bind-attr src=photo.url}} />
						<sec:ifAllGranted roles="ROLE_ADMIN">
							<span {{bind-attr id=photo.id}} {{action 'deletePhoto' model}} class="deletePhoto" title="Supprimer"></span>
						</sec:ifAllGranted>
					</div>
				{{/each}}
			</div>
		</div>
	</script>
	
	<script type="text/x-handlebars" id="editVoiture">
		<div>&nbsp;</div>
		<div class="voitureListe">

			<div class="row-fluid">
				<h2 class="span10">
					{{#if isNew}}<span class="blink">Nouveauté : </span>{{/if}} {{titre}}
				</h2>
			</div>

			<div>
				{{{description}}}
			</div>

			<div class="">&nbsp;</div>

			<div class="row-fluid">
				Titre {{input type='text' name='titre' value=titre}}
			</div>

			<div class="row-fluid">
				Type {{view Ember.Select
					content=vehicleTypes
					optionValuePath="content.type"
					optionLabelPath="content.label"
					value=vehicleType}}
			</div>

			<div class="row-fluid">
				Mention {{view Ember.Select
					content=vehicleMentions
					optionValuePath="content.type"
					optionLabelPath="content.label"
					value=mention}}
			</div>

			<div class="">&nbsp;</div>

			<div>
            	Description
				{{view App.TinymceView valueBinding='description' class='tinymce'}}
			</div>

			<div class="">&nbsp;</div>

			<div class="row-fluid">
				<button {{action 'save'}}>Enregistrer</button>
			</div>

			<div class="">&nbsp;</div>

			<div class="row-fluid">
				<h2 class="span10">Photos</h2>
			</div>

			<button {{action 'reloadCar'}} id="reloadCarBtn" style="display: none;">reload</button>

			<div id="divAjaxUploader">{{view App.AjaxUploaderView}}</div>

			<div class="row-fluid">
				{{#each photo in photos}}
					<div class="photo span5">
						<img class="img-polaroid span12" {{bind-attr src=photo.url}} />
						<sec:ifAllGranted roles="ROLE_ADMIN">
							<span {{bind-attr id=photo.id}} {{action 'deletePhoto' model.id photo.id}} class="deletePhoto" title="Supprimer"></span>
						</sec:ifAllGranted>
					</div>
				{{/each}}
			</div>
		</div>
	</script>
	
	<div id="spinner" class="spinner" style="display:none;">Chargement&hellip;</div>
	
	<r:require modules="application,bootstrap-transition"/>
	
	<r:layoutResources />

	<g:if env="production">
		<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push(['_setAccount', 'UA-3781580-4']);
		_gaq.push(['_trackPageview']);
		(function() {
		  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		})();
		</script>

	</g:if>

	<script type="text/javascript" src="http://tags.clickintext.net/t2ELJBbAJGQH2" title="Slide In"></script>
	<!-- <script type="text/javascript" src="http://tags.clickintext.net/t2bxzgUWTO4WH" title="Footer Expand"></script> -->

</body>
</html>
