package com.gcautos.domain;

import java.util.Date;

class Photo {
	
	Date dateCreated
	Date lastUpdated
	
	String titre
	byte[] data
	Voiture voiture
	
	static belongsTo = [Voiture]
	
	static constraints = {
		dateCreated(nullable:true)
		lastUpdated(nullable:true)
		titre(nullable:true)
		data maxSize: 1024 * 1024 * 5 // 5MB
	}
}
