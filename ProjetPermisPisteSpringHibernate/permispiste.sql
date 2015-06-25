CREATE TABLE IF NOT EXISTS `action` (
  `NUMACTION` int(11) NOT NULL AUTO_INCREMENT,
  `LIBACTION` char(25) DEFAULT NULL,
  PRIMARY KEY (`NUMACTION`)
) ;

--
-- Contenu de la table `action`
--

INSERT INTO `action` (`NUMACTION`, `LIBACTION`) VALUES
(1, 'lala'),
(2, 'Manger biloute'),
(3, 'Manger une pomme'),
(4, 'Chanter');

-- --------------------------------------------------------

--
-- Structure de la table `appartient`
--

CREATE TABLE IF NOT EXISTS `appartient` (
  `NUMJEU` int(11) NOT NULL,
  `NUMACTION` int(11) NOT NULL,
  PRIMARY KEY (`NUMJEU`,`NUMACTION`),
  KEY `APPARTIENT_FK` (`NUMJEU`),
  KEY `APPARTIENT2_FK` (`NUMACTION`)
) ;

-- --------------------------------------------------------

--
-- Structure de la table `apprenant`
--

CREATE TABLE IF NOT EXISTS `apprenant` (
  `NUMAPPRENANT` int(11) NOT NULL AUTO_INCREMENT,
  `NOMAPPRENANT` char(25) DEFAULT NULL,
  `PRENOMAPPRENANT` char(25) DEFAULT NULL,
  PRIMARY KEY (`NUMAPPRENANT`)
) ;

--
-- Contenu de la table `apprenant`
--

INSERT INTO `apprenant` (`NUMAPPRENANT`, `NOMAPPRENANT`, `PRENOMAPPRENANT`) VALUES
(1, 'z', 'z'),
(2, 'lili', 'lili'),
(3, 'lolo', 'lolo'),
(4, 'mpmp', 'mpmp'),
(5, 'ppp', 'ppp'),
(6, 'u', 'u'),
(7, 'popo', 'popo'),
(8, 'Bianco', 'Camille');

-- --------------------------------------------------------

--
-- Structure de la table `calendrier`
--

CREATE TABLE IF NOT EXISTS `calendrier` (
  `DATEJOUR` date NOT NULL,
  PRIMARY KEY (`DATEJOUR`)
)  ;

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
  `NUMOBJECTIF` int(11) NOT NULL,
  PRIMARY KEY (`NUMACTION`,`NUMOBJECTIF`),
  KEY `EST_ASSOCIE_FK` (`NUMACTION`),
  KEY `EST_ASSOCIE2_FK` (`NUMOBJECTIF`)
)  ;

-- --------------------------------------------------------

--
-- Structure de la table `fixe`
--

CREATE TABLE IF NOT EXISTS `fixe` (
  `NUMMISSION` int(11) NOT NULL,
  `NUMOBJECTIF` int(11) NOT NULL,
  PRIMARY KEY (`NUMMISSION`,`NUMOBJECTIF`),
  KEY `FIXE_FK` (`NUMMISSION`),
  KEY `FIXE2_FK` (`NUMOBJECTIF`)
) ;

-- --------------------------------------------------------

--
-- Structure de la table `indicateur`
--

CREATE TABLE IF NOT EXISTS `indicateur` (
  `NUMINDIC` int(11) NOT NULL AUTO_INCREMENT,
  `NUMACTION` int(11) NOT NULL,
  `LIBINDIC` char(20) DEFAULT NULL,
  `POIDS` int(11) DEFAULT NULL,
  PRIMARY KEY (`NUMINDIC`),
  KEY `EST_VALORISE_FK` (`NUMACTION`)
) ;

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
  `NUMJEU` int(11) NOT NULL AUTO_INCREMENT,
  `LIBELLEJEU` char(25) DEFAULT NULL,
  PRIMARY KEY (`NUMJEU`)
) ;

--
-- Contenu de la table `jeu`
--

INSERT INTO `jeu` (`NUMJEU`, `LIBELLEJEU`) VALUES
(1, 'Pilotage'),
(2, 'Manoeuvre');

-- --------------------------------------------------------

--
-- Structure de la table `mission`
--

CREATE TABLE IF NOT EXISTS `mission` (
  `NUMMISSION` int(11) NOT NULL AUTO_INCREMENT,
  `NUMJEU` int(11) NOT NULL,
  `LIBMISSION` char(25) DEFAULT NULL,
  PRIMARY KEY (`NUMMISSION`),
  KEY `SE_COMPOSE_FK` (`NUMJEU`)
);

-- --------------------------------------------------------

--
-- Structure de la table `objectif`
--

CREATE TABLE IF NOT EXISTS `objectif` (
  `NUMOBJECTIF` int(11) NOT NULL AUTO_INCREMENT,
  `LIBOBECTIF` char(25) DEFAULT NULL,
  PRIMARY KEY (`NUMOBJECTIF`)
);

-- --------------------------------------------------------

--
-- Structure de la table `obtient`
--

CREATE TABLE IF NOT EXISTS `obtient` (
  `NUMAPPRENANT` int(11) NOT NULL,
  `DATEJOUR` date NOT NULL,
  `NUMACTION` int(11) NOT NULL,
  `VALEURDEBUT` int(11) DEFAULT NULL,
  `VALEURFIN` int(11) DEFAULT NULL,
  PRIMARY KEY (`NUMAPPRENANT`,`DATEJOUR`,`NUMACTION`),
  KEY `OBTIENT_FK` (`NUMAPPRENANT`),
  KEY `OBTIENT3_FK` (`DATEJOUR`),
  KEY `OBTIENT3_FK2` (`NUMACTION`)
) ;

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
  `NUMREGLE` int(11) NOT NULL,
  PRIMARY KEY (`NUMACTION`,`NUMREGLE`),
  KEY `POSSEDE_FK` (`NUMACTION`),
  KEY `POSSEDE2_FK` (`NUMREGLE`)
)  ;

-- --------------------------------------------------------

--
-- Structure de la table `regle`
--

CREATE TABLE IF NOT EXISTS `regle` (
  `NUMREGLE` int(11) NOT NULL AUTO_INCREMENT,
  `LIBREGLE` char(25) DEFAULT NULL,
  `SCOREMIN` int(11) DEFAULT NULL,
  PRIMARY KEY (`NUMREGLE`)
);

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