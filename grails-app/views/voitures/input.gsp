<html>
    <head>
      <title><g:message code="menu.occasions"/></title>
			<meta name="layout" content="main" />
			<r:require module="fileuploader" />
			<jv:generateValidation domain="voiture" form="carForm"/>
    </head>
    
    <body>
    	<div id="post">
			
				<fieldset>
					<g:form action="save" name="carForm" onsubmit="return validateForm(this);" >
	
						<g:hiddenField id="id" name="id" value="${voiture?.id}" />
	
						<div>
							<span class="align-right span-3"><label for="titre">Titre</label></span>
							<g:textField id="titre" name="titre"
								value="${voiture?.titre}"
								class="customText-30em" />
						</div>
						<div>
							<span class="align-right span-3"><label for="kilometrage">Kilometrage</label></span>
							<g:textField name="kilometrage" id="kilometrage"
								value="${voiture?.kilometrage}" />
						</div>
						<div>
							<span class="align-right span-3"><label for="prixAchat">Prix d'achat</label></span>
							<g:textField name="prixAchat" id="prixAchat"
								value="${voiture?.prixAchat}" />
						</div>
						<div>
							<span class="align-right span-3"><label for="prixVente">Prix de vente</label></span>
							<g:textField name="prixVente" id="prixVente"
								value="${voiture?.prixVente}"  />
						</div>
						<div class="clear"></div>
						<div>
							<span class="align-right span-3"><label for="dateAchat">Date d'achat</label></span>
							<g:textField id="dateAchat" name="dateAchat"
									value="${formatDate(format:'dd/MM/yyyy',date:voiture?.dateAchat)}" />
						</div>
						<div class="clear"></div>
						<div>
							<span class="align-right span-3"><label for="dateVente">Date de vente</label></span>
							<g:textField id="dateVente" name="dateVente"
									value="${formatDate(format:'dd/MM/yyyy',date:voiture?.dateVente)}"
									class="customDate" />
						</div>

						<div class="clear"></div>
				
						<div>
							<span class="align-right span-3"><label for="myEditor">Description</label></span>
							<div>
								<textarea id="editor" name="description">
									${voiture?.description}
								</textarea>
							</div>
						</div>
				
						<br />
			
						<g:submitButton name="Enregistrer" value="Enregistrer" />
			
					</g:form>
				</fieldset>

				<br/>
		
				<g:if test="${voiture?.id}">
					<uploader:uploader id="uploader" url="${[controller:'storage', action:'upload']}" params="${['id':voiture?.id]}" >
						<uploader:onComplete>
							updatePhotos();  
						</uploader:onComplete>
					</uploader:uploader>
				</g:if>
		
		    <div id="progressBar"></div>

		    <div id="response"></div>
		
		    <div id="photos" class="photos"></div>
      
    	</div>

    </body>
</html>
