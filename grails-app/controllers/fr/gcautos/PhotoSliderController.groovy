package fr.gcautos

import grails.converters.JSON

import java.awt.image.BufferedImage

import javax.imageio.ImageIO

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
	
	def upload() {
		try {
			def photo = new PhotoSlider()
			photo.data = request.getInputStream().getBytes()
			ByteArrayInputStream buff = new ByteArrayInputStream( photo.data )
			ByteArrayInputStream buff2 = new ByteArrayInputStream( photo.data )
			BufferedImage croppedImage2 = photoService.resize(buff2, 990, 415)
			ByteArrayOutputStream baos2 = new ByteArrayOutputStream(1000);
			ImageIO.write(croppedImage2, "jpg", baos2);
			photo.data_slider = baos2.toByteArray();
			if (photo.save()) {
				log.debug "resize ok"
			} else {
				photo.errors.each {
					log.error it
				}
			}
			return render(text: [success:true] as JSON, contentType:'text/json')
		} catch(Exception e) {
			log.error "upload ${e}"
			return render(text: [success:false] as JSON, contentType:'text/json')
		}
	}
}
