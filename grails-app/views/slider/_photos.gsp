<g:each in="${photos}">
	<div class="photo">
		<sec:ifAllGranted roles="ROLE_ADMIN">		
			<span id="${it.id}" class="deletePhoto" title="Supprimer"></span>
		</sec:ifAllGranted>
		<img id="img_${it.id}"
			class="photo round" 
			src="${createLink(controller:'photoSlider', action:'showPhotoSlider', id:"$it.id", params:[type:'slider'])}"/>
	</div>
</g:each>
