package com.gcautos.domain


import java.util.Date;

class Voiture {
	
	Date dateCreated
	Date lastUpdated
	
	boolean neuve
	
	String titre
	String description
	int kilometrage
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
	}
	
	static mapping = {
		description type:'text'
		photos sort:'id'
	}
}
