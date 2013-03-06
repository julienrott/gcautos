<!doctype html>
<html lang="en">
<head>
	<meta name="layout" content="main"/>
	
</head>
<body>
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

	<div class="bg-grey">
		<h2 class="span12">
			Les véhicules sont visibles uniquement sur rendez-vous
		</h2>
		<h2 class="span12">
			<a href="${createLink(controller:'contact')}" class="font-1">
				<span>Nous contacter</span>
			</a>
		</h2>
		
		<div class="margin10">
			<h2 class="span12">Nos dernières <span class="h2">occasions</span></h2>
			<g:if test="${voitures?.size > 0}">
			<div class="row-fluid">
				<g:each in="${voitures}" var="v">
					<div class="span3">
						<g:if test="${v.photos?.titre?.size > 0}">
							<a href="${createLink(controller:'voitures', action:'view', id:"$v.id")}">
								<img class="photosVoituresListe round" 
										src="${createLink(controller:'voitures', action:'showPhoto', id:"${v.photos?.id[0]}", params:[type:'small_homepage'])}"/>
							</a>
						</g:if>
						<div class="">
							<h2>
								<a href="${createLink(controller:'voitures', action:'view', id:"$v.id")}">${v.titre}</a></h2>
							<h2 class="h2"><g:formatNumber number="${v.prixVente }" format="###,##0" />&euro;</h2>
						</div>
						<div>${v.description}</div>
					</div>
				</g:each>
			</div>
			</g:if>
		</div>
	</div>
	
	<div class="row-fluid margin10">
		<div class="span6">
			<h2>Nos <span class="h2">Services</span></h2>
			<div id="service"></div>
			<sec:ifAllGranted roles="ROLE_ADMIN">
				<br/>
				<hr>
				<h2>Modifier <span class="h2">nos services</span></h2>
				<div class="wrapper ident-bot-7">
					<div>
						Titre: <input type="text" id="serviceTitle" value="${service?.titre}" class="span9"/>
					</div>
					Contenu: <textarea id="editor" name="description" class="tinymce">
						${service?.contenu}
					</textarea>
				</div>
				<a class="link-1" href="#" id="saveService">Enregistrer</a> <img src="img/extra-2.png" alt="">
			</sec:ifAllGranted>
		</div>
		
		<div class="span6">
			<div class="block-2">
				<h2 class="ident-bot-5 ident-top-2">Nos <span class="h2 inner-ident-1">News</span></h2>
				<div id="news"></div>
				<p>
					<a class="link-1" href="${createLink(controller:'news', action:'')}">Voir toutes les news</a> <img src="img/extra-2.png" alt="">
				</p>
				<sec:ifAllGranted roles="ROLE_ADMIN">
					<br/>
					<hr>
					<h2 class="ident-bot-5 ident-top-2">Nouvelle <span class="h2 inner-ident-1">News</span></h2>
					<div>Titre: <input type="text" id="newsTitle" class="span9"></div>
					<div>Contenu: <textarea id="newsContent" style="height: 65px;" class="span9"></textarea></div>
					<a class="link-1" href="#" id="addNews">Ajouter</a> <img src="img/extra-2.png" alt="">
				</sec:ifAllGranted>
			</div>
		</div>
	</div>

</body>
</html>
