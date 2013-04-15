<!doctype html>
<html lang="en">
<head>
	<meta name="layout" content="main"/>
	
</head>
<body>
	<!-- slider -->
	<div id="myCarousel" class="carousel slide">
		<div class="carousel-inner">
			<g:each in="${photosSlider}" var="photo" status="i">
				<div class="<g:if test="${i == 0}">active</g:if> item">
					<img src="${createLink(controller:'photoSlider', action:'showPhotoSlider', id:"${photo.id}", params:[type:'slider'])}" width="990" height="415">
				</div>
			</g:each>
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
			<a href="${createLink(controller:'contact')}" class="font-1 h2 blink">
				Nous contacter
			</a>
		</div>
	
		<div class="row-fluid">
			<div>&nbsp;</div>
		</div>
		
		<div class="margin10">
			<h2 class="span12">Nos dernières <span class="h2">occasions</span></h2>
			<g:if test="${voitures?.size > 0}">
			<div class="row-fluid">
				<g:each in="${voitures}" var="v">
					<div class="span3">
						<a href="${createLink(controller:'voitures', action:'view', id:"$v.id")}">
							<img class="img-polaroid" 
									src="${createLink(controller:'voitures', action:'showPhoto', id:"${photosVoitures[v.id].id[0]}", params:[type:'small_homepage'])}"/>
						</a>
						<div class="lignes-2">
							<h2>
								<a href="${createLink(controller:'voitures', action:'view', id:"$v.id")}">${v.titre}</a></h2>
							<h2 class="h2"><g:formatNumber number="${v.prixVente }" format="###,##0" />&euro;</h2>
						</div>
						<div class="lignes-6">${v.description}</div>
					</div>
				</g:each>
			</div>
			</g:if>
		</div>
	</div>
	
	<div class="row-fluid">
		<div>&nbsp;</div>
	</div>
	
	<div class="row-fluid">
		<div class="span6">
			<h2>&nbsp;Nos <span class="h2">Services</span></h2>
			<div id="service" class="margin10"></div>
			<sec:ifAllGranted roles="ROLE_ADMIN">
				<br/>
				<hr>
				<h2>Modifier <span class="h2">nos services</span></h2>
				<div class="wrapper ident-bot-7">
					<div>
						Titre: <input type="text" id="serviceTitle" value="${service?.titre}" class="span9"/>
					</div>
					Contenu: <textarea id="tiny-service" name="description" class="tinymce">
						${service?.contenu}
					</textarea>
				</div>
				<a class="link-1" href="#" id="saveService">Enregistrer</a> <img src="img/extra-2.png" alt="">
			</sec:ifAllGranted>
		</div>
		
		<div class="span6">
			<h2 class="ident-bot-5 ident-top-2">Nos <span class="h2 inner-ident-1">News</span></h2>
			<div class="block-2">
				<div id="news" class="margin10"></div>
				<p>
					<a class="link-1" href="${createLink(controller:'news', action:'')}">Voir toutes les news</a> <img src="img/extra-2.png" alt="">
				</p>
				<sec:ifAllGranted roles="ROLE_ADMIN">
					<br/>
					<hr>
					<h2 class="ident-bot-5 ident-top-2">Nouvelle <span class="h2 inner-ident-1">News</span></h2>
					<div>Titre: <input type="text" id="newsTitle" class="span9"></div>
					<div>Contenu: <textarea id="newsContent" class="tinymce"></textarea></div>
					<a class="link-1" href="#" id="addNews">Ajouter</a> <img src="img/extra-2.png" alt="">
				</sec:ifAllGranted>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$('.carousel').carousel();
		});
	</script>

</body>
</html>
