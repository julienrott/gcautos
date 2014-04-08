<%@ page import="com.gcautos.domain.Accessoire" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title><g:layoutTitle default="GC Autos"/></title>
	<meta name="description" content="GC AUTOS : Situé à Matzenheim en Alsace (Bas-Rhin 67) Vente Véhicules neuf et occasions, vente et réparation de quads pour enfants ados et adultes, dirt bike, Buggy.">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<r:require modules="bootstrap,bootstrap-responsive-css,myStyle"/>

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

	<div class="container narrow">
	
		<div class="navbar">
			<div class="">
				<div class="divtel pull-right offset1">
					<div class="font-1">Tel: 06 63 56 43 43</div>
					<div class="font-1"><a href="${createLink(controller:'contact')}" class="font-1">Nous contacter</a></div>
				</div>
				
				<a target="_blank" class="pull-right clearfix"
						href="https://www.facebook.com/pages/GC-AUTOS-Matzenheim/234904276569945?fref=ts">
					<r:img uri="/img/logo-facebook.png" width="86" height="26"/>
				</a>
				
				<div class="logo-bg">
					<a href="${createLinkTo(dir:'/')}" class="logo" title="GC AUTOS"></a>
				</div>
					<div class="container">
						<button data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar" type="button">
			            	<span class="icon-bar"></span>
				            <span class="icon-bar"></span>
				            <span class="icon-bar"></span>
				        </button>
				        
				        <div class="nav-collapse collapse">
							<ul class="nav nav-pills pull-right" >
								<li><a href="${createLinkTo(dir:'/')}"><i class="icon-home icon-white"></i></a></li>
								<li><g:link controller="voitures" action="occasions"><g:message code="menu.occasions"/></g:link></li>
								<li><g:link controller="voitures" action="neuves"><g:message code="menu.neufs"/></g:link></li>
								<li><g:link controller="voitures" action="quads"><g:message code="menu.quads"/></g:link></li>
								<li><g:link controller="voitures" action="buggys"><g:message code="menu.buggys"/></g:link></li>
								<li><g:link controller="voitures" action="dirts"><g:message code="menu.dirts"/></g:link></li>
								<li><g:link controller="voitures" action="electriques"><g:message code="menu.electriques"/></g:link></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Divers<b class="caret"></b></a>
									<ul class="dropdown-menu">
										<g:each in="${Accessoire.list().sort{it.titre}}">
											<li><g:link controller="accessoires" action="view" id="${it.id}">${it.titre}</g:link></li>
										</g:each>
									</ul>
								</li>
								<sec:ifLoggedIn>
									<sec:ifAllGranted roles="ROLE_ADMIN">
										<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Admin menu<b class="caret"></b></a>
											<ul class="dropdown-menu">
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
			          	</div>
		          	</div>
			</div>
		</div>
		<div class="container content row-fluid">
			<g:layoutBody/>
		</div>
		
		<div class="footer row-fluid">
			<ul class="list-1 span2">
				<li class="active-2"><a href="${createLinkTo(dir:'/')}">HOME</a></li>
				<!--<li><a href="#">ABOUT</a></li>
				<li><a href="#">MAINTENANCE</a></li>
				<li><a href="#">REPAIR</a></li>
				<li><a href="#">PRICE LIST</a></li>
				<li><a href="#">LOCATIONS</a></li>-->
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
	</div>

	<r:require module="application"/>
	
	<g:javascript>
		$(document).ready(function() {
			if ($( "#dateAchat" )[0])
				$( "#dateAchat" ).datepicker();
			if ($( "#dateVente" )[0])
				$( "#dateVente" ).datepicker();
		});
	
		$(function() {
	           $('textarea.tinymce').tinymce({
	                   script_url : urlContext + "/js/libs/tiny_mce-3.5.8/tiny_mce.js",
	                   theme : "advanced",
	                   plugins : "media",
	                   //theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull",
	                   //theme_advanced_buttons2 : "media, styleselect,formatselect,fontselect,fontsizeselect",
	                   theme_advanced_buttons2_add : "media",
	                   //theme_advanced_toolbar_location : "top",
	                   //theme_advanced_toolbar_align : "left",
	                   //theme_advanced_statusbar_location : "bottom",
	                   theme_advanced_resizing : true,
	                   width: "80%",
	                   height: "300"
	           });
	   	});
	
	</g:javascript>
	
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
</body>
</html>
