-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 26 mai 2022 à 08:38
-- Version du serveur : 8.0.21
-- Version de PHP : 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `eni_demos_symfony_m10`
--

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `description` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `description`, `rating`, `active`) VALUES
(1, 'test1', 99, 'fgynbn iuuouioi', 7, 0),
(2, 'produit2', 123, 'lorem ipsum dolor sit amet.', 9, 1),
(3, 'produit3 ', 46, 'Phasellus sapien arcu, facilisis eu libero vitae, molestie ultricies tortor. Etiam quis urna congue, pretium lectus bibendum, finibus justo. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam efficitur odio a eros eleifend, at venenatis velit aliquam. Duis volutpat fringilla ipsum, nec dapibus nulla ornare eu. Mauris at sem vitae turpis bibendum malesuada nec id tortor. Vestibulum nec urna porta mauris cursus rutrum. ', 9, 1),
(4, 'produit4', 200, 'Duis pharetra, ex eu vulputate auctor, magna erat accumsan nunc, nec gravida neque sem eget tellus. Mauris auctor urna non lobortis ullamcorper. Praesent efficitur mattis erat vitae pellentesque. Donec porta eros felis, eget ornare arcu facilisis sit amet. Vestibulum elit dui, elementum eu urna egestas, sodales ultrices risus. In luctus elit posuere ipsum auctor suscipit vitae faucibus risus. Sed non felis eu mauris porta dapibus. Nunc porttitor a turpis ac congue. ', 10, 0);

-- --------------------------------------------------------

--
-- Structure de la table `wish`
--

DROP TABLE IF EXISTS `wish`;
CREATE TABLE IF NOT EXISTS `wish` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `wish`
--

INSERT INTO `wish` (`id`, `title`, `description`, `author`, `is_published`, `date_created`) VALUES
(1, 'Obtenir mon titre DWWM', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent vestibulum dignissim nibh, ac aliquet dui. Phasellus porta fermentum elementum. \r\n\r\nPraesent nec egestas eros. In eget ligula a nulla pellentesque sagittis. Sed hendrerit ac nibh eu ultrices. Pellentesque fringilla mollis neque, in condimentum turpis ullamcorper sit amet. Proin tincidunt scelerisque diam ut egestas. Suspendisse potenti. Ut mollis, erat in aliquam elementum, nunc nunc convallis arcu, eu aliquet nibh turpis vel purus. \r\n\r\nPraesent sit amet ex sit amet purus posuere luctus a nec ligula. Nunc vitae metus vitae nulla porttitor euismod a euismod nibh. Mauris facilisis orci eget ante sodales, a rutrum erat dignissim. Praesent lorem nisi, gravida eget convallis at, fermentum nec dolor. Fusce ac imperdiet leo, quis molestie erat. Donec est purus, gravida sed mi in, viverra congue orci. ', 'Mike Crosoft', 1, '2022-01-12 17:27:20'),
(2, 'Décrocher un CDI', 'Suspendisse finibus tristique quam, varius malesuada nunc dignissim ultricies. Nullam rhoncus vel tellus ac interdum. Cras ut urna pretium, dignissim nulla eu, ornare ligula. Cras sed urna nec mauris posuere tristique. Suspendisse efficitur odio id dignissim pharetra. \r\n\r\nVivamus eget faucibus nisl, in mollis lectus. Donec dapibus sem id vehicula faucibus. Ut felis orci, commodo at justo in, interdum aliquet urna. Suspendisse viverra augue sit amet ornare blandit. Duis ullamcorper sollicitudin orci, non porttitor metus volutpat non. ', 'Paul Ka', 0, '2022-01-12 17:28:45'),
(3, 'Trouver un stage', 'Aliquam tempus eu quam eget ullamcorper. Nulla porttitor arcu vel rhoncus finibus. Phasellus elementum ligula nibh, a vulputate libero cursus et. Duis dignissim tincidunt sapien. Curabitur nec nulla id enim tempus sodales a id orci. ', 'tom@farcy.fr', 1, '2022-01-12 17:29:40'),
(4, 'En finir avec le Covid', 'Cras consectetur leo rutrum enim interdum pharetra. Duis in egestas leo. Mauris molestie, diam ac fermentum efficitur, erat ligula ultrices mi, ut consequat ante urna a magna. Aenean sed ultricies dolor, a luctus mi. \r\n\r\nPraesent gravida lobortis egestas. Nullam tortor justo, semper vel condimentum vestibulum, pharetra maximus libero. Donec tristique erat ac ipsum fermentum, ut mattis est feugiat. Quisque sed massa sit amet libero efficitur congue ac at leo. Integer imperdiet velit elit, vitae egestas ante scelerisque in. \r\n\r\nVivamus ut enim eget leo blandit tincidunt quis at libero. Nunc volutpat aliquam orci nec imperdiet. Aliquam erat volutpat. Phasellus cursus ipsum sed enim ullamcorper, blandit imperdiet lorem ultrices. Nunc sed vestibulum sapien. Donec sodales dui lacus, a finibus justo sodales eu. Fusce vel molestie metus, non posuere arcu. ', 'Véran O.', 1, '2022-01-12 17:30:00'),
(5, 'Maitriser Symfony', 'Suspendisse nibh turpis, ornare et euismod ac, gravida vel diam. Proin sit amet metus tellus. Fusce tincidunt ligula et volutpat posuere. Donec eleifend urna laoreet urna posuere imperdiet. Maecenas tortor sapien, luctus eu tincidunt non, lobortis quis leo. Ut dictum ornare orci a posuere. Phasellus sit amet ipsum id metus bibendum fringilla eget nec lorem. Curabitur pharetra iaculis ex, a sodales est fringilla et. Etiam lectus neque, ultrices ac cursus non, blandit eget arcu. Integer lobortis nibh dolor. Nunc quis leo ut nisi mollis semper ac ut lorem. Nullam imperdiet suscipit augue, in pulvinar erat laoreet rhoncus. Morbi cursus leo non pulvinar interdum. Mauris mattis a ligula id scelerisque. Fusce quis odio ac metus aliquam vehicula. In nunc tellus, posuere vitae imperdiet rhoncus, dictum vel elit. ', 'Dave Loper', 1, '2020-01-01 14:30:56'),
(6, 'Arrêter la télé', 'nterdum et malesuada fames ac ante ipsum primis in faucibus. Integer rutrum in lacus eget mattis. Nullam egestas lacus interdum, blandit dolor id, sollicitudin nunc. Curabitur sit amet commodo tortor, vitae porta leo. Curabitur faucibus tempus justo, vitae placerat mauris elementum sed. Nullam sagittis aliquet metus ut faucibus. Sed tellus arcu, finibus in ornare eget, faucibus at sapien. Sed id leo maximus, feugiat nunc quis, efficitur libero. Integer molestie sodales est eu porta. Phasellus tristique nibh ut efficitur egestas. Praesent semper, orci ut laoreet sodales, velit libero scelerisque augue, lobortis mollis dolor lacus at dui. ', 'Michel Drucker', 1, '2021-10-11 04:34:00'),
(7, 'Arrêter de boire', 'Gloops', 'Doc Gynéco', 1, '1999-05-27 00:00:01'),
(8, 'Voir les pyramides de Gizeh', 'Lorem ipsum...', 'Dave Loper', 0, '2021-01-10 15:33:38');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
