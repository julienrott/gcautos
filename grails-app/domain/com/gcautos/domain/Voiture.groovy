package com.gcautos.domain


import java.util.Date;

class Voiture {
	
	Date dateCreated
	Date lastUpdated
	
	String titre
	String description
	int kilometrage = 0
	int prixAchat
	int prixVente
	
	Date dateAchat
	Date dateVente
	
	static hasMany = [photos:Photo]
	
	static constraints = {
		dateCreated(nullable:true)
		lastUpdated(nullable:true)
		dateAchat(nullable:true)
		dateVente(nullable:true)
		description(nullable:true)
		kilometrage(nullable:true)
	}
	
	static mapping = {
		id generator : 'native'
		description type:'text'
		photos sort:'id'
	}
}
