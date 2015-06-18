-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 18 Juin 2015 à 16:47
-- Version du serveur :  5.6.21
-- Version de PHP :  5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `PermisPiste`
--

-- --------------------------------------------------------

--
-- Structure de la table `ACTION`
--

CREATE TABLE IF NOT EXISTS `ACTION` (
  `NUMACTION` int(11) NOT NULL,
  `ACT_NUMACTION` int(11) DEFAULT NULL,
  `LIBACTION` char(25) DEFAULT NULL,
  `SCOREMIN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `ACTION`
--

INSERT INTO `ACTION` (`NUMACTION`, `ACT_NUMACTION`, `LIBACTION`, `SCOREMIN`) VALUES
(1, 1, 'demarrer', 10),
(2, 1, 'rouler', 20),
(3, 1, 'demiTour', 10),
(4, 1, 'arreter', 10);

-- --------------------------------------------------------

--
-- Structure de la table `APPARTIENT`
--

CREATE TABLE IF NOT EXISTS `APPARTIENT` (
  `NUMJEU` int(11) NOT NULL,
  `NUMACTION` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `APPARTIENT`
--

INSERT INTO `APPARTIENT` (`NUMJEU`, `NUMACTION`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `APPRENANT`
--

CREATE TABLE IF NOT EXISTS `APPRENANT` (
  `NUMAPPRENANT` int(11) NOT NULL,
  `NOMAPPRENANT` char(25) DEFAULT NULL,
  `PRENOMAPPRENANT` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `APPRENANT`
--

INSERT INTO `APPRENANT` (`NUMAPPRENANT`, `NOMAPPRENANT`, `PRENOMAPPRENANT`) VALUES
(1, 'Ytech', 'Paul'),
(2, 'Robert', 'Jean');

-- --------------------------------------------------------

--
-- Structure de la table `CALENDRIER`
--

CREATE TABLE IF NOT EXISTS `CALENDRIER` (
  `DATEJOUR` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `CALENDRIER`
--

INSERT INTO `CALENDRIER` (`DATEJOUR`) VALUES
('2013-04-01'),
('2015-06-18');

-- --------------------------------------------------------

--
-- Structure de la table `EST_ASSOCIE`
--

CREATE TABLE IF NOT EXISTS `EST_ASSOCIE` (
  `NUMACTION` int(11) NOT NULL,
  `NUMOBJECTIF` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `EST_ASSOCIE`
--

INSERT INTO `EST_ASSOCIE` (`NUMACTION`, `NUMOBJECTIF`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3),
(4, 1),
(4, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Structure de la table `FIXE`
--

CREATE TABLE IF NOT EXISTS `FIXE` (
  `NUMMISSION` int(11) NOT NULL,
  `NUMOBJECTIF` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `FIXE`
--

INSERT INTO `FIXE` (`NUMMISSION`, `NUMOBJECTIF`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `INDICATEUR`
--

CREATE TABLE IF NOT EXISTS `INDICATEUR` (
  `NUMINDIC` int(11) NOT NULL,
  `NUMACTION` int(11) NOT NULL,
  `LIBINDIC` char(20) DEFAULT NULL,
  `POIDS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `INSCRIT`
--

CREATE TABLE IF NOT EXISTS `INSCRIT` (
  `NUMJEU` int(11) NOT NULL,
  `NUMAPPRENANT` int(11) NOT NULL,
  `DATEJOUR` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `INSCRIT`
--

INSERT INTO `INSCRIT` (`NUMJEU`, `NUMAPPRENANT`, `DATEJOUR`) VALUES
(1, 1, '2015-06-18'),
(1, 2, '2013-04-01');

-- --------------------------------------------------------

--
-- Structure de la table `JEU`
--

CREATE TABLE IF NOT EXISTS `JEU` (
  `NUMJEU` int(11) NOT NULL,
  `LIBELLEJEU` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `JEU`
--

INSERT INTO `JEU` (`NUMJEU`, `LIBELLEJEU`) VALUES
(1, 'simulationCamion');

-- --------------------------------------------------------

--
-- Structure de la table `MISSION`
--

CREATE TABLE IF NOT EXISTS `MISSION` (
  `NUMMISSION` int(11) NOT NULL,
  `NUMJEU` int(11) NOT NULL,
  `LIBMISSION` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `MISSION`
--

INSERT INTO `MISSION` (`NUMMISSION`, `NUMJEU`, `LIBMISSION`) VALUES
(1, 1, 'initiationCamion'),
(2, 1, 'perfectionnementCamion'),
(3, 1, 'expertiseCamion');

-- --------------------------------------------------------

--
-- Structure de la table `OBJECTIF`
--

CREATE TABLE IF NOT EXISTS `OBJECTIF` (
  `NUMOBJECTIF` int(11) NOT NULL,
  `LIBOBECTIF` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `OBJECTIF`
--

INSERT INTO `OBJECTIF` (`NUMOBJECTIF`, `LIBOBECTIF`) VALUES
(1, 'conduiteUrbaine'),
(2, 'conduiteRurale'),
(3, 'conduiteCircuit');

-- --------------------------------------------------------

--
-- Structure de la table `OBTIENT`
--

CREATE TABLE IF NOT EXISTS `OBTIENT` (
  `NUMAPPRENANT` int(11) NOT NULL,
  `DATEJOUR` date NOT NULL,
  `NUMACTION` int(11) NOT NULL,
  `VALEURDEBUT` int(11) DEFAULT NULL,
  `VALEURFIN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `OBTIENT`
--

INSERT INTO `OBTIENT` (`NUMAPPRENANT`, `DATEJOUR`, `NUMACTION`, `VALEURDEBUT`, `VALEURFIN`) VALUES
(1, '2015-06-18', 2, 2, 3),
(1, '2015-06-18', 4, 20, 40),
(2, '2013-04-01', 3, 50, 20);

-- --------------------------------------------------------

--
-- Structure de la table `POSSEDE`
--

CREATE TABLE IF NOT EXISTS `POSSEDE` (
  `NUMACTION` int(11) NOT NULL,
  `NUMREGLE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `REGLE`
--

CREATE TABLE IF NOT EXISTS `REGLE` (
  `NUMREGLE` int(11) NOT NULL,
  `LIBREGLE` char(25) DEFAULT NULL,
  `SCOREMIN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `ACTION`
--
ALTER TABLE `ACTION`
 ADD PRIMARY KEY (`NUMACTION`), ADD KEY `A_POUR_SUCCESSEUR_FK` (`ACT_NUMACTION`);

--
-- Index pour la table `APPARTIENT`
--
ALTER TABLE `APPARTIENT`
 ADD PRIMARY KEY (`NUMJEU`,`NUMACTION`), ADD KEY `APPARTIENT_FK` (`NUMJEU`), ADD KEY `APPARTIENT2_FK` (`NUMACTION`);

--
-- Index pour la table `APPRENANT`
--
ALTER TABLE `APPRENANT`
 ADD PRIMARY KEY (`NUMAPPRENANT`);

--
-- Index pour la table `CALENDRIER`
--
ALTER TABLE `CALENDRIER`
 ADD PRIMARY KEY (`DATEJOUR`);

--
-- Index pour la table `EST_ASSOCIE`
--
ALTER TABLE `EST_ASSOCIE`
 ADD PRIMARY KEY (`NUMACTION`,`NUMOBJECTIF`), ADD KEY `EST_ASSOCIE_FK` (`NUMACTION`), ADD KEY `EST_ASSOCIE2_FK` (`NUMOBJECTIF`);

--
-- Index pour la table `FIXE`
--
ALTER TABLE `FIXE`
 ADD PRIMARY KEY (`NUMMISSION`,`NUMOBJECTIF`), ADD KEY `FIXE_FK` (`NUMMISSION`), ADD KEY `FIXE2_FK` (`NUMOBJECTIF`);

--
-- Index pour la table `INDICATEUR`
--
ALTER TABLE `INDICATEUR`
 ADD PRIMARY KEY (`NUMINDIC`), ADD KEY `EST_VALORISE_FK` (`NUMACTION`);

--
-- Index pour la table `JEU`
--
ALTER TABLE `JEU`
 ADD PRIMARY KEY (`NUMJEU`);

--
-- Index pour la table `MISSION`
--
ALTER TABLE `MISSION`
 ADD PRIMARY KEY (`NUMMISSION`), ADD KEY `SE_COMPOSE_FK` (`NUMJEU`);

--
-- Index pour la table `OBJECTIF`
--
ALTER TABLE `OBJECTIF`
 ADD PRIMARY KEY (`NUMOBJECTIF`);

--
-- Index pour la table `OBTIENT`
--
ALTER TABLE `OBTIENT`
 ADD PRIMARY KEY (`NUMAPPRENANT`,`DATEJOUR`,`NUMACTION`), ADD KEY `OBTIENT_FK` (`NUMAPPRENANT`), ADD KEY `OBTIENT3_FK` (`DATEJOUR`), ADD KEY `OBTIENT3_FK2` (`NUMACTION`);

--
-- Index pour la table `POSSEDE`
--
ALTER TABLE `POSSEDE`
 ADD PRIMARY KEY (`NUMACTION`,`NUMREGLE`), ADD KEY `POSSEDE_FK` (`NUMACTION`), ADD KEY `POSSEDE2_FK` (`NUMREGLE`);

--
-- Index pour la table `REGLE`
--
ALTER TABLE `REGLE`
 ADD PRIMARY KEY (`NUMREGLE`);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `ACTION`
--
ALTER TABLE `ACTION`
ADD CONSTRAINT `FK_ACTION_A_POUR_SU_ACTION` FOREIGN KEY (`ACT_NUMACTION`) REFERENCES `ACTION` (`NUMACTION`);

--
-- Contraintes pour la table `APPARTIENT`
--
ALTER TABLE `APPARTIENT`
ADD CONSTRAINT `FK_APPARTIE_APPARTIEN_ACTION` FOREIGN KEY (`NUMACTION`) REFERENCES `ACTION` (`NUMACTION`),
ADD CONSTRAINT `FK_APPARTIE_APPARTIEN_JEU` FOREIGN KEY (`NUMJEU`) REFERENCES `JEU` (`NUMJEU`);

--
-- Contraintes pour la table `EST_ASSOCIE`
--
ALTER TABLE `EST_ASSOCIE`
ADD CONSTRAINT `FK_EST_ASSO_EST_ASSOC_ACTION` FOREIGN KEY (`NUMACTION`) REFERENCES `ACTION` (`NUMACTION`),
ADD CONSTRAINT `FK_EST_ASSO_EST_ASSOC_OBJECTIF` FOREIGN KEY (`NUMOBJECTIF`) REFERENCES `OBJECTIF` (`NUMOBJECTIF`);

--
-- Contraintes pour la table `FIXE`
--
ALTER TABLE `FIXE`
ADD CONSTRAINT `FK_FIXE_FIXE2_OBJECTIF` FOREIGN KEY (`NUMOBJECTIF`) REFERENCES `OBJECTIF` (`NUMOBJECTIF`),
ADD CONSTRAINT `FK_FIXE_FIXE_MISSION` FOREIGN KEY (`NUMMISSION`) REFERENCES `MISSION` (`NUMMISSION`);

--
-- Contraintes pour la table `INDICATEUR`
--
ALTER TABLE `INDICATEUR`
ADD CONSTRAINT `FK_INDICATE_EST_VALOR_ACTION` FOREIGN KEY (`NUMACTION`) REFERENCES `ACTION` (`NUMACTION`);

--
-- Contraintes pour la table `MISSION`
--
ALTER TABLE `MISSION`
ADD CONSTRAINT `FK_MISSION_SE_COMPOS_JEU` FOREIGN KEY (`NUMJEU`) REFERENCES `JEU` (`NUMJEU`);

--
-- Contraintes pour la table `OBTIENT`
--
ALTER TABLE `OBTIENT`
ADD CONSTRAINT `FK_OBTIENT_OBTIENT2_CALENDRI` FOREIGN KEY (`DATEJOUR`) REFERENCES `CALENDRIER` (`DATEJOUR`),
ADD CONSTRAINT `FK_OBTIENT_OBTIENT3_ACTION` FOREIGN KEY (`NUMACTION`) REFERENCES `ACTION` (`NUMACTION`),
ADD CONSTRAINT `FK_OBTIENT_OBTIENT_APPRENAN` FOREIGN KEY (`NUMAPPRENANT`) REFERENCES `APPRENANT` (`NUMAPPRENANT`);

--
-- Contraintes pour la table `POSSEDE`
--
ALTER TABLE `POSSEDE`
ADD CONSTRAINT `FK_POSSEDE_POSSEDE2_REGLE` FOREIGN KEY (`NUMREGLE`) REFERENCES `REGLE` (`NUMREGLE`),
ADD CONSTRAINT `FK_POSSEDE_POSSEDE_ACTION` FOREIGN KEY (`NUMACTION`) REFERENCES `ACTION` (`NUMACTION`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
