<g:each in="${photos}">
	
	<div class="photo">
		
		<img id="img_${it.id }"
			class="photo round" 
			src="${resource(dir:'static/images/'+it.voiture.id, file:'SMALL_' + it.titre, absolute:true, )}"/>
	</div>
		
</g:each>
