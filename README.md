# Docker compose file for Pfarrgemeinde Michelhausen Homepage

## Explaination
This is the repo that needs to be cloned onto the server used to host the website.

The only files needed to deploy are the docker.compose.yaml and a .env file containing used secrets \
It starts 3 docker containers:
- frontend (latest)
- backend (latest)
- mssql-2019 (latest)

## Frontend
The frontend container is a nginx container providing the angular frontend on http and https.\
Every call to the domain is routed through the nginx, API calls are internally routed to the backend container.

## Backend
The backend container is an ExpressJs backend providing all needed endpoints for the website.\
It is the interface between frontend and database and sends data to and from each.\
HTTP calls to the domain /api (z.b. pfarre-michelhausen.at/api/pfarrgemeinde/entry) call corresponding functions in the backend.\

The backend saves images onto the server via mounting the directory.

## Database
Any data read or saved to the website is stored in a Microsoft SQL server container.\
The database container is not open to anything outside its docker network, which only contains the backend container.

Database data is saved persistent in a docker volume.
Upgrading to a newer version of MSSQL server proves difficult due to the volume being 2019 version.
