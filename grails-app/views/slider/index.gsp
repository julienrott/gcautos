<html>
<head>
  <title><g:message code="menu.manage.photoSlider"/></title>
	<meta name="layout" content="main" />
	<r:require module="fileuploader" />
</head>
<body>
	<div class="subContent span-25">
		<div class="voitureListe">
			<div>Longueur : 990px ; Hauteur : 415px</div>
			<uploader:uploader id="uploader" url="${[controller:'slider', action:'upload']}" >
				<uploader:onComplete>
					updatePhotos();  
				</uploader:onComplete>
			</uploader:uploader>

		  <div id="photoSlider" class="photos"></div>

		</div>
	</div> 

	<div class="clear"></div>

</body>
</html>
