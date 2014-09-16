package fr.gcautos

class Voiture {
	
	Date dateCreated
	Date lastUpdated
	
	String titre
	String description

	int vehicleType
	int mention
	int prixVente

	static hasMany = [photos:Photo]

    static constraints = {
    }
	
	static mapping = {
		//table 'voiture'
		description type: 'text'
		photos sort:'id'
	}
}
