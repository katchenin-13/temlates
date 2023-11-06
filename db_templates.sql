-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour db_template
CREATE DATABASE IF NOT EXISTS `db_template` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_template`;

-- Listage de la structure de table db_template. doctrine_migration_versions
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Listage des données de la table db_template.doctrine_migration_versions : ~0 rows (environ)

-- Listage de la structure de table db_template. messenger_messages
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table db_template.messenger_messages : ~0 rows (environ)

-- Listage de la structure de table db_template. reset_password_request
CREATE TABLE IF NOT EXISTS `reset_password_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_7CE748AA76ED395` (`user_id`),
  CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `_admin_user_utilisateur` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table db_template.reset_password_request : ~0 rows (environ)

-- Listage de la structure de table db_template. _admin_employe
CREATE TABLE IF NOT EXISTS `_admin_employe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fonction_id` int NOT NULL,
  `civilite_id` int NOT NULL,
  `entreprise_id` int DEFAULT NULL,
  `piece_id` int DEFAULT NULL,
  `nom` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse_mail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matricule` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_piece` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contacts` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `residence` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9368111E57889920` (`fonction_id`),
  KEY `IDX_9368111E39194ABF` (`civilite_id`),
  KEY `IDX_9368111EA4AEAFEA` (`entreprise_id`),
  KEY `IDX_9368111EC40FCFA8` (`piece_id`),
  CONSTRAINT `FK_9368111E39194ABF` FOREIGN KEY (`civilite_id`) REFERENCES `_admin_param_civilite` (`id`),
  CONSTRAINT `FK_9368111E57889920` FOREIGN KEY (`fonction_id`) REFERENCES `_admin_param_fonction` (`id`),
  CONSTRAINT `FK_9368111EA4AEAFEA` FOREIGN KEY (`entreprise_id`) REFERENCES `_admin_param_entreprise` (`id`),
  CONSTRAINT `FK_9368111EC40FCFA8` FOREIGN KEY (`piece_id`) REFERENCES `_admin_param_fichier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table db_template._admin_employe : ~1 rows (environ)
INSERT INTO `_admin_employe` (`id`, `fonction_id`, `civilite_id`, `entreprise_id`, `piece_id`, `nom`, `prenom`, `contact`, `adresse_mail`, `matricule`, `num_piece`, `contacts`, `residence`) VALUES
	(3, 6, 6, 4, NULL, 'Admin', 'Admin', '00000000', 'admin@knh.com', '00000000', '555', NULL, 'admin@knh.com');

-- Listage de la structure de table db_template. _admin_param_civilite
CREATE TABLE IF NOT EXISTS `_admin_param_civilite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table db_template._admin_param_civilite : ~1 rows (environ)
INSERT INTO `_admin_param_civilite` (`id`, `libelle`, `code`) VALUES
	(6, 'Monsieur', 'M.');

-- Listage de la structure de table db_template. _admin_param_config_app
CREATE TABLE IF NOT EXISTS `_admin_param_config_app` (
  `id` int NOT NULL AUTO_INCREMENT,
  `logo_id` int DEFAULT NULL,
  `favicon_id` int DEFAULT NULL,
  `image_login_id` int DEFAULT NULL,
  `logo_login_id` int DEFAULT NULL,
  `entreprise_id` int DEFAULT NULL,
  `main_color_admin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_color_admin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_color_login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_color_login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EE0159A1F98F144A` (`logo_id`),
  KEY `IDX_EE0159A1D78119FD` (`favicon_id`),
  KEY `IDX_EE0159A1D3426EF5` (`image_login_id`),
  KEY `IDX_EE0159A1C83BB8B` (`logo_login_id`),
  KEY `IDX_EE0159A1A4AEAFEA` (`entreprise_id`),
  CONSTRAINT `FK_EE0159A1A4AEAFEA` FOREIGN KEY (`entreprise_id`) REFERENCES `_admin_param_entreprise` (`id`),
  CONSTRAINT `FK_EE0159A1C83BB8B` FOREIGN KEY (`logo_login_id`) REFERENCES `_admin_param_fichier` (`id`),
  CONSTRAINT `FK_EE0159A1D3426EF5` FOREIGN KEY (`image_login_id`) REFERENCES `_admin_param_fichier` (`id`),
  CONSTRAINT `FK_EE0159A1D78119FD` FOREIGN KEY (`favicon_id`) REFERENCES `_admin_param_fichier` (`id`),
  CONSTRAINT `FK_EE0159A1F98F144A` FOREIGN KEY (`logo_id`) REFERENCES `_admin_param_fichier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table db_template._admin_param_config_app : ~1 rows (environ)
INSERT INTO `_admin_param_config_app` (`id`, `logo_id`, `favicon_id`, `image_login_id`, `logo_login_id`, `entreprise_id`, `main_color_admin`, `default_color_admin`, `main_color_login`, `default_color_login`) VALUES
	(1, 2, 3, 5, 3, 4, '#FF6600', '#32CD32', '#F60', '#32CD32');

