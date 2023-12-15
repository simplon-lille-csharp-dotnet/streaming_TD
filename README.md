
# Streaming_TD




## Installation

Pour commencer il faut installer POSTGRESQL au lien suivant:

    https://www.enterprisedb.com/downloads/postgres-postgresql-downloads


**Optionnel** 

Vous pouvez télécharger pgAdmin 4 directement depuis l'installateur de postgresql c'est une interface graphique pour postgresql

# Initialisation de la base

## Depuis postgresql 

Récuperez le fichier

    create_db.sql

Et copier le dans la console postgresql

## Depuis pgadmin 

Ouvrer le serveur puis faites clic droit sur **Database** puis entrez le nom de votre base de donnée et valider

![plot](/img/create_db.png)

![plot](/img/create_db2.png)


## Création des tables

Récupèrer le fichier create_table.sql et lancer executé le dans leurs environnement respectifs

![plot](/img/run_query.png)

![plot](/img/open_file.png)

![plot](/img/execute.png)



### Syntaxe des tables

Nom de table : 

    Abréviation du nom de la base ici Streaming = SMG + underscore + Nom de la table
    Exemple : SMG_ACTOR

Nom des champs de table

    Un suffixe composé de la première lettre du nom de la base 
    + 2 premières lettres de la table exemple la table Actor donne SAC 
    + underscore
    + nom du champs
    Ce qui donne par exemple SAC_FIRSTNAME

### Insertion des données

Pour insérer les données dans la base executer le fichier 

    insertion.sql



### Requetes minimal 

#### 1

Les titres et dates de sortie des films du plus récent au plus ancien

```sql
SELECT 
    SMO_TITLE,
    MO_RELEASEYEAR 
FROM 
    MG_MOVIE 
ORDER BY 
    MO_RELEASEYEAR 
DESC;
```

#### 2

les noms, prénoms et âges des acteurs/actrices de plus de 30 ans dans l'ordre alphabétique (prénom d'abord, puis nom)

```sql
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

```

#### 3 

la liste des acteurs/actrices principaux pour un film donné

```sql
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
```

**Attention** Il est possible en changeant le nom du film qu'il n'est aucun acteur principal du à la génération aléatoire de données

#### 4 

la liste des films pour un acteur/actrice donné

```sql
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
```

**Attention** Il est possible en changeant le nom et prénom de l'acteur qu'il n'est aucun film du à la génération aléatoire de données

#### 5 

ajouter un film

```sql
insert into 
    SMG_Movie (SMO_TITLE, SMO_RELEASEYEAR, SMO_DURATION, SMO_DIRECTORID) 
values 
    ('WALLAH C MOI', 2023, '180 minutes', 418);
```

#### 6 

ajouter un acteur/actrice

```sql
INSERT INTO 
    SMG_Actor (SAC_FIRSTNAME, SAC_LASTNAME, SAC_BIRTHDATE) 
values 
    ('Théo', 'Duflos', '07/06/2001');
```
#### 7 

modifier un film

```sql
UPDATE 
	SMG_MOVIE
SET
	SMO_TITLE = 'KEBAB A 4 EUROS JE FONCE',
	SMO_RELEASEYEAR = 2023
WHERE 
	SMO_MOVIEID = 20;
```

#### 8 

supprimer un acteur/actrice

```sql
delete from 
    smg_actor 
where 
    sac_actorid = 18;

```

#### 9 

afficher les 3 derniers acteurs/actrices ajouté(e)s

```sql
insert into 
    SMG_Actor (SAC_FIRSTNAME, SAC_LASTNAME, SAC_BIRTHDATE) 
values 
    ('Jean', 'Michel', '26/1/1950');
insert into 
    SMG_Actor (SAC_FIRSTNAME, SAC_LASTNAME, SAC_BIRTHDATE) 
values 
    ('Crapaud', 'Clui', '3/3/1994');
insert into 
    SMG_Actor (SAC_FIRSTNAME, SAC_LASTNAME, SAC_BIRTHDATE) 
values 
    ('Ilest', 'DANSLARIVER', '19/12/1961');
select 
    * 
from 
    smg_actor 
order by 
    sac_datecrea 
desc 
limit 3;

```