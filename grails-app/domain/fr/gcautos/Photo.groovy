package fr.gcautos

class Photo extends Base {

	Voiture voiture
	byte[] data
	byte[] data_small
	byte[] data_medium
	byte[] data_slider
	byte[] data_small_homepage

	static constraints = {
		data maxSize: 1024 * 1024 * 5 // 5MB
		data_small maxSize: 1024 * 1024 * 1 // 1MB
		data_medium(nullable: true, maxSize: 1024 * 1024 * 2) // 2MB
		data_slider maxSize: 1024 * 1024 * 1 // 1MB
		data_small_homepage maxSize: 1024 * 1024 * 1 // 1MB
	}
}
