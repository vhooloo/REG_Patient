-- phpMyAdmin SQL Dump
-- version 3.4.8
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Oct 16, 2013 at 06:08 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sugarcrm`
--

-- --------------------------------------------------------

--
-- Table structure for table `reg_patient_risk`
--

CREATE TABLE IF NOT EXISTS reg_patient_risk (
  id_c 	char(36) NOT NULL,
  pid		char(36) NOT NULL,
  ort1a 	varchar(12) DEFAULT NULL,
  ort1b 	varchar(12) DEFAULT NULL,
  ort1c 	varchar(12) DEFAULT NULL,
  ort2a 	varchar(12) DEFAULT NULL,
  ort2b 	varchar(12) DEFAULT NULL,
  ort2c 	varchar(12) DEFAULT NULL,
  ort3 		varchar(12) DEFAULT NULL,
  ort4 		varchar(12) DEFAULT NULL,
  ort5a 	varchar(12) DEFAULT NULL,
  ort5b 	varchar(12) DEFAULT NULL,
  ortsum 	varchar(12) DEFAULT NULL,
  medd		varchar(12) DEFAULT NULL,
  pulmonary 	varchar(12) DEFAULT NULL,
  currentrx	varchar(12) DEFAULT NULL,
  histopioid	varchar(12) DEFAULT NULL,
  preocc	varchar(12) DEFAULT NULL,
  unstable	varchar(12) DEFAULT NULL,
  insecure	varchar(12) DEFAULT NULL,
  prioraberrant	varchar(12) DEFAULT NULL,
  ncmscore	varchar(12) DEFAULT NULL,
  finalscore	varchar(12) DEFAULT NULL,
  date_entered datetime DEFAULT NULL,
  date_modified datetime DEFAULT NULL,
  modified_user_id char(36) DEFAULT NULL,
  created_by char(36) DEFAULT NULL,
  
  PRIMARY KEY (id_c)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


