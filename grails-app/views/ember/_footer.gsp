<div class="footer">
	<div class="row">
		<div id="divCB" class="col-md-8">
			<span class="policy">Paiement par carte bancaire</span>
			<asset:image src="cartes-bancaires.jpg" width="100" height="40" />
			<asset:image src="3x.jpg" width="90" height="40" />
		</div>
		<div class="col-md-4">
			<div class="policy">
				GC Autos ©
				<g:formatDate format="yyyy" date="${new Date()}" />
				<sec:ifNotLoggedIn>
					<g:link controller="login" action="auth">Login</g:link>
				</sec:ifNotLoggedIn>
				<sec:ifLoggedIn>
					<g:form name="logoutform" controller="logout"
						style="display: inline-block;">
						<input type="button"
							onclick="javascript:jQuery('#logoutform').submit();"
							value="Logout (<sec:username/>)" class="btn btn-danger" />
					</g:form>
				</sec:ifLoggedIn>
			</div>
		</div>
	</div>

	<div class="row">&nbsp;</div>

	<div class="row" style="text-align: center;" id="pubsClickInTextFooter">
		{{view App.PubsClickInTextView}}
	</div>

	<div class="row">&nbsp;</div>

	<div class="row" style="text-align: center;">
		{{view App.PubsGoogleView}}
	</div>

	<script type="text/javascript" src="http://tags.clickintext.net/t2ELJBbAJGQH2" title="Slide In"></script>
	<script type="text/javascript" src="http://tags.clickintext.net/t2vdfy9ppS6Qs" title="Site Under"></script>

</div>