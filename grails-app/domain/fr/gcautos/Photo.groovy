package fr.gcautos

class Photo {
	Date dateCreated
	Date lastUpdated
	String titre
	byte[] data
	byte[] data_small
	byte[] data_medium
	byte[] data_slider
	byte[] data_small_homepage

	static belongsTo = [voiture: Voiture]

	static constraints = {
		data maxSize: 1024 * 1024 * 5 // 5MB
		data_small maxSize: 1024 * 1024 * 1 // 1MB
		data_medium(nullable: true, maxSize: 1024 * 1024 * 2) // 2MB
		data_slider maxSize: 1024 * 1024 * 1 // 1MB
		data_small_homepage maxSize: 1024 * 1024 * 1 // 1MB
	}
	
	static mapping = {
		
	}
}
