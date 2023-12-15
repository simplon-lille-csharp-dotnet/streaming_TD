
# Remarques liés au projet de Théo, reprise du chapitrage de son readme




## Installation



**Optionnel** 
## Depuis postgresql 

Je n'ai pas réussi en console, j'ai une erreur car je ne sais pas quelles informations rentrer après avoir collé le nom du fichier dans la base de données.

## Depuis pgadmin 

Fonctionne sans problème, les étapes sont bien documentées et imagées.

### Syntaxe des tables

Très bonne idée de l'avoir rajouté, très utile si l'on souhaite poursuivre la création de tables ou pour s'y retrouver tout simplement.

### Insertion des données

L'insertion des données a bien fonctionné.

### Requêtes minimales 

#### 1

Les titres et dates de sortie des films du plus récent au plus ancien:

Theo m'a transmis un correctif:

```sql
SELECT 
    SMO_TITLE,
    SMO_RELEASEYEAR 
FROM 
    SMG_MOVIE 
ORDER BY 
    SMO_RELEASEYEAR 
DESC;
```

Ce code fonctionne.

#### 2

les noms, prénoms et âges des acteurs/actrices de plus de 30 ans dans l'ordre alphabétique (prénom d'abord, puis nom)

Requête fonctionnelle, RAS.

#### 3 

la liste des acteurs/actrices principaux pour un film donné

Requête fonctionnelle. Le commentaire pour prévenir de la génération aléatoire de donnée est bien vu, j'ai testé avec un film différent pour avoir au moins un acteur dans la liste, la requête est parfaitement fonctionnelle.

#### 4 

la liste des films pour un acteur/actrice donné

Requête fonctionnelle. Même cas que la requête précédente, ici concernant les acteurs.

#### 5 

ajouter un film

Requête fonctionnelle. j'ai récupéré la liste avec SElECT * FROM SMG_Movie; pour vérifier qu'il apparaissait bien et c'est le cas.

#### 6 

ajouter un acteur/actrice

Requête fonctionnelle. test similaire à la requête précédentes, j'ai récupéré la liste avec SElECT * FROM SMG_Actor; pour vérifier qu'il apparaissait bien et c'est le cas.

#### 7 

modifier un film

Requête fonctionnelle. j'ai récupéré la liste avec SElECT * FROM SMG_Movie; pour vérifier qu'il apparaissait bien et c'est qu'il y a bien eu modification, c'est le cas, par contre le champ de la date de modification est resté null de mon côté.

#### 8 

supprimer un acteur/actrice

Requête fonctionnelle. L'acteur est bien supprimé et son id n'apparait plus

#### 9 

afficher les 3 derniers acteurs/actrices ajouté(e)s

Requête fonctionnelle. Testé avec puis sans création d'acteur avant d'afficher les trois derniers acteurs ajoutés.

#### 10 (Bonus)

La moyenne du nombre de films des acteurs/trices de plus de 50

Requête fonctionnelle. Testé avec des acteurs trop âgés, résultat null (normal car aucun film correspondant), testé avec des acteurs plus jeune plus jeune, la moyenne légèrement plus élevée (on passe de 1,54 à 1,57 sur cette session)

#### 11 (Bonus)

Le réalisateur ayant le plus de film mis en favoris et combien de ses films ont été mis en favoris.

Requête fonctionnelle. Test en augmentant la limite de réalisateurs affichés et effectivement c'est le réalisateur qui a le plus de film en favoris qui est mis en premier.

#### 12 (Bonus)

Les films qui ont plus d'acteurs que la moyenne des acteurs par film.

Requête fonctionnelle. Me donne une liste de films ainsi que le nombre d'acteur à chaque fois. J'observe que ces chiffres sont supérieur aux moyennes trouvées lors de la requête 10. Par contre je ne sais pas si c'est normal, dans mon cas les films sont groupés deux à deux (pas de ligne de séparation entre les deux entrées). Je joins une capture d'écran.

![plot](/img/request_12.png)

#### 13 (bonus)

Requête fonctionnelle.

Manque l'explication de la requête dans le readme: 
Écrivez un script de transaction qui ajoute un nouveau film, puis l'ajoute aux films favoris d'un utilisateur spécifique, en s'assurant que les deux opérations réussissent ou échouent ensemble. (Astuce : Utilisez BEGIN TRANSACTION, COMMIT, et ROLLBACK)

-Lorsque la requête est bonne: le film est bien rajouté. côté favoris, en tapant SELECT * FROM SMG_Favorite; on voit bien que le favori a été rajouté avec l'id du nouveau film et l'utilisateur choisi.

-Lorsque sfa_userid n'est pas bon, renvoie bien une erreur et pas de nouvelle entrée ajoutée ni dans les films ni dans les favoris. Pareil lors d'une erreur au moment d'un ajout d' SMG_MOVIE  avec des données erronnées.

## Conclusion

Bravo, le readme est bien construit, compréhensible et les requêtes sont toutes fonctionnelles.