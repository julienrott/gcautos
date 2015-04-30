package fr.gcautos

import grails.converters.JSON

class UserController extends grails.plugin.springsecurity.ui.UserController {
	def search() {
		def res = ["users": []]
		res."users" = []
		def persons = Person.where{
			ne "username", "admin"
		}.list()
		persons.each {
			res."users".push([idd: it.id, id: it.id, "username": it.username])
		}
		render res as JSON
	}
}
