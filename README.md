# streaming_TD

## Création de la base de donnée
```sql
CREATE DATABASE "Streaming"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
```

## Création des tables 

###  Création de la table user
```sql
CREATE TABLE "user"(
	user_id int primary key,
	email varchar(100),
	"password" varchar(30)
);
```

###  Création de la table Movie
```sql
CREATE TABLE movie(
	movie_id int primary key,
	title varchar(100),
	duration INTERVAL,
	release_year int
);
```

###  Création de la table Actor
```sql
CREATE TABLE Actor(
	actor_id serial primary key,
	firstname varchar(30),
	lastname varchar(30),
	birthdate DATE
);
```

###  Création de la table Director
```sql
CREATE TABLE Director(
	director_id serial primary key,
	firstname varchar(30),
	lastname varchar(30)
);
```

### Création de la table Favorite
```sql
CREATE TABLE favorite(
	movie_id serial,
	user_id serial, 
	PRIMARY KEY(movie_id,user_id),
	FOREIGN KEY(user_id) REFERENCES "user"(user_id),
	FOREIGN KEY(movie_id) REFERENCES movie(movie_id)
);
```
### Création de la table Perform
```sql
CREATE TABLE perform(
	movie_id serial,
	actor_id serial,
	"role" varchar(30),
	is_lead_role bool,
	PRIMARY KEY(movie_id,actor_id),
	FOREIGN KEY(actor_id) REFERENCES actor(actor_id),
	FOREIGN KEY(movie_id) REFERENCES movie(movie_id)
);
```
### Modification table Movie pour ajout de clé primaire
```sql
ALTER TABLE movie ADD COLUMN director_id serial;
ALTER TABLE movie ADD FOREIGN KEY(director_id) REFERENCES director(director_id);
```
