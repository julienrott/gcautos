package com.gcautos.domain

import java.util.Date;

class PhotoSlider{

	Date dateCreated
	Date lastUpdated
	
	byte[] data
	byte[] data_slider

	static constraints = {
		dateCreated(nullable:true)
		lastUpdated(nullable:true)
		data maxSize: 1024 * 1024 * 5 // 5MB
		data_slider maxSize: 1024 * 1024 * 1 // 1MB
	}
}
