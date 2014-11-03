<%@ page import="fr.gcautos.Accessoire" %>
<div class="navbar navbar-default navbar-fixed-top">
	<div class="container navbar-container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#main-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			{{#link-to 'index' title="GC AUTOS"}}
			<asset:image src="logo-bg.png" width="208" height="80"
				class="navbar-brand" />
			{{/link-to}}
		</div>

		<div class="collapse navbar-collapse" id="main-navbar-collapse-1">

			<div class="nav navbar-nav navbar-right col-md-2">
				<div class="font-1">
					<a href="tel:+33663564343">Tel: 06 63 56 43 43</a>
				</div>
			</div>
			<div class="nav navbar-nav navbar-right col-md-2">
				<div class="font-1">{{#link-to 'contact'}}Nous
					contacter{{/link-to}}</div>
			</div>

			<div class="nav navbar-nav navbar-right col-md-5">
				<iframe
					src="//www.facebook.com/plugins/like.php?href=https%3A%2F%2Fwww.facebook.com%2Fpages%2FGC-AUTOS-V%C3%A9hicules-Neufs-Occasions-Quads-Dirt-Bikes-Buggy-Alsace%2F234904276569945&amp;width&amp;layout=standard&amp;action=like&amp;show_faces=false&amp;share=false&amp;height=20&amp;"
					scrolling="no" frameborder="0"
					style="border: none; overflow: hidden; height: 20px; width: 100%;"
					allowTransparency="true"></iframe>
			</div>

			<ul class="nav navbar-nav navbar-right nav-custom">
				<li>{{#link-to 'index'}}<span
					class="glyphicon glyphicon-home icon-white"></span>{{/link-to}}
				</li>
				<li>{{#link-to 'occasions'}}Occasions{{/link-to}}</li>
				<li>{{#link-to 'neuves'}}<g:message code="menu.neufs" />{{/link-to}}
				</li>
				<li>{{#link-to 'quads'}}<g:message code="menu.quads" />{{/link-to}}
				</li>
				<li>{{#link-to 'buggys'}}<g:message code="menu.buggys" />{{/link-to}}
				</li>
				<li>{{#link-to 'dirts'}}<g:message code="menu.dirts" />{{/link-to}}
				</li>
				<li>{{#link-to 'electriques'}}<g:message
						code="menu.electriques" />{{/link-to}}
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Divers<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<g:each in="${Accessoire.list().sort{it.titre}}">
							<li>{{#link-to 'accessoires' ${it.id} }}${it.titre}{{/link-to}}
							</li>
						</g:each>
					</ul></li>
				<sec:ifLoggedIn>
					<sec:ifAllGranted roles="ROLE_ADMIN">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Admin menu<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li>{{#link-to 'createVoiture'}}
										<g:message code="menu.create.voiture" />
									{{/link-to}}</li>
								<li>{{#link-to 'editPhotoSlider'}}
										<g:message code="menu.manage.photoSlider" />
									{{/link-to}}</li>
								<%--<li><g:link controller="accessoires">
										<g:message code="menu.manage.accessoires" />
									</g:link></li>--%>
							</ul></li>
					</sec:ifAllGranted>
				</sec:ifLoggedIn>
			</ul>
		</div>
	</div>
</div>

<div class="container main-container">

	{{outlet}}

	<g:render template="ember/footer"/>
	
</div>