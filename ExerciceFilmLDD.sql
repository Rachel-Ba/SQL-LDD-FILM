CREATE DATABASE IF NOT EXISTS `film` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `film`;

DROP TABLE IF EXISTS `film`;
CREATE TABLE `film` (
  `ident_film` int(10) DEFAULT NULL,
  `titre` varchar(10) DEFAULT NULL,
  `genre1` varchar(10) DEFAULT NULL,
  `recette` int(10) DEFAULT NULL,
  `date_sortie` date DEFAULT NULL,
  `pays` smallint(6) DEFAULT NULL,
  `nb_entree` int(10) DEFAULT NULL,
  `date_et_heure_de_saisie` timestamp DEFAULT NULL);

CREATE UNIQUE INDEX index_unique ON film(ident_film);

CREATE INDEX index_non_unique ON film(genre1,pays);

--
-- Exercice 2
-- 

DROP TABLE IF EXISTS `realisateur`;
CREATE TABLE `realisateur`(
  `num_real` int(10) NOT NULL,
  CONSTRAINT C1 PRIMARY KEY (`num_real`)
);

ALTER TABLE film ADD num_real INTEGER;
ALTER TABLE film ADD CONSTRAINT K1 FOREIGN KEY (num_real) REFERENCES realisateur(num_real);

ALTER TABLE film MODIFY recette float default 0;

ALTER TABLE film MODIFY titre integer NOT NULL;
ALTER TABLE film MODIFY pays integer NOT NULL;

ALTER TABLE film DROP foreign key K1;

--
-- Exercice 3
-- 

ALTER TABLE film ADD RESUMER VARCHAR(50);
DROP VIEW IF EXISTS `film2`;
CREATE VIEW film2 AS SELECT ident_film, titre, genre1, recette, resumer FROM film;
DROP VIEW film2;

--
-- Exercice 4
-- 

alter table film rename to filmold;
CREATE TABLE film LIKE filmold;
DROP TABLE film;
DROP TABLE filmold;
