package fr.gcautos

class Accessoire {

	Date dateCreated
	Date lastUpdated
	
	String titre
	String contenu

    static constraints = {
    }
	
	static mapping = {
		//table "accessoire"
		contenu type: 'text'
	}
}
