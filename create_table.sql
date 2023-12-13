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