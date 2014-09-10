package com.gcautos.domain;

import java.util.Date;

class Photo {
	
	Date dateCreated
	Date lastUpdated
	
	String titre
	byte[] data
	byte[] data_small
	byte[] data_medium
	byte[] data_slider
	byte[] data_small_homepage
	Voiture voiture
	
	static belongsTo = [Voiture]
	
	static constraints = {
		dateCreated(nullable:true)
		lastUpdated(nullable:true)
		titre(nullable:true)
		data maxSize: 1024 * 1024 * 5 // 5MB
		data_small maxSize: 1024 * 1024 * 1 // 1MB
		data_slider maxSize: 1024 * 1024 * 1 // 1MB
		data_small_homepage maxSize: 1024 * 1024 * 1 // 1MB
		data_medium(nullable: true, maxSize: 1024 * 1024 * 2) // 2MB
	}
}
