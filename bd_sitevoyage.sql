-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 14 déc. 2023 à 09:40
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bd_sitevoyage`
--
CREATE DATABASE IF NOT EXISTS `bd_sitevoyage` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bd_sitevoyage`;

-- --------------------------------------------------------

--
-- Structure de la table `cat_categorie`
--

DROP TABLE IF EXISTS `cat_categorie`;
CREATE TABLE IF NOT EXISTS `cat_categorie` (
  `CAT_IdCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `CAT_LibCategorie` varchar(38) NOT NULL,
  PRIMARY KEY (`CAT_IdCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `loc_location`
--

DROP TABLE IF EXISTS `loc_location`;
CREATE TABLE IF NOT EXISTS `loc_location` (
  `LOC_IdLocation` int(11) NOT NULL AUTO_INCREMENT,
  `LOC_NomLocation` varchar(38) NOT NULL,
  `CAT_IdCategorie` int(11) NOT NULL,
  `PAY_IdPays` int(11) NOT NULL,
  `LOC_NoteLocation` int(2) DEFAULT NULL,
  `LOC_DescLocation` text NOT NULL,
  `LOC_AvisPerso` text,
  `LOC_DateLocation` date NOT NULL,
  PRIMARY KEY (`LOC_IdLocation`),
  KEY `CAT_IdCategorie` (`CAT_IdCategorie`),
  KEY `PAY_IdPays` (`PAY_IdPays`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `pay_pays`
--

DROP TABLE IF EXISTS `pay_pays`;
CREATE TABLE IF NOT EXISTS `pay_pays` (
  `PAY_idPays` int(11) NOT NULL AUTO_INCREMENT,
  `PAY_NomPays` varchar(38) NOT NULL,
  `PAY_NotePays` int(2) DEFAULT NULL,
  PRIMARY KEY (`PAY_idPays`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `loc_location`
--
ALTER TABLE `loc_location`
  ADD CONSTRAINT `loc_location_ibfk_1` FOREIGN KEY (`CAT_IdCategorie`) REFERENCES `cat_categorie` (`CAT_IdCategorie`),
  ADD CONSTRAINT `loc_location_ibfk_2` FOREIGN KEY (`PAY_IdPays`) REFERENCES `pay_pays` (`PAY_idPays`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
