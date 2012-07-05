<g:each in="${photos}">
	
		<img id="img_${it.id }"
			class="photo round" 
			src="${createLink(controller:'voitures', action:'showPhoto', id:"$it.id")}"/>
		
</g:each>
