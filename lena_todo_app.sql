-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 29, 2021 at 09:42 PM
-- Server version: 10.5.11-MariaDB-1:10.5.11+maria~focal
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `todo_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(10) UNSIGNED NOT NULL,
  `libelle` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categorie`
--

INSERT INTO `categorie` (`id`, `libelle`) VALUES
(1, 'Examen'),
(2, 'Legume'),
(3, 'bdd'),
(4, 'Proprete');

-- --------------------------------------------------------

--
-- Table structure for table `categorie_tache`
--

CREATE TABLE `categorie_tache` (
  `categorie_id` int(10) UNSIGNED NOT NULL,
  `tache_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categorie_tache`
--

INSERT INTO `categorie_tache` (`categorie_id`, `tache_id`) VALUES
(3, 9),
(3, 10),
(3, 11),
(3, 12);

-- --------------------------------------------------------

--
-- Table structure for table `etat`
--

CREATE TABLE `etat` (
  `id` int(10) UNSIGNED NOT NULL,
  `libelle` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
(1, 'todo'),
(2, 'done'),
(3, 'cancelled'),
(4, 'ongoing');

-- --------------------------------------------------------

--
-- Table structure for table `tache`
--

CREATE TABLE `tache` (
  `id` int(10) UNSIGNED NOT NULL,
  `todolist_id` int(10) UNSIGNED NOT NULL,
  `etat_id` int(10) UNSIGNED NOT NULL,
  `libelle` varchar(40) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tache`
--

INSERT INTO `tache` (`id`, `todolist_id`, `etat_id`, `libelle`, `description`) VALUES
(1, 1, 1, 'Banane', 'Acheter trois bananes'),
(2, 1, 1, 'Pain', 'Acheter une baguette'),
(3, 1, 1, 'Beurre d\'arachide', 'Acheter du beurre d\'arachide'),
(4, 2, 2, 'Devoir de math', 'Completer exercices 1-3'),
(5, 2, 3, 'Presentation orale', 'Preparer Power Point'),
(6, 4, 4, 'Texte francais', 'Ecrire texte pour cours FR010'),
(7, 3, 4, 'Balai', 'Nettoyer le sous-sol'),
(8, 3, 4, 'Vetements', 'Faire le tri'),
(9, 5, 2, 'Creer la bdd', 'Creer une bdd pour faire une todolist'),
(10, 5, 2, 'Creer les tables', 'Creer des tables pour representer des utilisateurs, des todolists et des taches'),
(11, 5, 2, 'Mettre en place des relations', 'Relier les tables utilisateur et todolist\r\nRelier les tables todolist et tache'),
(12, 5, 2, 'Inserer des data', 'Inserer des utilisateurs, des todolists et des taches');

-- --------------------------------------------------------

--
-- Table structure for table `todolist`
--

CREATE TABLE `todolist` (
  `id` int(10) UNSIGNED NOT NULL,
  `utilisateur_id` int(10) UNSIGNED NOT NULL,
  `libelle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `todolist`
--

INSERT INTO `todolist` (`id`, `utilisateur_id`, `libelle`) VALUES
(1, 1, 'Courses'),
(2, 1, 'Devoirs ecole'),
(3, 2, 'Menage'),
(4, 2, 'Devoirs universite'),
(5, 2, 'Administration');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(10) UNSIGNED NOT NULL,
  `pseudo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `pseudo`) VALUES
(1, 'Alice'),
(2, 'Bob');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categorie_tache`
--
ALTER TABLE `categorie_tache`
  ADD KEY `categorie_tache_categorie_id` (`categorie_id`),
  ADD KEY `categorie_tache_tache_id` (`tache_id`);

--
-- Indexes for table `etat`
--
ALTER TABLE `etat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tache`
--
ALTER TABLE `tache`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tache_todolist_id` (`todolist_id`),
  ADD KEY `tache_etat_id` (`etat_id`);

--
-- Indexes for table `todolist`
--
ALTER TABLE `todolist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `todolist_utilisateur_id` (`utilisateur_id`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `etat`
--
ALTER TABLE `etat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tache`
--
ALTER TABLE `tache`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `todolist`
--
ALTER TABLE `todolist`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categorie_tache`
--
ALTER TABLE `categorie_tache`
  ADD CONSTRAINT `fk_categorie_id` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`),
  ADD CONSTRAINT `fk_tache_id` FOREIGN KEY (`tache_id`) REFERENCES `tache` (`id`);

--
-- Constraints for table `tache`
--
ALTER TABLE `tache`
  ADD CONSTRAINT `fk_etat_id` FOREIGN KEY (`etat_id`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `fk_todolist_id` FOREIGN KEY (`todolist_id`) REFERENCES `todolist` (`id`);

--
-- Constraints for table `todolist`
--
ALTER TABLE `todolist`
  ADD CONSTRAINT `fk_utilisateur_id` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
