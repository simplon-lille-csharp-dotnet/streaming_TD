SELECT 
    SMO_TITLE,
    MO_RELEASEYEAR 
FROM 
    MG_MOVIE 
ORDER BY 
    MO_RELEASEYEAR 
DESC;

/***********************************************/
SELECT 
	SAC_LASTNAME,
	SAC_FIRSTNAME,
	EXTRACT(YEAR FROM AGE(NOW(), SAC_BIRTHDATE)) AS AGE 
FROM 
	SMG_ACTOR
WHERE
	EXTRACT(YEAR FROM AGE(NOW(), SAC_BIRTHDATE))>30
ORDER BY
	SAC_FIRSTNAME,
	SAC_LASTNAME;

/******************************************************/

SELECT
	SAC_FIRSTNAME,
	SAC_LASTNAME
FROM 
	SMG_ACTOR
INNER JOIN 
	SMG_PERFORM 
ON 
	SMG_ACTOR.SAC_ACTORID = SMG_PERFORM.SPE_ACTORID
INNER JOIN 
	SMG_MOVIE 
ON 
	SMG_PERFORM.SPE_MOVIEID = SMG_MOVIE.SMO_MOVIEID
WHERE
	SPE_ISLEADROLE IS TRUE
AND
	SMO_TITLE = 'Chantilly Lace';

/******************************************************/
SELECT
	SMO_TITLE
FROM 
	SMG_MOVIE
INNER JOIN 
	SMG_PERFORM 
ON 
	SMG_MOVIE.SMO_MOVIEID = SMG_PERFORM.SPE_MOVIEID
INNER JOIN 
	SMG_ACTOR
ON 
	SMG_PERFORM.SPE_ACTORID = SMG_ACTOR.SAC_ACTORID
WHERE
	SAC_FIRSTNAME = 'Dame'
AND
	SAC_LASTNAME = 'O''Looney'

/*******************************************************/

insert into SMG_Movie (SMO_TITLE, SMO_RELEASEYEAR, SMO_DURATION, SMO_DIRECTORID) values ('WALLAH C MOI', 2023, '180 minutes', 418);

/*******************************************************/

INSERT INTO SMG_Actor (SAC_FIRSTNAME, SAC_LASTNAME, SAC_BIRTHDATE) values ('Théo', 'Duflos', '07/06/2001');

/*******************************************************/

UPDATE 
	SMG_MOVIE
SET
	SMO_TITLE = 'KEBAB A 4 EUROS JE FONCE',
	SMO_RELEASEYEAR = 2023
WHERE 
	SMO_MOVIEID = 807;

/*******************************************************/

delete from smg_actor where sac_actorid = 18;

/*******************************************************/

insert into SMG_Actor (SAC_FIRSTNAME, SAC_LASTNAME, SAC_BIRTHDATE) values ('Jean', 'Michel', '26/1/1950');
insert into SMG_Actor (SAC_FIRSTNAME, SAC_LASTNAME, SAC_BIRTHDATE) values ('Crapaud', 'Clui', '3/3/1994');
insert into SMG_Actor (SAC_FIRSTNAME, SAC_LASTNAME, SAC_BIRTHDATE) values ('Ilest', 'DANSLARIVER', '19/12/1961');
select * from smg_actor order by sac_datecrea desc limit 3;

/*******************************************************/

SELECT
	avg(cnt)
	
FROM (
	SELECT 
		SAC_ACTORID,
		COUNT(SMO_MOVIEID) as cnt
	FROM
		SMG_MOVIE
	INNER JOIN 
		SMG_PERFORM
	ON
		SMG_MOVIE.SMO_MOVIEID = SMG_PERFORM.SPE_MOVIEID
	INNER JOIN 
		SMG_ACTOR
	ON
		SMG_PERFORM.SPE_ACTORID = SMG_ACTOR.SAC_ACTORID
	WHERE
		EXTRACT(YEAR FROM AGE(NOW(), SAC_BIRTHDATE))>50
	GROUP BY
		SAC_ACTORID
);

/********************************************************/

SELECT
    SMO_DIRECTORID,
    MAX(number_director) AS max_number_director
FROM (
    SELECT 
        SMO_DIRECTORID,
        COUNT(SMO_DIRECTORID) as number_director
    FROM
        SMG_MOVIE
    INNER JOIN
        SMG_FAVORITE ON SMG_MOVIE.SMO_MOVIEID = SMG_FAVORITE.SFA_MOVIEID
    GROUP BY 
        SMO_DIRECTORID
) AS director_counts
GROUP BY
    SMO_DIRECTORID
ORDER BY
    max_number_director DESC
limit 1;

/*********************************************************/

SELECT
	SMO_TITLE,
	COUNT(SPE_ACTORID) AS NOMBRE_ACTEUR
FROM
	SMG_MOVIE
INNER JOIN 
	SMG_PERFORM
ON
	SMG_MOVIE.SMO_MOVIEID = SMG_PERFORM.SPE_MOVIEID
GROUP BY 
	SMO_TITLE
HAVING
	COUNT(SPE_ACTORID) > (SELECT 
								AVG(cnt)
							FROM (
								SELECT 
									COUNT(SPE_ACTORID) as cnt
								FROM
									SMG_PERFORM
								group by 
									spe_movieid
								) 
						);
/*************************************************************/