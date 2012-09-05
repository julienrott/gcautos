<g:each in="${accessoires}">
	<li><a href="${createLink(controller:'accessoires',action:'view',id:it.id)}">${it.titre}</a></li>
</g:each>
