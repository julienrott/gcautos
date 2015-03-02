package fr.gcautos

import grails.transaction.Transactional

@Transactional
class VoitureService {

    Voiture[] list(int vehicleType, int offset) {
		Voiture.where {
			eq "vehicleType", vehicleType
			order "prixVente", "asc"
		}.list(offset: offset, max: 4)
    }
	
	def count(def vehicleType) {
		Voiture.where {
			eq "vehicleType", vehicleType
		}.count()
	}
	
	def home() {
		Voiture.where {
			eq "vehicleType", 0
			order "id", "desc"
		}.list(max: 4)
	}
}
