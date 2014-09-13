package fr.gcautos

import grails.transaction.Transactional

@Transactional
class PhotoService {

	def photosSliderAccueil() {
		PhotoSlider.list()
	}
}
