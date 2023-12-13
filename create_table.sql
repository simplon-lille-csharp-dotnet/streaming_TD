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