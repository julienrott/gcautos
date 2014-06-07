grails.servlet.version = "2.5" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
grails.project.war.file = "target/ROOT##${new Date().format('yyyy_MM_dd-HH_mm')}.war"

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // uncomment to disable ehcache
        // excludes 'ehcache'
    }
    log "warn" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve

    repositories {
        inherits true // Whether to inherit repository definitions from plugins
        grailsPlugins()
        grailsHome()
        grailsCentral()
        mavenCentral()

        // uncomment these to enable remote dependency resolution from public Maven repositories
        mavenCentral()
        mavenLocal()
        //mavenRepo "http://snapshots.repository.codehaus.org"
        //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
    }
    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.

		runtime 'mysql:mysql-connector-java:5.1.16'
		runtime 'postgresql:postgresql:8.4-702.jdbc3'
    }

	plugins {
		runtime ":hibernate:$grailsVersion"
		runtime ":jquery:1.7.1"

		runtime ":twitter-bootstrap:2.3.2"
		runtime ":resources:1.2.RC2"

		if (grails.util.Environment.current in 
				[grails.util.Environment.PRODUCTION, grails.util.Environment.TEST]) {
			runtime ":zipped-resources:1.0"
			runtime ":cache-headers:1.0.4"
			runtime ":cached-resources:1.0"
			runtime ":yui-minify-resources:0.1.4"
		}
		
		if (grails.util.Environment.current == grails.util.Environment.PRODUCTION) {
		  compile ":grails-melody:1.47.2"
		}

		build ":tomcat:$grailsVersion"

		compile ':database-session:1.1.2'
		compile ':spring-security-core:1.2.7.2'
		compile ':webxml:1.4.1'
		compile ':heroku:1.0.1'
		compile ':cloud-support:1.0.8'

		compile ":jquery-ui:1.8.15"
		//compile ":modernizr:2.5.3"
		//compile ':uploadr:0.5.11'
		compile ":javascript-validator:0.9"
		compile ":cache-headers:1.1.5"
		
		compile ":cache:1.0.1"
	}
	
	imageUpload {
		temporaryFile = '/tmp/uploaded.file' // Path to where files will be uploaded
	}
}
