package com.gcautos.controllers


class OccasionsController {

	def index = { redirect(action:list,params:params) }
	
	// the delete, save and update actions only accept POST requests
	static allowedMethods = [delete:'POST', save:'POST', update:'POST']
	
	def list = {
		def voitures = Voiture.findByNeuve(false)
		render (view: '/voitures/index')
	}
	
}
