package fr.gcautos

class VoitureController {

	def photoService
	
	def showPhotoFull(){
		cache shared:true, neverExpires:true
		try {
			Photo photo = photoService.get( params.id as long )
			if(request.getHeader("If-Modified-Since"))
			{
				def reqDate = new Date(request.getHeader("If-Modified-Since"))
				if (photo.lastUpdated < reqDate)
				{
					render(status: 304)
				}
			}
		
			response.outputStream << photo.data
			response.outputStream.flush()
		} catch(Exception e) {
			log.error "showPhoto : ${e}"
		}
	}
	
    def showPhotoMedium(){
		cache shared:true, neverExpires:true
    	try {
	    	Photo photo = photoService.get( params.id as long )
			if(request.getHeader("If-Modified-Since"))
			{
				def reqDate = new Date(request.getHeader("If-Modified-Since"))
				if (photo.lastUpdated < reqDate)
				{
					render(status: 304)
				}
			}
		
			if(!photo.data_medium) {
				photoService.populatePhoto(photo, 1000, 1000, "data_medium", true)
				photo.save()
			}
			response.outputStream << photo.data_medium
			response.outputStream.flush()
		} catch(Exception e) {
			log.error "showPhoto : ${e}"
		}
	}
}
