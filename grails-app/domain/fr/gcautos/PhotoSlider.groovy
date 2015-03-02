package fr.gcautos

class PhotoSlider {

	Date dateCreated
	Date lastUpdated
	byte[] data
	byte[] data_slider

    static constraints = {
    }
	
	static mapping = {
		//table 'photo_slider'
		data maxSize: 1024 * 1024 * 5 // 5MB
		data_slider maxSize: 1024 * 1024 * 1 // 1MB
	}
}
