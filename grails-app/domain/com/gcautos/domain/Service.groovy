package com.gcautos.domain


class Service {
	
	Date dateCreated
	Date lastUpdated
	
	String titre
	String contenu
	
	static constraints = {
		dateCreated(nullable:true)
		lastUpdated(nullable:true)
		contenu(nullable:true)
	}
	
	static mapping = {
		contenu type:'text'
	}
}
