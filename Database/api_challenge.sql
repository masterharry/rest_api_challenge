-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 15, 2020 at 01:55 PM
-- Server version: 5.7.31-0ubuntu0.18.04.1
-- PHP Version: 7.2.32-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api_challenge`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `iAdrId` int(11) NOT NULL,
  `iEmpId` int(11) NOT NULL,
  `vAddress` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`iAdrId`, `iEmpId`, `vAddress`) VALUES
(1, 1, 'Sample Address 1'),
(2, 2, 'Sample Address 1');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `iCntactId` int(11) NOT NULL,
  `iEmpId` int(11) NOT NULL,
  `vNumber` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`iCntactId`, `iEmpId`, `vNumber`) VALUES
(1, 1, '9876543210'),
(2, 2, '9876543210');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `iDeptId` int(11) NOT NULL,
  `vName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`iDeptId`, `vName`) VALUES
(1, 'Sales Department'),
(2, 'IT Department');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `iEmpId` int(11) NOT NULL,
  `iDeptId` int(11) NOT NULL,
  `vEmpUserName` varchar(100) NOT NULL,
  `vEmail` varchar(60) NOT NULL,
  `dtDateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`iEmpId`, `iDeptId`, `vEmpUserName`, `vEmail`, `dtDateCreated`) VALUES
(2, 1, 'sammy', 'sammy@gmail.com', '2020-08-15 08:21:05');

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `iKeyId` int(11) NOT NULL,
  `iUserId` int(11) NOT NULL,
  `vKey` varchar(40) NOT NULL,
  `iLevel` int(2) NOT NULL,
  `iIgnoreLimits` tinyint(1) NOT NULL DEFAULT '0',
  `iIsPrivateKey` tinyint(1) NOT NULL DEFAULT '0',
  `vIPAddresse` text,
  `dtDateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`iKeyId`, `iUserId`, `vKey`, `iLevel`, `iIgnoreLimits`, `iIsPrivateKey`, `vIPAddresse`, `dtDateCreated`) VALUES
