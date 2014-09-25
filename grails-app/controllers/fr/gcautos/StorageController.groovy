package fr.gcautos

import grails.converters.JSON

class StorageController {
	
	def photoService
	
	def reupload() {
		try {
			def photo = new Photo()
			photo.data = request.getInputStream().getBytes()
			ByteArrayInputStream buff = new ByteArrayInputStream( photo.data )
			photoService.populatePhoto(photo, 350, 350, "data_small")
			photoService.populatePhoto(photo, 990, 415, "data_slider")
			photoService.populatePhoto(photo, 210, 132, "data_small_homepage")
			photoService.populatePhoto(photo, 1000, 1000, "data_medium")
			photo.voiture = Voiture.get(4658)
			photo.titre = request.getHeader('X-File-Name') as String
			if (photo.save()) {
				//log.error "upload ok"
				//photoService.writePhoto( photo.id )
				log.debug "resize ok"
			} else {
				log.error photo.errors
			}
			return render(text: [success:true] as JSON, contentType:'text/json')
		} catch(Exception e) {
			log.error "upload ${e}"
			return render(text: [success:false] as JSON, contentType:'text/json')
		}
	}

	def upload() {
		log.debug "upload $params"
		try {
			def photo = new Photo()
			photo.data = request.getInputStream().getBytes()
			ByteArrayInputStream buff = new ByteArrayInputStream( photo.data )
			photoService.populatePhoto(photo, 350, 350, "data_small")
			photoService.populatePhoto(photo, 990, 415, "data_slider")
			photoService.populatePhoto(photo, 210, 132, "data_small_homepage")
			photoService.populatePhoto(photo, 1000, 1000, "data_medium")
			photo.voiture = Voiture.get(params["id"] as long)
			photo.titre = request.getHeader('X-File-Name') as String
			if (photo.save()) {
				//log.error "upload ok"
				//photoService.writePhoto( photo.id )
				log.debug "resize ok"
			} else {
				log.error photo.errors
			}
			return render(text: [success:true] as JSON, contentType:'text/json')
		} catch(Exception e) {
			log.error "upload ${e}"
			return render(text: [success:false] as JSON, contentType:'text/json')
		}
	}
	
	def uploadInfo() {
		log.debug "uploadInfo"
	}
}
