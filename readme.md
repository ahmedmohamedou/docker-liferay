# Liferay Portal 6.2

This will setup the Liferay Portal.  You need to have a MySQL database available.

To build and run:

`docker build -t liferay .`

`docker run -it -P -e DB_HOST=<mysql-db-host> -e DB_USER=<mysql-db-user> -e DB_PASS=<mysql-user-pass> -e DB_NAME=<mysql-db-name> liferay`
