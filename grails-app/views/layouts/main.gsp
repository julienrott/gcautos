﻿<!doctype html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Backbone</title>
  <meta name="description" content="">

  <meta name="viewport" content="width=device-width">

<!--	<link rel="stylesheet" type="text/css" 
    		href="https://ajax.googleapis.com/ajax/libs/dojo/1.7.2/dijit/themes/claro/claro.css">
	<link rel="stylesheet" type="text/css" 
    		href="https://ajax.googleapis.com/ajax/libs/dojo/1.7.2/dijit/themes/claro/Calendar.css">
	<link rel="stylesheet" type="text/css" 
    		href="https://ajax.googleapis.com/ajax/libs/dojo/1.7.2/dijit/themes/claro/form/Common.css">
	<link rel="stylesheet" type="text/css" 
    		href="https://ajax.googleapis.com/ajax/libs/dojo/1.7.2/dojo/resources/dojo.css">
	<link rel="stylesheet" type="text/css" 
    		href="https://ajax.googleapis.com/ajax/libs/dojo/1.7.2/dijit/themes/dijit.css">

	<script src="https://ajax.googleapis.com/ajax/libs/dojo/1.7.2/dojo/dojo.js" data-dojo-config="parseOnLoad:true, isDebug: true"></script>

  <script src="${resource(dir:'js',file:'gcautos.js')}"></script>
-->
	<link rel="stylesheet" href="${resource(dir:'css',file:'ui-lightness/jquery-ui-1.8.21.custom.css')}" type="text/css" media="screen, projection">
  
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,600' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="${resource(dir:'css',file:'style.css')}">
	
	<link rel="stylesheet" href="${resource(dir:'css',file:'blueprint/screen.css')}" type="text/css" media="screen, projection">
  <link rel="stylesheet" href="${resource(dir:'css',file:'blueprint/print.css')}" type="text/css" media="print">
	<!--[if lt IE 8]><link rel="stylesheet" href="${resource(dir:'css',file:'blueprint/ie.css')}" type="text/css" media="screen, projection"><![endif]-->
	<link rel="stylesheet" href="${resource(dir:'css',file:'blueprint/plugins/fancy-type/screen.css')}" type="text/css" media="screen, projection">

  <link rel="stylesheet" href="${resource(dir:'css',file:'reset.css')}">
  <link rel="stylesheet" href="${resource(dir:'css',file:'custom.css')}">
  <link rel="stylesheet" href="${resource(dir:'css',file:'grid.css')}">
	
  <script src="${resource(dir:'js',file:'libs/modernizr-2.5.3.min.js')}"></script>
	<g:layoutHead/>
  	<r:layoutResources />
</head>
<body class="claro">
  <!--[if lt IE 7]><p class=chromeframe>Your browser is <em>ancient!</em> <a href="http://browsehappy.com/">Upgrade to a different browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to experience this site.</p><![endif]-->
	<div class="main">
	  <header>
			<div class="block-1 fl-r">
				<p class="font-1 fl-r">Tel: <a class="font-1" href="tel:+33663564343">+33 6 63 56 43 43</a></p>
				<p class="font-2 fl-r">45 rue de la Dordogne, 67150 Erstein</p>
			</div>
			<div class="clear"></div>
			<div class="logo-bg">
				<h1><a href="${createLinkTo(dir:'')}">GC AUTOS</a></h1>
			</div>
			<!-- menu -->
			<nav>
				<ul class="sf-menu sf-js-enabled sf-shadow">
					<li class="active"><a href="${createLinkTo(dir:'')}"><g:message code="menu.accueil"/></a></li>
					<!--<li class=""><a href="#">ABOUT</a>
						<ul style="display: none; visibility: hidden; ">
							<li><a href="#">- COMPLETE COMPUTER DIAGNOSTICS</a></li>
							<li><a href="#">- COMPLETE SAFETY ANALYSIS</a></li>
							<li><a href="#">- DRIVABILITY PROBLEMS</a></li>
							<li><a href="#">- TUNE-UPS</a></li>
							<li><a href="#">- OIL CHANGES</a></li>
						</ul>
					</li>-->
					<li><g:link controller="voitures" action="occasions"><g:message code="menu.occasions"/></g:link></li>
					<li><a href="#">REPAIR</a></li>
					<li><a href="#">PRICE LIST</a></li>
					<sec:ifNotLoggedIn>
						<li><g:link controller="login">Login</g:link></li>
					</sec:ifNotLoggedIn>
					<sec:ifLoggedIn>
						<li><g:link controller="logout">Logout (<sec:username/>)</g:link></li>
					</sec:ifLoggedIn>
				</ul>
				
				<div class="clear"></div>	
			</nav>
			<!-- end menu -->
			
		</header>
		
	  <div role="main">
			<g:layoutBody/>	
	  </div>
		
	  <footer>
			<ul class="list-1">
				<li class="active-2"><a href="#">HOME</a></li>
				<li><a href="#">ABOUT</a></li>
				<li><a href="#">MAINTENANCE</a></li>
				<li><a href="#">REPAIR</a></li>
				<li><a href="#">PRICE LIST</a></li>
				<li><a href="#">LOCATIONS</a></li>
			</ul>
			<div class="fl-r">
				<div class="policy">GC Autos © 2012 <a href="#">Privacy Policy</a></div>
				<div class="fl-r ident-right-3"><!--{%FOOTER_LINK} --></div>
			</div>
			<div class="clear"></div>
		</footer>
	</div>

  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="js/libs/jquery-1.7.2.min.js"><\/script>')</script>
	<script src="${resource(dir:'js',file:'jquery-ui-1.8.21.custom.min.js')}"></script>
	<script src="${resource(dir:'js',file:'jquery.ui.datepicker-fr.js')}"></script>
  
  <script src="${resource(dir:'js',file:'superfish.js')}"></script>
  <script src="${resource(dir:'js',file:'plugins.js')}"></script>
  <script src="${resource(dir:'js',file:'script.js')}"></script>
  <script src="${resource(dir:'js',file:'tms-0.3.js')}"></script>
  <script src="${resource(dir:'js',file:'tms_presets.js')}"></script>
  <script src="${resource(dir:'js',file:'slider.js')}"></script>

        <script>
	$(function() {
		$( "#dateAchat" ).datepicker();
	});
	</script>

	<g:javascript library="application"/>
  	<r:layoutResources />

  <script>
    var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
    (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
    g.src=('https:'==location.protocol?'http://ssl':'http://www')+'.google-analytics.com/ga.js';
    s.parentNode.insertBefore(g,s)}(document,'script'));
  </script>
</body>
</html>
