-- Inserer ici toutes les modifications faites sur la base de données.
-- Ainsi, on aura toujours la même

--
-- Contenu de la table `action`
--

INSERT INTO `action` (`NUMACTION`, `LIBACTION`) VALUES
(1, 'Ralentir'),
(2, 'Accèlérer'),
(3, 'Tourner à droite'),
(4, 'Tourner à gauche'),
(5, 'Faire demi-tour'),
(6, 'Actionner le siège éjectable');

--
-- Contenu de la table `apprenant`
--

INSERT INTO `apprenant` (`NUMAPPRENANT`, `NOMAPPRENANT`, `PRENOMAPPRENANT`) VALUES
(1, 'DE SOUSA', 'Jérémy'),
(2, 'DEGRANGE', 'Quentin'),
(3, 'DURET', 'Sébastien'),
(4, 'SAYN-URPAR', 'Marc-Antoine'),
(5, 'BIANCO', 'Camille'),
(6, 'NUGUES', 'Margaux');

--
-- Contenu de la table `calendrier`
--

INSERT INTO `calendrier` (`DATEJOUR`) VALUES
('2015-06-08'),
('2015-06-09'),
('2015-06-10'),
('2015-06-11'),
('2015-06-12'),
('2015-06-13'),
('2015-06-14'),
('2015-06-15');



--
-- Contenu de la table `indicateur`
--

INSERT INTO `indicateur` (`NUMINDIC`, `NUMACTION`, `LIBINDIC`, `POIDS`) VALUES
(1, 1, 'Réussi', 10),
(2, 2, 'Réussi', 10),
(3, 3, 'Réussi', 5),
(4, 4, 'Réussi', 5),
(5, 5, 'Temps passé', 10),
(6, 5, 'Réussi', 5),
(7, 6, 'Nombre de blessures < 5', 10);

--
-- Contenu de la table `jeu`
--

INSERT INTO `jeu` (`NUMJEU`, `LIBELLEJEU`) VALUES
(1, 'Pilotage'),
(2, 'Vitesse'),
(3, 'Manoeuvre');

--
-- Contenu de la table `mission`
--

INSERT INTO `mission` (`NUMMISSION`, `NUMJEU`, `LIBMISSION`) VALUES
(1, 1, 'Mission1'),
(2, 1, 'Mission2'),
(3, 1, 'Mission3'),
(4, 2, 'Mission1'),
(5, 2, 'Mission2'),
(6, 2, 'Mission3'),
(7, 3, 'Mission1'),
(8, 3, 'Mission2');

--
-- Contenu de la table `objectif`
--

INSERT INTO `objectif` (`NUMOBJECTIF`, `LIBOBECTIF`) VALUES
(1, 'Arriver à destination'),
(2, 'Arriver 1er'),
(3, 'Aller vite'),
(4, 'Apprentissage des bases'),
(5, 'Suivre un parcours'),
(6, 'Assurer la sécurité des passagers');

--
-- Contenu de la table `regle`
--

INSERT INTO `regle` (`NUMREGLE`, `LIBREGLE`, `SCOREMIN`) VALUES
(1, 'Regle1', 1),
(2, 'Regle2', 2),
(3, 'Regle3', 5),
(4, 'Regle4', 10),
(5, 'Regle5', 5);

--
-- Contenu de la table `obtient`
--

INSERT INTO `obtient` (`NUMAPPRENANT`, `DATEJOUR`, `NUMACTION`, `VALEURDEBUT`, `VALEURFIN`) VALUES
(1, '2015-06-08', 1, 10, 10),
(1, '2015-06-08', 4, 10, 10),
(1, '2015-06-08', 5, 10, 10),
(1, '2015-06-08', 6, 10, 10),
(2, '2015-06-08', 1, 10, 10),
(2, '2015-06-08', 4, 10, 10),
(2, '2015-06-08', 5, 0, 0);

--
-- Contenu de la table `possede`
--

INSERT INTO `possede` (`NUMACTION`, `NUMREGLE`) VALUES
(1, 3),
(2, 2),
(3, 1),
(4, 1),
(5, 4),
(6, 4),
(6, 5);

--
-- Contenu de la table `appartient`
--

INSERT INTO `appartient` (`NUMJEU`, `NUMACTION`) VALUES
(1, 1),
(1, 4),
(1, 5),
(1, 6),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 1),
(3, 4),
(3, 5);

--
-- Contenu de la table `est_associe`
--

INSERT INTO `est_associe` (`NUMACTION`, `NUMOBJECTIF`) VALUES
(1, 3),
(1, 4),
(2, 2),
(3, 2),
(3, 6),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(5, 3),
(5, 4),
(5, 5),
(6, 1),
(6, 6);

--
-- Contenu de la table `fixe`
--

INSERT INTO `fixe` (`NUMMISSION`, `NUMOBJECTIF`) VALUES
(1, 3),
(2, 5),
(3, 1),
(4, 6),
(5, 3),
(6, 2),
(7, 4),
(8, 5);