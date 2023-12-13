CREATE TABLE "user"(
	user_id int primary key,
	email varchar(100),
	"password" varchar(30)
);

CREATE TABLE movie(
	movie_id int primary key,
	title varchar(100),
	duration INTERVAL,
	release_year int
);

CREATE TABLE Actor(
	actor_id serial primary key,
	firstname varchar(30),
	lastname varchar(30),
	birthdate DATE
);

CREATE TABLE Director(
	director_id serial primary key,
	firstname varchar(30),
	lastname varchar(30)
);

CREATE TABLE favorite(
	movie_id serial,
	user_id serial, 
	PRIMARY KEY(movie_id,user_id),
	FOREIGN KEY(user_id) REFERENCES "user"(user_id),
	FOREIGN KEY(movie_id) REFERENCES movie(movie_id)
);
