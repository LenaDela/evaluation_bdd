--1. Afficher toutes les todolist

SELECT * FROM `todolist`;

--2. Afficher le pseudo de tous les utilisateurs

SELECT `pseudo` FROM `utilisateur`;

--3. Afficher le nombre d’utilisateurs

SELECT count(*) FROM `utilisateur`;

--4. Afficher les todolistes de tous les utilisateurs
--=> Libellé todoliste et pseudo utilisateur

SELECT pseudo, libelle
FROM todolist t
	JOIN utilisateur u
    	ON t.utilisateur_id = u.id; 

--5. Afficher les todolistes de Alice

SELECT libelle
FROM todolist t
	JOIN utilisateur u
    	ON t.utilisateur_id = u.id
WHERE pseudo = 'Alice'; 

--6. Afficher toutes les taches et leurs états de toutes les todolistes
--=> Libellé todoliste, Libellé tache , libellé état

SELECT t.libelle as todolist
    , ta.libelle as tache
    , e.libelle as etat
FROM tache ta
    JOIN etat e
        ON ta.etat_id = e.id
    JOIN todolist t
        ON ta.todolist_id = t.id;

--7. Afficher toutes les taches de Bob ainsi que leurs états
--=> Libellé tache , libellé état

SELECT ta.libelle as tache
    , e.libelle as etat
FROM tache ta
    JOIN etat e
        ON ta.etat_id = e.id
    JOIN todolist t
        ON ta.todolist_id = t.id
    JOIN utilisateur u
    	ON t.utilisateur_id = u.id
WHERE pseudo = 'Bob';

--8. Afficher toutes les taches qui ont un état « done »

SELECT ta.libelle 
FROM tache ta 
    JOIN etat e 
        ON ta.etat_id = e.id
WHERE e.libelle = 'done';


--9. Afficher toutes les taches des utilisateurs avec leur todolist correspondant et leurs états
--=> pseudo, libellé todolist, libellé tache, libellé état 

SELECT u.pseudo
    , t.libelle as todolist
    , ta.libelle as tache
    , e.libelle as etat
FROM tache ta
    JOIN etat e
        ON ta.etat_id = e.id
    JOIN todolist t
        ON ta.todolist_id = t.id
    JOIN utilisateur u
    	ON t.utilisateur_id = u.id;



