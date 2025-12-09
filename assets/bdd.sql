-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 09 déc. 2025 à 05:16
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `omeka_s`
--

-- --------------------------------------------------------

--
-- Structure de la table `api_key`
--

CREATE TABLE `api_key` (
  `id` varchar(32) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `credential_hash` varchar(60) NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `api_key`
--

INSERT INTO `api_key` (`id`, `owner_id`, `label`, `credential_hash`, `last_ip`, `last_accessed`, `created`) VALUES
('BwGgF5D4RQL36jy0u8H37i1vmcopffaa', 2, 'key1', '$2y$10$CrxZ9vmvSYoD.xy/BAEOHuYXlDBf/8o4OT2jTe4PzEec//7YFCfOG', 0x00000000000000000000000000000001, '2025-12-09 04:11:27', '2025-12-09 03:48:49'),
('EyvoWlsoMUHl2PAjyY3JYOp39okCsv9a', 1, 'cle-salma', '$2y$10$b/b2HtVUBag1O7SM2tw5JeDIzwTcYRZ7Nu3NV0yrSVBpbePHo/si.', 0x00000000000000000000000000000001, '2025-12-09 03:47:22', '2025-12-02 14:59:24');

-- --------------------------------------------------------

--
-- Structure de la table `asset`
--

CREATE TABLE `asset` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `media_type` varchar(255) NOT NULL,
  `storage_id` varchar(190) NOT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `csvimport_entity`
--

CREATE TABLE `csvimport_entity` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `resource_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `csvimport_import`
--

CREATE TABLE `csvimport_import` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `undo_job_id` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `resource_type` varchar(255) NOT NULL,
  `has_err` tinyint(1) NOT NULL,
  `stats` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fulltext_search`
--

CREATE TABLE `fulltext_search` (
  `id` int(11) NOT NULL,
  `resource` varchar(190) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext DEFAULT NULL,
  `text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(1, 'items', 1, 1, 'Cours IA – Séance 1', 'Cours IA – Séance 1\ncours_ia_seance1.mp3\nSalma Mamouni Alaoui\n00:42:18\n2025-10-12\nCours IA – Séance 1'),
(2, 'items', 1, 1, NULL, 'Bonjour à tous, aujourd’hui on va parler de l’apprentissage supervisé et des différents types de modèles utilisés en intelligence artificielle.\nCours IA – Séance 1'),
(3, 'items', 1, 1, NULL, 'MAMOUNI-ALAOUI SALMA\nsalma@gmail.com'),
(4, 'items', 1, 1, NULL, 'Cette analyse met en évidence les thèmes principaux abordés dans le cours : apprentissage supervisé, qualité des données et performance des modèles d’IA.\n\n- Quels sont les critères de performance d’un modèle d’IA ?\n- Comment améliorer la précision de la transcription audio ?\n- Quelle est la limite de l’apprentissage supervisé ?\n\nCours IA – Séance 1'),
(5, 'items', 1, 1, 'cours test', 'cours test\ntest\n2025-12-09\ncours test\naudio.mp3\n2025-12-09\n0\nStudy-Whis API'),
(6, 'items', 1, 1, 'Transcription - cours test', 'Transcription - cours test\n[En cours...]\ncours test'),
(7, 'items', 1, 1, 'Analyse - cours test', 'Analyse - cours test\n[En cours...]\n[En cours...]\ncours test'),
(8, 'items', 1, 1, 'cours test2', 'cours test2\ntest2\n2025-12-09\ncours test2\naudio.mp3\n2025-12-09\n0\nStudy-Whis API'),
(9, 'items', 1, 1, 'Transcription - cours test2', 'Transcription - cours test2\n[En cours...]\ncours test2'),
(10, 'items', 1, 1, 'Analyse - cours test2', 'Analyse - cours test2\n[En cours...]\n[En cours...]\ncours test2'),
(11, 'items', 1, 1, 'IA', 'IA\nia\n2025-12-09\nIA\ntest.m4a.m4a\n2025-12-09\n0\nStudy-Whis API'),
(12, 'items', 1, 1, 'Transcription - IA', 'Transcription - IA\n[Traitement...]\nIA'),
(13, 'items', 1, 1, 'Analyse - IA', 'Analyse - IA\n[En cours...]\n[En cours...]\nIA'),
(14, 'items', 1, 1, 'IA', 'IA\nIA\n2025-12-09\nIA\ntest.m4a.m4a\n2025-12-09\n0\nStudy-Whis API'),
(15, 'items', 1, 1, 'Transcription - IA', 'Transcription - IA\n[Traitement...]\nIA'),
(16, 'items', 1, 1, 'Analyse - IA', 'Analyse - IA\n[En cours...]\n[En cours...]\nIA'),
(17, 'items', 1, 1, 'test3', 'test3\ntest3\n2025-12-09\ntest3\ntest.m4a.m4a\n2025-12-09\n0\nStudy-Whis API'),
(18, 'items', 1, 1, 'Transcription - test3', 'Transcription - test3\n[Traitement...]\ntest3'),
(19, 'items', 1, 1, 'Analyse - test3', 'Analyse - test3\nRésultat généré par llama3 (timeout)\nRésultat généré par llama3 (timeout)\ntest3'),
(20, 'items', 1, 1, 'Analyse - test3', 'Analyse - test3\nJe suis ravi de vous aider ! Cependant, il me faut d\'abord avoir accès au cours que vous souhaitez que je résume. Pouvez-vous me fournir le texte du cours ou les éléments clés qu\'il contient ? J\'enverrai ensuite un résumé structuré et clair en français.\n\nSi vous avez déjà une copie de ce cours, veuillez la partager avec moi. Sinon, si vous pouvez me donner des informations sur le sujet et les principaux points abordés dans le cours, je peux essayer de créer un résumé basé sur vos indications.\nRésultat généré par llama3 (timeout)\ntest3'),
(21, 'items', 1, 1, 'Analyse - test3', 'Analyse - test3\nRésultat généré par llama3 (timeout)\nVoici 5 questions pédagogiques pertinentes basées sur le sujet du traitement :\n\n1. Quels sont les différents types de traitements qui existent et comment s\'articulent-ils entre eux ? (Exemple : traitement par filtration, traitement chimique, etc.)\n2. Comment peut-on mesurer l\'efficacité d\'un traitement ? Quels sont les critères à prendre en compte pour évaluer son efficacité ?\n3. Les traitements ont-ils des impacts environnementaux ? Si oui, quels sont ces impacts et comment peuvent-ils être réduits ?\n4. Comment le traitement peut-il influencer la composition chimique d\'un fluide ou d\'une substance ? Quels sont les processus physiques qui interviennent dans ce cas ?\n5. Dans le contexte de l\'environnement, quels sont les traitements qui peuvent aider à réduire les pollutions et comment fonctionnent-ils ?\n\nCes questions sont conçues pour encourager la pensée critique et stimuler l\'apprentissage en encourageant les étudiants à explorer les concepts de base du traitement et à réfléchir à leur application dans différents contextes.\ntest3'),
(22, 'items', 1, 1, 'Analyse - test3', 'Analyse - test3\nJe suis ravi de vous aider ! Cependant, il me faut d\'abord avoir accès au cours que vous souhaitez que je résume. Pouvez-vous me fournir le texte du cours ou les éléments clés qu\'il contient ? J\'enverrai ensuite un résumé structuré et clair en français.\n\nSi vous avez déjà une copie de ce cours, veuillez la partager avec moi. Sinon, si vous pouvez me donner des informations sur le sujet et les principaux points abordés dans le cours, je peux essayer de créer un résumé basé sur vos indications.\nHere are 5 pedagogical questions based on the course \"Traitement\" (Treatment) in French:\n\n1. Quels sont les différents types de traitement en informatique et comment ils fonctionnent-ils pour résoudre des problèmes spécifiques?\n\n(This question assesses students\' understanding of various treatment types, such as data processing, encryption, compression, etc.)\n\n2. Comment le traitement d\'un signal numérique peut-il améliorer la qualité de l\'image ou du son dans une application audiovisuelle?\n\n(This question evaluates students\' ability to apply treatment concepts to real-world scenarios, such as image or sound processing.)\n\n3. Quels sont les avantages et les inconvénients du traitement en ligne (cloud computing) par rapport à un traitement local sur un ordinateur personnel?\n\n(This question tests students\' understanding of cloud computing and its implications for data processing.)\n\n4. Comment le traitement de données peut-il être utilisé pour détecter des tendances ou des patterns dans les grandes quantités de données ?\n\n(This question assesses students\' ability to apply treatment concepts to data analysis, such as machine learning or data mining.)\n\n5. Quels sont les principaux risques liés au traitement de données sensibles (par exemple, des informations personnelles) et comment peuvent-ils être évités ou réduits?\n\n(This question evaluates students\' understanding of the importance of data protection and privacy in treatment processes.)\ntest3'),
(23, 'items', 1, 1, 'ia', 'ia\nia\n2025-12-09\nia\ntest.m4a.m4a\n2025-12-09\n0\nStudy-Whis API'),
(24, 'items', 1, 1, 'Transcription - ia', 'Transcription - ia\n[Traitement...]\nia'),
(25, 'items', 1, 1, 'Analyse - ia', 'Analyse - ia\nRésultat généré par gpt-oss:120b-cloud. Contenu: Résume ce cours de manière claire et structurée (en français):\n\n[Traitement...]\n\nRésumé:...\nRésultat généré par gpt-oss:120b-cloud. Contenu: À partir de ce cours, génère 5 questions pédagogiques pertinentes (en français):\n\n[Traitement...]\n\nQ...\nia'),
(26, 'items', 1, 1, 'test3', 'test3\ntest\n2025-12-09\ntest3\ntest.m4a.m4a\n2025-12-09\n0\nStudy-Whis API'),
(27, 'items', 1, 1, 'Transcription - test3', 'Transcription - test3\n[Traitement...]\ntest3'),
(28, 'items', 1, 1, 'Analyse - test3', 'Analyse - test3\nRésultat généré par gpt-oss:120b-cloud. Contenu: Résume ce cours de manière claire et structurée (en français):\n\n[Traitement...]\n\nRésumé:...\nRésultat généré par gpt-oss:120b-cloud. Contenu: À partir de ce cours, génère 5 questions pédagogiques pertinentes (en français):\n\n[Traitement...]\n\nQ...\ntest3');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `primary_media_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id`, `primary_media_id`) VALUES
(1, NULL),
(2, NULL),
(3, NULL),
(4, NULL),
(5, NULL),
(6, NULL),
(7, NULL),
(8, NULL),
(9, NULL),
(10, NULL),
(11, NULL),
(12, NULL),
(13, NULL),
(14, NULL),
(15, NULL),
(16, NULL),
(17, NULL),
(18, NULL),
(19, NULL),
(20, NULL),
(21, NULL),
(22, NULL),
(23, NULL),
(24, NULL),
(25, NULL),
(26, NULL),
(27, NULL),
(28, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `item_item_set`
--

CREATE TABLE `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_set`
--

CREATE TABLE `item_set` (
  `id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_site`
--

CREATE TABLE `item_site` (
  `item_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `class` varchar(255) NOT NULL,
  `args` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `log` longtext DEFAULT NULL,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `ingester` varchar(255) NOT NULL,
  `renderer` varchar(255) NOT NULL,
  `data` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `source` longtext DEFAULT NULL,
  `media_type` varchar(255) DEFAULT NULL,
  `storage_id` varchar(190) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `sha256` char(64) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `lang` varchar(190) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000'),
('20210205101827'),
('20210225095734'),
('20210810083804'),
('20220718090449'),
('20220824103916'),
('20230124033031'),
('20230410074846'),
('20230523085358'),
('20230601060113'),
('20230713101012'),
('20231016000000'),
('20240103030617');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `id` varchar(190) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`id`, `is_active`, `version`) VALUES
('CSVImport', 1, '2.6.2'),
('ResumeCours', 1, '1.0.0');

-- --------------------------------------------------------

--
-- Structure de la table `password_creation`
--

CREATE TABLE `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_creation`
--

INSERT INTO `password_creation` (`id`, `user_id`, `created`, `activate`) VALUES
('23Rb7MNKcyGFJvQ56OcbOwxVrhEBvAKl', 2, '2025-10-21 09:22:30', 1);

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(56, NULL, 3, 'affirmedBy', 'affirmedBy', 'A legal decision that affirms a ruling.'),
(57, NULL, 3, 'annotates', 'annotates', 'Critical or explanatory note for a Document.'),
(58, NULL, 3, 'authorList', 'list of authors', 'An ordered list of authors. Normally, this list is seen as a priority list that order authors by importance.'),
(59, NULL, 3, 'citedBy', 'cited by', 'Relates a document to another document that cites the\nfirst document.'),
(60, NULL, 3, 'cites', 'cites', 'Relates a document to another document that is cited\nby the first document as reference, comment, review, quotation or for\nanother purpose.'),
(61, NULL, 3, 'contributorList', 'list of contributors', 'An ordered list of contributors. Normally, this list is seen as a priority list that order contributors by importance.'),
(62, NULL, 3, 'court', 'court', 'A court associated with a legal document; for example, that which issues a decision.'),
(63, NULL, 3, 'degree', 'degree', 'The thesis degree.'),
(64, NULL, 3, 'director', 'director', 'A Film director.'),
(65, NULL, 3, 'distributor', 'distributor', 'Distributor of a document or a collection of documents.'),
(66, NULL, 3, 'editor', 'editor', 'A person having managerial and sometimes policy-making responsibility for the editorial part of a publishing firm or of a newspaper, magazine, or other publication.'),
(67, NULL, 3, 'editorList', 'list of editors', 'An ordered list of editors. Normally, this list is seen as a priority list that order editors by importance.'),
(68, NULL, 3, 'interviewee', 'interviewee', 'An agent that is interviewed by another agent.'),
(69, NULL, 3, 'interviewer', 'interviewer', 'An agent that interview another agent.'),
(70, NULL, 3, 'issuer', 'issuer', 'An entity responsible for issuing often informally published documents such as press releases, reports, etc.'),
(71, NULL, 3, 'organizer', 'organizer', 'The organizer of an event; includes conference organizers, but also government agencies or other bodies that are responsible for conducting hearings.'),
(72, NULL, 3, 'owner', 'owner', 'Owner of a document or a collection of documents.'),
(73, NULL, 3, 'performer', 'performer', NULL),
(74, NULL, 3, 'presentedAt', 'presented at', 'Relates a document to an event; for example, a paper to a conference.'),
(75, NULL, 3, 'presents', 'presents', 'Relates an event to associated documents; for example, conference to a paper.'),
(76, NULL, 3, 'producer', 'producer', 'Producer of a document or a collection of documents.'),
(77, NULL, 3, 'recipient', 'recipient', 'An agent that receives a communication document.'),
(78, NULL, 3, 'reproducedIn', 'reproducedIn', 'The resource in which another resource is reproduced.'),
(79, NULL, 3, 'reversedBy', 'reversedBy', 'A legal decision that reverses a ruling.'),
(80, NULL, 3, 'reviewOf', 'review of', 'Relates a review document to a reviewed thing (resource, item, etc.).'),
(81, NULL, 3, 'status', 'status', 'The publication status of (typically academic) content.'),
(82, NULL, 3, 'subsequentLegalDecision', 'subsequentLegalDecision', 'A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),
(83, NULL, 3, 'transcriptOf', 'transcript of', 'Relates a document to some transcribed original.'),
(84, NULL, 3, 'translationOf', 'translation of', 'Relates a translated document to the original document.'),
(85, NULL, 3, 'translator', 'translator', 'A person who translates written document from one language to another.'),
(86, NULL, 3, 'abstract', 'abstract', 'A summary of the resource.'),
(87, NULL, 3, 'argued', 'date argued', 'The date on which a legal case is argued before a court. Date is of format xsd:date'),
(88, NULL, 3, 'asin', 'asin', NULL),
(89, NULL, 3, 'chapter', 'chapter', 'An chapter number'),
(90, NULL, 3, 'coden', 'coden', NULL),
(91, NULL, 3, 'content', 'content', 'This property is for a plain-text rendering of the content of a Document. While the plain-text content of an entire document could be described by this property.'),
(92, NULL, 3, 'doi', 'doi', NULL),
(93, NULL, 3, 'eanucc13', 'eanucc13', NULL),
(94, NULL, 3, 'edition', 'edition', 'The name defining a special edition of a document. Normally its a literal value composed of a version number and words.'),
(95, NULL, 3, 'eissn', 'eissn', NULL),
(96, NULL, 3, 'gtin14', 'gtin14', NULL),
(97, NULL, 3, 'handle', 'handle', NULL),
(98, NULL, 3, 'identifier', 'identifier', NULL),
(99, NULL, 3, 'isbn', 'isbn', NULL),
(100, NULL, 3, 'isbn10', 'isbn10', NULL),
(101, NULL, 3, 'isbn13', 'isbn13', NULL),
(102, NULL, 3, 'issn', 'issn', NULL),
(103, NULL, 3, 'issue', 'issue', 'An issue number'),
(104, NULL, 3, 'lccn', 'lccn', NULL),
(105, NULL, 3, 'locator', 'locator', 'A description (often numeric) that locates an item within a containing document or collection.'),
(106, NULL, 3, 'numPages', 'number of pages', 'The number of pages contained in a document'),
(107, NULL, 3, 'numVolumes', 'number of volumes', 'The number of volumes contained in a collection of documents (usually a series, periodical, etc.).'),
(108, NULL, 3, 'number', 'number', 'A generic item or document number. Not to be confused with issue number.'),
(109, NULL, 3, 'oclcnum', 'oclcnum', NULL),
(110, NULL, 3, 'pageEnd', 'page end', 'Ending page number within a continuous page range.'),
(111, NULL, 3, 'pageStart', 'page start', 'Starting page number within a continuous page range.'),
(112, NULL, 3, 'pages', 'pages', 'A string of non-contiguous page spans that locate a Document within a Collection. Example: 23-25, 34, 54-56. For continuous page ranges, use the pageStart and pageEnd properties.'),
(113, NULL, 3, 'pmid', 'pmid', NULL),
(114, NULL, 3, 'prefixName', 'prefix name', 'The prefix of a name'),
(115, NULL, 3, 'section', 'section', 'A section number'),
(116, NULL, 3, 'shortDescription', 'shortDescription', NULL),
(117, NULL, 3, 'shortTitle', 'short title', 'The abbreviation of a title.'),
(118, NULL, 3, 'sici', 'sici', NULL),
(119, NULL, 3, 'suffixName', 'suffix name', 'The suffix of a name'),
(120, NULL, 3, 'upc', 'upc', NULL),
(121, NULL, 3, 'uri', 'uri', 'Universal Resource Identifier of a document'),
(122, NULL, 3, 'volume', 'volume', 'A volume number'),
(123, NULL, 4, 'mbox', 'personal mailbox', 'A  personal mailbox, ie. an Internet mailbox associated with exactly one owner, the first owner of this mailbox. This is a \'static inverse functional property\', in that  there is (across time and change) at most one individual that ever has any particular value for foaf:mbox.'),
(124, NULL, 4, 'mbox_sha1sum', 'sha1sum of a personal mailbox URI name', 'The sha1sum of the URI of an Internet mailbox associated with exactly one owner, the  first owner of the mailbox.'),
(125, NULL, 4, 'gender', 'gender', 'The gender of this Agent (typically but not necessarily \'male\' or \'female\').'),
(126, NULL, 4, 'geekcode', 'geekcode', 'A textual geekcode for this person, see http://www.geekcode.com/geek.html'),
(127, NULL, 4, 'dnaChecksum', 'DNA checksum', 'A checksum for the DNA of some thing. Joke.'),
(128, NULL, 4, 'sha1', 'sha1sum (hex)', 'A sha1sum hash, in hex.'),
(129, NULL, 4, 'based_near', 'based near', 'A location that something is based near, for some broadly human notion of near.'),
(130, NULL, 4, 'title', 'title', 'Title (Mr, Mrs, Ms, Dr. etc)'),
(131, NULL, 4, 'nick', 'nickname', 'A short informal nickname characterising an agent (includes login identifiers, IRC and other chat nicknames).'),
(132, NULL, 4, 'jabberID', 'jabber ID', 'A jabber ID for something.'),
(133, NULL, 4, 'aimChatID', 'AIM chat ID', 'An AIM chat ID'),
(134, NULL, 4, 'skypeID', 'Skype ID', 'A Skype ID'),
(135, NULL, 4, 'icqChatID', 'ICQ chat ID', 'An ICQ chat ID'),
(136, NULL, 4, 'yahooChatID', 'Yahoo chat ID', 'A Yahoo chat ID'),
(137, NULL, 4, 'msnChatID', 'MSN chat ID', 'An MSN chat ID'),
(138, NULL, 4, 'name', 'name', 'A name for some thing.'),
(139, NULL, 4, 'firstName', 'firstName', 'The first name of a person.'),
(140, NULL, 4, 'lastName', 'lastName', 'The last name of a person.'),
(141, NULL, 4, 'givenName', 'Given name', 'The given name of some person.'),
(142, NULL, 4, 'givenname', 'Given name', 'The given name of some person.'),
(143, NULL, 4, 'surname', 'Surname', 'The surname of some person.'),
(144, NULL, 4, 'family_name', 'family_name', 'The family name of some person.'),
(145, NULL, 4, 'familyName', 'familyName', 'The family name of some person.'),
(146, NULL, 4, 'phone', 'phone', 'A phone,  specified using fully qualified tel: URI scheme (refs: http://www.w3.org/Addressing/schemes.html#tel).'),
(147, NULL, 4, 'homepage', 'homepage', 'A homepage for some thing.'),
(148, NULL, 4, 'weblog', 'weblog', 'A weblog of some thing (whether person, group, company etc.).'),
(149, NULL, 4, 'openid', 'openid', 'An OpenID for an Agent.'),
(150, NULL, 4, 'tipjar', 'tipjar', 'A tipjar document for this agent, describing means for payment and reward.'),
(151, NULL, 4, 'plan', 'plan', 'A .plan comment, in the tradition of finger and \'.plan\' files.'),
(152, NULL, 4, 'made', 'made', 'Something that was made by this agent.'),
(153, NULL, 4, 'maker', 'maker', 'An agent that  made this thing.'),
(154, NULL, 4, 'img', 'image', 'An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one\'s photo on a homepage).'),
(155, NULL, 4, 'depiction', 'depiction', 'A depiction of some thing.'),
(156, NULL, 4, 'depicts', 'depicts', 'A thing depicted in this representation.'),
(157, NULL, 4, 'thumbnail', 'thumbnail', 'A derived thumbnail image.'),
(158, NULL, 4, 'myersBriggs', 'myersBriggs', 'A Myers Briggs (MBTI) personality classification.'),
(159, NULL, 4, 'workplaceHomepage', 'workplace homepage', 'A workplace homepage of some person; the homepage of an organization they work for.'),
(160, NULL, 4, 'workInfoHomepage', 'work info homepage', 'A work info homepage of some person; a page about their work for some organization.'),
(161, NULL, 4, 'schoolHomepage', 'schoolHomepage', 'A homepage of a school attended by the person.'),
(162, NULL, 4, 'knows', 'knows', 'A person known by this person (indicating some level of reciprocated interaction between the parties).'),
(163, NULL, 4, 'interest', 'interest', 'A page about a topic of interest to this person.'),
(164, NULL, 4, 'topic_interest', 'topic_interest', 'A thing of interest to this person.'),
(165, NULL, 4, 'publications', 'publications', 'A link to the publications of this person.'),
(166, NULL, 4, 'currentProject', 'current project', 'A current project this person works on.'),
(167, NULL, 4, 'pastProject', 'past project', 'A project this person has previously worked on.'),
(168, NULL, 4, 'fundedBy', 'funded by', 'An organization funding a project or person.'),
(169, NULL, 4, 'logo', 'logo', 'A logo representing some thing.'),
(170, NULL, 4, 'topic', 'topic', 'A topic of some page or document.'),
(171, NULL, 4, 'primaryTopic', 'primary topic', 'The primary topic of some page or document.'),
(172, NULL, 4, 'focus', 'focus', 'The underlying or \'focal\' entity associated with some SKOS-described concept.'),
(173, NULL, 4, 'isPrimaryTopicOf', 'is primary topic of', 'A document that this thing is the primary topic of.'),
(174, NULL, 4, 'page', 'page', 'A page or document about this thing.'),
(175, NULL, 4, 'theme', 'theme', 'A theme.'),
(176, NULL, 4, 'account', 'account', 'Indicates an account held by this agent.'),
(177, NULL, 4, 'holdsAccount', 'account', 'Indicates an account held by this agent.'),
(178, NULL, 4, 'accountServiceHomepage', 'account service homepage', 'Indicates a homepage of the service provide for this online account.'),
(179, NULL, 4, 'accountName', 'account name', 'Indicates the name (identifier) associated with this online account.'),
(180, NULL, 4, 'member', 'member', 'Indicates a member of a Group'),
(181, NULL, 4, 'membershipClass', 'membershipClass', 'Indicates the class of individuals that are a member of a Group'),
(182, NULL, 4, 'birthday', 'birthday', 'The birthday of this Agent, represented in mm-dd string form, eg. \'12-31\'.'),
(183, NULL, 4, 'age', 'age', 'The age in years of some agent.'),
(184, NULL, 4, 'status', 'status', 'A string expressing what the user is happy for the general public (normally) to know about their current activity.'),
(197, 1, 6, 'nom', 'Nom de l’étudiant', NULL),
(198, 1, 6, 'email', 'Email de l’étudiant', NULL),
(199, 1, 6, 'titre', 'Titre du cours', NULL),
(200, 1, 6, 'fichier', 'Nom du fichier audio', NULL),
(201, 1, 6, 'dateUpload', 'Date d’ajout', NULL),
(202, 1, 6, 'duree', 'Durée de l’audio', NULL),
(203, 1, 6, 'importePar', 'Importé par', NULL),
(204, 1, 6, 'contenu', 'Texte transcrit', NULL),
(205, 1, 6, 'transcritDe', 'Transcrit depuis', NULL),
(206, 1, 6, 'resume', 'Résumé automatique', NULL),
(207, 1, 6, 'questions', 'Questions clés', NULL),
(208, 1, 6, 'analyseDe', 'Analyse de', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `resource`
--

CREATE TABLE `resource` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `resource_template_id` int(11) DEFAULT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(1, 1, 111, 5, NULL, 'Cours IA – Séance 1', 1, '2025-11-03 20:54:17', '2025-11-03 21:29:43', 'Omeka\\Entity\\Item'),
(2, 1, 112, 6, NULL, NULL, 1, '2025-11-03 20:59:43', '2025-11-03 20:59:43', 'Omeka\\Entity\\Item'),
(3, 1, 110, 4, NULL, NULL, 1, '2025-11-03 21:03:11', '2025-11-03 21:03:11', 'Omeka\\Entity\\Item'),
(4, 1, 113, 7, NULL, NULL, 1, '2025-11-03 21:31:31', '2025-11-03 21:31:31', 'Omeka\\Entity\\Item'),
(5, 1, 111, 5, NULL, 'cours test', 1, '2025-12-09 03:04:52', '2025-12-09 03:04:52', 'Omeka\\Entity\\Item'),
(6, 1, 112, 6, NULL, 'Transcription - cours test', 1, '2025-12-09 03:04:53', '2025-12-09 03:04:53', 'Omeka\\Entity\\Item'),
(7, 1, 113, 7, NULL, 'Analyse - cours test', 1, '2025-12-09 03:04:54', '2025-12-09 03:04:54', 'Omeka\\Entity\\Item'),
(8, 1, 111, 5, NULL, 'cours test2', 1, '2025-12-09 03:06:46', '2025-12-09 03:06:46', 'Omeka\\Entity\\Item'),
(9, 1, 112, 6, NULL, 'Transcription - cours test2', 1, '2025-12-09 03:06:47', '2025-12-09 03:06:47', 'Omeka\\Entity\\Item'),
(10, 1, 113, 7, NULL, 'Analyse - cours test2', 1, '2025-12-09 03:06:47', '2025-12-09 03:06:47', 'Omeka\\Entity\\Item'),
(11, 1, 111, 5, NULL, 'IA', 1, '2025-12-09 03:10:03', '2025-12-09 03:10:03', 'Omeka\\Entity\\Item'),
(12, 1, 112, 6, NULL, 'Transcription - IA', 1, '2025-12-09 03:10:03', '2025-12-09 03:10:03', 'Omeka\\Entity\\Item'),
(13, 1, 113, 7, NULL, 'Analyse - IA', 1, '2025-12-09 03:10:04', '2025-12-09 03:10:04', 'Omeka\\Entity\\Item'),
(14, 1, 111, 5, NULL, 'IA', 1, '2025-12-09 03:11:43', '2025-12-09 03:11:43', 'Omeka\\Entity\\Item'),
(15, 1, 112, 6, NULL, 'Transcription - IA', 1, '2025-12-09 03:11:43', '2025-12-09 03:11:43', 'Omeka\\Entity\\Item'),
(16, 1, 113, 7, NULL, 'Analyse - IA', 1, '2025-12-09 03:11:44', '2025-12-09 03:11:44', 'Omeka\\Entity\\Item'),
(17, 1, 111, 5, NULL, 'test3', 1, '2025-12-09 03:24:56', '2025-12-09 03:24:56', 'Omeka\\Entity\\Item'),
(18, 1, 112, 6, NULL, 'Transcription - test3', 1, '2025-12-09 03:24:57', '2025-12-09 03:24:57', 'Omeka\\Entity\\Item'),
(19, 1, 113, 7, NULL, 'Analyse - test3', 1, '2025-12-09 03:25:58', '2025-12-09 03:25:58', 'Omeka\\Entity\\Item'),
(20, 1, 113, 7, NULL, 'Analyse - test3', 1, '2025-12-09 03:26:17', '2025-12-09 03:26:17', 'Omeka\\Entity\\Item'),
(21, 1, 113, 7, NULL, 'Analyse - test3', 1, '2025-12-09 03:26:57', '2025-12-09 03:26:57', 'Omeka\\Entity\\Item'),
(22, 1, 113, 7, NULL, 'Analyse - test3', 1, '2025-12-09 03:28:13', '2025-12-09 03:28:13', 'Omeka\\Entity\\Item'),
(23, 1, 111, 5, NULL, 'ia', 1, '2025-12-09 03:34:15', '2025-12-09 03:34:15', 'Omeka\\Entity\\Item'),
(24, 1, 112, 6, NULL, 'Transcription - ia', 1, '2025-12-09 03:34:15', '2025-12-09 03:34:15', 'Omeka\\Entity\\Item'),
(25, 1, 113, 7, NULL, 'Analyse - ia', 1, '2025-12-09 03:34:16', '2025-12-09 03:34:16', 'Omeka\\Entity\\Item'),
(26, 1, 111, 5, NULL, 'test3', 1, '2025-12-09 03:42:35', '2025-12-09 03:42:35', 'Omeka\\Entity\\Item'),
(27, 1, 112, 6, NULL, 'Transcription - test3', 1, '2025-12-09 03:42:36', '2025-12-09 03:42:36', 'Omeka\\Entity\\Item'),
(28, 1, 113, 7, NULL, 'Analyse - test3', 1, '2025-12-09 03:42:36', '2025-12-09 03:42:36', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Structure de la table `resource_class`
--

CREATE TABLE `resource_class` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(35, NULL, 3, 'AcademicArticle', 'Academic Article', 'A scholarly academic article, typically published in a journal.'),
(36, NULL, 3, 'Article', 'Article', 'A written composition in prose, usually nonfiction, on a specific topic, forming an independent part of a book or other publication, as a newspaper or magazine.'),
(37, NULL, 3, 'AudioDocument', 'audio document', 'An audio document; aka record.'),
(38, NULL, 3, 'AudioVisualDocument', 'audio-visual document', 'An audio-visual document; film, video, and so forth.'),
(39, NULL, 3, 'Bill', 'Bill', 'Draft legislation presented for discussion to a legal body.'),
(40, NULL, 3, 'Book', 'Book', 'A written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'),
(41, NULL, 3, 'BookSection', 'Book Section', 'A section of a book.'),
(42, NULL, 3, 'Brief', 'Brief', 'A written argument submitted to a court.'),
(43, NULL, 3, 'Chapter', 'Chapter', 'A chapter of a book.'),
(44, NULL, 3, 'Code', 'Code', 'A collection of statutes.'),
(45, NULL, 3, 'CollectedDocument', 'Collected Document', 'A document that simultaneously contains other documents.'),
(46, NULL, 3, 'Collection', 'Collection', 'A collection of Documents or Collections'),
(47, NULL, 3, 'Conference', 'Conference', 'A meeting for consultation or discussion.'),
(48, NULL, 3, 'CourtReporter', 'Court Reporter', 'A collection of legal cases.'),
(49, NULL, 3, 'Document', 'Document', 'A document (noun) is a bounded physical representation of body of information designed with the capacity (and usually intent) to communicate. A document may manifest symbolic, diagrammatic or sensory-representational information.'),
(50, NULL, 3, 'DocumentPart', 'document part', 'a distinct part of a larger document or collected document.'),
(51, NULL, 3, 'DocumentStatus', 'Document Status', 'The status of the publication of a document.'),
(52, NULL, 3, 'EditedBook', 'Edited Book', 'An edited book.'),
(53, NULL, 3, 'Email', 'EMail', 'A written communication addressed to a person or organization and transmitted electronically.'),
(54, NULL, 3, 'Event', 'Event', NULL),
(55, NULL, 3, 'Excerpt', 'Excerpt', 'A passage selected from a larger work.'),
(56, NULL, 3, 'Film', 'Film', 'aka movie.'),
(57, NULL, 3, 'Hearing', 'Hearing', 'An instance or a session in which testimony and arguments are presented, esp. before an official, as a judge in a lawsuit.'),
(58, NULL, 3, 'Image', 'Image', 'A document that presents visual or diagrammatic information.'),
(59, NULL, 3, 'Interview', 'Interview', 'A formalized discussion between two or more people.'),
(60, NULL, 3, 'Issue', 'Issue', 'something that is printed or published and distributed, esp. a given number of a periodical'),
(61, NULL, 3, 'Journal', 'Journal', 'A periodical of scholarly journal Articles.'),
(62, NULL, 3, 'LegalCaseDocument', 'Legal Case Document', 'A document accompanying a legal case.'),
(63, NULL, 3, 'LegalDecision', 'Decision', 'A document containing an authoritative determination (as a decree or judgment) made after consideration of facts or law.'),
(64, NULL, 3, 'LegalDocument', 'Legal Document', 'A legal document; for example, a court decision, a brief, and so forth.'),
(65, NULL, 3, 'Legislation', 'Legislation', 'A legal document proposing or enacting a law or a group of laws.'),
(66, NULL, 3, 'Letter', 'Letter', 'A written or printed communication addressed to a person or organization and usually transmitted by mail.'),
(67, NULL, 3, 'Magazine', 'Magazine', 'A periodical of magazine Articles. A magazine is a publication that is issued periodically, usually bound in a paper cover, and typically contains essays, stories, poems, etc., by many writers, and often photographs and drawings, frequently specializing in a particular subject or area, as hobbies, news, or sports.'),
(68, NULL, 3, 'Manual', 'Manual', 'A small reference book, especially one giving instructions.'),
(69, NULL, 3, 'Manuscript', 'Manuscript', 'An unpublished Document, which may also be submitted to a publisher for publication.'),
(70, NULL, 3, 'Map', 'Map', 'A graphical depiction of geographic features.'),
(71, NULL, 3, 'MultiVolumeBook', 'Multivolume Book', 'A loose, thematic, collection of Documents, often Books.'),
(72, NULL, 3, 'Newspaper', 'Newspaper', 'A periodical of documents, usually issued daily or weekly, containing current news, editorials, feature articles, and usually advertising.'),
(73, NULL, 3, 'Note', 'Note', 'Notes or annotations about a resource.'),
(74, NULL, 3, 'Patent', 'Patent', 'A document describing the exclusive right granted by a government to an inventor to manufacture, use, or sell an invention for a certain number of years.'),
(75, NULL, 3, 'Performance', 'Performance', 'A public performance.'),
(76, NULL, 3, 'Periodical', 'Periodical', 'A group of related documents issued at regular intervals.'),
(77, NULL, 3, 'PersonalCommunication', 'Personal Communication', 'A communication between an agent and one or more specific recipients.'),
(78, NULL, 3, 'PersonalCommunicationDocument', 'Personal Communication Document', 'A personal communication manifested in some document.'),
(79, NULL, 3, 'Proceedings', 'Proceedings', 'A compilation of documents published from an event, such as a conference.'),
(80, NULL, 3, 'Quote', 'Quote', 'An excerpted collection of words.'),
(81, NULL, 3, 'ReferenceSource', 'Reference Source', 'A document that presents authoritative reference information, such as a dictionary or encylopedia .'),
(82, NULL, 3, 'Report', 'Report', 'A document describing an account or statement describing in detail an event, situation, or the like, usually as the result of observation, inquiry, etc..'),
(83, NULL, 3, 'Series', 'Series', 'A loose, thematic, collection of Documents, often Books.'),
(84, NULL, 3, 'Slide', 'Slide', 'A slide in a slideshow'),
(85, NULL, 3, 'Slideshow', 'Slideshow', 'A presentation of a series of slides, usually presented in front of an audience with written text and images.'),
(86, NULL, 3, 'Standard', 'Standard', 'A document describing a standard'),
(87, NULL, 3, 'Statute', 'Statute', 'A bill enacted into law.'),
(88, NULL, 3, 'Thesis', 'Thesis', 'A document created to summarize research findings associated with the completion of an academic degree.'),
(89, NULL, 3, 'ThesisDegree', 'Thesis degree', 'The academic degree of a Thesis'),
(90, NULL, 3, 'Webpage', 'Webpage', 'A web page is an online document available (at least initially) on the world wide web. A web page is written first and foremost to appear on the web, as distinct from other online resources such as books, manuscripts or audio documents which use the web primarily as a distribution mechanism alongside other more traditional methods such as print.'),
(91, NULL, 3, 'Website', 'Website', 'A group of Webpages accessible on the Web.'),
(92, NULL, 3, 'Workshop', 'Workshop', 'A seminar, discussion group, or the like, that emphasizes zxchange of ideas and the demonstration and application of techniques, skills, etc.'),
(93, NULL, 4, 'LabelProperty', 'Label Property', 'A foaf:LabelProperty is any RDF property with texual values that serve as labels.'),
(94, NULL, 4, 'Person', 'Person', 'A person.'),
(95, NULL, 4, 'Document', 'Document', 'A document.'),
(96, NULL, 4, 'Organization', 'Organization', 'An organization.'),
(97, NULL, 4, 'Group', 'Group', 'A class of Agents.'),
(98, NULL, 4, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(99, NULL, 4, 'Project', 'Project', 'A project (a collective endeavour of some kind).'),
(100, NULL, 4, 'Image', 'Image', 'An image.'),
(101, NULL, 4, 'PersonalProfileDocument', 'PersonalProfileDocument', 'A personal profile RDF document.'),
(102, NULL, 4, 'OnlineAccount', 'Online Account', 'An online account.'),
(103, NULL, 4, 'OnlineGamingAccount', 'Online Gaming Account', 'An online gaming account.'),
(104, NULL, 4, 'OnlineEcommerceAccount', 'Online E-commerce Account', 'An online e-commerce account.'),
(105, NULL, 4, 'OnlineChatAccount', 'Online Chat Account', 'An online chat account.'),
(110, 1, 6, 'Etudiant', 'Étudiant', NULL),
(111, 1, 6, 'Audio', 'Audio', NULL),
(112, 1, 6, 'Transcription', 'Transcription', NULL),
(113, 1, 6, 'Analyse', 'Analyse', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `resource_template`
--

CREATE TABLE `resource_template` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `title_property_id` int(11) DEFAULT NULL,
  `description_property_id` int(11) DEFAULT NULL,
  `label` varchar(190) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(1, NULL, NULL, NULL, NULL, 'Base Resource'),
(4, 1, 110, NULL, NULL, 'Étudiant'),
(5, 1, 111, NULL, NULL, 'Audio'),
(6, 1, 112, NULL, NULL, 'Transcription'),
(7, 1, 113, NULL, NULL, 'Analyse');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template_property`
--

CREATE TABLE `resource_template_property` (
  `id` int(11) NOT NULL,
  `resource_template_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `alternate_label` varchar(255) DEFAULT NULL,
  `alternate_comment` longtext DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `data_type` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `default_lang` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`, `default_lang`) VALUES
(1, 1, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(2, 1, 15, NULL, NULL, 2, NULL, 0, 0, NULL),
(3, 1, 8, NULL, NULL, 3, NULL, 0, 0, NULL),
(4, 1, 2, NULL, NULL, 4, NULL, 0, 0, NULL),
(5, 1, 7, NULL, NULL, 5, NULL, 0, 0, NULL),
(6, 1, 4, NULL, NULL, 6, NULL, 0, 0, NULL),
(7, 1, 9, NULL, NULL, 7, NULL, 0, 0, NULL),
(8, 1, 12, NULL, NULL, 8, NULL, 0, 0, NULL),
(9, 1, 40, 'Place', NULL, 9, NULL, 0, 0, NULL),
(10, 1, 5, NULL, NULL, 10, NULL, 0, 0, NULL),
(11, 1, 17, NULL, NULL, 11, NULL, 0, 0, NULL),
(12, 1, 6, NULL, NULL, 12, NULL, 0, 0, NULL),
(13, 1, 25, NULL, NULL, 13, NULL, 0, 0, NULL),
(14, 1, 10, NULL, NULL, 14, NULL, 0, 0, NULL),
(15, 1, 13, NULL, NULL, 15, NULL, 0, 0, NULL),
(16, 1, 29, NULL, NULL, 16, NULL, 0, 0, NULL),
(17, 1, 30, NULL, NULL, 17, NULL, 0, 0, NULL),
(18, 1, 50, NULL, NULL, 18, NULL, 0, 0, NULL),
(19, 1, 3, NULL, NULL, 19, NULL, 0, 0, NULL),
(20, 1, 41, NULL, NULL, 20, NULL, 0, 0, NULL),
(40, 4, 197, NULL, NULL, 1, NULL, 0, 0, NULL),
(41, 4, 198, NULL, NULL, 2, NULL, 0, 0, NULL),
(42, 5, 199, NULL, NULL, 1, NULL, 0, 0, NULL),
(43, 5, 200, NULL, NULL, 2, NULL, 0, 0, NULL),
(44, 5, 203, NULL, NULL, 3, NULL, 0, 0, NULL),
(45, 5, 202, NULL, NULL, 4, NULL, 0, 0, NULL),
(46, 5, 201, NULL, NULL, 5, NULL, 0, 0, NULL),
(47, 6, 204, NULL, NULL, 1, NULL, 0, 0, NULL),
(48, 6, 205, NULL, NULL, 2, NULL, 0, 0, NULL),
(49, 7, 206, NULL, NULL, 1, NULL, 0, 0, NULL),
(50, 7, 207, NULL, NULL, 2, NULL, 0, 0, NULL),
(51, 7, 208, NULL, NULL, 3, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE `session` (
  `id` varchar(190) NOT NULL,
  `data` longblob NOT NULL,
  `modified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('1l0lvu0euea88qe6rn9bns71ac', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343638333936352e3539363032313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e70636433626c346b65326a39647162703369626f6737316871223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736343634373535333b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736343634383033343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736343634373636373b7d7d72656469726563745f75726c7c733a35383a22687474703a2f2f6c6f63616c686f73742f6f6d6b5f746879705f32352d32365f636c6f6e652f6f6d656b612d732f61646d696e2f6d6f64756c65223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226364643734313332643738636464356439623233346438663933626234616437223b733a33323a223166663834393932363137666635613562313966396431323361613335303338223b7d733a343a2268617368223b733a36353a2231666638343939323631376666356135623139663964313233616133353033382d6364643734313332643738636464356439623233346438663933626234616437223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31313a7b733a33323a226331656437646262353661363264663536666330663539653362396530613930223b733a33323a223766383464663638613532336531393637616662396237396138366133306463223b733a33323a223461363265373739393939653965616263626138333164346435613237643465223b733a33323a226635633564393466313861343836663164313964653261383138636235316635223b733a33323a223439396539613166646563306166346539613266646136333537306265613134223b733a33323a223430343563313237646363643534366336633633653735376138313565393232223b733a33323a226132303936666230653862613531666230383261343433303132616232656639223b733a33323a223636386365323733343230313263653165323831613865366561383036303432223b733a33323a223832373133346461616162653264333262386531653435633231353032383231223b733a33323a226266643266303836353137303339323963356634333066663464376332343865223b733a33323a226438636531333434306336363366333333636364663838613163366566346466223b733a33323a226530303739653832313864386233386264313437633334346631366162333735223b733a33323a226239633238623466333435393063633434383839623536616338623834336336223b733a33323a226264353732346566653161623537666166663164376431616365653936666231223b733a33323a223937393865306161636338396435663330353837663832333261653261663263223b733a33323a226138393239336361616366323037633761303736333364393461363635633238223b733a33323a223434633635323565353633376134373930306638306134386162653531396634223b733a33323a223938333033653338623832626562323761363866323535316339356564323237223b733a33323a223064633731383839383036383830373561386464373665396531356239663466223b733a33323a223461366662663166393634313563346333633138636563363132653036643761223b733a33323a223562666135376531383439623531383465386365653837336430633362396238223b733a33323a223430623261616164316664336166303934383362346333343134323933346561223b7d733a343a2268617368223b733a36353a2234306232616161643166643361663039343833623463333431343239333465612d3562666135376531383439623531383465386365653837336430633362396238223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223537633264376131326561396534326262383939663462616265626663393561223b733a33323a226161383031323531616563366363636431313830313531373834623536666534223b733a33323a223939633737303936313535316234376335333534376537333033303633333039223b733a33323a226462333861643964366461666264646665383765623231363563373434356130223b733a33323a223634626336656230643166626334646164336630306262333663326139616431223b733a33323a223434363330363431306462343633373834303333396461666231323735323735223b7d733a343a2268617368223b733a36353a2234343633303634313064623436333738343033333964616662313237353237352d3634626336656230643166626334646164336630306262333663326139616431223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1764683984),
('3ee5ku42jb269b9nrirdici66r', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323230353439362e3730363831393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22767433336163326670396e706135307369633371726c62677533223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323133323432343b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323234383639373b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736323234383539363b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223734636564656536313830336362313634383731343734313364386561633536223b733a33323a223930613738616536626235373963323661313034353063336632333430306661223b7d733a343a2268617368223b733a36353a2239306137386165366262353739633236613130343530633366323334303066612d3734636564656536313830336362313634383731343734313364386561633536223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32323a7b733a33323a223537343234353866323866353637653036336161353861303837653130653961223b733a33323a226464623533383535353562656163653064313438653762373664613137343961223b733a33323a223132393133323166383261316165303738326531643638303032303333333831223b733a33323a223364373962336138326166323364623438646463323261323837356364323638223b733a33323a226338613736343761613139363738336330343864643161636436623132666430223b733a33323a223735396663326466653765663037313566613761326131653933303562323263223b733a33323a223438343961363866656137323862373834343763663165306338646462633238223b733a33323a223664653363393139623362663037626237393133613365383861666334303835223b733a33323a223434316263343831386138613964313365333631313938366332336161626336223b733a33323a223331326331313932393434393531373034613237396439303863336533376166223b733a33323a223961653238316231383732306334623637656535623661323662323264326266223b733a33323a223563656566636138363665343234613163663237653566623234646331646335223b733a33323a223535613737393036623065303738376538363334633034616336663936646561223b733a33323a226630666461316139306532396566663531313564613166333939386564316165223b733a33323a226461366232643464393766396233313037626631666266663933663763336665223b733a33323a223231313038613531663834643764653430636437396137616166313133613235223b733a33323a223061666437616561343037636235366537326638646431373936336235383534223b733a33323a226130303538653437633439316233613439313565653365653339343230626534223b733a33323a226430396262666139343137633534326265643562636235306261623933386433223b733a33323a223065303631366266393634346636363938633532336630373235313334646436223b733a33323a223331643135643333323736373437383836623865666531636531353834363838223b733a33323a223965353736616631343439626237633930343465356232343666313634373638223b733a33323a223664333764373366636430666239353861646133383664653964346137313531223b733a33323a223433626466336130386435383233323237653737616264346239333734363135223b733a33323a223037353037393739623731623864663530333539323166663436306531633033223b733a33323a226233333437363362343933613430623634663733626431346534626564333862223b733a33323a226662333932306339393435666463313165663731333837646231313336613032223b733a33323a226533363063613339633737313161363638363266386563343161333363353734223b733a33323a223336376566356134623133666363303838663734313764303862646233633538223b733a33323a226233663064303464666234633961616631633630343731363536303236613832223b733a33323a223562343937386463653230313366303834353765343864386363626230636434223b733a33323a226632343564393332376366613931326135643538616533306632316130643736223b733a33323a223031333737626234323066393130376135646639313930343637333133373630223b733a33323a226661366331353062383765323365633862356164343939393431343564373061223b733a33323a223661343365356135373063313533646637636164643866633762383435663763223b733a33323a226566303965616664653538373965383532633738613162303465323434393635223b733a33323a223132326339353761616261356638656131363036623336323835396437373735223b733a33323a226636643263616663373933306466313334396362353934316135323432306261223b733a33323a223335613361613162613732396539343831653163366466366433663034633165223b733a33323a223839393065316463383163386566663538373262633038363966663236646366223b733a33323a223233643434613661386632643634613337396165313239666331333961616165223b733a33323a223637623231326236306338623833363063336663336639393838343339306664223b733a33323a223434326665306238353933633966366339623366373065373134393866616666223b733a33323a226330336466366465343461386363633631653738363964303661363564663636223b7d733a343a2268617368223b733a36353a2263303364663664653434613863636336316537383639643036613635646636362d3434326665306238353933633966366339623366373065373134393866616666223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31323a7b733a33323a223632653434306630306462633664343231653339376562656239623565306438223b733a33323a223561313136373661306130356232343032366264303564316436636532376638223b733a33323a226164386466346533336233336361396134343366383239643336646633613735223b733a33323a223130623163306239633866313065633936396663313837343762316665313737223b733a33323a226366636631626338613631663664313638356433333338333931333264633737223b733a33323a226466383739633434396531313161333537636433356438356665613138303637223b733a33323a223739393835633438613933663266643761343830636435343331353937383834223b733a33323a223366613833303635633130306462633266333230333035616232386334386366223b733a33323a226531353265393165633962333534383830663939653562326461363235663566223b733a33323a226637643861636461393838646233366336333864636230393163383436333265223b733a33323a223062356463396430636662616262303563626637343034666234323631326366223b733a33323a223335316332646137363863623936646661653238663365653562663066323162223b733a33323a223135353535373737316438326165356537633861663134613736363430346635223b733a33323a226263393762643964666233366334343961373764303037626634373637373439223b733a33323a223061323266643031346230373264323165636639343933643435333634613464223b733a33323a223864393161363537616366623735663864376663623438366638386530306231223b733a33323a226530363366616539613432366462306665383832313661656636613539343563223b733a33323a223730653331316635306531376230653931636537653838643731396462336366223b733a33323a223965323362333239316334633031333664656165643930363838613561393738223b733a33323a223235386261363233616637323864303366666666383962626536373831646337223b733a33323a226232396362393839346133386632393837636439623639346166376333633563223b733a33323a226337653934393139663862366636613761353632346336323539316265626136223b733a33323a223763313830633361393039643662323564313337323939336439383963313834223b733a33323a226433663030663535313439643534636331653662396663633265333566353264223b7d733a343a2268617368223b733a36353a2264336630306635353134396435346363316536623966636332653335663532642d3763313830633361393039643662323564313337323939336439383963313834223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762205497),
('4so3lknbq83es383fetllofsqk', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353234393135342e3139363836393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2234736f336c6b6e6271383365733338336665746c6c6f6673716b223b7d7d, 1765249154);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('6paci4upt7dchu6o7pt2u5bij5', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353235323233372e3936323133323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22367163326e686e6774756f626a737365326a6332373232663569223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736353235313631383b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736353239353431303b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736353239353433313b7d733a35393a224c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f5374756479576869735f636f6e6669677572655f63737266223b613a313a7b733a363a22455850495245223b693a313736353238303638303b7d733a35383a224c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f4d794d6f64756c655f636f6e6669677572655f63737266223b613a313a7b733a363a22455850495245223b693a313736353237393232343b7d733a36313a224c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f526573756d65436f7572735f636f6e6669677572655f63737266223b613a313a7b733a363a22455850495245223b693a313736353239343034313b7d7d72656469726563745f75726c7c733a34333a22687474703a2f2f6c6f63616c686f73742f6f6d6b5f746879705f32352d32365f636c6f6e652f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226266346436646138633933646235346539356666323863363231316165363834223b733a33323a226532643539646534366235373739303466633235353938303436363139653366223b7d733a343a2268617368223b733a36353a2265326435396465343662353737393034666332353539383034363631396533662d6266346436646138633933646235346539356666323863363231316165363834223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a38323a7b733a33323a226536326238346362653235633266633735373936393939656434393432613231223b733a33323a223462613065336565626330383836613132336564343465313862623934313164223b733a33323a226664616438646666633530663263613439333030653830653335376335313766223b733a33323a226636346665656438323763663361373332623734663161383933306137623061223b733a33323a226362623265656235333931323431383236303165313436343066363637336362223b733a33323a226564303730613762316132393431386164363932373333323434663663623538223b733a33323a223964656262393664623638393566363032353830313034323837623338363338223b733a33323a223831656332623539336462616233396337363266323536656532313337353037223b733a33323a226537303234343236313931363666343732383936346633363062383937316631223b733a33323a223434343236613635333130633735363833373463343863316435653530646264223b733a33323a223165323234626265386264336538366137336635646666336239386139333435223b733a33323a223163613861393539396562373865613437613864613231646535613337366330223b733a33323a223633656666666364666566653663666364343438626266313463396662636131223b733a33323a226665363836323033386135646563623231363639646265646536653034663262223b733a33323a223262353164393931383937353231633830383135386536306633616464373335223b733a33323a226262633665306163303636633539633732303234363566383432333330336138223b733a33323a226630656565626538613333306664313766303534663466396361663562666366223b733a33323a223631646536303937316138323839383765383965313937656337333739313333223b733a33323a223537323436656566656265613265343062666334353539313836323033383930223b733a33323a223030326162633833316366316561663066303264666632663136333366636563223b733a33323a223439626466386631653335663764373230393638303632656635386463363164223b733a33323a226335646335343538306531323965646333366639643630633730336235303233223b733a33323a226563643134613032613434663937323839343135303164373261646166333830223b733a33323a223365386131326439626535333636393337333863396530356639626631333839223b733a33323a226636336539623135633938663632626662366166363433376261636538386637223b733a33323a223936373133636435393333363137393163336463356336303134323932363033223b733a33323a223633303534643264303431646366306434386366303439396662373365653230223b733a33323a223561613366383930653237356561633564646335333135626436343430356139223b733a33323a226563303766653831376164653036623431373461306135306364623035313165223b733a33323a223336323837346361363364303831383033366464316333363065623166393339223b733a33323a223230663730383166636264393435653564306636393032316266646139323736223b733a33323a223734313830353966323461353464613935646237636330653439373362333163223b733a33323a223763393639323136656330336235633435653233643137383032393863646563223b733a33323a223537353561353461343434656365623639303537326233316632623937626565223b733a33323a223965633430303232643462616230636261353431656663333932616166363861223b733a33323a223562366539313832636638393634646438643063323263633032343464643661223b733a33323a223033343664376231326363373132623239373138616233333836386464333232223b733a33323a223031626234636332353335313531636637393233616263373537393832393234223b733a33323a223234656633623832666464363662643138356637633534303964313366326565223b733a33323a223936313532323963323734366630316134383531366562636263366162333935223b733a33323a223031623137393530396638626162646231363662343165336333373834336331223b733a33323a223133313736653662663534643431303535386339303131646364353231366330223b733a33323a223933663637376463343965323231313738633665656436393030356365623264223b733a33323a223733656366393137653236363761626565396339336130653265663535663964223b733a33323a226265373863323631393231303536623165316563326565373961323363323162223b733a33323a226636313630386366623066353961663430626138333934353135313239376139223b733a33323a223362343436396130653237343165623837363865313136393637363932353034223b733a33323a226563386135653766636133653062666166383633306334323966633837613966223b733a33323a223165326462656362316134383264353836353139396336663666636137303030223b733a33323a223766346163646361363136623235313137643362343735363932366436613934223b733a33323a223336653839646135346161653130643061346137653434646332353038653735223b733a33323a226637623135656163623466346364646639393130336139303531323662623936223b733a33323a223864633130366331663061366636363632343062623638373130373634656334223b733a33323a223039333937613430323266316439373935396162316233356134303262333965223b733a33323a226330623831343734393534633738373162363562626433363765386239393730223b733a33323a226131353438653638336562346238333230303139353266306433336339366663223b733a33323a223635613464623362613563333639386261393664393566373333393236303065223b733a33323a223531303464303732333633386137636262383038653931313030383361316232223b733a33323a223231306266383331653964623733343833396130336530393064353936376235223b733a33323a223737303466653963663434353534393437663131336338353437313762333963223b733a33323a223930626636313861376534623631333739323862376232646464653662353437223b733a33323a223132383836313732333539323364653838666133636134326363623164316162223b733a33323a226262373265346235326132383038656662653336383430336633306532303331223b733a33323a226537646165653731373337353466313063346434363734613563646539356431223b733a33323a226561393131633433313630656464363233303735616162323666656263333833223b733a33323a226139366466386165383763636432656637306463343430653961646566356164223b733a33323a223738643165636235383439346332613165663864633935333864346633633432223b733a33323a223132343037373763636565343233373638373732303437636630336231623236223b733a33323a226130633461613239306238663736343939643536336130316436373561373131223b733a33323a226637653262663162633033386166663264666133343734373138373966306238223b733a33323a223137373966373464643733353164613263313234323736663666616263386365223b733a33323a223232636435373138306136376635313264353630613166316237333130643535223b733a33323a223730313061383666356639363737313039653965666264663436643265396232223b733a33323a226561373562383031616332626461393733393162636635633630663330383265223b733a33323a223933643461646364653332633964633562666534353139333436663730663263223b733a33323a223462623361343163653865303863656539313465376630633432373135663534223b733a33323a223661313762353038393232376463636262373733383932663761636663653962223b733a33323a223532643133383334626232396464333235326432363663333831643036306631223b733a33323a226333323337306535636562323663663564366430613564396133326538303364223b733a33323a223538353863356634336466373364326631633439643261396364313237353139223b733a33323a226132343336613830363838366566623235613534633862333334313065663234223b733a33323a223939613030656564333132323935656434326330333434636631376439323232223b733a33323a223431323738643134656636393465326236316337376162393563663764613463223b733a33323a223866356231333365343439333430393635343737313739653936313939656633223b733a33323a226461643564643564386133633764363634316434646264313363373033356533223b733a33323a223432333863663262363564333432323737353564343131633562343036643261223b733a33323a223432666539356336646632376465353230313064396537373731633331353838223b733a33323a223139346361363863633836373664303562643538363833313861353138336337223b733a33323a223763613364333065353065376461646539303961366362623834636231653462223b733a33323a226463343363376364666137616331636565353465306139653739353565383635223b733a33323a223466663130623431643131653237633837613639633132376231333730393535223b733a33323a223361393232353566303361373765333963653234366266303263626437373965223b733a33323a223164623736613963343765343565616531373735613038333230353964666232223b733a33323a223532376261653538383838353062333230313161393033333533363131333838223b733a33323a223162353864646464366239376462383735356361626131306130376635326663223b733a33323a223564323834303465633565353537656238386336643937626132336662653132223b733a33323a226234623661303462303862373233646565313534666166643966363166366337223b733a33323a223233643466633561666638303464326130333634343338383462646233383131223b733a33323a223532653638383963333536626636656565313865373661343331626466373736223b733a33323a223532626562306564353131313065663637633162333830386238623039383633223b733a33323a226562363036343261356165663765363730313935316437316363626166376635223b733a33323a223634613637643431656661396439343065633565393766383230376236363363223b733a33323a223661626339646634346636386230633662326263363866623334323739653138223b733a33323a226438366636646332653235313763306164646131336563666430313866653038223b733a33323a223464376234666234643562396264623637633835633266646136653464653362223b733a33323a223736333764633731303065626330383361303631633337356264303330373139223b733a33323a223333613063386130333762616138366666343530633766656631636235336661223b733a33323a226262383438383130633633363062346165313937613365343236373863323131223b733a33323a223234303464626439643066393733326163666466303562316537333631666430223b733a33323a226330386166653462386534303366343532386633373034333139326239373362223b733a33323a226537316430393733343433396261343637653865306566373362326437636662223b733a33323a223765373337623033633033323537396531306431656531386332643466316466223b733a33323a223262653036326633313537383664313437366431323633343932303565336565223b733a33323a226531313733343239333836656234613236393733393161306461383836313335223b733a33323a226636616535323231353138323938623036383537656536373135303466346536223b733a33323a223039383861343839316661613964616263656434303932653630623332323231223b733a33323a223033383265306239396161383965323764356461633839373635623438363836223b733a33323a223533303566303436303232363965623366353165633736323866323738323136223b733a33323a223765623131323761353737313266343436373166303631646630326666616663223b733a33323a223061393531303164666232616262363338326665633266653039633063333930223b733a33323a223130353738626533306166323164333263666131613366376664633033616465223b733a33323a223165306538373461363734633738323334333965613864343961656666323735223b733a33323a223563376336373665353731356633623832316166626638633966333561363364223b733a33323a223038356664633265393131393664343734356138303136653063353661663636223b733a33323a226331343863623536656662336663343535303066386134383535306533386431223b733a33323a223762326531366535363539383932636534646435336532396264653465663264223b733a33323a226462343066303034376636353166666161323865666538663938633562633334223b733a33323a223138373035643061666533366334333333336535383133343930363634303331223b733a33323a226162383137623336363733383765623532383964363565663730666136343966223b733a33323a223035326365336630636236366262363662393766613532386363636439396539223b733a33323a223937376537363530376630663838363734366634383239373063613662303635223b733a33323a226166386462396233333238643930626237313833313661333237623766306664223b733a33323a223134393363393832643038613435306365656330373762616537366232383264223b733a33323a226364633734386564326565663664396138663239643963643031363762343639223b733a33323a226364333565636534313965346338376531383564383863346632313933353662223b733a33323a226366343666396232383732323334343963376662333030626335366165306432223b733a33323a226330303263643966353435616238666166383437356530393330366165386339223b733a33323a226632326163623337323262646361306638323832343465366238303938623562223b733a33323a223766396161653862326137333765386633633633643966613938356433333531223b733a33323a223639336233653037313137663962656232356462393065383836303765623032223b733a33323a223263666131643264356433626365383564306231373637626137613066636335223b733a33323a223335633261373638313336626561383033383538356130386439316239316638223b733a33323a226666613162326433336637353137616539623239353536613163636530663134223b733a33323a226432663739396639356431386138626332323063643065373763363864313065223b733a33323a223830663236366233366161666432613231343136656235643538353632383832223b733a33323a226337343131633839363933393639653361656137623531633561386438356134223b733a33323a223662613138633730646639623266613638373161306666633130373162396565223b733a33323a223262306635383862366238646463393266613436393830336639353063323966223b733a33323a223731393035666463643962653563353836316165393366653132623666626661223b733a33323a223832366266393830306630356439393165663531626565333533626138373664223b733a33323a223738623831646236323533356134323239666565396334636630633763643732223b733a33323a223331623530343635386263623764646465636562373338356538303461643439223b733a33323a223833363963383630616463353363646633353664396536333764336236656139223b733a33323a223962623731356531393063306134623232353564353032353335323565326466223b733a33323a226661333633303835303836633934383764633137656230306165353336326435223b733a33323a223539633633656466633231393462633338643935383631633566393837353162223b733a33323a226362663563333164303261663835663039643132616365633465306665303732223b733a33323a226636333063366137643866663539626133643164333266326335643035333762223b733a33323a226264323937323864326563373263363864653266386536646537646239376631223b733a33323a226331393161366339336237306238373830306635636262316264363931356662223b733a33323a223035373438363938313937613436636234313536376265356130343039653361223b733a33323a223830646464346239343439636335633839313839386363626535363366333563223b733a33323a223037326135396236383530366435306162386465656638633637303462323065223b733a33323a223461613037326136383435623232643439316434303331663466646437366635223b7d733a343a2268617368223b733a36353a2234616130373261363834356232326434393164343033316634666464373666352d3037326135396236383530366435306162386465656638633637303462323065223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a39353a7b733a33323a226133393166366531396530633264373263326133663137386463313532343664223b733a33323a223034653632653861316435396263343036386237396239376535303537646438223b733a33323a223437326235356335636231613733666138623734333761366639343762353164223b733a33323a226536313037316137373934356335383333313433623662353537386138353232223b733a33323a223231373437613032306466303035663933643130653735343138396135316461223b733a33323a226130636336306362666330356230623965383335643839333534346531633230223b733a33323a223362303964653663663438333063306134386234303539386232373236306565223b733a33323a223430356139333465383331613736646537353432356263313938326566306633223b733a33323a223261336135643733313665643761343465313662633131653361376265343264223b733a33323a226264633365366632393661666637353035646232333663376535313436666230223b733a33323a226566373664376639333663653733306435636463366232643861636262363363223b733a33323a223361626362663164353735356135326564383765336534353338623339636238223b733a33323a226139613065393863666531633630353963366231663366363861666463306432223b733a33323a223736383538666338623134316635363735613934313035333139313638663732223b733a33323a223565306562386131633137336134306638343762656131646338373165373165223b733a33323a226436393461376232313731336364313463653638636636356639323132386131223b733a33323a223335303433663831333630306464383136353635383231363833366337356465223b733a33323a223063366532353161636530653637613365663763313235663664666536356634223b733a33323a226634623234373639653235663464633638323265343634333530333263653961223b733a33323a226530343834646533653635383666306339363139333838306534386435323537223b733a33323a226530613732646464386338326334633037323061313363366164363333633663223b733a33323a223461636137373038663763353432616639636534633565373635623866303435223b733a33323a223666383963626432363835616432643164613836623665636564613733376662223b733a33323a226561643363383736333638353538663133303635626663336331303762306266223b733a33323a226630373336303835316633393463613535666633613265623362383734386631223b733a33323a223864323466393636656663656462366530393430643462303036656462373334223b733a33323a223138333865656235306336653333343932336562646338623331326566343238223b733a33323a226465653066613837663539343433626635353434663234343936663264626135223b733a33323a226332343031386537396365393062303865646461386333303237626637376232223b733a33323a226564346135306131366130633836393466623735366530383662306439636634223b733a33323a226233353330636466353433633333623966336637386162366532666330663433223b733a33323a226361656561643566383666333664353561376233633631323634393464616334223b733a33323a226333646238396538633663333138333838393536663234633064323662393839223b733a33323a223335313231643030373036333666633637383534363465626232346634346264223b733a33323a226134306436333731663534396264343738346230333561646135316635653437223b733a33323a226333623365366234333739313963633535353361663561653865393864316362223b733a33323a226263633235613063396462303335636339613438346463366438353435663535223b733a33323a226137656533373232336131353665376230363163326466643862303131306663223b733a33323a223634303661623631356565383734666430343631633265656265393261376462223b733a33323a223533636532616338363664303230636539613733366262396433363862333330223b733a33323a226261326130656462363932623062386330356233663932333264373465613935223b733a33323a226538333033336161386464326431613663353565303066343165373938623463223b733a33323a223462373838343938333165646634363037353430393739303734353334346135223b733a33323a223365326531633933636436346665313135646139393132386431303438356131223b733a33323a223563616231633362383164353664663930633430396564616137613637383937223b733a33323a223636663665323739393734666137653633346635626561346364616233336335223b733a33323a223937366633653133363033613039373034356334353739373563393836383136223b733a33323a226266303936663633336663633666316633663933633635336338336438316338223b733a33323a226332353563393331653766343462623935323438303261353635336634663763223b733a33323a223831346462666463346137623633373834383364613030626262386137626430223b733a33323a223861373363626531613966336632353233333936326135336166343338363332223b733a33323a223434333764373861336163393030343133656466323438653765633231356238223b733a33323a223130393835303362373538306130633738356237363938396532326539363964223b733a33323a223336353163356332383331373234646662383466383831376637313938316535223b733a33323a223137393632613637636466633965356163313461396631643138376232353066223b733a33323a223164393564646131653633343032383033343334373161333734313362356634223b733a33323a223731336436633063383266306531396335383538666566316532343531376636223b733a33323a223565326530633466353061376261663235346636626234366533636663303633223b733a33323a223762663834653362633838316537666362646137633432356539633337353439223b733a33323a226162303765393062666230663330623533653233666638343033386239306632223b733a33323a226663336439366133373437666537343632303539343233306231336138623861223b733a33323a226565633036326165396466666530396662346135306136666239646334393038223b733a33323a223830303632613266626632303134306562346465363561316564353665623536223b733a33323a223064393038623861356461333237636462306436373463346665656663633865223b733a33323a226563393264323266336435306536343864393634623038343436613562643238223b733a33323a223630303865343231623466393461326561646661323063303634393661353664223b733a33323a223437343234316539333736383862643837323566383938353961666639393734223b733a33323a226330646434663437373062343665393166376337303366386634633033323762223b733a33323a226565353965373061633661333966366161616530633334363937633764616463223b733a33323a223036363538613034616137303537636662623565613435656234353435633934223b733a33323a223530616361323737306665663064666638333161643065313164363338623964223b733a33323a223733396639393531636634353063383834326435616530353832653134363938223b733a33323a226566376563313635663263643134383965306336633938336665303065336532223b733a33323a223064353361393062373630353365326261356431363066313964663631616138223b733a33323a223136616232623336303430313539633137623838343566393866623734633432223b733a33323a226639326238396662663665653730313539383836643737393234396562373837223b733a33323a223966333066333166343638373739333935636331626131663563383962383737223b733a33323a223036396537396435663366646430386235333665353732393437363935616136223b733a33323a223633336434323366333661383938633735393834396330323165313534346662223b733a33323a223233613063363131356665373231613131376235323435383765616266653438223b733a33323a226438393466383732316532393436646566366663363634653836626666656661223b733a33323a226134356561633334343035616333326364373761363061633038623565323436223b733a33323a226333346538623138633939623836636338313333373836363465363761383264223b733a33323a223735323538633730393865396666363463356636386537316130386233326432223b733a33323a223130336233333738383364653465633638313363313963343035303532356430223b733a33323a223461346239386132356661396330343735616463636464626662366330396161223b733a33323a226431346561393930393636326664656232356133373761356638316433383661223b733a33323a226464653239666264383934643161633761666637363862656466393535313861223b733a33323a223163366136623333353032396139623134373136646336646661343863313764223b733a33323a223366653466313436303238383430343934363966326164353336666336353034223b733a33323a223561663434346637353437383866393066643535636134343735316361643832223b733a33323a226636633933303336366264396133303764363334636431313666306266363438223b733a33323a223537326636633166323331633139643238386330346636613064386434393131223b733a33323a226461633931343330323566363031393662383962383836333830326162643636223b733a33323a226531323031353137353432636239323739316330306331306230313632323262223b733a33323a226134343766303635633033663039666465323263333937616335326466633738223b733a33323a226536626464653664393661613732613136333331363639633337643136316531223b733a33323a223135663933626661383263316365376461363162333233363563373062353663223b733a33323a223031316233306133326333343565643937303734656665373961343334306462223b733a33323a226539643935633562363561373439303939376532306362396665373932383036223b733a33323a226431373139666263343533393435383439303737636130613766326338336366223b733a33323a223262366537343936376563653766343539366162333265643032353035653965223b733a33323a223435363437313837316635373866333930643739373531626537656662333838223b733a33323a223161343332383431343361643962313332616635656561613862643638363861223b733a33323a223463396533633762336362343036396132633830626139656431366538306133223b733a33323a223861373835323539333735336336626263376434663963306631373432363934223b733a33323a223663663135666530626465613939396366303561386330383266643865306161223b733a33323a226539663332313064623039643434643031316238373035333035643733646430223b733a33323a226539663037653234383236396463396365646532646132346232356631383030223b733a33323a223030343536343263643637393966313134666631633635633762326266303230223b733a33323a223761353236663262306662303333613466643764646236396461613833383035223b733a33323a226430626632666566356331346461386164663734383539626630366265363534223b733a33323a223932646132666636336363393235386133316261356335666536353461383765223b733a33323a223939346132336563646135623834353763653366666266393262613466316330223b733a33323a223061663431633162323732613761343535356363663338336261343535366534223b733a33323a223333353965376634363833376533383162646339383637646238643264616338223b733a33323a223061353736396262363962346433626362323434613262353738366634666134223b733a33323a223537313966386234376366396430363639386136616433363633393330316637223b733a33323a223766663662333039646535363031353334356334363031393836633662636130223b733a33323a223661386239333664383334653163383434653137646436633135343066663964223b733a33323a223566396335353735666638643733323866626362323432363137663535393663223b733a33323a226333313332366430376132343734663939343436376131316231666661396462223b733a33323a223230656437633232306134353034323963316637613635623731633738616264223b733a33323a223430633534653931393765633466396530303861323263663365656431313864223b733a33323a223366343430663839666664343138396437396239633264613736626533666530223b733a33323a226461373062613437333139356539616261636132646639303337623764343434223b733a33323a226631663937303161353065643737353864373564393336626234636564376164223b733a33323a223934373263323837313230613534363761623737663935333665626265333035223b733a33323a223161383537386362386165646238633837303438353438353963303564383931223b733a33323a226466396139623439343064636335666433616139616363303731353261646639223b733a33323a223939623930633434646362383566383363383935656339393163343963396638223b733a33323a223061646232613533313234333462363864613163666533303564393639616564223b733a33323a223434636632363864323361643266343566313062393632386134316235316366223b733a33323a223762646135663334363030653837303038366639373864643631316534303261223b733a33323a223562303664383762633561633933646237616437366339393164386664323434223b733a33323a226334376635333465383632366138353433393132323862386636353439353630223b733a33323a226535663163326632626463373239643135333433666434626136666539343361223b733a33323a223539386435613865306238353965656138313134653934393738323837633766223b733a33323a226263313262616539643236313365323636376130376132336265333161633439223b733a33323a226162386638623539393232313831386333326330623538363739663831356238223b733a33323a223933656533383665316339316330303139633633646562393038393633666335223b733a33323a223831633836393230373064303136626466323733646636306465373432323630223b733a33323a223039356664323531653438313662653463613939383365313735333961613263223b733a33323a223461343031343131623063383738396162346636633062363131386339316464223b733a33323a223165343237646263326437663530323333623031343632383862356632306532223b733a33323a226338613333643466346436396365393636323535363438616336356163393066223b733a33323a223235363164316339396361373665363835623039346536383335343662303362223b733a33323a223134346530336361326263653036363939383834646236646135363064613864223b733a33323a223864623030653161666635366137306665383438323530356331376236303031223b733a33323a223337623633383531353139316239336364383961383963393631393965623662223b733a33323a223132373266393636363034383861666232303562643732373765383334613337223b733a33323a226332636331343766653162323761396365343438303631633136353466336433223b733a33323a223834393762356130353938643165336539336165653065646165326637353164223b733a33323a223031336636396662653266303138653336663937366530626530326238376539223b733a33323a223433343164613563326439336139373431653365336365333864393939633638223b733a33323a226364393934663732633539366361633632386364633161366665333635303865223b733a33323a223238376630356137323336303936333065316233313063613962313435333835223b733a33323a226533343530623932663639306262396537303266386537316163656563666465223b733a33323a223633393737643263363062656566626464373834643637646465383434653539223b733a33323a226261323530393135616235306138313161343136353536366332343235303264223b733a33323a223666313330393563393431636537353938306137323662393738616435396566223b733a33323a226561393563363538643734333639656133306339336663313036313765626239223b733a33323a223432653131323439666238623939353764613664346462663430653564613264223b733a33323a223439386335383866306239643061393563343034366434353061643933323730223b733a33323a223231653530323035336438323430356232363635613761393936653936393762223b733a33323a226563346537626439643932383538623634313564393439646630623466393534223b733a33323a223266666266623664353663383466343134383133343864313561373733303462223b733a33323a226461386237623139656636346331303335333035613064653761663232353861223b733a33323a223562326131623061613965656536356565323866643831323063623830653166223b733a33323a226464353232633335316436623261613161336365386632356137396465353230223b733a33323a226561323735386262313166643635356636366363343036366264393230303063223b733a33323a226438376137633535356163623534346339346131306630626434353336663430223b733a33323a223830333834343934303861613139326465376437333138396339353564366262223b733a33323a223738323362343365356132373230383338313033343333383136643632613665223b733a33323a226437373835343734613235626337343964626533636438363934353236306630223b733a33323a223061313038396330383530633063643832656339343930666535303139326531223b733a33323a226364633664393764346535626434303330396132326631643561626432353165223b733a33323a223936663236353231653235636434613130343538663233353339366135323138223b733a33323a223464313438643232373830623831633534633261656531353233333039633864223b733a33323a223233343430356532306161373163373032303936666562643966666333643966223b733a33323a223263376530353337373132626339303266393332333234326565333430396135223b733a33323a223132643731633432656263323666353162363936653738303963363037323936223b733a33323a223962316364343833333932663031393631313933623163646565636332386336223b733a33323a223030616430666332393739656162353431323837343335336265303432386265223b733a33323a223535646236356262336361383235353633346437323838623234313237386139223b733a33323a226434646661616338386465393565376661633234313732626435373437613632223b733a33323a223365363737363661353736343332643161353133643733396535313830323732223b733a33323a226639363636393362633231373666633330323534646335623334386366636437223b733a33323a226433373836383932646131353564386235653037653737623366316238616564223b733a33323a223031623763306234613739393037326233623062393464383337653063323362223b7d733a343a2268617368223b733a36353a2230316237633062346137393930373262336230623934643833376530633233622d6433373836383932646131353564386235653037653737623366316238616564223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f5374756479576869735f636f6e6669677572655f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31313a7b733a33323a226330333939623733613763373933343630356261643136343464386464303337223b733a33323a226532313334303965656635623531353665613438393432323366396164633630223b733a33323a223333626466393833366430323164616631663335653662326536656137326338223b733a33323a223966383139623066333863316535356362653334623437663763303963643639223b733a33323a226461643539613430303031363638636263663962646135653061383062323532223b733a33323a226561336432363063386234386262346662396165343561306232646361393264223b733a33323a226438363063373366626539313063313932313332353465663562643162383036223b733a33323a223332336135636236306465623330633964653336356535316463613534373864223b733a33323a223732623363376339363362353164323837626635373536373766623633636636223b733a33323a226636383731626437363139613032333934333536343034346232346630313132223b733a33323a223935613761346663663737313833316230613965363761313465353036336139223b733a33323a223363663932623435646634393337636661356364303338646237646461623639223b733a33323a226666343764353538393964326634353831353834393431373564643631306362223b733a33323a226233323331346435303431663630383962663662356165306463636265343334223b733a33323a226436326234333338633037666437386331306237666335326165613431373033223b733a33323a226162313236643933663531626563623963383663383130376334316331373530223b733a33323a226661383833326134343431326239383963336333353265646637636265623134223b733a33323a226238383933363665643565613938373663376136623032303537396339326438223b733a33323a226334303639646233306562396466333864353764303866373264623462383061223b733a33323a223261633930656361616366356664326133343163666561623736343235343666223b733a33323a226165386138396539666130366135316135333639623866306639383337613330223b733a33323a223139396134303864373130643764646532646234613830353538356337396465223b7d733a343a2268617368223b733a36353a2231393961343038643731306437646465326462346138303535383563373964652d6165386138396539666130366135316135333639623866306639383337613330223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f4d794d6f64756c655f636f6e6669677572655f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226233623730633939333337633532366335326165303231376336393432336166223b733a33323a226461613965643361343465346636363836363430376464353362656439653065223b733a33323a226434616430626431393464383866306133633263306338643934616231373036223b733a33323a223931373164323534643539346334316461633335666361663031313132353138223b733a33323a223231636166323836336563383132663134396535643032653132633061343333223b733a33323a226661636236633036663866326434656666643033376532646337643033363262223b7d733a343a2268617368223b733a36353a2266616362366330366638663264346566666430333765326463376430333632622d3231636166323836336563383132663134396535643032653132633061343333223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f526573756d65436f7572735f636f6e6669677572655f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226266383830353562643035303466626163643436353061366662633937386433223b733a33323a223330373563303937396262646331326564376533313737613435393031636634223b733a33323a223039303931666639353663303735333365366335653530653363303561336462223b733a33323a223533616263373961363663336564343261376331653065343033313331633534223b733a33323a223063306134383662383064396430313134613533346634646139366430623036223b733a33323a223337333334663164336564353363623537643762383962333839646462646164223b7d733a343a2268617368223b733a36353a2233373333346631643365643533636235376437623839623338396464626461642d3063306134383662383064396430313134613533346634646139366430623036223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1765252237),
('a0s26entlivr269ql6injt7d4v', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736353235333538362e3031393334393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2237336e396c36377430723974763769716b62747476367233616a223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736353239353433383b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736353239353930383b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736353239363738363b7d733a36313a224c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f526573756d65436f7572735f636f6e6669677572655f63737266223b613a313a7b733a363a22455850495245223b693a313736353239353838373b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223834393333333732653935383361633038613439336435333065323333353963223b733a33323a223331363434356135326136343934383130613934623061643234653363386263223b7d733a343a2268617368223b733a36353a2233313634343561353261363439343831306139346230616432346533633862632d3834393333333732653935383361633038613439336435333065323333353963223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a373a7b733a33323a223034393134346430666639376131323633663433383538646130666631333239223b733a33323a226330636562303466333533653261306564353531626430313165303938346435223b733a33323a223266333262376634313539383131363735366362363362656263326232313034223b733a33323a223565383237386630636264336364383863346636396330306233366161323365223b733a33323a223662643835613835353162303535616436393063373433323039663566396164223b733a33323a223533316433323064343836616336633634323035666631333463646431323233223b733a33323a226365643165663064633266653533303733663030396563623835333939353864223b733a33323a223434363161373037656531383762353437343938343265663031343033333030223b733a33323a223232356339343035313231346339363337633939303539393661353430393132223b733a33323a223462383266663338316335643362333262326134613265373936626362313036223b733a33323a226231636531336638313163363234316362396664653434623832666466633438223b733a33323a226463636633653335356161363931366237316236313838653135653563333836223b733a33323a223164323439313836343735373938393638333131333736613934336162613233223b733a33323a223931303166393362643166663164663762353838363537393034336231383332223b7d733a343a2268617368223b733a36353a2239313031663933626431666631646637623538383635373930343362313833322d3164323439313836343735373938393638333131333736613934336162613233223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a373a7b733a33323a223566316264633331633137353561326663653539353739383834333162326366223b733a33323a223161363134393739356439326261663664623330663035636262303431376231223b733a33323a223138373162393763646561383962626261313633316630353461666239666463223b733a33323a223634633835396530613332333033353964373833346533333931323032343761223b733a33323a223563323638333631383966323239306439383034313862666238643865633834223b733a33323a223666356161376262666233343066353837336531303339643763643730663163223b733a33323a223435346133646230666664333433333062626136646338623136396464393031223b733a33323a226665396462383239623764623862353938343039663334333465646136383436223b733a33323a223734646462316332346466636239343530663461316239626264623434396162223b733a33323a223964653839323437303532626435663366313666353966393737623531613435223b733a33323a223332303464383235316633613633646233333437613162376362623562313938223b733a33323a226230626435306235313032333535643465383766343337353963316534333265223b733a33323a226163613962633038323032303435353436356131316236663039396533393661223b733a33323a223631396365386663616633396563396661306632636332633561386533313539223b7d733a343a2268617368223b733a36353a2236313963653866636166333965633966613066326363326335613865333135392d6163613962633038323032303435353436356131316236663039396533393661223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f526573756d65436f7572735f636f6e6669677572655f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226239633063373637353033333134643536303431623862653262623936326631223b733a33323a223262666236653238363537623961613633643332333565363937353333663365223b7d733a343a2268617368223b733a36353a2232626662366532383635376239616136336433323335653639373533336633652d6239633063373637353033333134643536303431623862653262623936326631223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1765253586);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('c05anmfuqd63p3qa5okch9h6hf', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736313033393735372e3436363638393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2264306f76736f393135693031616e74667168396c303670616a63223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313031353137313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736313038323935363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313038313833383b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313038303139363b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223235633035393338613862366137323536666139346233336635326264653935223b733a33323a226662666361356164366537386563346531613764303235663636376238313730223b7d733a343a2268617368223b733a36353a2266626663613561643665373865633465316137643032356636363762383137302d3235633035393338613862366137323536666139346233336635326264653935223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32303a7b733a33323a223435666165313265333864393830633734646634313735366338396637613862223b733a33323a223864316131326664666663653836363333646530616133313164376164656537223b733a33323a223932616237333833356663646234393966613966613630626431376463643130223b733a33323a223930303565656439616461616532323863633735393166663662303937643636223b733a33323a223864666665336233623664663564353137316465393237633863383762666366223b733a33323a223938656465386562326539333236646162376632636532383761303238393561223b733a33323a223935393264393636396365303036356566333330333839633738386166623736223b733a33323a223863666431343638653238613063356233363038623536356366333465636234223b733a33323a226262646532376230303038653830353335376436633334363265383462303261223b733a33323a226332613562663335396262356364306130636536373734333137323962656664223b733a33323a223338643730623139656230336138663033363561343539323830633337323136223b733a33323a223062386563343635353632643336383365396636376532313532393738323131223b733a33323a226634353537396131333661653034303833366161626264633635613564346634223b733a33323a226265623264303162636663333731316362613331316332373737313636656161223b733a33323a223739363536386130643163363636653665396261613966623263363930396563223b733a33323a226332646161366237366139633139376333396238373839386331653233363130223b733a33323a223663653336356639326661303533383832613937666137666635383037363935223b733a33323a226331613165663937646530393635646435653164616532306538313233623265223b733a33323a226365636563666133366536373033383264363731616336626437633438353831223b733a33323a223036373331303766323531373562353764323636373562613931663563303862223b733a33323a223163356636626539363434653061343066316661393265646230613134336363223b733a33323a223161323734653063376335643338653039353830383936343834333461313031223b733a33323a223162663365363936306230363030633634656637373938363137623564643835223b733a33323a223634336166313534346137393139363066376461306564613066626561333633223b733a33323a223637313437346434636333326131646666633064616233383534393966303532223b733a33323a223365386238316466333931626362316636363034373738643934363465643539223b733a33323a223264626337306430383732623931313661646231383961353734613636666339223b733a33323a226239383830666537366537616437346335613331626533656266353337636561223b733a33323a223530303731326236336236376139646233306134393133653663313836373265223b733a33323a223532306165353030356537393166633732393231643536613939383162616631223b733a33323a223238333136346566333562616433396661633833336431353731646230336336223b733a33323a223062353432663361386638313734623134393766313862643762396561383635223b733a33323a226238623065353965636562346532323831663262643331656238363932333461223b733a33323a223663663465333731613032646238653563336437643132343338663832646161223b733a33323a226563633230363636663332363030646261346666303661633932393337656137223b733a33323a223630653961353165343637353062386566343031363932666266386635663664223b733a33323a223335306239383835613164646333616166393566373730383530656633356639223b733a33323a223431616334373430373661653137386136316165313863643064363936346466223b733a33323a226231363236396434353861323931333137383237313761313966353862653362223b733a33323a223731326264636364623563393262333635643835633034633236303864616165223b7d733a343a2268617368223b733a36353a2237313262646363646235633932623336356438356330346332363038646161652d6231363236396434353861323931333137383237313761313966353862653362223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31353a7b733a33323a223165353936623937346162623061343765316237653635373038373761623663223b733a33323a223465663136646464663037316333323137323962653036383866653838326564223b733a33323a223638646538396436306239613061313864383039653130336631633633653135223b733a33323a223066323933326233623535303132363631613530343338636561643264393634223b733a33323a223361653566643532376338643534343336613032353333373163303834366265223b733a33323a223962313436393435666132626536656236306531333561353762333864636339223b733a33323a223061363734373463616238626566346365626139393263393563616533343531223b733a33323a226334363765626536646665333033323761313564353235643565393931643562223b733a33323a223237623332623563313661636538323334613632343637333566656134303863223b733a33323a226566663937323862316233306631346637626133646161383764336330636433223b733a33323a226432303737366261316162663135393638323437346536373235616330383264223b733a33323a223337623830353834396235353539333235333263356332393561396266396438223b733a33323a223162306366343938396462343361313734343262346231613262303833623861223b733a33323a223762636461383863616134636230663333323565326562346337333564646137223b733a33323a223833363831646262623735313536616363396237313934626464333562613435223b733a33323a226264626462393537626463343436333664666263316536353133383764613032223b733a33323a223539356434336566396232346165316335333061666366356636353037616365223b733a33323a226564313264646131353730303430663632386331326331663064613138626631223b733a33323a223464303235323635616439373964373230613665613062333934373264356563223b733a33323a226563353062383033373335316432373263303830353963393832306332646364223b733a33323a226436623132353761626637653863616237363866616161373439353634303761223b733a33323a223664353361343733653132346238393931626264623938313934346135646137223b733a33323a223733356635383964613436323062326165333736316334646563643339376162223b733a33323a223630343237366632303736393462633134363632623961646265653563323738223b733a33323a226139636533306163643865643733383266643031326335316334346534643061223b733a33323a226233646139326266346338646161323536393937626133333031353161326163223b733a33323a223839336436326333303564383565666630653162343362353062303364333334223b733a33323a223836383732396436353032663366386530636264396233343963363439653163223b733a33323a223136376436323438333030363734633435383635623230393037333533383864223b733a33323a223639616634626231353034643033656333393437316331663632373838366430223b7d733a343a2268617368223b733a36353a2236396166346262313530346430336563333934373163316636323738383664302d3136376436323438333030363734633435383635623230393037333533383864223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31353a7b733a33323a223238316564343934353439326536343333376434336131323862373461623638223b733a33323a226532303839616230616434333461383132363064613937616631656361363131223b733a33323a226661396361623566623232656163653963643431313130313931653161613932223b733a33323a223861633530643962343666333137663962393236393531636235306436666634223b733a33323a226664363063616630303933396338323666666230636234326436306539326533223b733a33323a226233633434636261323131346639616566383232613233383133666231313232223b733a33323a223537653033393735353231636463613134636533383133316363643866323434223b733a33323a226639323432663639363737343638306234663337653861616366646164626631223b733a33323a226466393161623537353434396632613162623233306638303666656565623361223b733a33323a223666353837633430613262633661663738396263613761646437333236653062223b733a33323a226134306662323933613235333436306265623761323463643230383030306638223b733a33323a223263393066663730633836646332343833316466366639343132343835383364223b733a33323a226134336666356335303963613737356662613234313332356333623464336233223b733a33323a223435346664336136366433623239306430656563316336336665353332376164223b733a33323a223632383436633537633434623230653563666535303936653632363837343866223b733a33323a223832393962396361346636656565326134313838376662316431323238383739223b733a33323a223530343239333464626137303161333136323130393439323864313731613031223b733a33323a226461363961653230636338333931383233666261653562346162633134353635223b733a33323a226434323434306234346364393739313963626436356435626533653065336564223b733a33323a226561656330313334396633646466613735613938623964623537313834333739223b733a33323a223564353131376362613364356363666132376239633839626262616431323739223b733a33323a226163353038376162613231346562636332623432383835316138346434333763223b733a33323a226464643865643435663332363062623733303637363639626562633736633332223b733a33323a226638663163393031313532633535646661623430616334383538666238346663223b733a33323a223939363637363731346166326436626432306232363634333837333530356161223b733a33323a226534376338623239353934376336356332316562613261353830643664663238223b733a33323a223230633761363264623366616537666539363034653165636465393635323766223b733a33323a223930636438653533333833666662623731313263323033346266383231393539223b733a33323a223337363736336637316436653537663732393835643135303230616463323764223b733a33323a226634663364633130313266616633663865326236646433633834633539666264223b7d733a343a2268617368223b733a36353a2266346633646331303132666166336638653262366464336338346335396662642d3337363736336637316436653537663732393835643135303230616463323764223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1761039757),
('e7dqt1dshqh42sbela5sgvuoqb', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736343836323539332e3336323232323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223074306c7664656a69687336686a6f366969396e6d6837646161223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736343733303438303b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736343734303530363b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736343831333336383b7d733a35383a224c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f4d794d6f64756c655f636f6e6669677572655f63737266223b613a313a7b733a363a22455850495245223b693a313736343734303535333b7d733a35393a224c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f5374756479576869735f636f6e6669677572655f63737266223b613a313a7b733a363a22455850495245223b693a313736343831333337333b7d733a35393a224c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f7374756479576869735f636f6e6669677572655f63737266223b613a313a7b733a363a22455850495245223b693a313736343733333536313b7d7d72656469726563745f75726c7c733a34333a22687474703a2f2f6c6f63616c686f73742f6f6d6b5f746879705f32352d32365f636c6f6e652f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223130386134666238666334373638353839356365336462316337626434663234223b733a33323a223465366637373464323562626163393537326338346266366231366364303532223b7d733a343a2268617368223b733a36353a2234653666373734643235626261633935373263383462663662313663643035322d3130386134666238666334373638353839356365336462316337626434663234223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33383a7b733a33323a223936656231373732666138353031633561303239653136613836653962366463223b733a33323a226365383961356232343661626462653135376363363063323634306433623730223b733a33323a223463326334326365643765353731623537626361346232626430333236333233223b733a33323a223238663432356234326632333633636539346338313965346161646638336233223b733a33323a223334333838316462663661613131616438356634653238383437303839633165223b733a33323a223037623539313838366261666439396365616135333031636165316430303062223b733a33323a223532386139623339666531373463333130633632366536323465303931393361223b733a33323a223966316232333934326231333633373930626265356339336239386665663030223b733a33323a226162333763303065393031353538363731643330316264383461343432376261223b733a33323a223432643939386465623563366234613761643438653265646366373231326166223b733a33323a223138663534646530616533383332393863323130313333323331376164356638223b733a33323a223361393534373466326162653233366264623163326330653239613332363861223b733a33323a223166626130336363326666636631353531363661353532636661333763333032223b733a33323a226461323163373062346238666632623335396431363835336137393139373564223b733a33323a223061373536363664613765336664363562656635646264356435383735376536223b733a33323a226539323665653039613862613461626261333037363037663931353534343162223b733a33323a223632623463646439393730323837663663333964303232313530303438666537223b733a33323a223538333039343134346230356635366532656366376465333332373963666231223b733a33323a223830623137313537653431643837343761323639366663666138336336656161223b733a33323a223332636537303234363065616436613062616435613430633035396461356561223b733a33323a223435363433366663613736366639393437663532626333623232653665343635223b733a33323a223663653462353363373163656534333035306233393164653834623536306363223b733a33323a223934613234653731386563643032656665353437333066363937386639396161223b733a33323a226265326138356263373339626133666439396235616535333066623334323132223b733a33323a223930326165663562306332623335393634613134323565663832656363343337223b733a33323a223436373265636430353961643530333731643836373530343531343264303537223b733a33323a223833633336653466376163663666653631303030643432613265663133373665223b733a33323a223063666462636439613362643066303233656635383431373565326539323234223b733a33323a223164333538333962366236636437386535626331323263643262633166393635223b733a33323a223661626365313831363861373438653038306531653139336161356233636236223b733a33323a226361643866376637346635633032383962393463323434356336356261393035223b733a33323a223730383839346537653230663838343563306332653531356139333961623335223b733a33323a223862623632386537376138323461656162303732353065616633653837623965223b733a33323a223639313830333335343735393632633638613337383834626432363037633236223b733a33323a223831323435623733366231366537663030393164636361303963373038626636223b733a33323a223437383436653434323732333935663761313535373930653131653032353265223b733a33323a223037366133306537396438343535616265343731336637393735303532326361223b733a33323a223131616663623164386139636135363835643035366132326338343036626239223b733a33323a226432613331356337643738363036663130353636333938653663393734663335223b733a33323a223433343730383366616336653761646137663266356666323630353535306264223b733a33323a226362333431663431383436326332353966343831643039653363326438633733223b733a33323a223232376664303435653262343665643066363066663364653038353931346662223b733a33323a223362303834623532656637666238336439656233643634393566363932373963223b733a33323a223631313732346465373365353031616362313238313638376334353165653961223b733a33323a223838616661386465383735323831633038666130343932633237613061373662223b733a33323a223565666365383163336638336235643465313832343063306635623732656262223b733a33323a223536616663386537383137313436366330656633396135356261303234376261223b733a33323a226333373832626530323634333935396235623166373637663834333132666233223b733a33323a223237303865653563343165363461663539616431303830653631303461373339223b733a33323a226366386336363366386237316631653137343230313661356266383339613866223b733a33323a223930383261383139383164613536336265333237383636633738353335303834223b733a33323a223036343566666239386464303362316262333266376133306466376661303338223b733a33323a223939323633393262346666363633356338363037643137363563393837663535223b733a33323a226138633565646164346466643666656432666330366530373232323862393663223b733a33323a223762653330663166643934333363353736366636323732643031613561386262223b733a33323a223466346334666332303766373031386561303462316335303938366634363139223b733a33323a223263393230323131346164306634333231646537313763373666323665373861223b733a33323a223033646661316265633039623961353030646533613438633864303933383235223b733a33323a223130616361623465613464616463343038316363613666373236663837333464223b733a33323a223763613565666430343264313364376432623138363665363135333039376563223b733a33323a223335306666643466343565663062346137336666313463303233336165313032223b733a33323a226533336565376363306563336232303135386334323062366666616261323565223b733a33323a223161633637316134646231353130663130336666623634313065336133303032223b733a33323a226433363738316364343266306439646330343964343164366438303762323863223b733a33323a223232343064393263623461303231356263616238383865623336656231313064223b733a33323a223363623233323233633738376334623166336631316339303233663132393363223b733a33323a226163323261643834333966343531616561633337626166623664333835626463223b733a33323a223134616435613062626330663733633866613265356232306637633530616664223b733a33323a223936346431313337616132306238373937656437646631386662316665393636223b733a33323a223036383835353034313930646235326464333739303737613133633564626537223b733a33323a223966666237616435613463613061616630636139663566663034613564323130223b733a33323a223138383136643461393137333835373639666232616264643262386332633962223b733a33323a226163666137653636346234383436386634323535656264643134663334393435223b733a33323a223664643861636433653062616366373731663965343765643966633732336663223b733a33323a223636383234373638396135313061666330326331653465333330636361366235223b733a33323a226431353831343861656633396536346666376238343834616337363536313934223b7d733a343a2268617368223b733a36353a2264313538313438616566333965363466663762383438346163373635363139342d3636383234373638396135313061666330326331653465333330636361366235223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226435383961313864313037303965643933393164656536303137666135363861223b733a33323a226438386161353233653835363636363562336535646537353331363837316266223b733a33323a223033623934636564613436653831356236646435383864373837373636346336223b733a33323a223962393130303938636336306133366636343566326135323134663936373632223b733a33323a226562303732323763336263393361386437373734633864386231353362333064223b733a33323a226466373535393435643864663837633965613961346134373132396434613036223b733a33323a226537613237356666393161306535383733393864323732343630303137373465223b733a33323a226366323638386130313930363564383561613032333439623038373038323130223b7d733a343a2268617368223b733a36353a2263663236383861303139303635643835616130323334396230383730383231302d6537613237356666393161306535383733393864323732343630303137373465223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f4d794d6f64756c655f636f6e6669677572655f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a223664373333666538643730623534303737663139313663346436636433303161223b733a33323a226661343132356663356236623539376465323661636265306161366337653466223b733a33323a223064353634333461653439393661323138613335643430383134323636623366223b733a33323a223161636362373361333764656536643135343434383730343530343663343739223b733a33323a226163643364313431643136633761626564343033313865636161623039613931223b733a33323a226630373637663965333737376238373734653461626665326339353039336533223b733a33323a226463613161653839393666303961666166393065326663633463653530366562223b733a33323a223139336662613137303663663561353062393863323465633765663932333132223b733a33323a223933666530316432633465363239366439623433656230393066396136336338223b733a33323a226262333163333832383736663462333033396138363334373964343833306363223b733a33323a226636313461343963646164616630346265626630336537623963616535313634223b733a33323a226561623265336165386135336162323931313537306533666564343762343061223b733a33323a226566396231383930313163313636633538363263356631643234376338313430223b733a33323a226135393431393331303134326362643563363237616337366432653735353531223b733a33323a223637666662363266613230356638363063623163356239366634623232643834223b733a33323a223434653033336465663061306161366237353131366138306635376465663730223b733a33323a223263643033633234326164616362373561313039333366313031313234376262223b733a33323a226131333231663835393064326231646439343939303162336634656635656233223b7d733a343a2268617368223b733a36353a2261313332316638353930643262316464393439393031623366346566356562332d3263643033633234326164616362373561313039333366313031313234376262223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f5374756479576869735f636f6e6669677572655f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223535353965303565626161616338623138383835613062663430323937353332223b733a33323a223539626563363461643364353466336433646364363139623635643862303737223b7d733a343a2268617368223b733a36353a2235396265633634616433643534663364336463643631396236356438623037372d3535353965303565626161616338623138383835613062663430323937353332223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f7374756479576869735f636f6e6669677572655f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223734616238396664336430356662653137306534653162613061323134366630223b733a33323a226235343061323131376661666532386137323937636131616662356335626339223b733a33323a223937666366316532313062333365303663323038376335383134656539366262223b733a33323a226562616430643364616264633533366261326538336332396139333165396631223b733a33323a226563626538363835336532356437313261363636363232343263383766343331223b733a33323a223863303831636264623064393431643738353638303263633533633430653164223b733a33323a223538613935326134663935313334363834663635303430643361626234333735223b733a33323a223734376464623763616464396530316665613061666630396438646332653861223b7d733a343a2268617368223b733a36353a2237343764646237636164643965303166656130616666303964386463326538612d3538613935326134663935313334363834663635303430643361626234333735223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1764862597);

-- --------------------------------------------------------

--
-- Structure de la table `setting`
--

CREATE TABLE `setting` (
  `id` varchar(190) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"salmaalaoui572@gmail.com\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"webp\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('healthvoice_ollama_api_url', '\"http:\\/\\/localhost:11434\\/api\\/generate\"'),
('healthvoice_ollama_enabled', 'false'),
('healthvoice_ollama_language', '\"fr\"'),
('healthvoice_ollama_max_tokens', '\"500\"'),
('healthvoice_ollama_model', '\"gpt-oss:120b-cloud\"'),
('healthvoice_ollama_prompt', '\"En tant que m\\u00e9decin, analysez les sympt\\u00f4mes suivants et fournissez des recommandations m\\u00e9dicales : {transcription}\"'),
('healthvoice_ollama_temperature', '\"0.7\"'),
('installation_title', '\"Archives num\\u00e9riques\"'),
('locale', '\"\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/webp\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf,\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '25'),
('resumecours_max_upload', '\"500\"'),
('resumecours_ollama_enabled', 'true'),
('resumecours_ollama_endpoint', '\"http:\\/\\/localhost:11434\"'),
('resumecours_ollama_model', '\"gpt-oss:120b-cloud\"'),
('resumecours_response_detail', '\"normal\"'),
('resumecours_response_language', '\"fr\"'),
('studywhis_api_key', '\"EyvoWlsoMUHl2PAjyY3JYOp39okCsv9a\"'),
('studywhis_api_secret', '\"2p70aS9oqfeyRsYTbZUJFScEgBrA6eMv\"'),
('studywhis_audio_lang', '\"auto\"'),
('studywhis_max_upload', '\"500\"'),
('studywhis_ollama_enabled', 'true'),
('studywhis_ollama_endpoint', '\"http:\\/\\/localhost:11434\\/api\\/generate\"'),
('studywhis_ollama_model', '\"llama3\"'),
('studywhis_ollama_url', '\"http:\\/\\/localhost:11434\"'),
('studywhis_response_detail', '\"extensive\"'),
('studywhis_response_language', '\"fr\"'),
('studywhis_system_prompt', '\"Tu es Study-Whis, un assistant pour \\u00e9tudiants.\\nR\\u00e9sume le cours, structure les id\\u00e9es, g\\u00e9n\\u00e8re des questions d\\u2019examen.\"'),
('time_zone', '\"Europe\\/Berlin\"'),
('use_htmlpurifier', '\"1\"'),
('version', '\"4.1.1\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `homepage_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `slug` varchar(190) NOT NULL,
  `theme` varchar(190) NOT NULL,
  `title` varchar(190) NOT NULL,
  `summary` longtext DEFAULT NULL,
  `navigation` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_block_attachment`
--

CREATE TABLE `site_block_attachment` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `caption` longtext NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_item_set`
--

CREATE TABLE `site_item_set` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page`
--

CREATE TABLE `site_page` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `slug` varchar(190) NOT NULL,
  `title` varchar(190) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `layout` varchar(255) DEFAULT NULL,
  `layout_data` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page_block`
--

CREATE TABLE `site_page_block` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `layout` varchar(80) NOT NULL,
  `data` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `layout_data` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_permission`
--

CREATE TABLE `site_permission` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_setting`
--

CREATE TABLE `site_setting` (
  `id` varchar(190) NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(190) NOT NULL,
  `name` varchar(190) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) DEFAULT NULL,
  `role` varchar(190) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'salmaalaoui572@gmail.com', 'salmaalaoui572@gmail.com', '2025-10-20 14:52:51', '2025-12-09 03:53:51', '$2y$10$3ckwkjoI1hxzyWcRTXvuD.D7NmZx.ME.hNaJ70BCKx3SWmLc7XmUW', 'global_admin', 1),
(2, 'samuel.szoniecky@univ-paris8.fr', 'Samuel Szoniecky', '2025-10-21 09:22:30', '2025-12-09 03:49:43', '$2y$10$3jae1121Q0f5duQZG2SkpeX7GEOxmO2BU.Sl5KJFaBeLiKk20x.C6', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_setting`
--

CREATE TABLE `user_setting` (
  `id` varchar(190) NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `value`) VALUES
('browse_defaults_admin_item_sets', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_item_sets', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_sites', 1, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('browse_defaults_admin_sites', 2, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('columns_admin_item_sets', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_item_sets', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 1, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 2, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('default_resource_template', 1, '\"\"'),
('default_resource_template', 2, '\"\"'),
('locale', 1, '\"\"'),
('locale', 2, '\"\"');

-- --------------------------------------------------------

--
-- Structure de la table `value`
--

CREATE TABLE `value` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value_resource_id` int(11) DEFAULT NULL,
  `value_annotation_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `uri` longtext DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `value_annotation_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(1, 1, 199, NULL, NULL, 'literal', '', 'Cours IA – Séance 1', NULL, 1),
(2, 1, 200, NULL, NULL, 'literal', '', 'cours_ia_seance1.mp3', NULL, 1),
(3, 1, 203, NULL, NULL, 'literal', '', 'Salma Mamouni Alaoui', NULL, 1),
(4, 1, 202, NULL, NULL, 'literal', '', '00:42:18', NULL, 1),
(5, 1, 201, NULL, NULL, 'literal', '', '2025-10-12', NULL, 1),
(6, 2, 204, NULL, NULL, 'literal', '', 'Bonjour à tous, aujourd’hui on va parler de l’apprentissage supervisé et des différents types de modèles utilisés en intelligence artificielle.', NULL, 1),
(7, 2, 205, NULL, NULL, 'literal', '', 'Cours IA – Séance 1', NULL, 1),
(8, 3, 197, NULL, NULL, 'literal', '', 'MAMOUNI-ALAOUI SALMA', NULL, 1),
(9, 3, 198, NULL, NULL, 'literal', '', 'salma@gmail.com', NULL, 1),
(10, 1, 1, NULL, NULL, 'literal', '', 'Cours IA – Séance 1', NULL, 1),
(11, 4, 206, NULL, NULL, 'literal', '', 'Cette analyse met en évidence les thèmes principaux abordés dans le cours : apprentissage supervisé, qualité des données et performance des modèles d’IA.\n', NULL, 1),
(12, 4, 207, NULL, NULL, 'literal', '', '- Quels sont les critères de performance d’un modèle d’IA ?\n- Comment améliorer la précision de la transcription audio ?\n- Quelle est la limite de l’apprentissage supervisé ?\n', NULL, 1),
(13, 4, 208, 1, NULL, 'resource', NULL, NULL, NULL, 1),
(14, 5, 1, NULL, NULL, 'literal', NULL, 'cours test', NULL, 1),
(15, 5, 4, NULL, NULL, 'literal', NULL, 'test', NULL, 1),
(16, 5, 20, NULL, NULL, 'literal', NULL, '2025-12-09', NULL, 1),
(17, 5, 199, NULL, NULL, 'literal', NULL, 'cours test', NULL, 1),
(18, 5, 200, NULL, NULL, 'literal', NULL, 'audio.mp3', NULL, 1),
(19, 5, 201, NULL, NULL, 'literal', NULL, '2025-12-09', NULL, 1),
(20, 5, 202, NULL, NULL, 'literal', NULL, '0', NULL, 1),
(21, 5, 203, NULL, NULL, 'literal', NULL, 'Study-Whis API', NULL, 1),
(22, 6, 1, NULL, NULL, 'literal', NULL, 'Transcription - cours test', NULL, 1),
(23, 6, 204, NULL, NULL, 'literal', NULL, '[En cours...]', NULL, 1),
(24, 6, 205, 5, NULL, 'resource', NULL, NULL, NULL, 1),
(25, 7, 1, NULL, NULL, 'literal', NULL, 'Analyse - cours test', NULL, 1),
(26, 7, 206, NULL, NULL, 'literal', NULL, '[En cours...]', NULL, 1),
(27, 7, 207, NULL, NULL, 'literal', NULL, '[En cours...]', NULL, 1),
(28, 7, 208, 5, NULL, 'resource', NULL, NULL, NULL, 1),
(29, 8, 1, NULL, NULL, 'literal', NULL, 'cours test2', NULL, 1),
(30, 8, 4, NULL, NULL, 'literal', NULL, 'test2', NULL, 1),
(31, 8, 20, NULL, NULL, 'literal', NULL, '2025-12-09', NULL, 1),
(32, 8, 199, NULL, NULL, 'literal', NULL, 'cours test2', NULL, 1),
(33, 8, 200, NULL, NULL, 'literal', NULL, 'audio.mp3', NULL, 1),
(34, 8, 201, NULL, NULL, 'literal', NULL, '2025-12-09', NULL, 1),
(35, 8, 202, NULL, NULL, 'literal', NULL, '0', NULL, 1),
(36, 8, 203, NULL, NULL, 'literal', NULL, 'Study-Whis API', NULL, 1),
(37, 9, 1, NULL, NULL, 'literal', NULL, 'Transcription - cours test2', NULL, 1),
(38, 9, 204, NULL, NULL, 'literal', NULL, '[En cours...]', NULL, 1),
(39, 9, 205, 8, NULL, 'resource', NULL, NULL, NULL, 1),
(40, 10, 1, NULL, NULL, 'literal', NULL, 'Analyse - cours test2', NULL, 1),
(41, 10, 206, NULL, NULL, 'literal', NULL, '[En cours...]', NULL, 1),
(42, 10, 207, NULL, NULL, 'literal', NULL, '[En cours...]', NULL, 1),
(43, 10, 208, 8, NULL, 'resource', NULL, NULL, NULL, 1),
(44, 11, 1, NULL, NULL, 'literal', NULL, 'IA', NULL, 1),
(45, 11, 4, NULL, NULL, 'literal', NULL, 'ia', NULL, 1),
(46, 11, 20, NULL, NULL, 'literal', NULL, '2025-12-09', NULL, 1),
(47, 11, 199, NULL, NULL, 'literal', NULL, 'IA', NULL, 1),
(48, 11, 200, NULL, NULL, 'literal', NULL, 'test.m4a.m4a', NULL, 1),
(49, 11, 201, NULL, NULL, 'literal', NULL, '2025-12-09', NULL, 1),
(50, 11, 202, NULL, NULL, 'literal', NULL, '0', NULL, 1),
(51, 11, 203, NULL, NULL, 'literal', NULL, 'Study-Whis API', NULL, 1),
(52, 12, 1, NULL, NULL, 'literal', NULL, 'Transcription - IA', NULL, 1),
(53, 12, 204, NULL, NULL, 'literal', NULL, '[Traitement...]', NULL, 1),
(54, 12, 205, 11, NULL, 'resource', NULL, NULL, NULL, 1),
(55, 13, 1, NULL, NULL, 'literal', NULL, 'Analyse - IA', NULL, 1),
(56, 13, 206, NULL, NULL, 'literal', NULL, '[En cours...]', NULL, 1),
(57, 13, 207, NULL, NULL, 'literal', NULL, '[En cours...]', NULL, 1),
(58, 13, 208, 11, NULL, 'resource', NULL, NULL, NULL, 1),
(59, 14, 1, NULL, NULL, 'literal', NULL, 'IA', NULL, 1),
(60, 14, 4, NULL, NULL, 'literal', NULL, 'IA', NULL, 1),
(61, 14, 20, NULL, NULL, 'literal', NULL, '2025-12-09', NULL, 1),
(62, 14, 199, NULL, NULL, 'literal', NULL, 'IA', NULL, 1),
(63, 14, 200, NULL, NULL, 'literal', NULL, 'test.m4a.m4a', NULL, 1),
(64, 14, 201, NULL, NULL, 'literal', NULL, '2025-12-09', NULL, 1),
(65, 14, 202, NULL, NULL, 'literal', NULL, '0', NULL, 1),
(66, 14, 203, NULL, NULL, 'literal', NULL, 'Study-Whis API', NULL, 1),
(67, 15, 1, NULL, NULL, 'literal', NULL, 'Transcription - IA', NULL, 1),
(68, 15, 204, NULL, NULL, 'literal', NULL, '[Traitement...]', NULL, 1),
(69, 15, 205, 14, NULL, 'resource', NULL, NULL, NULL, 1),
(70, 16, 1, NULL, NULL, 'literal', NULL, 'Analyse - IA', NULL, 1),
(71, 16, 206, NULL, NULL, 'literal', NULL, '[En cours...]', NULL, 1),
(72, 16, 207, NULL, NULL, 'literal', NULL, '[En cours...]', NULL, 1),
(73, 16, 208, 14, NULL, 'resource', NULL, NULL, NULL, 1),
(74, 17, 1, NULL, NULL, 'literal', NULL, 'test3', NULL, 1),
(75, 17, 4, NULL, NULL, 'literal', NULL, 'test3', NULL, 1),
(76, 17, 20, NULL, NULL, 'literal', NULL, '2025-12-09', NULL, 1),
(77, 17, 199, NULL, NULL, 'literal', NULL, 'test3', NULL, 1),
(78, 17, 200, NULL, NULL, 'literal', NULL, 'test.m4a.m4a', NULL, 1),
(79, 17, 201, NULL, NULL, 'literal', NULL, '2025-12-09', NULL, 1),
(80, 17, 202, NULL, NULL, 'literal', NULL, '0', NULL, 1),
(81, 17, 203, NULL, NULL, 'literal', NULL, 'Study-Whis API', NULL, 1),
(82, 18, 1, NULL, NULL, 'literal', NULL, 'Transcription - test3', NULL, 1),
(83, 18, 204, NULL, NULL, 'literal', NULL, '[Traitement...]', NULL, 1),
(84, 18, 205, 17, NULL, 'resource', NULL, NULL, NULL, 1),
(85, 19, 1, NULL, NULL, 'literal', NULL, 'Analyse - test3', NULL, 1),
(86, 19, 206, NULL, NULL, 'literal', NULL, 'Résultat généré par llama3 (timeout)', NULL, 1),
(87, 19, 207, NULL, NULL, 'literal', NULL, 'Résultat généré par llama3 (timeout)', NULL, 1),
(88, 19, 208, 17, NULL, 'resource', NULL, NULL, NULL, 1),
(89, 20, 1, NULL, NULL, 'literal', NULL, 'Analyse - test3', NULL, 1),
(90, 20, 206, NULL, NULL, 'literal', NULL, 'Je suis ravi de vous aider ! Cependant, il me faut d\'abord avoir accès au cours que vous souhaitez que je résume. Pouvez-vous me fournir le texte du cours ou les éléments clés qu\'il contient ? J\'enverrai ensuite un résumé structuré et clair en français.\n\nSi vous avez déjà une copie de ce cours, veuillez la partager avec moi. Sinon, si vous pouvez me donner des informations sur le sujet et les principaux points abordés dans le cours, je peux essayer de créer un résumé basé sur vos indications.', NULL, 1),
(91, 20, 207, NULL, NULL, 'literal', NULL, 'Résultat généré par llama3 (timeout)', NULL, 1),
(92, 20, 208, 17, NULL, 'resource', NULL, NULL, NULL, 1),
(93, 21, 1, NULL, NULL, 'literal', NULL, 'Analyse - test3', NULL, 1),
(94, 21, 206, NULL, NULL, 'literal', NULL, 'Résultat généré par llama3 (timeout)', NULL, 1),
(95, 21, 207, NULL, NULL, 'literal', NULL, 'Voici 5 questions pédagogiques pertinentes basées sur le sujet du traitement :\n\n1. Quels sont les différents types de traitements qui existent et comment s\'articulent-ils entre eux ? (Exemple : traitement par filtration, traitement chimique, etc.)\n2. Comment peut-on mesurer l\'efficacité d\'un traitement ? Quels sont les critères à prendre en compte pour évaluer son efficacité ?\n3. Les traitements ont-ils des impacts environnementaux ? Si oui, quels sont ces impacts et comment peuvent-ils être réduits ?\n4. Comment le traitement peut-il influencer la composition chimique d\'un fluide ou d\'une substance ? Quels sont les processus physiques qui interviennent dans ce cas ?\n5. Dans le contexte de l\'environnement, quels sont les traitements qui peuvent aider à réduire les pollutions et comment fonctionnent-ils ?\n\nCes questions sont conçues pour encourager la pensée critique et stimuler l\'apprentissage en encourageant les étudiants à explorer les concepts de base du traitement et à réfléchir à leur application dans différents contextes.', NULL, 1),
(96, 21, 208, 17, NULL, 'resource', NULL, NULL, NULL, 1),
(97, 22, 1, NULL, NULL, 'literal', NULL, 'Analyse - test3', NULL, 1),
(98, 22, 206, NULL, NULL, 'literal', NULL, 'Je suis ravi de vous aider ! Cependant, il me faut d\'abord avoir accès au cours que vous souhaitez que je résume. Pouvez-vous me fournir le texte du cours ou les éléments clés qu\'il contient ? J\'enverrai ensuite un résumé structuré et clair en français.\n\nSi vous avez déjà une copie de ce cours, veuillez la partager avec moi. Sinon, si vous pouvez me donner des informations sur le sujet et les principaux points abordés dans le cours, je peux essayer de créer un résumé basé sur vos indications.', NULL, 1),
(99, 22, 207, NULL, NULL, 'literal', NULL, 'Here are 5 pedagogical questions based on the course \"Traitement\" (Treatment) in French:\n\n1. Quels sont les différents types de traitement en informatique et comment ils fonctionnent-ils pour résoudre des problèmes spécifiques?\n\n(This question assesses students\' understanding of various treatment types, such as data processing, encryption, compression, etc.)\n\n2. Comment le traitement d\'un signal numérique peut-il améliorer la qualité de l\'image ou du son dans une application audiovisuelle?\n\n(This question evaluates students\' ability to apply treatment concepts to real-world scenarios, such as image or sound processing.)\n\n3. Quels sont les avantages et les inconvénients du traitement en ligne (cloud computing) par rapport à un traitement local sur un ordinateur personnel?\n\n(This question tests students\' understanding of cloud computing and its implications for data processing.)\n\n4. Comment le traitement de données peut-il être utilisé pour détecter des tendances ou des patterns dans les grandes quantités de données ?\n\n(This question assesses students\' ability to apply treatment concepts to data analysis, such as machine learning or data mining.)\n\n5. Quels sont les principaux risques liés au traitement de données sensibles (par exemple, des informations personnelles) et comment peuvent-ils être évités ou réduits?\n\n(This question evaluates students\' understanding of the importance of data protection and privacy in treatment processes.)', NULL, 1),
(100, 22, 208, 17, NULL, 'resource', NULL, NULL, NULL, 1),
(101, 23, 1, NULL, NULL, 'literal', NULL, 'ia', NULL, 1),
(102, 23, 4, NULL, NULL, 'literal', NULL, 'ia', NULL, 1),
(103, 23, 20, NULL, NULL, 'literal', NULL, '2025-12-09', NULL, 1),
(104, 23, 199, NULL, NULL, 'literal', NULL, 'ia', NULL, 1),
(105, 23, 200, NULL, NULL, 'literal', NULL, 'test.m4a.m4a', NULL, 1),
(106, 23, 201, NULL, NULL, 'literal', NULL, '2025-12-09', NULL, 1),
(107, 23, 202, NULL, NULL, 'literal', NULL, '0', NULL, 1),
(108, 23, 203, NULL, NULL, 'literal', NULL, 'Study-Whis API', NULL, 1),
(109, 24, 1, NULL, NULL, 'literal', NULL, 'Transcription - ia', NULL, 1),
(110, 24, 204, NULL, NULL, 'literal', NULL, '[Traitement...]', NULL, 1),
(111, 24, 205, 23, NULL, 'resource', NULL, NULL, NULL, 1),
(112, 25, 1, NULL, NULL, 'literal', NULL, 'Analyse - ia', NULL, 1),
(113, 25, 206, NULL, NULL, 'literal', NULL, 'Résultat généré par gpt-oss:120b-cloud. Contenu: Résume ce cours de manière claire et structurée (en français):\n\n[Traitement...]\n\nRésumé:...', NULL, 1),
(114, 25, 207, NULL, NULL, 'literal', NULL, 'Résultat généré par gpt-oss:120b-cloud. Contenu: À partir de ce cours, génère 5 questions pédagogiques pertinentes (en français):\n\n[Traitement...]\n\nQ...', NULL, 1),
(115, 25, 208, 23, NULL, 'resource', NULL, NULL, NULL, 1),
(116, 26, 1, NULL, NULL, 'literal', NULL, 'test3', NULL, 1),
(117, 26, 4, NULL, NULL, 'literal', NULL, 'test', NULL, 1),
(118, 26, 20, NULL, NULL, 'literal', NULL, '2025-12-09', NULL, 1),
(119, 26, 199, NULL, NULL, 'literal', NULL, 'test3', NULL, 1),
(120, 26, 200, NULL, NULL, 'literal', NULL, 'test.m4a.m4a', NULL, 1),
(121, 26, 201, NULL, NULL, 'literal', NULL, '2025-12-09', NULL, 1),
(122, 26, 202, NULL, NULL, 'literal', NULL, '0', NULL, 1),
(123, 26, 203, NULL, NULL, 'literal', NULL, 'Study-Whis API', NULL, 1),
(124, 27, 1, NULL, NULL, 'literal', NULL, 'Transcription - test3', NULL, 1),
(125, 27, 204, NULL, NULL, 'literal', NULL, '[Traitement...]', NULL, 1),
(126, 27, 205, 26, NULL, 'resource', NULL, NULL, NULL, 1),
(127, 28, 1, NULL, NULL, 'literal', NULL, 'Analyse - test3', NULL, 1),
(128, 28, 206, NULL, NULL, 'literal', NULL, 'Résultat généré par gpt-oss:120b-cloud. Contenu: Résume ce cours de manière claire et structurée (en français):\n\n[Traitement...]\n\nRésumé:...', NULL, 1),
(129, 28, 207, NULL, NULL, 'literal', NULL, 'Résultat généré par gpt-oss:120b-cloud. Contenu: À partir de ce cours, génère 5 questions pédagogiques pertinentes (en français):\n\n[Traitement...]\n\nQ...', NULL, 1),
(130, 28, 208, 26, NULL, 'resource', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `value_annotation`
--

CREATE TABLE `value_annotation` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vocabulary`
--

CREATE TABLE `vocabulary` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `namespace_uri` varchar(190) NOT NULL,
  `prefix` varchar(190) NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(6, 1, 'https://studywhis.univ-paris8.fr/onto/sw#', 'sw', 'Study-Whis', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C912ED9D7E3C61F9` (`owner_id`);

--
-- Index pour la table `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`);

--
-- Index pour la table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_84D382F4BE04EA9` (`job_id`);

--
-- Index pour la table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_17B50881BE04EA9` (`job_id`),
  ADD UNIQUE KEY `UNIQ_17B508814C276F75` (`undo_job_id`);

--
-- Index pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD PRIMARY KEY (`id`,`resource`),
  ADD KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`);
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Index pour la table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1F1B251ECBE0B084` (`primary_media_id`);

--
-- Index pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD PRIMARY KEY (`item_id`,`item_set_id`),
  ADD KEY `IDX_6D0C9625126F525E` (`item_id`),
  ADD KEY `IDX_6D0C9625960278D7` (`item_set_id`);

--
-- Index pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD PRIMARY KEY (`item_id`,`site_id`),
  ADD KEY `IDX_A1734D1F126F525E` (`item_id`),
  ADD KEY `IDX_A1734D1FF6BD1646` (`site_id`);

--
-- Index pour la table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_6A2CA10C126F525E` (`item_id`),
  ADD KEY `item_position` (`item_id`,`position`);

--
-- Index pour la table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`);

--
-- Index pour la table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  ADD KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`);

--
-- Index pour la table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  ADD KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  ADD KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`),
  ADD KEY `title` (`title`(190)),
  ADD KEY `is_public` (`is_public`);

--
-- Index pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  ADD KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`);

--
-- Index pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  ADD KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  ADD KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  ADD KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`);

--
-- Index pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  ADD KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  ADD KEY `IDX_4689E2F1549213EC` (`property_id`);

--
-- Index pour la table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  ADD KEY `IDX_694309E4FDFF2E92` (`thumbnail_id`),
  ADD KEY `IDX_694309E47E3C61F9` (`owner_id`);

--
-- Index pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_236473FEE9ED820C` (`block_id`),
  ADD KEY `IDX_236473FE126F525E` (`item_id`),
  ADD KEY `IDX_236473FEEA9FDD75` (`media_id`),
  ADD KEY `block_position` (`block_id`,`position`);

--
-- Index pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  ADD KEY `IDX_D4CE134F6BD1646` (`site_id`),
  ADD KEY `IDX_D4CE134960278D7` (`item_set_id`),
  ADD KEY `position` (`position`);

--
-- Index pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  ADD KEY `is_public` (`is_public`),
  ADD KEY `IDX_2F900BD9F6BD1646` (`site_id`);

--
-- Index pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C593E731C4663E4` (`page_id`),
  ADD KEY `page_position` (`page_id`,`position`);

--
-- Index pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  ADD KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  ADD KEY `IDX_C0401D6FA76ED395` (`user_id`);

--
-- Index pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD PRIMARY KEY (`id`,`site_id`),
  ADD KEY `IDX_64D05A53F6BD1646` (`site_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD KEY `IDX_C779A692A76ED395` (`user_id`);

--
-- Index pour la table `value`
--
ALTER TABLE `value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1D7758349B66727E` (`value_annotation_id`),
  ADD KEY `IDX_1D77583489329D25` (`resource_id`),
  ADD KEY `IDX_1D775834549213EC` (`property_id`),
  ADD KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  ADD KEY `value` (`value`(190)),
  ADD KEY `uri` (`uri`(190)),
  ADD KEY `is_public` (`is_public`);

--
-- Index pour la table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  ADD UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  ADD KEY `IDX_9099C97B7E3C61F9` (`owner_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `asset`
--
ALTER TABLE `asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT pour la table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT pour la table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT pour la table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_page`
--
ALTER TABLE `site_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  ADD CONSTRAINT `FK_84D382F4BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Contraintes pour la table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  ADD CONSTRAINT `FK_17B508814C276F75` FOREIGN KEY (`undo_job_id`) REFERENCES `job` (`id`),
  ADD CONSTRAINT `FK_17B50881BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Contraintes pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1F1B251ECBE0B084` FOREIGN KEY (`primary_media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E4FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Contraintes pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Contraintes pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  ADD CONSTRAINT `FK_1D7758349B66727E` FOREIGN KEY (`value_annotation_id`) REFERENCES `value_annotation` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD CONSTRAINT `FK_C03BA4EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
