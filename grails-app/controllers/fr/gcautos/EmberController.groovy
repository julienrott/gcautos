package fr.gcautos

import grails.converters.JSON

class EmberController {
	
	def photoService

	def photoSliders() {
		def res = ["photoSlider":[]]
		def photosSlider = photoService.photosSliderAccueil()
		photosSlider.eachWithIndex{it, idx ->
			res.photoSlider.push (id: it.id,
			idd: it.id,
			url: createLink(controller:'photoSlider', action:'showPhotoSlider', id:"${it.id}", params:[type:'slider']),
			css: idx == 0 ? 'active' : ''
			)
		}
		render res as JSON
	}
}
