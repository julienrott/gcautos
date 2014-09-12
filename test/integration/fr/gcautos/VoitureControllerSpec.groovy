package fr.gcautos



import spock.lang.*

/**
 *
 */
class VoitureControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
		given:
			def controller = new VoitureController()
			
		when:
			controller.index()

		then:
			def count = Voiture.count()
			count == 1
			def voiture = Voiture.get(1)
			println voiture.properties
    }
}
