package fr.gcautos



import spock.lang.*

/**
 *
 */
class VoitureServiceSpec extends Specification {
	
	def voitureService

    def setup() {
    }

    def cleanup() {
    }

    void "test list"() {
		when:
			Voiture[] voitures = voitureService.list(0, 0)
			
		then:
			voitures.size() == 1
			def voiture = Voiture.get(1)
			println voiture.properties
    }
}
