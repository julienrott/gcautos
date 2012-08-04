package com.gcautos.domain;

class News {
	
	Date dateCreated
	Date lastUpdated
	
	String titre
	String description
	
	static constraints = {
		dateCreated(nullable:true)
		lastUpdated(nullable:true)
		titre(nullable:true)
		description(nullable:true)
	}
	
	static mapping = {
		description type:'text'
	}
}
