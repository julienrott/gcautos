<asset:javascript src="fileuploader"/>

<uploader:uploader id="uploader" 
		url="${[controller:'storage', action:'upload']}" params="${['id': id]}">
	<uploader:onComplete>
		reloadCar();
	</uploader:onComplete>
</uploader:uploader>