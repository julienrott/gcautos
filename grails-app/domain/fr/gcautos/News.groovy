package fr.gcautos

class News {

	Date dateCreated
	Date lastUpdated
	
	String titre
	String description

    static constraints = {
    }
	
	static mapping = {
		//table 'news'
		description type: 'text'
	}
}
