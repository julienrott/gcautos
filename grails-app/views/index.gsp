﻿<!doctype html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
	<meta name="layout" content="main"/>
</head>
<body>
  <!--[if lt IE 7]><p class=chromeframe>Your browser is <em>ancient!</em> <a href="http://browsehappy.com/">Upgrade to a different browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to experience this site.</p><![endif]-->
	<!-- slider -->
	<div class="slider-holder">
		<div class="slider" style="overflow: hidden; ">
			<ul class="items">
				<g:each in="${photosSlider}">
					<li style="display: none; ">
						<img src="${createLink(controller:'photoSlider', action:'showPhotoSlider', id:"${it.id}", params:[type:'slider'])}" width="990" height="415">
					</li>
				</g:each>
			</ul>
		</div>
		<a class="play"></a>
	</div>
	<!-- end slider -->

  <div role="main">
		<section>
			<article>&nbsp;</article>
			<article>
				<center><h2 class="ident-bot-5 ident-top-2">Les véhicules sont visibles uniquement sur rendez-vous</h2></center>
				<center><a href="${createLink(controller:'contact')}">
					<h2 class="ident-bot-5 ident-top-2"><span class="h2 inner-ident-1">Nous contacter</span></h2></a></center>
			</article>
		</section>
		<section id="content-1">
			<div class="container_12">
				<article>
					<h2 class="ident-bot-5 ident-top-2">Nos dernières <span class="h2 inner-ident-1">occasions</span></h2>
					<g:if test="${voitures?.size > 0}">
						<g:each in="${voitures}" var="v">
							<div class="grid_3">
								<g:if test="${v.photos?.titre?.size > 0}">
									<a href="${createLink(controller:'voitures', action:'view', id:"$v.id")}">
										<img class="photosVoituresListe round" 
												src="${createLink(controller:'voitures', action:'showPhoto', id:"${v.photos?.id[0]}", params:[type:'small_homepage'])}"/>
									</a>
								</g:if>
								<div class="ident-bot-3">
									<h2>
										<a href="${createLink(controller:'voitures', action:'view', id:"$v.id")}">${v.titre}</a></h2>
									<h2 class="h2 ident-top-1"><g:formatNumber number="${v.prixVente }" format="###,##0" />&euro;</h2>
								</div>
								<div class="ident-bot-4">${v.description}</div>
							</div>
						</g:each>
					</g:if>
					<div class="clear"></div>
				</article>
			</div>
		</section>
		<section id="content-2">
			<div class="container_12">
				<div>
					<div class="grid_6">
						<h2 class="ident-bot-5 ident-top-2">Nos <span class="h2 inner-ident-1">Services</span></h2>
						<div id="service"></div>
						<sec:ifAllGranted roles="ROLE_ADMIN">
							<br/>
							<hr>
							<h2 class="ident-bot-5 ident-top-2">Modifier <span class="h2 inner-ident-1">nos services</span></h2>
							<div class="wrapper ident-bot-7">
								<div>Titre: <input type="text" id="serviceTitle" value="${service?.titre}"/></div>
								Contenu: <textarea id="editor" name="description">
									${service?.contenu}
								</textarea>
							</div>
							<a class="link-1" href="#" id="saveService">Enregistrer</a> <img class="extra-2" src="img/extra-2.png" alt="">
						</sec:ifAllGranted>
					</div>
					
					<div class="grid_6">
						<div class="block-2">
							<h2 class="ident-bot-5 ident-top-2">Nos <span class="h2 inner-ident-1">News</span></h2>
							<div id="news"></div>
							<p>
								<a class="link-1" href="${createLink(controller:'news', action:'')}">Voir toutes les news</a> <img class="extra-2" src="img/extra-2.png" alt="">
							</p>
							<sec:ifAllGranted roles="ROLE_ADMIN">
								<br/>
								<hr>
								<h2 class="ident-bot-5 ident-top-2">Nouvelle <span class="h2 inner-ident-1">News</span></h2>
								<div>Titre: <input type="text" id="newsTitle"></div>
								<div>Contenu: <input type="text" id="newsContent"></div>
								<a class="link-1" href="#" id="addNews">Ajouter</a> <img class="extra-2" src="img/extra-2.png" alt="">
							</sec:ifAllGranted>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</section>
  </div>

</body>
</html>
