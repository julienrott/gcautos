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
}
