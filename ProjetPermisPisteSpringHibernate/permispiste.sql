-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 24 Juin 2015 à 18:28
-- Version du serveur :  5.6.21
-- Version de PHP :  5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `permispiste`
--

-- --------------------------------------------------------

--
-- Structure de la table `action`
--

CREATE TABLE IF NOT EXISTS `action` (
  `NUMACTION` int(11) NOT NULL,
  `LIBACTION` char(25) DEFAULT NULL,
  `SCOREMIN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `action`
--

INSERT INTO `action` (`NUMACTION`, `LIBACTION`, `SCOREMIN`) VALUES
(1, 'Chanter', 10),
(2, 'Manger biloute', 10),
(3, 'Manger une pomme', 1000);

-- --------------------------------------------------------

--
-- Structure de la table `appartient`
--

CREATE TABLE IF NOT EXISTS `appartient` (
  `NUMJEU` int(11) NOT NULL,
  `NUMACTION` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `apprenant`
--

CREATE TABLE IF NOT EXISTS `apprenant` (
  `NUMAPPRENANT` int(11) NOT NULL,
  `NOMAPPRENANT` char(25) DEFAULT NULL,
  `PRENOMAPPRENANT` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `apprenant`
--

INSERT INTO `apprenant` (`NUMAPPRENANT`, `NOMAPPRENANT`, `PRENOMAPPRENANT`) VALUES
(1, 'Bianco', 'Camille'),
(2, 'De Sousa', 'Jérémy');

-- --------------------------------------------------------

--
-- Structure de la table `calendrier`
--

CREATE TABLE IF NOT EXISTS `calendrier` (
  `DATEJOUR` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `calendrier`
--

INSERT INTO `calendrier` (`DATEJOUR`) VALUES
('2015-06-08');

-- --------------------------------------------------------

--
-- Structure de la table `est_associe`
--

CREATE TABLE IF NOT EXISTS `est_associe` (
  `NUMACTION` int(11) NOT NULL,
  `NUMOBJECTIF` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `fixe`
--

CREATE TABLE IF NOT EXISTS `fixe` (
  `NUMMISSION` int(11) NOT NULL,
  `NUMOBJECTIF` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `indicateur`
--

CREATE TABLE IF NOT EXISTS `indicateur` (
  `NUMINDIC` int(11) NOT NULL,
  `NUMACTION` int(11) NOT NULL,
  `LIBINDIC` char(20) DEFAULT NULL,
  `POIDS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `indicateur`
--

INSERT INTO `indicateur` (`NUMINDIC`, `NUMACTION`, `LIBINDIC`, `POIDS`) VALUES
(1, 1, 'Commencer par le hau', 5),
(2, 1, 'Etre gentil', 10);

-- --------------------------------------------------------

--
-- Structure de la table `jeu`
--

CREATE TABLE IF NOT EXISTS `jeu` (
  `NUMJEU` int(11) NOT NULL,
  `LIBELLEJEU` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `jeu`
--

INSERT INTO `jeu` (`NUMJEU`, `LIBELLEJEU`) VALUES
(1, 'Jeu des catagnettes'),
(2, 'Jeu des courgettes');

-- --------------------------------------------------------

--
-- Structure de la table `mission`
--

CREATE TABLE IF NOT EXISTS `mission` (
  `NUMMISSION` int(11) NOT NULL,
  `NUMJEU` int(11) NOT NULL,
  `LIBMISSION` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `objectif`
--

CREATE TABLE IF NOT EXISTS `objectif` (
  `NUMOBJECTIF` int(11) NOT NULL,
  `LIBOBECTIF` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `obtient`
--

CREATE TABLE IF NOT EXISTS `obtient` (
  `NUMAPPRENANT` int(11) NOT NULL,
  `DATEJOUR` date NOT NULL,
  `NUMACTION` int(11) NOT NULL,
  `VALEURDEBUT` int(11) DEFAULT NULL,
  `VALEURFIN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `obtient`
--

INSERT INTO `obtient` (`NUMAPPRENANT`, `DATEJOUR`, `NUMACTION`, `VALEURDEBUT`, `VALEURFIN`) VALUES
(1, '2015-06-08', 2, 1000, 2000),
(1, '2015-06-08', 3, 1000, 2000);

-- --------------------------------------------------------

--
-- Structure de la table `possede`
--

CREATE TABLE IF NOT EXISTS `possede` (
  `NUMACTION` int(11) NOT NULL,
  `NUMREGLE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `regle`
--

CREATE TABLE IF NOT EXISTS `regle` (
  `NUMREGLE` int(11) NOT NULL,
  `LIBREGLE` char(25) DEFAULT NULL,
  `SCOREMIN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `action`
--
ALTER TABLE `action`
 ADD PRIMARY KEY (`NUMACTION`);

--
-- Index pour la table `appartient`
--
ALTER TABLE `appartient`
 ADD PRIMARY KEY (`NUMJEU`,`NUMACTION`), ADD KEY `APPARTIENT_FK` (`NUMJEU`), ADD KEY `APPARTIENT2_FK` (`NUMACTION`);

--
-- Index pour la table `apprenant`
--
ALTER TABLE `apprenant`
 ADD PRIMARY KEY (`NUMAPPRENANT`);

--
-- Index pour la table `calendrier`
--
ALTER TABLE `calendrier`
 ADD PRIMARY KEY (`DATEJOUR`);

--
-- Index pour la table `est_associe`
--
ALTER TABLE `est_associe`
 ADD PRIMARY KEY (`NUMACTION`,`NUMOBJECTIF`), ADD KEY `EST_ASSOCIE_FK` (`NUMACTION`), ADD KEY `EST_ASSOCIE2_FK` (`NUMOBJECTIF`);

--
-- Index pour la table `fixe`
--
ALTER TABLE `fixe`
 ADD PRIMARY KEY (`NUMMISSION`,`NUMOBJECTIF`), ADD KEY `FIXE_FK` (`NUMMISSION`), ADD KEY `FIXE2_FK` (`NUMOBJECTIF`);

--
-- Index pour la table `indicateur`
--
ALTER TABLE `indicateur`
 ADD PRIMARY KEY (`NUMINDIC`), ADD KEY `EST_VALORISE_FK` (`NUMACTION`);

--
-- Index pour la table `jeu`
--
ALTER TABLE `jeu`
 ADD PRIMARY KEY (`NUMJEU`);

--
-- Index pour la table `mission`
--
ALTER TABLE `mission`
 ADD PRIMARY KEY (`NUMMISSION`), ADD KEY `SE_COMPOSE_FK` (`NUMJEU`);

--
-- Index pour la table `objectif`
--
ALTER TABLE `objectif`
 ADD PRIMARY KEY (`NUMOBJECTIF`);

--
-- Index pour la table `obtient`
--
ALTER TABLE `obtient`
 ADD PRIMARY KEY (`NUMAPPRENANT`,`DATEJOUR`,`NUMACTION`), ADD KEY `OBTIENT_FK` (`NUMAPPRENANT`), ADD KEY `OBTIENT3_FK` (`DATEJOUR`), ADD KEY `OBTIENT3_FK2` (`NUMACTION`);

--
-- Index pour la table `possede`
--
ALTER TABLE `possede`
 ADD PRIMARY KEY (`NUMACTION`,`NUMREGLE`), ADD KEY `POSSEDE_FK` (`NUMACTION`), ADD KEY `POSSEDE2_FK` (`NUMREGLE`);

--
-- Index pour la table `regle`
--
ALTER TABLE `regle`
 ADD PRIMARY KEY (`NUMREGLE`);

--
-- Contraintes pour les tables exportées
--


--
-- Contraintes pour la table `appartient`
--
ALTER TABLE `appartient`
ADD CONSTRAINT `FK_APPARTIE_APPARTIEN_ACTION` FOREIGN KEY (`NUMACTION`) REFERENCES `action` (`NUMACTION`),
ADD CONSTRAINT `FK_APPARTIE_APPARTIEN_JEU` FOREIGN KEY (`NUMJEU`) REFERENCES `jeu` (`NUMJEU`);

--
-- Contraintes pour la table `est_associe`
--
ALTER TABLE `est_associe`
ADD CONSTRAINT `FK_EST_ASSO_EST_ASSOC_ACTION` FOREIGN KEY (`NUMACTION`) REFERENCES `action` (`NUMACTION`),
ADD CONSTRAINT `FK_EST_ASSO_EST_ASSOC_OBJECTIF` FOREIGN KEY (`NUMOBJECTIF`) REFERENCES `objectif` (`NUMOBJECTIF`);

--
-- Contraintes pour la table `fixe`
--
ALTER TABLE `fixe`
ADD CONSTRAINT `FK_FIXE_FIXE2_OBJECTIF` FOREIGN KEY (`NUMOBJECTIF`) REFERENCES `objectif` (`NUMOBJECTIF`),
ADD CONSTRAINT `FK_FIXE_FIXE_MISSION` FOREIGN KEY (`NUMMISSION`) REFERENCES `mission` (`NUMMISSION`);

--
-- Contraintes pour la table `indicateur`
--
ALTER TABLE `indicateur`
ADD CONSTRAINT `FK_INDICATE_EST_VALOR_ACTION` FOREIGN KEY (`NUMACTION`) REFERENCES `action` (`NUMACTION`);

--
-- Contraintes pour la table `mission`
--
ALTER TABLE `mission`
ADD CONSTRAINT `FK_MISSION_SE_COMPOS_JEU` FOREIGN KEY (`NUMJEU`) REFERENCES `jeu` (`NUMJEU`);

--
-- Contraintes pour la table `obtient`
--
ALTER TABLE `obtient`
ADD CONSTRAINT `FK_OBTIENT_OBTIENT2_CALENDRI` FOREIGN KEY (`DATEJOUR`) REFERENCES `calendrier` (`DATEJOUR`),
ADD CONSTRAINT `FK_OBTIENT_OBTIENT3_ACTION` FOREIGN KEY (`NUMACTION`) REFERENCES `action` (`NUMACTION`),
ADD CONSTRAINT `FK_OBTIENT_OBTIENT_APPRENAN` FOREIGN KEY (`NUMAPPRENANT`) REFERENCES `apprenant` (`NUMAPPRENANT`);

--
-- Contraintes pour la table `possede`
--
ALTER TABLE `possede`
ADD CONSTRAINT `FK_POSSEDE_POSSEDE2_REGLE` FOREIGN KEY (`NUMREGLE`) REFERENCES `regle` (`NUMREGLE`),
ADD CONSTRAINT `FK_POSSEDE_POSSEDE_ACTION` FOREIGN KEY (`NUMACTION`) REFERENCES `action` (`NUMACTION`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
