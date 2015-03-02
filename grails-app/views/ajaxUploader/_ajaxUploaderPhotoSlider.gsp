<asset:javascript src="fileuploader"/>

<uploader:uploader id="uploaderPhotoSlider" 
		url="${[controller:'photoSlider', action:'upload']}">
	<uploader:onComplete>
		reloadPhotos();
	</uploader:onComplete>
</uploader:uploader>