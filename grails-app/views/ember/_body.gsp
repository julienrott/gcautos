<%@ page import="fr.gcautos.Accessoire" %>
<div class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid navbar-container">
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

		<div class="collapse navbar-collapse sm-small-margin" id="main-navbar-collapse-1">

			<div class="nav navbar-nav navbar-right col-md-2">
				<sec:ifNotLoggedIn>
					<g:link controller="login" action="auth">Se connecter / Créer un compte</g:link>
				</sec:ifNotLoggedIn>
				<sec:ifLoggedIn>
					<g:form name="logoutform" controller="logout"
						style="display: inline-block;">
						<a href="#"
							onclick="javascript:jQuery('#logoutform').submit();"
							class="">Se déconnecter (<sec:username/>)</a>
					</g:form>
				</sec:ifLoggedIn>
			</div>
			
			<div class="nav navbar-nav navbar-right col-md-3">
				<span class="font-1">{{#link-to 'contact'}}Nous
					contacter{{/link-to}}
				</span>
				<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<span class="font-1">
					Tel: <a href="tel:+33663564343">06 63 56 43 43</a>
				</span>
			</div>

			<div class="nav navbar-nav navbar-right col-md-5" style="height: 25px;">
				<div class="fb-like" data-href="https://www.facebook.com/pages/GCautos/234904276569945?fref=ts" data-layout="standard" data-action="like" data-show-faces="false" data-share="true"></div>
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
								<li>{{#link-to 'users'}}
										Clients
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

<div class="container-fluid main-container">

	{{outlet}}

	<g:render template="ember/footer"/>
	
</div>