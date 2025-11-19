-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: hotcrp
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `ActionLog`
--

DROP TABLE IF EXISTS `ActionLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ActionLog` (
  `logId` int NOT NULL AUTO_INCREMENT,
  `contactId` int NOT NULL,
  `destContactId` int DEFAULT NULL,
  `trueContactId` int DEFAULT NULL,
  `paperId` int DEFAULT NULL,
  `timestamp` bigint NOT NULL,
  `ipaddr` varbinary(39) DEFAULT NULL,
  `action` varbinary(4096) NOT NULL,
  `data` varbinary(8192) DEFAULT NULL,
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ActionLog`
--

LOCK TABLES `ActionLog` WRITE;
/*!40000 ALTER TABLE `ActionLog` DISABLE KEYS */;
INSERT INTO `ActionLog` VALUES (47,1,NULL,NULL,NULL,1763596399,_binary '172.18.0.1',_binary 'Settings edited: opt.contactEmail',NULL);
/*!40000 ALTER TABLE `ActionLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Capability`
--

DROP TABLE IF EXISTS `Capability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capability` (
  `capabilityType` int NOT NULL,
  `contactId` int NOT NULL,
  `paperId` int NOT NULL,
  `reviewId` int NOT NULL DEFAULT '0',
  `timeCreated` bigint NOT NULL,
  `timeUsed` bigint NOT NULL,
  `useCount` bigint NOT NULL DEFAULT '0',
  `timeInvalid` bigint NOT NULL,
  `timeExpires` bigint NOT NULL,
  `salt` varbinary(255) NOT NULL,
  `inputData` varbinary(16384) DEFAULT NULL,
  `inputDataOverflow` longblob,
  `data` varbinary(16384) DEFAULT NULL,
  `dataOverflow` longblob,
  `outputData` longblob,
  `lookupKey` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Capability`
--

LOCK TABLES `Capability` WRITE;
/*!40000 ALTER TABLE `Capability` DISABLE KEYS */;
INSERT INTO `Capability` VALUES (1,2,0,0,1763538571,0,0,0,1763797771,_binary 'hcpw0dPxgVrRpBbKTuYonYCqppmfHRmNpzA',NULL,NULL,NULL,NULL,NULL,NULL),(1,4,0,0,1763594269,0,0,0,1763853469,_binary 'hcpw0oAnFWDDKMcDeoWMBGprtKoQWwTyRcA',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Capability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContactCounter`
--

DROP TABLE IF EXISTS `ContactCounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ContactCounter` (
  `contactId` int NOT NULL,
  `apiCount` bigint NOT NULL DEFAULT '0',
  `apiLimit` bigint NOT NULL DEFAULT '0',
  `apiRefreshMtime` bigint NOT NULL DEFAULT '0',
  `apiRefreshWindow` int NOT NULL DEFAULT '0',
  `apiRefreshAmount` int NOT NULL DEFAULT '0',
  `apiLimit2` bigint NOT NULL DEFAULT '0',
  `apiRefreshMtime2` bigint NOT NULL DEFAULT '0',
  `apiRefreshWindow2` int NOT NULL DEFAULT '0',
  `apiRefreshAmount2` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`contactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContactCounter`
--

LOCK TABLES `ContactCounter` WRITE;
/*!40000 ALTER TABLE `ContactCounter` DISABLE KEYS */;
/*!40000 ALTER TABLE `ContactCounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContactInfo`
--

DROP TABLE IF EXISTS `ContactInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ContactInfo` (
  `contactId` int NOT NULL AUTO_INCREMENT,
  `email` varchar(120) NOT NULL,
  `firstName` varbinary(120) NOT NULL DEFAULT '',
  `lastName` varbinary(120) NOT NULL DEFAULT '',
  `unaccentedName` varbinary(2048) NOT NULL DEFAULT '',
  `affiliation` varbinary(2048) NOT NULL DEFAULT '',
  `roles` tinyint NOT NULL DEFAULT '0',
  `primaryContactId` int NOT NULL DEFAULT '0',
  `contactTags` varbinary(4096) DEFAULT NULL,
  `cflags` int NOT NULL DEFAULT '0',
  `orcid` varbinary(64) DEFAULT NULL,
  `phone` varbinary(64) DEFAULT NULL,
  `country` varbinary(256) DEFAULT NULL,
  `password` varbinary(2048) NOT NULL,
  `passwordTime` bigint NOT NULL DEFAULT '0',
  `passwordUseTime` bigint NOT NULL DEFAULT '0',
  `collaborators` varbinary(8192) DEFAULT NULL,
  `preferredEmail` varchar(120) DEFAULT NULL,
  `updateTime` bigint NOT NULL DEFAULT '0',
  `lastLogin` bigint NOT NULL DEFAULT '0',
  `defaultWatch` int NOT NULL DEFAULT '2',
  `cdbRoles` tinyint NOT NULL DEFAULT '0',
  `data` varbinary(32767) DEFAULT NULL,
  PRIMARY KEY (`contactId`),
  UNIQUE KEY `email` (`email`),
  KEY `roles` (`roles`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContactInfo`
--

LOCK TABLES `ContactInfo` WRITE;
/*!40000 ALTER TABLE `ContactInfo` DISABLE KEYS */;
INSERT INTO `ContactInfo` VALUES (1,'andrea@kaist.ac.kr',_binary 'Andrea',_binary 'Bianchi',_binary 'andrea bianchi (kaist)',_binary 'KAIST',7,0,NULL,0,NULL,NULL,_binary 'KR',_binary ' $$2y$10$yAziFPKZi71pOQObI3A/oeZLsMJ/BgK6DxlwXlUQAgrh7VhaT.wDa',1763538671,1763538671,_binary 'None',NULL,1763538657,1763596399,2,0,NULL),(2,'andrea@kaist.ac.k.r','','','','',0,0,NULL,32,NULL,NULL,NULL,_binary ' unset',1763538571,0,NULL,NULL,0,0,2,0,NULL),(3,'andrea@kaist.id',_binary 'Anonymous',_binary 'Author',_binary 'anonymous author (anonymous)',_binary 'Anonymous',0,0,NULL,8,NULL,NULL,_binary 'KR','',0,0,_binary 'None',NULL,1763594235,0,2,0,NULL),(4,'dummy.twiddle036@passinbox.com',_binary 'Anonymous',_binary 'PC',_binary 'anonymous pc (anonymous)',_binary 'Anonymous',0,0,NULL,40,NULL,NULL,_binary 'KR','',0,0,_binary 'None',NULL,1763594269,0,2,0,NULL);
/*!40000 ALTER TABLE `ContactInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContactPrimary`
--

DROP TABLE IF EXISTS `ContactPrimary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ContactPrimary` (
  `contactId` int NOT NULL,
  `primaryContactId` int NOT NULL,
  PRIMARY KEY (`contactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContactPrimary`
--

LOCK TABLES `ContactPrimary` WRITE;
/*!40000 ALTER TABLE `ContactPrimary` DISABLE KEYS */;
/*!40000 ALTER TABLE `ContactPrimary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeletedContactInfo`
--

DROP TABLE IF EXISTS `DeletedContactInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DeletedContactInfo` (
  `contactId` int NOT NULL,
  `firstName` varbinary(120) NOT NULL,
  `lastName` varbinary(120) NOT NULL,
  `unaccentedName` varbinary(2048) NOT NULL,
  `email` varchar(120) NOT NULL,
  `affiliation` varbinary(2048) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeletedContactInfo`
--

LOCK TABLES `DeletedContactInfo` WRITE;
/*!40000 ALTER TABLE `DeletedContactInfo` DISABLE KEYS */;
INSERT INTO `DeletedContactInfo` VALUES (3,_binary 'Anonymous',_binary 'Author',_binary 'anonymous author (anonymous)','andrea@kaist.id',_binary 'Anonymous'),(4,_binary 'Anonymous',_binary 'PC',_binary 'anonymous pc (anonymous)','dummy.twiddle036@passinbox.com',_binary 'Anonymous');
/*!40000 ALTER TABLE `DeletedContactInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DocumentLink`
--

DROP TABLE IF EXISTS `DocumentLink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DocumentLink` (
  `paperId` int NOT NULL,
  `linkId` int NOT NULL,
  `linkType` int NOT NULL,
  `linkIndex` int NOT NULL DEFAULT '0',
  `documentId` int NOT NULL,
  PRIMARY KEY (`paperId`,`linkId`,`linkType`,`linkIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DocumentLink`
--

LOCK TABLES `DocumentLink` WRITE;
/*!40000 ALTER TABLE `DocumentLink` DISABLE KEYS */;
/*!40000 ALTER TABLE `DocumentLink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FilteredDocument`
--

DROP TABLE IF EXISTS `FilteredDocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FilteredDocument` (
  `inDocId` int NOT NULL,
  `filterType` int NOT NULL,
  `outDocId` int NOT NULL,
  `createdAt` bigint NOT NULL,
  PRIMARY KEY (`inDocId`,`filterType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FilteredDocument`
--

LOCK TABLES `FilteredDocument` WRITE;
/*!40000 ALTER TABLE `FilteredDocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `FilteredDocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Formula`
--

DROP TABLE IF EXISTS `Formula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Formula` (
  `formulaId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `expression` varbinary(4096) NOT NULL,
  `createdBy` int NOT NULL DEFAULT '0',
  `timeModified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`formulaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Formula`
--

LOCK TABLES `Formula` WRITE;
/*!40000 ALTER TABLE `Formula` DISABLE KEYS */;
/*!40000 ALTER TABLE `Formula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDReservation`
--

DROP TABLE IF EXISTS `IDReservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDReservation` (
  `type` int NOT NULL,
  `id` int NOT NULL,
  `timestamp` bigint NOT NULL,
  `uid` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`type`,`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDReservation`
--

LOCK TABLES `IDReservation` WRITE;
/*!40000 ALTER TABLE `IDReservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDReservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invitation`
--

DROP TABLE IF EXISTS `Invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Invitation` (
  `invitationId` int NOT NULL AUTO_INCREMENT,
  `invitationType` int NOT NULL,
  `email` varchar(120) NOT NULL,
  `firstName` varbinary(120) DEFAULT NULL,
  `lastName` varbinary(120) DEFAULT NULL,
  `affiliation` varbinary(2048) DEFAULT NULL,
  `requestedBy` int NOT NULL,
  `timeRequested` bigint NOT NULL DEFAULT '0',
  `timeRequestNotified` bigint NOT NULL DEFAULT '0',
  `salt` varbinary(255) NOT NULL,
  `data` varbinary(4096) DEFAULT NULL,
  PRIMARY KEY (`invitationId`),
  UNIQUE KEY `salt` (`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invitation`
--

LOCK TABLES `Invitation` WRITE;
/*!40000 ALTER TABLE `Invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InvitationLog`
--

DROP TABLE IF EXISTS `InvitationLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InvitationLog` (
  `logId` int NOT NULL AUTO_INCREMENT,
  `invitationId` int NOT NULL,
  `mailId` int DEFAULT NULL,
  `contactId` int NOT NULL,
  `action` int NOT NULL,
  `timestamp` bigint NOT NULL,
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InvitationLog`
--

LOCK TABLES `InvitationLog` WRITE;
/*!40000 ALTER TABLE `InvitationLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `InvitationLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MailLog`
--

DROP TABLE IF EXISTS `MailLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MailLog` (
  `mailId` int NOT NULL AUTO_INCREMENT,
  `contactId` int NOT NULL DEFAULT '0',
  `recipients` varbinary(200) NOT NULL,
  `q` varbinary(16384) DEFAULT NULL,
  `t` varbinary(200) DEFAULT NULL,
  `paperIds` blob,
  `cc` blob,
  `replyto` blob,
  `subject` blob,
  `emailBody` blob,
  `fromNonChair` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`mailId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MailLog`
--

LOCK TABLES `MailLog` WRITE;
/*!40000 ALTER TABLE `MailLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `MailLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paper`
--

DROP TABLE IF EXISTS `Paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Paper` (
  `paperId` int NOT NULL AUTO_INCREMENT,
  `title` varbinary(512) DEFAULT NULL,
  `authorInformation` varbinary(8192) DEFAULT NULL,
  `abstract` varbinary(16384) DEFAULT NULL,
  `collaborators` varbinary(8192) DEFAULT NULL,
  `timeSubmitted` bigint NOT NULL DEFAULT '0',
  `timeWithdrawn` bigint NOT NULL DEFAULT '0',
  `timeModified` bigint NOT NULL DEFAULT '0',
  `timeFinalSubmitted` bigint NOT NULL DEFAULT '0',
  `paperStorageId` int NOT NULL DEFAULT '0',
  `sha1` varbinary(64) NOT NULL DEFAULT '',
  `finalPaperStorageId` int NOT NULL DEFAULT '0',
  `blind` tinyint NOT NULL DEFAULT '1',
  `outcome` tinyint NOT NULL DEFAULT '0',
  `leadContactId` int NOT NULL DEFAULT '0',
  `shepherdContactId` int NOT NULL DEFAULT '0',
  `managerContactId` int NOT NULL DEFAULT '0',
  `capVersion` int NOT NULL DEFAULT '0',
  `size` bigint NOT NULL DEFAULT '-1',
  `mimetype` varbinary(80) NOT NULL DEFAULT '',
  `timestamp` bigint NOT NULL DEFAULT '0',
  `pdfFormatStatus` bigint NOT NULL DEFAULT '0',
  `withdrawReason` blob,
  `paperFormat` tinyint DEFAULT NULL,
  `dataOverflow` longblob,
  PRIMARY KEY (`paperId`),
  KEY `timeSubmitted` (`timeSubmitted`),
  KEY `leadContactId` (`leadContactId`),
  KEY `shepherdContactId` (`shepherdContactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paper`
--

LOCK TABLES `Paper` WRITE;
/*!40000 ALTER TABLE `Paper` DISABLE KEYS */;
/*!40000 ALTER TABLE `Paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaperComment`
--

DROP TABLE IF EXISTS `PaperComment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaperComment` (
  `paperId` int NOT NULL,
  `commentId` int NOT NULL AUTO_INCREMENT,
  `contactId` int NOT NULL,
  `timeModified` bigint NOT NULL,
  `timeNotified` bigint NOT NULL DEFAULT '0',
  `timeDisplayed` bigint NOT NULL DEFAULT '0',
  `comment` varbinary(32767) DEFAULT NULL,
  `commentType` int NOT NULL DEFAULT '0',
  `replyTo` int NOT NULL,
  `ordinal` int NOT NULL DEFAULT '0',
  `authorOrdinal` int NOT NULL DEFAULT '0',
  `commentTags` varbinary(1024) DEFAULT NULL,
  `commentRound` int NOT NULL DEFAULT '0',
  `commentFormat` tinyint DEFAULT NULL,
  `commentOverflow` longblob,
  `commentData` varbinary(4096) DEFAULT NULL,
  PRIMARY KEY (`paperId`,`commentId`),
  UNIQUE KEY `commentId` (`commentId`),
  KEY `contactId` (`contactId`),
  KEY `timeModifiedContact` (`timeModified`,`contactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperComment`
--

LOCK TABLES `PaperComment` WRITE;
/*!40000 ALTER TABLE `PaperComment` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperComment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaperConflict`
--

DROP TABLE IF EXISTS `PaperConflict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaperConflict` (
  `paperId` int NOT NULL,
  `contactId` int NOT NULL,
  `conflictType` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`contactId`,`paperId`),
  KEY `paperId` (`paperId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperConflict`
--

LOCK TABLES `PaperConflict` WRITE;
/*!40000 ALTER TABLE `PaperConflict` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperConflict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaperOption`
--

DROP TABLE IF EXISTS `PaperOption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaperOption` (
  `paperId` int NOT NULL,
  `optionId` int NOT NULL,
  `value` bigint NOT NULL DEFAULT '0',
  `data` varbinary(32767) DEFAULT NULL,
  `dataOverflow` longblob,
  PRIMARY KEY (`paperId`,`optionId`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperOption`
--

LOCK TABLES `PaperOption` WRITE;
/*!40000 ALTER TABLE `PaperOption` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperOption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaperReview`
--

DROP TABLE IF EXISTS `PaperReview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaperReview` (
  `paperId` int NOT NULL,
  `reviewId` int NOT NULL AUTO_INCREMENT,
  `contactId` int NOT NULL,
  `reviewType` tinyint NOT NULL,
  `requestedBy` int NOT NULL DEFAULT '0',
  `reviewToken` int NOT NULL DEFAULT '0',
  `reviewRound` int NOT NULL DEFAULT '0',
  `reviewOrdinal` int NOT NULL DEFAULT '0',
  `reviewBlind` tinyint NOT NULL,
  `reviewTime` bigint NOT NULL DEFAULT '0',
  `reviewModified` bigint NOT NULL DEFAULT '0',
  `reviewSubmitted` bigint DEFAULT NULL,
  `reviewAuthorSeen` bigint NOT NULL DEFAULT '0',
  `timeDisplayed` bigint NOT NULL DEFAULT '0',
  `timeApprovalRequested` bigint NOT NULL DEFAULT '0',
  `reviewNeedsSubmit` tinyint NOT NULL DEFAULT '1',
  `reviewViewScore` tinyint NOT NULL DEFAULT '-3',
  `rflags` int NOT NULL,
  `timeRequested` bigint NOT NULL DEFAULT '0',
  `timeRequestNotified` bigint NOT NULL DEFAULT '0',
  `reviewAuthorModified` bigint DEFAULT NULL,
  `reviewNotified` bigint DEFAULT NULL,
  `reviewAuthorNotified` bigint NOT NULL DEFAULT '0',
  `reviewEditVersion` int NOT NULL DEFAULT '0',
  `reviewWordCount` int DEFAULT NULL,
  `s01` smallint NOT NULL DEFAULT '0',
  `s02` smallint NOT NULL DEFAULT '0',
  `s03` smallint NOT NULL DEFAULT '0',
  `s04` smallint NOT NULL DEFAULT '0',
  `s05` smallint NOT NULL DEFAULT '0',
  `s06` smallint NOT NULL DEFAULT '0',
  `s07` smallint NOT NULL DEFAULT '0',
  `s08` smallint NOT NULL DEFAULT '0',
  `s09` smallint NOT NULL DEFAULT '0',
  `s10` smallint NOT NULL DEFAULT '0',
  `s11` smallint NOT NULL DEFAULT '0',
  `tfields` longblob,
  `sfields` varbinary(2048) DEFAULT NULL,
  PRIMARY KEY (`paperId`,`reviewId`),
  UNIQUE KEY `reviewId` (`reviewId`),
  KEY `contactIdReviewType` (`contactId`,`reviewType`),
  KEY `reviewType` (`reviewType`),
  KEY `reviewRound` (`reviewRound`),
  KEY `requestedBy` (`requestedBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperReview`
--

LOCK TABLES `PaperReview` WRITE;
/*!40000 ALTER TABLE `PaperReview` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperReview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaperReviewHistory`
--

DROP TABLE IF EXISTS `PaperReviewHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaperReviewHistory` (
  `paperId` int NOT NULL,
  `reviewId` int NOT NULL,
  `reviewTime` bigint NOT NULL,
  `reviewNextTime` bigint NOT NULL,
  `contactId` int NOT NULL,
  `reviewRound` int NOT NULL,
  `reviewOrdinal` int NOT NULL,
  `reviewType` tinyint NOT NULL,
  `reviewBlind` tinyint NOT NULL,
  `reviewModified` bigint NOT NULL,
  `reviewSubmitted` bigint NOT NULL,
  `timeDisplayed` bigint NOT NULL,
  `timeApprovalRequested` bigint NOT NULL,
  `reviewAuthorSeen` bigint NOT NULL,
  `reviewAuthorModified` bigint DEFAULT NULL,
  `reviewNotified` bigint DEFAULT NULL,
  `reviewAuthorNotified` bigint NOT NULL,
  `reviewEditVersion` int NOT NULL,
  `rflags` int NOT NULL,
  `revdelta` longblob,
  PRIMARY KEY (`paperId`,`reviewId`,`reviewTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperReviewHistory`
--

LOCK TABLES `PaperReviewHistory` WRITE;
/*!40000 ALTER TABLE `PaperReviewHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperReviewHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaperReviewPreference`
--

DROP TABLE IF EXISTS `PaperReviewPreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaperReviewPreference` (
  `paperId` int NOT NULL,
  `contactId` int NOT NULL,
  `preference` int NOT NULL DEFAULT '0',
  `expertise` int DEFAULT NULL,
  PRIMARY KEY (`paperId`,`contactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperReviewPreference`
--

LOCK TABLES `PaperReviewPreference` WRITE;
/*!40000 ALTER TABLE `PaperReviewPreference` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperReviewPreference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaperReviewRefused`
--

DROP TABLE IF EXISTS `PaperReviewRefused`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaperReviewRefused` (
  `paperId` int NOT NULL,
  `email` varchar(120) NOT NULL,
  `firstName` varbinary(120) DEFAULT NULL,
  `lastName` varbinary(120) DEFAULT NULL,
  `affiliation` varbinary(2048) DEFAULT NULL,
  `contactId` int NOT NULL,
  `refusedReviewId` int DEFAULT NULL,
  `refusedReviewType` tinyint NOT NULL DEFAULT '0',
  `reviewRound` int DEFAULT NULL,
  `requestedBy` int NOT NULL,
  `timeRequested` bigint DEFAULT NULL,
  `refusedBy` int DEFAULT NULL,
  `timeRefused` bigint DEFAULT NULL,
  `reason` varbinary(32767) DEFAULT NULL,
  PRIMARY KEY (`paperId`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperReviewRefused`
--

LOCK TABLES `PaperReviewRefused` WRITE;
/*!40000 ALTER TABLE `PaperReviewRefused` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperReviewRefused` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaperStorage`
--

DROP TABLE IF EXISTS `PaperStorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaperStorage` (
  `paperId` int NOT NULL,
  `paperStorageId` int NOT NULL AUTO_INCREMENT,
  `timestamp` bigint NOT NULL,
  `timeReferenced` bigint DEFAULT NULL,
  `mimetype` varbinary(80) NOT NULL DEFAULT '',
  `paper` longblob,
  `compression` tinyint NOT NULL DEFAULT '0',
  `sha1` varbinary(64) NOT NULL DEFAULT '',
  `crc32` binary(4) DEFAULT NULL,
  `documentType` int NOT NULL DEFAULT '0',
  `filename` varbinary(255) DEFAULT NULL,
  `infoJson` varbinary(32768) DEFAULT NULL,
  `size` bigint NOT NULL DEFAULT '-1',
  `filterType` int DEFAULT NULL,
  `originalStorageId` int DEFAULT NULL,
  `inactive` tinyint NOT NULL DEFAULT '0',
  `npages` int NOT NULL DEFAULT '-1',
  `width` int NOT NULL DEFAULT '-1',
  `height` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`paperId`,`paperStorageId`),
  UNIQUE KEY `paperStorageId` (`paperStorageId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperStorage`
--

LOCK TABLES `PaperStorage` WRITE;
/*!40000 ALTER TABLE `PaperStorage` DISABLE KEYS */;
INSERT INTO `PaperStorage` VALUES (0,1,0,NULL,_binary 'text/plain','',0,_binary '�9��^kK\r2U��`���	',NULL,0,NULL,NULL,0,NULL,NULL,1,-1,-1,-1);
/*!40000 ALTER TABLE `PaperStorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaperTag`
--

DROP TABLE IF EXISTS `PaperTag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaperTag` (
  `paperId` int NOT NULL,
  `tag` varchar(80) NOT NULL,
  `tagIndex` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`paperId`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperTag`
--

LOCK TABLES `PaperTag` WRITE;
/*!40000 ALTER TABLE `PaperTag` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperTag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaperTagAnno`
--

DROP TABLE IF EXISTS `PaperTagAnno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaperTagAnno` (
  `tag` varchar(80) NOT NULL,
  `annoId` int NOT NULL,
  `tagIndex` float NOT NULL DEFAULT '0',
  `heading` varbinary(8192) DEFAULT NULL,
  `annoFormat` tinyint DEFAULT NULL,
  `infoJson` varbinary(32768) DEFAULT NULL,
  PRIMARY KEY (`tag`,`annoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperTagAnno`
--

LOCK TABLES `PaperTagAnno` WRITE;
/*!40000 ALTER TABLE `PaperTagAnno` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperTagAnno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaperTopic`
--

DROP TABLE IF EXISTS `PaperTopic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaperTopic` (
  `paperId` int NOT NULL,
  `topicId` int NOT NULL,
  PRIMARY KEY (`paperId`,`topicId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperTopic`
--

LOCK TABLES `PaperTopic` WRITE;
/*!40000 ALTER TABLE `PaperTopic` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperTopic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaperWatch`
--

DROP TABLE IF EXISTS `PaperWatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaperWatch` (
  `paperId` int NOT NULL,
  `contactId` int NOT NULL,
  `watch` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`paperId`,`contactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaperWatch`
--

LOCK TABLES `PaperWatch` WRITE;
/*!40000 ALTER TABLE `PaperWatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaperWatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReviewRating`
--

DROP TABLE IF EXISTS `ReviewRating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ReviewRating` (
  `paperId` int NOT NULL,
  `reviewId` int NOT NULL,
  `contactId` int NOT NULL,
  `rating` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`paperId`,`reviewId`,`contactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReviewRating`
--

LOCK TABLES `ReviewRating` WRITE;
/*!40000 ALTER TABLE `ReviewRating` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReviewRating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReviewRequest`
--

DROP TABLE IF EXISTS `ReviewRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ReviewRequest` (
  `paperId` int NOT NULL,
  `email` varchar(120) NOT NULL,
  `firstName` varbinary(120) DEFAULT NULL,
  `lastName` varbinary(120) DEFAULT NULL,
  `affiliation` varbinary(2048) DEFAULT NULL,
  `reason` varbinary(32767) DEFAULT NULL,
  `requestedBy` int NOT NULL,
  `timeRequested` bigint NOT NULL,
  `reviewRound` int DEFAULT NULL,
  PRIMARY KEY (`paperId`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReviewRequest`
--

LOCK TABLES `ReviewRequest` WRITE;
/*!40000 ALTER TABLE `ReviewRequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReviewRequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Settings`
--

DROP TABLE IF EXISTS `Settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Settings` (
  `name` varbinary(256) NOT NULL,
  `value` bigint NOT NULL,
  `data` varbinary(32767) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Settings`
--

LOCK TABLES `Settings` WRITE;
/*!40000 ALTER TABLE `Settings` DISABLE KEYS */;
INSERT INTO `Settings` VALUES (_binary '__capability_gc',1763562455,NULL),(_binary 'allowPaperOption',318,NULL),(_binary 'extrev_chairreq',1,NULL),(_binary 'ioptions',1,_binary '[{\"id\":-1000,\"merge\":true,\"name\":\"Thesis Title\",\"title\":\"Thesis Title\"},{\"id\":-1001,\"merge\":true,\"description\":\"Put only the name of the student author.\"}]'),(_binary 'msg.home',1,_binary '<img src=\"https://seoulillustrationfair.co.kr/wp-content/uploads/2023/05/kaist55.jpg\" alt=\"KAIST illustration\" loading=\"lazy\" width=\"300\">'),(_binary 'no_papersub',1,NULL),(_binary 'opt.contactEmail',0,''),(_binary 'opt.longName',1,_binary 'ID KAIST GreenLight 2026'),(_binary 'opt.shortName',1,_binary 'GreenLight 2026'),(_binary 'outcome_map',1,_binary '{\"2\":\"Accepted (major revision)\",\"1\":\"Accepted (minor revision)\",\"-1\":\"Rejected\"}'),(_binary 'pcrev_any',1,NULL),(_binary 'pcrev_soft',0,NULL),(_binary 'rev_ratings',-1,NULL),(_binary 'review_form',1,_binary '[{\"id\":\"s04\",\"name\":\"Overall merit\",\"type\":\"radio\",\"order\":1,\"visibility\":\"au\",\"required\":true,\"values\":[\"Bottom 50% of submitted papers\",\"Top 50% but not top 25% of submitted papers\",\"Top 25% but not top 10% of submitted papers\",\"Top 10% but not top 5% of submitted papers\",\"Top 5% of submitted papers!\"]},{\"id\":\"s02\",\"name\":\"Reviewer expertise\",\"type\":\"radio\",\"order\":2,\"visibility\":\"au\",\"required\":true,\"values\":[\"No familiarity\",\"Some familiarity\",\"Knowledgeable\",\"Expert\"]},{\"id\":\"t01\",\"name\":\"Paper summary\",\"type\":\"text\",\"order\":3,\"visibility\":\"au\",\"required\":true},{\"id\":\"t04\",\"name\":\"Strengths and Weaknesses\",\"type\":\"text\",\"description\":\"What are the paper’s important strengths or weaknesses? Just a couple sentences, please.\",\"order\":4,\"visibility\":\"au\",\"required\":true},{\"id\":\"t02\",\"name\":\"Other comments for authors\",\"type\":\"text\",\"order\":5,\"visibility\":\"au\"},{\"id\":\"s03\",\"name\":\"Final defense schedule\",\"type\":\"dropdown\",\"description\":\"There are two options for the final defense. It can be on the announced date (D-Day) or self-scheduled. Choose your availability.\",\"order\":6,\"visibility\":\"re\",\"required\":true,\"scheme\":\"none\",\"values\":[\"Defense of D-Day\",\"Self-scheduled\"]},{\"id\":\"s01\",\"name\":\"Best thesis award nomination\",\"type\":\"checkbox\",\"description\":\"I nominate this paper for Best thesis award\",\"order\":7,\"visibility\":\"re\",\"scheme\":\"none\"},{\"id\":\"t05\",\"name\":\"Best thesis award explanation\",\"type\":\"text\",\"description\":\"Explain why you recommended this paper for Best Thesis. How strongly you recommend it?\",\"order\":8,\"visibility\":\"re\"},{\"id\":\"t03\",\"name\":\"Confidential comments for PC\",\"type\":\"text\",\"order\":9,\"visibility\":\"re\"}]'),(_binary 'sub_blind',0,NULL),(_binary 'sub_grace',3600,NULL),(_binary 'sub_reg',1743508799,NULL),(_binary 'sub_sub',1743508799,NULL),(_binary 'sub_update',1743508799,NULL),(_binary 'tag_chair',1,_binary 'accept pcpaper reject'),(_binary 'viewrevid',1,NULL);
/*!40000 ALTER TABLE `Settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TopicArea`
--

DROP TABLE IF EXISTS `TopicArea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TopicArea` (
  `topicId` int NOT NULL AUTO_INCREMENT,
  `topicName` varbinary(1024) DEFAULT NULL,
  PRIMARY KEY (`topicId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TopicArea`
--

LOCK TABLES `TopicArea` WRITE;
/*!40000 ALTER TABLE `TopicArea` DISABLE KEYS */;
/*!40000 ALTER TABLE `TopicArea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TopicInterest`
--

DROP TABLE IF EXISTS `TopicInterest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TopicInterest` (
  `contactId` int NOT NULL,
  `topicId` int NOT NULL,
  `interest` int NOT NULL,
  PRIMARY KEY (`contactId`,`topicId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TopicInterest`
--

LOCK TABLES `TopicInterest` WRITE;
/*!40000 ALTER TABLE `TopicInterest` DISABLE KEYS */;
/*!40000 ALTER TABLE `TopicInterest` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-19 23:56:41
