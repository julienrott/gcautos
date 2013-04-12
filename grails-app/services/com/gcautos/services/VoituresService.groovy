package com.gcautos.services

import com.gcautos.domain.Voiture

import grails.plugin.cache.Cacheable

class VoituresService {
	
	@Cacheable('voitures')
	def get(def id) {
		Voiture.get id
	}
	
	@Cacheable('voitures')
	def home() {
		Voiture.findAll("from Voiture v where v.dateVente is null and vehicleType = ? order by v.id desc", [0], [max:4])
	}
	
	@Cacheable('voitures')
	def list(def type, def offset) {
		log.debug "$type, $offset"
		Voiture.findAll("from Voiture v where v.dateVente is null and vehicleType = ? order by v.prixVente", [type], [max:4, offset:offset])
	}
	
    def count(def type) {
		Voiture.executeQuery("select count(v) from Voiture v where v.dateVente is null and vehicleType = ?", [type])[0]
    }
	
}
