-- MySQL Script
-- 
-- Host: localhost    Database: transatlasdb
-- Model: TransAtlasDB		Version: 2.0
-- Function: TransAtlasDB Schema Script
-- 
-- ---------------------------------------------------
-- Server version	5.5.53
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
-- -----------------------------------------------------
-- Drop all tables if exists (23 tables)
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Person`;
DROP TABLE IF EXISTS `SamplePerson`;
DROP TABLE IF EXISTS `SampleOrganization`;
DROP TABLE IF EXISTS `Organization`;
DROP TABLE IF EXISTS `Material`;
DROP TABLE IF EXISTS `Organism`;
DROP TABLE IF EXISTS `Sex`;
DROP TABLE IF EXISTS `HealthStatus`;
DROP TABLE IF EXISTS `Breed`;
DROP TABLE IF EXISTS `Tissue`;
DROP TABLE IF EXISTS `DevelopmentalStage`;
DROP TABLE IF EXISTS `Animal`;
DROP TABLE IF EXISTS `AnimalStats`;
DROP TABLE IF EXISTS `Sample`;
DROP TABLE IF EXISTS `SampleStats`;
DROP TABLE IF EXISTS `MapStats`;
DROP TABLE IF EXISTS `GeneStats`;
DROP TABLE IF EXISTS `Metadata`;
DROP TABLE IF EXISTS `GenesFpkm`;
DROP TABLE IF EXISTS `IsoformsFpkm`;
DROP TABLE IF EXISTS `VarSummary`;
DROP TABLE IF EXISTS `VarResult`;
DROP TABLE IF EXISTS `VarAnno`;
-- -----------------------------------------------------
-- Table structure for table `Person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Person`;
CREATE TABLE `Person` (`personid` VARCHAR(200) NOT NULL,`lastname` TEXT NOT NULL, `middleinitial` TEXT NOT NULL, `firstname` TEXT NOT NULL, `email` TEXT NULL DEFAULT NULL, `role` TEXT NULL DEFAULT NULL, PRIMARY KEY (`personid`)) ENGINE = InnoDB DEFAULT CHARACTER SET = latin1;
-- -----------------------------------------------------
-- Table structure for table `SamplePerson`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SamplePerson`;
CREATE TABLE `SamplePerson` (`sampleid` VARCHAR(150) NOT NULL,`personid` VARCHAR(200) NOT NULL, PRIMARY KEY (`personid`, `sampleid`), CONSTRAINT `sampleperson_person_ibfk_1` FOREIGN KEY (`personid`) REFERENCES `Person` (`personid`), CONSTRAINT `sampleperson_sample_ibfk_2` FOREIGN KEY (`sampleid`) REFERENCES `Sample` (`sampleid`)) ENGINE = InnoDB DEFAULT CHARACTER SET = latin1;
-- -----------------------------------------------------
-- Table structure for table `SampleOrganization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SampleOrganization`;
CREATE TABLE `SampleOrganization` (`sampleid` VARCHAR(150) NOT NULL, `organizationname` VARCHAR(300) NOT NULL,PRIMARY KEY (`organizationname`, `sampleid`), CONSTRAINT `sampleorganization_organization_ibfk_1` FOREIGN KEY (`organizationname`) REFERENCES `Organization` (`organizationname`), CONSTRAINT `sampleorganization_sample_ibfk_2` FOREIGN KEY (`sampleid`) REFERENCES `Sample` (`sampleid`)) ENGINE = InnoDB DEFAULT CHARACTER SET = latin1;
-- -----------------------------------------------------
-- Table structure for table `Organization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Organization`;
CREATE TABLE `Organization` (`organizationname` VARCHAR(300) NOT NULL, `address` TEXT NULL DEFAULT NULL, `URL` TEXT NULL DEFAULT NULL, `role` TEXT NULL DEFAULT NULL, PRIMARY KEY (`organizationname`)) ENGINE = InnoDB DEFAULT CHARACTER SET = latin1;
-- -----------------------------------------------------
-- Table structure for table `Material`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Material`;
CREATE TABLE `Material` (`material` VARCHAR(150) NOT NULL, `termref` VARCHAR(50) NULL DEFAULT NULL, `termid` VARCHAR(100) NULL DEFAULT NULL, PRIMARY KEY (`material`)) ENGINE = InnoDB DEFAULT CHARACTER SET = latin1;
-- -----------------------------------------------------
-- Table structure for table `Organism`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Organism`;
CREATE TABLE `Organism` (`organism` VARCHAR(150) NOT NULL, `termref` VARCHAR(50) NULL DEFAULT NULL, `termid` VARCHAR(100) NULL DEFAULT NULL, PRIMARY KEY (`organism`)) ENGINE = InnoDB DEFAULT CHARACTER SET = latin1;
-- -----------------------------------------------------
-- Table structure for table `Sex`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Sex`;
CREATE TABLE `Sex` (`sex` VARCHAR(50) NOT NULL, `termref` VARCHAR(50) NULL DEFAULT NULL, `termid` VARCHAR(100) NULL DEFAULT NULL, PRIMARY KEY (`sex`)) ENGINE = InnoDB DEFAULT CHARACTER SET = latin1;
-- -----------------------------------------------------
-- Table structure for table `HealthStatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HealthStatus`;
CREATE TABLE `HealthStatus` (`health` VARCHAR(150) NOT NULL, `termref` VARCHAR(50) NULL DEFAULT NULL, `termid` VARCHAR(100) NULL DEFAULT NULL, PRIMARY KEY (`health`)) ENGINE = InnoDB DEFAULT CHARACTER SET = latin1;
-- -----------------------------------------------------
-- Table structure for table `Breed`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Breed`;
CREATE TABLE `Breed` (`breed` VARCHAR(150) NOT NULL, `termref` VARCHAR(50) NULL DEFAULT NULL, `termid` VARCHAR(100) NULL DEFAULT NULL, PRIMARY KEY (`breed`)) ENGINE = InnoDB DEFAULT CHARACTER SET = latin1;
-- -----------------------------------------------------
-- Table structure for table `Tissue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tissue`;
CREATE TABLE `Tissue` (`tissue` VARCHAR(150) NOT NULL, `termref` VARCHAR(50) NULL DEFAULT NULL, `termid` VARCHAR(100) NULL DEFAULT NULL, PRIMARY KEY (`tissue`)) ENGINE = InnoDB DEFAULT CHARACTER SET = latin1;
-- -----------------------------------------------------
-- Table structure for table `DevelopmentalStage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DevelopmentalStage`;
CREATE TABLE `DevelopmentalStage` (`developmentalstage` VARCHAR(150) NOT NULL, `termref` VARCHAR(50) NULL DEFAULT NULL, `termid` VARCHAR(100) NULL DEFAULT NULL, PRIMARY KEY (`developmentalstage`)) ENGINE = InnoDB DEFAULT CHARACTER SET = latin1;
-- -----------------------------------------------------
-- Table structure for table `Animal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Animal`;
CREATE TABLE `Animal` (`animalid` VARCHAR(150) NOT NULL, `project` VARCHAR(100) NULL DEFAULT NULL, `material` VARCHAR(150) NULL DEFAULT NULL, `organism` VARCHAR(150) NOT NULL, `sex` VARCHAR(50) NULL DEFAULT NULL, `health` VARCHAR(150) NULL DEFAULT NULL, `breed` VARCHAR(150) NULL DEFAULT NULL, `description` TEXT NULL DEFAULT NULL, PRIMARY KEY (`animalid`, `organism`), CONSTRAINT `animal_material_ibfk_1` FOREIGN KEY (`material`) REFERENCES `Material` (`material`), CONSTRAINT `animal_organism_ibfk_2` FOREIGN KEY (`organism`) REFERENCES `Organism` (`organism`), CONSTRAINT `animal_sex_ibfk_3` FOREIGN KEY (`sex`) REFERENCES `Sex` (`sex`), CONSTRAINT `animal_health_ibfk_4` FOREIGN KEY (`health`) REFERENCES `HealthStatus` (`health`), CONSTRAINT `animal_breed_ibfk_5` FOREIGN KEY (`breed`) REFERENCES `Breed` (`breed`), INDEX `animal_indx_organism` (`organism` ASC)) ENGINE = InnoDB DEFAULT CHARACTER SET = latin1;
-- -----------------------------------------------------
-- Table structure for table `AnimalStats`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AnimalStats`;
CREATE TABLE `AnimalStats` (`animalid` VARCHAR(150) NOT NULL, `birthdate` TEXT NULL DEFAULT NULL, `birthlocation` TEXT NULL DEFAULT NULL, `birthloclatitude` TEXT NULL DEFAULT NULL, `birthloclongitude` TEXT NULL DEFAULT NULL, `birthweight` TEXT NULL DEFAULT NULL, `placentalweight` TEXT NULL DEFAULT NULL, `pregnancylength` TEXT NULL DEFAULT NULL, `deliveryease` TEXT NULL DEFAULT NULL, `deliverytiming` TEXT NULL DEFAULT NULL,`pedigree` TEXT NULL DEFAULT NULL, PRIMARY KEY (`animalid`), CONSTRAINT `animalstats_ibfk_1` FOREIGN KEY (`animalid`) REFERENCES `Animal` (`animalid`)) ENGINE = InnoDB DEFAULT CHARACTER SET = latin1;
-- -----------------------------------------------------
-- Table structure for table `Sample`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Sample`;
CREATE TABLE `Sample` (`sampleid` VARCHAR(150) NOT NULL,`project` VARCHAR(100) NULL DEFAULT NULL, `material` VARCHAR(150) NULL DEFAULT NULL, `tissue` VARCHAR(150) NULL DEFAULT NULL,`derivedfrom` VARCHAR(150) NULL DEFAULT NULL,`availability` TEXT NULL DEFAULT NULL, `developmentalstage` VARCHAR(150) NULL DEFAULT NULL, `health` VARCHAR(150) NULL DEFAULT NULL, `description` TEXT NULL DEFAULT NULL,PRIMARY KEY (`sampleid`), CONSTRAINT `sample_animal_ibfk_1` FOREIGN KEY (`derivedfrom`) REFERENCES `Animal` (`animalid`), CONSTRAINT `sample_material_ibfk_2` FOREIGN KEY (`material`) REFERENCES `Material` (`material`), CONSTRAINT `sample_tissue_ibfk_3` FOREIGN KEY (`tissue`) REFERENCES `Tissue` (`tissue`), CONSTRAINT `sample_dvplstage_ibfk_4` FOREIGN KEY (`developmentalstage`) REFERENCES `DevelopmentalStage` (`developmentalstage`), CONSTRAINT `sample_health_ibfk_5` FOREIGN KEY (`health`) REFERENCES `HealthStatus` (`health`)) ENGINE = InnoDB DEFAULT CHARACTER SET = latin1;
-- -----------------------------------------------------
-- Table structure for table `SampleStats`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SampleStats`;
CREATE TABLE `SampleStats` (`sampleid` VARCHAR(150) NOT NULL, `collectionprotocol` TEXT NULL DEFAULT NULL, `collectiondate` TEXT NULL DEFAULT NULL, `ageatcollection` TEXT NULL DEFAULT NULL, `fastedstatus`	TEXT NULL DEFAULT NULL, `noofpieces` TEXT NULL DEFAULT NULL, `specimenvol` TEXT NULL DEFAULT NULL, `specimensize`	TEXT NULL DEFAULT NULL, `specimenwgt` TEXT NULL DEFAULT NULL, `specimenpictureurl` TEXT NULL DEFAULT NULL, `gestationalage` TEXT NULL DEFAULT NULL, PRIMARY KEY (`sampleid`), CONSTRAINT `samplestats_ibfk_1` FOREIGN KEY (`sampleid`) REFERENCES `Sample` (`sampleid`)) ENGINE = InnoDB DEFAULT CHARACTER SET = latin1;
-- -----------------------------------------------------
-- Table structure for table `MapStats`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MapStats`;
CREATE TABLE `MapStats` (`sampleid` VARCHAR(150) NOT NULL, `totalreads` INT(11) NULL DEFAULT NULL, `mappedreads` INT(11) NULL DEFAULT NULL, `unmappedreads` INT(11) NULL DEFAULT NULL, `infoprepreads` TEXT NULL DEFAULT NULL, `date` DATE NULL DEFAULT NULL, PRIMARY KEY (`sampleid`), CONSTRAINT `MapStats_ibfk_1` FOREIGN KEY (`sampleid`) REFERENCES `Sample` (`sampleid`)) ENGINE = InnoDB DEFAULT CHARACTER SET = latin1;
-- -----------------------------------------------------
-- Table structure for table `GeneStats`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GeneStats`;
CREATE TABLE `GeneStats` (`sampleid` VARCHAR(150) NOT NULL, `deletions` INT(11) NULL DEFAULT NULL, `insertions` INT(11) NULL DEFAULT NULL, `junctions` INT(11) NULL DEFAULT NULL, `isoforms` INT(11) NULL DEFAULT NULL, `genes` INT(11) NULL DEFAULT NULL, `date` DATE NULL DEFAULT NULL, `status` CHAR(10) NULL,PRIMARY KEY (`sampleid`), CONSTRAINT `GeneStats_ibfk_1` FOREIGN KEY (`sampleid`) REFERENCES `MapStats` (`sampleid`)) ENGINE = InnoDB DEFAULT CHARACTER SET = latin1;
-- -----------------------------------------------------
-- Table structure for table `Metadata`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Metadata`;
CREATE TABLE `Metadata` ( `sampleid` VARCHAR(150) NOT NULL, `refgenome` VARCHAR(100) NULL DEFAULT NULL, `annfile` VARCHAR(50) NULL DEFAULT NULL, `stranded` VARCHAR(100) NULL DEFAULT NULL, `sequencename` TEXT NULL DEFAULT NULL, CONSTRAINT `metadata_ibfk_1` FOREIGN KEY (`sampleid`) REFERENCES `MapStats` (`sampleid`)) ENGINE = InnoDB DEFAULT CHARACTER SET = latin1;
-- -----------------------------------------------------
-- Table structure for table `GenesFpkm`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GenesFpkm`;
CREATE TABLE `GenesFpkm` (`sampleid` VARCHAR(150) NOT NULL, `trackingid` VARCHAR(100) NOT NULL DEFAULT '', `classcode` VARCHAR(50) NULL DEFAULT NULL, `nearestrefid` VARCHAR(50) NULL DEFAULT NULL, `geneid` VARCHAR(100) NOT NULL DEFAULT '', `geneshortname` VARCHAR(250) NOT NULL DEFAULT '', `tssid` VARCHAR(100) NOT NULL DEFAULT '', `chromnumber` VARCHAR(100) NOT NULL DEFAULT '', `chromstart` INT(11) NOT NULL DEFAULT '0', `chromstop` INT(11) NOT NULL DEFAULT '0', `length` INT(11) NULL DEFAULT NULL, `coverage` DOUBLE(20,10) NULL DEFAULT NULL, `fpkm` DOUBLE(20,5) NOT NULL DEFAULT '0.00000', `fpkmconflow` DOUBLE(20,5) NOT NULL DEFAULT '0.00000', `fpkmconfhigh` DOUBLE(20,5) NOT NULL DEFAULT '0.00000', `fpkmstatus` VARCHAR(20) NULL DEFAULT NULL, INDEX `genesfpkm_indx_geneshortname` (`geneshortname` ASC), INDEX `genesfpkm_ibfk_1_idx` (`sampleid` ASC), PRIMARY KEY (`sampleid`, `trackingid`, `geneid`, `geneshortname`, `tssid`, `chromnumber`,`chromstart`,`chromstop`,`fpkm`,`fpkmconflow`,`fpkmconfhigh`), KEY `genesfpkm_indx_geneshortname_1` (`geneshortname`), CONSTRAINT `genesfpkm_ibfk_1` FOREIGN KEY (`sampleid`) REFERENCES `GeneStats` (`sampleid`)) ENGINE = InnoDB DEFAULT CHARACTER SET = latin1;
-- -----------------------------------------------------
-- Table structure for table `IsoformsFpkm`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IsoformsFpkm`;
CREATE TABLE `IsoformsFpkm` ( `sampleid` VARCHAR(150) NOT NULL, `trackingid` VARCHAR(100) NOT NULL DEFAULT '', `classcode` VARCHAR(50) NULL DEFAULT NULL, `nearestrefid` VARCHAR(50) NULL DEFAULT NULL, `geneid` VARCHAR(100) NOT NULL DEFAULT '', `geneshortname` VARCHAR(50) NOT NULL DEFAULT '', `tssid` VARCHAR(100) NOT NULL DEFAULT '', `chromnumber` VARCHAR(100) NOT NULL DEFAULT '', `chromstart` INT(11) NOT NULL DEFAULT '0', `chromstop` INT(11) NOT NULL DEFAULT '0', `length` INT(11) NULL DEFAULT NULL, `coverage` DOUBLE(20,10) NULL DEFAULT NULL, `fpkm` DOUBLE(20,5) NOT NULL DEFAULT '0.00000', `fpkmconflow` DOUBLE(20,5) NOT NULL DEFAULT '0.00000', `fpkmconfhigh` DOUBLE(20,5) NOT NULL DEFAULT '0.00000', `fpkmstatus` VARCHAR(20) NULL DEFAULT NULL, INDEX `isoformsfpkm_indx_geneshortname` (`geneshortname` ASC), INDEX `isoformsfpkm_ibfk_1_idx` (`sampleid` ASC), PRIMARY KEY (`sampleid`, `trackingid`, `geneid`, `geneshortname`, `tssid`, `chromnumber`,`chromstart`,`chromstop`,`fpkm`,`fpkmconflow`,`fpkmconfhigh`), KEY `isoformsfpkm_indx_geneshortname_1` (`geneshortname`), CONSTRAINT `isoformsfpkm_ibfk_1` FOREIGN KEY (`sampleid`) REFERENCES `GeneStats` (`sampleid`)) ENGINE = InnoDB DEFAULT CHARACTER SET = latin1;
-- -----------------------------------------------------
-- Table structure for table `VarSummary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VarSummary`;
CREATE TABLE `VarSummary` (`sampleid` VARCHAR(150) NOT NULL, `totalvariants` INT(11) NULL DEFAULT NULL, `totalsnps` INT(11) NULL DEFAULT NULL, `totalindels` INT(11) NULL DEFAULT NULL, `annversion` VARCHAR(100) NULL DEFAULT NULL, `varianttool` VARCHAR(100) NULL DEFAULT NULL, `date` DATE NOT NULL, `status` CHAR(10) NULL DEFAULT NULL, `nosql` CHAR(10) NULL DEFAULT NULL, PRIMARY KEY (`sampleid`), CONSTRAINT `varsummary_ibfk_1` FOREIGN KEY (`sampleid`) REFERENCES `MapStats` (`sampleid`)) ENGINE = InnoDB DEFAULT CHARACTER SET = latin1;
-- -----------------------------------------------------
-- Table structure for table `VarResult`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VarResult`;
CREATE TABLE `VarResult` ( `sampleid` VARCHAR(150) NOT NULL, `chrom` VARCHAR(100) NOT NULL DEFAULT '', `position` INT(11) NOT NULL DEFAULT '0', `refallele` VARCHAR(100) NULL DEFAULT NULL, `altallele` VARCHAR(100) NULL DEFAULT NULL, `quality` DOUBLE(20,5) NULL DEFAULT NULL, `variantclass` VARCHAR(100) NULL DEFAULT NULL, `zygosity` VARCHAR(100) NULL DEFAULT NULL, `dbsnpvariant` VARCHAR(100) NULL DEFAULT NULL, PRIMARY KEY (`sampleid`, `chrom`, `position`), CONSTRAINT `varresult_ibfk_1` FOREIGN KEY (`sampleid`) REFERENCES `VarSummary` (`sampleid`)) ENGINE = InnoDB DEFAULT CHARACTER SET = latin1;
-- -----------------------------------------------------
-- Table structure for table `VarAnno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VarAnno`;
CREATE TABLE `VarAnno` (`sampleid` VARCHAR(150) NOT NULL, `chrom` VARCHAR(100) NOT NULL DEFAULT '', `position` INT(11) NOT NULL DEFAULT '0', `consequence` VARCHAR(100) NOT NULL DEFAULT '', `source` VARCHAR(100) NULL DEFAULT NULL, `geneid` VARCHAR(100) NOT NULL DEFAULT '', `genename` VARCHAR(100) NULL DEFAULT NULL, `transcript` VARCHAR(250) NULL DEFAULT NULL, `feature` VARCHAR(100) NULL DEFAULT NULL, `genetype` VARCHAR(250) NULL DEFAULT NULL, `proteinposition` VARCHAR(100) NOT NULL DEFAULT '', `aachange` VARCHAR(100) NULL DEFAULT NULL, `codonchange` VARCHAR(100) NULL DEFAULT NULL, PRIMARY KEY (`consequence`, `geneid`, `proteinposition`, `sampleid`, `chrom`, `position`), INDEX `varanno_indx_genename` (`genename` ASC), CONSTRAINT `varanno_ibfk_1` FOREIGN KEY (`sampleid` , `chrom` , `position`) REFERENCES `VarResult` (`sampleid` , `chrom` , `position`)) ENGINE = InnoDB DEFAULT CHARACTER SET = latin1;
-- -----------------------------------------------------
-- procedure usp_gdtissue
-- -----------------------------------------------------
DROP procedure IF EXISTS `usp_gdtissue`;
CREATE PROCEDURE `usp_gdtissue`(in gname varchar(45), in tissue varchar(45), in specie varchar(45)) select a.geneshortname `Gene Name`, b.line `Line`, max(a.fpkm) `Maximum Fpkm`, CAST(avg(a.fpkm) AS DECIMAL(20,5)) `Average Fpkm`, min(a.fpkm) `Minimum Fpkm` from GenesFpkm a join Sample b on a.sampleid = b.sampleid where a.geneshortname like CONCAT('%', TRIM(IFNULL(gname, '')), '%') and b.tissue = tissue and b.line is not null and b.tissue is not null and b.organism = specie group by a.geneshortname, b.line order by a.geneshortname;
/* Create a stored procedure to get fpkm details of a gene based on tissue and organism */
/* call usp_genedgenedtissue("ASB6", "liver", "gallus"); */
-- -----------------------------------------------------
-- procedure usp_gdtissueless
-- -----------------------------------------------------
DROP procedure IF EXISTS `usp_gdtissueless`;
CREATE PROCEDURE `usp_gdtissueless`(in gname varchar(45), in tissue varchar(45), in specie varchar(45)) select a.geneshortname `Gene Name`, b.line `Line`, max(a.fpkm) `Maximum Fpkm`, CAST(avg(a.fpkm) AS DECIMAL(20,5)) `Average Fpkm`, min(a.fpkm) `Minimum Fpkm`  from GenesFpkm a join Sample b on a.sampleid = b.sampleid where a.geneshortname like CONCAT('%', TRIM(IFNULL(gname, '')), '%') and  b.tissue = tissue and b.organism = specie group by a.geneshortname, b.line order by a.geneshortname;
/* Create a stored procedure to get fpkm details of a gene based on tissue and organism */
/* call usp_genedgenedtissueless("usp", "lung", "mus_musculus"); */ 
-- -----------------------------------------------------
-- procedure usp_vchrom
-- -----------------------------------------------------
DROP procedure IF EXISTS `usp_vchrom`;
CREATE PROCEDURE `usp_vchrom`(in specie varchar(45), in chrom varchar(45), in vstart int(20), in vend int(20)) select c.line `Line`, a.chrom `Chrom`, a.position `Position`, a.refallele `Ref`, a.altallele `Alt`, group_concat(distinct a.variantclass) `Class`, group_concat(distinct b.consequence) `Annotation`, group_concat(distinct b.genename) `Gene Name`, group_concat(distinct a.dbsnpvariant) `dbSNP` from VarResult a join VarAnno b on a.sampleid = b.sampleid and a.chrom = b.chrom and a.position = b.position join Sample c on a.sampleid = c.sampleid where c.organism = specie  and a.chrom = chrom  and c.line is not null and a.position between vstart and vend group by a.chrom, a.position, c.line order by c.line;
/* Create a stored procedure to get variant info after specifying chromosomal location */
/* call usp_varchrom("gallus", "chr1", "57800", "60000"); */
-- -----------------------------------------------------
-- procedure usp_vchromless
-- -----------------------------------------------------
DROP procedure IF EXISTS `usp_vchromless`;
CREATE PROCEDURE `usp_vchromless`(in specie varchar(45), in chrom varchar(45), in vstart int(20), in vend int(20)) select a.chrom `Chrom`, a.position `Position`, a.refallele `Ref`, a.altallele `Alt`, group_concat(distinct a.variantclass) `Class`, group_concat(distinct b.consequence) `Annotation`, group_concat(distinct b.genename) `Gene Name`,  group_concat(distinct a.dbsnpvariant) `dbSNP` from VarResult a join VarAnno b  on a.sampleid = b.sampleid and a.chrom = b.chrom and a.position = b.position  join Sample c on a.sampleid = c.sampleid where c.organism = specie and a.chrom = chrom and a.position between vstart and vend group by a.chrom, a.position, c.line order by c.line;
/* Create a stored procedure to get variant info after specifying chromosomal location */
/* call usp_varchromless("mus_musculus", "NC_000071.6", "3200000", "3300000"); */ 
-- -----------------------------------------------------
-- procedure usp_vgene
-- -----------------------------------------------------
DROP procedure IF EXISTS `usp_vgene`;
CREATE PROCEDURE `usp_vgene`(in specie varchar(45), in gname varchar(45)) select c.line `Line`, a.chrom `Chrom`, a.position `Position`, a.refallele `Ref`, a.altallele `Alt`, group_concat(distinct a.variantclass) `Class`,group_concat(distinct b.consequence) `Annotation`, group_concat(distinct b.genename) `Gene Name`, group_concat(distinct a.dbsnpvariant) `dbSNP` from VarResult a join VarAnno b on a.sampleid = b.sampleid and a.chrom = b.chrom and a.position = b.position  join Sample c on a.sampleid = c.sampleid where c.organism = specie and b.genename like CONCAT('%', TRIM(IFNULL(gname, '')), '%')  and c.line is not null group by a.chrom, a.position, c.line order by c.line;
/* Create a stored procedure to get variant info after specifying chromosomal location */
/* call usp_vargene("gallus", "golgb1"); */ 
-- -----------------------------------------------------
-- procedure usp_vgeneless
-- -----------------------------------------------------
DROP procedure IF EXISTS `usp_vgeneless`;
CREATE PROCEDURE `usp_vgeneless`(in specie varchar(45), in gname varchar(45)) select a.chrom `Chrom`, a.position `Position`, a.refallele `Ref`, a.altallele `Alt`, group_concat(distinct a.variantclass) `Class`, group_concat(distinct b.consequence) `Annotation`, group_concat(distinct b.genename) `Gene Name`, group_concat(distinct a.dbsnpvariant) `dbSNP` from VarResult a join VarAnno b on a.sampleid = b.sampleid and a.chrom = b.chrom and a.position = b.position join Sample c on a.sampleid = c.sampleid where c.organism = specie and b.genename like CONCAT('%', TRIM(IFNULL(gname, '')), '%')  group by a.chrom, a.position, c.line order by c.line;
/* Create a stored procedure to get variant info after specifying chromosomal location */
/* call usp_vargeneless("mus_musculus", "Gm15772"); */ 
-- -----------------------------------------------------
-- View `vw_vamt`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `vw_vamt`;
DROP TABLE IF EXISTS `vw_vamt`;
CREATE TABLE `vw_vamt` (`sampleid` INT, `chrom` INT, `position` INT, `refallele` INT, `altallele` INT, `annotation` INT, `amount` INT);
DROP VIEW IF EXISTS `vw_vamt` ;
DROP TABLE IF EXISTS `vw_vamt`;
CREATE VIEW `vw_vamt` AS select `a`.`sampleid` AS `sampleid`,`a`.`chrom` AS `chrom`,`a`.`position` AS `position`,`a`.`refallele` AS `refallele`,`a`.`altallele` AS `altallele`,group_concat(distinct `b`.`consequence` separator '; ') AS `annotation`,count(0) AS `amount` from (`VarResult` `a` join `VarAnno` `b` on(((`a`.`sampleid` = `b`.`sampleid`) and (`a`.`chrom` = `b`.`chrom`) and (`a`.`position` = `b`.`position`)))) group by `a`.`sampleid`,`a`.`chrom`,`a`.`position`;
-- -----------------------------------------------------
-- View `vw_sampleinfo`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `vw_sampleinfo`;
DROP TABLE IF EXISTS `vw_sampleinfo`;
CREATE TABLE `vw_sampleinfo` (`sampleid` INT, `organism` INT, `tissue` INT, `sampleinfo` INT, `mappedreads` INT, `genes` INT, `isoforms` INT, `totalvariants` INT, `totalsnps` INT, `totalindels` INT);
DROP VIEW IF EXISTS `vw_sampleinfo` ;
DROP TABLE IF EXISTS `vw_sampleinfo`;
CREATE VIEW `vw_sampleinfo` AS select `a`.`sampleid` AS `sampleid`, `e`.`organism` AS `organism`,`a`.`tissue` AS `tissue`,`b`.`mappedreads` AS `mappedreads`,`c`.`genes` AS `genes`,`c`.`isoforms` AS `isoforms`,`d`.`totalvariants` AS `totalvariants`,`d`.`totalsnps` AS `totalsnps`,`d`.`totalindels` AS `totalindels` from ((((`Sample` `a` join `Animal` `e` on ((`a`.`derivedfrom` = `e`.`animalid`))) join `MapStats` `b` on((`a`.`sampleid` = `b`.`sampleid`))) join `GeneStats` `c` on ((`a`.`sampleid` = `b`.`sampleid`))) join `VarSummary` `d` on ((`a`.`sampleid` = `c`.`sampleid`)));
-- -----------------------------------------------------
-- View `vw_vanno`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `vw_vanno`;
DROP TABLE IF EXISTS `vw_vanno`;
CREATE TABLE `vw_vanno` (`sampleid` INT, `chrom` INT, `position` INT, `refallele` INT, `altallele` INT, `variantclass` INT, `annotation` INT, `genename` INT, `dbsnpvariant` INT);
DROP VIEW IF EXISTS `vw_vanno` ;
DROP TABLE IF EXISTS `vw_vanno`;
CREATE VIEW `vw_vanno` AS select `a`.`sampleid` AS `sampleid`,`a`.`chrom` AS `chrom`,`a`.`position` AS `position`,`a`.`refallele` AS `refallele`,`a`.`altallele` AS `altallele`,`a`.`variantclass` AS `variantclass`,group_concat(distinct ifnull(`b`.`consequence`,'none') separator '; ') AS `annotation`,ifnull(group_concat(distinct `b`.`genename` separator '; '),'none') AS `genename`,group_concat(distinct ifnull(`a`.`dbsnpvariant`,'none') separator '; ') AS `dbsnpvariant` from (`VarResult` `a` join `VarAnno` `b` on(((`a`.`sampleid` = `b`.`sampleid`) and (`a`.`chrom` = `b`.`chrom`) and (`a`.`position` = `b`.`position`)))) where (`b`.`genename` is not null) group by `a`.`sampleid`,`a`.`chrom`,`a`.`position`;
