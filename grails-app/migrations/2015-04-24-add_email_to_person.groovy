databaseChangeLog = {

	changeSet(author: "julien (generated)", id: "1429897003482-1") {
		addColumn(tableName: "person") {
			column(name: "email", type: "varchar(255)") {
				constraints(unique: "true")
			}
		}
		grailsChange{
			change {
				sql.execute(" update person set email = 'mail@test.com' ")
			}
		}
		addNotNullConstraint(tableName: "person", columnName: "email")
	}

	changeSet(author: "julien (generated)", id: "1429897003482-2") {
		createIndex(indexName: "email_uniq_1429897002801", tableName: "person", unique: "true") {
			column(name: "email")
		}
	}

}
