import fr.gcautos.*;

class BootStrap {

    def init = { servletContext ->
		environments {
			test {
				Voiture v = new Voiture(
						titre: "titre",
						description: "description",
						type: 0,
						mention: 0,
						prixVente: 5890
					).save()
			}
		}
    }
	
    def destroy = {
		Voiture.list().deleteAll()
    }
	
}
