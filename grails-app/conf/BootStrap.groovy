import com.gcautos.Person;
import com.gcautos.PersonRole;
import com.gcautos.Role;

class BootStrap {

		def springSecurityService

    def init = { servletContext ->
			def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
			def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
		
			def adminUser = Person.findByUsername('admin') ?: new Person(
							username: 'admin', 
							password: 'admin',
							enabled: true).save(failOnError: true)
		
			if (!adminUser.authorities.contains(adminRole)) {
				PersonRole.create adminUser, adminRole
			}
    }

    def destroy = {
    }
}
