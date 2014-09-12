package fr.gcautos

class Base {
	
	Date dateCreated
	Date lastUpdated
	
	String titre
	String description

    static constraints = {
    }
	
	static mapping = {
		description type: 'text'
	}
}
