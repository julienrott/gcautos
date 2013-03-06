<div class="row-fluid">
<div class="offset1"></div>

<g:each in="${photos}" var="photo" status="i">
	<g:if test="${i>0 && i%2 == 0}">
		</div>
		<div class="row-fluid">
		<div class="offset1"></div>
	</g:if>
	<div class="photo span5">
		<sec:ifAllGranted roles="ROLE_ADMIN">		
			<span id="${photo.id}" class="deletePhoto" title="Supprimer"></span>
		</sec:ifAllGranted>
		<img id="img_${photo.id }"
			class="img-polaroid" 
			src="${createLink(controller:'voitures', action:'showPhoto', id:"$photo.id", params:[type:'small'])}"/>
	</div>
</g:each>
</div>