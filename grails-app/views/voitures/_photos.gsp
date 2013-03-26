<div>&nbsp;</div>

<div class="row-fluid">

<g:each in="${photos}" var="photo" status="i">
	<g:if test="${i>0 && i%2 == 0}">
		</div>
		<div>&nbsp;</div>
		<div class="row-fluid">
	</g:if>
	
	<div class="photo span6">
		<img id="img_${photo.id }"
			class="img-polaroid span12" 
			src="${createLink(controller:'voitures', action:'showPhoto', id:"$photo.id", params:[type:'small'])}"/>
		<sec:ifAllGranted roles="ROLE_ADMIN">		
			<span id="${photo.id}" class="deletePhoto" title="Supprimer"></span>
		</sec:ifAllGranted>
	</div>
</g:each>
</div>