(1, 1, 'masterpasskey', 0, 0, 0, NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `iUserId` int(11) NOT NULL,
  `vLogo` longblob NOT NULL,
  `vName` varchar(60) NOT NULL,
  `vEmail` varchar(60) NOT NULL,
  `vPassword` varchar(60) NOT NULL,
  `vNumber` varchar(40) NOT NULL,
  `eStatus` enum('D','A','L','E') NOT NULL DEFAULT 'D' COMMENT '[D]activated, [A]ctive, [L]ocked, [E]xcluded',
  `vToken` varchar(40) NOT NULL,
  `dtDateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`iUserId`, `vLogo`, `vName`, `vEmail`, `vPassword`, `vNumber`, `eStatus`, `vToken`, `dtDateCreated`) VALUES
(1, '', '', 'er.hirenmaster@gmail.com', '123456', '', 'D', 'masterpasskey', '2020-08-15 08:12:43');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `iLogId` int(11) NOT NULL,
  `vURI` varchar(255) NOT NULL,
  `vMethod` varchar(6) NOT NULL,
  `tParams` text,
  `vApiKey` varchar(40) NOT NULL,
  `vIpAddress` varchar(45) NOT NULL,
  `iTime` int(11) NOT NULL,
  `fRTime` float DEFAULT NULL,
  `vAuthorized` varchar(1) NOT NULL,
  `iResponseCode` smallint(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`iLogId`, `vURI`, `vMethod`, `tParams`, `vApiKey`, `vIpAddress`, `iTime`, `fRTime`, `vAuthorized`, `iResponseCode`) VALUES
(1, 'api/department', 'get', 'a:13:{s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Accept\";s:16:\"application/json\";s:10:\"User-Agent\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36\";s:9:\"X-Api-Key\";s:13:\"masterpasskey\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Sec-Fetch-Site\";s:11:\"same-origin\";s:14:\"Sec-Fetch-Mode\";s:4:\"cors\";s:14:\"Sec-Fetch-Dest\";s:5:\"empty\";s:7:\"Referer\";s:31:\"http://localhost/rest_api/docs/\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:15:\"Accept-Language\";s:26:\"en-GB,en-US;q=0.9,en;q=0.8\";s:6:\"Cookie\";s:68:\"PHPSESSID=5g9cic4bjlsc4emttgkp89po07; _ga=GA1.1.523300631.1586880032\";}', 'masterpasskey', '::1', 1597479330, 0.208696, '1', 200),
(2, 'api/department', 'post', 'a:16:{s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:14:\"Content-Length\";s:2:\"32\";s:6:\"Accept\";s:16:\"application/json\";s:10:\"User-Agent\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36\";s:9:\"X-Api-Key\";s:13:\"masterpasskey\";s:12:\"Content-Type\";s:16:\"application/json\";s:6:\"Origin\";s:16:\"http://localhost\";s:14:\"Sec-Fetch-Site\";s:11:\"same-origin\";s:14:\"Sec-Fetch-Mode\";s:4:\"cors\";s:14:\"Sec-Fetch-Dest\";s:5:\"empty\";s:7:\"Referer\";s:31:\"http://localhost/rest_api/docs/\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:15:\"Accept-Language\";s:26:\"en-GB,en-US;q=0.9,en;q=0.8\";s:6:\"Cookie\";s:68:\"PHPSESSID=5g9cic4bjlsc4emttgkp89po07; _ga=GA1.1.523300631.1586880032\";s:4:\"name\";s:16:\"Sales Department\";}', 'masterpasskey', '::1', 1597479501, 0.098618, '1', 0),
(3, 'api/department', 'post', 'a:16:{s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:14:\"Content-Length\";s:2:\"32\";s:6:\"Accept\";s:16:\"application/json\";s:10:\"User-Agent\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36\";s:9:\"X-Api-Key\";s:13:\"masterpasskey\";s:12:\"Content-Type\";s:16:\"application/json\";s:6:\"Origin\";s:16:\"http://localhost\";s:14:\"Sec-Fetch-Site\";s:11:\"same-origin\";s:14:\"Sec-Fetch-Mode\";s:4:\"cors\";s:14:\"Sec-Fetch-Dest\";s:5:\"empty\";s:7:\"Referer\";s:31:\"http://localhost/rest_api/docs/\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:15:\"Accept-Language\";s:26:\"en-GB,en-US;q=0.9,en;q=0.8\";s:6:\"Cookie\";s:68:\"PHPSESSID=5g9cic4bjlsc4emttgkp89po07; _ga=GA1.1.523300631.1586880032\";s:4:\"name\";s:16:\"Sales Department\";}', 'masterpasskey', '::1', 1597479518, 0.496865, '1', 200),
(4, 'api/department', 'get', 'a:13:{s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Accept\";s:16:\"application/json\";s:10:\"User-Agent\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36\";s:9:\"X-Api-Key\";s:13:\"masterpasskey\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Sec-Fetch-Site\";s:11:\"same-origin\";s:14:\"Sec-Fetch-Mode\";s:4:\"cors\";s:14:\"Sec-Fetch-Dest\";s:5:\"empty\";s:7:\"Referer\";s:31:\"http://localhost/rest_api/docs/\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:15:\"Accept-Language\";s:26:\"en-GB,en-US;q=0.9,en;q=0.8\";s:6:\"Cookie\";s:68:\"PHPSESSID=5g9cic4bjlsc4emttgkp89po07; _ga=GA1.1.523300631.1586880032\";}', 'masterpasskey', '::1', 1597479521, 0.146391, '1', 200),
(5, 'api/department', 'post', 'a:16:{s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:14:\"Content-Length\";s:2:\"29\";s:6:\"Accept\";s:16:\"application/json\";s:10:\"User-Agent\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36\";s:9:\"X-Api-Key\";s:13:\"masterpasskey\";s:12:\"Content-Type\";s:16:\"application/json\";s:6:\"Origin\";s:16:\"http://localhost\";s:14:\"Sec-Fetch-Site\";s:11:\"same-origin\";s:14:\"Sec-Fetch-Mode\";s:4:\"cors\";s:14:\"Sec-Fetch-Dest\";s:5:\"empty\";s:7:\"Referer\";s:31:\"http://localhost/rest_api/docs/\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:15:\"Accept-Language\";s:26:\"en-GB,en-US;q=0.9,en;q=0.8\";s:6:\"Cookie\";s:68:\"PHPSESSID=5g9cic4bjlsc4emttgkp89po07; _ga=GA1.1.523300631.1586880032\";s:4:\"name\";s:13:\"IT Department\";}', 'masterpasskey', '::1', 1597479528, 0.263251, '1', 200),
(6, 'api/department', 'get', 'a:13:{s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Accept\";s:16:\"application/json\";s:10:\"User-Agent\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36\";s:9:\"X-Api-Key\";s:13:\"masterpasskey\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Sec-Fetch-Site\";s:11:\"same-origin\";s:14:\"Sec-Fetch-Mode\";s:4:\"cors\";s:14:\"Sec-Fetch-Dest\";s:5:\"empty\";s:7:\"Referer\";s:31:\"http://localhost/rest_api/docs/\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:15:\"Accept-Language\";s:26:\"en-GB,en-US;q=0.9,en;q=0.8\";s:6:\"Cookie\";s:68:\"PHPSESSID=5g9cic4bjlsc4emttgkp89po07; _ga=GA1.1.523300631.1586880032\";}', 'masterpasskey', '::1', 1597479532, 0.14014, '1', 200),
(7, 'api/department', 'get', 'a:14:{s:2:\"id\";s:1:\"2\";s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Accept\";s:16:\"application/json\";s:10:\"User-Agent\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36\";s:9:\"X-Api-Key\";s:13:\"masterpasskey\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Sec-Fetch-Site\";s:11:\"same-origin\";s:14:\"Sec-Fetch-Mode\";s:4:\"cors\";s:14:\"Sec-Fetch-Dest\";s:5:\"empty\";s:7:\"Referer\";s:31:\"http://localhost/rest_api/docs/\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:15:\"Accept-Language\";s:26:\"en-GB,en-US;q=0.9,en;q=0.8\";s:6:\"Cookie\";s:68:\"PHPSESSID=5g9cic4bjlsc4emttgkp89po07; _ga=GA1.1.523300631.1586880032\";}', 'masterpasskey', '::1', 1597479535, 0.083447, '1', 200),
(8, 'api/department', 'get', 'a:13:{s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Accept\";s:16:\"application/json\";s:10:\"User-Agent\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36\";s:9:\"X-Api-Key\";s:13:\"masterpasskey\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Sec-Fetch-Site\";s:11:\"same-origin\";s:14:\"Sec-Fetch-Mode\";s:4:\"cors\";s:14:\"Sec-Fetch-Dest\";s:5:\"empty\";s:7:\"Referer\";s:31:\"http://localhost/rest_api/docs/\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:15:\"Accept-Language\";s:26:\"en-GB,en-US;q=0.9,en;q=0.8\";s:6:\"Cookie\";s:68:\"PHPSESSID=5g9cic4bjlsc4emttgkp89po07; _ga=GA1.1.523300631.1586880032\";}', 'masterpasskey', '::1', 1597479539, 0.101511, '1', 200),
(9, 'api/department', 'post', 'a:15:{s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:14:\"Content-Length\";s:1:\"0\";s:6:\"Accept\";s:16:\"application/json\";s:10:\"User-Agent\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36\";s:9:\"X-Api-Key\";s:13:\"masterpasskey\";s:12:\"Content-Type\";s:16:\"application/json\";s:6:\"Origin\";s:16:\"http://localhost\";s:14:\"Sec-Fetch-Site\";s:11:\"same-origin\";s:14:\"Sec-Fetch-Mode\";s:4:\"cors\";s:14:\"Sec-Fetch-Dest\";s:5:\"empty\";s:7:\"Referer\";s:31:\"http://localhost/rest_api/docs/\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:15:\"Accept-Language\";s:26:\"en-GB,en-US;q=0.9,en;q=0.8\";s:6:\"Cookie\";s:68:\"PHPSESSID=5g9cic4bjlsc4emttgkp89po07; _ga=GA1.1.523300631.1586880032\";}', 'masterpasskey', '::1', 1597479546, 0.105441, '1', 200),
(10, 'api/employee', 'get', 'a:13:{s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Accept\";s:16:\"application/json\";s:10:\"User-Agent\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36\";s:9:\"X-Api-Key\";s:13:\"masterpasskey\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Sec-Fetch-Site\";s:11:\"same-origin\";s:14:\"Sec-Fetch-Mode\";s:4:\"cors\";s:14:\"Sec-Fetch-Dest\";s:5:\"empty\";s:7:\"Referer\";s:31:\"http://localhost/rest_api/docs/\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:15:\"Accept-Language\";s:26:\"en-GB,en-US;q=0.9,en;q=0.8\";s:6:\"Cookie\";s:68:\"PHPSESSID=5g9cic4bjlsc4emttgkp89po07; _ga=GA1.1.523300631.1586880032\";}', 'masterpasskey', '::1', 1597479560, 0.150304, '1', 200),
(11, 'api/employee', 'post', 'a:20:{s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:14:\"Content-Length\";s:3:\"170\";s:6:\"Accept\";s:16:\"application/json\";s:10:\"User-Agent\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36\";s:9:\"X-Api-Key\";s:13:\"masterpasskey\";s:12:\"Content-Type\";s:16:\"application/json\";s:6:\"Origin\";s:16:\"http://localhost\";s:14:\"Sec-Fetch-Site\";s:11:\"same-origin\";s:14:\"Sec-Fetch-Mode\";s:4:\"cors\";s:14:\"Sec-Fetch-Dest\";s:5:\"empty\";s:7:\"Referer\";s:31:\"http://localhost/rest_api/docs/\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:15:\"Accept-Language\";s:26:\"en-GB,en-US;q=0.9,en;q=0.8\";s:6:\"Cookie\";s:68:\"PHPSESSID=5g9cic4bjlsc4emttgkp89po07; _ga=GA1.1.523300631.1586880032\";s:7:\"dept_id\";i:2;s:8:\"username\";s:5:\"hiren\";s:5:\"email\";s:24:\"er.hirenmaster@gmail.com\";s:15:\"contact_numbers\";a:1:{i:0;s:10:\"9876543210\";}s:9:\"addresses\";a:1:{i:0;s:16:\"Sample Address 1\";}}', 'masterpasskey', '::1', 1597479582, 0.372535, '1', 200),
(12, 'api/employee', 'get', 'a:13:{s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Accept\";s:16:\"application/json\";s:10:\"User-Agent\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36\";s:9:\"X-Api-Key\";s:13:\"masterpasskey\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Sec-Fetch-Site\";s:11:\"same-origin\";s:14:\"Sec-Fetch-Mode\";s:4:\"cors\";s:14:\"Sec-Fetch-Dest\";s:5:\"empty\";s:7:\"Referer\";s:31:\"http://localhost/rest_api/docs/\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:15:\"Accept-Language\";s:26:\"en-GB,en-US;q=0.9,en;q=0.8\";s:6:\"Cookie\";s:68:\"PHPSESSID=5g9cic4bjlsc4emttgkp89po07; _ga=GA1.1.523300631.1586880032\";}', 'masterpasskey', '::1', 1597479586, 0.116875, '1', 200),
(13, 'api/employee', 'post', 'a:20:{s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:14:\"Content-Length\";s:3:\"157\";s:6:\"Accept\";s:16:\"application/json\";s:10:\"User-Agent\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36\";s:9:\"X-Api-Key\";s:13:\"masterpasskey\";s:12:\"Content-Type\";s:16:\"application/json\";s:6:\"Origin\";s:16:\"http://localhost\";s:14:\"Sec-Fetch-Site\";s:11:\"same-origin\";s:14:\"Sec-Fetch-Mode\";s:4:\"cors\";s:14:\"Sec-Fetch-Dest\";s:5:\"empty\";s:7:\"Referer\";s:31:\"http://localhost/rest_api/docs/\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:15:\"Accept-Language\";s:26:\"en-GB,en-US;q=0.9,en;q=0.8\";s:6:\"Cookie\";s:68:\"PHPSESSID=5g9cic4bjlsc4emttgkp89po07; _ga=GA1.1.523300631.1586880032\";s:7:\"dept_id\";i:2;s:8:\"username\";s:3:\"sam\";s:5:\"email\";s:13:\"sam@gmail.com\";s:15:\"contact_numbers\";a:1:{i:0;s:10:\"9876543210\";}s:9:\"addresses\";a:1:{i:0;s:16:\"Sample Address 1\";}}', 'masterpasskey', '::1', 1597479597, 0.354, '1', 200),
(14, 'api/employee', 'get', 'a:13:{s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Accept\";s:16:\"application/json\";s:10:\"User-Agent\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36\";s:9:\"X-Api-Key\";s:13:\"masterpasskey\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Sec-Fetch-Site\";s:11:\"same-origin\";s:14:\"Sec-Fetch-Mode\";s:4:\"cors\";s:14:\"Sec-Fetch-Dest\";s:5:\"empty\";s:7:\"Referer\";s:31:\"http://localhost/rest_api/docs/\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:15:\"Accept-Language\";s:26:\"en-GB,en-US;q=0.9,en;q=0.8\";s:6:\"Cookie\";s:68:\"PHPSESSID=5g9cic4bjlsc4emttgkp89po07; _ga=GA1.1.523300631.1586880032\";}', 'masterpasskey', '::1', 1597479600, 0.262193, '1', 200),
(15, 'api/employee', 'get', 'a:14:{s:1:\"q\";s:3:\"sam\";s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Accept\";s:16:\"application/json\";s:10:\"User-Agent\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36\";s:9:\"X-Api-Key\";s:13:\"masterpasskey\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Sec-Fetch-Site\";s:11:\"same-origin\";s:14:\"Sec-Fetch-Mode\";s:4:\"cors\";s:14:\"Sec-Fetch-Dest\";s:5:\"empty\";s:7:\"Referer\";s:31:\"http://localhost/rest_api/docs/\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:15:\"Accept-Language\";s:26:\"en-GB,en-US;q=0.9,en;q=0.8\";s:6:\"Cookie\";s:68:\"PHPSESSID=5g9cic4bjlsc4emttgkp89po07; _ga=GA1.1.523300631.1586880032\";}', 'masterpasskey', '::1', 1597479626, 0.132958, '1', 200),
(16, 'api/employee', 'get', 'a:13:{s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Accept\";s:16:\"application/json\";s:10:\"User-Agent\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36\";s:9:\"X-Api-Key\";s:13:\"masterpasskey\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Sec-Fetch-Site\";s:11:\"same-origin\";s:14:\"Sec-Fetch-Mode\";s:4:\"cors\";s:14:\"Sec-Fetch-Dest\";s:5:\"empty\";s:7:\"Referer\";s:31:\"http://localhost/rest_api/docs/\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:15:\"Accept-Language\";s:26:\"en-GB,en-US;q=0.9,en;q=0.8\";s:6:\"Cookie\";s:68:\"PHPSESSID=5g9cic4bjlsc4emttgkp89po07; _ga=GA1.1.523300631.1586880032\";}', 'masterpasskey', '::1', 1597479630, 0.13735, '1', 200),
(17, 'api/employee', 'put', 'a:19:{s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:14:\"Content-Length\";s:2:\"82\";s:6:\"Accept\";s:16:\"application/json\";s:10:\"User-Agent\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36\";s:9:\"X-Api-Key\";s:13:\"masterpasskey\";s:12:\"Content-Type\";s:16:\"application/json\";s:6:\"Origin\";s:16:\"http://localhost\";s:14:\"Sec-Fetch-Site\";s:11:\"same-origin\";s:14:\"Sec-Fetch-Mode\";s:4:\"cors\";s:14:\"Sec-Fetch-Dest\";s:5:\"empty\";s:7:\"Referer\";s:31:\"http://localhost/rest_api/docs/\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:15:\"Accept-Language\";s:26:\"en-GB,en-US;q=0.9,en;q=0.8\";s:6:\"Cookie\";s:68:\"PHPSESSID=5g9cic4bjlsc4emttgkp89po07; _ga=GA1.1.523300631.1586880032\";s:2:\"id\";i:2;s:7:\"dept_id\";i:1;s:8:\"username\";s:5:\"sammy\";s:5:\"email\";s:15:\"sammy@gmail.com\";}', 'masterpasskey', '::1', 1597479665, 0.205805, '1', 200),
(18, 'api/employee', 'get', 'a:13:{s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Accept\";s:16:\"application/json\";s:10:\"User-Agent\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36\";s:9:\"X-Api-Key\";s:13:\"masterpasskey\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Sec-Fetch-Site\";s:11:\"same-origin\";s:14:\"Sec-Fetch-Mode\";s:4:\"cors\";s:14:\"Sec-Fetch-Dest\";s:5:\"empty\";s:7:\"Referer\";s:31:\"http://localhost/rest_api/docs/\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:15:\"Accept-Language\";s:26:\"en-GB,en-US;q=0.9,en;q=0.8\";s:6:\"Cookie\";s:68:\"PHPSESSID=5g9cic4bjlsc4emttgkp89po07; _ga=GA1.1.523300631.1586880032\";}', 'masterpasskey', '::1', 1597479671, 0.172269, '1', 200),
(19, 'api/employee', 'put', 'a:19:{s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:14:\"Content-Length\";s:2:\"82\";s:6:\"Accept\";s:16:\"application/json\";s:10:\"User-Agent\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36\";s:9:\"X-Api-Key\";s:13:\"masterpasskey\";s:12:\"Content-Type\";s:16:\"application/json\";s:6:\"Origin\";s:16:\"http://localhost\";s:14:\"Sec-Fetch-Site\";s:11:\"same-origin\";s:14:\"Sec-Fetch-Mode\";s:4:\"cors\";s:14:\"Sec-Fetch-Dest\";s:5:\"empty\";s:7:\"Referer\";s:31:\"http://localhost/rest_api/docs/\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:15:\"Accept-Language\";s:26:\"en-GB,en-US;q=0.9,en;q=0.8\";s:6:\"Cookie\";s:68:\"PHPSESSID=5g9cic4bjlsc4emttgkp89po07; _ga=GA1.1.523300631.1586880032\";s:2:\"id\";i:0;s:7:\"dept_id\";i:1;s:8:\"username\";s:5:\"sammy\";s:5:\"email\";s:15:\"sammy@gmail.com\";}', 'masterpasskey', '::1', 1597479689, 0.136298, '1', 200),
(20, 'api/employee', 'put', 'a:19:{s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:14:\"Content-Length\";s:2:\"82\";s:6:\"Accept\";s:16:\"application/json\";s:10:\"User-Agent\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36\";s:9:\"X-Api-Key\";s:13:\"masterpasskey\";s:12:\"Content-Type\";s:16:\"application/json\";s:6:\"Origin\";s:16:\"http://localhost\";s:14:\"Sec-Fetch-Site\";s:11:\"same-origin\";s:14:\"Sec-Fetch-Mode\";s:4:\"cors\";s:14:\"Sec-Fetch-Dest\";s:5:\"empty\";s:7:\"Referer\";s:31:\"http://localhost/rest_api/docs/\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:15:\"Accept-Language\";s:26:\"en-GB,en-US;q=0.9,en;q=0.8\";s:6:\"Cookie\";s:68:\"PHPSESSID=5g9cic4bjlsc4emttgkp89po07; _ga=GA1.1.523300631.1586880032\";s:2:\"id\";i:0;s:7:\"dept_id\";i:1;s:8:\"username\";s:5:\"sammy\";s:5:\"email\";s:15:\"sammy@gmail.com\";}', 'masterpasskey', '::1', 1597479725, 0.140319, '1', 200),
(21, 'api/employee', 'delete', 'a:15:{s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:14:\"Content-Length\";s:1:\"0\";s:6:\"Accept\";s:16:\"application/json\";s:10:\"User-Agent\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36\";s:9:\"X-Api-Key\";s:13:\"masterpasskey\";s:12:\"Content-Type\";s:16:\"application/json\";s:6:\"Origin\";s:16:\"http://localhost\";s:14:\"Sec-Fetch-Site\";s:11:\"same-origin\";s:14:\"Sec-Fetch-Mode\";s:4:\"cors\";s:14:\"Sec-Fetch-Dest\";s:5:\"empty\";s:7:\"Referer\";s:31:\"http://localhost/rest_api/docs/\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:15:\"Accept-Language\";s:26:\"en-GB,en-US;q=0.9,en;q=0.8\";s:6:\"Cookie\";s:68:\"PHPSESSID=5g9cic4bjlsc4emttgkp89po07; _ga=GA1.1.523300631.1586880032\";}', 'masterpasskey', '::1', 1597479738, 0.124915, '1', 200),
(22, 'api/employee', 'delete', 'a:15:{s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:14:\"Content-Length\";s:1:\"0\";s:6:\"Accept\";s:16:\"application/json\";s:10:\"User-Agent\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36\";s:9:\"X-Api-Key\";s:13:\"masterpasskey\";s:12:\"Content-Type\";s:16:\"application/json\";s:6:\"Origin\";s:16:\"http://localhost\";s:14:\"Sec-Fetch-Site\";s:11:\"same-origin\";s:14:\"Sec-Fetch-Mode\";s:4:\"cors\";s:14:\"Sec-Fetch-Dest\";s:5:\"empty\";s:7:\"Referer\";s:31:\"http://localhost/rest_api/docs/\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:15:\"Accept-Language\";s:26:\"en-GB,en-US;q=0.9,en;q=0.8\";s:6:\"Cookie\";s:68:\"PHPSESSID=5g9cic4bjlsc4emttgkp89po07; _ga=GA1.1.523300631.1586880032\";}', 'masterpasskey', '::1', 1597479756, 0.231171, '1', 200),
(23, 'api/employee', 'get', 'a:13:{s:4:\"Host\";s:9:\"localhost\";s:10:\"Connection\";s:10:\"keep-alive\";s:6:\"Accept\";s:16:\"application/json\";s:10:\"User-Agent\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36\";s:9:\"X-Api-Key\";s:13:\"masterpasskey\";s:12:\"Content-Type\";s:16:\"application/json\";s:14:\"Sec-Fetch-Site\";s:11:\"same-origin\";s:14:\"Sec-Fetch-Mode\";s:4:\"cors\";s:14:\"Sec-Fetch-Dest\";s:5:\"empty\";s:7:\"Referer\";s:31:\"http://localhost/rest_api/docs/\";s:15:\"Accept-Encoding\";s:17:\"gzip, deflate, br\";s:15:\"Accept-Language\";s:26:\"en-GB,en-US;q=0.9,en;q=0.8\";s:6:\"Cookie\";s:68:\"PHPSESSID=5g9cic4bjlsc4emttgkp89po07; _ga=GA1.1.523300631.1586880032\";}', 'masterpasskey', '::1', 1597479766, 0.14427, '1', 200);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(20200815013523);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`iAdrId`),
  ADD KEY `iAdrId` (`iAdrId`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`iCntactId`),
  ADD KEY `iCntactId` (`iCntactId`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`iDeptId`),
  ADD KEY `iDeptId` (`iDeptId`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`iEmpId`),
  ADD KEY `iEmpId` (`iEmpId`);

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`iKeyId`),
  ADD UNIQUE KEY `vKey_2` (`vKey`),
  ADD KEY `iKeyId` (`iKeyId`),
  ADD KEY `iUserId` (`iUserId`),
  ADD KEY `vKey` (`vKey`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`iUserId`),
  ADD UNIQUE KEY `vEmail_2` (`vEmail`),
  ADD UNIQUE KEY `vToken_2` (`vToken`),
  ADD KEY `iUserId` (`iUserId`),
  ADD KEY `vEmail` (`vEmail`),
  ADD KEY `vToken` (`vToken`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`iLogId`),
  ADD KEY `iLogId` (`iLogId`),
  ADD KEY `vURI` (`vURI`),
  ADD KEY `vApiKey` (`vApiKey`),
  ADD KEY `iResponseCode` (`iResponseCode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `iAdrId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `iCntactId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `iDeptId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `iEmpId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `iKeyId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `iUserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `iLogId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `keys`
--
ALTER TABLE `keys`
  ADD CONSTRAINT `keys_ibfk_1` FOREIGN KEY (`iUserId`) REFERENCES `login` (`iUserId`),
  ADD CONSTRAINT `keys_ibfk_3` FOREIGN KEY (`vKey`) REFERENCES `login` (`vToken`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
