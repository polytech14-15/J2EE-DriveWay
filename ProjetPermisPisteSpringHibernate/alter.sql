-- Inserer ici toutes les modifications faites sur la base de données.
-- Ainsi, on aura toujours la même

-- ex:
-- 25-06-15
INSERT INTO `apprenant` (`NUMAPPRENANT`, `NOMAPPRENANT`, `PRENOMAPPRENANT`) VALUES
(9, 'De Sousa', 'Jérémy');


--
-- Contenu de la table `action`
--

INSERT INTO `action` (`NUMACTION`, `LIBACTION`) VALUES
(1, 'lala'),
(2, 'Manger biloute'),
(3, 'Manger une pomme'),
(4, 'Chanter');

--
-- Contenu de la table `appartient`
--

INSERT INTO `appartient` (`NUMJEU`, `NUMACTION`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4);

--
-- Contenu de la table `apprenant`
--

INSERT INTO `apprenant` (`NUMAPPRENANT`, `NOMAPPRENANT`, `PRENOMAPPRENANT`) VALUES
(1, 'za', 'z'),
(2, 'lili', 'lilisw'),
(3, 'lolo', 'lolo'),
(4, 'mpmp', 'mpmp'),
(5, 'ppp', 'ppp'),
(6, 'u', 'u'),
(7, 'popo', 'popo'),
(8, 'Bianco', 'Camille');

--
-- Contenu de la table `calendrier`
--

INSERT INTO `calendrier` (`DATEJOUR`) VALUES
('2015-06-08');

--
-- Contenu de la table `est_associe`
--

INSERT INTO `est_associe` (`NUMACTION`, `NUMOBJECTIF`) VALUES
(1, 2),
(2, 1);

--
-- Contenu de la table `fixe`
--

INSERT INTO `fixe` (`NUMMISSION`, `NUMOBJECTIF`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2);

--
-- Contenu de la table `indicateur`
--

INSERT INTO `indicateur` (`NUMINDIC`, `NUMACTION`, `LIBINDIC`, `POIDS`) VALUES
(1, 1, 'Commencer par le hau', 5),
(2, 1, 'Etre gentil', 10);

--
-- Contenu de la table `jeu`
--

INSERT INTO `jeu` (`NUMJEU`, `LIBELLEJEU`) VALUES
(1, 'Pilotage'),
(2, 'Manoeuvre');

--
-- Contenu de la table `mission`
--

INSERT INTO `mission` (`NUMMISSION`, `NUMJEU`, `LIBMISSION`) VALUES
(1, 1, 'Mission1'),
(2, 2, 'Mission2');

--
-- Contenu de la table `objectif`
--

INSERT INTO `objectif` (`NUMOBJECTIF`, `LIBOBECTIF`) VALUES
(1, 'Répondre au questionnaire'),
(2, 'Au moins 2 réponses juste');

--
-- Contenu de la table `obtient`
--

INSERT INTO `obtient` (`NUMAPPRENANT`, `DATEJOUR`, `NUMACTION`, `VALEURDEBUT`, `VALEURFIN`) VALUES
(1, '2015-06-08', 2, 1000, 2000),
(1, '2015-06-08', 3, 1000, 2000);

--
-- Contenu de la table `possede`
--

INSERT INTO `possede` (`NUMACTION`, `NUMREGLE`) VALUES
(1, 2),
(2, 1);

--
-- Contenu de la table `regle`
--

INSERT INTO `regle` (`NUMREGLE`, `LIBREGLE`, `SCOREMIN`) VALUES
(1, 'Regle1', 1000),
(2, 'Regle2', 2000);