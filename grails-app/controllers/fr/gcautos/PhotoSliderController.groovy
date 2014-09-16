package fr.gcautos

class PhotoSliderController {

	def photoService

    def show() {
    	cache shared:true, neverExpires:true
    	try {
    		PhotoSlider photo = photoService.getPhotoSliderAccueil(params.id as long)
    		if(request.getHeader("If-Modified-Since"))
    		{
    			def reqDate = new Date(request.getHeader("If-Modified-Since"))
    			if (photo.lastUpdated < reqDate)
    			{
    				render(status: 304)
    			}
    		}
    		response.outputStream << photo.data_slider
			response.outputStream.flush()
		} catch(Exception e) {
			log.error "showPhoto : ${e}"
		}
	}
}
