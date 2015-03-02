package fr.gcautos

class Service {

	Date dateCreated
	Date lastUpdated
	String titre
	String contenu

    static constraints = {
		contenu type: 'text'
    }
}
