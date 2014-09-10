dataSource {
    pooled = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
//			url = "jdbc:h2:mem:devDb;MVCC=TRUE"
//	      	url = "jdbc:h2:file:/home/julien/Documents/workspace-sts-2.7.0.M2/gcautos/db/gcautosH2devDb;MVCC=TRUE"
		    driverClassName = "org.postgresql.Driver"
            url = "jdbc:postgresql://localhost:5432/gcautos"
			//driverClassName = "com.mysql.jdbc.Driver"
			//url =  "jdbc:mysql://localhost:3306/gcautos?useUnicode=yes&characterEncoding=UTF-8"
			username = "gcautos"
			password = "gcautos"
			logSql=false
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
			driverClassName = "org.postgresql.Driver"
			username = "gcautos"
			password = "gcautos"
            url = "jdbc:postgresql://localhost:5432/gcautos"
            pooled = true
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
        }
    }
}
