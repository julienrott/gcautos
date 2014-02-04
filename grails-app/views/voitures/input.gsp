<html>
<head>
	<title><g:message code="menu.occasions" /></title>
	<meta name="layout" content="main" />
	<r:require module="fileuploader" />
	<jv:generateValidation domain="voiture" form="carForm" />
</head>

<body>

	<div class="row-fluid">
		<g:form action="save" name="carForm" class="form-horizontal"
			onsubmit="return validateForm(this);">
	
			<g:hiddenField id="id" name="id" value="${voiture?.id}" />
	
			<div class="control-group">
				<label class="control-label" for="vehicleType">Type</label>
				<div class="controls">
					<g:select id="vehicleType" name="vehicleType" from="${0..5}"
						value="${voiture?.vehicleType}" valueMessagePrefix="vehicleType"/>
				</div>
			</div>
	
			<div class="control-group">
				<label class="control-label" for="vehicleType">Mention</label>
				<div class="controls">
					<g:select id="mention" name="mention" from="${0..2}"
						value="${voiture?.mention}" valueMessagePrefix="mention"/>
				</div>
			</div>
	
			<div class="control-group">
				<label class="control-label" for="titre">Titre</label>
				<div class="controls">
					<g:textField id="titre" name="titre" value="${voiture?.titre}"/>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="kilometrage">Kilometrage</label>
				<div class="controls">
					<g:textField name="kilometrage" id="kilometrage"
						value="${voiture?.kilometrage}" />
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="prixAchat">Prix d'achat</label>
				<div class="controls">
					<g:textField name="prixAchat" id="prixAchat"
						value="${voiture?.prixAchat}" />
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="prixVente">Prix de vente</label>
				<div class="controls">
					<g:textField name="prixVente" id="prixVente"
						value="${voiture?.prixVente}" />
				</div>
			</div>
			
			<div class="clear"></div>
			
			<div class="control-group">
				<label class="control-label" for="dateAchat">Date d'achat</label>
				<div class="controls">
					<g:textField id="dateAchat" name="dateAchat"
						value="${formatDate(format:'dd/MM/yyyy',date:voiture?.dateAchat)}" />
				</div>
			</div>
			
			<div class="clear"></div>
			
			<div class="control-group">
				<label class="control-label" for="dateVente">Date de vente</label>
				<div class="controls">
					<g:textField id="dateVente" name="dateVente"
						value="${formatDate(format:'dd/MM/yyyy',date:voiture?.dateVente)}"/>
				</div>
			</div>
	
			<div class="clear"></div>
	
			<div class="control-group">
				<label class="control-label" for="myEditor">Description</label>
				<div class="controls">
					<textarea id="editor" name="description" class="tinymce">
						${voiture?.description}
					</textarea>
				</div>
			</div>
	
			<br />
	
			<g:submitButton name="Enregistrer" value="Enregistrer" />
	
		</g:form>
	</div>
	
	<br />

	<g:if test="${voiture?.id}">
		<uploader:uploader id="uploader"
				url="${[controller:'storage', action:'upload']}"
				params="${['id':voiture?.id]}">
			<uploader:onComplete>
				updatePhotos();  
			</uploader:onComplete>
		</uploader:uploader>
	</g:if>

	<div id="progressBar"></div>

	<div id="response"></div>

	<div id="photos" class="photos"></div>

</body>
</html>