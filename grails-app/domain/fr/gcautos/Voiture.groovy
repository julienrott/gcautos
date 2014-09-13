package fr.gcautos

class Voiture extends Base {
	
	int type
	int mention
	int prixVente

    static constraints = {
    }
	
	static mapping = {
		table 'voiture'
	}
}
