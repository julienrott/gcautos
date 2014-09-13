package fr.gcautos

import grails.transaction.Transactional

@Transactional
class VoitureService {

    Voiture[] list(int type, int offset) {
		Voiture.where {
			eq "type", type
			order "prixVente", "asc"
			max 4
		}.list(offset: offset)
    }
	
	def count(def type) {
		Voiture.executeQuery("select count(v) from Voiture v where type = ?", [type])[0]
	}
	
	def home() {
		Voiture.findAll("from Voiture v where type = ? order by v.id desc", [0], [max:4])
	}
}
