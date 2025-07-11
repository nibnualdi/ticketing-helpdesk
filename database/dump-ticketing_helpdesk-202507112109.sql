-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: ticketing_helpdesk
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('269185af-84e7-45cc-95d2-61e42abbebdd','eveniet','2025-07-11 07:07:49','2025-07-11 07:07:49'),('5c030a6d-af85-4d26-9c3f-770d2df9a546','nemo','2025-07-11 07:07:49','2025-07-11 07:07:49'),('c85cdf9a-7cf7-4b98-b01b-1b9f7c2cdc9f','magnam','2025-07-11 07:07:49','2025-07-11 07:07:49'),('ce5471e4-c4fa-4938-b7ae-475ee8813f0b','quam','2025-07-11 07:07:49','2025-07-11 07:07:49'),('de26718a-47c2-47b2-b7d6-0268f75a35c8','eos','2025-07-11 07:07:49','2025-07-11 07:07:49');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `histories`
--

DROP TABLE IF EXISTS `histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `histories` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `histories_user_id_foreign` (`user_id`),
  CONSTRAINT `histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `histories`
--

LOCK TABLES `histories` WRITE;
/*!40000 ALTER TABLE `histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_07_10_004028_create_categories_table',1),(5,'2025_07_10_074545_create_tickets_table',1),(6,'2025_07_11_010424_create_histories_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('open','on progress','resolved','closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_user_id_foreign` (`user_id`),
  KEY `tickets_category_id_foreign` (`category_id`),
  CONSTRAINT `tickets_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES ('029a6645-e8d5-42fa-9e83-1c5b99fab356','Et itaque.','on progress','Cum est a tenetur. In aspernatur quia eveniet impedit est repellat. Quod dolor eaque laborum fugit molestiae vel necessitatibus magni. Perspiciatis officia temporibus qui aut beatae.','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','5c030a6d-af85-4d26-9c3f-770d2df9a546','2025-07-11 07:07:49','2025-07-11 07:07:49'),('227907e4-fb37-4ee7-8c25-7690e4d527fd','Odio.','on progress','','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','269185af-84e7-45cc-95d2-61e42abbebdd','2025-07-11 07:07:49','2025-07-11 07:07:49'),('2b9fb793-c05c-4e36-8984-aba5ec09d650','Aut iusto.','open','','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','ce5471e4-c4fa-4938-b7ae-475ee8813f0b','2025-07-11 07:07:49','2025-07-11 07:07:49'),('42a4cf2d-4ece-4836-a83e-9892faa34ca5','Corrupti.','resolved','Quidem enim aliquam dolorum sunt cumque qui eligendi. Est enim repudiandae atque laboriosam voluptatem nihil pariatur. Illo explicabo perspiciatis voluptatem odit temporibus.','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','5c030a6d-af85-4d26-9c3f-770d2df9a546','2025-07-11 07:07:49','2025-07-11 07:07:49'),('47e02943-7671-47ba-83c6-1cff5152e477','Omnis.','resolved','Eos nam quod consequatur pariatur est earum. Totam quaerat autem consequatur ipsa consequatur tempore fugit amet. Voluptas totam possimus est est alias sit.','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','5c030a6d-af85-4d26-9c3f-770d2df9a546','2025-07-11 07:07:49','2025-07-11 07:07:49'),('577e4559-3ff6-4986-99a8-e289131014d3','Et.','open','Voluptas magni repudiandae voluptates molestiae quia ipsa. Quae illum asperiores est sed occaecati quia. Voluptas saepe dolorem quam est.','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','ce5471e4-c4fa-4938-b7ae-475ee8813f0b','2025-07-11 07:07:49','2025-07-11 07:07:49'),('5cb8162a-c355-46b0-a6c0-c4fbbcb7f6f3','Occaecati.','on progress','Facere iure accusantium soluta quia aut dolorem. Nemo est est doloremque fugit dolorem. Porro fuga dolores id qui.','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','269185af-84e7-45cc-95d2-61e42abbebdd','2025-07-11 07:07:49','2025-07-11 07:07:49'),('6323d26c-87bd-41de-9f44-b815cb28152e','Magni.','resolved','','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','269185af-84e7-45cc-95d2-61e42abbebdd','2025-07-11 07:07:49','2025-07-11 07:07:49'),('642d3b6e-a20e-4070-9f79-d67622937178','Occaecati.','open','','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','de26718a-47c2-47b2-b7d6-0268f75a35c8','2025-07-11 07:07:49','2025-07-11 07:07:49'),('6c26e111-81b4-40ec-a820-90c037b7ac78','Et ea.','open','Voluptas repudiandae cumque voluptas rem. Quaerat non autem quidem. Voluptatem sed quisquam et ut.','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','5c030a6d-af85-4d26-9c3f-770d2df9a546','2025-07-11 07:07:49','2025-07-11 07:07:49'),('7045653e-76f5-437d-988d-af6ca730327d','Unde.','resolved','','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','ce5471e4-c4fa-4938-b7ae-475ee8813f0b','2025-07-11 07:07:49','2025-07-11 07:07:49'),('7611bad4-be65-4484-89fb-bd010f757482','Non et.','resolved','','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','c85cdf9a-7cf7-4b98-b01b-1b9f7c2cdc9f','2025-07-11 07:07:49','2025-07-11 07:07:49'),('78e16bf3-2c16-443a-b6e6-9aa381842cad','Nihil.','on progress','','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','c85cdf9a-7cf7-4b98-b01b-1b9f7c2cdc9f','2025-07-11 07:07:49','2025-07-11 07:07:49'),('7942a913-b8e0-4722-a969-80853655c5a5','Et et.','closed','','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','5c030a6d-af85-4d26-9c3f-770d2df9a546','2025-07-11 07:07:49','2025-07-11 07:07:49'),('7957fe68-bfb9-41ea-b8fd-1683b75b0e70','Sed.','open','','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','269185af-84e7-45cc-95d2-61e42abbebdd','2025-07-11 07:07:49','2025-07-11 07:07:49'),('88e96388-69c4-4ee6-acae-e0505244448d','Et id.','on progress','Minus voluptate quia ut et maxime dolorem quos. Itaque ex sint at debitis dignissimos rerum veniam. Accusantium fuga magni libero similique eius totam odit ut.','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','ce5471e4-c4fa-4938-b7ae-475ee8813f0b','2025-07-11 07:07:49','2025-07-11 07:07:49'),('8a182541-880c-4b16-90ea-c2581f549530','Possimus.','on progress','','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','ce5471e4-c4fa-4938-b7ae-475ee8813f0b','2025-07-11 07:07:49','2025-07-11 07:07:49'),('8b95ffd6-d39d-4620-a49e-a75e704fa416','Nemo.','resolved','Qui quia excepturi blanditiis repudiandae autem. Est in ea itaque molestiae. Quis voluptas id possimus maiores ducimus in. Culpa alias nisi laudantium voluptas aut.','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','c85cdf9a-7cf7-4b98-b01b-1b9f7c2cdc9f','2025-07-11 07:07:49','2025-07-11 07:07:49'),('9038c301-77fb-43a2-a7ac-fa2870abea05','Saepe quo.','closed','','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','de26718a-47c2-47b2-b7d6-0268f75a35c8','2025-07-11 07:07:49','2025-07-11 07:07:49'),('94360c0e-ba07-4c68-80c0-4138aa667f3d','Ea totam.','on progress','Qui repellat nisi sapiente. Voluptatum voluptatum similique asperiores ipsum eligendi. Quas sint est id dicta. Excepturi harum fugiat corrupti omnis quam magni.','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','de26718a-47c2-47b2-b7d6-0268f75a35c8','2025-07-11 07:07:49','2025-07-11 07:07:49'),('9eedbed6-6fad-49cc-b246-015cfe0180ab','Nesciunt.','resolved','Natus vitae ea aut quis tempora quidem vero. Eum qui eos exercitationem dolor quis perferendis iure. Nobis quia necessitatibus ipsa provident et nostrum.','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','c85cdf9a-7cf7-4b98-b01b-1b9f7c2cdc9f','2025-07-11 07:07:49','2025-07-11 07:07:49'),('bd978f57-4ed8-4a32-9454-4d33a59ea879','Quo aut.','open','Aliquam et rerum id impedit sed. Consequatur minus laudantium cumque molestiae unde fuga distinctio excepturi. Tempora quis illum natus et ut. Autem dolorem voluptate facilis eum aut repudiandae.','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','c85cdf9a-7cf7-4b98-b01b-1b9f7c2cdc9f','2025-07-11 07:07:49','2025-07-11 07:07:49'),('e1e166fd-87f3-4b06-9d4e-668cb9f63aa6','Ut fugit.','open','Consectetur qui recusandae repellat dignissimos quas et recusandae culpa. Impedit numquam est quo sint labore iusto voluptas.','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','c85cdf9a-7cf7-4b98-b01b-1b9f7c2cdc9f','2025-07-11 07:07:49','2025-07-11 07:07:49'),('e2f05454-3710-4d8a-9dc5-00e87c66ac28','Explicabo.','open','','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','269185af-84e7-45cc-95d2-61e42abbebdd','2025-07-11 07:07:49','2025-07-11 07:07:49'),('e4265a8a-5bcb-4fc8-9100-bd9b388606be','Saepe eum.','closed','','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','269185af-84e7-45cc-95d2-61e42abbebdd','2025-07-11 07:07:49','2025-07-11 07:07:49'),('ef3cb4b7-5bc1-45a5-a47e-a0bead99f1cb','Dolores.','on progress','','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','ce5471e4-c4fa-4938-b7ae-475ee8813f0b','2025-07-11 07:07:49','2025-07-11 07:07:49'),('f2341186-4250-4b9f-920c-abfbff8dd36f','Iste.','open','','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','269185af-84e7-45cc-95d2-61e42abbebdd','2025-07-11 07:07:49','2025-07-11 07:07:49'),('f896ea2f-b2d2-4c6a-915f-94771a26a074','Quibusdam.','resolved','','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','c85cdf9a-7cf7-4b98-b01b-1b9f7c2cdc9f','2025-07-11 07:07:49','2025-07-11 07:07:49'),('f8d58d8b-f969-4055-a749-dc30b2eee89b','Ea odio.','on progress','Et molestias laborum beatae et. Ipsam quia incidunt et molestias dignissimos labore ut. Culpa dolores aut ut in. Magni natus dignissimos facilis.','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','5c030a6d-af85-4d26-9c3f-770d2df9a546','2025-07-11 07:07:49','2025-07-11 07:07:49'),('fb5125e1-3092-4e82-8ccd-9a86d240612e','Quis.','on progress','Eveniet magnam libero iure excepturi consectetur quia voluptatibus. Similique cum iste minima cum beatae. Debitis at facere ullam temporibus.','67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','5c030a6d-af85-4d26-9c3f-770d2df9a546','2025-07-11 07:07:49','2025-07-11 07:07:49');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` enum('user','it support') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('67bfd9ed-5c39-4c63-a9ac-fdb05908abb9','admin','admin@example.com','2025-07-11 07:07:48','$2y$12$Y..xw4RB.hjh3EmXRHuiEeJGsQv/BRryKYfFlDP9H.QZUPgA8eydK','it support','T1UVMDttSb','2025-07-11 07:07:49','2025-07-11 07:07:49');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ticketing_helpdesk'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-11 21:09:45
