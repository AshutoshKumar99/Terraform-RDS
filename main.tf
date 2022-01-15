provider "aws" {
  region = "ap-south-1"
}

resource "aws_db_instance" "myRDS" {

  name                = "myDB"         #The name of the database to create when the DB instance is created.
  identifier          = "my-first-rds" # The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier
  instance_class      = "db.t2.micro"  #Free tier elegible
  allocated_storage   = 20             #The allocated storage in gibibytes, min 20 for maria db
  engine              = "mariadb"      #The database engine to use
  engine_version      = "10.2.40"      #The engine version to use
  username            = "foo"          #Username for the master DB user.
  password            = "foobarbaz"    #Password for the master DB user, not good practice for password as plane text(can use secret injection)
  port                = 3306           #default port
  skip_final_snapshot = true           #Determines whether a final DB snapshot is created before the DB instance is deleted.
}


#identifier - unique name for ins, this will go as part of FQDN, This is a uniuqe refernce for our server
/* skip_final_snapshot - when running terraform destroy, it tries to destroy the RDS ins, but it fails because it tries to take a snapshot.
 By setting this, we are saying when destroying the RDS ins, skip taking any snapshot and go ahead and delete it.
*/