-- Listage de la structure de table db_template. _admin_param_entreprise
CREATE TABLE IF NOT EXISTS `_admin_param_entreprise` (
  `id` int NOT NULL AUTO_INCREMENT,
  `logo_id` int DEFAULT NULL,
  `denomination` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sigle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agrements` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `situation_geo` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contacts` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_web` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `directeur` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3537B201F98F144A` (`logo_id`),
  CONSTRAINT `FK_3537B201F98F144A` FOREIGN KEY (`logo_id`) REFERENCES `_admin_param_fichier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table db_template._admin_param_entreprise : ~1 rows (environ)
INSERT INTO `_admin_param_entreprise` (`id`, `logo_id`, `denomination`, `code`, `sigle`, `agrements`, `situation_geo`, `contacts`, `adresse`, `mobile`, `fax`, `email`, `site_web`, `directeur`, `date_creation`) VALUES
	(4, 2, 'Default', 'ENT1', 'ENT1', 'ENT1', 'ENT1', 'ENT1', 'ENT1', 'ENT1', 'ENT1', 'ENT1', 'ENT1', NULL, NULL);

-- Listage de la structure de table db_template. _admin_param_fichier
CREATE TABLE IF NOT EXISTS `_admin_param_fichier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `size` int NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `url` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table db_template._admin_param_fichier : ~3 rows (environ)
INSERT INTO `_admin_param_fichier` (`id`, `size`, `path`, `alt`, `date`, `url`) VALUES
	(2, 8190, 'media_entreprise', 'logo_tt.png', '2023-07-03 12:22:56', 'png'),
	(3, 8190, 'media_entreprise', 'logo_tt.png', '2023-07-03 12:22:56', 'png'),
	(5, 8190, 'media_entreprise', 'logo_tt.png', '2023-07-03 12:22:56', 'png');

-- Listage de la structure de table db_template. _admin_param_fonction
CREATE TABLE IF NOT EXISTS `_admin_param_fonction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entreprise_id` int DEFAULT NULL,
  `libelle` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_3A832C6877153098` (`code`),
  KEY `IDX_3A832C68A4AEAFEA` (`entreprise_id`),
  CONSTRAINT `FK_3A832C68A4AEAFEA` FOREIGN KEY (`entreprise_id`) REFERENCES `_admin_param_entreprise` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table db_template._admin_param_fonction : ~1 rows (environ)
INSERT INTO `_admin_param_fonction` (`id`, `entreprise_id`, `libelle`, `code`) VALUES
	(6, NULL, 'Administrateur', 'ADM');

-- Listage de la structure de table db_template. _admin_param_groupe_module
CREATE TABLE IF NOT EXISTS `_admin_param_groupe_module` (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon_id` int DEFAULT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordre` int NOT NULL,
  `lien` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CA79B3FF54B9D732` (`icon_id`),
  CONSTRAINT `FK_CA79B3FF54B9D732` FOREIGN KEY (`icon_id`) REFERENCES `_admin_param_icon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table db_template._admin_param_groupe_module : ~1 rows (environ)
INSERT INTO `_admin_param_groupe_module` (`id`, `icon_id`, `titre`, `ordre`, `lien`) VALUES
	(3, 4, 'Groupe module', 2, 'app_utilisateur_groupe_index');

-- Listage de la structure de table db_template. _admin_param_icon
CREATE TABLE IF NOT EXISTS `_admin_param_icon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table db_template._admin_param_icon : ~1 rows (environ)
INSERT INTO `_admin_param_icon` (`id`, `code`, `image`, `libelle`) VALUES
	(4, 'bi bi-arrow-up-right-circle', NULL, 'Icon fleche croissante');

-- Listage de la structure de table db_template. _admin_param_module
CREATE TABLE IF NOT EXISTS `_admin_param_module` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordre` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table db_template._admin_param_module : ~7 rows (environ)
INSERT INTO `_admin_param_module` (`id`, `titre`, `ordre`) VALUES
	(4, 'Configuration', 1),
	(5, 'Gestion utilisateurs', 5),
	(6, 'Parametrage', 2),
	(7, 'Locations', 3),
	(8, 'Gestion terrains', 4),
	(9, 'Comptabilité', 6),
	(10, 'Utilisateurs', 7);

-- Listage de la structure de table db_template. _admin_param_module_groupe_permition
CREATE TABLE IF NOT EXISTS `_admin_param_module_groupe_permition` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permition_id` int DEFAULT NULL,
  `module_id` int DEFAULT NULL,
  `groupe_module_id` int DEFAULT NULL,
  `groupe_user_id` int DEFAULT NULL,
  `ordre` int NOT NULL,
  `ordre_groupe` int NOT NULL,
  `menu_principal` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_29EAEA2B806F2303` (`permition_id`),
  KEY `IDX_29EAEA2BAFC2B591` (`module_id`),
  KEY `IDX_29EAEA2BFF5666A6` (`groupe_module_id`),
  KEY `IDX_29EAEA2B610934DB` (`groupe_user_id`),
  CONSTRAINT `FK_29EAEA2B610934DB` FOREIGN KEY (`groupe_user_id`) REFERENCES `_admin_user_groupe` (`id`),
  CONSTRAINT `FK_29EAEA2B806F2303` FOREIGN KEY (`permition_id`) REFERENCES `_admin_param_permition` (`id`),
  CONSTRAINT `FK_29EAEA2BAFC2B591` FOREIGN KEY (`module_id`) REFERENCES `_admin_param_module` (`id`),
  CONSTRAINT `FK_29EAEA2BFF5666A6` FOREIGN KEY (`groupe_module_id`) REFERENCES `_admin_param_groupe_module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table db_template._admin_param_module_groupe_permition : ~1 rows (environ)
INSERT INTO `_admin_param_module_groupe_permition` (`id`, `permition_id`, `module_id`, `groupe_module_id`, `groupe_user_id`, `ordre`, `ordre_groupe`, `menu_principal`) VALUES
	(3, 4, 4, 3, 4, 1, 2, 1);

-- Listage de la structure de table db_template. _admin_param_permition
CREATE TABLE IF NOT EXISTS `_admin_param_permition` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table db_template._admin_param_permition : ~7 rows (environ)
INSERT INTO `_admin_param_permition` (`id`, `code`, `libelle`) VALUES
	(1, 'R', 'Lecture'),
	(2, 'CR', 'Lecture et création'),
	(3, 'RD', 'Lecture et suppression'),
	(4, 'CRUD', 'Tous les droits'),
	(5, 'RU', 'Lecture et Modification'),
	(6, 'RUD', 'Lecture et modification et suppression'),
	(7, 'CRU', 'Lecture et créatio  et suppression');

-- Listage de la structure de table db_template. _admin_param_service
CREATE TABLE IF NOT EXISTS `_admin_param_service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table db_template._admin_param_service : ~0 rows (environ)

-- Listage de la structure de table db_template. _admin_param_test
CREATE TABLE IF NOT EXISTS `_admin_param_test` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table db_template._admin_param_test : ~0 rows (environ)

-- Listage de la structure de table db_template. _admin_user_front_prestataire
CREATE TABLE IF NOT EXISTS `_admin_user_front_prestataire` (
  `id` int NOT NULL,
  `denomination_sociale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_principal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_60FED01CBF396750` FOREIGN KEY (`id`) REFERENCES `_admin_user_front_utilisateur` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table db_template._admin_user_front_prestataire : ~0 rows (environ)

-- Listage de la structure de table db_template. _admin_user_front_utilisateur
CREATE TABLE IF NOT EXISTS `_admin_user_front_utilisateur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discr` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1D40D72FF85E0677` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table db_template._admin_user_front_utilisateur : ~0 rows (environ)

-- Listage de la structure de table db_template. _admin_user_front_utilisateur_simple
CREATE TABLE IF NOT EXISTS `_admin_user_front_utilisateur_simple` (
  `id` int NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenoms` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_F4066868BF396750` FOREIGN KEY (`id`) REFERENCES `_admin_user_front_utilisateur` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table db_template._admin_user_front_utilisateur_simple : ~0 rows (environ)

-- Listage de la structure de table db_template. _admin_user_groupe
CREATE TABLE IF NOT EXISTS `_admin_user_groupe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table db_template._admin_user_groupe : ~5 rows (environ)
INSERT INTO `_admin_user_groupe` (`id`, `name`, `description`, `roles`, `code`) VALUES
	(4, 'Super Administrateur', '', '["ROLE_SUPER_ADMIN", "ROLE_ADMIN"]', 'uu'),
	(5, 'Administrateur', '', '["ROLE_ADMIN", "ROLE_ADMIN"]', 'Administrateur'),
	(6, 'Agents de recouvrement', '', '["ROLE_ADMIN", "ROLE_ADMIN"]', 'AGENT'),
	(7, 'Caisse', '', '["ROLE_ADMIN", "ROLE_ADMIN"]', 'CAISSE'),
	(8, 'Comptable', '', '["ROLE_ADMIN", "ROLE_ADMIN"]', 'COMPTABLE');

-- Listage de la structure de table db_template. _admin_user_utilisateur
CREATE TABLE IF NOT EXISTS `_admin_user_utilisateur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employe_id` int NOT NULL,
  `groupe_id` int DEFAULT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2264DC41F85E0677` (`username`),
  UNIQUE KEY `UNIQ_2264DC411B65292` (`employe_id`),
  KEY `IDX_2264DC417A45358C` (`groupe_id`),
  CONSTRAINT `FK_2264DC411B65292` FOREIGN KEY (`employe_id`) REFERENCES `_admin_employe` (`id`),
  CONSTRAINT `FK_2264DC417A45358C` FOREIGN KEY (`groupe_id`) REFERENCES `_admin_user_groupe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table db_template._admin_user_utilisateur : ~1 rows (environ)
INSERT INTO `_admin_user_utilisateur` (`id`, `employe_id`, `groupe_id`, `username`, `roles`, `password`) VALUES
	(3, 3, 4, 'admin', '[]', '$2y$13$6dnncNGcE/DuqWfnj6vU0OUkTkILUcO0fZNx0cIVECksQWadLj.N2');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
