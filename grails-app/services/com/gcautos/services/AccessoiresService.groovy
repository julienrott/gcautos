package com.gcautos.services

import com.gcautos.domain.Accessoire

import grails.plugin.cache.Cacheable

class AccessoiresService {
	
	//@Cacheable('accessoires')
	def findAll() {
		Accessoire.findAll("from Accessoire a order by a.titre asc") 
	}
	
}
