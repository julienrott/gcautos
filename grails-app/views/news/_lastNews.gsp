<g:each in="${news}" var="n">
	<div class="block-3 ident-bot-1">
		<p>
			${n.description}
		</p>
		<div class="extra-1"></div>
	</div>
	<div class="block-4 ident-bot-1">
		<p>
			<g:formatDate format="EEEE dd MMMM yyyy" date="${n.dateCreated}" />
			:
		</p>
		${n.titre}
		<div>
			<g:if test="${action != 'getLastNews'}">
				<sec:ifAllGranted roles="ROLE_ADMIN">
					<a class="link-1" href="${createLink(action: 'modify', id: n.id)}">Modifier</a>
					<img class="extra-2"
						src="${createLinkTo(dir: 'img', file: 'extra-2.png')}">
					<a class="link-1" href="${createLink(action: 'delete', id: n.id)}">Supprimer</a>
					<img class="extra-2"
						src="${createLinkTo(dir: 'img', file: 'extra-2.png')}">
				</sec:ifAllGranted>
			</g:if>
		</div>
	</div>
</g:each>