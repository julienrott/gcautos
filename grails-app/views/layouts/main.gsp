﻿<!doctype html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>GC Autos</title>
  <meta name="description" content="">

  <meta name="viewport" content="width=device-width">

	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,600' rel='stylesheet' type='text/css'>

	<r:require module="myStyle"/>

  <script type="text/javascript">
		var urlContext = '${grailsApplication.config.grails.serverURL}';
	</script>

  <script src="${resource(dir:'js',file:'libs/modernizr-2.5.3.min.js')}"></script>
	<g:layoutHead/>
	<r:layoutResources />
</head>
<body>
  <!--[if lt IE 7]><p class=chromeframe>Your browser is <em>ancient!</em> <a href="http://browsehappy.com/">Upgrade to a different browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to experience this site.</p><![endif]-->
	<div class="main">
	  <header>
			<div class="fl-r">
			</div>
			<div class="block-1 fl-r divtel">
				<a target="_blank" href="https://www.facebook.com/christophe.gcautoserstein"><r:img uri="/img/logo-facebook.png" width="86" height="26"/></a>
				<div class="font-1 fl-r">Tel: 06 63 56 43 43</div>
				<div class="clear"></div>
				<div class="font-1 fl-r"><a href="${createLink(controller:'contact')}" class="font-1">Nous contacter</a></div>
			</div>
			<div class="clear"></div>
			<div class="logo-bg">
				<h1><a href="${createLinkTo(dir:'/')}">GC AUTOS</a></h1>
			</div>
			<!-- menu -->
			<nav>
				<ul class="sf-menu sf-js-enabled sf-shadow">
					<li><a href="${createLinkTo(dir:'/')}"><g:message code="menu.accueil"/></a></li>
					<li><g:link controller="voitures" action="occasions"><g:message code="menu.occasions"/></g:link></li>
					<li><g:link controller="voitures" action="neuves"><g:message code="menu.neufs"/></g:link></li>
					<li><g:link controller="voitures" action="quads"><g:message code="menu.quads"/></g:link></li>
					<li><g:link controller="voitures" action="dirts"><g:message code="menu.dirts"/></g:link></li>
					<li><g:link controller="voitures" action="electriques"><g:message code="menu.electriques"/></g:link></li>
					<li class=""><a href="#">Divers</a>
						<ul id="diversMenu" style="display: none; visibility: hidden;">
						</ul>
					</li>
					<sec:ifLoggedIn>
						<sec:ifAllGranted roles="ROLE_ADMIN">
							<li class=""><a href="#">Admin menu</a>
								<ul style="display: none; visibility: hidden;">
									<li><g:link controller="voitures" action="vendues"><g:message code="menu.vendues"/></g:link></li>
									<li><g:link controller="voitures" action="create"><g:message code="menu.create.voiture"/></g:link></li>
									<li><g:link controller="photoSlider" ><g:message code="menu.manage.photoSlider"/></g:link></li>
									<li><g:link controller="accessoires" ><g:message code="menu.manage.accessoires"/></g:link></li>
									<li><g:link controller="statistiques" ><g:message code="menu.statistiques"/></g:link></li>
								</ul>
							</li>
						</sec:ifAllGranted>
						<li><g:link controller="logout">Logout (<sec:username/>)</g:link></li>
					</sec:ifLoggedIn>
				</ul>
				
				<div class="clear"></div>	
			</nav>
			<!-- end menu -->
			
		</header>
		
	  <div role="main" class="content">
			<g:layoutBody/>	
	  </div>
		
	  <footer>
			<ul class="list-1">
				<li class="active-2"><a href="${createLinkTo(dir:'/')}">HOME</a></li>
				<li><a href="#">ABOUT</a></li>
				<!--<li><a href="#">MAINTENANCE</a></li>
				<li><a href="#">REPAIR</a></li>
				<li><a href="#">PRICE LIST</a></li>
				<li><a href="#">LOCATIONS</a></li>-->
			</ul>
			<div class="fl-r">
				<div class="policy">GC Autos © 2012 <a href="#">Privacy Policy</a>
					<sec:ifNotLoggedIn>
						<g:link controller="login">Login</g:link>
					</sec:ifNotLoggedIn>
					<sec:ifLoggedIn>
						<g:link controller="logout">Logout (<sec:username/>)</g:link>
					</sec:ifLoggedIn>
				</div>
				<div class="fl-r ident-right-3"><!--{%FOOTER_LINK} --></div>
			</div>
			<div class="clear"></div>
		</footer>

	</div>

	<r:require modules="application"/>
	<script src="${resource(dir:'js',file:'libs/tiny_mce/tiny_mce_src.js')}"></script>
	<r:layoutResources />

  <script type="text/javascript">
		$(function() {
			$( "#dateAchat" ).datepicker();
		});
		$(function() {
			$( "#dateVente" ).datepicker();
		});

		$(function() {
			editor = tinyMCE.init({
        mode: "exact",
        theme: "advanced",
        editor_selector: "mceEditor",
        plugins: 'media',
        theme_advanced_buttons2_add : "media",
        elements: 'editor',
        editor_deselector: "mceNoEditor"
    	});
		});
	</script>

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
</body>
</html>
