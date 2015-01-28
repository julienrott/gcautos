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
	
	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	  ga('create', 'UA-3781580-4', 'auto');
	  ga('send', 'pageview');
	</script>
	
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
		<g:render template="ember/body"/>
	</script>
	
	<script type="text/x-handlebars" id="index">
		<g:render template="ember/index"/>
	</script>
	
	<script type="text/x-handlebars" id="contact">
		<g:render template="ember/contact"/>
	</script>
	
	<script type="text/x-handlebars" id="accessoires">
		<g:render template="ember/accessoires"/>
	</script>
	
	<script type="text/x-handlebars" id="listeVoitures">
		<g:render template="ember/listeVoitures"/>
	</script>
	
	<script type="text/x-handlebars" id="detailsVoiture">
		<g:render template="ember/detailsVoiture"/>
	</script>
	
	<script type="text/x-handlebars" id="allNews">
		<g:render template="ember/allNews"/>
	</script>
	
	<sec:ifAllGranted roles="ROLE_ADMIN">
	
		<script type="text/x-handlebars" id="editVoiture">
			<g:render template="ember/editVoiture"/>
		</script>
	
		<script type="text/x-handlebars" id="createVoiture">
			<g:render template="ember/createVoiture"/>
		</script>
	
		<script type="text/x-handlebars" id="createNews">
			<g:render template="ember/createNews"/>
		</script>
	
		<script type="text/x-handlebars" id="editPhotoSlider">
			<g:render template="ember/editPhotoSlider"/>
		</script>
	
	</sec:ifAllGranted>
	
	<div id="spinner" class="spinner" style="">
		<span id="spinnerSprite" class="spinnerSprite"></span>
		<span style="vertical-align: super; padding-left: 5px;">Chargement&hellip;</span>
	</div>
	
	<div id="okMsg" class="errorMsg btn btn-success" style="display:none;">
		<span id="spinnerSprite" class="spinnerSprite"></span>
		<span style="vertical-align: super; padding-left: 5px;">OK&hellip;</span>
	</div>
	
	<div id="errorMsg" class="errorMsg btn btn-danger" style="display:none;">
		<span id="spinnerSprite" class="spinnerSprite"></span>
		<span style="vertical-align: super; padding-left: 5px;">Une erreur s'est produite&hellip;</span>
	</div>
	
	<div class="row" style="text-align: center;" id="pubsClickInText">
		<script src="//tags.clickintext.net/t2791gXkYV2dm" title="Classic (IAB) footer"></script>
	</div>

</body>
</html>
