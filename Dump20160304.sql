CREATE DATABASE  IF NOT EXISTS `dbsalonmanagement` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dbsalonmanagement`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: dbsalonmanagement
-- ------------------------------------------------------
-- Server version	5.6.25-log

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

--
-- Table structure for table `tblaccount`
--

DROP TABLE IF EXISTS `tblaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblaccount` (
  `intAccountID` int(11) NOT NULL AUTO_INCREMENT,
  `intEmpID` int(11) NOT NULL,
  `strEmpUsername` varchar(45) NOT NULL,
  `strEmpPassword` varchar(45) NOT NULL,
  `intAccountStatus` int(11) NOT NULL,
  PRIMARY KEY (`intAccountID`),
  KEY `fk_account_intEmpID_idx` (`intEmpID`),
  CONSTRAINT `fk_account_intEmpID` FOREIGN KEY (`intEmpID`) REFERENCES `tblemployee` (`intEmpID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblaccount`
--

LOCK TABLES `tblaccount` WRITE;
/*!40000 ALTER TABLE `tblaccount` DISABLE KEYS */;
INSERT INTO `tblaccount` VALUES (2,38,'NOT ASSIGNED','NOT ASSIGNED',1),(3,33,'NOT ASSIGNED','NOT ASSIGNED',0),(4,34,'NOT ASSIGNED','NOT ASSIGNED',1),(5,37,'NOT ASSIGNED','NOT ASSIGNED',1),(6,45,'NOT ASSIGNED','NOT ASSIGNED',0);
/*!40000 ALTER TABLE `tblaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblassignmentdetail`
--

DROP TABLE IF EXISTS `tblassignmentdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblassignmentdetail` (
  `intAssignmentDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `intAssignedEmployeeID` int(11) NOT NULL,
  `intAssignmentID` int(11) NOT NULL,
  `intAssignmentStatus` int(11) NOT NULL,
  `intAssignedServiceID` int(11) NOT NULL,
  PRIMARY KEY (`intAssignmentDetailID`),
  KEY `fk_intAssignedEmployee_idx` (`intAssignedEmployeeID`),
  KEY `fk_intDetailAssignmentID_idx` (`intAssignmentID`),
  KEY `fk_intAssignedServiceID_idx` (`intAssignedServiceID`),
  CONSTRAINT `fk_intAssignedEmployee` FOREIGN KEY (`intAssignedEmployeeID`) REFERENCES `tblemployee` (`intEmpID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intAssignedServiceID` FOREIGN KEY (`intAssignedServiceID`) REFERENCES `tblservice` (`intServiceID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intDetailAssignmentID` FOREIGN KEY (`intAssignmentID`) REFERENCES `tblemployeeassignment` (`intAssignmentID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblassignmentdetail`
--

LOCK TABLES `tblassignmentdetail` WRITE;
/*!40000 ALTER TABLE `tblassignmentdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblassignmentdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblattendance`
--

DROP TABLE IF EXISTS `tblattendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblattendance` (
  `intAttendanceID` int(11) NOT NULL AUTO_INCREMENT,
  `intEmployeeID` int(11) NOT NULL,
  `datAttendanceDate` date NOT NULL,
  `timTimeInAM` time NOT NULL,
  `timTimeOutAM` time NOT NULL,
  `timTimeInPM` time NOT NULL,
  `timTimeOutPM` time NOT NULL,
  PRIMARY KEY (`intAttendanceID`),
  KEY `fk_intEmployeeID_idx` (`intEmployeeID`),
  CONSTRAINT `fk_intAttendanceEmployeeID` FOREIGN KEY (`intEmployeeID`) REFERENCES `tblemployee` (`intEmpID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblattendance`
--

LOCK TABLES `tblattendance` WRITE;
/*!40000 ALTER TABLE `tblattendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblattendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcatalogue`
--

DROP TABLE IF EXISTS `tblcatalogue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcatalogue` (
  `intCatalogueID` int(11) NOT NULL AUTO_INCREMENT,
  `intServiceID` int(11) NOT NULL,
  `blobStylePhoto` longblob NOT NULL,
  PRIMARY KEY (`intCatalogueID`),
  KEY `fk_Cat_ServiceID_idx` (`intServiceID`),
  CONSTRAINT `fk_Cat_ServiceID` FOREIGN KEY (`intServiceID`) REFERENCES `tblservice` (`intServiceID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcatalogue`
--

LOCK TABLES `tblcatalogue` WRITE;
/*!40000 ALTER TABLE `tblcatalogue` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcatalogue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcustomer`
--

DROP TABLE IF EXISTS `tblcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcustomer` (
  `intCustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `strCustomerName` varchar(45) NOT NULL,
  `strCustomerType` varchar(45) NOT NULL,
  `strContactNumber` varchar(11) NOT NULL,
  PRIMARY KEY (`intCustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcustomer`
--

LOCK TABLES `tblcustomer` WRITE;
/*!40000 ALTER TABLE `tblcustomer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldiscount`
--

DROP TABLE IF EXISTS `tbldiscount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldiscount` (
  `intDiscountID` int(11) NOT NULL AUTO_INCREMENT,
  `strDiscountName` varchar(20) NOT NULL,
  `strDiscountDesc` varchar(60) NOT NULL,
  `intDiscountType` int(11) NOT NULL,
  `dblDiscountAmount` double NOT NULL,
  PRIMARY KEY (`intDiscountID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldiscount`
--

LOCK TABLES `tbldiscount` WRITE;
/*!40000 ALTER TABLE `tbldiscount` DISABLE KEYS */;
INSERT INTO `tbldiscount` VALUES (1,'Senior','For senior citizens',1,20);
/*!40000 ALTER TABLE `tbldiscount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblemployee`
--

DROP TABLE IF EXISTS `tblemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblemployee` (
  `intEmpID` int(11) NOT NULL AUTO_INCREMENT,
  `intEmpJobID` int(11) NOT NULL,
  `strEmpLastName` varchar(45) NOT NULL,
  `strEmpFirstName` varchar(45) NOT NULL,
  `strEmpMiddleName` varchar(45) DEFAULT NULL,
  `datEmpBirthDate` date NOT NULL,
  `strEmpGender` varchar(1) NOT NULL,
  `strEmpAddress` varchar(70) NOT NULL,
  `strEmpContactNo` varchar(45) NOT NULL,
  `strEmpStatus` varchar(1) NOT NULL,
  `blobEmpPhoto` longblob NOT NULL,
  PRIMARY KEY (`intEmpID`),
  KEY `fk_empJobID_idx` (`intEmpJobID`),
  CONSTRAINT `fk_empJobID` FOREIGN KEY (`intEmpJobID`) REFERENCES `tbljob` (`intJobID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblemployee`
--

LOCK TABLES `tblemployee` WRITE;
/*!40000 ALTER TABLE `tblemployee` DISABLE KEYS */;
INSERT INTO `tblemployee` VALUES (33,12,'ONGSIP','HAN AINAN','ONGSIP','1997-01-02','M','SAMPLE ADDRESS','9361144842','I','101010110'),(34,11,'BAROT','JOHN ANGELO','BAROT','1997-01-02','M','SAMPLE ADDRESS','9361144842','A','1010101'),(35,16,'CRUZ','EUNIX VHON','CORTEZ','1997-01-12','F','Sta. Mesa Manila','915230894','I','ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿ\Û\0C\0!!$-K0-**-ZBE6Kl`roi`ifx‡«x~¢fi–Ì–¢±·ÀÀÀr\Ò\áÏºŞ«½À·ÿ\Û\0C!!!-\'-W00W·{i{··················································ÿ\Ä¢\0\0\0\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùú\0\0\0\0\0\0\0	\n\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿÀ\0,\"\0ÿ\Ú\0\0\0?\0­(\Í&ihh?4Œx™¤cÒ›Wÿ\0E<\rµ*Ê­œ08ô9¬\ë(’öx\á›&$~\Ìğ\Ç8\æ‹Ï±Gm+À©kwª\àúw ’ûJ¡°X\îib£pı9¡I>CHüœ\ã9¨­ô«V¿º†U2\nÉ–?( ñÖ 5T‡K„\èM3FLş[0m\Ç9\ÅXM.\ÅR\Õdƒ/(Á;]¹õö \n\Ôğj¶“j÷wk$YDe8\É\ï\ïP&Ÿo™u<±nx\ÙÂ’Ç€z\0\Õ\ÍªJµškWŠ<B\èY\×qÁ\àc¿¹ªñD­\'•d‚{’€?uG¯¹ \rq\"“€\ÊO 43ªı\æ\êj”\ÖúlRI±GnUAI3´œ÷Ú¢µ†¥‹\ë\ÔûL½\Øg¥‘ØŒzÑš¡6™lš¤\ì>Lªÿ\0»\Üpc‘Ki¤\ÛIqt$Œ²¤P<\ë\ï@ó\ëKšÊ·\Ó\íSNy®\"\ŞÁ\Ød±\é»½J\ÚM¯ö¤qˆÈ„\Ä\ÌWq\ä‚¯½\0iJ\rfC¤\Û6£r1\"¡E\Üx\È9\ï\íUá°·»\Ó\â’ö\É\æ…rôİƒ\ßÒ€73HdP\Ø, ú\ÍbÜ¢Y\\]½1ˆa\npIù˜õ\ç\ĞU©­4ûCO\Ó9\èG©÷ \r\"\Øc\ïB°a• PsXö6\Ñ]Iq\æHn-\àm±)l®1Ÿ\ÇÒ›silö–\×P\Å\å$djH¤÷\Å\0m\æŒ\ÖIÒ­¿µDb2!òw\Ü~öq´A¥[\ëµxÉŠ=»q\ã#ô¯š+]>\Õà³–\Êù² |1\åH9jIô«e\Ôm£HÈ‰•Ë®\ã\Î1şô¯š\\\Ö±³–Køc‹l†<e~¾´\ác7\ZzD¥g?¼‘÷\à2hf–’Š.h\Í%\0¹¢’–€9ÒƒM\Í«4šF\éIšF?-\0Z±[‰n\â¬‘\É\ZYó†éŠ»~‘j:T\Ó<afƒp\Ü=W¯>•B\ĞÈ˜š	*dr2ô5b{›«¸Œ2b¾÷–[ó¨$Ñ¹ÿ\0­?ı\æÿ\0\Ğ\rG\ã\Äs¯÷ Sùş½SŠòö–50\È…gpø¨S\í\İı©]br\à\àƒ\éLP#d\áv\Ùâ‰\êõªÚŒ¾V¡¦§ûgùıj“\\^½\â\\“\0tRppA¦\Ü}¦ö\â9¥hU\â\ÆÍ \ã9\Ï4·+‹V\ßÿ\0=eUüğ*¶ª^•$cşZ8›Vmı\İ\äÁF·8\ØQL¸\Ônn\ÕQ\nª¸oœPœ\Í‰>\ŞM¹‘ı:UYae³±‚Fe\Ú\çøN3š\'¸û4ö\è\Ñys3XŒÖƒÆ·ñª9WĞŠLª/–[;\äFx\Ô\ËÓ„z*°|2ª9\Ú@ü¤óuw[&x2*’*d0\İY\'—k$rDy\Û09¿\"j2l\Õt\Şz³\ÌV¤uµpç´¡1\éY“Z\Ü\\H·\Ë¸B`±ps^i\×)w\åo{eòœH»CrGL\Ğš\×ú6Œ\êW«f®\È\á#7_İ„Ÿ\ëı+:\ê»ø\Ö+–c\r»\ä\'­+E¨IgöV{`…6³ŒPö!!š\ãûÑ†ü…g\è\naó!\ê\Z4—\èH\çùSŒ:ƒYı”½¶Â›7a³Œb-nm\î<\ËV‡5B$·Ò•À¯¼d^\\:‡3;¦vÊ­[™¢ò¬¯\Ìs‰T…`:€:\Z}½’¦m¦`Û·n#§<S5”\"=´F\ä6=ñEÀ4\ët´k\ècûªù\Ó*\rU»m½gõa,®\í\äi¡¸WšOõ¢Eù[\Ó\éŠl\ÖWÉ¶òH•\0;cˆgO¥0/N\Â\Ş\ëû±ñ¤›[\\\ÎŞw\ä*”¶ú„Ö†Ù¤¶Wi`8¥{}B[Cl\ÒZ\ì+°°\r»&’<ı&\Ğÿ\0p\çòÈ«00¹\Ù?÷K¯\ë\éT\í\í¯l£1[=±‹q+¼6@=¸¤µ¶\Ô,\áò\ã’\ÕÁ%²Á³\Í\0AdJ\ëFQ\Ò\âIPe\Æ*W½‚\rb\å\î-OOJr\é÷\Çl\ÑIš&vmÀ\í;©¦\Êü›“\æZ\æ\ã¸n01\Å\0Nu›>\í \Ç\'÷M\Ç\éWQ\ÖDWC•a}Eg=¾£#H\Å\í‘6\àsş5z\Ş#´Q’Š>¸–Š( –’–€8\Ü\ï\ÑóxR\Z\\\Õ\ZX>oQF[¾( š.,ÚŸİ·Ö¦\ÍVµ8VúÔ¤Ô±n¥\ÍEšp4~iÀ\â¢œ\r\0AqŸ0óQŠ–\á~­CÒ˜‰TÕ˜\å**šš•Zš\İU…”0ô¬\Ä+MX(\àÔ´2\àjp5O\Î\"¥Šr\ÄqJ\áb\Ø½.y¨\Ë|Ô´®;\İH[\Ò\Õ= %S\Ã\ÕP\ÜÔ„ô¦‘ ¥\ëUC`\æ¦G§q4IE( ô¤¦HR\ÒQ@¢’ŠbŠJZ\0Z3IE–’–€8\Ê)(¦X\ì\ÑIFh-±\åªl\Õ{só¥JM\"Gfš4\àhğiÀ\Ó¥€*\ï#¨ªØ«©\Ï^X\ÌoÆ€·Ò—”)ô§­0!!‡­K\Ä\r¯ù\Ô\Ş^EA\'\î²iŒ•š¬[dŒ\Õ(\ØIŒpkB%Ø¢³cE…>´\â\Õ™MiGz‘ŠÏ‚j#/OJ\ß\Ğ\Ôe\éh>©\Ğ\ç5@J\rK\Ç$SBd\å¿JrI\ïU™ñŠT~i¢®)ûjš¿½!œ«òx¦„\Ñw4Sƒ\rIL¥¤¢€–’Š\0Z)( QIE1efŠf¢\ÒQE\0>ó~-AÃŠš‘,\\Ó…34¢S¨\Å<\Z\0š3S2	i¨#<Õ•4€¦CÀÿ\00\È\ìjuTpzœ€À‚*œ±4•\Î\ÓúSWmƒŠ«3o\â¤fnı*&S»\"\Ê%¶Œµt6Ró6€(˜\Ô1–^J®\ìM‹t©p‘Œ·\'Ò¤\ã\ê)\á\nl— ô\ÅEùr\r0¸öR†Ÿ`1¤g\Í>\Ìn=)¡1‹u5+t\à\Õm\ÛI¨ş\ÑûÁ\Ï†^I9¦I&NsH®®2*	\Ü)\Í4&i\ÚMÀ¯v¬[W\Î5¯\î@hD²JZJ)ˆZZJ(h¤¥ –’–€8¬\Ò\ÓsKL\ĞZ)( !ù\ÅJX\n®iKiÉƒóO _Z˜P!\âœ)‚œ)™5eMUCVT\Ğ«JÀ2i Ó¤s¶\ÂT”ª\Ù\æ¯Mn²®q\È\ïTXl\Ê\Ò(o\Ş=h*GCN^MN¨1Ú€ Y¶uV\âå¾\\WdA\éT\æq\È\ã dG-\æœ	I1œ\â‘p§£µ*)w\æ´d\"\Ú6qW\íSpoqT@À«e`>¦¡Ì¹\×ª\ÉÁ­›˜\ng#­e:\ír9¦‰d–\Îcr„’(¸}\Ç%ºu\'©§Eh\×38Q\Ô\Ñ\Ô:f\à\n×´“’µ‘,_e¹(9QÒ®\Ú\ÉûÅ©{©šZh¥¦!\ÔRR\Ğ\ÑIš(ii)s@P¢’Še‹EP1( \Ñ\ÜS!^¢¥CSw4x§\nh§\n@Jµe:UU«)@\ÉA§\n`4\ài(\èk>\åv¹­ª×‹‚(ª\ä‘\ÍMœT!)jV!;ª»¦i\à\Ğ\Ô®b\Ô\ÉJx\0S\ã\0¸\Í$şkn\ÅjÛ ŒE°R½ª@¼ò*ˆ\àWŠÅ¾µK¼\Z\è*¦¡x	\î9 h\ÅQµ\r\\°joõ5Q†v¨­8dj=ªF\ÊZ°\ãluTv-—A\ïVµ8L–\á”d¡\éUt\ÈÙ§Fiˆ\Ú¹¦\Ò\Ğ!sKIK@E&ihii( &–’Še‹KM¥¤\0M(¤4 ò)’\Ç’¾\â¤*,|\Ëô©VN\ÑN\"Õ”ª«V# dÂ)‹SÆ¹¤±\'5Vñ¹«Œ\ÛP\Ö}\ÃdÒ¸\ìSbGjaj‘‰<TeMP†\' \Âq@”\'4XW&BjK\\4œ€j´\ÒnPA¥µ“Š\Í\Ä*‹qQÉª\"u5J\êV1§VY|Nj„t¬)\ê‡5f;”ºŒ\ã\é\\¸”cŠ\Ğ\Òd>có\Æ:R°\\Kv5uxriÀúÔŒ\ZDUV%@\çÒ“4\ì\Ò\ì\Ò\æ›E0šPi¢–€Kšn­-\0:–š)\Ô\ÄP))i”´”P0&œ\Ôu*\0±\í\Ó\Ü\ĞK¼¹>•r½=È½\ÍB\r1\"a;}i\â\ã\Õj\nZ@[[„÷…Yh\Ïñ\n\Ì4i¿Šk\Æ\Êz05eŒ\Öm½³†&´GÊ˜\'&\Äw\ë“U%9©Y\ê&5#+H0sÒ¢\İ\Ï5;{T;>cT!Jƒ\Ğ\Ôn‡ş”¹¦\"®\â¤·û\Ôò¸#ŠDŒ\Æ\Ür;UGÀ\äşBP7\Z±!-\ëQ\'¢\Ğ@dÖ¶‚(Ï©ªqZ±\äñZPC°u¤\Øc\ázÓ³M¥¨\ì\Òæ™šPhL\Ò\æ£\Í.h 4\àj0iÀ\Óù¥\Í74¹ R\ÓihŠ\Í¥¹è¦œ!sü4\Æ0\ÑRıû•!€\â\0FMY·P\É\ï*#\ïf’& \àP’\â7\Îx {\Ô\0T\Ù<÷\ÍH‘–8\Å1JúV”V Œ°\ÅX[hĞ–§˜®S*(™˜\r¦µ-\íB`¸ü*\Â\í_º\0¥.*\\®4…\È\íÒ‡Áæ˜¤“I9aŒ\Z2\0\rEÇ©4¬u¨‰)ô¦!\ÌF­D¤³ex\ì<“ŠQ…nÀSÍƒHV¤A…\ëJE1… €8\çµ3@\n\r8(¥;n0iÂ€‚§Z‰idm±@_QKŸz\ÇiO4	¤^Œjl3b—5”·²ù©WP~\ë@\ZB”\Z¢º‚ÿ\0Ô«{\ïŠ[£ëŠ…gº0©\×\ÔP”¢šÒ—4\0ñKM¥¦#3šošj:\\\Ğ\Z¡ó\r&óI°úRùm\é@®!jU]Æœ\"5b\Ş¸M\0>\Ú\ÒI9\äZÑ\İc¡5* D\0qJ@*-!1McŠöj7“*JÌ¢Pi¬sM\Ïi¤\â˜É¢\æ(\ÇN\íD\Òf¨’6\Âö\ÍV“s6`T\ÆC\ÜqM\ÜOl\nd•X\àuõ§,™8\ÅXo\à\nc[\åi€DÄƒ“Š`\à\ÅV\äâ¦ˆL	¶Œu¤\\” Š\Ô]´„S…!lP—Še\Ãb\")\ê\à\æ«\ÎÔ€¨z\Òf‚i3Lb\ÑIKH\Í.i´´\0\àO­8JÃ£\Ze-\0N·R\â\ÍJº„ƒµS\Í-\0i.¥¢¤ş\Ò_J\Ê\Í-\0TÛŠ\\t§`R•D†1F9\Í.9\äR¨ \Å\ãÖµ\" ^\0\É\ëUm\"ù³\Ğ\nµõ2e$é¥¾”ŒFj=\Õ%Zc9\'\Æ*C’8¨™†:\ÓP\ÜR¨Ñ²9\ëN\êz\Ò$}E$Æš\Ô\Ù[\'#½14\å“\Ôf™\Í7>ô\ÄZYG`:sI‘Ö«”\Ï^\ÕD’1\È9ˆ1È¦\î¤V\ÃP±Ò”|§Š7\È\ÍHZ€*´²`u¢i6\rVf,y \Ç#g­,\Î‹Ö¢”\å\Í!\Í\Ú)ˆvh\Í&h\Í!¥\Í74P\éi´P©Ù¦f—4\0\êZnh\Í\0FzÑ/¸\Í\ë\ëVHc4\èÁ4Ó’\0ªHI\È /GòG\îiY©|¢¢/¦³e&›j2Ù£v)”J‰”õ)á¹¥rdûU!28Á)\êiNhŒ\ã\èiH\Í!Œ$šRp94\Ó\ÇÒœr’;P)1JŠx¦ U\ëM`µN‰‘šlÉ…&©Ê»­*\ÓùªALC\Ğ\àbœ\Ò\í\ïQ\î–\Å!w.y\ëJ«LQS/JLhQMh	\äSœ\ásL[ƒœ0´L½©˜«‚Tn\ãñ Æ­\×\î:Z­\ÇjŒ\ÂÃµ\02Š#µ\0´¹¤¢€KM¥ ¥¤\Í.h»rNh\ë\×ùQE\è:s\ëTHo\ã¿\ĞT‘j‹œñNS\Óo\ã@\ËT,\Ç=8 ¿aA\ç­C(hzzœô\Å\\œw­++usó\nC*ˆıN½€Wny¥se˜‰NHVT(fn8­P‚8S#\'=)\Ø#¨­h‘v”öE#†`»S Á\ïW\îl\ÒE;WkúŠ\È%’M\ÃM!6iŒS\Ö©±Ñ†ö©•\éˆb¢–<©>j) y\Ç!ô\ä4—N\ÇÚ¢\ßLDŒô‹\É\ÍE¾¤…²q@\np\éS\Ç=j\Üp/¥KE\\Í™JD& \Ôt\í[“Ú‰¡(8÷¬GFˆ²Aš“€h:Ÿ”ñH9Py\è?\Zv:\Üÿ\0xT\É*?z¦G÷G\Í\0v\\\Ò\å\Ë\Æ5n TMl;T	+«|¤\àz\Ô\Ëv?ˆR³\È\Úi„c­]Y\ÇR˜Õ½\é\\\n\"–¬µ°\í\ÅD`a\ïLQš0GZ(\0\Î[;~”€`ƒ\ßŞ§¾Gµ.}OÒ¨‘\ìOé§§©\Üƒ\×\éIŒ@ü)€¨üóR–\0d~]½şP*l2\Ì/º@¾¦ºeU@\0\í\\´PsŞºiø=iXw/\Z©5š¹/\nÿ\0Î§ó÷\Å$o•ç¨ Fqœ\Çû¶aÁ¦}®a)Q\Ó5kP·&ñòº­b‰Ì™ü\Ô\rq\Êd_˜j\Ì\Õ`¯c\ÍB²H?‹:[­ğ2±\Îi eû\İj™\ëV¾\Î(±@¶\É\Çj²p(M¡#¡ª— \Åc\ĞV£b³õ÷ZÉü4€Í¸“\ëM\Íb¨‘:ÓƒA£¿˜ fÍ±\İ5r:Ëµ¸\\=j\ìrn8Ë Ÿ¥C=¬\ãx\äwƒ&\Øòy¡J‘“H\Ë\Ë1nÊ€\ÕN§<[7(’[²x\È\Íb\à÷?…1\'?L\Òõ\Ïe¤l÷©2H(@\É8\È61…Á„\ç\î\äS˜\ã€F(\0Á4õ™Ñ°4\Ì\ãƒÔ˜# \ãŸz,µ»†*Âº8\àŠ\ÎÚªœòH\ã„\ç6\Í\Z·aMû2\ÕD¹t$‘\ëS-ğ\Ç*sJÃ¹\\\É\' \ïJw\0\Ş;L\Îzÿ\0:^¸ÛSVH¡KÈ¡¹\É#\éÚ[$ò½–\ÆF?J\0k}sô¦”#ƒRŒt>\Ôc\róZ`BPö«vT`œqŒ\ÓztÎ¢•\0RG§z@Xü¡É—>‚§:¹R8­-LøFÁÀÏ—8úT\Z–\ë »ıi\å7\Õü\Äe\ë7x†\ä\×^¢=B\Ş\å%…>I\Z>\ê¬@\Â*N|–ş´\æÄ¸ş#N‹cÌ¢I¦y5\Ö<\Â\ÛL‚MŠ\Ù0}ğ*\ÛX“T°•QU‹²¶^(©©\ØF€…Àã¡¤mZ\Çş~\äÂ¬\Ëj±\áF\Z6F\ãñÖª\Û\ßõ©¬ü D’İŸ(\íøP.§d\Ä´ı\r%\å\å¼A¢’Ui\Ú\İ\Ãk(\á\Ér\ä\ãh\Ïÿ\0Z—F\Ã\\Ş“ƒ\Ê\è4\æ7.z\Ò\îQüY®Ám\ÔjòMƒ\nòÂ£WûvÓş­\éˆ\ä÷)<R\îLrß…o\ë÷\Æ$’\Ğ[\åYAó=9ú{V¥¢$6vÑ7ô¢\àq”\ç<w\Æ1\Ô\Z\Ú\Ó\"\ë·\ê@\ÇQøœÿ\0Z¹ij ¾½!F\Ù\n¸üA\Ï\ëEÀç† \î¥@\'\Ó4£P8\Ø¡­-L:›m\Z´\ì±ı\ã“Tu«\Ë[Ä‹\Êÿ\0„o˜ G4‡s=\ï[‘ŸÊ¡IQI\'Ò·ü6¿º¹C\åRh÷¢y¥´1\ån;½~jb9\Ó\"»}\ïÒe\Éü+G]¼3\ÎÖ‰K†İ¼õ\ë;$ ~´\0}ßº\Ù\'Ò†\àu\ë\Ô\Ò8\Ç\ÍJK=(\0ÀÉ¥\äqH¸\'‘ŸÆ•²Nr:\ã€\0t)¡ˆ,98 ¨1\ÇJ62xö B¾\0Â‚Ö“\r\ëúÒªòX\ãÆšNO¥0\İ0 ?:R\ägo\'Ş„n\ä\äı(“š]\ä.ü…IŸlP@Ûº\r ¨Aœş\Ë.=(À0ß\0.zdœ\ĞóŒ€Nz\Ôrİ·¥?\æs\ÇaC#\ß\å##¹©ÿ\0È´¿\îGı*`Ow¹\Ç\çT\æÔ¦»\Ó~\Ë\ä\"¨\n7\ïô\ÇøSl¯\äÓ¦”\Ç—\Ì\ÇV\Æ1H\r\Í;\î^ÿ\0\×Ä•Z/ùıqo\ëU$\×\î6H\àŠ2ÀÛ³Šu9WKû¸(S~ú\0×¼ÿ\04X¿˜©o\Ïúu‡ıu?ú	¬Èµ\Ù\Ö$ŒZ#P3¿Ò«Í¬O=\ä“’D`÷>¦€:D™dX¿Š<\ÌVø«ÿ\0lÿ\0\è\ë¥ü—\"ù\Ğ!MşóU\ÒöAª›\ï-s’vnö\ÇZ\0¿®M\ä\êh@\Î`\Æ?\Z“Ã„±»\'®Wù\ZË¿½{û¥•FU6\à6sŞ¤\Óõ\Ó|İ‘¬¾a–\Æ(x\\gK^\íµP)³ÿ\0\Èv\Óş¹½aÿ\0iL–Q[˜—j8|\î\ë†\Î*f\Ö%’ò+¯!J\í\ß\×4g]¼•¦û\Ær\Ës¿ıjÖ–k‹gF\"\'p=ò1X\âd]¦\ÑrHş?CQ\\kOo7\ÙÂˆ‰8\İ÷³@\ZğÇ³\Äûğ«~¸ş•n	–xKVSõ\Ïÿ\0oKöŸ<[&vl\Æÿ\0|\Ôvš\ÌÖ¢P WH\În™\í@4±ue§›µ•\Ü\åš\"x8\à\Ô\Úü1=œwj¸|„©\ìk:\ÇVš\Æ	&ˆó´œc=ioµ)µEx–8”\çh9\Éú\Ğ†¿\Õ\\ÿ\0¾?•A ÿ\0\È^ó\è\ßúV\Óõ)l¡ `ylb¢²¿’\Æ\îY– \í.r»±s@­Ÿ\í{¢GA\ì*º¸_\á ‘\ÆsW—V–9n˜À¹¸\ÆFÿ\0»\Æ*+\Ë\Ù/c·W„F±»ºñ\éL\n n=@4rx\0}jHvùŸ0ùI\çµ\\+h\0\Ã½×Ÿó\Å\0P—¡§#LaKu\ÏZ½¶È‘ó6	\ï)qe“÷±:\Ğzw\'#süY«Š°ó’§“\ÜúqN˜Zˆ”\Ä\É\ès@\Ã+e½iDNyõ¦[4\ã†9\İÖ˜2”\è{S%¶ŒE€v\0´\Õ²sÈ¢Š`9T¹9=9¤H÷g½P7\ÊÌ£µ:5ó,O4Q@\Øv\Æ1\ë\Í!\Ú:s\×4QHh\Õ0H\Í P1\çÚŠ(\İû†\0À4…”.6òG\\\ÑE1‚’q\íN\Î\æŠ(§ \0\nTmªH#ÚŠ(Ÿ4˜\É\Îx\æ”\å\å\âŠ(›™A*yõ§\'-“\Î=h¢€\ZÄ·Ò¤Dı\É\É4QHGe\É&\ä°<\ÑE0\×`^O\"šg“E\0Ÿy±Nl)Áô\ÍPd&23\Í=G\Ú&\nxÒŠ)l„À#ŸZ@\Ø3õ¢Š`\'¿¯4\ç\ê1À=¨¢€\00=iBo\É>´Q@ÿ\Ù'),(36,16,'SANTOS','JEFFREY','KING','1997-02-03','M','asdfasdf','325654','A','ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿ\Û\0C\0!!$-K0-**-ZBE6Kl`roi`ifx‡«x~¢fi–Ì–¢±·ÀÀÀr\Ò\áÏºŞ«½À·ÿ\Û\0C!!!-\'-W00W·{i{··················································ÿ\Ä¢\0\0\0\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùú\0\0\0\0\0\0\0	\n\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿÀ\0,\"\0ÿ\Ú\0\0\0?\0­(\Í&ihh?4Œx™¤cÒ›Wÿ\0E<\rµ*Ê­œ08ô9¬\ë(’öx\á›&$~\Ìğ\Ç8\æ‹Ï±Gm+À©kwª\àúw ’ûJ¡°X\îib£pı9¡I>CHüœ\ã9¨­ô«V¿º†U2\nÉ–?( ñÖ 5T‡K„\èM3FLş[0m\Ç9\ÅXM.\ÅR\Õdƒ/(Á;]¹õö \n\Ôğj¶“j÷wk$YDe8\É\ï\ïP&Ÿo™u<±nx\ÙÂ’Ç€z\0\Õ\ÍªJµškWŠ<B\èY\×qÁ\àc¿¹ªñD­\'•d‚{’€?uG¯¹ \rq\"“€\ÊO 43ªı\æ\êj”\ÖúlRI±GnUAI3´œ÷Ú¢µ†¥‹\ë\ÔûL½\Øg¥‘ØŒzÑš¡6™lš¤\ì>Lªÿ\0»\Üpc‘Ki¤\ÛIqt$Œ²¤P<\ë\ï@ó\ëKšÊ·\Ó\íSNy®\"\ŞÁ\Ød±\é»½J\ÚM¯ö¤qˆÈ„\Ä\ÌWq\ä‚¯½\0iJ\rfC¤\Û6£r1\"¡E\Üx\È9\ï\íUá°·»\Ó\â’ö\É\æ…rôİƒ\ßÒ€73HdP\Ø, ú\ÍbÜ¢Y\\]½1ˆa\npIù˜õ\ç\ĞU©­4ûCO\Ó9\èG©÷ \r\"\Øc\ïB°a• PsXö6\Ñ]Iq\æHn-\àm±)l®1Ÿ\ÇÒ›silö–\×P\Å\å$djH¤÷\Å\0m\æŒ\ÖIÒ­¿µDb2!òw\Ü~öq´A¥[\ëµxÉŠ=»q\ã#ô¯š+]>\Õà³–\Êù² |1\åH9jIô«e\Ôm£HÈ‰•Ë®\ã\Î1şô¯š\\\Ö±³–Køc‹l†<e~¾´\ác7\ZzD¥g?¼‘÷\à2hf–’Š.h\Í%\0¹¢’–€9ÒƒM\Í«4šF\éIšF?-\0Z±[‰n\â¬‘\É\ZYó†éŠ»~‘j:T\Ó<afƒp\Ü=W¯>•B\ĞÈ˜š	*dr2ô5b{›«¸Œ2b¾÷–[ó¨$Ñ¹ÿ\0­?ı\æÿ\0\Ğ\rG\ã\Äs¯÷ Sùş½SŠòö–50\È…gpø¨S\í\İı©]br\à\àƒ\éLP#d\áv\Ùâ‰\êõªÚŒ¾V¡¦§ûgùıj“\\^½\â\\“\0tRppA¦\Ü}¦ö\â9¥hU\â\ÆÍ \ã9\Ï4·+‹V\ßÿ\0=eUüğ*¶ª^•$cşZ8›Vmı\İ\äÁF·8\ØQL¸\Ônn\ÕQ\nª¸oœPœ\Í‰>\ŞM¹‘ı:UYae³±‚Fe\Ú\çøN3š\'¸û4ö\è\Ñys3XŒÖƒÆ·ñª9WĞŠLª/–[;\äFx\Ô\ËÓ„z*°|2ª9\Ú@ü¤óuw[&x2*’*d0\İY\'—k$rDy\Û09¿\"j2l\Õt\Şz³\ÌV¤uµpç´¡1\éY“Z\Ü\\H·\Ë¸B`±ps^i\×)w\åo{eòœH»CrGL\Ğš\×ú6Œ\êW«f®\È\á#7_İ„Ÿ\ëı+:\ê»ø\Ö+–c\r»\ä\'­+E¨IgöV{`…6³ŒPö!!š\ãûÑ†ü…g\è\naó!\ê\Z4—\èH\çùSŒ:ƒYı”½¶Â›7a³Œb-nm\î<\ËV‡5B$·Ò•À¯¼d^\\:‡3;¦vÊ­[™¢ò¬¯\Ìs‰T…`:€:\Z}½’¦m¦`Û·n#§<S5”\"=´F\ä6=ñEÀ4\ët´k\ècûªù\Ó*\rU»m½gõa,®\í\äi¡¸WšOõ¢Eù[\Ó\éŠl\ÖWÉ¶òH•\0;cˆgO¥0/N\Â\Ş\ëû±ñ¤›[\\\ÎŞw\ä*”¶ú„Ö†Ù¤¶Wi`8¥{}B[Cl\ÒZ\ì+°°\r»&’<ı&\Ğÿ\0p\çòÈ«00¹\Ù?÷K¯\ë\éT\í\í¯l£1[=±‹q+¼6@=¸¤µ¶\Ô,\áò\ã’\ÕÁ%²Á³\Í\0AdJ\ëFQ\Ò\âIPe\Æ*W½‚\rb\å\î-OOJr\é÷\Çl\ÑIš&vmÀ\í;©¦\Êü›“\æZ\æ\ã¸n01\Å\0Nu›>\í \Ç\'÷M\Ç\éWQ\ÖDWC•a}Eg=¾£#H\Å\í‘6\àsş5z\Ş#´Q’Š>¸–Š( –’–€8\Ü\ï\ÑóxR\Z\\\Õ\ZX>oQF[¾( š.,ÚŸİ·Ö¦\ÍVµ8VúÔ¤Ô±n¥\ÍEšp4~iÀ\â¢œ\r\0AqŸ0óQŠ–\á~­CÒ˜‰TÕ˜\å**šš•Zš\İU…”0ô¬\Ä+MX(\àÔ´2\àjp5O\Î\"¥Šr\ÄqJ\áb\Ø½.y¨\Ë|Ô´®;\İH[\Ò\Õ= %S\Ã\ÕP\ÜÔ„ô¦‘ ¥\ëUC`\æ¦G§q4IE( ô¤¦HR\ÒQ@¢’ŠbŠJZ\0Z3IE–’–€8\Ê)(¦X\ì\ÑIFh-±\åªl\Õ{só¥JM\"Gfš4\àhğiÀ\Ó¥€*\ï#¨ªØ«©\Ï^X\ÌoÆ€·Ò—”)ô§­0!!‡­K\Ä\r¯ù\Ô\Ş^EA\'\î²iŒ•š¬[dŒ\Õ(\ØIŒpkB%Ø¢³cE…>´\â\Õ™MiGz‘ŠÏ‚j#/OJ\ß\Ğ\Ôe\éh>©\Ğ\ç5@J\rK\Ç$SBd\å¿JrI\ïU™ñŠT~i¢®)ûjš¿½!œ«òx¦„\Ñw4Sƒ\rIL¥¤¢€–’Š\0Z)( QIE1efŠf¢\ÒQE\0>ó~-AÃŠš‘,\\Ó…34¢S¨\Å<\Z\0š3S2	i¨#<Õ•4€¦CÀÿ\00\È\ìjuTpzœ€À‚*œ±4•\Î\ÓúSWmƒŠ«3o\â¤fnı*&S»\"\Ê%¶Œµt6Ró6€(˜\Ô1–^J®\ìM‹t©p‘Œ·\'Ò¤\ã\ê)\á\nl— ô\ÅEùr\r0¸öR†Ÿ`1¤g\Í>\Ìn=)¡1‹u5+t\à\Õm\ÛI¨ş\ÑûÁ\Ï†^I9¦I&NsH®®2*	\Ü)\Í4&i\ÚMÀ¯v¬[W\Î5¯\î@hD²JZJ)ˆZZJ(h¤¥ –’–€8¬\Ò\ÓsKL\ĞZ)( !ù\ÅJX\n®iKiÉƒóO _Z˜P!\âœ)‚œ)™5eMUCVT\Ğ«JÀ2i Ó¤s¶\ÂT”ª\Ù\æ¯Mn²®q\È\ïTXl\Ê\Ò(o\Ş=h*GCN^MN¨1Ú€ Y¶uV\âå¾\\WdA\éT\æq\È\ã dG-\æœ	I1œ\â‘p§£µ*)w\æ´d\"\Ú6qW\íSpoqT@À«e`>¦¡Ì¹\×ª\ÉÁ­›˜\ng#­e:\ír9¦‰d–\Îcr„’(¸}\Ç%ºu\'©§Eh\×38Q\Ô\Ñ\Ô:f\à\n×´“’µ‘,_e¹(9QÒ®\Ú\ÉûÅ©{©šZh¥¦!\ÔRR\Ğ\ÑIš(ii)s@P¢’Še‹EP1( \Ñ\ÜS!^¢¥CSw4x§\nh§\n@Jµe:UU«)@\ÉA§\n`4\ài(\èk>\åv¹­ª×‹‚(ª\ä‘\ÍMœT!)jV!;ª»¦i\à\Ğ\Ô®b\Ô\ÉJx\0S\ã\0¸\Í$şkn\ÅjÛ ŒE°R½ª@¼ò*ˆ\àWŠÅ¾µK¼\Z\è*¦¡x	\î9 h\ÅQµ\r\\°joõ5Q†v¨­8dj=ªF\ÊZ°\ãluTv-—A\ïVµ8L–\á”d¡\éUt\ÈÙ§Fiˆ\Ú¹¦\Ò\Ğ!sKIK@E&ihii( &–’Še‹KM¥¤\0M(¤4 ò)’\Ç’¾\â¤*,|\Ëô©VN\ÑN\"Õ”ª«V# dÂ)‹SÆ¹¤±\'5Vñ¹«Œ\ÛP\Ö}\ÃdÒ¸\ìSbGjaj‘‰<TeMP†\' \Âq@”\'4XW&BjK\\4œ€j´\ÒnPA¥µ“Š\Í\Ä*‹qQÉª\"u5J\êV1§VY|Nj„t¬)\ê‡5f;”ºŒ\ã\é\\¸”cŠ\Ğ\Òd>có\Æ:R°\\Kv5uxriÀúÔŒ\ZDUV%@\çÒ“4\ì\Ò\ì\Ò\æ›E0šPi¢–€Kšn­-\0:–š)\Ô\ÄP))i”´”P0&œ\Ôu*\0±\í\Ó\Ü\ĞK¼¹>•r½=È½\ÍB\r1\"a;}i\â\ã\Õj\nZ@[[„÷…Yh\Ïñ\n\Ì4i¿Šk\Æ\Êz05eŒ\Öm½³†&´GÊ˜\'&\Äw\ë“U%9©Y\ê&5#+H0sÒ¢\İ\Ï5;{T;>cT!Jƒ\Ğ\Ôn‡ş”¹¦\"®\â¤·û\Ôò¸#ŠDŒ\Æ\Ür;UGÀ\äşBP7\Z±!-\ëQ\'¢\Ğ@dÖ¶‚(Ï©ªqZ±\äñZPC°u¤\Øc\ázÓ³M¥¨\ì\Òæ™šPhL\Ò\æ£\Í.h 4\àj0iÀ\Óù¥\Í74¹ R\ÓihŠ\Í¥¹è¦œ!sü4\Æ0\ÑRıû•!€\â\0FMY·P\É\ï*#\ïf’& \àP’\â7\Îx {\Ô\0T\Ù<÷\ÍH‘–8\Å1JúV”V Œ°\ÅX[hĞ–§˜®S*(™˜\r¦µ-\íB`¸ü*\Â\í_º\0¥.*\\®4…\È\íÒ‡Áæ˜¤“I9aŒ\Z2\0\rEÇ©4¬u¨‰)ô¦!\ÌF­D¤³ex\ì<“ŠQ…nÀSÍƒHV¤A…\ëJE1… €8\çµ3@\n\r8(¥;n0iÂ€‚§Z‰idm±@_QKŸz\ÇiO4	¤^Œjl3b—5”·²ù©WP~\ë@\ZB”\Z¢º‚ÿ\0Ô«{\ïŠ[£ëŠ…gº0©\×\ÔP”¢šÒ—4\0ñKM¥¦#3šošj:\\\Ğ\Z¡ó\r&óI°úRùm\é@®!jU]Æœ\"5b\Ş¸M\0>\Ú\ÒI9\äZÑ\İc¡5* D\0qJ@*-!1McŠöj7“*JÌ¢Pi¬sM\Ïi¤\â˜É¢\æ(\ÇN\íD\Òf¨’6\Âö\ÍV“s6`T\ÆC\ÜqM\ÜOl\nd•X\àuõ§,™8\ÅXo\à\nc[\åi€DÄƒ“Š`\à\ÅV\äâ¦ˆL	¶Œu¤\\” Š\Ô]´„S…!lP—Še\Ãb\")\ê\à\æ«\ÎÔ€¨z\Òf‚i3Lb\ÑIKH\Í.i´´\0\àO­8JÃ£\Ze-\0N·R\â\ÍJº„ƒµS\Í-\0i.¥¢¤ş\Ò_J\Ê\Í-\0TÛŠ\\t§`R•D†1F9\Í.9\äR¨ \Å\ãÖµ\" ^\0\É\ëUm\"ù³\Ğ\nµõ2e$é¥¾”ŒFj=\Õ%Zc9\'\Æ*C’8¨™†:\ÓP\ÜR¨Ñ²9\ëN\êz\Ò$}E$Æš\Ô\Ù[\'#½14\å“\Ôf™\Í7>ô\ÄZYG`:sI‘Ö«”\Ï^\ÕD’1\È9ˆ1È¦\î¤V\ÃP±Ò”|§Š7\È\ÍHZ€*´²`u¢i6\rVf,y \Ç#g­,\Î‹Ö¢”\å\Í!\Í\Ú)ˆvh\Í&h\Í!¥\Í74P\éi´P©Ù¦f—4\0\êZnh\Í\0FzÑ/¸\Í\ë\ëVHc4\èÁ4Ó’\0ªHI\È /GòG\îiY©|¢¢/¦³e&›j2Ù£v)”J‰”õ)á¹¥rdûU!28Á)\êiNhŒ\ã\èiH\Í!Œ$šRp94\Ó\ÇÒœr’;P)1JŠx¦ U\ëM`µN‰‘šlÉ…&©Ê»­*\ÓùªALC\Ğ\àbœ\Ò\í\ïQ\î–\Å!w.y\ëJ«LQS/JLhQMh	\äSœ\ásL[ƒœ0´L½©˜«‚Tn\ãñ Æ­\×\î:Z­\ÇjŒ\ÂÃµ\02Š#µ\0´¹¤¢€KM¥ ¥¤\Í.h»rNh\ë\×ùQE\è:s\ëTHo\ã¿\ĞT‘j‹œñNS\Óo\ã@\ËT,\Ç=8 ¿aA\ç­C(hzzœô\Å\\œw­++usó\nC*ˆıN½€Wny¥se˜‰NHVT(fn8­P‚8S#\'=)\Ø#¨­h‘v”öE#†`»S Á\ïW\îl\ÒE;WkúŠ\È%’M\ÃM!6iŒS\Ö©±Ñ†ö©•\éˆb¢–<©>j) y\Ç!ô\ä4—N\ÇÚ¢\ßLDŒô‹\É\ÍE¾¤…²q@\np\éS\Ç=j\Üp/¥KE\\Í™JD& \Ôt\í[“Ú‰¡(8÷¬GFˆ²Aš“€h:Ÿ”ñH9Py\è?\Zv:\Üÿ\0xT\É*?z¦G÷G\Í\0v\\\Ò\å\Ë\Æ5n TMl;T	+«|¤\àz\Ô\Ëv?ˆR³\È\Úi„c­]Y\ÇR˜Õ½\é\\\n\"–¬µ°\í\ÅD`a\ïLQš0GZ(\0\Î[;~”€`ƒ\ßŞ§¾Gµ.}OÒ¨‘\ìOé§§©\Üƒ\×\éIŒ@ü)€¨üóR–\0d~]½şP*l2\Ì/º@¾¦ºeU@\0\í\\´PsŞºiø=iXw/\Z©5š¹/\nÿ\0Î§ó÷\Å$o•ç¨ Fqœ\Çû¶aÁ¦}®a)Q\Ó5kP·&ñòº­b‰Ì™ü\Ô\rq\Êd_˜j\Ì\Õ`¯c\ÍB²H?‹:[­ğ2±\Îi eû\İj™\ëV¾\Î(±@¶\É\Çj²p(M¡#¡ª— \Åc\ĞV£b³õ÷ZÉü4€Í¸“\ëM\Íb¨‘:ÓƒA£¿˜ fÍ±\İ5r:Ëµ¸\\=j\ìrn8Ë Ÿ¥C=¬\ãx\äwƒ&\Øòy¡J‘“H\Ë\Ë1nÊ€\ÕN§<[7(’[²x\È\Íb\à÷?…1\'?L\Òõ\Ïe¤l÷©2H(@\É8\È61…Á„\ç\î\äS˜\ã€F(\0Á4õ™Ñ°4\Ì\ãƒÔ˜# \ãŸz,µ»†*Âº8\àŠ\ÎÚªœòH\ã„\ç6\Í\Z·aMû2\ÕD¹t$‘\ëS-ğ\Ç*sJÃ¹\\\É\' \ïJw\0\Ş;L\Îzÿ\0:^¸ÛSVH¡KÈ¡¹\É#\éÚ[$ò½–\ÆF?J\0k}sô¦”#ƒRŒt>\Ôc\róZ`BPö«vT`œqŒ\ÓztÎ¢•\0RG§z@Xü¡É—>‚§:¹R8­-LøFÁÀÏ—8úT\Z–\ë »ıi\å7\Õü\Äe\ë7x†\ä\×^¢=B\Ş\å%…>I\Z>\ê¬@\Â*N|–ş´\æÄ¸ş#N‹cÌ¢I¦y5\Ö<\Â\ÛL‚MŠ\Ù0}ğ*\ÛX“T°•QU‹²¶^(©©\ØF€…Àã¡¤mZ\Çş~\äÂ¬\Ëj±\áF\Z6F\ãñÖª\Û\ßõ©¬ü D’İŸ(\íøP.§d\Ä´ı\r%\å\å¼A¢’Ui\Ú\İ\Ãk(\á\Ér\ä\ãh\Ïÿ\0Z—F\Ã\\Ş“ƒ\Ê\è4\æ7.z\Ò\îQüY®Ám\ÔjòMƒ\nòÂ£WûvÓş­\éˆ\ä÷)<R\îLrß…o\ë÷\Æ$’\Ğ[\åYAó=9ú{V¥¢$6vÑ7ô¢\àq”\ç<w\Æ1\Ô\Z\Ú\Ó\"\ë·\ê@\ÇQøœÿ\0Z¹ij ¾½!F\Ù\n¸üA\Ï\ëEÀç† \î¥@\'\Ó4£P8\Ø¡­-L:›m\Z´\ì±ı\ã“Tu«\Ë[Ä‹\Êÿ\0„o˜ G4‡s=\ï[‘ŸÊ¡IQI\'Ò·ü6¿º¹C\åRh÷¢y¥´1\ån;½~jb9\Ó\"»}\ïÒe\Éü+G]¼3\ÎÖ‰K†İ¼õ\ë;$ ~´\0}ßº\Ù\'Ò†\àu\ë\Ô\Ò8\Ç\ÍJK=(\0ÀÉ¥\äqH¸\'‘ŸÆ•²Nr:\ã€\0t)¡ˆ,98 ¨1\ÇJ62xö B¾\0Â‚Ö“\r\ëúÒªòX\ãÆšNO¥0\İ0 ?:R\ägo\'Ş„n\ä\äı(“š]\ä.ü…IŸlP@Ûº\r ¨Aœş\Ë.=(À0ß\0.zdœ\ĞóŒ€Nz\Ôrİ·¥?\æs\ÇaC#\ß\å##¹©ÿ\0È´¿\îGı*`Ow¹\Ç\çT\æÔ¦»\Ó~\Ë\ä\"¨\n7\ïô\ÇøSl¯\äÓ¦”\Ç—\Ì\ÇV\Æ1H\r\Í;\î^ÿ\0\×Ä•Z/ùıqo\ëU$\×\î6H\àŠ2ÀÛ³Šu9WKû¸(S~ú\0×¼ÿ\04X¿˜©o\Ïúu‡ıu?ú	¬Èµ\Ù\Ö$ŒZ#P3¿Ò«Í¬O=\ä“’D`÷>¦€:D™dX¿Š<\ÌVø«ÿ\0lÿ\0\è\ë¥ü—\"ù\Ğ!MşóU\ÒöAª›\ï-s’vnö\ÇZ\0¿®M\ä\êh@\Î`\Æ?\Z“Ã„±»\'®Wù\ZË¿½{û¥•FU6\à6sŞ¤\Óõ\Ó|İ‘¬¾a–\Æ(x\\gK^\íµP)³ÿ\0\Èv\Óş¹½aÿ\0iL–Q[˜—j8|\î\ë†\Î*f\Ö%’ò+¯!J\í\ß\×4g]¼•¦û\Ær\Ës¿ıjÖ–k‹gF\"\'p=ò1X\âd]¦\ÑrHş?CQ\\kOo7\ÙÂˆ‰8\İ÷³@\ZğÇ³\Äûğ«~¸ş•n	–xKVSõ\Ïÿ\0oKöŸ<[&vl\Æÿ\0|\Ôvš\ÌÖ¢P WH\În™\í@4±ue§›µ•\Ü\åš\"x8\à\Ô\Úü1=œwj¸|„©\ìk:\ÇVš\Æ	&ˆó´œc=ioµ)µEx–8”\çh9\Éú\Ğ†¿\Õ\\ÿ\0¾?•A ÿ\0\È^ó\è\ßúV\Óõ)l¡ `ylb¢²¿’\Æ\îY– \í.r»±s@­Ÿ\í{¢GA\ì*º¸_\á ‘\ÆsW—V–9n˜À¹¸\ÆFÿ\0»\Æ*+\Ë\Ù/c·W„F±»ºñ\éL\n n=@4rx\0}jHvùŸ0ùI\çµ\\+h\0\Ã½×Ÿó\Å\0P—¡§#LaKu\ÏZ½¶È‘ó6	\ï)qe“÷±:\Ğzw\'#süY«Š°ó’§“\ÜúqN˜Zˆ”\Ä\É\ès@\Ã+e½iDNyõ¦[4\ã†9\İÖ˜2”\è{S%¶ŒE€v\0´\Õ²sÈ¢Š`9T¹9=9¤H÷g½P7\ÊÌ£µ:5ó,O4Q@\Øv\Æ1\ë\Í!\Ú:s\×4QHh\Õ0H\Í P1\çÚŠ(\İû†\0À4…”.6òG\\\ÑE1‚’q\íN\Î\æŠ(§ \0\nTmªH#ÚŠ(Ÿ4˜\É\Îx\æ”\å\å\âŠ(›™A*yõ§\'-“\Î=h¢€\ZÄ·Ò¤Dı\É\É4QHGe\É&\ä°<\ÑE0\×`^O\"šg“E\0Ÿy±Nl)Áô\ÍPd&23\Í=G\Ú&\nxÒŠ)l„À#ŸZ@\Ø3õ¢Š`\'¿¯4\ç\ê1À=¨¢€\00=iBo\É>´Q@ÿ\Ù'),(37,11,'SANTOS','MARVIN','KING','1997-01-02','M','ROSARIO, PASIG CITY','09361144842','A','ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿ\Û\0C\0!!$-K0-**-ZBE6Kl`roi`ifx‡«x~¢fi–Ì–¢±·ÀÀÀr\Ò\áÏºŞ«½À·ÿ\Û\0C!!!-\'-W00W·{i{··················································ÿ\Ä¢\0\0\0\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùú\0\0\0\0\0\0\0	\n\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿÀ\0,\"\0ÿ\Ú\0\0\0?\0­(\Í&ihh?4Œx™¤cÒ›Wÿ\0E<\rµ*Ê­œ08ô9¬\ë(’öx\á›&$~\Ìğ\Ç8\æ‹Ï±Gm+À©kwª\àúw ’ûJ¡°X\îib£pı9¡I>CHüœ\ã9¨­ô«V¿º†U2\nÉ–?( ñÖ 5T‡K„\èM3FLş[0m\Ç9\ÅXM.\ÅR\Õdƒ/(Á;]¹õö \n\Ôğj¶“j÷wk$YDe8\É\ï\ïP&Ÿo™u<±nx\ÙÂ’Ç€z\0\Õ\ÍªJµškWŠ<B\èY\×qÁ\àc¿¹ªñD­\'•d‚{’€?uG¯¹ \rq\"“€\ÊO 43ªı\æ\êj”\ÖúlRI±GnUAI3´œ÷Ú¢µ†¥‹\ë\ÔûL½\Øg¥‘ØŒzÑš¡6™lš¤\ì>Lªÿ\0»\Üpc‘Ki¤\ÛIqt$Œ²¤P<\ë\ï@ó\ëKšÊ·\Ó\íSNy®\"\ŞÁ\Ød±\é»½J\ÚM¯ö¤qˆÈ„\Ä\ÌWq\ä‚¯½\0iJ\rfC¤\Û6£r1\"¡E\Üx\È9\ï\íUá°·»\Ó\â’ö\É\æ…rôİƒ\ßÒ€73HdP\Ø, ú\ÍbÜ¢Y\\]½1ˆa\npIù˜õ\ç\ĞU©­4ûCO\Ó9\èG©÷ \r\"\Øc\ïB°a• PsXö6\Ñ]Iq\æHn-\àm±)l®1Ÿ\ÇÒ›silö–\×P\Å\å$djH¤÷\Å\0m\æŒ\ÖIÒ­¿µDb2!òw\Ü~öq´A¥[\ëµxÉŠ=»q\ã#ô¯š+]>\Õà³–\Êù² |1\åH9jIô«e\Ôm£HÈ‰•Ë®\ã\Î1şô¯š\\\Ö±³–Køc‹l†<e~¾´\ác7\ZzD¥g?¼‘÷\à2hf–’Š.h\Í%\0¹¢’–€9ÒƒM\Í«4šF\éIšF?-\0Z±[‰n\â¬‘\É\ZYó†éŠ»~‘j:T\Ó<afƒp\Ü=W¯>•B\ĞÈ˜š	*dr2ô5b{›«¸Œ2b¾÷–[ó¨$Ñ¹ÿ\0­?ı\æÿ\0\Ğ\rG\ã\Äs¯÷ Sùş½SŠòö–50\È…gpø¨S\í\İı©]br\à\àƒ\éLP#d\áv\Ùâ‰\êõªÚŒ¾V¡¦§ûgùıj“\\^½\â\\“\0tRppA¦\Ü}¦ö\â9¥hU\â\ÆÍ \ã9\Ï4·+‹V\ßÿ\0=eUüğ*¶ª^•$cşZ8›Vmı\İ\äÁF·8\ØQL¸\Ônn\ÕQ\nª¸oœPœ\Í‰>\ŞM¹‘ı:UYae³±‚Fe\Ú\çøN3š\'¸û4ö\è\Ñys3XŒÖƒÆ·ñª9WĞŠLª/–[;\äFx\Ô\ËÓ„z*°|2ª9\Ú@ü¤óuw[&x2*’*d0\İY\'—k$rDy\Û09¿\"j2l\Õt\Şz³\ÌV¤uµpç´¡1\éY“Z\Ü\\H·\Ë¸B`±ps^i\×)w\åo{eòœH»CrGL\Ğš\×ú6Œ\êW«f®\È\á#7_İ„Ÿ\ëı+:\ê»ø\Ö+–c\r»\ä\'­+E¨IgöV{`…6³ŒPö!!š\ãûÑ†ü…g\è\naó!\ê\Z4—\èH\çùSŒ:ƒYı”½¶Â›7a³Œb-nm\î<\ËV‡5B$·Ò•À¯¼d^\\:‡3;¦vÊ­[™¢ò¬¯\Ìs‰T…`:€:\Z}½’¦m¦`Û·n#§<S5”\"=´F\ä6=ñEÀ4\ët´k\ècûªù\Ó*\rU»m½gõa,®\í\äi¡¸WšOõ¢Eù[\Ó\éŠl\ÖWÉ¶òH•\0;cˆgO¥0/N\Â\Ş\ëû±ñ¤›[\\\ÎŞw\ä*”¶ú„Ö†Ù¤¶Wi`8¥{}B[Cl\ÒZ\ì+°°\r»&’<ı&\Ğÿ\0p\çòÈ«00¹\Ù?÷K¯\ë\éT\í\í¯l£1[=±‹q+¼6@=¸¤µ¶\Ô,\áò\ã’\ÕÁ%²Á³\Í\0AdJ\ëFQ\Ò\âIPe\Æ*W½‚\rb\å\î-OOJr\é÷\Çl\ÑIš&vmÀ\í;©¦\Êü›“\æZ\æ\ã¸n01\Å\0Nu›>\í \Ç\'÷M\Ç\éWQ\ÖDWC•a}Eg=¾£#H\Å\í‘6\àsş5z\Ş#´Q’Š>¸–Š( –’–€8\Ü\ï\ÑóxR\Z\\\Õ\ZX>oQF[¾( š.,ÚŸİ·Ö¦\ÍVµ8VúÔ¤Ô±n¥\ÍEšp4~iÀ\â¢œ\r\0AqŸ0óQŠ–\á~­CÒ˜‰TÕ˜\å**šš•Zš\İU…”0ô¬\Ä+MX(\àÔ´2\àjp5O\Î\"¥Šr\ÄqJ\áb\Ø½.y¨\Ë|Ô´®;\İH[\Ò\Õ= %S\Ã\ÕP\ÜÔ„ô¦‘ ¥\ëUC`\æ¦G§q4IE( ô¤¦HR\ÒQ@¢’ŠbŠJZ\0Z3IE–’–€8\Ê)(¦X\ì\ÑIFh-±\åªl\Õ{só¥JM\"Gfš4\àhğiÀ\Ó¥€*\ï#¨ªØ«©\Ï^X\ÌoÆ€·Ò—”)ô§­0!!‡­K\Ä\r¯ù\Ô\Ş^EA\'\î²iŒ•š¬[dŒ\Õ(\ØIŒpkB%Ø¢³cE…>´\â\Õ™MiGz‘ŠÏ‚j#/OJ\ß\Ğ\Ôe\éh>©\Ğ\ç5@J\rK\Ç$SBd\å¿JrI\ïU™ñŠT~i¢®)ûjš¿½!œ«òx¦„\Ñw4Sƒ\rIL¥¤¢€–’Š\0Z)( QIE1efŠf¢\ÒQE\0>ó~-AÃŠš‘,\\Ó…34¢S¨\Å<\Z\0š3S2	i¨#<Õ•4€¦CÀÿ\00\È\ìjuTpzœ€À‚*œ±4•\Î\ÓúSWmƒŠ«3o\â¤fnı*&S»\"\Ê%¶Œµt6Ró6€(˜\Ô1–^J®\ìM‹t©p‘Œ·\'Ò¤\ã\ê)\á\nl— ô\ÅEùr\r0¸öR†Ÿ`1¤g\Í>\Ìn=)¡1‹u5+t\à\Õm\ÛI¨ş\ÑûÁ\Ï†^I9¦I&NsH®®2*	\Ü)\Í4&i\ÚMÀ¯v¬[W\Î5¯\î@hD²JZJ)ˆZZJ(h¤¥ –’–€8¬\Ò\ÓsKL\ĞZ)( !ù\ÅJX\n®iKiÉƒóO _Z˜P!\âœ)‚œ)™5eMUCVT\Ğ«JÀ2i Ó¤s¶\ÂT”ª\Ù\æ¯Mn²®q\È\ïTXl\Ê\Ò(o\Ş=h*GCN^MN¨1Ú€ Y¶uV\âå¾\\WdA\éT\æq\È\ã dG-\æœ	I1œ\â‘p§£µ*)w\æ´d\"\Ú6qW\íSpoqT@À«e`>¦¡Ì¹\×ª\ÉÁ­›˜\ng#­e:\ír9¦‰d–\Îcr„’(¸}\Ç%ºu\'©§Eh\×38Q\Ô\Ñ\Ô:f\à\n×´“’µ‘,_e¹(9QÒ®\Ú\ÉûÅ©{©šZh¥¦!\ÔRR\Ğ\ÑIš(ii)s@P¢’Še‹EP1( \Ñ\ÜS!^¢¥CSw4x§\nh§\n@Jµe:UU«)@\ÉA§\n`4\ài(\èk>\åv¹­ª×‹‚(ª\ä‘\ÍMœT!)jV!;ª»¦i\à\Ğ\Ô®b\Ô\ÉJx\0S\ã\0¸\Í$şkn\ÅjÛ ŒE°R½ª@¼ò*ˆ\àWŠÅ¾µK¼\Z\è*¦¡x	\î9 h\ÅQµ\r\\°joõ5Q†v¨­8dj=ªF\ÊZ°\ãluTv-—A\ïVµ8L–\á”d¡\éUt\ÈÙ§Fiˆ\Ú¹¦\Ò\Ğ!sKIK@E&ihii( &–’Še‹KM¥¤\0M(¤4 ò)’\Ç’¾\â¤*,|\Ëô©VN\ÑN\"Õ”ª«V# dÂ)‹SÆ¹¤±\'5Vñ¹«Œ\ÛP\Ö}\ÃdÒ¸\ìSbGjaj‘‰<TeMP†\' \Âq@”\'4XW&BjK\\4œ€j´\ÒnPA¥µ“Š\Í\Ä*‹qQÉª\"u5J\êV1§VY|Nj„t¬)\ê‡5f;”ºŒ\ã\é\\¸”cŠ\Ğ\Òd>có\Æ:R°\\Kv5uxriÀúÔŒ\ZDUV%@\çÒ“4\ì\Ò\ì\Ò\æ›E0šPi¢–€Kšn­-\0:–š)\Ô\ÄP))i”´”P0&œ\Ôu*\0±\í\Ó\Ü\ĞK¼¹>•r½=È½\ÍB\r1\"a;}i\â\ã\Õj\nZ@[[„÷…Yh\Ïñ\n\Ì4i¿Šk\Æ\Êz05eŒ\Öm½³†&´GÊ˜\'&\Äw\ë“U%9©Y\ê&5#+H0sÒ¢\İ\Ï5;{T;>cT!Jƒ\Ğ\Ôn‡ş”¹¦\"®\â¤·û\Ôò¸#ŠDŒ\Æ\Ür;UGÀ\äşBP7\Z±!-\ëQ\'¢\Ğ@dÖ¶‚(Ï©ªqZ±\äñZPC°u¤\Øc\ázÓ³M¥¨\ì\Òæ™šPhL\Ò\æ£\Í.h 4\àj0iÀ\Óù¥\Í74¹ R\ÓihŠ\Í¥¹è¦œ!sü4\Æ0\ÑRıû•!€\â\0FMY·P\É\ï*#\ïf’& \àP’\â7\Îx {\Ô\0T\Ù<÷\ÍH‘–8\Å1JúV”V Œ°\ÅX[hĞ–§˜®S*(™˜\r¦µ-\íB`¸ü*\Â\í_º\0¥.*\\®4…\È\íÒ‡Áæ˜¤“I9aŒ\Z2\0\rEÇ©4¬u¨‰)ô¦!\ÌF­D¤³ex\ì<“ŠQ…nÀSÍƒHV¤A…\ëJE1… €8\çµ3@\n\r8(¥;n0iÂ€‚§Z‰idm±@_QKŸz\ÇiO4	¤^Œjl3b—5”·²ù©WP~\ë@\ZB”\Z¢º‚ÿ\0Ô«{\ïŠ[£ëŠ…gº0©\×\ÔP”¢šÒ—4\0ñKM¥¦#3šošj:\\\Ğ\Z¡ó\r&óI°úRùm\é@®!jU]Æœ\"5b\Ş¸M\0>\Ú\ÒI9\äZÑ\İc¡5* D\0qJ@*-!1McŠöj7“*JÌ¢Pi¬sM\Ïi¤\â˜É¢\æ(\ÇN\íD\Òf¨’6\Âö\ÍV“s6`T\ÆC\ÜqM\ÜOl\nd•X\àuõ§,™8\ÅXo\à\nc[\åi€DÄƒ“Š`\à\ÅV\äâ¦ˆL	¶Œu¤\\” Š\Ô]´„S…!lP—Še\Ãb\")\ê\à\æ«\ÎÔ€¨z\Òf‚i3Lb\ÑIKH\Í.i´´\0\àO­8JÃ£\Ze-\0N·R\â\ÍJº„ƒµS\Í-\0i.¥¢¤ş\Ò_J\Ê\Í-\0TÛŠ\\t§`R•D†1F9\Í.9\äR¨ \Å\ãÖµ\" ^\0\É\ëUm\"ù³\Ğ\nµõ2e$é¥¾”ŒFj=\Õ%Zc9\'\Æ*C’8¨™†:\ÓP\ÜR¨Ñ²9\ëN\êz\Ò$}E$Æš\Ô\Ù[\'#½14\å“\Ôf™\Í7>ô\ÄZYG`:sI‘Ö«”\Ï^\ÕD’1\È9ˆ1È¦\î¤V\ÃP±Ò”|§Š7\È\ÍHZ€*´²`u¢i6\rVf,y \Ç#g­,\Î‹Ö¢”\å\Í!\Í\Ú)ˆvh\Í&h\Í!¥\Í74P\éi´P©Ù¦f—4\0\êZnh\Í\0FzÑ/¸\Í\ë\ëVHc4\èÁ4Ó’\0ªHI\È /GòG\îiY©|¢¢/¦³e&›j2Ù£v)”J‰”õ)á¹¥rdûU!28Á)\êiNhŒ\ã\èiH\Í!Œ$šRp94\Ó\ÇÒœr’;P)1JŠx¦ U\ëM`µN‰‘šlÉ…&©Ê»­*\ÓùªALC\Ğ\àbœ\Ò\í\ïQ\î–\Å!w.y\ëJ«LQS/JLhQMh	\äSœ\ásL[ƒœ0´L½©˜«‚Tn\ãñ Æ­\×\î:Z­\ÇjŒ\ÂÃµ\02Š#µ\0´¹¤¢€KM¥ ¥¤\Í.h»rNh\ë\×ùQE\è:s\ëTHo\ã¿\ĞT‘j‹œñNS\Óo\ã@\ËT,\Ç=8 ¿aA\ç­C(hzzœô\Å\\œw­++usó\nC*ˆıN½€Wny¥se˜‰NHVT(fn8­P‚8S#\'=)\Ø#¨­h‘v”öE#†`»S Á\ïW\îl\ÒE;WkúŠ\È%’M\ÃM!6iŒS\Ö©±Ñ†ö©•\éˆb¢–<©>j) y\Ç!ô\ä4—N\ÇÚ¢\ßLDŒô‹\É\ÍE¾¤…²q@\np\éS\Ç=j\Üp/¥KE\\Í™JD& \Ôt\í[“Ú‰¡(8÷¬GFˆ²Aš“€h:Ÿ”ñH9Py\è?\Zv:\Üÿ\0xT\É*?z¦G÷G\Í\0v\\\Ò\å\Ë\Æ5n TMl;T	+«|¤\àz\Ô\Ëv?ˆR³\È\Úi„c­]Y\ÇR˜Õ½\é\\\n\"–¬µ°\í\ÅD`a\ïLQš0GZ(\0\Î[;~”€`ƒ\ßŞ§¾Gµ.}OÒ¨‘\ìOé§§©\Üƒ\×\éIŒ@ü)€¨üóR–\0d~]½şP*l2\Ì/º@¾¦ºeU@\0\í\\´PsŞºiø=iXw/\Z©5š¹/\nÿ\0Î§ó÷\Å$o•ç¨ Fqœ\Çû¶aÁ¦}®a)Q\Ó5kP·&ñòº­b‰Ì™ü\Ô\rq\Êd_˜j\Ì\Õ`¯c\ÍB²H?‹:[­ğ2±\Îi eû\İj™\ëV¾\Î(±@¶\É\Çj²p(M¡#¡ª— \Åc\ĞV£b³õ÷ZÉü4€Í¸“\ëM\Íb¨‘:ÓƒA£¿˜ fÍ±\İ5r:Ëµ¸\\=j\ìrn8Ë Ÿ¥C=¬\ãx\äwƒ&\Øòy¡J‘“H\Ë\Ë1nÊ€\ÕN§<[7(’[²x\È\Íb\à÷?…1\'?L\Òõ\Ïe¤l÷©2H(@\É8\È61…Á„\ç\î\äS˜\ã€F(\0Á4õ™Ñ°4\Ì\ãƒÔ˜# \ãŸz,µ»†*Âº8\àŠ\ÎÚªœòH\ã„\ç6\Í\Z·aMû2\ÕD¹t$‘\ëS-ğ\Ç*sJÃ¹\\\É\' \ïJw\0\Ş;L\Îzÿ\0:^¸ÛSVH¡KÈ¡¹\É#\éÚ[$ò½–\ÆF?J\0k}sô¦”#ƒRŒt>\Ôc\róZ`BPö«vT`œqŒ\ÓztÎ¢•\0RG§z@Xü¡É—>‚§:¹R8­-LøFÁÀÏ—8úT\Z–\ë »ıi\å7\Õü\Äe\ë7x†\ä\×^¢=B\Ş\å%…>I\Z>\ê¬@\Â*N|–ş´\æÄ¸ş#N‹cÌ¢I¦y5\Ö<\Â\ÛL‚MŠ\Ù0}ğ*\ÛX“T°•QU‹²¶^(©©\ØF€…Àã¡¤mZ\Çş~\äÂ¬\Ëj±\áF\Z6F\ãñÖª\Û\ßõ©¬ü D’İŸ(\íøP.§d\Ä´ı\r%\å\å¼A¢’Ui\Ú\İ\Ãk(\á\Ér\ä\ãh\Ïÿ\0Z—F\Ã\\Ş“ƒ\Ê\è4\æ7.z\Ò\îQüY®Ám\ÔjòMƒ\nòÂ£WûvÓş­\éˆ\ä÷)<R\îLrß…o\ë÷\Æ$’\Ğ[\åYAó=9ú{V¥¢$6vÑ7ô¢\àq”\ç<w\Æ1\Ô\Z\Ú\Ó\"\ë·\ê@\ÇQøœÿ\0Z¹ij ¾½!F\Ù\n¸üA\Ï\ëEÀç† \î¥@\'\Ó4£P8\Ø¡­-L:›m\Z´\ì±ı\ã“Tu«\Ë[Ä‹\Êÿ\0„o˜ G4‡s=\ï[‘ŸÊ¡IQI\'Ò·ü6¿º¹C\åRh÷¢y¥´1\ån;½~jb9\Ó\"»}\ïÒe\Éü+G]¼3\ÎÖ‰K†İ¼õ\ë;$ ~´\0}ßº\Ù\'Ò†\àu\ë\Ô\Ò8\Ç\ÍJK=(\0ÀÉ¥\äqH¸\'‘ŸÆ•²Nr:\ã€\0t)¡ˆ,98 ¨1\ÇJ62xö B¾\0Â‚Ö“\r\ëúÒªòX\ãÆšNO¥0\İ0 ?:R\ägo\'Ş„n\ä\äı(“š]\ä.ü…IŸlP@Ûº\r ¨Aœş\Ë.=(À0ß\0.zdœ\ĞóŒ€Nz\Ôrİ·¥?\æs\ÇaC#\ß\å##¹©ÿ\0È´¿\îGı*`Ow¹\Ç\çT\æÔ¦»\Ó~\Ë\ä\"¨\n7\ïô\ÇøSl¯\äÓ¦”\Ç—\Ì\ÇV\Æ1H\r\Í;\î^ÿ\0\×Ä•Z/ùıqo\ëU$\×\î6H\àŠ2ÀÛ³Šu9WKû¸(S~ú\0×¼ÿ\04X¿˜©o\Ïúu‡ıu?ú	¬Èµ\Ù\Ö$ŒZ#P3¿Ò«Í¬O=\ä“’D`÷>¦€:D™dX¿Š<\ÌVø«ÿ\0lÿ\0\è\ë¥ü—\"ù\Ğ!MşóU\ÒöAª›\ï-s’vnö\ÇZ\0¿®M\ä\êh@\Î`\Æ?\Z“Ã„±»\'®Wù\ZË¿½{û¥•FU6\à6sŞ¤\Óõ\Ó|İ‘¬¾a–\Æ(x\\gK^\íµP)³ÿ\0\Èv\Óş¹½aÿ\0iL–Q[˜—j8|\î\ë†\Î*f\Ö%’ò+¯!J\í\ß\×4g]¼•¦û\Ær\Ës¿ıjÖ–k‹gF\"\'p=ò1X\âd]¦\ÑrHş?CQ\\kOo7\ÙÂˆ‰8\İ÷³@\ZğÇ³\Äûğ«~¸ş•n	–xKVSõ\Ïÿ\0oKöŸ<[&vl\Æÿ\0|\Ôvš\ÌÖ¢P WH\În™\í@4±ue§›µ•\Ü\åš\"x8\à\Ô\Úü1=œwj¸|„©\ìk:\ÇVš\Æ	&ˆó´œc=ioµ)µEx–8”\çh9\Éú\Ğ†¿\Õ\\ÿ\0¾?•A ÿ\0\È^ó\è\ßúV\Óõ)l¡ `ylb¢²¿’\Æ\îY– \í.r»±s@­Ÿ\í{¢GA\ì*º¸_\á ‘\ÆsW—V–9n˜À¹¸\ÆFÿ\0»\Æ*+\Ë\Ù/c·W„F±»ºñ\éL\n n=@4rx\0}jHvùŸ0ùI\çµ\\+h\0\Ã½×Ÿó\Å\0P—¡§#LaKu\ÏZ½¶È‘ó6	\ï)qe“÷±:\Ğzw\'#süY«Š°ó’§“\ÜúqN˜Zˆ”\Ä\É\ès@\Ã+e½iDNyõ¦[4\ã†9\İÖ˜2”\è{S%¶ŒE€v\0´\Õ²sÈ¢Š`9T¹9=9¤H÷g½P7\ÊÌ£µ:5ó,O4Q@\Øv\Æ1\ë\Í!\Ú:s\×4QHh\Õ0H\Í P1\çÚŠ(\İû†\0À4…”.6òG\\\ÑE1‚’q\íN\Î\æŠ(§ \0\nTmªH#ÚŠ(Ÿ4˜\É\Îx\æ”\å\å\âŠ(›™A*yõ§\'-“\Î=h¢€\ZÄ·Ò¤Dı\É\É4QHGe\É&\ä°<\ÑE0\×`^O\"šg“E\0Ÿy±Nl)Áô\ÍPd&23\Í=G\Ú&\nxÒŠ)l„À#ŸZ@\Ø3õ¢Š`\'¿¯4\ç\ê1À=¨¢€\00=iBo\É>´Q@ÿ\Ù'),(38,15,'SANTOS','CAMILLE','KING','1997-01-02','F','ROSARIO, PASIG CITY','09361144842','A','ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿ\Û\0C\0!!$-K0-**-ZBE6Kl`roi`ifx‡«x~¢fi–Ì–¢±·ÀÀÀr\Ò\áÏºŞ«½À·ÿ\Û\0C!!!-\'-W00W·{i{··················································ÿ\Ä¢\0\0\0\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùú\0\0\0\0\0\0\0	\n\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿÀ\0,\"\0ÿ\Ú\0\0\0?\0­(\Í&ihh?4Œx™¤cÒ›Wÿ\0E<\rµ*Ê­œ08ô9¬\ë(’öx\á›&$~\Ìğ\Ç8\æ‹Ï±Gm+À©kwª\àúw ’ûJ¡°X\îib£pı9¡I>CHüœ\ã9¨­ô«V¿º†U2\nÉ–?( ñÖ 5T‡K„\èM3FLş[0m\Ç9\ÅXM.\ÅR\Õdƒ/(Á;]¹õö \n\Ôğj¶“j÷wk$YDe8\É\ï\ïP&Ÿo™u<±nx\ÙÂ’Ç€z\0\Õ\ÍªJµškWŠ<B\èY\×qÁ\àc¿¹ªñD­\'•d‚{’€?uG¯¹ \rq\"“€\ÊO 43ªı\æ\êj”\ÖúlRI±GnUAI3´œ÷Ú¢µ†¥‹\ë\ÔûL½\Øg¥‘ØŒzÑš¡6™lš¤\ì>Lªÿ\0»\Üpc‘Ki¤\ÛIqt$Œ²¤P<\ë\ï@ó\ëKšÊ·\Ó\íSNy®\"\ŞÁ\Ød±\é»½J\ÚM¯ö¤qˆÈ„\Ä\ÌWq\ä‚¯½\0iJ\rfC¤\Û6£r1\"¡E\Üx\È9\ï\íUá°·»\Ó\â’ö\É\æ…rôİƒ\ßÒ€73HdP\Ø, ú\ÍbÜ¢Y\\]½1ˆa\npIù˜õ\ç\ĞU©­4ûCO\Ó9\èG©÷ \r\"\Øc\ïB°a• PsXö6\Ñ]Iq\æHn-\àm±)l®1Ÿ\ÇÒ›silö–\×P\Å\å$djH¤÷\Å\0m\æŒ\ÖIÒ­¿µDb2!òw\Ü~öq´A¥[\ëµxÉŠ=»q\ã#ô¯š+]>\Õà³–\Êù² |1\åH9jIô«e\Ôm£HÈ‰•Ë®\ã\Î1şô¯š\\\Ö±³–Køc‹l†<e~¾´\ác7\ZzD¥g?¼‘÷\à2hf–’Š.h\Í%\0¹¢’–€9ÒƒM\Í«4šF\éIšF?-\0Z±[‰n\â¬‘\É\ZYó†éŠ»~‘j:T\Ó<afƒp\Ü=W¯>•B\ĞÈ˜š	*dr2ô5b{›«¸Œ2b¾÷–[ó¨$Ñ¹ÿ\0­?ı\æÿ\0\Ğ\rG\ã\Äs¯÷ Sùş½SŠòö–50\È…gpø¨S\í\İı©]br\à\àƒ\éLP#d\áv\Ùâ‰\êõªÚŒ¾V¡¦§ûgùıj“\\^½\â\\“\0tRppA¦\Ü}¦ö\â9¥hU\â\ÆÍ \ã9\Ï4·+‹V\ßÿ\0=eUüğ*¶ª^•$cşZ8›Vmı\İ\äÁF·8\ØQL¸\Ônn\ÕQ\nª¸oœPœ\Í‰>\ŞM¹‘ı:UYae³±‚Fe\Ú\çøN3š\'¸û4ö\è\Ñys3XŒÖƒÆ·ñª9WĞŠLª/–[;\äFx\Ô\ËÓ„z*°|2ª9\Ú@ü¤óuw[&x2*’*d0\İY\'—k$rDy\Û09¿\"j2l\Õt\Şz³\ÌV¤uµpç´¡1\éY“Z\Ü\\H·\Ë¸B`±ps^i\×)w\åo{eòœH»CrGL\Ğš\×ú6Œ\êW«f®\È\á#7_İ„Ÿ\ëı+:\ê»ø\Ö+–c\r»\ä\'­+E¨IgöV{`…6³ŒPö!!š\ãûÑ†ü…g\è\naó!\ê\Z4—\èH\çùSŒ:ƒYı”½¶Â›7a³Œb-nm\î<\ËV‡5B$·Ò•À¯¼d^\\:‡3;¦vÊ­[™¢ò¬¯\Ìs‰T…`:€:\Z}½’¦m¦`Û·n#§<S5”\"=´F\ä6=ñEÀ4\ët´k\ècûªù\Ó*\rU»m½gõa,®\í\äi¡¸WšOõ¢Eù[\Ó\éŠl\ÖWÉ¶òH•\0;cˆgO¥0/N\Â\Ş\ëû±ñ¤›[\\\ÎŞw\ä*”¶ú„Ö†Ù¤¶Wi`8¥{}B[Cl\ÒZ\ì+°°\r»&’<ı&\Ğÿ\0p\çòÈ«00¹\Ù?÷K¯\ë\éT\í\í¯l£1[=±‹q+¼6@=¸¤µ¶\Ô,\áò\ã’\ÕÁ%²Á³\Í\0AdJ\ëFQ\Ò\âIPe\Æ*W½‚\rb\å\î-OOJr\é÷\Çl\ÑIš&vmÀ\í;©¦\Êü›“\æZ\æ\ã¸n01\Å\0Nu›>\í \Ç\'÷M\Ç\éWQ\ÖDWC•a}Eg=¾£#H\Å\í‘6\àsş5z\Ş#´Q’Š>¸–Š( –’–€8\Ü\ï\ÑóxR\Z\\\Õ\ZX>oQF[¾( š.,ÚŸİ·Ö¦\ÍVµ8VúÔ¤Ô±n¥\ÍEšp4~iÀ\â¢œ\r\0AqŸ0óQŠ–\á~­CÒ˜‰TÕ˜\å**šš•Zš\İU…”0ô¬\Ä+MX(\àÔ´2\àjp5O\Î\"¥Šr\ÄqJ\áb\Ø½.y¨\Ë|Ô´®;\İH[\Ò\Õ= %S\Ã\ÕP\ÜÔ„ô¦‘ ¥\ëUC`\æ¦G§q4IE( ô¤¦HR\ÒQ@¢’ŠbŠJZ\0Z3IE–’–€8\Ê)(¦X\ì\ÑIFh-±\åªl\Õ{só¥JM\"Gfš4\àhğiÀ\Ó¥€*\ï#¨ªØ«©\Ï^X\ÌoÆ€·Ò—”)ô§­0!!‡­K\Ä\r¯ù\Ô\Ş^EA\'\î²iŒ•š¬[dŒ\Õ(\ØIŒpkB%Ø¢³cE…>´\â\Õ™MiGz‘ŠÏ‚j#/OJ\ß\Ğ\Ôe\éh>©\Ğ\ç5@J\rK\Ç$SBd\å¿JrI\ïU™ñŠT~i¢®)ûjš¿½!œ«òx¦„\Ñw4Sƒ\rIL¥¤¢€–’Š\0Z)( QIE1efŠf¢\ÒQE\0>ó~-AÃŠš‘,\\Ó…34¢S¨\Å<\Z\0š3S2	i¨#<Õ•4€¦CÀÿ\00\È\ìjuTpzœ€À‚*œ±4•\Î\ÓúSWmƒŠ«3o\â¤fnı*&S»\"\Ê%¶Œµt6Ró6€(˜\Ô1–^J®\ìM‹t©p‘Œ·\'Ò¤\ã\ê)\á\nl— ô\ÅEùr\r0¸öR†Ÿ`1¤g\Í>\Ìn=)¡1‹u5+t\à\Õm\ÛI¨ş\ÑûÁ\Ï†^I9¦I&NsH®®2*	\Ü)\Í4&i\ÚMÀ¯v¬[W\Î5¯\î@hD²JZJ)ˆZZJ(h¤¥ –’–€8¬\Ò\ÓsKL\ĞZ)( !ù\ÅJX\n®iKiÉƒóO _Z˜P!\âœ)‚œ)™5eMUCVT\Ğ«JÀ2i Ó¤s¶\ÂT”ª\Ù\æ¯Mn²®q\È\ïTXl\Ê\Ò(o\Ş=h*GCN^MN¨1Ú€ Y¶uV\âå¾\\WdA\éT\æq\È\ã dG-\æœ	I1œ\â‘p§£µ*)w\æ´d\"\Ú6qW\íSpoqT@À«e`>¦¡Ì¹\×ª\ÉÁ­›˜\ng#­e:\ír9¦‰d–\Îcr„’(¸}\Ç%ºu\'©§Eh\×38Q\Ô\Ñ\Ô:f\à\n×´“’µ‘,_e¹(9QÒ®\Ú\ÉûÅ©{©šZh¥¦!\ÔRR\Ğ\ÑIš(ii)s@P¢’Še‹EP1( \Ñ\ÜS!^¢¥CSw4x§\nh§\n@Jµe:UU«)@\ÉA§\n`4\ài(\èk>\åv¹­ª×‹‚(ª\ä‘\ÍMœT!)jV!;ª»¦i\à\Ğ\Ô®b\Ô\ÉJx\0S\ã\0¸\Í$şkn\ÅjÛ ŒE°R½ª@¼ò*ˆ\àWŠÅ¾µK¼\Z\è*¦¡x	\î9 h\ÅQµ\r\\°joõ5Q†v¨­8dj=ªF\ÊZ°\ãluTv-—A\ïVµ8L–\á”d¡\éUt\ÈÙ§Fiˆ\Ú¹¦\Ò\Ğ!sKIK@E&ihii( &–’Še‹KM¥¤\0M(¤4 ò)’\Ç’¾\â¤*,|\Ëô©VN\ÑN\"Õ”ª«V# dÂ)‹SÆ¹¤±\'5Vñ¹«Œ\ÛP\Ö}\ÃdÒ¸\ìSbGjaj‘‰<TeMP†\' \Âq@”\'4XW&BjK\\4œ€j´\ÒnPA¥µ“Š\Í\Ä*‹qQÉª\"u5J\êV1§VY|Nj„t¬)\ê‡5f;”ºŒ\ã\é\\¸”cŠ\Ğ\Òd>có\Æ:R°\\Kv5uxriÀúÔŒ\ZDUV%@\çÒ“4\ì\Ò\ì\Ò\æ›E0šPi¢–€Kšn­-\0:–š)\Ô\ÄP))i”´”P0&œ\Ôu*\0±\í\Ó\Ü\ĞK¼¹>•r½=È½\ÍB\r1\"a;}i\â\ã\Õj\nZ@[[„÷…Yh\Ïñ\n\Ì4i¿Šk\Æ\Êz05eŒ\Öm½³†&´GÊ˜\'&\Äw\ë“U%9©Y\ê&5#+H0sÒ¢\İ\Ï5;{T;>cT!Jƒ\Ğ\Ôn‡ş”¹¦\"®\â¤·û\Ôò¸#ŠDŒ\Æ\Ür;UGÀ\äşBP7\Z±!-\ëQ\'¢\Ğ@dÖ¶‚(Ï©ªqZ±\äñZPC°u¤\Øc\ázÓ³M¥¨\ì\Òæ™šPhL\Ò\æ£\Í.h 4\àj0iÀ\Óù¥\Í74¹ R\ÓihŠ\Í¥¹è¦œ!sü4\Æ0\ÑRıû•!€\â\0FMY·P\É\ï*#\ïf’& \àP’\â7\Îx {\Ô\0T\Ù<÷\ÍH‘–8\Å1JúV”V Œ°\ÅX[hĞ–§˜®S*(™˜\r¦µ-\íB`¸ü*\Â\í_º\0¥.*\\®4…\È\íÒ‡Áæ˜¤“I9aŒ\Z2\0\rEÇ©4¬u¨‰)ô¦!\ÌF­D¤³ex\ì<“ŠQ…nÀSÍƒHV¤A…\ëJE1… €8\çµ3@\n\r8(¥;n0iÂ€‚§Z‰idm±@_QKŸz\ÇiO4	¤^Œjl3b—5”·²ù©WP~\ë@\ZB”\Z¢º‚ÿ\0Ô«{\ïŠ[£ëŠ…gº0©\×\ÔP”¢šÒ—4\0ñKM¥¦#3šošj:\\\Ğ\Z¡ó\r&óI°úRùm\é@®!jU]Æœ\"5b\Ş¸M\0>\Ú\ÒI9\äZÑ\İc¡5* D\0qJ@*-!1McŠöj7“*JÌ¢Pi¬sM\Ïi¤\â˜É¢\æ(\ÇN\íD\Òf¨’6\Âö\ÍV“s6`T\ÆC\ÜqM\ÜOl\nd•X\àuõ§,™8\ÅXo\à\nc[\åi€DÄƒ“Š`\à\ÅV\äâ¦ˆL	¶Œu¤\\” Š\Ô]´„S…!lP—Še\Ãb\")\ê\à\æ«\ÎÔ€¨z\Òf‚i3Lb\ÑIKH\Í.i´´\0\àO­8JÃ£\Ze-\0N·R\â\ÍJº„ƒµS\Í-\0i.¥¢¤ş\Ò_J\Ê\Í-\0TÛŠ\\t§`R•D†1F9\Í.9\äR¨ \Å\ãÖµ\" ^\0\É\ëUm\"ù³\Ğ\nµõ2e$é¥¾”ŒFj=\Õ%Zc9\'\Æ*C’8¨™†:\ÓP\ÜR¨Ñ²9\ëN\êz\Ò$}E$Æš\Ô\Ù[\'#½14\å“\Ôf™\Í7>ô\ÄZYG`:sI‘Ö«”\Ï^\ÕD’1\È9ˆ1È¦\î¤V\ÃP±Ò”|§Š7\È\ÍHZ€*´²`u¢i6\rVf,y \Ç#g­,\Î‹Ö¢”\å\Í!\Í\Ú)ˆvh\Í&h\Í!¥\Í74P\éi´P©Ù¦f—4\0\êZnh\Í\0FzÑ/¸\Í\ë\ëVHc4\èÁ4Ó’\0ªHI\È /GòG\îiY©|¢¢/¦³e&›j2Ù£v)”J‰”õ)á¹¥rdûU!28Á)\êiNhŒ\ã\èiH\Í!Œ$šRp94\Ó\ÇÒœr’;P)1JŠx¦ U\ëM`µN‰‘šlÉ…&©Ê»­*\ÓùªALC\Ğ\àbœ\Ò\í\ïQ\î–\Å!w.y\ëJ«LQS/JLhQMh	\äSœ\ásL[ƒœ0´L½©˜«‚Tn\ãñ Æ­\×\î:Z­\ÇjŒ\ÂÃµ\02Š#µ\0´¹¤¢€KM¥ ¥¤\Í.h»rNh\ë\×ùQE\è:s\ëTHo\ã¿\ĞT‘j‹œñNS\Óo\ã@\ËT,\Ç=8 ¿aA\ç­C(hzzœô\Å\\œw­++usó\nC*ˆıN½€Wny¥se˜‰NHVT(fn8­P‚8S#\'=)\Ø#¨­h‘v”öE#†`»S Á\ïW\îl\ÒE;WkúŠ\È%’M\ÃM!6iŒS\Ö©±Ñ†ö©•\éˆb¢–<©>j) y\Ç!ô\ä4—N\ÇÚ¢\ßLDŒô‹\É\ÍE¾¤…²q@\np\éS\Ç=j\Üp/¥KE\\Í™JD& \Ôt\í[“Ú‰¡(8÷¬GFˆ²Aš“€h:Ÿ”ñH9Py\è?\Zv:\Üÿ\0xT\É*?z¦G÷G\Í\0v\\\Ò\å\Ë\Æ5n TMl;T	+«|¤\àz\Ô\Ëv?ˆR³\È\Úi„c­]Y\ÇR˜Õ½\é\\\n\"–¬µ°\í\ÅD`a\ïLQš0GZ(\0\Î[;~”€`ƒ\ßŞ§¾Gµ.}OÒ¨‘\ìOé§§©\Üƒ\×\éIŒ@ü)€¨üóR–\0d~]½şP*l2\Ì/º@¾¦ºeU@\0\í\\´PsŞºiø=iXw/\Z©5š¹/\nÿ\0Î§ó÷\Å$o•ç¨ Fqœ\Çû¶aÁ¦}®a)Q\Ó5kP·&ñòº­b‰Ì™ü\Ô\rq\Êd_˜j\Ì\Õ`¯c\ÍB²H?‹:[­ğ2±\Îi eû\İj™\ëV¾\Î(±@¶\É\Çj²p(M¡#¡ª— \Åc\ĞV£b³õ÷ZÉü4€Í¸“\ëM\Íb¨‘:ÓƒA£¿˜ fÍ±\İ5r:Ëµ¸\\=j\ìrn8Ë Ÿ¥C=¬\ãx\äwƒ&\Øòy¡J‘“H\Ë\Ë1nÊ€\ÕN§<[7(’[²x\È\Íb\à÷?…1\'?L\Òõ\Ïe¤l÷©2H(@\É8\È61…Á„\ç\î\äS˜\ã€F(\0Á4õ™Ñ°4\Ì\ãƒÔ˜# \ãŸz,µ»†*Âº8\àŠ\ÎÚªœòH\ã„\ç6\Í\Z·aMû2\ÕD¹t$‘\ëS-ğ\Ç*sJÃ¹\\\É\' \ïJw\0\Ş;L\Îzÿ\0:^¸ÛSVH¡KÈ¡¹\É#\éÚ[$ò½–\ÆF?J\0k}sô¦”#ƒRŒt>\Ôc\róZ`BPö«vT`œqŒ\ÓztÎ¢•\0RG§z@Xü¡É—>‚§:¹R8­-LøFÁÀÏ—8úT\Z–\ë »ıi\å7\Õü\Äe\ë7x†\ä\×^¢=B\Ş\å%…>I\Z>\ê¬@\Â*N|–ş´\æÄ¸ş#N‹cÌ¢I¦y5\Ö<\Â\ÛL‚MŠ\Ù0}ğ*\ÛX“T°•QU‹²¶^(©©\ØF€…Àã¡¤mZ\Çş~\äÂ¬\Ëj±\áF\Z6F\ãñÖª\Û\ßõ©¬ü D’İŸ(\íøP.§d\Ä´ı\r%\å\å¼A¢’Ui\Ú\İ\Ãk(\á\Ér\ä\ãh\Ïÿ\0Z—F\Ã\\Ş“ƒ\Ê\è4\æ7.z\Ò\îQüY®Ám\ÔjòMƒ\nòÂ£WûvÓş­\éˆ\ä÷)<R\îLrß…o\ë÷\Æ$’\Ğ[\åYAó=9ú{V¥¢$6vÑ7ô¢\àq”\ç<w\Æ1\Ô\Z\Ú\Ó\"\ë·\ê@\ÇQøœÿ\0Z¹ij ¾½!F\Ù\n¸üA\Ï\ëEÀç† \î¥@\'\Ó4£P8\Ø¡­-L:›m\Z´\ì±ı\ã“Tu«\Ë[Ä‹\Êÿ\0„o˜ G4‡s=\ï[‘ŸÊ¡IQI\'Ò·ü6¿º¹C\åRh÷¢y¥´1\ån;½~jb9\Ó\"»}\ïÒe\Éü+G]¼3\ÎÖ‰K†İ¼õ\ë;$ ~´\0}ßº\Ù\'Ò†\àu\ë\Ô\Ò8\Ç\ÍJK=(\0ÀÉ¥\äqH¸\'‘ŸÆ•²Nr:\ã€\0t)¡ˆ,98 ¨1\ÇJ62xö B¾\0Â‚Ö“\r\ëúÒªòX\ãÆšNO¥0\İ0 ?:R\ägo\'Ş„n\ä\äı(“š]\ä.ü…IŸlP@Ûº\r ¨Aœş\Ë.=(À0ß\0.zdœ\ĞóŒ€Nz\Ôrİ·¥?\æs\ÇaC#\ß\å##¹©ÿ\0È´¿\îGı*`Ow¹\Ç\çT\æÔ¦»\Ó~\Ë\ä\"¨\n7\ïô\ÇøSl¯\äÓ¦”\Ç—\Ì\ÇV\Æ1H\r\Í;\î^ÿ\0\×Ä•Z/ùıqo\ëU$\×\î6H\àŠ2ÀÛ³Šu9WKû¸(S~ú\0×¼ÿ\04X¿˜©o\Ïúu‡ıu?ú	¬Èµ\Ù\Ö$ŒZ#P3¿Ò«Í¬O=\ä“’D`÷>¦€:D™dX¿Š<\ÌVø«ÿ\0lÿ\0\è\ë¥ü—\"ù\Ğ!MşóU\ÒöAª›\ï-s’vnö\ÇZ\0¿®M\ä\êh@\Î`\Æ?\Z“Ã„±»\'®Wù\ZË¿½{û¥•FU6\à6sŞ¤\Óõ\Ó|İ‘¬¾a–\Æ(x\\gK^\íµP)³ÿ\0\Èv\Óş¹½aÿ\0iL–Q[˜—j8|\î\ë†\Î*f\Ö%’ò+¯!J\í\ß\×4g]¼•¦û\Ær\Ës¿ıjÖ–k‹gF\"\'p=ò1X\âd]¦\ÑrHş?CQ\\kOo7\ÙÂˆ‰8\İ÷³@\ZğÇ³\Äûğ«~¸ş•n	–xKVSõ\Ïÿ\0oKöŸ<[&vl\Æÿ\0|\Ôvš\ÌÖ¢P WH\În™\í@4±ue§›µ•\Ü\åš\"x8\à\Ô\Úü1=œwj¸|„©\ìk:\ÇVš\Æ	&ˆó´œc=ioµ)µEx–8”\çh9\Éú\Ğ†¿\Õ\\ÿ\0¾?•A ÿ\0\È^ó\è\ßúV\Óõ)l¡ `ylb¢²¿’\Æ\îY– \í.r»±s@­Ÿ\í{¢GA\ì*º¸_\á ‘\ÆsW—V–9n˜À¹¸\ÆFÿ\0»\Æ*+\Ë\Ù/c·W„F±»ºñ\éL\n n=@4rx\0}jHvùŸ0ùI\çµ\\+h\0\Ã½×Ÿó\Å\0P—¡§#LaKu\ÏZ½¶È‘ó6	\ï)qe“÷±:\Ğzw\'#süY«Š°ó’§“\ÜúqN˜Zˆ”\Ä\É\ès@\Ã+e½iDNyõ¦[4\ã†9\İÖ˜2”\è{S%¶ŒE€v\0´\Õ²sÈ¢Š`9T¹9=9¤H÷g½P7\ÊÌ£µ:5ó,O4Q@\Øv\Æ1\ë\Í!\Ú:s\×4QHh\Õ0H\Í P1\çÚŠ(\İû†\0À4…”.6òG\\\ÑE1‚’q\íN\Î\æŠ(§ \0\nTmªH#ÚŠ(Ÿ4˜\É\Îx\æ”\å\å\âŠ(›™A*yõ§\'-“\Î=h¢€\ZÄ·Ò¤Dı\É\É4QHGe\É&\ä°<\ÑE0\×`^O\"šg“E\0Ÿy±Nl)Áô\ÍPd&23\Í=G\Ú&\nxÒŠ)l„À#ŸZ@\Ø3õ¢Š`\'¿¯4\ç\ê1À=¨¢€\00=iBo\É>´Q@ÿ\Ù'),(39,12,'CRUZ','JERON','BALINGASA','1994-01-02','1','LLAKDJFLAKSDJF','6546464654','A','ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿ\Û\0C\0!!$-K0-**-ZBE6Kl`roi`ifx‡«x~¢fi–Ì–¢±·ÀÀÀr\Ò\áÏºŞ«½À·ÿ\Û\0C!!!-\'-W00W·{i{··················································ÿ\Ä¢\0\0\0\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùú\0\0\0\0\0\0\0	\n\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿÀ\0,\"\0ÿ\Ú\0\0\0?\0­(\Í&ihh?4Œx™¤cÒ›Wÿ\0E<\rµ*Ê­œ08ô9¬\ë(’öx\á›&$~\Ìğ\Ç8\æ‹Ï±Gm+À©kwª\àúw ’ûJ¡°X\îib£pı9¡I>CHüœ\ã9¨­ô«V¿º†U2\nÉ–?( ñÖ 5T‡K„\èM3FLş[0m\Ç9\ÅXM.\ÅR\Õdƒ/(Á;]¹õö \n\Ôğj¶“j÷wk$YDe8\É\ï\ïP&Ÿo™u<±nx\ÙÂ’Ç€z\0\Õ\ÍªJµškWŠ<B\èY\×qÁ\àc¿¹ªñD­\'•d‚{’€?uG¯¹ \rq\"“€\ÊO 43ªı\æ\êj”\ÖúlRI±GnUAI3´œ÷Ú¢µ†¥‹\ë\ÔûL½\Øg¥‘ØŒzÑš¡6™lš¤\ì>Lªÿ\0»\Üpc‘Ki¤\ÛIqt$Œ²¤P<\ë\ï@ó\ëKšÊ·\Ó\íSNy®\"\ŞÁ\Ød±\é»½J\ÚM¯ö¤qˆÈ„\Ä\ÌWq\ä‚¯½\0iJ\rfC¤\Û6£r1\"¡E\Üx\È9\ï\íUá°·»\Ó\â’ö\É\æ…rôİƒ\ßÒ€73HdP\Ø, ú\ÍbÜ¢Y\\]½1ˆa\npIù˜õ\ç\ĞU©­4ûCO\Ó9\èG©÷ \r\"\Øc\ïB°a• PsXö6\Ñ]Iq\æHn-\àm±)l®1Ÿ\ÇÒ›silö–\×P\Å\å$djH¤÷\Å\0m\æŒ\ÖIÒ­¿µDb2!òw\Ü~öq´A¥[\ëµxÉŠ=»q\ã#ô¯š+]>\Õà³–\Êù² |1\åH9jIô«e\Ôm£HÈ‰•Ë®\ã\Î1şô¯š\\\Ö±³–Køc‹l†<e~¾´\ác7\ZzD¥g?¼‘÷\à2hf–’Š.h\Í%\0¹¢’–€9ÒƒM\Í«4šF\éIšF?-\0Z±[‰n\â¬‘\É\ZYó†éŠ»~‘j:T\Ó<afƒp\Ü=W¯>•B\ĞÈ˜š	*dr2ô5b{›«¸Œ2b¾÷–[ó¨$Ñ¹ÿ\0­?ı\æÿ\0\Ğ\rG\ã\Äs¯÷ Sùş½SŠòö–50\È…gpø¨S\í\İı©]br\à\àƒ\éLP#d\áv\Ùâ‰\êõªÚŒ¾V¡¦§ûgùıj“\\^½\â\\“\0tRppA¦\Ü}¦ö\â9¥hU\â\ÆÍ \ã9\Ï4·+‹V\ßÿ\0=eUüğ*¶ª^•$cşZ8›Vmı\İ\äÁF·8\ØQL¸\Ônn\ÕQ\nª¸oœPœ\Í‰>\ŞM¹‘ı:UYae³±‚Fe\Ú\çøN3š\'¸û4ö\è\Ñys3XŒÖƒÆ·ñª9WĞŠLª/–[;\äFx\Ô\ËÓ„z*°|2ª9\Ú@ü¤óuw[&x2*’*d0\İY\'—k$rDy\Û09¿\"j2l\Õt\Şz³\ÌV¤uµpç´¡1\éY“Z\Ü\\H·\Ë¸B`±ps^i\×)w\åo{eòœH»CrGL\Ğš\×ú6Œ\êW«f®\È\á#7_İ„Ÿ\ëı+:\ê»ø\Ö+–c\r»\ä\'­+E¨IgöV{`…6³ŒPö!!š\ãûÑ†ü…g\è\naó!\ê\Z4—\èH\çùSŒ:ƒYı”½¶Â›7a³Œb-nm\î<\ËV‡5B$·Ò•À¯¼d^\\:‡3;¦vÊ­[™¢ò¬¯\Ìs‰T…`:€:\Z}½’¦m¦`Û·n#§<S5”\"=´F\ä6=ñEÀ4\ët´k\ècûªù\Ó*\rU»m½gõa,®\í\äi¡¸WšOõ¢Eù[\Ó\éŠl\ÖWÉ¶òH•\0;cˆgO¥0/N\Â\Ş\ëû±ñ¤›[\\\ÎŞw\ä*”¶ú„Ö†Ù¤¶Wi`8¥{}B[Cl\ÒZ\ì+°°\r»&’<ı&\Ğÿ\0p\çòÈ«00¹\Ù?÷K¯\ë\éT\í\í¯l£1[=±‹q+¼6@=¸¤µ¶\Ô,\áò\ã’\ÕÁ%²Á³\Í\0AdJ\ëFQ\Ò\âIPe\Æ*W½‚\rb\å\î-OOJr\é÷\Çl\ÑIš&vmÀ\í;©¦\Êü›“\æZ\æ\ã¸n01\Å\0Nu›>\í \Ç\'÷M\Ç\éWQ\ÖDWC•a}Eg=¾£#H\Å\í‘6\àsş5z\Ş#´Q’Š>¸–Š( –’–€8\Ü\ï\ÑóxR\Z\\\Õ\ZX>oQF[¾( š.,ÚŸİ·Ö¦\ÍVµ8VúÔ¤Ô±n¥\ÍEšp4~iÀ\â¢œ\r\0AqŸ0óQŠ–\á~­CÒ˜‰TÕ˜\å**šš•Zš\İU…”0ô¬\Ä+MX(\àÔ´2\àjp5O\Î\"¥Šr\ÄqJ\áb\Ø½.y¨\Ë|Ô´®;\İH[\Ò\Õ= %S\Ã\ÕP\ÜÔ„ô¦‘ ¥\ëUC`\æ¦G§q4IE( ô¤¦HR\ÒQ@¢’ŠbŠJZ\0Z3IE–’–€8\Ê)(¦X\ì\ÑIFh-±\åªl\Õ{só¥JM\"Gfš4\àhğiÀ\Ó¥€*\ï#¨ªØ«©\Ï^X\ÌoÆ€·Ò—”)ô§­0!!‡­K\Ä\r¯ù\Ô\Ş^EA\'\î²iŒ•š¬[dŒ\Õ(\ØIŒpkB%Ø¢³cE…>´\â\Õ™MiGz‘ŠÏ‚j#/OJ\ß\Ğ\Ôe\éh>©\Ğ\ç5@J\rK\Ç$SBd\å¿JrI\ïU™ñŠT~i¢®)ûjš¿½!œ«òx¦„\Ñw4Sƒ\rIL¥¤¢€–’Š\0Z)( QIE1efŠf¢\ÒQE\0>ó~-AÃŠš‘,\\Ó…34¢S¨\Å<\Z\0š3S2	i¨#<Õ•4€¦CÀÿ\00\È\ìjuTpzœ€À‚*œ±4•\Î\ÓúSWmƒŠ«3o\â¤fnı*&S»\"\Ê%¶Œµt6Ró6€(˜\Ô1–^J®\ìM‹t©p‘Œ·\'Ò¤\ã\ê)\á\nl— ô\ÅEùr\r0¸öR†Ÿ`1¤g\Í>\Ìn=)¡1‹u5+t\à\Õm\ÛI¨ş\ÑûÁ\Ï†^I9¦I&NsH®®2*	\Ü)\Í4&i\ÚMÀ¯v¬[W\Î5¯\î@hD²JZJ)ˆZZJ(h¤¥ –’–€8¬\Ò\ÓsKL\ĞZ)( !ù\ÅJX\n®iKiÉƒóO _Z˜P!\âœ)‚œ)™5eMUCVT\Ğ«JÀ2i Ó¤s¶\ÂT”ª\Ù\æ¯Mn²®q\È\ïTXl\Ê\Ò(o\Ş=h*GCN^MN¨1Ú€ Y¶uV\âå¾\\WdA\éT\æq\È\ã dG-\æœ	I1œ\â‘p§£µ*)w\æ´d\"\Ú6qW\íSpoqT@À«e`>¦¡Ì¹\×ª\ÉÁ­›˜\ng#­e:\ír9¦‰d–\Îcr„’(¸}\Ç%ºu\'©§Eh\×38Q\Ô\Ñ\Ô:f\à\n×´“’µ‘,_e¹(9QÒ®\Ú\ÉûÅ©{©šZh¥¦!\ÔRR\Ğ\ÑIš(ii)s@P¢’Še‹EP1( \Ñ\ÜS!^¢¥CSw4x§\nh§\n@Jµe:UU«)@\ÉA§\n`4\ài(\èk>\åv¹­ª×‹‚(ª\ä‘\ÍMœT!)jV!;ª»¦i\à\Ğ\Ô®b\Ô\ÉJx\0S\ã\0¸\Í$şkn\ÅjÛ ŒE°R½ª@¼ò*ˆ\àWŠÅ¾µK¼\Z\è*¦¡x	\î9 h\ÅQµ\r\\°joõ5Q†v¨­8dj=ªF\ÊZ°\ãluTv-—A\ïVµ8L–\á”d¡\éUt\ÈÙ§Fiˆ\Ú¹¦\Ò\Ğ!sKIK@E&ihii( &–’Še‹KM¥¤\0M(¤4 ò)’\Ç’¾\â¤*,|\Ëô©VN\ÑN\"Õ”ª«V# dÂ)‹SÆ¹¤±\'5Vñ¹«Œ\ÛP\Ö}\ÃdÒ¸\ìSbGjaj‘‰<TeMP†\' \Âq@”\'4XW&BjK\\4œ€j´\ÒnPA¥µ“Š\Í\Ä*‹qQÉª\"u5J\êV1§VY|Nj„t¬)\ê‡5f;”ºŒ\ã\é\\¸”cŠ\Ğ\Òd>có\Æ:R°\\Kv5uxriÀúÔŒ\ZDUV%@\çÒ“4\ì\Ò\ì\Ò\æ›E0šPi¢–€Kšn­-\0:–š)\Ô\ÄP))i”´”P0&œ\Ôu*\0±\í\Ó\Ü\ĞK¼¹>•r½=È½\ÍB\r1\"a;}i\â\ã\Õj\nZ@[[„÷…Yh\Ïñ\n\Ì4i¿Šk\Æ\Êz05eŒ\Öm½³†&´GÊ˜\'&\Äw\ë“U%9©Y\ê&5#+H0sÒ¢\İ\Ï5;{T;>cT!Jƒ\Ğ\Ôn‡ş”¹¦\"®\â¤·û\Ôò¸#ŠDŒ\Æ\Ür;UGÀ\äşBP7\Z±!-\ëQ\'¢\Ğ@dÖ¶‚(Ï©ªqZ±\äñZPC°u¤\Øc\ázÓ³M¥¨\ì\Òæ™šPhL\Ò\æ£\Í.h 4\àj0iÀ\Óù¥\Í74¹ R\ÓihŠ\Í¥¹è¦œ!sü4\Æ0\ÑRıû•!€\â\0FMY·P\É\ï*#\ïf’& \àP’\â7\Îx {\Ô\0T\Ù<÷\ÍH‘–8\Å1JúV”V Œ°\ÅX[hĞ–§˜®S*(™˜\r¦µ-\íB`¸ü*\Â\í_º\0¥.*\\®4…\È\íÒ‡Áæ˜¤“I9aŒ\Z2\0\rEÇ©4¬u¨‰)ô¦!\ÌF­D¤³ex\ì<“ŠQ…nÀSÍƒHV¤A…\ëJE1… €8\çµ3@\n\r8(¥;n0iÂ€‚§Z‰idm±@_QKŸz\ÇiO4	¤^Œjl3b—5”·²ù©WP~\ë@\ZB”\Z¢º‚ÿ\0Ô«{\ïŠ[£ëŠ…gº0©\×\ÔP”¢šÒ—4\0ñKM¥¦#3šošj:\\\Ğ\Z¡ó\r&óI°úRùm\é@®!jU]Æœ\"5b\Ş¸M\0>\Ú\ÒI9\äZÑ\İc¡5* D\0qJ@*-!1McŠöj7“*JÌ¢Pi¬sM\Ïi¤\â˜É¢\æ(\ÇN\íD\Òf¨’6\Âö\ÍV“s6`T\ÆC\ÜqM\ÜOl\nd•X\àuõ§,™8\ÅXo\à\nc[\åi€DÄƒ“Š`\à\ÅV\äâ¦ˆL	¶Œu¤\\” Š\Ô]´„S…!lP—Še\Ãb\")\ê\à\æ«\ÎÔ€¨z\Òf‚i3Lb\ÑIKH\Í.i´´\0\àO­8JÃ£\Ze-\0N·R\â\ÍJº„ƒµS\Í-\0i.¥¢¤ş\Ò_J\Ê\Í-\0TÛŠ\\t§`R•D†1F9\Í.9\äR¨ \Å\ãÖµ\" ^\0\É\ëUm\"ù³\Ğ\nµõ2e$é¥¾”ŒFj=\Õ%Zc9\'\Æ*C’8¨™†:\ÓP\ÜR¨Ñ²9\ëN\êz\Ò$}E$Æš\Ô\Ù[\'#½14\å“\Ôf™\Í7>ô\ÄZYG`:sI‘Ö«”\Ï^\ÕD’1\È9ˆ1È¦\î¤V\ÃP±Ò”|§Š7\È\ÍHZ€*´²`u¢i6\rVf,y \Ç#g­,\Î‹Ö¢”\å\Í!\Í\Ú)ˆvh\Í&h\Í!¥\Í74P\éi´P©Ù¦f—4\0\êZnh\Í\0FzÑ/¸\Í\ë\ëVHc4\èÁ4Ó’\0ªHI\È /GòG\îiY©|¢¢/¦³e&›j2Ù£v)”J‰”õ)á¹¥rdûU!28Á)\êiNhŒ\ã\èiH\Í!Œ$šRp94\Ó\ÇÒœr’;P)1JŠx¦ U\ëM`µN‰‘šlÉ…&©Ê»­*\ÓùªALC\Ğ\àbœ\Ò\í\ïQ\î–\Å!w.y\ëJ«LQS/JLhQMh	\äSœ\ásL[ƒœ0´L½©˜«‚Tn\ãñ Æ­\×\î:Z­\ÇjŒ\ÂÃµ\02Š#µ\0´¹¤¢€KM¥ ¥¤\Í.h»rNh\ë\×ùQE\è:s\ëTHo\ã¿\ĞT‘j‹œñNS\Óo\ã@\ËT,\Ç=8 ¿aA\ç­C(hzzœô\Å\\œw­++usó\nC*ˆıN½€Wny¥se˜‰NHVT(fn8­P‚8S#\'=)\Ø#¨­h‘v”öE#†`»S Á\ïW\îl\ÒE;WkúŠ\È%’M\ÃM!6iŒS\Ö©±Ñ†ö©•\éˆb¢–<©>j) y\Ç!ô\ä4—N\ÇÚ¢\ßLDŒô‹\É\ÍE¾¤…²q@\np\éS\Ç=j\Üp/¥KE\\Í™JD& \Ôt\í[“Ú‰¡(8÷¬GFˆ²Aš“€h:Ÿ”ñH9Py\è?\Zv:\Üÿ\0xT\É*?z¦G÷G\Í\0v\\\Ò\å\Ë\Æ5n TMl;T	+«|¤\àz\Ô\Ëv?ˆR³\È\Úi„c­]Y\ÇR˜Õ½\é\\\n\"–¬µ°\í\ÅD`a\ïLQš0GZ(\0\Î[;~”€`ƒ\ßŞ§¾Gµ.}OÒ¨‘\ìOé§§©\Üƒ\×\éIŒ@ü)€¨üóR–\0d~]½şP*l2\Ì/º@¾¦ºeU@\0\í\\´PsŞºiø=iXw/\Z©5š¹/\nÿ\0Î§ó÷\Å$o•ç¨ Fqœ\Çû¶aÁ¦}®a)Q\Ó5kP·&ñòº­b‰Ì™ü\Ô\rq\Êd_˜j\Ì\Õ`¯c\ÍB²H?‹:[­ğ2±\Îi eû\İj™\ëV¾\Î(±@¶\É\Çj²p(M¡#¡ª— \Åc\ĞV£b³õ÷ZÉü4€Í¸“\ëM\Íb¨‘:ÓƒA£¿˜ fÍ±\İ5r:Ëµ¸\\=j\ìrn8Ë Ÿ¥C=¬\ãx\äwƒ&\Øòy¡J‘“H\Ë\Ë1nÊ€\ÕN§<[7(’[²x\È\Íb\à÷?…1\'?L\Òõ\Ïe¤l÷©2H(@\É8\È61…Á„\ç\î\äS˜\ã€F(\0Á4õ™Ñ°4\Ì\ãƒÔ˜# \ãŸz,µ»†*Âº8\àŠ\ÎÚªœòH\ã„\ç6\Í\Z·aMû2\ÕD¹t$‘\ëS-ğ\Ç*sJÃ¹\\\É\' \ïJw\0\Ş;L\Îzÿ\0:^¸ÛSVH¡KÈ¡¹\É#\éÚ[$ò½–\ÆF?J\0k}sô¦”#ƒRŒt>\Ôc\róZ`BPö«vT`œqŒ\ÓztÎ¢•\0RG§z@Xü¡É—>‚§:¹R8­-LøFÁÀÏ—8úT\Z–\ë »ıi\å7\Õü\Äe\ë7x†\ä\×^¢=B\Ş\å%…>I\Z>\ê¬@\Â*N|–ş´\æÄ¸ş#N‹cÌ¢I¦y5\Ö<\Â\ÛL‚MŠ\Ù0}ğ*\ÛX“T°•QU‹²¶^(©©\ØF€…Àã¡¤mZ\Çş~\äÂ¬\Ëj±\áF\Z6F\ãñÖª\Û\ßõ©¬ü D’İŸ(\íøP.§d\Ä´ı\r%\å\å¼A¢’Ui\Ú\İ\Ãk(\á\Ér\ä\ãh\Ïÿ\0Z—F\Ã\\Ş“ƒ\Ê\è4\æ7.z\Ò\îQüY®Ám\ÔjòMƒ\nòÂ£WûvÓş­\éˆ\ä÷)<R\îLrß…o\ë÷\Æ$’\Ğ[\åYAó=9ú{V¥¢$6vÑ7ô¢\àq”\ç<w\Æ1\Ô\Z\Ú\Ó\"\ë·\ê@\ÇQøœÿ\0Z¹ij ¾½!F\Ù\n¸üA\Ï\ëEÀç† \î¥@\'\Ó4£P8\Ø¡­-L:›m\Z´\ì±ı\ã“Tu«\Ë[Ä‹\Êÿ\0„o˜ G4‡s=\ï[‘ŸÊ¡IQI\'Ò·ü6¿º¹C\åRh÷¢y¥´1\ån;½~jb9\Ó\"»}\ïÒe\Éü+G]¼3\ÎÖ‰K†İ¼õ\ë;$ ~´\0}ßº\Ù\'Ò†\àu\ë\Ô\Ò8\Ç\ÍJK=(\0ÀÉ¥\äqH¸\'‘ŸÆ•²Nr:\ã€\0t)¡ˆ,98 ¨1\ÇJ62xö B¾\0Â‚Ö“\r\ëúÒªòX\ãÆšNO¥0\İ0 ?:R\ägo\'Ş„n\ä\äı(“š]\ä.ü…IŸlP@Ûº\r ¨Aœş\Ë.=(À0ß\0.zdœ\ĞóŒ€Nz\Ôrİ·¥?\æs\ÇaC#\ß\å##¹©ÿ\0È´¿\îGı*`Ow¹\Ç\çT\æÔ¦»\Ó~\Ë\ä\"¨\n7\ïô\ÇøSl¯\äÓ¦”\Ç—\Ì\ÇV\Æ1H\r\Í;\î^ÿ\0\×Ä•Z/ùıqo\ëU$\×\î6H\àŠ2ÀÛ³Šu9WKû¸(S~ú\0×¼ÿ\04X¿˜©o\Ïúu‡ıu?ú	¬Èµ\Ù\Ö$ŒZ#P3¿Ò«Í¬O=\ä“’D`÷>¦€:D™dX¿Š<\ÌVø«ÿ\0lÿ\0\è\ë¥ü—\"ù\Ğ!MşóU\ÒöAª›\ï-s’vnö\ÇZ\0¿®M\ä\êh@\Î`\Æ?\Z“Ã„±»\'®Wù\ZË¿½{û¥•FU6\à6sŞ¤\Óõ\Ó|İ‘¬¾a–\Æ(x\\gK^\íµP)³ÿ\0\Èv\Óş¹½aÿ\0iL–Q[˜—j8|\î\ë†\Î*f\Ö%’ò+¯!J\í\ß\×4g]¼•¦û\Ær\Ës¿ıjÖ–k‹gF\"\'p=ò1X\âd]¦\ÑrHş?CQ\\kOo7\ÙÂˆ‰8\İ÷³@\ZğÇ³\Äûğ«~¸ş•n	–xKVSõ\Ïÿ\0oKöŸ<[&vl\Æÿ\0|\Ôvš\ÌÖ¢P WH\În™\í@4±ue§›µ•\Ü\åš\"x8\à\Ô\Úü1=œwj¸|„©\ìk:\ÇVš\Æ	&ˆó´œc=ioµ)µEx–8”\çh9\Éú\Ğ†¿\Õ\\ÿ\0¾?•A ÿ\0\È^ó\è\ßúV\Óõ)l¡ `ylb¢²¿’\Æ\îY– \í.r»±s@­Ÿ\í{¢GA\ì*º¸_\á ‘\ÆsW—V–9n˜À¹¸\ÆFÿ\0»\Æ*+\Ë\Ù/c·W„F±»ºñ\éL\n n=@4rx\0}jHvùŸ0ùI\çµ\\+h\0\Ã½×Ÿó\Å\0P—¡§#LaKu\ÏZ½¶È‘ó6	\ï)qe“÷±:\Ğzw\'#süY«Š°ó’§“\ÜúqN˜Zˆ”\Ä\É\ès@\Ã+e½iDNyõ¦[4\ã†9\İÖ˜2”\è{S%¶ŒE€v\0´\Õ²sÈ¢Š`9T¹9=9¤H÷g½P7\ÊÌ£µ:5ó,O4Q@\Øv\Æ1\ë\Í!\Ú:s\×4QHh\Õ0H\Í P1\çÚŠ(\İû†\0À4…”.6òG\\\ÑE1‚’q\íN\Î\æŠ(§ \0\nTmªH#ÚŠ(Ÿ4˜\É\Îx\æ”\å\å\âŠ(›™A*yõ§\'-“\Î=h¢€\ZÄ·Ò¤Dı\É\É4QHGe\É&\ä°<\ÑE0\×`^O\"šg“E\0Ÿy±Nl)Áô\ÍPd&23\Í=G\Ú&\nxÒŠ)l„À#ŸZ@\Ø3õ¢Š`\'¿¯4\ç\ê1À=¨¢€\00=iBo\É>´Q@ÿ\Ù'),(40,11,'PARAS','CZARINA JOYCE','ORLEANES','1996-01-06','2','MLQ ST. PASIG, CITY','9067815759','A','ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿ\Û\0C\0!!$-K0-**-ZBE6Kl`roi`ifx‡«x~¢fi–Ì–¢±·ÀÀÀr\Ò\áÏºŞ«½À·ÿ\Û\0C!!!-\'-W00W·{i{··················································ÿ\Ä¢\0\0\0\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùú\0\0\0\0\0\0\0	\n\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿÀ\0,\"\0ÿ\Ú\0\0\0?\0­(\Í&ihh?4Œx™¤cÒ›Wÿ\0E<\rµ*Ê­œ08ô9¬\ë(’öx\á›&$~\Ìğ\Ç8\æ‹Ï±Gm+À©kwª\àúw ’ûJ¡°X\îib£pı9¡I>CHüœ\ã9¨­ô«V¿º†U2\nÉ–?( ñÖ 5T‡K„\èM3FLş[0m\Ç9\ÅXM.\ÅR\Õdƒ/(Á;]¹õö \n\Ôğj¶“j÷wk$YDe8\É\ï\ïP&Ÿo™u<±nx\ÙÂ’Ç€z\0\Õ\ÍªJµškWŠ<B\èY\×qÁ\àc¿¹ªñD­\'•d‚{’€?uG¯¹ \rq\"“€\ÊO 43ªı\æ\êj”\ÖúlRI±GnUAI3´œ÷Ú¢µ†¥‹\ë\ÔûL½\Øg¥‘ØŒzÑš¡6™lš¤\ì>Lªÿ\0»\Üpc‘Ki¤\ÛIqt$Œ²¤P<\ë\ï@ó\ëKšÊ·\Ó\íSNy®\"\ŞÁ\Ød±\é»½J\ÚM¯ö¤qˆÈ„\Ä\ÌWq\ä‚¯½\0iJ\rfC¤\Û6£r1\"¡E\Üx\È9\ï\íUá°·»\Ó\â’ö\É\æ…rôİƒ\ßÒ€73HdP\Ø, ú\ÍbÜ¢Y\\]½1ˆa\npIù˜õ\ç\ĞU©­4ûCO\Ó9\èG©÷ \r\"\Øc\ïB°a• PsXö6\Ñ]Iq\æHn-\àm±)l®1Ÿ\ÇÒ›silö–\×P\Å\å$djH¤÷\Å\0m\æŒ\ÖIÒ­¿µDb2!òw\Ü~öq´A¥[\ëµxÉŠ=»q\ã#ô¯š+]>\Õà³–\Êù² |1\åH9jIô«e\Ôm£HÈ‰•Ë®\ã\Î1şô¯š\\\Ö±³–Køc‹l†<e~¾´\ác7\ZzD¥g?¼‘÷\à2hf–’Š.h\Í%\0¹¢’–€9ÒƒM\Í«4šF\éIšF?-\0Z±[‰n\â¬‘\É\ZYó†éŠ»~‘j:T\Ó<afƒp\Ü=W¯>•B\ĞÈ˜š	*dr2ô5b{›«¸Œ2b¾÷–[ó¨$Ñ¹ÿ\0­?ı\æÿ\0\Ğ\rG\ã\Äs¯÷ Sùş½SŠòö–50\È…gpø¨S\í\İı©]br\à\àƒ\éLP#d\áv\Ùâ‰\êõªÚŒ¾V¡¦§ûgùıj“\\^½\â\\“\0tRppA¦\Ü}¦ö\â9¥hU\â\ÆÍ \ã9\Ï4·+‹V\ßÿ\0=eUüğ*¶ª^•$cşZ8›Vmı\İ\äÁF·8\ØQL¸\Ônn\ÕQ\nª¸oœPœ\Í‰>\ŞM¹‘ı:UYae³±‚Fe\Ú\çøN3š\'¸û4ö\è\Ñys3XŒÖƒÆ·ñª9WĞŠLª/–[;\äFx\Ô\ËÓ„z*°|2ª9\Ú@ü¤óuw[&x2*’*d0\İY\'—k$rDy\Û09¿\"j2l\Õt\Şz³\ÌV¤uµpç´¡1\éY“Z\Ü\\H·\Ë¸B`±ps^i\×)w\åo{eòœH»CrGL\Ğš\×ú6Œ\êW«f®\È\á#7_İ„Ÿ\ëı+:\ê»ø\Ö+–c\r»\ä\'­+E¨IgöV{`…6³ŒPö!!š\ãûÑ†ü…g\è\naó!\ê\Z4—\èH\çùSŒ:ƒYı”½¶Â›7a³Œb-nm\î<\ËV‡5B$·Ò•À¯¼d^\\:‡3;¦vÊ­[™¢ò¬¯\Ìs‰T…`:€:\Z}½’¦m¦`Û·n#§<S5”\"=´F\ä6=ñEÀ4\ët´k\ècûªù\Ó*\rU»m½gõa,®\í\äi¡¸WšOõ¢Eù[\Ó\éŠl\ÖWÉ¶òH•\0;cˆgO¥0/N\Â\Ş\ëû±ñ¤›[\\\ÎŞw\ä*”¶ú„Ö†Ù¤¶Wi`8¥{}B[Cl\ÒZ\ì+°°\r»&’<ı&\Ğÿ\0p\çòÈ«00¹\Ù?÷K¯\ë\éT\í\í¯l£1[=±‹q+¼6@=¸¤µ¶\Ô,\áò\ã’\ÕÁ%²Á³\Í\0AdJ\ëFQ\Ò\âIPe\Æ*W½‚\rb\å\î-OOJr\é÷\Çl\ÑIš&vmÀ\í;©¦\Êü›“\æZ\æ\ã¸n01\Å\0Nu›>\í \Ç\'÷M\Ç\éWQ\ÖDWC•a}Eg=¾£#H\Å\í‘6\àsş5z\Ş#´Q’Š>¸–Š( –’–€8\Ü\ï\ÑóxR\Z\\\Õ\ZX>oQF[¾( š.,ÚŸİ·Ö¦\ÍVµ8VúÔ¤Ô±n¥\ÍEšp4~iÀ\â¢œ\r\0AqŸ0óQŠ–\á~­CÒ˜‰TÕ˜\å**šš•Zš\İU…”0ô¬\Ä+MX(\àÔ´2\àjp5O\Î\"¥Šr\ÄqJ\áb\Ø½.y¨\Ë|Ô´®;\İH[\Ò\Õ= %S\Ã\ÕP\ÜÔ„ô¦‘ ¥\ëUC`\æ¦G§q4IE( ô¤¦HR\ÒQ@¢’ŠbŠJZ\0Z3IE–’–€8\Ê)(¦X\ì\ÑIFh-±\åªl\Õ{só¥JM\"Gfš4\àhğiÀ\Ó¥€*\ï#¨ªØ«©\Ï^X\ÌoÆ€·Ò—”)ô§­0!!‡­K\Ä\r¯ù\Ô\Ş^EA\'\î²iŒ•š¬[dŒ\Õ(\ØIŒpkB%Ø¢³cE…>´\â\Õ™MiGz‘ŠÏ‚j#/OJ\ß\Ğ\Ôe\éh>©\Ğ\ç5@J\rK\Ç$SBd\å¿JrI\ïU™ñŠT~i¢®)ûjš¿½!œ«òx¦„\Ñw4Sƒ\rIL¥¤¢€–’Š\0Z)( QIE1efŠf¢\ÒQE\0>ó~-AÃŠš‘,\\Ó…34¢S¨\Å<\Z\0š3S2	i¨#<Õ•4€¦CÀÿ\00\È\ìjuTpzœ€À‚*œ±4•\Î\ÓúSWmƒŠ«3o\â¤fnı*&S»\"\Ê%¶Œµt6Ró6€(˜\Ô1–^J®\ìM‹t©p‘Œ·\'Ò¤\ã\ê)\á\nl— ô\ÅEùr\r0¸öR†Ÿ`1¤g\Í>\Ìn=)¡1‹u5+t\à\Õm\ÛI¨ş\ÑûÁ\Ï†^I9¦I&NsH®®2*	\Ü)\Í4&i\ÚMÀ¯v¬[W\Î5¯\î@hD²JZJ)ˆZZJ(h¤¥ –’–€8¬\Ò\ÓsKL\ĞZ)( !ù\ÅJX\n®iKiÉƒóO _Z˜P!\âœ)‚œ)™5eMUCVT\Ğ«JÀ2i Ó¤s¶\ÂT”ª\Ù\æ¯Mn²®q\È\ïTXl\Ê\Ò(o\Ş=h*GCN^MN¨1Ú€ Y¶uV\âå¾\\WdA\éT\æq\È\ã dG-\æœ	I1œ\â‘p§£µ*)w\æ´d\"\Ú6qW\íSpoqT@À«e`>¦¡Ì¹\×ª\ÉÁ­›˜\ng#­e:\ír9¦‰d–\Îcr„’(¸}\Ç%ºu\'©§Eh\×38Q\Ô\Ñ\Ô:f\à\n×´“’µ‘,_e¹(9QÒ®\Ú\ÉûÅ©{©šZh¥¦!\ÔRR\Ğ\ÑIš(ii)s@P¢’Še‹EP1( \Ñ\ÜS!^¢¥CSw4x§\nh§\n@Jµe:UU«)@\ÉA§\n`4\ài(\èk>\åv¹­ª×‹‚(ª\ä‘\ÍMœT!)jV!;ª»¦i\à\Ğ\Ô®b\Ô\ÉJx\0S\ã\0¸\Í$şkn\ÅjÛ ŒE°R½ª@¼ò*ˆ\àWŠÅ¾µK¼\Z\è*¦¡x	\î9 h\ÅQµ\r\\°joõ5Q†v¨­8dj=ªF\ÊZ°\ãluTv-—A\ïVµ8L–\á”d¡\éUt\ÈÙ§Fiˆ\Ú¹¦\Ò\Ğ!sKIK@E&ihii( &–’Še‹KM¥¤\0M(¤4 ò)’\Ç’¾\â¤*,|\Ëô©VN\ÑN\"Õ”ª«V# dÂ)‹SÆ¹¤±\'5Vñ¹«Œ\ÛP\Ö}\ÃdÒ¸\ìSbGjaj‘‰<TeMP†\' \Âq@”\'4XW&BjK\\4œ€j´\ÒnPA¥µ“Š\Í\Ä*‹qQÉª\"u5J\êV1§VY|Nj„t¬)\ê‡5f;”ºŒ\ã\é\\¸”cŠ\Ğ\Òd>có\Æ:R°\\Kv5uxriÀúÔŒ\ZDUV%@\çÒ“4\ì\Ò\ì\Ò\æ›E0šPi¢–€Kšn­-\0:–š)\Ô\ÄP))i”´”P0&œ\Ôu*\0±\í\Ó\Ü\ĞK¼¹>•r½=È½\ÍB\r1\"a;}i\â\ã\Õj\nZ@[[„÷…Yh\Ïñ\n\Ì4i¿Šk\Æ\Êz05eŒ\Öm½³†&´GÊ˜\'&\Äw\ë“U%9©Y\ê&5#+H0sÒ¢\İ\Ï5;{T;>cT!Jƒ\Ğ\Ôn‡ş”¹¦\"®\â¤·û\Ôò¸#ŠDŒ\Æ\Ür;UGÀ\äşBP7\Z±!-\ëQ\'¢\Ğ@dÖ¶‚(Ï©ªqZ±\äñZPC°u¤\Øc\ázÓ³M¥¨\ì\Òæ™šPhL\Ò\æ£\Í.h 4\àj0iÀ\Óù¥\Í74¹ R\ÓihŠ\Í¥¹è¦œ!sü4\Æ0\ÑRıû•!€\â\0FMY·P\É\ï*#\ïf’& \àP’\â7\Îx {\Ô\0T\Ù<÷\ÍH‘–8\Å1JúV”V Œ°\ÅX[hĞ–§˜®S*(™˜\r¦µ-\íB`¸ü*\Â\í_º\0¥.*\\®4…\È\íÒ‡Áæ˜¤“I9aŒ\Z2\0\rEÇ©4¬u¨‰)ô¦!\ÌF­D¤³ex\ì<“ŠQ…nÀSÍƒHV¤A…\ëJE1… €8\çµ3@\n\r8(¥;n0iÂ€‚§Z‰idm±@_QKŸz\ÇiO4	¤^Œjl3b—5”·²ù©WP~\ë@\ZB”\Z¢º‚ÿ\0Ô«{\ïŠ[£ëŠ…gº0©\×\ÔP”¢šÒ—4\0ñKM¥¦#3šošj:\\\Ğ\Z¡ó\r&óI°úRùm\é@®!jU]Æœ\"5b\Ş¸M\0>\Ú\ÒI9\äZÑ\İc¡5* D\0qJ@*-!1McŠöj7“*JÌ¢Pi¬sM\Ïi¤\â˜É¢\æ(\ÇN\íD\Òf¨’6\Âö\ÍV“s6`T\ÆC\ÜqM\ÜOl\nd•X\àuõ§,™8\ÅXo\à\nc[\åi€DÄƒ“Š`\à\ÅV\äâ¦ˆL	¶Œu¤\\” Š\Ô]´„S…!lP—Še\Ãb\")\ê\à\æ«\ÎÔ€¨z\Òf‚i3Lb\ÑIKH\Í.i´´\0\àO­8JÃ£\Ze-\0N·R\â\ÍJº„ƒµS\Í-\0i.¥¢¤ş\Ò_J\Ê\Í-\0TÛŠ\\t§`R•D†1F9\Í.9\äR¨ \Å\ãÖµ\" ^\0\É\ëUm\"ù³\Ğ\nµõ2e$é¥¾”ŒFj=\Õ%Zc9\'\Æ*C’8¨™†:\ÓP\ÜR¨Ñ²9\ëN\êz\Ò$}E$Æš\Ô\Ù[\'#½14\å“\Ôf™\Í7>ô\ÄZYG`:sI‘Ö«”\Ï^\ÕD’1\È9ˆ1È¦\î¤V\ÃP±Ò”|§Š7\È\ÍHZ€*´²`u¢i6\rVf,y \Ç#g­,\Î‹Ö¢”\å\Í!\Í\Ú)ˆvh\Í&h\Í!¥\Í74P\éi´P©Ù¦f—4\0\êZnh\Í\0FzÑ/¸\Í\ë\ëVHc4\èÁ4Ó’\0ªHI\È /GòG\îiY©|¢¢/¦³e&›j2Ù£v)”J‰”õ)á¹¥rdûU!28Á)\êiNhŒ\ã\èiH\Í!Œ$šRp94\Ó\ÇÒœr’;P)1JŠx¦ U\ëM`µN‰‘šlÉ…&©Ê»­*\ÓùªALC\Ğ\àbœ\Ò\í\ïQ\î–\Å!w.y\ëJ«LQS/JLhQMh	\äSœ\ásL[ƒœ0´L½©˜«‚Tn\ãñ Æ­\×\î:Z­\ÇjŒ\ÂÃµ\02Š#µ\0´¹¤¢€KM¥ ¥¤\Í.h»rNh\ë\×ùQE\è:s\ëTHo\ã¿\ĞT‘j‹œñNS\Óo\ã@\ËT,\Ç=8 ¿aA\ç­C(hzzœô\Å\\œw­++usó\nC*ˆıN½€Wny¥se˜‰NHVT(fn8­P‚8S#\'=)\Ø#¨­h‘v”öE#†`»S Á\ïW\îl\ÒE;WkúŠ\È%’M\ÃM!6iŒS\Ö©±Ñ†ö©•\éˆb¢–<©>j) y\Ç!ô\ä4—N\ÇÚ¢\ßLDŒô‹\É\ÍE¾¤…²q@\np\éS\Ç=j\Üp/¥KE\\Í™JD& \Ôt\í[“Ú‰¡(8÷¬GFˆ²Aš“€h:Ÿ”ñH9Py\è?\Zv:\Üÿ\0xT\É*?z¦G÷G\Í\0v\\\Ò\å\Ë\Æ5n TMl;T	+«|¤\àz\Ô\Ëv?ˆR³\È\Úi„c­]Y\ÇR˜Õ½\é\\\n\"–¬µ°\í\ÅD`a\ïLQš0GZ(\0\Î[;~”€`ƒ\ßŞ§¾Gµ.}OÒ¨‘\ìOé§§©\Üƒ\×\éIŒ@ü)€¨üóR–\0d~]½şP*l2\Ì/º@¾¦ºeU@\0\í\\´PsŞºiø=iXw/\Z©5š¹/\nÿ\0Î§ó÷\Å$o•ç¨ Fqœ\Çû¶aÁ¦}®a)Q\Ó5kP·&ñòº­b‰Ì™ü\Ô\rq\Êd_˜j\Ì\Õ`¯c\ÍB²H?‹:[­ğ2±\Îi eû\İj™\ëV¾\Î(±@¶\É\Çj²p(M¡#¡ª— \Åc\ĞV£b³õ÷ZÉü4€Í¸“\ëM\Íb¨‘:ÓƒA£¿˜ fÍ±\İ5r:Ëµ¸\\=j\ìrn8Ë Ÿ¥C=¬\ãx\äwƒ&\Øòy¡J‘“H\Ë\Ë1nÊ€\ÕN§<[7(’[²x\È\Íb\à÷?…1\'?L\Òõ\Ïe¤l÷©2H(@\É8\È61…Á„\ç\î\äS˜\ã€F(\0Á4õ™Ñ°4\Ì\ãƒÔ˜# \ãŸz,µ»†*Âº8\àŠ\ÎÚªœòH\ã„\ç6\Í\Z·aMû2\ÕD¹t$‘\ëS-ğ\Ç*sJÃ¹\\\É\' \ïJw\0\Ş;L\Îzÿ\0:^¸ÛSVH¡KÈ¡¹\É#\éÚ[$ò½–\ÆF?J\0k}sô¦”#ƒRŒt>\Ôc\róZ`BPö«vT`œqŒ\ÓztÎ¢•\0RG§z@Xü¡É—>‚§:¹R8­-LøFÁÀÏ—8úT\Z–\ë »ıi\å7\Õü\Äe\ë7x†\ä\×^¢=B\Ş\å%…>I\Z>\ê¬@\Â*N|–ş´\æÄ¸ş#N‹cÌ¢I¦y5\Ö<\Â\ÛL‚MŠ\Ù0}ğ*\ÛX“T°•QU‹²¶^(©©\ØF€…Àã¡¤mZ\Çş~\äÂ¬\Ëj±\áF\Z6F\ãñÖª\Û\ßõ©¬ü D’İŸ(\íøP.§d\Ä´ı\r%\å\å¼A¢’Ui\Ú\İ\Ãk(\á\Ér\ä\ãh\Ïÿ\0Z—F\Ã\\Ş“ƒ\Ê\è4\æ7.z\Ò\îQüY®Ám\ÔjòMƒ\nòÂ£WûvÓş­\éˆ\ä÷)<R\îLrß…o\ë÷\Æ$’\Ğ[\åYAó=9ú{V¥¢$6vÑ7ô¢\àq”\ç<w\Æ1\Ô\Z\Ú\Ó\"\ë·\ê@\ÇQøœÿ\0Z¹ij ¾½!F\Ù\n¸üA\Ï\ëEÀç† \î¥@\'\Ó4£P8\Ø¡­-L:›m\Z´\ì±ı\ã“Tu«\Ë[Ä‹\Êÿ\0„o˜ G4‡s=\ï[‘ŸÊ¡IQI\'Ò·ü6¿º¹C\åRh÷¢y¥´1\ån;½~jb9\Ó\"»}\ïÒe\Éü+G]¼3\ÎÖ‰K†İ¼õ\ë;$ ~´\0}ßº\Ù\'Ò†\àu\ë\Ô\Ò8\Ç\ÍJK=(\0ÀÉ¥\äqH¸\'‘ŸÆ•²Nr:\ã€\0t)¡ˆ,98 ¨1\ÇJ62xö B¾\0Â‚Ö“\r\ëúÒªòX\ãÆšNO¥0\İ0 ?:R\ägo\'Ş„n\ä\äı(“š]\ä.ü…IŸlP@Ûº\r ¨Aœş\Ë.=(À0ß\0.zdœ\ĞóŒ€Nz\Ôrİ·¥?\æs\ÇaC#\ß\å##¹©ÿ\0È´¿\îGı*`Ow¹\Ç\çT\æÔ¦»\Ó~\Ë\ä\"¨\n7\ïô\ÇøSl¯\äÓ¦”\Ç—\Ì\ÇV\Æ1H\r\Í;\î^ÿ\0\×Ä•Z/ùıqo\ëU$\×\î6H\àŠ2ÀÛ³Šu9WKû¸(S~ú\0×¼ÿ\04X¿˜©o\Ïúu‡ıu?ú	¬Èµ\Ù\Ö$ŒZ#P3¿Ò«Í¬O=\ä“’D`÷>¦€:D™dX¿Š<\ÌVø«ÿ\0lÿ\0\è\ë¥ü—\"ù\Ğ!MşóU\ÒöAª›\ï-s’vnö\ÇZ\0¿®M\ä\êh@\Î`\Æ?\Z“Ã„±»\'®Wù\ZË¿½{û¥•FU6\à6sŞ¤\Óõ\Ó|İ‘¬¾a–\Æ(x\\gK^\íµP)³ÿ\0\Èv\Óş¹½aÿ\0iL–Q[˜—j8|\î\ë†\Î*f\Ö%’ò+¯!J\í\ß\×4g]¼•¦û\Ær\Ës¿ıjÖ–k‹gF\"\'p=ò1X\âd]¦\ÑrHş?CQ\\kOo7\ÙÂˆ‰8\İ÷³@\ZğÇ³\Äûğ«~¸ş•n	–xKVSõ\Ïÿ\0oKöŸ<[&vl\Æÿ\0|\Ôvš\ÌÖ¢P WH\În™\í@4±ue§›µ•\Ü\åš\"x8\à\Ô\Úü1=œwj¸|„©\ìk:\ÇVš\Æ	&ˆó´œc=ioµ)µEx–8”\çh9\Éú\Ğ†¿\Õ\\ÿ\0¾?•A ÿ\0\È^ó\è\ßúV\Óõ)l¡ `ylb¢²¿’\Æ\îY– \í.r»±s@­Ÿ\í{¢GA\ì*º¸_\á ‘\ÆsW—V–9n˜À¹¸\ÆFÿ\0»\Æ*+\Ë\Ù/c·W„F±»ºñ\éL\n n=@4rx\0}jHvùŸ0ùI\çµ\\+h\0\Ã½×Ÿó\Å\0P—¡§#LaKu\ÏZ½¶È‘ó6	\ï)qe“÷±:\Ğzw\'#süY«Š°ó’§“\ÜúqN˜Zˆ”\Ä\É\ès@\Ã+e½iDNyõ¦[4\ã†9\İÖ˜2”\è{S%¶ŒE€v\0´\Õ²sÈ¢Š`9T¹9=9¤H÷g½P7\ÊÌ£µ:5ó,O4Q@\Øv\Æ1\ë\Í!\Ú:s\×4QHh\Õ0H\Í P1\çÚŠ(\İû†\0À4…”.6òG\\\ÑE1‚’q\íN\Î\æŠ(§ \0\nTmªH#ÚŠ(Ÿ4˜\É\Îx\æ”\å\å\âŠ(›™A*yõ§\'-“\Î=h¢€\ZÄ·Ò¤Dı\É\É4QHGe\É&\ä°<\ÑE0\×`^O\"šg“E\0Ÿy±Nl)Áô\ÍPd&23\Í=G\Ú&\nxÒŠ)l„À#ŸZ@\Ø3õ¢Š`\'¿¯4\ç\ê1À=¨¢€\00=iBo\É>´Q@ÿ\Ù'),(42,13,'SANTOS','JEAN','RUL','1959-01-05','2','ROSARIO, PASIG','9051314055','A','ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿ\Û\0C\0!!$-K0-**-ZBE6Kl`roi`ifx‡«x~¢fi–Ì–¢±·ÀÀÀr\Ò\áÏºŞ«½À·ÿ\Û\0C!!!-\'-W00W·{i{··················································ÿ\Ä¢\0\0\0\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùú\0\0\0\0\0\0\0	\n\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿÀ\0,\"\0ÿ\Ú\0\0\0?\0­(\Í&ihh?4Œx™¤cÒ›Wÿ\0E<\rµ*Ê­œ08ô9¬\ë(’öx\á›&$~\Ìğ\Ç8\æ‹Ï±Gm+À©kwª\àúw ’ûJ¡°X\îib£pı9¡I>CHüœ\ã9¨­ô«V¿º†U2\nÉ–?( ñÖ 5T‡K„\èM3FLş[0m\Ç9\ÅXM.\ÅR\Õdƒ/(Á;]¹õö \n\Ôğj¶“j÷wk$YDe8\É\ï\ïP&Ÿo™u<±nx\ÙÂ’Ç€z\0\Õ\ÍªJµškWŠ<B\èY\×qÁ\àc¿¹ªñD­\'•d‚{’€?uG¯¹ \rq\"“€\ÊO 43ªı\æ\êj”\ÖúlRI±GnUAI3´œ÷Ú¢µ†¥‹\ë\ÔûL½\Øg¥‘ØŒzÑš¡6™lš¤\ì>Lªÿ\0»\Üpc‘Ki¤\ÛIqt$Œ²¤P<\ë\ï@ó\ëKšÊ·\Ó\íSNy®\"\ŞÁ\Ød±\é»½J\ÚM¯ö¤qˆÈ„\Ä\ÌWq\ä‚¯½\0iJ\rfC¤\Û6£r1\"¡E\Üx\È9\ï\íUá°·»\Ó\â’ö\É\æ…rôİƒ\ßÒ€73HdP\Ø, ú\ÍbÜ¢Y\\]½1ˆa\npIù˜õ\ç\ĞU©­4ûCO\Ó9\èG©÷ \r\"\Øc\ïB°a• PsXö6\Ñ]Iq\æHn-\àm±)l®1Ÿ\ÇÒ›silö–\×P\Å\å$djH¤÷\Å\0m\æŒ\ÖIÒ­¿µDb2!òw\Ü~öq´A¥[\ëµxÉŠ=»q\ã#ô¯š+]>\Õà³–\Êù² |1\åH9jIô«e\Ôm£HÈ‰•Ë®\ã\Î1şô¯š\\\Ö±³–Køc‹l†<e~¾´\ác7\ZzD¥g?¼‘÷\à2hf–’Š.h\Í%\0¹¢’–€9ÒƒM\Í«4šF\éIšF?-\0Z±[‰n\â¬‘\É\ZYó†éŠ»~‘j:T\Ó<afƒp\Ü=W¯>•B\ĞÈ˜š	*dr2ô5b{›«¸Œ2b¾÷–[ó¨$Ñ¹ÿ\0­?ı\æÿ\0\Ğ\rG\ã\Äs¯÷ Sùş½SŠòö–50\È…gpø¨S\í\İı©]br\à\àƒ\éLP#d\áv\Ùâ‰\êõªÚŒ¾V¡¦§ûgùıj“\\^½\â\\“\0tRppA¦\Ü}¦ö\â9¥hU\â\ÆÍ \ã9\Ï4·+‹V\ßÿ\0=eUüğ*¶ª^•$cşZ8›Vmı\İ\äÁF·8\ØQL¸\Ônn\ÕQ\nª¸oœPœ\Í‰>\ŞM¹‘ı:UYae³±‚Fe\Ú\çøN3š\'¸û4ö\è\Ñys3XŒÖƒÆ·ñª9WĞŠLª/–[;\äFx\Ô\ËÓ„z*°|2ª9\Ú@ü¤óuw[&x2*’*d0\İY\'—k$rDy\Û09¿\"j2l\Õt\Şz³\ÌV¤uµpç´¡1\éY“Z\Ü\\H·\Ë¸B`±ps^i\×)w\åo{eòœH»CrGL\Ğš\×ú6Œ\êW«f®\È\á#7_İ„Ÿ\ëı+:\ê»ø\Ö+–c\r»\ä\'­+E¨IgöV{`…6³ŒPö!!š\ãûÑ†ü…g\è\naó!\ê\Z4—\èH\çùSŒ:ƒYı”½¶Â›7a³Œb-nm\î<\ËV‡5B$·Ò•À¯¼d^\\:‡3;¦vÊ­[™¢ò¬¯\Ìs‰T…`:€:\Z}½’¦m¦`Û·n#§<S5”\"=´F\ä6=ñEÀ4\ët´k\ècûªù\Ó*\rU»m½gõa,®\í\äi¡¸WšOõ¢Eù[\Ó\éŠl\ÖWÉ¶òH•\0;cˆgO¥0/N\Â\Ş\ëû±ñ¤›[\\\ÎŞw\ä*”¶ú„Ö†Ù¤¶Wi`8¥{}B[Cl\ÒZ\ì+°°\r»&’<ı&\Ğÿ\0p\çòÈ«00¹\Ù?÷K¯\ë\éT\í\í¯l£1[=±‹q+¼6@=¸¤µ¶\Ô,\áò\ã’\ÕÁ%²Á³\Í\0AdJ\ëFQ\Ò\âIPe\Æ*W½‚\rb\å\î-OOJr\é÷\Çl\ÑIš&vmÀ\í;©¦\Êü›“\æZ\æ\ã¸n01\Å\0Nu›>\í \Ç\'÷M\Ç\éWQ\ÖDWC•a}Eg=¾£#H\Å\í‘6\àsş5z\Ş#´Q’Š>¸–Š( –’–€8\Ü\ï\ÑóxR\Z\\\Õ\ZX>oQF[¾( š.,ÚŸİ·Ö¦\ÍVµ8VúÔ¤Ô±n¥\ÍEšp4~iÀ\â¢œ\r\0AqŸ0óQŠ–\á~­CÒ˜‰TÕ˜\å**šš•Zš\İU…”0ô¬\Ä+MX(\àÔ´2\àjp5O\Î\"¥Šr\ÄqJ\áb\Ø½.y¨\Ë|Ô´®;\İH[\Ò\Õ= %S\Ã\ÕP\ÜÔ„ô¦‘ ¥\ëUC`\æ¦G§q4IE( ô¤¦HR\ÒQ@¢’ŠbŠJZ\0Z3IE–’–€8\Ê)(¦X\ì\ÑIFh-±\åªl\Õ{só¥JM\"Gfš4\àhğiÀ\Ó¥€*\ï#¨ªØ«©\Ï^X\ÌoÆ€·Ò—”)ô§­0!!‡­K\Ä\r¯ù\Ô\Ş^EA\'\î²iŒ•š¬[dŒ\Õ(\ØIŒpkB%Ø¢³cE…>´\â\Õ™MiGz‘ŠÏ‚j#/OJ\ß\Ğ\Ôe\éh>©\Ğ\ç5@J\rK\Ç$SBd\å¿JrI\ïU™ñŠT~i¢®)ûjš¿½!œ«òx¦„\Ñw4Sƒ\rIL¥¤¢€–’Š\0Z)( QIE1efŠf¢\ÒQE\0>ó~-AÃŠš‘,\\Ó…34¢S¨\Å<\Z\0š3S2	i¨#<Õ•4€¦CÀÿ\00\È\ìjuTpzœ€À‚*œ±4•\Î\ÓúSWmƒŠ«3o\â¤fnı*&S»\"\Ê%¶Œµt6Ró6€(˜\Ô1–^J®\ìM‹t©p‘Œ·\'Ò¤\ã\ê)\á\nl— ô\ÅEùr\r0¸öR†Ÿ`1¤g\Í>\Ìn=)¡1‹u5+t\à\Õm\ÛI¨ş\ÑûÁ\Ï†^I9¦I&NsH®®2*	\Ü)\Í4&i\ÚMÀ¯v¬[W\Î5¯\î@hD²JZJ)ˆZZJ(h¤¥ –’–€8¬\Ò\ÓsKL\ĞZ)( !ù\ÅJX\n®iKiÉƒóO _Z˜P!\âœ)‚œ)™5eMUCVT\Ğ«JÀ2i Ó¤s¶\ÂT”ª\Ù\æ¯Mn²®q\È\ïTXl\Ê\Ò(o\Ş=h*GCN^MN¨1Ú€ Y¶uV\âå¾\\WdA\éT\æq\È\ã dG-\æœ	I1œ\â‘p§£µ*)w\æ´d\"\Ú6qW\íSpoqT@À«e`>¦¡Ì¹\×ª\ÉÁ­›˜\ng#­e:\ír9¦‰d–\Îcr„’(¸}\Ç%ºu\'©§Eh\×38Q\Ô\Ñ\Ô:f\à\n×´“’µ‘,_e¹(9QÒ®\Ú\ÉûÅ©{©šZh¥¦!\ÔRR\Ğ\ÑIš(ii)s@P¢’Še‹EP1( \Ñ\ÜS!^¢¥CSw4x§\nh§\n@Jµe:UU«)@\ÉA§\n`4\ài(\èk>\åv¹­ª×‹‚(ª\ä‘\ÍMœT!)jV!;ª»¦i\à\Ğ\Ô®b\Ô\ÉJx\0S\ã\0¸\Í$şkn\ÅjÛ ŒE°R½ª@¼ò*ˆ\àWŠÅ¾µK¼\Z\è*¦¡x	\î9 h\ÅQµ\r\\°joõ5Q†v¨­8dj=ªF\ÊZ°\ãluTv-—A\ïVµ8L–\á”d¡\éUt\ÈÙ§Fiˆ\Ú¹¦\Ò\Ğ!sKIK@E&ihii( &–’Še‹KM¥¤\0M(¤4 ò)’\Ç’¾\â¤*,|\Ëô©VN\ÑN\"Õ”ª«V# dÂ)‹SÆ¹¤±\'5Vñ¹«Œ\ÛP\Ö}\ÃdÒ¸\ìSbGjaj‘‰<TeMP†\' \Âq@”\'4XW&BjK\\4œ€j´\ÒnPA¥µ“Š\Í\Ä*‹qQÉª\"u5J\êV1§VY|Nj„t¬)\ê‡5f;”ºŒ\ã\é\\¸”cŠ\Ğ\Òd>có\Æ:R°\\Kv5uxriÀúÔŒ\ZDUV%@\çÒ“4\ì\Ò\ì\Ò\æ›E0šPi¢–€Kšn­-\0:–š)\Ô\ÄP))i”´”P0&œ\Ôu*\0±\í\Ó\Ü\ĞK¼¹>•r½=È½\ÍB\r1\"a;}i\â\ã\Õj\nZ@[[„÷…Yh\Ïñ\n\Ì4i¿Šk\Æ\Êz05eŒ\Öm½³†&´GÊ˜\'&\Äw\ë“U%9©Y\ê&5#+H0sÒ¢\İ\Ï5;{T;>cT!Jƒ\Ğ\Ôn‡ş”¹¦\"®\â¤·û\Ôò¸#ŠDŒ\Æ\Ür;UGÀ\äşBP7\Z±!-\ëQ\'¢\Ğ@dÖ¶‚(Ï©ªqZ±\äñZPC°u¤\Øc\ázÓ³M¥¨\ì\Òæ™šPhL\Ò\æ£\Í.h 4\àj0iÀ\Óù¥\Í74¹ R\ÓihŠ\Í¥¹è¦œ!sü4\Æ0\ÑRıû•!€\â\0FMY·P\É\ï*#\ïf’& \àP’\â7\Îx {\Ô\0T\Ù<÷\ÍH‘–8\Å1JúV”V Œ°\ÅX[hĞ–§˜®S*(™˜\r¦µ-\íB`¸ü*\Â\í_º\0¥.*\\®4…\È\íÒ‡Áæ˜¤“I9aŒ\Z2\0\rEÇ©4¬u¨‰)ô¦!\ÌF­D¤³ex\ì<“ŠQ…nÀSÍƒHV¤A…\ëJE1… €8\çµ3@\n\r8(¥;n0iÂ€‚§Z‰idm±@_QKŸz\ÇiO4	¤^Œjl3b—5”·²ù©WP~\ë@\ZB”\Z¢º‚ÿ\0Ô«{\ïŠ[£ëŠ…gº0©\×\ÔP”¢šÒ—4\0ñKM¥¦#3šošj:\\\Ğ\Z¡ó\r&óI°úRùm\é@®!jU]Æœ\"5b\Ş¸M\0>\Ú\ÒI9\äZÑ\İc¡5* D\0qJ@*-!1McŠöj7“*JÌ¢Pi¬sM\Ïi¤\â˜É¢\æ(\ÇN\íD\Òf¨’6\Âö\ÍV“s6`T\ÆC\ÜqM\ÜOl\nd•X\àuõ§,™8\ÅXo\à\nc[\åi€DÄƒ“Š`\à\ÅV\äâ¦ˆL	¶Œu¤\\” Š\Ô]´„S…!lP—Še\Ãb\")\ê\à\æ«\ÎÔ€¨z\Òf‚i3Lb\ÑIKH\Í.i´´\0\àO­8JÃ£\Ze-\0N·R\â\ÍJº„ƒµS\Í-\0i.¥¢¤ş\Ò_J\Ê\Í-\0TÛŠ\\t§`R•D†1F9\Í.9\äR¨ \Å\ãÖµ\" ^\0\É\ëUm\"ù³\Ğ\nµõ2e$é¥¾”ŒFj=\Õ%Zc9\'\Æ*C’8¨™†:\ÓP\ÜR¨Ñ²9\ëN\êz\Ò$}E$Æš\Ô\Ù[\'#½14\å“\Ôf™\Í7>ô\ÄZYG`:sI‘Ö«”\Ï^\ÕD’1\È9ˆ1È¦\î¤V\ÃP±Ò”|§Š7\È\ÍHZ€*´²`u¢i6\rVf,y \Ç#g­,\Î‹Ö¢”\å\Í!\Í\Ú)ˆvh\Í&h\Í!¥\Í74P\éi´P©Ù¦f—4\0\êZnh\Í\0FzÑ/¸\Í\ë\ëVHc4\èÁ4Ó’\0ªHI\È /GòG\îiY©|¢¢/¦³e&›j2Ù£v)”J‰”õ)á¹¥rdûU!28Á)\êiNhŒ\ã\èiH\Í!Œ$šRp94\Ó\ÇÒœr’;P)1JŠx¦ U\ëM`µN‰‘šlÉ…&©Ê»­*\ÓùªALC\Ğ\àbœ\Ò\í\ïQ\î–\Å!w.y\ëJ«LQS/JLhQMh	\äSœ\ásL[ƒœ0´L½©˜«‚Tn\ãñ Æ­\×\î:Z­\ÇjŒ\ÂÃµ\02Š#µ\0´¹¤¢€KM¥ ¥¤\Í.h»rNh\ë\×ùQE\è:s\ëTHo\ã¿\ĞT‘j‹œñNS\Óo\ã@\ËT,\Ç=8 ¿aA\ç­C(hzzœô\Å\\œw­++usó\nC*ˆıN½€Wny¥se˜‰NHVT(fn8­P‚8S#\'=)\Ø#¨­h‘v”öE#†`»S Á\ïW\îl\ÒE;WkúŠ\È%’M\ÃM!6iŒS\Ö©±Ñ†ö©•\éˆb¢–<©>j) y\Ç!ô\ä4—N\ÇÚ¢\ßLDŒô‹\É\ÍE¾¤…²q@\np\éS\Ç=j\Üp/¥KE\\Í™JD& \Ôt\í[“Ú‰¡(8÷¬GFˆ²Aš“€h:Ÿ”ñH9Py\è?\Zv:\Üÿ\0xT\É*?z¦G÷G\Í\0v\\\Ò\å\Ë\Æ5n TMl;T	+«|¤\àz\Ô\Ëv?ˆR³\È\Úi„c­]Y\ÇR˜Õ½\é\\\n\"–¬µ°\í\ÅD`a\ïLQš0GZ(\0\Î[;~”€`ƒ\ßŞ§¾Gµ.}OÒ¨‘\ìOé§§©\Üƒ\×\éIŒ@ü)€¨üóR–\0d~]½şP*l2\Ì/º@¾¦ºeU@\0\í\\´PsŞºiø=iXw/\Z©5š¹/\nÿ\0Î§ó÷\Å$o•ç¨ Fqœ\Çû¶aÁ¦}®a)Q\Ó5kP·&ñòº­b‰Ì™ü\Ô\rq\Êd_˜j\Ì\Õ`¯c\ÍB²H?‹:[­ğ2±\Îi eû\İj™\ëV¾\Î(±@¶\É\Çj²p(M¡#¡ª— \Åc\ĞV£b³õ÷ZÉü4€Í¸“\ëM\Íb¨‘:ÓƒA£¿˜ fÍ±\İ5r:Ëµ¸\\=j\ìrn8Ë Ÿ¥C=¬\ãx\äwƒ&\Øòy¡J‘“H\Ë\Ë1nÊ€\ÕN§<[7(’[²x\È\Íb\à÷?…1\'?L\Òõ\Ïe¤l÷©2H(@\É8\È61…Á„\ç\î\äS˜\ã€F(\0Á4õ™Ñ°4\Ì\ãƒÔ˜# \ãŸz,µ»†*Âº8\àŠ\ÎÚªœòH\ã„\ç6\Í\Z·aMû2\ÕD¹t$‘\ëS-ğ\Ç*sJÃ¹\\\É\' \ïJw\0\Ş;L\Îzÿ\0:^¸ÛSVH¡KÈ¡¹\É#\éÚ[$ò½–\ÆF?J\0k}sô¦”#ƒRŒt>\Ôc\róZ`BPö«vT`œqŒ\ÓztÎ¢•\0RG§z@Xü¡É—>‚§:¹R8­-LøFÁÀÏ—8úT\Z–\ë »ıi\å7\Õü\Äe\ë7x†\ä\×^¢=B\Ş\å%…>I\Z>\ê¬@\Â*N|–ş´\æÄ¸ş#N‹cÌ¢I¦y5\Ö<\Â\ÛL‚MŠ\Ù0}ğ*\ÛX“T°•QU‹²¶^(©©\ØF€…Àã¡¤mZ\Çş~\äÂ¬\Ëj±\áF\Z6F\ãñÖª\Û\ßõ©¬ü D’İŸ(\íøP.§d\Ä´ı\r%\å\å¼A¢’Ui\Ú\İ\Ãk(\á\Ér\ä\ãh\Ïÿ\0Z—F\Ã\\Ş“ƒ\Ê\è4\æ7.z\Ò\îQüY®Ám\ÔjòMƒ\nòÂ£WûvÓş­\éˆ\ä÷)<R\îLrß…o\ë÷\Æ$’\Ğ[\åYAó=9ú{V¥¢$6vÑ7ô¢\àq”\ç<w\Æ1\Ô\Z\Ú\Ó\"\ë·\ê@\ÇQøœÿ\0Z¹ij ¾½!F\Ù\n¸üA\Ï\ëEÀç† \î¥@\'\Ó4£P8\Ø¡­-L:›m\Z´\ì±ı\ã“Tu«\Ë[Ä‹\Êÿ\0„o˜ G4‡s=\ï[‘ŸÊ¡IQI\'Ò·ü6¿º¹C\åRh÷¢y¥´1\ån;½~jb9\Ó\"»}\ïÒe\Éü+G]¼3\ÎÖ‰K†İ¼õ\ë;$ ~´\0}ßº\Ù\'Ò†\àu\ë\Ô\Ò8\Ç\ÍJK=(\0ÀÉ¥\äqH¸\'‘ŸÆ•²Nr:\ã€\0t)¡ˆ,98 ¨1\ÇJ62xö B¾\0Â‚Ö“\r\ëúÒªòX\ãÆšNO¥0\İ0 ?:R\ägo\'Ş„n\ä\äı(“š]\ä.ü…IŸlP@Ûº\r ¨Aœş\Ë.=(À0ß\0.zdœ\ĞóŒ€Nz\Ôrİ·¥?\æs\ÇaC#\ß\å##¹©ÿ\0È´¿\îGı*`Ow¹\Ç\çT\æÔ¦»\Ó~\Ë\ä\"¨\n7\ïô\ÇøSl¯\äÓ¦”\Ç—\Ì\ÇV\Æ1H\r\Í;\î^ÿ\0\×Ä•Z/ùıqo\ëU$\×\î6H\àŠ2ÀÛ³Šu9WKû¸(S~ú\0×¼ÿ\04X¿˜©o\Ïúu‡ıu?ú	¬Èµ\Ù\Ö$ŒZ#P3¿Ò«Í¬O=\ä“’D`÷>¦€:D™dX¿Š<\ÌVø«ÿ\0lÿ\0\è\ë¥ü—\"ù\Ğ!MşóU\ÒöAª›\ï-s’vnö\ÇZ\0¿®M\ä\êh@\Î`\Æ?\Z“Ã„±»\'®Wù\ZË¿½{û¥•FU6\à6sŞ¤\Óõ\Ó|İ‘¬¾a–\Æ(x\\gK^\íµP)³ÿ\0\Èv\Óş¹½aÿ\0iL–Q[˜—j8|\î\ë†\Î*f\Ö%’ò+¯!J\í\ß\×4g]¼•¦û\Ær\Ës¿ıjÖ–k‹gF\"\'p=ò1X\âd]¦\ÑrHş?CQ\\kOo7\ÙÂˆ‰8\İ÷³@\ZğÇ³\Äûğ«~¸ş•n	–xKVSõ\Ïÿ\0oKöŸ<[&vl\Æÿ\0|\Ôvš\ÌÖ¢P WH\În™\í@4±ue§›µ•\Ü\åš\"x8\à\Ô\Úü1=œwj¸|„©\ìk:\ÇVš\Æ	&ˆó´œc=ioµ)µEx–8”\çh9\Éú\Ğ†¿\Õ\\ÿ\0¾?•A ÿ\0\È^ó\è\ßúV\Óõ)l¡ `ylb¢²¿’\Æ\îY– \í.r»±s@­Ÿ\í{¢GA\ì*º¸_\á ‘\ÆsW—V–9n˜À¹¸\ÆFÿ\0»\Æ*+\Ë\Ù/c·W„F±»ºñ\éL\n n=@4rx\0}jHvùŸ0ùI\çµ\\+h\0\Ã½×Ÿó\Å\0P—¡§#LaKu\ÏZ½¶È‘ó6	\ï)qe“÷±:\Ğzw\'#süY«Š°ó’§“\ÜúqN˜Zˆ”\Ä\É\ès@\Ã+e½iDNyõ¦[4\ã†9\İÖ˜2”\è{S%¶ŒE€v\0´\Õ²sÈ¢Š`9T¹9=9¤H÷g½P7\ÊÌ£µ:5ó,O4Q@\Øv\Æ1\ë\Í!\Ú:s\×4QHh\Õ0H\Í P1\çÚŠ(\İû†\0À4…”.6òG\\\ÑE1‚’q\íN\Î\æŠ(§ \0\nTmªH#ÚŠ(Ÿ4˜\É\Îx\æ”\å\å\âŠ(›™A*yõ§\'-“\Î=h¢€\ZÄ·Ò¤Dı\É\É4QHGe\É&\ä°<\ÑE0\×`^O\"šg“E\0Ÿy±Nl)Áô\ÍPd&23\Í=G\Ú&\nxÒŠ)l„À#ŸZ@\Ø3õ¢Š`\'¿¯4\ç\ê1À=¨¢€\00=iBo\É>´Q@ÿ\Ù'),(43,12,'SANTOS','NIDA','RULL','1997-01-03','1','ADFADFASDFAFASDFASDF','4545645645','A','ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿ\Û\0C\0!!$-K0-**-ZBE6Kl`roi`ifx‡«x~¢fi–Ì–¢±·ÀÀÀr\Ò\áÏºŞ«½À·ÿ\Û\0C!!!-\'-W00W·{i{··················································ÿ\Ä¢\0\0\0\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùú\0\0\0\0\0\0\0	\n\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿÀ\0,\"\0ÿ\Ú\0\0\0?\0­(\Í&ihh?4Œx™¤cÒ›Wÿ\0E<\rµ*Ê­œ08ô9¬\ë(’öx\á›&$~\Ìğ\Ç8\æ‹Ï±Gm+À©kwª\àúw ’ûJ¡°X\îib£pı9¡I>CHüœ\ã9¨­ô«V¿º†U2\nÉ–?( ñÖ 5T‡K„\èM3FLş[0m\Ç9\ÅXM.\ÅR\Õdƒ/(Á;]¹õö \n\Ôğj¶“j÷wk$YDe8\É\ï\ïP&Ÿo™u<±nx\ÙÂ’Ç€z\0\Õ\ÍªJµškWŠ<B\èY\×qÁ\àc¿¹ªñD­\'•d‚{’€?uG¯¹ \rq\"“€\ÊO 43ªı\æ\êj”\ÖúlRI±GnUAI3´œ÷Ú¢µ†¥‹\ë\ÔûL½\Øg¥‘ØŒzÑš¡6™lš¤\ì>Lªÿ\0»\Üpc‘Ki¤\ÛIqt$Œ²¤P<\ë\ï@ó\ëKšÊ·\Ó\íSNy®\"\ŞÁ\Ød±\é»½J\ÚM¯ö¤qˆÈ„\Ä\ÌWq\ä‚¯½\0iJ\rfC¤\Û6£r1\"¡E\Üx\È9\ï\íUá°·»\Ó\â’ö\É\æ…rôİƒ\ßÒ€73HdP\Ø, ú\ÍbÜ¢Y\\]½1ˆa\npIù˜õ\ç\ĞU©­4ûCO\Ó9\èG©÷ \r\"\Øc\ïB°a• PsXö6\Ñ]Iq\æHn-\àm±)l®1Ÿ\ÇÒ›silö–\×P\Å\å$djH¤÷\Å\0m\æŒ\ÖIÒ­¿µDb2!òw\Ü~öq´A¥[\ëµxÉŠ=»q\ã#ô¯š+]>\Õà³–\Êù² |1\åH9jIô«e\Ôm£HÈ‰•Ë®\ã\Î1şô¯š\\\Ö±³–Køc‹l†<e~¾´\ác7\ZzD¥g?¼‘÷\à2hf–’Š.h\Í%\0¹¢’–€9ÒƒM\Í«4šF\éIšF?-\0Z±[‰n\â¬‘\É\ZYó†éŠ»~‘j:T\Ó<afƒp\Ü=W¯>•B\ĞÈ˜š	*dr2ô5b{›«¸Œ2b¾÷–[ó¨$Ñ¹ÿ\0­?ı\æÿ\0\Ğ\rG\ã\Äs¯÷ Sùş½SŠòö–50\È…gpø¨S\í\İı©]br\à\àƒ\éLP#d\áv\Ùâ‰\êõªÚŒ¾V¡¦§ûgùıj“\\^½\â\\“\0tRppA¦\Ü}¦ö\â9¥hU\â\ÆÍ \ã9\Ï4·+‹V\ßÿ\0=eUüğ*¶ª^•$cşZ8›Vmı\İ\äÁF·8\ØQL¸\Ônn\ÕQ\nª¸oœPœ\Í‰>\ŞM¹‘ı:UYae³±‚Fe\Ú\çøN3š\'¸û4ö\è\Ñys3XŒÖƒÆ·ñª9WĞŠLª/–[;\äFx\Ô\ËÓ„z*°|2ª9\Ú@ü¤óuw[&x2*’*d0\İY\'—k$rDy\Û09¿\"j2l\Õt\Şz³\ÌV¤uµpç´¡1\éY“Z\Ü\\H·\Ë¸B`±ps^i\×)w\åo{eòœH»CrGL\Ğš\×ú6Œ\êW«f®\È\á#7_İ„Ÿ\ëı+:\ê»ø\Ö+–c\r»\ä\'­+E¨IgöV{`…6³ŒPö!!š\ãûÑ†ü…g\è\naó!\ê\Z4—\èH\çùSŒ:ƒYı”½¶Â›7a³Œb-nm\î<\ËV‡5B$·Ò•À¯¼d^\\:‡3;¦vÊ­[™¢ò¬¯\Ìs‰T…`:€:\Z}½’¦m¦`Û·n#§<S5”\"=´F\ä6=ñEÀ4\ët´k\ècûªù\Ó*\rU»m½gõa,®\í\äi¡¸WšOõ¢Eù[\Ó\éŠl\ÖWÉ¶òH•\0;cˆgO¥0/N\Â\Ş\ëû±ñ¤›[\\\ÎŞw\ä*”¶ú„Ö†Ù¤¶Wi`8¥{}B[Cl\ÒZ\ì+°°\r»&’<ı&\Ğÿ\0p\çòÈ«00¹\Ù?÷K¯\ë\éT\í\í¯l£1[=±‹q+¼6@=¸¤µ¶\Ô,\áò\ã’\ÕÁ%²Á³\Í\0AdJ\ëFQ\Ò\âIPe\Æ*W½‚\rb\å\î-OOJr\é÷\Çl\ÑIš&vmÀ\í;©¦\Êü›“\æZ\æ\ã¸n01\Å\0Nu›>\í \Ç\'÷M\Ç\éWQ\ÖDWC•a}Eg=¾£#H\Å\í‘6\àsş5z\Ş#´Q’Š>¸–Š( –’–€8\Ü\ï\ÑóxR\Z\\\Õ\ZX>oQF[¾( š.,ÚŸİ·Ö¦\ÍVµ8VúÔ¤Ô±n¥\ÍEšp4~iÀ\â¢œ\r\0AqŸ0óQŠ–\á~­CÒ˜‰TÕ˜\å**šš•Zš\İU…”0ô¬\Ä+MX(\àÔ´2\àjp5O\Î\"¥Šr\ÄqJ\áb\Ø½.y¨\Ë|Ô´®;\İH[\Ò\Õ= %S\Ã\ÕP\ÜÔ„ô¦‘ ¥\ëUC`\æ¦G§q4IE( ô¤¦HR\ÒQ@¢’ŠbŠJZ\0Z3IE–’–€8\Ê)(¦X\ì\ÑIFh-±\åªl\Õ{só¥JM\"Gfš4\àhğiÀ\Ó¥€*\ï#¨ªØ«©\Ï^X\ÌoÆ€·Ò—”)ô§­0!!‡­K\Ä\r¯ù\Ô\Ş^EA\'\î²iŒ•š¬[dŒ\Õ(\ØIŒpkB%Ø¢³cE…>´\â\Õ™MiGz‘ŠÏ‚j#/OJ\ß\Ğ\Ôe\éh>©\Ğ\ç5@J\rK\Ç$SBd\å¿JrI\ïU™ñŠT~i¢®)ûjš¿½!œ«òx¦„\Ñw4Sƒ\rIL¥¤¢€–’Š\0Z)( QIE1efŠf¢\ÒQE\0>ó~-AÃŠš‘,\\Ó…34¢S¨\Å<\Z\0š3S2	i¨#<Õ•4€¦CÀÿ\00\È\ìjuTpzœ€À‚*œ±4•\Î\ÓúSWmƒŠ«3o\â¤fnı*&S»\"\Ê%¶Œµt6Ró6€(˜\Ô1–^J®\ìM‹t©p‘Œ·\'Ò¤\ã\ê)\á\nl— ô\ÅEùr\r0¸öR†Ÿ`1¤g\Í>\Ìn=)¡1‹u5+t\à\Õm\ÛI¨ş\ÑûÁ\Ï†^I9¦I&NsH®®2*	\Ü)\Í4&i\ÚMÀ¯v¬[W\Î5¯\î@hD²JZJ)ˆZZJ(h¤¥ –’–€8¬\Ò\ÓsKL\ĞZ)( !ù\ÅJX\n®iKiÉƒóO _Z˜P!\âœ)‚œ)™5eMUCVT\Ğ«JÀ2i Ó¤s¶\ÂT”ª\Ù\æ¯Mn²®q\È\ïTXl\Ê\Ò(o\Ş=h*GCN^MN¨1Ú€ Y¶uV\âå¾\\WdA\éT\æq\È\ã dG-\æœ	I1œ\â‘p§£µ*)w\æ´d\"\Ú6qW\íSpoqT@À«e`>¦¡Ì¹\×ª\ÉÁ­›˜\ng#­e:\ír9¦‰d–\Îcr„’(¸}\Ç%ºu\'©§Eh\×38Q\Ô\Ñ\Ô:f\à\n×´“’µ‘,_e¹(9QÒ®\Ú\ÉûÅ©{©šZh¥¦!\ÔRR\Ğ\ÑIš(ii)s@P¢’Še‹EP1( \Ñ\ÜS!^¢¥CSw4x§\nh§\n@Jµe:UU«)@\ÉA§\n`4\ài(\èk>\åv¹­ª×‹‚(ª\ä‘\ÍMœT!)jV!;ª»¦i\à\Ğ\Ô®b\Ô\ÉJx\0S\ã\0¸\Í$şkn\ÅjÛ ŒE°R½ª@¼ò*ˆ\àWŠÅ¾µK¼\Z\è*¦¡x	\î9 h\ÅQµ\r\\°joõ5Q†v¨­8dj=ªF\ÊZ°\ãluTv-—A\ïVµ8L–\á”d¡\éUt\ÈÙ§Fiˆ\Ú¹¦\Ò\Ğ!sKIK@E&ihii( &–’Še‹KM¥¤\0M(¤4 ò)’\Ç’¾\â¤*,|\Ëô©VN\ÑN\"Õ”ª«V# dÂ)‹SÆ¹¤±\'5Vñ¹«Œ\ÛP\Ö}\ÃdÒ¸\ìSbGjaj‘‰<TeMP†\' \Âq@”\'4XW&BjK\\4œ€j´\ÒnPA¥µ“Š\Í\Ä*‹qQÉª\"u5J\êV1§VY|Nj„t¬)\ê‡5f;”ºŒ\ã\é\\¸”cŠ\Ğ\Òd>có\Æ:R°\\Kv5uxriÀúÔŒ\ZDUV%@\çÒ“4\ì\Ò\ì\Ò\æ›E0šPi¢–€Kšn­-\0:–š)\Ô\ÄP))i”´”P0&œ\Ôu*\0±\í\Ó\Ü\ĞK¼¹>•r½=È½\ÍB\r1\"a;}i\â\ã\Õj\nZ@[[„÷…Yh\Ïñ\n\Ì4i¿Šk\Æ\Êz05eŒ\Öm½³†&´GÊ˜\'&\Äw\ë“U%9©Y\ê&5#+H0sÒ¢\İ\Ï5;{T;>cT!Jƒ\Ğ\Ôn‡ş”¹¦\"®\â¤·û\Ôò¸#ŠDŒ\Æ\Ür;UGÀ\äşBP7\Z±!-\ëQ\'¢\Ğ@dÖ¶‚(Ï©ªqZ±\äñZPC°u¤\Øc\ázÓ³M¥¨\ì\Òæ™šPhL\Ò\æ£\Í.h 4\àj0iÀ\Óù¥\Í74¹ R\ÓihŠ\Í¥¹è¦œ!sü4\Æ0\ÑRıû•!€\â\0FMY·P\É\ï*#\ïf’& \àP’\â7\Îx {\Ô\0T\Ù<÷\ÍH‘–8\Å1JúV”V Œ°\ÅX[hĞ–§˜®S*(™˜\r¦µ-\íB`¸ü*\Â\í_º\0¥.*\\®4…\È\íÒ‡Áæ˜¤“I9aŒ\Z2\0\rEÇ©4¬u¨‰)ô¦!\ÌF­D¤³ex\ì<“ŠQ…nÀSÍƒHV¤A…\ëJE1… €8\çµ3@\n\r8(¥;n0iÂ€‚§Z‰idm±@_QKŸz\ÇiO4	¤^Œjl3b—5”·²ù©WP~\ë@\ZB”\Z¢º‚ÿ\0Ô«{\ïŠ[£ëŠ…gº0©\×\ÔP”¢šÒ—4\0ñKM¥¦#3šošj:\\\Ğ\Z¡ó\r&óI°úRùm\é@®!jU]Æœ\"5b\Ş¸M\0>\Ú\ÒI9\äZÑ\İc¡5* D\0qJ@*-!1McŠöj7“*JÌ¢Pi¬sM\Ïi¤\â˜É¢\æ(\ÇN\íD\Òf¨’6\Âö\ÍV“s6`T\ÆC\ÜqM\ÜOl\nd•X\àuõ§,™8\ÅXo\à\nc[\åi€DÄƒ“Š`\à\ÅV\äâ¦ˆL	¶Œu¤\\” Š\Ô]´„S…!lP—Še\Ãb\")\ê\à\æ«\ÎÔ€¨z\Òf‚i3Lb\ÑIKH\Í.i´´\0\àO­8JÃ£\Ze-\0N·R\â\ÍJº„ƒµS\Í-\0i.¥¢¤ş\Ò_J\Ê\Í-\0TÛŠ\\t§`R•D†1F9\Í.9\äR¨ \Å\ãÖµ\" ^\0\É\ëUm\"ù³\Ğ\nµõ2e$é¥¾”ŒFj=\Õ%Zc9\'\Æ*C’8¨™†:\ÓP\ÜR¨Ñ²9\ëN\êz\Ò$}E$Æš\Ô\Ù[\'#½14\å“\Ôf™\Í7>ô\ÄZYG`:sI‘Ö«”\Ï^\ÕD’1\È9ˆ1È¦\î¤V\ÃP±Ò”|§Š7\È\ÍHZ€*´²`u¢i6\rVf,y \Ç#g­,\Î‹Ö¢”\å\Í!\Í\Ú)ˆvh\Í&h\Í!¥\Í74P\éi´P©Ù¦f—4\0\êZnh\Í\0FzÑ/¸\Í\ë\ëVHc4\èÁ4Ó’\0ªHI\È /GòG\îiY©|¢¢/¦³e&›j2Ù£v)”J‰”õ)á¹¥rdûU!28Á)\êiNhŒ\ã\èiH\Í!Œ$šRp94\Ó\ÇÒœr’;P)1JŠx¦ U\ëM`µN‰‘šlÉ…&©Ê»­*\ÓùªALC\Ğ\àbœ\Ò\í\ïQ\î–\Å!w.y\ëJ«LQS/JLhQMh	\äSœ\ásL[ƒœ0´L½©˜«‚Tn\ãñ Æ­\×\î:Z­\ÇjŒ\ÂÃµ\02Š#µ\0´¹¤¢€KM¥ ¥¤\Í.h»rNh\ë\×ùQE\è:s\ëTHo\ã¿\ĞT‘j‹œñNS\Óo\ã@\ËT,\Ç=8 ¿aA\ç­C(hzzœô\Å\\œw­++usó\nC*ˆıN½€Wny¥se˜‰NHVT(fn8­P‚8S#\'=)\Ø#¨­h‘v”öE#†`»S Á\ïW\îl\ÒE;WkúŠ\È%’M\ÃM!6iŒS\Ö©±Ñ†ö©•\éˆb¢–<©>j) y\Ç!ô\ä4—N\ÇÚ¢\ßLDŒô‹\É\ÍE¾¤…²q@\np\éS\Ç=j\Üp/¥KE\\Í™JD& \Ôt\í[“Ú‰¡(8÷¬GFˆ²Aš“€h:Ÿ”ñH9Py\è?\Zv:\Üÿ\0xT\É*?z¦G÷G\Í\0v\\\Ò\å\Ë\Æ5n TMl;T	+«|¤\àz\Ô\Ëv?ˆR³\È\Úi„c­]Y\ÇR˜Õ½\é\\\n\"–¬µ°\í\ÅD`a\ïLQš0GZ(\0\Î[;~”€`ƒ\ßŞ§¾Gµ.}OÒ¨‘\ìOé§§©\Üƒ\×\éIŒ@ü)€¨üóR–\0d~]½şP*l2\Ì/º@¾¦ºeU@\0\í\\´PsŞºiø=iXw/\Z©5š¹/\nÿ\0Î§ó÷\Å$o•ç¨ Fqœ\Çû¶aÁ¦}®a)Q\Ó5kP·&ñòº­b‰Ì™ü\Ô\rq\Êd_˜j\Ì\Õ`¯c\ÍB²H?‹:[­ğ2±\Îi eû\İj™\ëV¾\Î(±@¶\É\Çj²p(M¡#¡ª— \Åc\ĞV£b³õ÷ZÉü4€Í¸“\ëM\Íb¨‘:ÓƒA£¿˜ fÍ±\İ5r:Ëµ¸\\=j\ìrn8Ë Ÿ¥C=¬\ãx\äwƒ&\Øòy¡J‘“H\Ë\Ë1nÊ€\ÕN§<[7(’[²x\È\Íb\à÷?…1\'?L\Òõ\Ïe¤l÷©2H(@\É8\È61…Á„\ç\î\äS˜\ã€F(\0Á4õ™Ñ°4\Ì\ãƒÔ˜# \ãŸz,µ»†*Âº8\àŠ\ÎÚªœòH\ã„\ç6\Í\Z·aMû2\ÕD¹t$‘\ëS-ğ\Ç*sJÃ¹\\\É\' \ïJw\0\Ş;L\Îzÿ\0:^¸ÛSVH¡KÈ¡¹\É#\éÚ[$ò½–\ÆF?J\0k}sô¦”#ƒRŒt>\Ôc\róZ`BPö«vT`œqŒ\ÓztÎ¢•\0RG§z@Xü¡É—>‚§:¹R8­-LøFÁÀÏ—8úT\Z–\ë »ıi\å7\Õü\Äe\ë7x†\ä\×^¢=B\Ş\å%…>I\Z>\ê¬@\Â*N|–ş´\æÄ¸ş#N‹cÌ¢I¦y5\Ö<\Â\ÛL‚MŠ\Ù0}ğ*\ÛX“T°•QU‹²¶^(©©\ØF€…Àã¡¤mZ\Çş~\äÂ¬\Ëj±\áF\Z6F\ãñÖª\Û\ßõ©¬ü D’İŸ(\íøP.§d\Ä´ı\r%\å\å¼A¢’Ui\Ú\İ\Ãk(\á\Ér\ä\ãh\Ïÿ\0Z—F\Ã\\Ş“ƒ\Ê\è4\æ7.z\Ò\îQüY®Ám\ÔjòMƒ\nòÂ£WûvÓş­\éˆ\ä÷)<R\îLrß…o\ë÷\Æ$’\Ğ[\åYAó=9ú{V¥¢$6vÑ7ô¢\àq”\ç<w\Æ1\Ô\Z\Ú\Ó\"\ë·\ê@\ÇQøœÿ\0Z¹ij ¾½!F\Ù\n¸üA\Ï\ëEÀç† \î¥@\'\Ó4£P8\Ø¡­-L:›m\Z´\ì±ı\ã“Tu«\Ë[Ä‹\Êÿ\0„o˜ G4‡s=\ï[‘ŸÊ¡IQI\'Ò·ü6¿º¹C\åRh÷¢y¥´1\ån;½~jb9\Ó\"»}\ïÒe\Éü+G]¼3\ÎÖ‰K†İ¼õ\ë;$ ~´\0}ßº\Ù\'Ò†\àu\ë\Ô\Ò8\Ç\ÍJK=(\0ÀÉ¥\äqH¸\'‘ŸÆ•²Nr:\ã€\0t)¡ˆ,98 ¨1\ÇJ62xö B¾\0Â‚Ö“\r\ëúÒªòX\ãÆšNO¥0\İ0 ?:R\ägo\'Ş„n\ä\äı(“š]\ä.ü…IŸlP@Ûº\r ¨Aœş\Ë.=(À0ß\0.zdœ\ĞóŒ€Nz\Ôrİ·¥?\æs\ÇaC#\ß\å##¹©ÿ\0È´¿\îGı*`Ow¹\Ç\çT\æÔ¦»\Ó~\Ë\ä\"¨\n7\ïô\ÇøSl¯\äÓ¦”\Ç—\Ì\ÇV\Æ1H\r\Í;\î^ÿ\0\×Ä•Z/ùıqo\ëU$\×\î6H\àŠ2ÀÛ³Šu9WKû¸(S~ú\0×¼ÿ\04X¿˜©o\Ïúu‡ıu?ú	¬Èµ\Ù\Ö$ŒZ#P3¿Ò«Í¬O=\ä“’D`÷>¦€:D™dX¿Š<\ÌVø«ÿ\0lÿ\0\è\ë¥ü—\"ù\Ğ!MşóU\ÒöAª›\ï-s’vnö\ÇZ\0¿®M\ä\êh@\Î`\Æ?\Z“Ã„±»\'®Wù\ZË¿½{û¥•FU6\à6sŞ¤\Óõ\Ó|İ‘¬¾a–\Æ(x\\gK^\íµP)³ÿ\0\Èv\Óş¹½aÿ\0iL–Q[˜—j8|\î\ë†\Î*f\Ö%’ò+¯!J\í\ß\×4g]¼•¦û\Ær\Ës¿ıjÖ–k‹gF\"\'p=ò1X\âd]¦\ÑrHş?CQ\\kOo7\ÙÂˆ‰8\İ÷³@\ZğÇ³\Äûğ«~¸ş•n	–xKVSõ\Ïÿ\0oKöŸ<[&vl\Æÿ\0|\Ôvš\ÌÖ¢P WH\În™\í@4±ue§›µ•\Ü\åš\"x8\à\Ô\Úü1=œwj¸|„©\ìk:\ÇVš\Æ	&ˆó´œc=ioµ)µEx–8”\çh9\Éú\Ğ†¿\Õ\\ÿ\0¾?•A ÿ\0\È^ó\è\ßúV\Óõ)l¡ `ylb¢²¿’\Æ\îY– \í.r»±s@­Ÿ\í{¢GA\ì*º¸_\á ‘\ÆsW—V–9n˜À¹¸\ÆFÿ\0»\Æ*+\Ë\Ù/c·W„F±»ºñ\éL\n n=@4rx\0}jHvùŸ0ùI\çµ\\+h\0\Ã½×Ÿó\Å\0P—¡§#LaKu\ÏZ½¶È‘ó6	\ï)qe“÷±:\Ğzw\'#süY«Š°ó’§“\ÜúqN˜Zˆ”\Ä\É\ès@\Ã+e½iDNyõ¦[4\ã†9\İÖ˜2”\è{S%¶ŒE€v\0´\Õ²sÈ¢Š`9T¹9=9¤H÷g½P7\ÊÌ£µ:5ó,O4Q@\Øv\Æ1\ë\Í!\Ú:s\×4QHh\Õ0H\Í P1\çÚŠ(\İû†\0À4…”.6òG\\\ÑE1‚’q\íN\Î\æŠ(§ \0\nTmªH#ÚŠ(Ÿ4˜\É\Îx\æ”\å\å\âŠ(›™A*yõ§\'-“\Î=h¢€\ZÄ·Ò¤Dı\É\É4QHGe\É&\ä°<\ÑE0\×`^O\"šg“E\0Ÿy±Nl)Áô\ÍPd&23\Í=G\Ú&\nxÒŠ)l„À#ŸZ@\Ø3õ¢Š`\'¿¯4\ç\ê1À=¨¢€\00=iBo\É>´Q@ÿ\Ù'),(44,13,'MONTANEZ','RONALDO','MONTANEZ','1997-01-03','1','ASDFADFASDFADF','6546546546','I','ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿ\Û\0C\0!!$-K0-**-ZBE6Kl`roi`ifx‡«x~¢fi–Ì–¢±·ÀÀÀr\Ò\áÏºŞ«½À·ÿ\Û\0C!!!-\'-W00W·{i{··················································ÿ\Ä¢\0\0\0\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùú\0\0\0\0\0\0\0	\n\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿÀ\0,\"\0ÿ\Ú\0\0\0?\0­(\Í&ihh?4Œx™¤cÒ›Wÿ\0E<\rµ*Ê­œ08ô9¬\ë(’öx\á›&$~\Ìğ\Ç8\æ‹Ï±Gm+À©kwª\àúw ’ûJ¡°X\îib£pı9¡I>CHüœ\ã9¨­ô«V¿º†U2\nÉ–?( ñÖ 5T‡K„\èM3FLş[0m\Ç9\ÅXM.\ÅR\Õdƒ/(Á;]¹õö \n\Ôğj¶“j÷wk$YDe8\É\ï\ïP&Ÿo™u<±nx\ÙÂ’Ç€z\0\Õ\ÍªJµškWŠ<B\èY\×qÁ\àc¿¹ªñD­\'•d‚{’€?uG¯¹ \rq\"“€\ÊO 43ªı\æ\êj”\ÖúlRI±GnUAI3´œ÷Ú¢µ†¥‹\ë\ÔûL½\Øg¥‘ØŒzÑš¡6™lš¤\ì>Lªÿ\0»\Üpc‘Ki¤\ÛIqt$Œ²¤P<\ë\ï@ó\ëKšÊ·\Ó\íSNy®\"\ŞÁ\Ød±\é»½J\ÚM¯ö¤qˆÈ„\Ä\ÌWq\ä‚¯½\0iJ\rfC¤\Û6£r1\"¡E\Üx\È9\ï\íUá°·»\Ó\â’ö\É\æ…rôİƒ\ßÒ€73HdP\Ø, ú\ÍbÜ¢Y\\]½1ˆa\npIù˜õ\ç\ĞU©­4ûCO\Ó9\èG©÷ \r\"\Øc\ïB°a• PsXö6\Ñ]Iq\æHn-\àm±)l®1Ÿ\ÇÒ›silö–\×P\Å\å$djH¤÷\Å\0m\æŒ\ÖIÒ­¿µDb2!òw\Ü~öq´A¥[\ëµxÉŠ=»q\ã#ô¯š+]>\Õà³–\Êù² |1\åH9jIô«e\Ôm£HÈ‰•Ë®\ã\Î1şô¯š\\\Ö±³–Køc‹l†<e~¾´\ác7\ZzD¥g?¼‘÷\à2hf–’Š.h\Í%\0¹¢’–€9ÒƒM\Í«4šF\éIšF?-\0Z±[‰n\â¬‘\É\ZYó†éŠ»~‘j:T\Ó<afƒp\Ü=W¯>•B\ĞÈ˜š	*dr2ô5b{›«¸Œ2b¾÷–[ó¨$Ñ¹ÿ\0­?ı\æÿ\0\Ğ\rG\ã\Äs¯÷ Sùş½SŠòö–50\È…gpø¨S\í\İı©]br\à\àƒ\éLP#d\áv\Ùâ‰\êõªÚŒ¾V¡¦§ûgùıj“\\^½\â\\“\0tRppA¦\Ü}¦ö\â9¥hU\â\ÆÍ \ã9\Ï4·+‹V\ßÿ\0=eUüğ*¶ª^•$cşZ8›Vmı\İ\äÁF·8\ØQL¸\Ônn\ÕQ\nª¸oœPœ\Í‰>\ŞM¹‘ı:UYae³±‚Fe\Ú\çøN3š\'¸û4ö\è\Ñys3XŒÖƒÆ·ñª9WĞŠLª/–[;\äFx\Ô\ËÓ„z*°|2ª9\Ú@ü¤óuw[&x2*’*d0\İY\'—k$rDy\Û09¿\"j2l\Õt\Şz³\ÌV¤uµpç´¡1\éY“Z\Ü\\H·\Ë¸B`±ps^i\×)w\åo{eòœH»CrGL\Ğš\×ú6Œ\êW«f®\È\á#7_İ„Ÿ\ëı+:\ê»ø\Ö+–c\r»\ä\'­+E¨IgöV{`…6³ŒPö!!š\ãûÑ†ü…g\è\naó!\ê\Z4—\èH\çùSŒ:ƒYı”½¶Â›7a³Œb-nm\î<\ËV‡5B$·Ò•À¯¼d^\\:‡3;¦vÊ­[™¢ò¬¯\Ìs‰T…`:€:\Z}½’¦m¦`Û·n#§<S5”\"=´F\ä6=ñEÀ4\ët´k\ècûªù\Ó*\rU»m½gõa,®\í\äi¡¸WšOõ¢Eù[\Ó\éŠl\ÖWÉ¶òH•\0;cˆgO¥0/N\Â\Ş\ëû±ñ¤›[\\\ÎŞw\ä*”¶ú„Ö†Ù¤¶Wi`8¥{}B[Cl\ÒZ\ì+°°\r»&’<ı&\Ğÿ\0p\çòÈ«00¹\Ù?÷K¯\ë\éT\í\í¯l£1[=±‹q+¼6@=¸¤µ¶\Ô,\áò\ã’\ÕÁ%²Á³\Í\0AdJ\ëFQ\Ò\âIPe\Æ*W½‚\rb\å\î-OOJr\é÷\Çl\ÑIš&vmÀ\í;©¦\Êü›“\æZ\æ\ã¸n01\Å\0Nu›>\í \Ç\'÷M\Ç\éWQ\ÖDWC•a}Eg=¾£#H\Å\í‘6\àsş5z\Ş#´Q’Š>¸–Š( –’–€8\Ü\ï\ÑóxR\Z\\\Õ\ZX>oQF[¾( š.,ÚŸİ·Ö¦\ÍVµ8VúÔ¤Ô±n¥\ÍEšp4~iÀ\â¢œ\r\0AqŸ0óQŠ–\á~­CÒ˜‰TÕ˜\å**šš•Zš\İU…”0ô¬\Ä+MX(\àÔ´2\àjp5O\Î\"¥Šr\ÄqJ\áb\Ø½.y¨\Ë|Ô´®;\İH[\Ò\Õ= %S\Ã\ÕP\ÜÔ„ô¦‘ ¥\ëUC`\æ¦G§q4IE( ô¤¦HR\ÒQ@¢’ŠbŠJZ\0Z3IE–’–€8\Ê)(¦X\ì\ÑIFh-±\åªl\Õ{só¥JM\"Gfš4\àhğiÀ\Ó¥€*\ï#¨ªØ«©\Ï^X\ÌoÆ€·Ò—”)ô§­0!!‡­K\Ä\r¯ù\Ô\Ş^EA\'\î²iŒ•š¬[dŒ\Õ(\ØIŒpkB%Ø¢³cE…>´\â\Õ™MiGz‘ŠÏ‚j#/OJ\ß\Ğ\Ôe\éh>©\Ğ\ç5@J\rK\Ç$SBd\å¿JrI\ïU™ñŠT~i¢®)ûjš¿½!œ«òx¦„\Ñw4Sƒ\rIL¥¤¢€–’Š\0Z)( QIE1efŠf¢\ÒQE\0>ó~-AÃŠš‘,\\Ó…34¢S¨\Å<\Z\0š3S2	i¨#<Õ•4€¦CÀÿ\00\È\ìjuTpzœ€À‚*œ±4•\Î\ÓúSWmƒŠ«3o\â¤fnı*&S»\"\Ê%¶Œµt6Ró6€(˜\Ô1–^J®\ìM‹t©p‘Œ·\'Ò¤\ã\ê)\á\nl— ô\ÅEùr\r0¸öR†Ÿ`1¤g\Í>\Ìn=)¡1‹u5+t\à\Õm\ÛI¨ş\ÑûÁ\Ï†^I9¦I&NsH®®2*	\Ü)\Í4&i\ÚMÀ¯v¬[W\Î5¯\î@hD²JZJ)ˆZZJ(h¤¥ –’–€8¬\Ò\ÓsKL\ĞZ)( !ù\ÅJX\n®iKiÉƒóO _Z˜P!\âœ)‚œ)™5eMUCVT\Ğ«JÀ2i Ó¤s¶\ÂT”ª\Ù\æ¯Mn²®q\È\ïTXl\Ê\Ò(o\Ş=h*GCN^MN¨1Ú€ Y¶uV\âå¾\\WdA\éT\æq\È\ã dG-\æœ	I1œ\â‘p§£µ*)w\æ´d\"\Ú6qW\íSpoqT@À«e`>¦¡Ì¹\×ª\ÉÁ­›˜\ng#­e:\ír9¦‰d–\Îcr„’(¸}\Ç%ºu\'©§Eh\×38Q\Ô\Ñ\Ô:f\à\n×´“’µ‘,_e¹(9QÒ®\Ú\ÉûÅ©{©šZh¥¦!\ÔRR\Ğ\ÑIš(ii)s@P¢’Še‹EP1( \Ñ\ÜS!^¢¥CSw4x§\nh§\n@Jµe:UU«)@\ÉA§\n`4\ài(\èk>\åv¹­ª×‹‚(ª\ä‘\ÍMœT!)jV!;ª»¦i\à\Ğ\Ô®b\Ô\ÉJx\0S\ã\0¸\Í$şkn\ÅjÛ ŒE°R½ª@¼ò*ˆ\àWŠÅ¾µK¼\Z\è*¦¡x	\î9 h\ÅQµ\r\\°joõ5Q†v¨­8dj=ªF\ÊZ°\ãluTv-—A\ïVµ8L–\á”d¡\éUt\ÈÙ§Fiˆ\Ú¹¦\Ò\Ğ!sKIK@E&ihii( &–’Še‹KM¥¤\0M(¤4 ò)’\Ç’¾\â¤*,|\Ëô©VN\ÑN\"Õ”ª«V# dÂ)‹SÆ¹¤±\'5Vñ¹«Œ\ÛP\Ö}\ÃdÒ¸\ìSbGjaj‘‰<TeMP†\' \Âq@”\'4XW&BjK\\4œ€j´\ÒnPA¥µ“Š\Í\Ä*‹qQÉª\"u5J\êV1§VY|Nj„t¬)\ê‡5f;”ºŒ\ã\é\\¸”cŠ\Ğ\Òd>có\Æ:R°\\Kv5uxriÀúÔŒ\ZDUV%@\çÒ“4\ì\Ò\ì\Ò\æ›E0šPi¢–€Kšn­-\0:–š)\Ô\ÄP))i”´”P0&œ\Ôu*\0±\í\Ó\Ü\ĞK¼¹>•r½=È½\ÍB\r1\"a;}i\â\ã\Õj\nZ@[[„÷…Yh\Ïñ\n\Ì4i¿Šk\Æ\Êz05eŒ\Öm½³†&´GÊ˜\'&\Äw\ë“U%9©Y\ê&5#+H0sÒ¢\İ\Ï5;{T;>cT!Jƒ\Ğ\Ôn‡ş”¹¦\"®\â¤·û\Ôò¸#ŠDŒ\Æ\Ür;UGÀ\äşBP7\Z±!-\ëQ\'¢\Ğ@dÖ¶‚(Ï©ªqZ±\äñZPC°u¤\Øc\ázÓ³M¥¨\ì\Òæ™šPhL\Ò\æ£\Í.h 4\àj0iÀ\Óù¥\Í74¹ R\ÓihŠ\Í¥¹è¦œ!sü4\Æ0\ÑRıû•!€\â\0FMY·P\É\ï*#\ïf’& \àP’\â7\Îx {\Ô\0T\Ù<÷\ÍH‘–8\Å1JúV”V Œ°\ÅX[hĞ–§˜®S*(™˜\r¦µ-\íB`¸ü*\Â\í_º\0¥.*\\®4…\È\íÒ‡Áæ˜¤“I9aŒ\Z2\0\rEÇ©4¬u¨‰)ô¦!\ÌF­D¤³ex\ì<“ŠQ…nÀSÍƒHV¤A…\ëJE1… €8\çµ3@\n\r8(¥;n0iÂ€‚§Z‰idm±@_QKŸz\ÇiO4	¤^Œjl3b—5”·²ù©WP~\ë@\ZB”\Z¢º‚ÿ\0Ô«{\ïŠ[£ëŠ…gº0©\×\ÔP”¢šÒ—4\0ñKM¥¦#3šošj:\\\Ğ\Z¡ó\r&óI°úRùm\é@®!jU]Æœ\"5b\Ş¸M\0>\Ú\ÒI9\äZÑ\İc¡5* D\0qJ@*-!1McŠöj7“*JÌ¢Pi¬sM\Ïi¤\â˜É¢\æ(\ÇN\íD\Òf¨’6\Âö\ÍV“s6`T\ÆC\ÜqM\ÜOl\nd•X\àuõ§,™8\ÅXo\à\nc[\åi€DÄƒ“Š`\à\ÅV\äâ¦ˆL	¶Œu¤\\” Š\Ô]´„S…!lP—Še\Ãb\")\ê\à\æ«\ÎÔ€¨z\Òf‚i3Lb\ÑIKH\Í.i´´\0\àO­8JÃ£\Ze-\0N·R\â\ÍJº„ƒµS\Í-\0i.¥¢¤ş\Ò_J\Ê\Í-\0TÛŠ\\t§`R•D†1F9\Í.9\äR¨ \Å\ãÖµ\" ^\0\É\ëUm\"ù³\Ğ\nµõ2e$é¥¾”ŒFj=\Õ%Zc9\'\Æ*C’8¨™†:\ÓP\ÜR¨Ñ²9\ëN\êz\Ò$}E$Æš\Ô\Ù[\'#½14\å“\Ôf™\Í7>ô\ÄZYG`:sI‘Ö«”\Ï^\ÕD’1\È9ˆ1È¦\î¤V\ÃP±Ò”|§Š7\È\ÍHZ€*´²`u¢i6\rVf,y \Ç#g­,\Î‹Ö¢”\å\Í!\Í\Ú)ˆvh\Í&h\Í!¥\Í74P\éi´P©Ù¦f—4\0\êZnh\Í\0FzÑ/¸\Í\ë\ëVHc4\èÁ4Ó’\0ªHI\È /GòG\îiY©|¢¢/¦³e&›j2Ù£v)”J‰”õ)á¹¥rdûU!28Á)\êiNhŒ\ã\èiH\Í!Œ$šRp94\Ó\ÇÒœr’;P)1JŠx¦ U\ëM`µN‰‘šlÉ…&©Ê»­*\ÓùªALC\Ğ\àbœ\Ò\í\ïQ\î–\Å!w.y\ëJ«LQS/JLhQMh	\äSœ\ásL[ƒœ0´L½©˜«‚Tn\ãñ Æ­\×\î:Z­\ÇjŒ\ÂÃµ\02Š#µ\0´¹¤¢€KM¥ ¥¤\Í.h»rNh\ë\×ùQE\è:s\ëTHo\ã¿\ĞT‘j‹œñNS\Óo\ã@\ËT,\Ç=8 ¿aA\ç­C(hzzœô\Å\\œw­++usó\nC*ˆıN½€Wny¥se˜‰NHVT(fn8­P‚8S#\'=)\Ø#¨­h‘v”öE#†`»S Á\ïW\îl\ÒE;WkúŠ\È%’M\ÃM!6iŒS\Ö©±Ñ†ö©•\éˆb¢–<©>j) y\Ç!ô\ä4—N\ÇÚ¢\ßLDŒô‹\É\ÍE¾¤…²q@\np\éS\Ç=j\Üp/¥KE\\Í™JD& \Ôt\í[“Ú‰¡(8÷¬GFˆ²Aš“€h:Ÿ”ñH9Py\è?\Zv:\Üÿ\0xT\É*?z¦G÷G\Í\0v\\\Ò\å\Ë\Æ5n TMl;T	+«|¤\àz\Ô\Ëv?ˆR³\È\Úi„c­]Y\ÇR˜Õ½\é\\\n\"–¬µ°\í\ÅD`a\ïLQš0GZ(\0\Î[;~”€`ƒ\ßŞ§¾Gµ.}OÒ¨‘\ìOé§§©\Üƒ\×\éIŒ@ü)€¨üóR–\0d~]½şP*l2\Ì/º@¾¦ºeU@\0\í\\´PsŞºiø=iXw/\Z©5š¹/\nÿ\0Î§ó÷\Å$o•ç¨ Fqœ\Çû¶aÁ¦}®a)Q\Ó5kP·&ñòº­b‰Ì™ü\Ô\rq\Êd_˜j\Ì\Õ`¯c\ÍB²H?‹:[­ğ2±\Îi eû\İj™\ëV¾\Î(±@¶\É\Çj²p(M¡#¡ª— \Åc\ĞV£b³õ÷ZÉü4€Í¸“\ëM\Íb¨‘:ÓƒA£¿˜ fÍ±\İ5r:Ëµ¸\\=j\ìrn8Ë Ÿ¥C=¬\ãx\äwƒ&\Øòy¡J‘“H\Ë\Ë1nÊ€\ÕN§<[7(’[²x\È\Íb\à÷?…1\'?L\Òõ\Ïe¤l÷©2H(@\É8\È61…Á„\ç\î\äS˜\ã€F(\0Á4õ™Ñ°4\Ì\ãƒÔ˜# \ãŸz,µ»†*Âº8\àŠ\ÎÚªœòH\ã„\ç6\Í\Z·aMû2\ÕD¹t$‘\ëS-ğ\Ç*sJÃ¹\\\É\' \ïJw\0\Ş;L\Îzÿ\0:^¸ÛSVH¡KÈ¡¹\É#\éÚ[$ò½–\ÆF?J\0k}sô¦”#ƒRŒt>\Ôc\róZ`BPö«vT`œqŒ\ÓztÎ¢•\0RG§z@Xü¡É—>‚§:¹R8­-LøFÁÀÏ—8úT\Z–\ë »ıi\å7\Õü\Äe\ë7x†\ä\×^¢=B\Ş\å%…>I\Z>\ê¬@\Â*N|–ş´\æÄ¸ş#N‹cÌ¢I¦y5\Ö<\Â\ÛL‚MŠ\Ù0}ğ*\ÛX“T°•QU‹²¶^(©©\ØF€…Àã¡¤mZ\Çş~\äÂ¬\Ëj±\áF\Z6F\ãñÖª\Û\ßõ©¬ü D’İŸ(\íøP.§d\Ä´ı\r%\å\å¼A¢’Ui\Ú\İ\Ãk(\á\Ér\ä\ãh\Ïÿ\0Z—F\Ã\\Ş“ƒ\Ê\è4\æ7.z\Ò\îQüY®Ám\ÔjòMƒ\nòÂ£WûvÓş­\éˆ\ä÷)<R\îLrß…o\ë÷\Æ$’\Ğ[\åYAó=9ú{V¥¢$6vÑ7ô¢\àq”\ç<w\Æ1\Ô\Z\Ú\Ó\"\ë·\ê@\ÇQøœÿ\0Z¹ij ¾½!F\Ù\n¸üA\Ï\ëEÀç† \î¥@\'\Ó4£P8\Ø¡­-L:›m\Z´\ì±ı\ã“Tu«\Ë[Ä‹\Êÿ\0„o˜ G4‡s=\ï[‘ŸÊ¡IQI\'Ò·ü6¿º¹C\åRh÷¢y¥´1\ån;½~jb9\Ó\"»}\ïÒe\Éü+G]¼3\ÎÖ‰K†İ¼õ\ë;$ ~´\0}ßº\Ù\'Ò†\àu\ë\Ô\Ò8\Ç\ÍJK=(\0ÀÉ¥\äqH¸\'‘ŸÆ•²Nr:\ã€\0t)¡ˆ,98 ¨1\ÇJ62xö B¾\0Â‚Ö“\r\ëúÒªòX\ãÆšNO¥0\İ0 ?:R\ägo\'Ş„n\ä\äı(“š]\ä.ü…IŸlP@Ûº\r ¨Aœş\Ë.=(À0ß\0.zdœ\ĞóŒ€Nz\Ôrİ·¥?\æs\ÇaC#\ß\å##¹©ÿ\0È´¿\îGı*`Ow¹\Ç\çT\æÔ¦»\Ó~\Ë\ä\"¨\n7\ïô\ÇøSl¯\äÓ¦”\Ç—\Ì\ÇV\Æ1H\r\Í;\î^ÿ\0\×Ä•Z/ùıqo\ëU$\×\î6H\àŠ2ÀÛ³Šu9WKû¸(S~ú\0×¼ÿ\04X¿˜©o\Ïúu‡ıu?ú	¬Èµ\Ù\Ö$ŒZ#P3¿Ò«Í¬O=\ä“’D`÷>¦€:D™dX¿Š<\ÌVø«ÿ\0lÿ\0\è\ë¥ü—\"ù\Ğ!MşóU\ÒöAª›\ï-s’vnö\ÇZ\0¿®M\ä\êh@\Î`\Æ?\Z“Ã„±»\'®Wù\ZË¿½{û¥•FU6\à6sŞ¤\Óõ\Ó|İ‘¬¾a–\Æ(x\\gK^\íµP)³ÿ\0\Èv\Óş¹½aÿ\0iL–Q[˜—j8|\î\ë†\Î*f\Ö%’ò+¯!J\í\ß\×4g]¼•¦û\Ær\Ës¿ıjÖ–k‹gF\"\'p=ò1X\âd]¦\ÑrHş?CQ\\kOo7\ÙÂˆ‰8\İ÷³@\ZğÇ³\Äûğ«~¸ş•n	–xKVSõ\Ïÿ\0oKöŸ<[&vl\Æÿ\0|\Ôvš\ÌÖ¢P WH\În™\í@4±ue§›µ•\Ü\åš\"x8\à\Ô\Úü1=œwj¸|„©\ìk:\ÇVš\Æ	&ˆó´œc=ioµ)µEx–8”\çh9\Éú\Ğ†¿\Õ\\ÿ\0¾?•A ÿ\0\È^ó\è\ßúV\Óõ)l¡ `ylb¢²¿’\Æ\îY– \í.r»±s@­Ÿ\í{¢GA\ì*º¸_\á ‘\ÆsW—V–9n˜À¹¸\ÆFÿ\0»\Æ*+\Ë\Ù/c·W„F±»ºñ\éL\n n=@4rx\0}jHvùŸ0ùI\çµ\\+h\0\Ã½×Ÿó\Å\0P—¡§#LaKu\ÏZ½¶È‘ó6	\ï)qe“÷±:\Ğzw\'#süY«Š°ó’§“\ÜúqN˜Zˆ”\Ä\É\ès@\Ã+e½iDNyõ¦[4\ã†9\İÖ˜2”\è{S%¶ŒE€v\0´\Õ²sÈ¢Š`9T¹9=9¤H÷g½P7\ÊÌ£µ:5ó,O4Q@\Øv\Æ1\ë\Í!\Ú:s\×4QHh\Õ0H\Í P1\çÚŠ(\İû†\0À4…”.6òG\\\ÑE1‚’q\íN\Î\æŠ(§ \0\nTmªH#ÚŠ(Ÿ4˜\É\Îx\æ”\å\å\âŠ(›™A*yõ§\'-“\Î=h¢€\ZÄ·Ò¤Dı\É\É4QHGe\É&\ä°<\ÑE0\×`^O\"šg“E\0Ÿy±Nl)Áô\ÍPd&23\Í=G\Ú&\nxÒŠ)l„À#ŸZ@\Ø3õ¢Š`\'¿¯4\ç\ê1À=¨¢€\00=iBo\É>´Q@ÿ\Ù'),(45,12,'LIBUNAO','ALEXIS','LIBUNAO','1997-01-02','M','ASDFASFASDFASFASDF','6546546546','I','ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿ\Û\0C\0!!$-K0-**-ZBE6Kl`roi`ifx‡«x~¢fi–Ì–¢±·ÀÀÀr\Ò\áÏºŞ«½À·ÿ\Û\0C!!!-\'-W00W·{i{··················································ÿ\Ä¢\0\0\0\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùú\0\0\0\0\0\0\0	\n\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿÀ\0,\"\0ÿ\Ú\0\0\0?\0­(\Í&ihh?4Œx™¤cÒ›Wÿ\0E<\rµ*Ê­œ08ô9¬\ë(’öx\á›&$~\Ìğ\Ç8\æ‹Ï±Gm+À©kwª\àúw ’ûJ¡°X\îib£pı9¡I>CHüœ\ã9¨­ô«V¿º†U2\nÉ–?( ñÖ 5T‡K„\èM3FLş[0m\Ç9\ÅXM.\ÅR\Õdƒ/(Á;]¹õö \n\Ôğj¶“j÷wk$YDe8\É\ï\ïP&Ÿo™u<±nx\ÙÂ’Ç€z\0\Õ\ÍªJµškWŠ<B\èY\×qÁ\àc¿¹ªñD­\'•d‚{’€?uG¯¹ \rq\"“€\ÊO 43ªı\æ\êj”\ÖúlRI±GnUAI3´œ÷Ú¢µ†¥‹\ë\ÔûL½\Øg¥‘ØŒzÑš¡6™lš¤\ì>Lªÿ\0»\Üpc‘Ki¤\ÛIqt$Œ²¤P<\ë\ï@ó\ëKšÊ·\Ó\íSNy®\"\ŞÁ\Ød±\é»½J\ÚM¯ö¤qˆÈ„\Ä\ÌWq\ä‚¯½\0iJ\rfC¤\Û6£r1\"¡E\Üx\È9\ï\íUá°·»\Ó\â’ö\É\æ…rôİƒ\ßÒ€73HdP\Ø, ú\ÍbÜ¢Y\\]½1ˆa\npIù˜õ\ç\ĞU©­4ûCO\Ó9\èG©÷ \r\"\Øc\ïB°a• PsXö6\Ñ]Iq\æHn-\àm±)l®1Ÿ\ÇÒ›silö–\×P\Å\å$djH¤÷\Å\0m\æŒ\ÖIÒ­¿µDb2!òw\Ü~öq´A¥[\ëµxÉŠ=»q\ã#ô¯š+]>\Õà³–\Êù² |1\åH9jIô«e\Ôm£HÈ‰•Ë®\ã\Î1şô¯š\\\Ö±³–Køc‹l†<e~¾´\ác7\ZzD¥g?¼‘÷\à2hf–’Š.h\Í%\0¹¢’–€9ÒƒM\Í«4šF\éIšF?-\0Z±[‰n\â¬‘\É\ZYó†éŠ»~‘j:T\Ó<afƒp\Ü=W¯>•B\ĞÈ˜š	*dr2ô5b{›«¸Œ2b¾÷–[ó¨$Ñ¹ÿ\0­?ı\æÿ\0\Ğ\rG\ã\Äs¯÷ Sùş½SŠòö–50\È…gpø¨S\í\İı©]br\à\àƒ\éLP#d\áv\Ùâ‰\êõªÚŒ¾V¡¦§ûgùıj“\\^½\â\\“\0tRppA¦\Ü}¦ö\â9¥hU\â\ÆÍ \ã9\Ï4·+‹V\ßÿ\0=eUüğ*¶ª^•$cşZ8›Vmı\İ\äÁF·8\ØQL¸\Ônn\ÕQ\nª¸oœPœ\Í‰>\ŞM¹‘ı:UYae³±‚Fe\Ú\çøN3š\'¸û4ö\è\Ñys3XŒÖƒÆ·ñª9WĞŠLª/–[;\äFx\Ô\ËÓ„z*°|2ª9\Ú@ü¤óuw[&x2*’*d0\İY\'—k$rDy\Û09¿\"j2l\Õt\Şz³\ÌV¤uµpç´¡1\éY“Z\Ü\\H·\Ë¸B`±ps^i\×)w\åo{eòœH»CrGL\Ğš\×ú6Œ\êW«f®\È\á#7_İ„Ÿ\ëı+:\ê»ø\Ö+–c\r»\ä\'­+E¨IgöV{`…6³ŒPö!!š\ãûÑ†ü…g\è\naó!\ê\Z4—\èH\çùSŒ:ƒYı”½¶Â›7a³Œb-nm\î<\ËV‡5B$·Ò•À¯¼d^\\:‡3;¦vÊ­[™¢ò¬¯\Ìs‰T…`:€:\Z}½’¦m¦`Û·n#§<S5”\"=´F\ä6=ñEÀ4\ët´k\ècûªù\Ó*\rU»m½gõa,®\í\äi¡¸WšOõ¢Eù[\Ó\éŠl\ÖWÉ¶òH•\0;cˆgO¥0/N\Â\Ş\ëû±ñ¤›[\\\ÎŞw\ä*”¶ú„Ö†Ù¤¶Wi`8¥{}B[Cl\ÒZ\ì+°°\r»&’<ı&\Ğÿ\0p\çòÈ«00¹\Ù?÷K¯\ë\éT\í\í¯l£1[=±‹q+¼6@=¸¤µ¶\Ô,\áò\ã’\ÕÁ%²Á³\Í\0AdJ\ëFQ\Ò\âIPe\Æ*W½‚\rb\å\î-OOJr\é÷\Çl\ÑIš&vmÀ\í;©¦\Êü›“\æZ\æ\ã¸n01\Å\0Nu›>\í \Ç\'÷M\Ç\éWQ\ÖDWC•a}Eg=¾£#H\Å\í‘6\àsş5z\Ş#´Q’Š>¸–Š( –’–€8\Ü\ï\ÑóxR\Z\\\Õ\ZX>oQF[¾( š.,ÚŸİ·Ö¦\ÍVµ8VúÔ¤Ô±n¥\ÍEšp4~iÀ\â¢œ\r\0AqŸ0óQŠ–\á~­CÒ˜‰TÕ˜\å**šš•Zš\İU…”0ô¬\Ä+MX(\àÔ´2\àjp5O\Î\"¥Šr\ÄqJ\áb\Ø½.y¨\Ë|Ô´®;\İH[\Ò\Õ= %S\Ã\ÕP\ÜÔ„ô¦‘ ¥\ëUC`\æ¦G§q4IE( ô¤¦HR\ÒQ@¢’ŠbŠJZ\0Z3IE–’–€8\Ê)(¦X\ì\ÑIFh-±\åªl\Õ{só¥JM\"Gfš4\àhğiÀ\Ó¥€*\ï#¨ªØ«©\Ï^X\ÌoÆ€·Ò—”)ô§­0!!‡­K\Ä\r¯ù\Ô\Ş^EA\'\î²iŒ•š¬[dŒ\Õ(\ØIŒpkB%Ø¢³cE…>´\â\Õ™MiGz‘ŠÏ‚j#/OJ\ß\Ğ\Ôe\éh>©\Ğ\ç5@J\rK\Ç$SBd\å¿JrI\ïU™ñŠT~i¢®)ûjš¿½!œ«òx¦„\Ñw4Sƒ\rIL¥¤¢€–’Š\0Z)( QIE1efŠf¢\ÒQE\0>ó~-AÃŠš‘,\\Ó…34¢S¨\Å<\Z\0š3S2	i¨#<Õ•4€¦CÀÿ\00\È\ìjuTpzœ€À‚*œ±4•\Î\ÓúSWmƒŠ«3o\â¤fnı*&S»\"\Ê%¶Œµt6Ró6€(˜\Ô1–^J®\ìM‹t©p‘Œ·\'Ò¤\ã\ê)\á\nl— ô\ÅEùr\r0¸öR†Ÿ`1¤g\Í>\Ìn=)¡1‹u5+t\à\Õm\ÛI¨ş\ÑûÁ\Ï†^I9¦I&NsH®®2*	\Ü)\Í4&i\ÚMÀ¯v¬[W\Î5¯\î@hD²JZJ)ˆZZJ(h¤¥ –’–€8¬\Ò\ÓsKL\ĞZ)( !ù\ÅJX\n®iKiÉƒóO _Z˜P!\âœ)‚œ)™5eMUCVT\Ğ«JÀ2i Ó¤s¶\ÂT”ª\Ù\æ¯Mn²®q\È\ïTXl\Ê\Ò(o\Ş=h*GCN^MN¨1Ú€ Y¶uV\âå¾\\WdA\éT\æq\È\ã dG-\æœ	I1œ\â‘p§£µ*)w\æ´d\"\Ú6qW\íSpoqT@À«e`>¦¡Ì¹\×ª\ÉÁ­›˜\ng#­e:\ír9¦‰d–\Îcr„’(¸}\Ç%ºu\'©§Eh\×38Q\Ô\Ñ\Ô:f\à\n×´“’µ‘,_e¹(9QÒ®\Ú\ÉûÅ©{©šZh¥¦!\ÔRR\Ğ\ÑIš(ii)s@P¢’Še‹EP1( \Ñ\ÜS!^¢¥CSw4x§\nh§\n@Jµe:UU«)@\ÉA§\n`4\ài(\èk>\åv¹­ª×‹‚(ª\ä‘\ÍMœT!)jV!;ª»¦i\à\Ğ\Ô®b\Ô\ÉJx\0S\ã\0¸\Í$şkn\ÅjÛ ŒE°R½ª@¼ò*ˆ\àWŠÅ¾µK¼\Z\è*¦¡x	\î9 h\ÅQµ\r\\°joõ5Q†v¨­8dj=ªF\ÊZ°\ãluTv-—A\ïVµ8L–\á”d¡\éUt\ÈÙ§Fiˆ\Ú¹¦\Ò\Ğ!sKIK@E&ihii( &–’Še‹KM¥¤\0M(¤4 ò)’\Ç’¾\â¤*,|\Ëô©VN\ÑN\"Õ”ª«V# dÂ)‹SÆ¹¤±\'5Vñ¹«Œ\ÛP\Ö}\ÃdÒ¸\ìSbGjaj‘‰<TeMP†\' \Âq@”\'4XW&BjK\\4œ€j´\ÒnPA¥µ“Š\Í\Ä*‹qQÉª\"u5J\êV1§VY|Nj„t¬)\ê‡5f;”ºŒ\ã\é\\¸”cŠ\Ğ\Òd>có\Æ:R°\\Kv5uxriÀúÔŒ\ZDUV%@\çÒ“4\ì\Ò\ì\Ò\æ›E0šPi¢–€Kšn­-\0:–š)\Ô\ÄP))i”´”P0&œ\Ôu*\0±\í\Ó\Ü\ĞK¼¹>•r½=È½\ÍB\r1\"a;}i\â\ã\Õj\nZ@[[„÷…Yh\Ïñ\n\Ì4i¿Šk\Æ\Êz05eŒ\Öm½³†&´GÊ˜\'&\Äw\ë“U%9©Y\ê&5#+H0sÒ¢\İ\Ï5;{T;>cT!Jƒ\Ğ\Ôn‡ş”¹¦\"®\â¤·û\Ôò¸#ŠDŒ\Æ\Ür;UGÀ\äşBP7\Z±!-\ëQ\'¢\Ğ@dÖ¶‚(Ï©ªqZ±\äñZPC°u¤\Øc\ázÓ³M¥¨\ì\Òæ™šPhL\Ò\æ£\Í.h 4\àj0iÀ\Óù¥\Í74¹ R\ÓihŠ\Í¥¹è¦œ!sü4\Æ0\ÑRıû•!€\â\0FMY·P\É\ï*#\ïf’& \àP’\â7\Îx {\Ô\0T\Ù<÷\ÍH‘–8\Å1JúV”V Œ°\ÅX[hĞ–§˜®S*(™˜\r¦µ-\íB`¸ü*\Â\í_º\0¥.*\\®4…\È\íÒ‡Áæ˜¤“I9aŒ\Z2\0\rEÇ©4¬u¨‰)ô¦!\ÌF­D¤³ex\ì<“ŠQ…nÀSÍƒHV¤A…\ëJE1… €8\çµ3@\n\r8(¥;n0iÂ€‚§Z‰idm±@_QKŸz\ÇiO4	¤^Œjl3b—5”·²ù©WP~\ë@\ZB”\Z¢º‚ÿ\0Ô«{\ïŠ[£ëŠ…gº0©\×\ÔP”¢šÒ—4\0ñKM¥¦#3šošj:\\\Ğ\Z¡ó\r&óI°úRùm\é@®!jU]Æœ\"5b\Ş¸M\0>\Ú\ÒI9\äZÑ\İc¡5* D\0qJ@*-!1McŠöj7“*JÌ¢Pi¬sM\Ïi¤\â˜É¢\æ(\ÇN\íD\Òf¨’6\Âö\ÍV“s6`T\ÆC\ÜqM\ÜOl\nd•X\àuõ§,™8\ÅXo\à\nc[\åi€DÄƒ“Š`\à\ÅV\äâ¦ˆL	¶Œu¤\\” Š\Ô]´„S…!lP—Še\Ãb\")\ê\à\æ«\ÎÔ€¨z\Òf‚i3Lb\ÑIKH\Í.i´´\0\àO­8JÃ£\Ze-\0N·R\â\ÍJº„ƒµS\Í-\0i.¥¢¤ş\Ò_J\Ê\Í-\0TÛŠ\\t§`R•D†1F9\Í.9\äR¨ \Å\ãÖµ\" ^\0\É\ëUm\"ù³\Ğ\nµõ2e$é¥¾”ŒFj=\Õ%Zc9\'\Æ*C’8¨™†:\ÓP\ÜR¨Ñ²9\ëN\êz\Ò$}E$Æš\Ô\Ù[\'#½14\å“\Ôf™\Í7>ô\ÄZYG`:sI‘Ö«”\Ï^\ÕD’1\È9ˆ1È¦\î¤V\ÃP±Ò”|§Š7\È\ÍHZ€*´²`u¢i6\rVf,y \Ç#g­,\Î‹Ö¢”\å\Í!\Í\Ú)ˆvh\Í&h\Í!¥\Í74P\éi´P©Ù¦f—4\0\êZnh\Í\0FzÑ/¸\Í\ë\ëVHc4\èÁ4Ó’\0ªHI\È /GòG\îiY©|¢¢/¦³e&›j2Ù£v)”J‰”õ)á¹¥rdûU!28Á)\êiNhŒ\ã\èiH\Í!Œ$šRp94\Ó\ÇÒœr’;P)1JŠx¦ U\ëM`µN‰‘šlÉ…&©Ê»­*\ÓùªALC\Ğ\àbœ\Ò\í\ïQ\î–\Å!w.y\ëJ«LQS/JLhQMh	\äSœ\ásL[ƒœ0´L½©˜«‚Tn\ãñ Æ­\×\î:Z­\ÇjŒ\ÂÃµ\02Š#µ\0´¹¤¢€KM¥ ¥¤\Í.h»rNh\ë\×ùQE\è:s\ëTHo\ã¿\ĞT‘j‹œñNS\Óo\ã@\ËT,\Ç=8 ¿aA\ç­C(hzzœô\Å\\œw­++usó\nC*ˆıN½€Wny¥se˜‰NHVT(fn8­P‚8S#\'=)\Ø#¨­h‘v”öE#†`»S Á\ïW\îl\ÒE;WkúŠ\È%’M\ÃM!6iŒS\Ö©±Ñ†ö©•\éˆb¢–<©>j) y\Ç!ô\ä4—N\ÇÚ¢\ßLDŒô‹\É\ÍE¾¤…²q@\np\éS\Ç=j\Üp/¥KE\\Í™JD& \Ôt\í[“Ú‰¡(8÷¬GFˆ²Aš“€h:Ÿ”ñH9Py\è?\Zv:\Üÿ\0xT\É*?z¦G÷G\Í\0v\\\Ò\å\Ë\Æ5n TMl;T	+«|¤\àz\Ô\Ëv?ˆR³\È\Úi„c­]Y\ÇR˜Õ½\é\\\n\"–¬µ°\í\ÅD`a\ïLQš0GZ(\0\Î[;~”€`ƒ\ßŞ§¾Gµ.}OÒ¨‘\ìOé§§©\Üƒ\×\éIŒ@ü)€¨üóR–\0d~]½şP*l2\Ì/º@¾¦ºeU@\0\í\\´PsŞºiø=iXw/\Z©5š¹/\nÿ\0Î§ó÷\Å$o•ç¨ Fqœ\Çû¶aÁ¦}®a)Q\Ó5kP·&ñòº­b‰Ì™ü\Ô\rq\Êd_˜j\Ì\Õ`¯c\ÍB²H?‹:[­ğ2±\Îi eû\İj™\ëV¾\Î(±@¶\É\Çj²p(M¡#¡ª— \Åc\ĞV£b³õ÷ZÉü4€Í¸“\ëM\Íb¨‘:ÓƒA£¿˜ fÍ±\İ5r:Ëµ¸\\=j\ìrn8Ë Ÿ¥C=¬\ãx\äwƒ&\Øòy¡J‘“H\Ë\Ë1nÊ€\ÕN§<[7(’[²x\È\Íb\à÷?…1\'?L\Òõ\Ïe¤l÷©2H(@\É8\È61…Á„\ç\î\äS˜\ã€F(\0Á4õ™Ñ°4\Ì\ãƒÔ˜# \ãŸz,µ»†*Âº8\àŠ\ÎÚªœòH\ã„\ç6\Í\Z·aMû2\ÕD¹t$‘\ëS-ğ\Ç*sJÃ¹\\\É\' \ïJw\0\Ş;L\Îzÿ\0:^¸ÛSVH¡KÈ¡¹\É#\éÚ[$ò½–\ÆF?J\0k}sô¦”#ƒRŒt>\Ôc\róZ`BPö«vT`œqŒ\ÓztÎ¢•\0RG§z@Xü¡É—>‚§:¹R8­-LøFÁÀÏ—8úT\Z–\ë »ıi\å7\Õü\Äe\ë7x†\ä\×^¢=B\Ş\å%…>I\Z>\ê¬@\Â*N|–ş´\æÄ¸ş#N‹cÌ¢I¦y5\Ö<\Â\ÛL‚MŠ\Ù0}ğ*\ÛX“T°•QU‹²¶^(©©\ØF€…Àã¡¤mZ\Çş~\äÂ¬\Ëj±\áF\Z6F\ãñÖª\Û\ßõ©¬ü D’İŸ(\íøP.§d\Ä´ı\r%\å\å¼A¢’Ui\Ú\İ\Ãk(\á\Ér\ä\ãh\Ïÿ\0Z—F\Ã\\Ş“ƒ\Ê\è4\æ7.z\Ò\îQüY®Ám\ÔjòMƒ\nòÂ£WûvÓş­\éˆ\ä÷)<R\îLrß…o\ë÷\Æ$’\Ğ[\åYAó=9ú{V¥¢$6vÑ7ô¢\àq”\ç<w\Æ1\Ô\Z\Ú\Ó\"\ë·\ê@\ÇQøœÿ\0Z¹ij ¾½!F\Ù\n¸üA\Ï\ëEÀç† \î¥@\'\Ó4£P8\Ø¡­-L:›m\Z´\ì±ı\ã“Tu«\Ë[Ä‹\Êÿ\0„o˜ G4‡s=\ï[‘ŸÊ¡IQI\'Ò·ü6¿º¹C\åRh÷¢y¥´1\ån;½~jb9\Ó\"»}\ïÒe\Éü+G]¼3\ÎÖ‰K†İ¼õ\ë;$ ~´\0}ßº\Ù\'Ò†\àu\ë\Ô\Ò8\Ç\ÍJK=(\0ÀÉ¥\äqH¸\'‘ŸÆ•²Nr:\ã€\0t)¡ˆ,98 ¨1\ÇJ62xö B¾\0Â‚Ö“\r\ëúÒªòX\ãÆšNO¥0\İ0 ?:R\ägo\'Ş„n\ä\äı(“š]\ä.ü…IŸlP@Ûº\r ¨Aœş\Ë.=(À0ß\0.zdœ\ĞóŒ€Nz\Ôrİ·¥?\æs\ÇaC#\ß\å##¹©ÿ\0È´¿\îGı*`Ow¹\Ç\çT\æÔ¦»\Ó~\Ë\ä\"¨\n7\ïô\ÇøSl¯\äÓ¦”\Ç—\Ì\ÇV\Æ1H\r\Í;\î^ÿ\0\×Ä•Z/ùıqo\ëU$\×\î6H\àŠ2ÀÛ³Šu9WKû¸(S~ú\0×¼ÿ\04X¿˜©o\Ïúu‡ıu?ú	¬Èµ\Ù\Ö$ŒZ#P3¿Ò«Í¬O=\ä“’D`÷>¦€:D™dX¿Š<\ÌVø«ÿ\0lÿ\0\è\ë¥ü—\"ù\Ğ!MşóU\ÒöAª›\ï-s’vnö\ÇZ\0¿®M\ä\êh@\Î`\Æ?\Z“Ã„±»\'®Wù\ZË¿½{û¥•FU6\à6sŞ¤\Óõ\Ó|İ‘¬¾a–\Æ(x\\gK^\íµP)³ÿ\0\Èv\Óş¹½aÿ\0iL–Q[˜—j8|\î\ë†\Î*f\Ö%’ò+¯!J\í\ß\×4g]¼•¦û\Ær\Ës¿ıjÖ–k‹gF\"\'p=ò1X\âd]¦\ÑrHş?CQ\\kOo7\ÙÂˆ‰8\İ÷³@\ZğÇ³\Äûğ«~¸ş•n	–xKVSõ\Ïÿ\0oKöŸ<[&vl\Æÿ\0|\Ôvš\ÌÖ¢P WH\În™\í@4±ue§›µ•\Ü\åš\"x8\à\Ô\Úü1=œwj¸|„©\ìk:\ÇVš\Æ	&ˆó´œc=ioµ)µEx–8”\çh9\Éú\Ğ†¿\Õ\\ÿ\0¾?•A ÿ\0\È^ó\è\ßúV\Óõ)l¡ `ylb¢²¿’\Æ\îY– \í.r»±s@­Ÿ\í{¢GA\ì*º¸_\á ‘\ÆsW—V–9n˜À¹¸\ÆFÿ\0»\Æ*+\Ë\Ù/c·W„F±»ºñ\éL\n n=@4rx\0}jHvùŸ0ùI\çµ\\+h\0\Ã½×Ÿó\Å\0P—¡§#LaKu\ÏZ½¶È‘ó6	\ï)qe“÷±:\Ğzw\'#süY«Š°ó’§“\ÜúqN˜Zˆ”\Ä\É\ès@\Ã+e½iDNyõ¦[4\ã†9\İÖ˜2”\è{S%¶ŒE€v\0´\Õ²sÈ¢Š`9T¹9=9¤H÷g½P7\ÊÌ£µ:5ó,O4Q@\Øv\Æ1\ë\Í!\Ú:s\×4QHh\Õ0H\Í P1\çÚŠ(\İû†\0À4…”.6òG\\\ÑE1‚’q\íN\Î\æŠ(§ \0\nTmªH#ÚŠ(Ÿ4˜\É\Îx\æ”\å\å\âŠ(›™A*yõ§\'-“\Î=h¢€\ZÄ·Ò¤Dı\É\É4QHGe\É&\ä°<\ÑE0\×`^O\"šg“E\0Ÿy±Nl)Áô\ÍPd&23\Í=G\Ú&\nxÒŠ)l„À#ŸZ@\Ø3õ¢Š`\'¿¯4\ç\ê1À=¨¢€\00=iBo\É>´Q@ÿ\Ù');
/*!40000 ALTER TABLE `tblemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblemployeeassignment`
--

DROP TABLE IF EXISTS `tblemployeeassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblemployeeassignment` (
  `intAssignmentID` int(11) NOT NULL AUTO_INCREMENT,
  `intAssignmentStatus` int(11) NOT NULL,
  PRIMARY KEY (`intAssignmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblemployeeassignment`
--

LOCK TABLES `tblemployeeassignment` WRITE;
/*!40000 ALTER TABLE `tblemployeeassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblemployeeassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblextracharges`
--

DROP TABLE IF EXISTS `tblextracharges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblextracharges` (
  `intExtraChargeID` int(11) NOT NULL AUTO_INCREMENT,
  `strExtraChargeName` varchar(45) NOT NULL,
  `strExtraChargeDesc` varchar(100) NOT NULL,
  `intStatus` int(11) NOT NULL,
  PRIMARY KEY (`intExtraChargeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblextracharges`
--

LOCK TABLES `tblextracharges` WRITE;
/*!40000 ALTER TABLE `tblextracharges` DISABLE KEYS */;
INSERT INTO `tblextracharges` VALUES (1,'Transportation','Sample Description',1),(2,'Missing Equipments','sample details',1);
/*!40000 ALTER TABLE `tblextracharges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblguestreservation`
--

DROP TABLE IF EXISTS `tblguestreservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblguestreservation` (
  `intGuestReservationID` int(11) NOT NULL AUTO_INCREMENT,
  `intReservationID` int(11) NOT NULL,
  `intCustomerID` int(11) NOT NULL,
  PRIMARY KEY (`intGuestReservationID`),
  KEY `fk_intReservationID_idx` (`intReservationID`),
  KEY `fk_intCustomerID_idx` (`intCustomerID`),
  CONSTRAINT `fk_intGuestCustomerID` FOREIGN KEY (`intCustomerID`) REFERENCES `tblcustomer` (`intCustomerID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intGuestReservationID` FOREIGN KEY (`intReservationID`) REFERENCES `tblreservation` (`intReservationID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblguestreservation`
--

LOCK TABLES `tblguestreservation` WRITE;
/*!40000 ALTER TABLE `tblguestreservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblguestreservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblinvoice`
--

DROP TABLE IF EXISTS `tblinvoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblinvoice` (
  `intInvoiceID` int(11) NOT NULL AUTO_INCREMENT,
  `dtmInvoiceDateTime` datetime NOT NULL,
  `intInvoicePaymentStatus` int(11) NOT NULL,
  PRIMARY KEY (`intInvoiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblinvoice`
--

LOCK TABLES `tblinvoice` WRITE;
/*!40000 ALTER TABLE `tblinvoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblinvoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblinvoicediscount`
--

DROP TABLE IF EXISTS `tblinvoicediscount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblinvoicediscount` (
  `intInvoiceDiscountID` int(11) NOT NULL AUTO_INCREMENT,
  `intInvoiceID` int(11) NOT NULL,
  `inDiscountID` int(11) NOT NULL,
  PRIMARY KEY (`intInvoiceDiscountID`),
  KEY `fk_intInvoiceDiscountID_idx` (`intInvoiceID`),
  KEY `fk_intDiscountID_idx` (`inDiscountID`),
  CONSTRAINT `fk_intDiscountID` FOREIGN KEY (`inDiscountID`) REFERENCES `tbldiscount` (`intDiscountID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intDiscountInvoiceID` FOREIGN KEY (`intInvoiceID`) REFERENCES `tblinvoice` (`intInvoiceID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblinvoicediscount`
--

LOCK TABLES `tblinvoicediscount` WRITE;
/*!40000 ALTER TABLE `tblinvoicediscount` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblinvoicediscount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbljob`
--

DROP TABLE IF EXISTS `tbljob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbljob` (
  `intJobID` int(11) NOT NULL AUTO_INCREMENT,
  `strJobDesc` varchar(45) NOT NULL,
  PRIMARY KEY (`intJobID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbljob`
--

LOCK TABLES `tbljob` WRITE;
/*!40000 ALTER TABLE `tbljob` DISABLE KEYS */;
INSERT INTO `tbljob` VALUES (11,'ADMIN'),(12,'CASHIER'),(13,'HAIRSTYLIST'),(15,'MANAGER'),(16,'THERAPIST');
/*!40000 ALTER TABLE `tbljob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbljobqualification`
--

DROP TABLE IF EXISTS `tbljobqualification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbljobqualification` (
  `intJobQualificationID` int(11) NOT NULL AUTO_INCREMENT,
  `intJobEmpID` int(11) NOT NULL,
  `intJobID` int(11) NOT NULL,
  `intJobStatus` int(11) NOT NULL,
  PRIMARY KEY (`intJobQualificationID`),
  KEY `fk_intJobEmpID_idx` (`intJobEmpID`),
  KEY `fk_intJobID_idx` (`intJobID`),
  CONSTRAINT `fk_intJobEmpID` FOREIGN KEY (`intJobEmpID`) REFERENCES `tblemployee` (`intEmpID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intJobID` FOREIGN KEY (`intJobID`) REFERENCES `tbljob` (`intJobID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbljobqualification`
--

LOCK TABLES `tbljobqualification` WRITE;
/*!40000 ALTER TABLE `tbljobqualification` DISABLE KEYS */;
INSERT INTO `tbljobqualification` VALUES (44,33,12,1),(45,34,13,1),(46,35,12,1),(47,36,11,1),(49,36,12,1);
/*!40000 ALTER TABLE `tbljobqualification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblorder`
--

DROP TABLE IF EXISTS `tblorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblorder` (
  `intOrderID` int(11) NOT NULL AUTO_INCREMENT,
  `intVIPID` int(11) NOT NULL,
  `dtmDateTimeCreated` datetime NOT NULL,
  `dateOrderDate` date NOT NULL,
  `intOrderType` int(11) NOT NULL,
  `intOrderStatus` int(11) NOT NULL,
  `intInvoiceID` int(11) DEFAULT NULL,
  PRIMARY KEY (`intOrderID`),
  KEY `fk_intInvoiceID_idx` (`intInvoiceID`),
  KEY `fk_intOrderVIPID_idx` (`intVIPID`),
  CONSTRAINT `fk_intOrderInvoiceID` FOREIGN KEY (`intInvoiceID`) REFERENCES `tblinvoice` (`intInvoiceID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intOrderVIPID` FOREIGN KEY (`intVIPID`) REFERENCES `tblvip` (`intVIPID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblorder`
--

LOCK TABLES `tblorder` WRITE;
/*!40000 ALTER TABLE `tblorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblorderdetails`
--

DROP TABLE IF EXISTS `tblorderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblorderdetails` (
  `intOrderDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `intOrderID` int(11) NOT NULL,
  `intProductID` int(11) NOT NULL,
  `intQuantity` int(11) NOT NULL,
  `intStatus` int(11) NOT NULL,
  PRIMARY KEY (`intOrderDetailID`),
  KEY `fk_intOrderID_idx` (`intOrderID`),
  KEY `fk_intProductID_idx` (`intProductID`),
  CONSTRAINT `fk_intOrderID` FOREIGN KEY (`intOrderID`) REFERENCES `tblorder` (`intOrderID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_intOrderProductID` FOREIGN KEY (`intProductID`) REFERENCES `tblproduct` (`intProductID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblorderdetails`
--

LOCK TABLES `tblorderdetails` WRITE;
/*!40000 ALTER TABLE `tblorderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblorderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblorganization`
--

DROP TABLE IF EXISTS `tblorganization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblorganization` (
  `intCustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `strOrgName` varchar(30) NOT NULL,
  PRIMARY KEY (`intCustomerID`),
  CONSTRAINT `fk_intCustomerID` FOREIGN KEY (`intCustomerID`) REFERENCES `tblcustomer` (`intCustomerID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblorganization`
--

LOCK TABLES `tblorganization` WRITE;
/*!40000 ALTER TABLE `tblorganization` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblorganization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpackage`
--

DROP TABLE IF EXISTS `tblpackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpackage` (
  `intPackageID` int(11) NOT NULL AUTO_INCREMENT,
  `strPackageName` varchar(45) NOT NULL,
  `strPackageDescription` varchar(50) NOT NULL,
  `intPackageType` int(11) NOT NULL,
  `intMaxHeadCount` int(11) NOT NULL,
  `strPackageAvailability` varchar(20) NOT NULL,
  PRIMARY KEY (`intPackageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpackage`
--

LOCK TABLES `tblpackage` WRITE;
/*!40000 ALTER TABLE `tblpackage` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpackageprice`
--

DROP TABLE IF EXISTS `tblpackageprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpackageprice` (
  `intPackagePriceID` int(11) NOT NULL AUTO_INCREMENT,
  `intPackageID` int(11) NOT NULL,
  `dblPackagePrice` double NOT NULL,
  `dtmPackagePriceAsOf` datetime NOT NULL,
  PRIMARY KEY (`intPackagePriceID`),
  KEY `fk_intPackagePrice_idx` (`intPackageID`),
  CONSTRAINT `fk_intPackagePriceID` FOREIGN KEY (`intPackageID`) REFERENCES `tblpackage` (`intPackageID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpackageprice`
--

LOCK TABLES `tblpackageprice` WRITE;
/*!40000 ALTER TABLE `tblpackageprice` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpackageprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpackagereservation`
--

DROP TABLE IF EXISTS `tblpackagereservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpackagereservation` (
  `intPackageReservation` int(11) NOT NULL AUTO_INCREMENT,
  `intReservationID` int(11) NOT NULL,
  `intPackageID` int(11) NOT NULL,
  `intReservationStatus` int(11) NOT NULL,
  PRIMARY KEY (`intPackageReservation`),
  KEY `fk_intReservationID_idx` (`intReservationID`),
  KEY `fk_intPackageID_idx` (`intPackageID`),
  CONSTRAINT `fk_intPackageReservationID` FOREIGN KEY (`intReservationID`) REFERENCES `tblreservation` (`intReservationID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intReservationPackageID` FOREIGN KEY (`intPackageID`) REFERENCES `tblpackage` (`intPackageID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpackagereservation`
--

LOCK TABLES `tblpackagereservation` WRITE;
/*!40000 ALTER TABLE `tblpackagereservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpackagereservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpackagewalkin`
--

DROP TABLE IF EXISTS `tblpackagewalkin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpackagewalkin` (
  `intPackageWalkInID` int(11) NOT NULL AUTO_INCREMENT,
  `intWalkInID` int(11) NOT NULL,
  `intPackageID` int(11) NOT NULL,
  `intEmployeeAssigned` int(11) NOT NULL,
  PRIMARY KEY (`intPackageWalkInID`),
  KEY `fk_intPackageWalkInID_idx` (`intWalkInID`),
  KEY `fk_intWalkInPackageID_idx` (`intPackageID`),
  KEY `fk_intWalkInPackageEmployeeAssigned_idx` (`intEmployeeAssigned`),
  CONSTRAINT `fk_intPackageWalkInID` FOREIGN KEY (`intWalkInID`) REFERENCES `tblwalkin` (`intWalkInID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intWalkInPackageEmployeeAssigned` FOREIGN KEY (`intEmployeeAssigned`) REFERENCES `tblemployeeassignment` (`intAssignmentID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intWalkInPackageID` FOREIGN KEY (`intPackageID`) REFERENCES `tblpackage` (`intPackageID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpackagewalkin`
--

LOCK TABLES `tblpackagewalkin` WRITE;
/*!40000 ALTER TABLE `tblpackagewalkin` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpackagewalkin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpayment`
--

DROP TABLE IF EXISTS `tblpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpayment` (
  `intPaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `intInvoiceID` int(11) NOT NULL,
  `intPaymentType` int(11) NOT NULL,
  `dblPaymentAmount` double NOT NULL,
  `datDateOfPayment` date NOT NULL,
  PRIMARY KEY (`intPaymentID`),
  KEY `fk_intInvoiceID_idx` (`intInvoiceID`),
  CONSTRAINT `fk_intPaymentInvoiceID` FOREIGN KEY (`intInvoiceID`) REFERENCES `tblinvoice` (`intInvoiceID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpayment`
--

LOCK TABLES `tblpayment` WRITE;
/*!40000 ALTER TABLE `tblpayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproduct`
--

DROP TABLE IF EXISTS `tblproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproduct` (
  `intProductID` int(11) NOT NULL AUTO_INCREMENT,
  `intProductCateCode` int(11) NOT NULL,
  `strProductName` varchar(20) NOT NULL,
  `intProductQuantity` int(11) NOT NULL,
  `blobProductPhoto` longblob NOT NULL,
  `strProductDesc` varchar(60) NOT NULL,
  PRIMARY KEY (`intProductID`),
  KEY `fk_intProductCateCode_idx` (`intProductCateCode`),
  CONSTRAINT `fk_intProductCateCode` FOREIGN KEY (`intProductCateCode`) REFERENCES `tblproductcategory` (`intProdCateCode`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproduct`
--

LOCK TABLES `tblproduct` WRITE;
/*!40000 ALTER TABLE `tblproduct` DISABLE KEYS */;
INSERT INTO `tblproduct` VALUES (12,4,'Gatsby Wax',15,'321321','Sample Description'),(13,5,'razor',0,'ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿ\Û\0C\0!!$-K0-**-ZBE6Kl`roi`ifx‡«x~¢fi–Ì–¢±·ÀÀÀr\Ò\áÏºŞ«½À·ÿ\Û\0C!!!-\'-W00W·{i{··················································ÿ\Ä¢\0\0\0\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùú\0\0\0\0\0\0\0	\n\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿÀ\0,\"\0ÿ\Ú\0\0\0?\0­(\Í&ihh?4Œx™¤cÒ›Wÿ\0E<\rµ*Ê­œ08ô9¬\ë(’öx\á›&$~\Ìğ\Ç8\æ‹Ï±Gm+À©kwª\àúw ’ûJ¡°X\îib£pı9¡I>CHüœ\ã9¨­ô«V¿º†U2\nÉ–?( ñÖ 5T‡K„\èM3FLş[0m\Ç9\ÅXM.\ÅR\Õdƒ/(Á;]¹õö \n\Ôğj¶“j÷wk$YDe8\É\ï\ïP&Ÿo™u<±nx\ÙÂ’Ç€z\0\Õ\ÍªJµškWŠ<B\èY\×qÁ\àc¿¹ªñD­\'•d‚{’€?uG¯¹ \rq\"“€\ÊO 43ªı\æ\êj”\ÖúlRI±GnUAI3´œ÷Ú¢µ†¥‹\ë\ÔûL½\Øg¥‘ØŒzÑš¡6™lš¤\ì>Lªÿ\0»\Üpc‘Ki¤\ÛIqt$Œ²¤P<\ë\ï@ó\ëKšÊ·\Ó\íSNy®\"\ŞÁ\Ød±\é»½J\ÚM¯ö¤qˆÈ„\Ä\ÌWq\ä‚¯½\0iJ\rfC¤\Û6£r1\"¡E\Üx\È9\ï\íUá°·»\Ó\â’ö\É\æ…rôİƒ\ßÒ€73HdP\Ø, ú\ÍbÜ¢Y\\]½1ˆa\npIù˜õ\ç\ĞU©­4ûCO\Ó9\èG©÷ \r\"\Øc\ïB°a• PsXö6\Ñ]Iq\æHn-\àm±)l®1Ÿ\ÇÒ›silö–\×P\Å\å$djH¤÷\Å\0m\æŒ\ÖIÒ­¿µDb2!òw\Ü~öq´A¥[\ëµxÉŠ=»q\ã#ô¯š+]>\Õà³–\Êù² |1\åH9jIô«e\Ôm£HÈ‰•Ë®\ã\Î1şô¯š\\\Ö±³–Køc‹l†<e~¾´\ác7\ZzD¥g?¼‘÷\à2hf–’Š.h\Í%\0¹¢’–€9ÒƒM\Í«4šF\éIšF?-\0Z±[‰n\â¬‘\É\ZYó†éŠ»~‘j:T\Ó<afƒp\Ü=W¯>•B\ĞÈ˜š	*dr2ô5b{›«¸Œ2b¾÷–[ó¨$Ñ¹ÿ\0­?ı\æÿ\0\Ğ\rG\ã\Äs¯÷ Sùş½SŠòö–50\È…gpø¨S\í\İı©]br\à\àƒ\éLP#d\áv\Ùâ‰\êõªÚŒ¾V¡¦§ûgùıj“\\^½\â\\“\0tRppA¦\Ü}¦ö\â9¥hU\â\ÆÍ \ã9\Ï4·+‹V\ßÿ\0=eUüğ*¶ª^•$cşZ8›Vmı\İ\äÁF·8\ØQL¸\Ônn\ÕQ\nª¸oœPœ\Í‰>\ŞM¹‘ı:UYae³±‚Fe\Ú\çøN3š\'¸û4ö\è\Ñys3XŒÖƒÆ·ñª9WĞŠLª/–[;\äFx\Ô\ËÓ„z*°|2ª9\Ú@ü¤óuw[&x2*’*d0\İY\'—k$rDy\Û09¿\"j2l\Õt\Şz³\ÌV¤uµpç´¡1\éY“Z\Ü\\H·\Ë¸B`±ps^i\×)w\åo{eòœH»CrGL\Ğš\×ú6Œ\êW«f®\È\á#7_İ„Ÿ\ëı+:\ê»ø\Ö+–c\r»\ä\'­+E¨IgöV{`…6³ŒPö!!š\ãûÑ†ü…g\è\naó!\ê\Z4—\èH\çùSŒ:ƒYı”½¶Â›7a³Œb-nm\î<\ËV‡5B$·Ò•À¯¼d^\\:‡3;¦vÊ­[™¢ò¬¯\Ìs‰T…`:€:\Z}½’¦m¦`Û·n#§<S5”\"=´F\ä6=ñEÀ4\ët´k\ècûªù\Ó*\rU»m½gõa,®\í\äi¡¸WšOõ¢Eù[\Ó\éŠl\ÖWÉ¶òH•\0;cˆgO¥0/N\Â\Ş\ëû±ñ¤›[\\\ÎŞw\ä*”¶ú„Ö†Ù¤¶Wi`8¥{}B[Cl\ÒZ\ì+°°\r»&’<ı&\Ğÿ\0p\çòÈ«00¹\Ù?÷K¯\ë\éT\í\í¯l£1[=±‹q+¼6@=¸¤µ¶\Ô,\áò\ã’\ÕÁ%²Á³\Í\0AdJ\ëFQ\Ò\âIPe\Æ*W½‚\rb\å\î-OOJr\é÷\Çl\ÑIš&vmÀ\í;©¦\Êü›“\æZ\æ\ã¸n01\Å\0Nu›>\í \Ç\'÷M\Ç\éWQ\ÖDWC•a}Eg=¾£#H\Å\í‘6\àsş5z\Ş#´Q’Š>¸–Š( –’–€8\Ü\ï\ÑóxR\Z\\\Õ\ZX>oQF[¾( š.,ÚŸİ·Ö¦\ÍVµ8VúÔ¤Ô±n¥\ÍEšp4~iÀ\â¢œ\r\0AqŸ0óQŠ–\á~­CÒ˜‰TÕ˜\å**šš•Zš\İU…”0ô¬\Ä+MX(\àÔ´2\àjp5O\Î\"¥Šr\ÄqJ\áb\Ø½.y¨\Ë|Ô´®;\İH[\Ò\Õ= %S\Ã\ÕP\ÜÔ„ô¦‘ ¥\ëUC`\æ¦G§q4IE( ô¤¦HR\ÒQ@¢’ŠbŠJZ\0Z3IE–’–€8\Ê)(¦X\ì\ÑIFh-±\åªl\Õ{só¥JM\"Gfš4\àhğiÀ\Ó¥€*\ï#¨ªØ«©\Ï^X\ÌoÆ€·Ò—”)ô§­0!!‡­K\Ä\r¯ù\Ô\Ş^EA\'\î²iŒ•š¬[dŒ\Õ(\ØIŒpkB%Ø¢³cE…>´\â\Õ™MiGz‘ŠÏ‚j#/OJ\ß\Ğ\Ôe\éh>©\Ğ\ç5@J\rK\Ç$SBd\å¿JrI\ïU™ñŠT~i¢®)ûjš¿½!œ«òx¦„\Ñw4Sƒ\rIL¥¤¢€–’Š\0Z)( QIE1efŠf¢\ÒQE\0>ó~-AÃŠš‘,\\Ó…34¢S¨\Å<\Z\0š3S2	i¨#<Õ•4€¦CÀÿ\00\È\ìjuTpzœ€À‚*œ±4•\Î\ÓúSWmƒŠ«3o\â¤fnı*&S»\"\Ê%¶Œµt6Ró6€(˜\Ô1–^J®\ìM‹t©p‘Œ·\'Ò¤\ã\ê)\á\nl— ô\ÅEùr\r0¸öR†Ÿ`1¤g\Í>\Ìn=)¡1‹u5+t\à\Õm\ÛI¨ş\ÑûÁ\Ï†^I9¦I&NsH®®2*	\Ü)\Í4&i\ÚMÀ¯v¬[W\Î5¯\î@hD²JZJ)ˆZZJ(h¤¥ –’–€8¬\Ò\ÓsKL\ĞZ)( !ù\ÅJX\n®iKiÉƒóO _Z˜P!\âœ)‚œ)™5eMUCVT\Ğ«JÀ2i Ó¤s¶\ÂT”ª\Ù\æ¯Mn²®q\È\ïTXl\Ê\Ò(o\Ş=h*GCN^MN¨1Ú€ Y¶uV\âå¾\\WdA\éT\æq\È\ã dG-\æœ	I1œ\â‘p§£µ*)w\æ´d\"\Ú6qW\íSpoqT@À«e`>¦¡Ì¹\×ª\ÉÁ­›˜\ng#­e:\ír9¦‰d–\Îcr„’(¸}\Ç%ºu\'©§Eh\×38Q\Ô\Ñ\Ô:f\à\n×´“’µ‘,_e¹(9QÒ®\Ú\ÉûÅ©{©šZh¥¦!\ÔRR\Ğ\ÑIš(ii)s@P¢’Še‹EP1( \Ñ\ÜS!^¢¥CSw4x§\nh§\n@Jµe:UU«)@\ÉA§\n`4\ài(\èk>\åv¹­ª×‹‚(ª\ä‘\ÍMœT!)jV!;ª»¦i\à\Ğ\Ô®b\Ô\ÉJx\0S\ã\0¸\Í$şkn\ÅjÛ ŒE°R½ª@¼ò*ˆ\àWŠÅ¾µK¼\Z\è*¦¡x	\î9 h\ÅQµ\r\\°joõ5Q†v¨­8dj=ªF\ÊZ°\ãluTv-—A\ïVµ8L–\á”d¡\éUt\ÈÙ§Fiˆ\Ú¹¦\Ò\Ğ!sKIK@E&ihii( &–’Še‹KM¥¤\0M(¤4 ò)’\Ç’¾\â¤*,|\Ëô©VN\ÑN\"Õ”ª«V# dÂ)‹SÆ¹¤±\'5Vñ¹«Œ\ÛP\Ö}\ÃdÒ¸\ìSbGjaj‘‰<TeMP†\' \Âq@”\'4XW&BjK\\4œ€j´\ÒnPA¥µ“Š\Í\Ä*‹qQÉª\"u5J\êV1§VY|Nj„t¬)\ê‡5f;”ºŒ\ã\é\\¸”cŠ\Ğ\Òd>có\Æ:R°\\Kv5uxriÀúÔŒ\ZDUV%@\çÒ“4\ì\Ò\ì\Ò\æ›E0šPi¢–€Kšn­-\0:–š)\Ô\ÄP))i”´”P0&œ\Ôu*\0±\í\Ó\Ü\ĞK¼¹>•r½=È½\ÍB\r1\"a;}i\â\ã\Õj\nZ@[[„÷…Yh\Ïñ\n\Ì4i¿Šk\Æ\Êz05eŒ\Öm½³†&´GÊ˜\'&\Äw\ë“U%9©Y\ê&5#+H0sÒ¢\İ\Ï5;{T;>cT!Jƒ\Ğ\Ôn‡ş”¹¦\"®\â¤·û\Ôò¸#ŠDŒ\Æ\Ür;UGÀ\äşBP7\Z±!-\ëQ\'¢\Ğ@dÖ¶‚(Ï©ªqZ±\äñZPC°u¤\Øc\ázÓ³M¥¨\ì\Òæ™šPhL\Ò\æ£\Í.h 4\àj0iÀ\Óù¥\Í74¹ R\ÓihŠ\Í¥¹è¦œ!sü4\Æ0\ÑRıû•!€\â\0FMY·P\É\ï*#\ïf’& \àP’\â7\Îx {\Ô\0T\Ù<÷\ÍH‘–8\Å1JúV”V Œ°\ÅX[hĞ–§˜®S*(™˜\r¦µ-\íB`¸ü*\Â\í_º\0¥.*\\®4…\È\íÒ‡Áæ˜¤“I9aŒ\Z2\0\rEÇ©4¬u¨‰)ô¦!\ÌF­D¤³ex\ì<“ŠQ…nÀSÍƒHV¤A…\ëJE1… €8\çµ3@\n\r8(¥;n0iÂ€‚§Z‰idm±@_QKŸz\ÇiO4	¤^Œjl3b—5”·²ù©WP~\ë@\ZB”\Z¢º‚ÿ\0Ô«{\ïŠ[£ëŠ…gº0©\×\ÔP”¢šÒ—4\0ñKM¥¦#3šošj:\\\Ğ\Z¡ó\r&óI°úRùm\é@®!jU]Æœ\"5b\Ş¸M\0>\Ú\ÒI9\äZÑ\İc¡5* D\0qJ@*-!1McŠöj7“*JÌ¢Pi¬sM\Ïi¤\â˜É¢\æ(\ÇN\íD\Òf¨’6\Âö\ÍV“s6`T\ÆC\ÜqM\ÜOl\nd•X\àuõ§,™8\ÅXo\à\nc[\åi€DÄƒ“Š`\à\ÅV\äâ¦ˆL	¶Œu¤\\” Š\Ô]´„S…!lP—Še\Ãb\")\ê\à\æ«\ÎÔ€¨z\Òf‚i3Lb\ÑIKH\Í.i´´\0\àO­8JÃ£\Ze-\0N·R\â\ÍJº„ƒµS\Í-\0i.¥¢¤ş\Ò_J\Ê\Í-\0TÛŠ\\t§`R•D†1F9\Í.9\äR¨ \Å\ãÖµ\" ^\0\É\ëUm\"ù³\Ğ\nµõ2e$é¥¾”ŒFj=\Õ%Zc9\'\Æ*C’8¨™†:\ÓP\ÜR¨Ñ²9\ëN\êz\Ò$}E$Æš\Ô\Ù[\'#½14\å“\Ôf™\Í7>ô\ÄZYG`:sI‘Ö«”\Ï^\ÕD’1\È9ˆ1È¦\î¤V\ÃP±Ò”|§Š7\È\ÍHZ€*´²`u¢i6\rVf,y \Ç#g­,\Î‹Ö¢”\å\Í!\Í\Ú)ˆvh\Í&h\Í!¥\Í74P\éi´P©Ù¦f—4\0\êZnh\Í\0FzÑ/¸\Í\ë\ëVHc4\èÁ4Ó’\0ªHI\È /GòG\îiY©|¢¢/¦³e&›j2Ù£v)”J‰”õ)á¹¥rdûU!28Á)\êiNhŒ\ã\èiH\Í!Œ$šRp94\Ó\ÇÒœr’;P)1JŠx¦ U\ëM`µN‰‘šlÉ…&©Ê»­*\ÓùªALC\Ğ\àbœ\Ò\í\ïQ\î–\Å!w.y\ëJ«LQS/JLhQMh	\äSœ\ásL[ƒœ0´L½©˜«‚Tn\ãñ Æ­\×\î:Z­\ÇjŒ\ÂÃµ\02Š#µ\0´¹¤¢€KM¥ ¥¤\Í.h»rNh\ë\×ùQE\è:s\ëTHo\ã¿\ĞT‘j‹œñNS\Óo\ã@\ËT,\Ç=8 ¿aA\ç­C(hzzœô\Å\\œw­++usó\nC*ˆıN½€Wny¥se˜‰NHVT(fn8­P‚8S#\'=)\Ø#¨­h‘v”öE#†`»S Á\ïW\îl\ÒE;WkúŠ\È%’M\ÃM!6iŒS\Ö©±Ñ†ö©•\éˆb¢–<©>j) y\Ç!ô\ä4—N\ÇÚ¢\ßLDŒô‹\É\ÍE¾¤…²q@\np\éS\Ç=j\Üp/¥KE\\Í™JD& \Ôt\í[“Ú‰¡(8÷¬GFˆ²Aš“€h:Ÿ”ñH9Py\è?\Zv:\Üÿ\0xT\É*?z¦G÷G\Í\0v\\\Ò\å\Ë\Æ5n TMl;T	+«|¤\àz\Ô\Ëv?ˆR³\È\Úi„c­]Y\ÇR˜Õ½\é\\\n\"–¬µ°\í\ÅD`a\ïLQš0GZ(\0\Î[;~”€`ƒ\ßŞ§¾Gµ.}OÒ¨‘\ìOé§§©\Üƒ\×\éIŒ@ü)€¨üóR–\0d~]½şP*l2\Ì/º@¾¦ºeU@\0\í\\´PsŞºiø=iXw/\Z©5š¹/\nÿ\0Î§ó÷\Å$o•ç¨ Fqœ\Çû¶aÁ¦}®a)Q\Ó5kP·&ñòº­b‰Ì™ü\Ô\rq\Êd_˜j\Ì\Õ`¯c\ÍB²H?‹:[­ğ2±\Îi eû\İj™\ëV¾\Î(±@¶\É\Çj²p(M¡#¡ª— \Åc\ĞV£b³õ÷ZÉü4€Í¸“\ëM\Íb¨‘:ÓƒA£¿˜ fÍ±\İ5r:Ëµ¸\\=j\ìrn8Ë Ÿ¥C=¬\ãx\äwƒ&\Øòy¡J‘“H\Ë\Ë1nÊ€\ÕN§<[7(’[²x\È\Íb\à÷?…1\'?L\Òõ\Ïe¤l÷©2H(@\É8\È61…Á„\ç\î\äS˜\ã€F(\0Á4õ™Ñ°4\Ì\ãƒÔ˜# \ãŸz,µ»†*Âº8\àŠ\ÎÚªœòH\ã„\ç6\Í\Z·aMû2\ÕD¹t$‘\ëS-ğ\Ç*sJÃ¹\\\É\' \ïJw\0\Ş;L\Îzÿ\0:^¸ÛSVH¡KÈ¡¹\É#\éÚ[$ò½–\ÆF?J\0k}sô¦”#ƒRŒt>\Ôc\róZ`BPö«vT`œqŒ\ÓztÎ¢•\0RG§z@Xü¡É—>‚§:¹R8­-LøFÁÀÏ—8úT\Z–\ë »ıi\å7\Õü\Äe\ë7x†\ä\×^¢=B\Ş\å%…>I\Z>\ê¬@\Â*N|–ş´\æÄ¸ş#N‹cÌ¢I¦y5\Ö<\Â\ÛL‚MŠ\Ù0}ğ*\ÛX“T°•QU‹²¶^(©©\ØF€…Àã¡¤mZ\Çş~\äÂ¬\Ëj±\áF\Z6F\ãñÖª\Û\ßõ©¬ü D’İŸ(\íøP.§d\Ä´ı\r%\å\å¼A¢’Ui\Ú\İ\Ãk(\á\Ér\ä\ãh\Ïÿ\0Z—F\Ã\\Ş“ƒ\Ê\è4\æ7.z\Ò\îQüY®Ám\ÔjòMƒ\nòÂ£WûvÓş­\éˆ\ä÷)<R\îLrß…o\ë÷\Æ$’\Ğ[\åYAó=9ú{V¥¢$6vÑ7ô¢\àq”\ç<w\Æ1\Ô\Z\Ú\Ó\"\ë·\ê@\ÇQøœÿ\0Z¹ij ¾½!F\Ù\n¸üA\Ï\ëEÀç† \î¥@\'\Ó4£P8\Ø¡­-L:›m\Z´\ì±ı\ã“Tu«\Ë[Ä‹\Êÿ\0„o˜ G4‡s=\ï[‘ŸÊ¡IQI\'Ò·ü6¿º¹C\åRh÷¢y¥´1\ån;½~jb9\Ó\"»}\ïÒe\Éü+G]¼3\ÎÖ‰K†İ¼õ\ë;$ ~´\0}ßº\Ù\'Ò†\àu\ë\Ô\Ò8\Ç\ÍJK=(\0ÀÉ¥\äqH¸\'‘ŸÆ•²Nr:\ã€\0t)¡ˆ,98 ¨1\ÇJ62xö B¾\0Â‚Ö“\r\ëúÒªòX\ãÆšNO¥0\İ0 ?:R\ägo\'Ş„n\ä\äı(“š]\ä.ü…IŸlP@Ûº\r ¨Aœş\Ë.=(À0ß\0.zdœ\ĞóŒ€Nz\Ôrİ·¥?\æs\ÇaC#\ß\å##¹©ÿ\0È´¿\îGı*`Ow¹\Ç\çT\æÔ¦»\Ó~\Ë\ä\"¨\n7\ïô\ÇøSl¯\äÓ¦”\Ç—\Ì\ÇV\Æ1H\r\Í;\î^ÿ\0\×Ä•Z/ùıqo\ëU$\×\î6H\àŠ2ÀÛ³Šu9WKû¸(S~ú\0×¼ÿ\04X¿˜©o\Ïúu‡ıu?ú	¬Èµ\Ù\Ö$ŒZ#P3¿Ò«Í¬O=\ä“’D`÷>¦€:D™dX¿Š<\ÌVø«ÿ\0lÿ\0\è\ë¥ü—\"ù\Ğ!MşóU\ÒöAª›\ï-s’vnö\ÇZ\0¿®M\ä\êh@\Î`\Æ?\Z“Ã„±»\'®Wù\ZË¿½{û¥•FU6\à6sŞ¤\Óõ\Ó|İ‘¬¾a–\Æ(x\\gK^\íµP)³ÿ\0\Èv\Óş¹½aÿ\0iL–Q[˜—j8|\î\ë†\Î*f\Ö%’ò+¯!J\í\ß\×4g]¼•¦û\Ær\Ës¿ıjÖ–k‹gF\"\'p=ò1X\âd]¦\ÑrHş?CQ\\kOo7\ÙÂˆ‰8\İ÷³@\ZğÇ³\Äûğ«~¸ş•n	–xKVSõ\Ïÿ\0oKöŸ<[&vl\Æÿ\0|\Ôvš\ÌÖ¢P WH\În™\í@4±ue§›µ•\Ü\åš\"x8\à\Ô\Úü1=œwj¸|„©\ìk:\ÇVš\Æ	&ˆó´œc=ioµ)µEx–8”\çh9\Éú\Ğ†¿\Õ\\ÿ\0¾?•A ÿ\0\È^ó\è\ßúV\Óõ)l¡ `ylb¢²¿’\Æ\îY– \í.r»±s@­Ÿ\í{¢GA\ì*º¸_\á ‘\ÆsW—V–9n˜À¹¸\ÆFÿ\0»\Æ*+\Ë\Ù/c·W„F±»ºñ\éL\n n=@4rx\0}jHvùŸ0ùI\çµ\\+h\0\Ã½×Ÿó\Å\0P—¡§#LaKu\ÏZ½¶È‘ó6	\ï)qe“÷±:\Ğzw\'#süY«Š°ó’§“\ÜúqN˜Zˆ”\Ä\É\ès@\Ã+e½iDNyõ¦[4\ã†9\İÖ˜2”\è{S%¶ŒE€v\0´\Õ²sÈ¢Š`9T¹9=9¤H÷g½P7\ÊÌ£µ:5ó,O4Q@\Øv\Æ1\ë\Í!\Ú:s\×4QHh\Õ0H\Í P1\çÚŠ(\İû†\0À4…”.6òG\\\ÑE1‚’q\íN\Î\æŠ(§ \0\nTmªH#ÚŠ(Ÿ4˜\É\Îx\æ”\å\å\âŠ(›™A*yõ§\'-“\Î=h¢€\ZÄ·Ò¤Dı\É\É4QHGe\É&\ä°<\ÑE0\×`^O\"šg“E\0Ÿy±Nl)Áô\ÍPd&23\Í=G\Ú&\nxÒŠ)l„À#ŸZ@\Ø3õ¢Š`\'¿¯4\ç\ê1À=¨¢€\00=iBo\É>´Q@ÿ\Ù','sdasd');
/*!40000 ALTER TABLE `tblproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproductcategory`
--

DROP TABLE IF EXISTS `tblproductcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproductcategory` (
  `intProdCateCode` int(11) NOT NULL AUTO_INCREMENT,
  `strProdCategory` varchar(20) NOT NULL,
  PRIMARY KEY (`intProdCateCode`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproductcategory`
--

LOCK TABLES `tblproductcategory` WRITE;
/*!40000 ALTER TABLE `tblproductcategory` DISABLE KEYS */;
INSERT INTO `tblproductcategory` VALUES (4,'Hair Wax'),(5,'Hair Cut');
/*!40000 ALTER TABLE `tblproductcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproductpackage`
--

DROP TABLE IF EXISTS `tblproductpackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproductpackage` (
  `intProductPackageID` int(11) NOT NULL AUTO_INCREMENT,
  `intPackageID` int(11) NOT NULL,
  `intProductID` int(11) NOT NULL,
  `intQuantity` int(11) NOT NULL,
  `intProductPackageStatus` int(11) NOT NULL,
  PRIMARY KEY (`intProductPackageID`),
  KEY `fk_PPPPackageID_idx` (`intPackageID`),
  KEY `fk_PPPProductID_idx` (`intProductID`),
  CONSTRAINT `fk_PPPPackageID` FOREIGN KEY (`intPackageID`) REFERENCES `tblpackage` (`intPackageID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_PPPProductID` FOREIGN KEY (`intProductID`) REFERENCES `tblproduct` (`intProductID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproductpackage`
--

LOCK TABLES `tblproductpackage` WRITE;
/*!40000 ALTER TABLE `tblproductpackage` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproductpackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproductprice`
--

DROP TABLE IF EXISTS `tblproductprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproductprice` (
  `intProductPriceID` int(11) NOT NULL AUTO_INCREMENT,
  `intProductID` int(11) NOT NULL,
  `dblProductPrice` double NOT NULL,
  `dtmProdPriceAsOf` datetime NOT NULL,
  PRIMARY KEY (`intProductPriceID`),
  KEY `fk_intProductID_idx` (`intProductID`),
  CONSTRAINT `fk_intPriceProductID` FOREIGN KEY (`intProductID`) REFERENCES `tblproduct` (`intProductID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproductprice`
--

LOCK TABLES `tblproductprice` WRITE;
/*!40000 ALTER TABLE `tblproductprice` DISABLE KEYS */;
INSERT INTO `tblproductprice` VALUES (9,12,95,'2016-02-27 08:27:33'),(10,13,100,'2016-02-27 10:32:23');
/*!40000 ALTER TABLE `tblproductprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproductpromo`
--

DROP TABLE IF EXISTS `tblproductpromo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproductpromo` (
  `intProductPromoID` int(11) NOT NULL AUTO_INCREMENT,
  `intPromoID` int(11) NOT NULL,
  `intProductID` int(11) NOT NULL,
  `intProductQuantity` int(11) NOT NULL,
  `intPromoStatus` int(11) NOT NULL,
  PRIMARY KEY (`intProductPromoID`),
  KEY `fk_strPPPromoID_idx` (`intPromoID`),
  KEY `fk_intPPProductID_idx` (`intProductID`),
  CONSTRAINT `fk_intPPProductID` FOREIGN KEY (`intProductID`) REFERENCES `tblproduct` (`intProductID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intPPPromoID` FOREIGN KEY (`intPromoID`) REFERENCES `tblpromo` (`intPromoID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproductpromo`
--

LOCK TABLES `tblproductpromo` WRITE;
/*!40000 ALTER TABLE `tblproductpromo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproductpromo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproductpurchase`
--

DROP TABLE IF EXISTS `tblproductpurchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproductpurchase` (
  `intPurchaseID` int(11) NOT NULL AUTO_INCREMENT,
  `intWalkInID` int(11) NOT NULL,
  `intProductID` int(11) NOT NULL,
  `intQuantity` int(11) NOT NULL,
  PRIMARY KEY (`intPurchaseID`),
  KEY `fk_intWalkInID_idx` (`intWalkInID`),
  KEY `fk_intProductID_idx` (`intProductID`),
  CONSTRAINT `fk_intProductWalkInID` FOREIGN KEY (`intWalkInID`) REFERENCES `tblwalkin` (`intWalkInID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intPurchaseProductID` FOREIGN KEY (`intProductID`) REFERENCES `tblproduct` (`intProductID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproductpurchase`
--

LOCK TABLES `tblproductpurchase` WRITE;
/*!40000 ALTER TABLE `tblproductpurchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproductpurchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproductpurchasereservation`
--

DROP TABLE IF EXISTS `tblproductpurchasereservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproductpurchasereservation` (
  `intProductPurchaseReservationID` int(11) NOT NULL AUTO_INCREMENT,
  `intReservationID` int(11) NOT NULL,
  `intProductID` int(11) NOT NULL,
  `intStatus` int(11) NOT NULL,
  PRIMARY KEY (`intProductPurchaseReservationID`),
  KEY `fk_intProductReservationID_idx` (`intReservationID`),
  KEY `fk_intReservationProductID_idx` (`intProductID`),
  CONSTRAINT `fk_intProductReservationID` FOREIGN KEY (`intReservationID`) REFERENCES `tblreservation` (`intReservationID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intReservationProductID` FOREIGN KEY (`intProductID`) REFERENCES `tblproduct` (`intProductID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproductpurchasereservation`
--

LOCK TABLES `tblproductpurchasereservation` WRITE;
/*!40000 ALTER TABLE `tblproductpurchasereservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproductpurchasereservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpromo`
--

DROP TABLE IF EXISTS `tblpromo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpromo` (
  `intPromoID` int(11) NOT NULL AUTO_INCREMENT,
  `strPromoName` varchar(45) NOT NULL,
  `strPromoDescription` varchar(70) NOT NULL,
  `intMaxHeadCount` int(11) NOT NULL,
  `dblPromoPrice` double NOT NULL,
  `strPromoAvailability` varchar(20) NOT NULL,
  PRIMARY KEY (`intPromoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpromo`
--

LOCK TABLES `tblpromo` WRITE;
/*!40000 ALTER TABLE `tblpromo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpromo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpromoprice`
--

DROP TABLE IF EXISTS `tblpromoprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpromoprice` (
  `intPromoPriceId` int(11) NOT NULL AUTO_INCREMENT,
  `intPromoID` int(11) NOT NULL,
  `dblPromoPrice` double NOT NULL,
  `dtmPromoPriceAsOf` datetime NOT NULL,
  PRIMARY KEY (`intPromoPriceId`),
  KEY `fk_intPromoID_idx` (`intPromoID`),
  CONSTRAINT `fk_intPromoID` FOREIGN KEY (`intPromoID`) REFERENCES `tblpromo` (`intPromoID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpromoprice`
--

LOCK TABLES `tblpromoprice` WRITE;
/*!40000 ALTER TABLE `tblpromoprice` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpromoprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpromowalkin`
--

DROP TABLE IF EXISTS `tblpromowalkin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpromowalkin` (
  `intPromoWalkInID` int(11) NOT NULL,
  `intWalkInID` int(11) NOT NULL,
  `intPromoID` int(11) NOT NULL,
  `intPromoWalkInStatus` int(11) NOT NULL,
  `intEmployeeAssigned` int(11) DEFAULT NULL,
  PRIMARY KEY (`intPromoWalkInID`),
  KEY `fk_intWalkInID_idx` (`intWalkInID`),
  KEY `fk_intPromoID_idx` (`intPromoID`),
  KEY `fk_intPromoEmployeeAssignedID_idx` (`intEmployeeAssigned`),
  CONSTRAINT `fk_intPromoEmployeeAssignedID` FOREIGN KEY (`intEmployeeAssigned`) REFERENCES `tblemployeeassignment` (`intAssignmentID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intPromoWalkInID` FOREIGN KEY (`intWalkInID`) REFERENCES `tblwalkin` (`intWalkInID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intWalkInPromoID` FOREIGN KEY (`intPromoID`) REFERENCES `tblpromo` (`intPromoID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpromowalkin`
--

LOCK TABLES `tblpromowalkin` WRITE;
/*!40000 ALTER TABLE `tblpromowalkin` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpromowalkin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblreclist`
--

DROP TABLE IF EXISTS `tblreclist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblreclist` (
  `intRECListID` int(11) NOT NULL AUTO_INCREMENT,
  `intExtraChargeID` int(11) NOT NULL,
  `intRECID` int(11) NOT NULL,
  PRIMARY KEY (`intRECListID`),
  KEY `fk_intExtraChargeID_idx` (`intExtraChargeID`),
  KEY `fk_intRECID_idx` (`intRECID`),
  CONSTRAINT `fk_intExtraChargeID` FOREIGN KEY (`intExtraChargeID`) REFERENCES `tblextracharges` (`intExtraChargeID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intRECID` FOREIGN KEY (`intRECID`) REFERENCES `tblreservationextracharge` (`intRECID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblreclist`
--

LOCK TABLES `tblreclist` WRITE;
/*!40000 ALTER TABLE `tblreclist` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblreclist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblreservation`
--

DROP TABLE IF EXISTS `tblreservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblreservation` (
  `intReservationID` int(11) NOT NULL AUTO_INCREMENT,
  `intInvoiceID` int(11) DEFAULT NULL,
  `intReservationType` int(11) NOT NULL,
  `dtmDateTimeCreated` datetime NOT NULL,
  `dtmReservedDateTime` datetime NOT NULL,
  `dtmDateTimeEnd` datetime NOT NULL,
  `strAddress` varchar(60) NOT NULL,
  `intReservationStatus` int(11) NOT NULL,
  `intHeadCount` int(11) NOT NULL,
  `intEmployeeAssigned` int(11) NOT NULL,
  PRIMARY KEY (`intReservationID`),
  KEY `fk_intInvoiceID_idx` (`intInvoiceID`),
  KEY `fk_intReservationType_idx` (`intReservationType`),
  KEY `fk_intReservationEmployeeAssigned_idx` (`intEmployeeAssigned`),
  CONSTRAINT `fk_intReservationEmployeeAssigned` FOREIGN KEY (`intEmployeeAssigned`) REFERENCES `tblemployeeassignment` (`intAssignmentID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intReservationInvoiceID` FOREIGN KEY (`intInvoiceID`) REFERENCES `tblinvoice` (`intInvoiceID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intReservationType` FOREIGN KEY (`intReservationType`) REFERENCES `tblreservationtype` (`intReservationTypeID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblreservation`
--

LOCK TABLES `tblreservation` WRITE;
/*!40000 ALTER TABLE `tblreservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblreservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblreservationextracharge`
--

DROP TABLE IF EXISTS `tblreservationextracharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblreservationextracharge` (
  `intRECID` int(11) NOT NULL AUTO_INCREMENT,
  `intReservationID` int(11) NOT NULL,
  PRIMARY KEY (`intRECID`),
  KEY `fk_REC_intReservationID_idx` (`intReservationID`),
  CONSTRAINT `fk_REC_intReservationID` FOREIGN KEY (`intReservationID`) REFERENCES `tblreservation` (`intReservationID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblreservationextracharge`
--

LOCK TABLES `tblreservationextracharge` WRITE;
/*!40000 ALTER TABLE `tblreservationextracharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblreservationextracharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblreservationtype`
--

DROP TABLE IF EXISTS `tblreservationtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblreservationtype` (
  `intReservationTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `strReservationType` varchar(20) NOT NULL,
  `dblAddedPrice` double NOT NULL,
  `intReservationTypeStatus` int(11) NOT NULL,
  PRIMARY KEY (`intReservationTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblreservationtype`
--

LOCK TABLES `tblreservationtype` WRITE;
/*!40000 ALTER TABLE `tblreservationtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblreservationtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblservice`
--

DROP TABLE IF EXISTS `tblservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblservice` (
  `intServiceID` int(11) NOT NULL AUTO_INCREMENT,
  `strServiceName` varchar(20) NOT NULL,
  `intServiceCateCode` int(11) NOT NULL,
  `intServiceStatus` int(11) NOT NULL,
  `strServiceDesc` varchar(60) NOT NULL,
  `blobServicePhoto` longblob NOT NULL,
  PRIMARY KEY (`intServiceID`),
  KEY `fk_intServiceCateCode_idx` (`intServiceCateCode`),
  CONSTRAINT `fk_intServiceCateCode` FOREIGN KEY (`intServiceCateCode`) REFERENCES `tblservicecategory` (`intServiceCateCode`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblservice`
--

LOCK TABLES `tblservice` WRITE;
/*!40000 ALTER TABLE `tblservice` DISABLE KEYS */;
INSERT INTO `tblservice` VALUES (31,'Under Cusss',12,1,'Sample Description','121321	'),(32,'Junior`s Cut 2',12,1,'hair cut','ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿ\Û\0C\0!!$-K0-**-ZBE6Kl`roi`ifx‡«x~¢fi–Ì–¢±·ÀÀÀr\Ò\áÏºŞ«½À·ÿ\Û\0C!!!-\'-W00W·{i{··················································ÿ\Ä¢\0\0\0'),(33,'Junior`s Cutsssssss',12,1,'sample detail','ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿ\Û\0C\0!!$-K0-**-ZBE6Kl`roi`ifx‡«x~¢fi–Ì–¢±·ÀÀÀr\Ò\áÏºŞ«½À·ÿ\Û\0C!!!-\'-W00W·{i{··················································ÿ\Ä¢\0\0\0'),(34,'Junior`s Cut',12,1,'sample detail','ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿ\Û\0C\0!!$-K0-**-ZBE6Kl`roi`ifx‡«x~¢fi–Ì–¢±·ÀÀÀr\Ò\áÏºŞ«½À·ÿ\Û\0C!!!-\'-W00W·{i{··················································ÿ\Ä¢\0\0\0'),(35,'Junior`s Cut',12,1,'sample detail','ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿ\Û\0C\0!!$-K0-**-ZBE6Kl`roi`ifx‡«x~¢fi–Ì–¢±·ÀÀÀr\Ò\áÏºŞ«½À·ÿ\Û\0C!!!-\'-W00W·{i{··················································ÿ\Ä¢\0\0\0'),(36,'Junior`s Cut',12,1,'sample detail','ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿ\Û\0C\0!!$-K0-**-ZBE6Kl`roi`ifx‡«x~¢fi–Ì–¢±·ÀÀÀr\Ò\áÏºŞ«½À·ÿ\Û\0C!!!-\'-W00W·{i{··················································ÿ\Ä¢\0\0\0'),(37,'Junior`s Cut',12,1,'sample detail','ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿ\Û\0C\0!!$-K0-**-ZBE6Kl`roi`ifx‡«x~¢fi–Ì–¢±·ÀÀÀr\Ò\áÏºŞ«½À·ÿ\Û\0C!!!-\'-W00W·{i{··················································ÿ\Ä¢\0\0\0'),(38,'jeff',12,1,'asdfasdfasdf','ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿ\Û\0C\0!!$-K0-**-ZBE6Kl`roi`ifx‡«x~¢fi–Ì–¢±·ÀÀÀr\Ò\áÏºŞ«½À·ÿ\Û\0C!!!-\'-W00W·{i{··················································ÿ\Ä¢\0\0\0\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùú\0\0\0\0\0\0\0	\n\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿÀ\0,\"\0ÿ\Ú\0\0\0?\0­(\Í&ihh?4Œx™¤cÒ›Wÿ\0E<\rµ*Ê­œ08ô9¬\ë(’öx\á›&$~\Ìğ\Ç8\æ‹Ï±Gm+À©kwª\àúw ’ûJ¡°X\îib£pı9¡I>CHüœ\ã9¨­ô«V¿º†U2\nÉ–?( ñÖ 5T‡K„\èM3FLş[0m\Ç9\ÅXM.\ÅR\Õdƒ/(Á;]¹õö \n\Ôğj¶“j÷wk$YDe8\É\ï\ïP&Ÿo™u<±nx\ÙÂ’Ç€z\0\Õ\ÍªJµškWŠ<B\èY\×qÁ\àc¿¹ªñD­\'•d‚{’€?uG¯¹ \rq\"“€\ÊO 43ªı\æ\êj”\ÖúlRI±GnUAI3´œ÷Ú¢µ†¥‹\ë\ÔûL½\Øg¥‘ØŒzÑš¡6™lš¤\ì>Lªÿ\0»\Üpc‘Ki¤\ÛIqt$Œ²¤P<\ë\ï@ó\ëKšÊ·\Ó\íSNy®\"\ŞÁ\Ød±\é»½J\ÚM¯ö¤qˆÈ„\Ä\ÌWq\ä‚¯½\0iJ\rfC¤\Û6£r1\"¡E\Üx\È9\ï\íUá°·»\Ó\â’ö\É\æ…rôİƒ\ßÒ€73HdP\Ø, ú\ÍbÜ¢Y\\]½1ˆa\npIù˜õ\ç\ĞU©­4ûCO\Ó9\èG©÷ \r\"\Øc\ïB°a• PsXö6\Ñ]Iq\æHn-\àm±)l®1Ÿ\ÇÒ›silö–\×P\Å\å$djH¤÷\Å\0m\æŒ\ÖIÒ­¿µDb2!òw\Ü~öq´A¥[\ëµxÉŠ=»q\ã#ô¯š+]>\Õà³–\Êù² |1\åH9jIô«e\Ôm£HÈ‰•Ë®\ã\Î1şô¯š\\\Ö±³–Køc‹l†<e~¾´\ác7\ZzD¥g?¼‘÷\à2hf–’Š.h\Í%\0¹¢’–€9ÒƒM\Í«4šF\éIšF?-\0Z±[‰n\â¬‘\É\ZYó†éŠ»~‘j:T\Ó<afƒp\Ü=W¯>•B\ĞÈ˜š	*dr2ô5b{›«¸Œ2b¾÷–[ó¨$Ñ¹ÿ\0­?ı\æÿ\0\Ğ\rG\ã\Äs¯÷ Sùş½SŠòö–50\È…gpø¨S\í\İı©]br\à\àƒ\éLP#d\áv\Ùâ‰\êõªÚŒ¾V¡¦§ûgùıj“\\^½\â\\“\0tRppA¦\Ü}¦ö\â9¥hU\â\ÆÍ \ã9\Ï4·+‹V\ßÿ\0=eUüğ*¶ª^•$cşZ8›Vmı\İ\äÁF·8\ØQL¸\Ônn\ÕQ\nª¸oœPœ\Í‰>\ŞM¹‘ı:UYae³±‚Fe\Ú\çøN3š\'¸û4ö\è\Ñys3XŒÖƒÆ·ñª9WĞŠLª/–[;\äFx\Ô\ËÓ„z*°|2ª9\Ú@ü¤óuw[&x2*’*d0\İY\'—k$rDy\Û09¿\"j2l\Õt\Şz³\ÌV¤uµpç´¡1\éY“Z\Ü\\H·\Ë¸B`±ps^i\×)w\åo{eòœH»CrGL\Ğš\×ú6Œ\êW«f®\È\á#7_İ„Ÿ\ëı+:\ê»ø\Ö+–c\r»\ä\'­+E¨IgöV{`…6³ŒPö!!š\ãûÑ†ü…g\è\naó!\ê\Z4—\èH\çùSŒ:ƒYı”½¶Â›7a³Œb-nm\î<\ËV‡5B$·Ò•À¯¼d^\\:‡3;¦vÊ­[™¢ò¬¯\Ìs‰T…`:€:\Z}½’¦m¦`Û·n#§<S5”\"=´F\ä6=ñEÀ4\ët´k\ècûªù\Ó*\rU»m½gõa,®\í\äi¡¸WšOõ¢Eù[\Ó\éŠl\ÖWÉ¶òH•\0;cˆgO¥0/N\Â\Ş\ëû±ñ¤›[\\\ÎŞw\ä*”¶ú„Ö†Ù¤¶Wi`8¥{}B[Cl\ÒZ\ì+°°\r»&’<ı&\Ğÿ\0p\çòÈ«00¹\Ù?÷K¯\ë\éT\í\í¯l£1[=±‹q+¼6@=¸¤µ¶\Ô,\áò\ã’\ÕÁ%²Á³\Í\0AdJ\ëFQ\Ò\âIPe\Æ*W½‚\rb\å\î-OOJr\é÷\Çl\ÑIš&vmÀ\í;©¦\Êü›“\æZ\æ\ã¸n01\Å\0Nu›>\í \Ç\'÷M\Ç\éWQ\ÖDWC•a}Eg=¾£#H\Å\í‘6\àsş5z\Ş#´Q’Š>¸–Š( –’–€8\Ü\ï\ÑóxR\Z\\\Õ\ZX>oQF[¾( š.,ÚŸİ·Ö¦\ÍVµ8VúÔ¤Ô±n¥\ÍEšp4~iÀ\â¢œ\r\0AqŸ0óQŠ–\á~­CÒ˜‰TÕ˜\å**šš•Zš\İU…”0ô¬\Ä+MX(\àÔ´2\àjp5O\Î\"¥Šr\ÄqJ\áb\Ø½.y¨\Ë|Ô´®;\İH[\Ò\Õ= %S\Ã\ÕP\ÜÔ„ô¦‘ ¥\ëUC`\æ¦G§q4IE( ô¤¦HR\ÒQ@¢’ŠbŠJZ\0Z3IE–’–€8\Ê)(¦X\ì\ÑIFh-±\åªl\Õ{só¥JM\"Gfš4\àhğiÀ\Ó¥€*\ï#¨ªØ«©\Ï^X\ÌoÆ€·Ò—”)ô§­0!!‡­K\Ä\r¯ù\Ô\Ş^EA\'\î²iŒ•š¬[dŒ\Õ(\ØIŒpkB%Ø¢³cE…>´\â\Õ™MiGz‘ŠÏ‚j#/OJ\ß\Ğ\Ôe\éh>©\Ğ\ç5@J\rK\Ç$SBd\å¿JrI\ïU™ñŠT~i¢®)ûjš¿½!œ«òx¦„\Ñw4Sƒ\rIL¥¤¢€–’Š\0Z)( QIE1efŠf¢\ÒQE\0>ó~-AÃŠš‘,\\Ó…34¢S¨\Å<\Z\0š3S2	i¨#<Õ•4€¦CÀÿ\00\È\ìjuTpzœ€À‚*œ±4•\Î\ÓúSWmƒŠ«3o\â¤fnı*&S»\"\Ê%¶Œµt6Ró6€(˜\Ô1–^J®\ìM‹t©p‘Œ·\'Ò¤\ã\ê)\á\nl— ô\ÅEùr\r0¸öR†Ÿ`1¤g\Í>\Ìn=)¡1‹u5+t\à\Õm\ÛI¨ş\ÑûÁ\Ï†^I9¦I&NsH®®2*	\Ü)\Í4&i\ÚMÀ¯v¬[W\Î5¯\î@hD²JZJ)ˆZZJ(h¤¥ –’–€8¬\Ò\ÓsKL\ĞZ)( !ù\ÅJX\n®iKiÉƒóO _Z˜P!\âœ)‚œ)™5eMUCVT\Ğ«JÀ2i Ó¤s¶\ÂT”ª\Ù\æ¯Mn²®q\È\ïTXl\Ê\Ò(o\Ş=h*GCN^MN¨1Ú€ Y¶uV\âå¾\\WdA\éT\æq\È\ã dG-\æœ	I1œ\â‘p§£µ*)w\æ´d\"\Ú6qW\íSpoqT@À«e`>¦¡Ì¹\×ª\ÉÁ­›˜\ng#­e:\ír9¦‰d–\Îcr„’(¸}\Ç%ºu\'©§Eh\×38Q\Ô\Ñ\Ô:f\à\n×´“’µ‘,_e¹(9QÒ®\Ú\ÉûÅ©{©šZh¥¦!\ÔRR\Ğ\ÑIš(ii)s@P¢’Še‹EP1( \Ñ\ÜS!^¢¥CSw4x§\nh§\n@Jµe:UU«)@\ÉA§\n`4\ài(\èk>\åv¹­ª×‹‚(ª\ä‘\ÍMœT!)jV!;ª»¦i\à\Ğ\Ô®b\Ô\ÉJx\0S\ã\0¸\Í$şkn\ÅjÛ ŒE°R½ª@¼ò*ˆ\àWŠÅ¾µK¼\Z\è*¦¡x	\î9 h\ÅQµ\r\\°joõ5Q†v¨­8dj=ªF\ÊZ°\ãluTv-—A\ïVµ8L–\á”d¡\éUt\ÈÙ§Fiˆ\Ú¹¦\Ò\Ğ!sKIK@E&ihii( &–’Še‹KM¥¤\0M(¤4 ò)’\Ç’¾\â¤*,|\Ëô©VN\ÑN\"Õ”ª«V# dÂ)‹SÆ¹¤±\'5Vñ¹«Œ\ÛP\Ö}\ÃdÒ¸\ìSbGjaj‘‰<TeMP†\' \Âq@”\'4XW&BjK\\4œ€j´\ÒnPA¥µ“Š\Í\Ä*‹qQÉª\"u5J\êV1§VY|Nj„t¬)\ê‡5f;”ºŒ\ã\é\\¸”cŠ\Ğ\Òd>có\Æ:R°\\Kv5uxriÀúÔŒ\ZDUV%@\çÒ“4\ì\Ò\ì\Ò\æ›E0šPi¢–€Kšn­-\0:–š)\Ô\ÄP))i”´”P0&œ\Ôu*\0±\í\Ó\Ü\ĞK¼¹>•r½=È½\ÍB\r1\"a;}i\â\ã\Õj\nZ@[[„÷…Yh\Ïñ\n\Ì4i¿Šk\Æ\Êz05eŒ\Öm½³†&´GÊ˜\'&\Äw\ë“U%9©Y\ê&5#+H0sÒ¢\İ\Ï5;{T;>cT!Jƒ\Ğ\Ôn‡ş”¹¦\"®\â¤·û\Ôò¸#ŠDŒ\Æ\Ür;UGÀ\äşBP7\Z±!-\ëQ\'¢\Ğ@dÖ¶‚(Ï©ªqZ±\äñZPC°u¤\Øc\ázÓ³M¥¨\ì\Òæ™šPhL\Ò\æ£\Í.h 4\àj0iÀ\Óù¥\Í74¹ R\ÓihŠ\Í¥¹è¦œ!sü4\Æ0\ÑRıû•!€\â\0FMY·P\É\ï*#\ïf’& \àP’\â7\Îx {\Ô\0T\Ù<÷\ÍH‘–8\Å1JúV”V Œ°\ÅX[hĞ–§˜®S*(™˜\r¦µ-\íB`¸ü*\Â\í_º\0¥.*\\®4…\È\íÒ‡Áæ˜¤“I9aŒ\Z2\0\rEÇ©4¬u¨‰)ô¦!\ÌF­D¤³ex\ì<“ŠQ…nÀSÍƒHV¤A…\ëJE1… €8\çµ3@\n\r8(¥;n0iÂ€‚§Z‰idm±@_QKŸz\ÇiO4	¤^Œjl3b—5”·²ù©WP~\ë@\ZB”\Z¢º‚ÿ\0Ô«{\ïŠ[£ëŠ…gº0©\×\ÔP”¢šÒ—4\0ñKM¥¦#3šošj:\\\Ğ\Z¡ó\r&óI°úRùm\é@®!jU]Æœ\"5b\Ş¸M\0>\Ú\ÒI9\äZÑ\İc¡5* D\0qJ@*-!1McŠöj7“*JÌ¢Pi¬sM\Ïi¤\â˜É¢\æ(\ÇN\íD\Òf¨’6\Âö\ÍV“s6`T\ÆC\ÜqM\ÜOl\nd•X\àuõ§,™8\ÅXo\à\nc[\åi€DÄƒ“Š`\à\ÅV\äâ¦ˆL	¶Œu¤\\” Š\Ô]´„S…!lP—Še\Ãb\")\ê\à\æ«\ÎÔ€¨z\Òf‚i3Lb\ÑIKH\Í.i´´\0\àO­8JÃ£\Ze-\0N·R\â\ÍJº„ƒµS\Í-\0i.¥¢¤ş\Ò_J\Ê\Í-\0TÛŠ\\t§`R•D†1F9\Í.9\äR¨ \Å\ãÖµ\" ^\0\É\ëUm\"ù³\Ğ\nµõ2e$é¥¾”ŒFj=\Õ%Zc9\'\Æ*C’8¨™†:\ÓP\ÜR¨Ñ²9\ëN\êz\Ò$}E$Æš\Ô\Ù[\'#½14\å“\Ôf™\Í7>ô\ÄZYG`:sI‘Ö«”\Ï^\ÕD’1\È9ˆ1È¦\î¤V\ÃP±Ò”|§Š7\È\ÍHZ€*´²`u¢i6\rVf,y \Ç#g­,\Î‹Ö¢”\å\Í!\Í\Ú)ˆvh\Í&h\Í!¥\Í74P\éi´P©Ù¦f—4\0\êZnh\Í\0FzÑ/¸\Í\ë\ëVHc4\èÁ4Ó’\0ªHI\È /GòG\îiY©|¢¢/¦³e&›j2Ù£v)”J‰”õ)á¹¥rdûU!28Á)\êiNhŒ\ã\èiH\Í!Œ$šRp94\Ó\ÇÒœr’;P)1JŠx¦ U\ëM`µN‰‘šlÉ…&©Ê»­*\ÓùªALC\Ğ\àbœ\Ò\í\ïQ\î–\Å!w.y\ëJ«LQS/JLhQMh	\äSœ\ásL[ƒœ0´L½©˜«‚Tn\ãñ Æ­\×\î:Z­\ÇjŒ\ÂÃµ\02Š#µ\0´¹¤¢€KM¥ ¥¤\Í.h»rNh\ë\×ùQE\è:s\ëTHo\ã¿\ĞT‘j‹œñNS\Óo\ã@\ËT,\Ç=8 ¿aA\ç­C(hzzœô\Å\\œw­++usó\nC*ˆıN½€Wny¥se˜‰NHVT(fn8­P‚8S#\'=)\Ø#¨­h‘v”öE#†`»S Á\ïW\îl\ÒE;WkúŠ\È%’M\ÃM!6iŒS\Ö©±Ñ†ö©•\éˆb¢–<©>j) y\Ç!ô\ä4—N\ÇÚ¢\ßLDŒô‹\É\ÍE¾¤…²q@\np\éS\Ç=j\Üp/¥KE\\Í™JD& \Ôt\í[“Ú‰¡(8÷¬GFˆ²Aš“€h:Ÿ”ñH9Py\è?\Zv:\Üÿ\0xT\É*?z¦G÷G\Í\0v\\\Ò\å\Ë\Æ5n TMl;T	+«|¤\àz\Ô\Ëv?ˆR³\È\Úi„c­]Y\ÇR˜Õ½\é\\\n\"–¬µ°\í\ÅD`a\ïLQš0GZ(\0\Î[;~”€`ƒ\ßŞ§¾Gµ.}OÒ¨‘\ìOé§§©\Üƒ\×\éIŒ@ü)€¨üóR–\0d~]½şP*l2\Ì/º@¾¦ºeU@\0\í\\´PsŞºiø=iXw/\Z©5š¹/\nÿ\0Î§ó÷\Å$o•ç¨ Fqœ\Çû¶aÁ¦}®a)Q\Ó5kP·&ñòº­b‰Ì™ü\Ô\rq\Êd_˜j\Ì\Õ`¯c\ÍB²H?‹:[­ğ2±\Îi eû\İj™\ëV¾\Î(±@¶\É\Çj²p(M¡#¡ª— \Åc\ĞV£b³õ÷ZÉü4€Í¸“\ëM\Íb¨‘:ÓƒA£¿˜ fÍ±\İ5r:Ëµ¸\\=j\ìrn8Ë Ÿ¥C=¬\ãx\äwƒ&\Øòy¡J‘“H\Ë\Ë1nÊ€\ÕN§<[7(’[²x\È\Íb\à÷?…1\'?L\Òõ\Ïe¤l÷©2H(@\É8\È61…Á„\ç\î\äS˜\ã€F(\0Á4õ™Ñ°4\Ì\ãƒÔ˜# \ãŸz,µ»†*Âº8\àŠ\ÎÚªœòH\ã„\ç6\Í\Z·aMû2\ÕD¹t$‘\ëS-ğ\Ç*sJÃ¹\\\É\' \ïJw\0\Ş;L\Îzÿ\0:^¸ÛSVH¡KÈ¡¹\É#\éÚ[$ò½–\ÆF?J\0k}sô¦”#ƒRŒt>\Ôc\róZ`BPö«vT`œqŒ\ÓztÎ¢•\0RG§z@Xü¡É—>‚§:¹R8­-LøFÁÀÏ—8úT\Z–\ë »ıi\å7\Õü\Äe\ë7x†\ä\×^¢=B\Ş\å%…>I\Z>\ê¬@\Â*N|–ş´\æÄ¸ş#N‹cÌ¢I¦y5\Ö<\Â\ÛL‚MŠ\Ù0}ğ*\ÛX“T°•QU‹²¶^(©©\ØF€…Àã¡¤mZ\Çş~\äÂ¬\Ëj±\áF\Z6F\ãñÖª\Û\ßõ©¬ü D’İŸ(\íøP.§d\Ä´ı\r%\å\å¼A¢’Ui\Ú\İ\Ãk(\á\Ér\ä\ãh\Ïÿ\0Z—F\Ã\\Ş“ƒ\Ê\è4\æ7.z\Ò\îQüY®Ám\ÔjòMƒ\nòÂ£WûvÓş­\éˆ\ä÷)<R\îLrß…o\ë÷\Æ$’\Ğ[\åYAó=9ú{V¥¢$6vÑ7ô¢\àq”\ç<w\Æ1\Ô\Z\Ú\Ó\"\ë·\ê@\ÇQøœÿ\0Z¹ij ¾½!F\Ù\n¸üA\Ï\ëEÀç† \î¥@\'\Ó4£P8\Ø¡­-L:›m\Z´\ì±ı\ã“Tu«\Ë[Ä‹\Êÿ\0„o˜ G4‡s=\ï[‘ŸÊ¡IQI\'Ò·ü6¿º¹C\åRh÷¢y¥´1\ån;½~jb9\Ó\"»}\ïÒe\Éü+G]¼3\ÎÖ‰K†İ¼õ\ë;$ ~´\0}ßº\Ù\'Ò†\àu\ë\Ô\Ò8\Ç\ÍJK=(\0ÀÉ¥\äqH¸\'‘ŸÆ•²Nr:\ã€\0t)¡ˆ,98 ¨1\ÇJ62xö B¾\0Â‚Ö“\r\ëúÒªòX\ãÆšNO¥0\İ0 ?:R\ägo\'Ş„n\ä\äı(“š]\ä.ü…IŸlP@Ûº\r ¨Aœş\Ë.=(À0ß\0.zdœ\ĞóŒ€Nz\Ôrİ·¥?\æs\ÇaC#\ß\å##¹©ÿ\0È´¿\îGı*`Ow¹\Ç\çT\æÔ¦»\Ó~\Ë\ä\"¨\n7\ïô\ÇøSl¯\äÓ¦”\Ç—\Ì\ÇV\Æ1H\r\Í;\î^ÿ\0\×Ä•Z/ùıqo\ëU$\×\î6H\àŠ2ÀÛ³Šu9WKû¸(S~ú\0×¼ÿ\04X¿˜©o\Ïúu‡ıu?ú	¬Èµ\Ù\Ö$ŒZ#P3¿Ò«Í¬O=\ä“’D`÷>¦€:D™dX¿Š<\ÌVø«ÿ\0lÿ\0\è\ë¥ü—\"ù\Ğ!MşóU\ÒöAª›\ï-s’vnö\ÇZ\0¿®M\ä\êh@\Î`\Æ?\Z“Ã„±»\'®Wù\ZË¿½{û¥•FU6\à6sŞ¤\Óõ\Ó|İ‘¬¾a–\Æ(x\\gK^\íµP)³ÿ\0\Èv\Óş¹½aÿ\0iL–Q[˜—j8|\î\ë†\Î*f\Ö%’ò+¯!J\í\ß\×4g]¼•¦û\Ær\Ës¿ıjÖ–k‹gF\"\'p=ò1X\âd]¦\ÑrHş?CQ\\kOo7\ÙÂˆ‰8\İ÷³@\ZğÇ³\Äûğ«~¸ş•n	–xKVSõ\Ïÿ\0oKöŸ<[&vl\Æÿ\0|\Ôvš\ÌÖ¢P WH\În™\í@4±ue§›µ•\Ü\åš\"x8\à\Ô\Úü1=œwj¸|„©\ìk:\ÇVš\Æ	&ˆó´œc=ioµ)µEx–8”\çh9\Éú\Ğ†¿\Õ\\ÿ\0¾?•A ÿ\0\È^ó\è\ßúV\Óõ)l¡ `ylb¢²¿’\Æ\îY– \í.r»±s@­Ÿ\í{¢GA\ì*º¸_\á ‘\ÆsW—V–9n˜À¹¸\ÆFÿ\0»\Æ*+\Ë\Ù/c·W„F±»ºñ\éL\n n=@4rx\0}jHvùŸ0ùI\çµ\\+h\0\Ã½×Ÿó\Å\0P—¡§#LaKu\ÏZ½¶È‘ó6	\ï)qe“÷±:\Ğzw\'#süY«Š°ó’§“\ÜúqN˜Zˆ”\Ä\É\ès@\Ã+e½iDNyõ¦[4\ã†9\İÖ˜2”\è{S%¶ŒE€v\0´\Õ²sÈ¢Š`9T¹9=9¤H÷g½P7\ÊÌ£µ:5ó,O4Q@\Øv\Æ1\ë\Í!\Ú:s\×4QHh\Õ0H\Í P1\çÚŠ(\İû†\0À4…”.6òG\\\ÑE1‚’q\íN\Î\æŠ(§ \0\nTmªH#ÚŠ(Ÿ4˜\É\Îx\æ”\å\å\âŠ(›™A*yõ§\'-“\Î=h¢€\ZÄ·Ò¤Dı\É\É4QHGe\É&\ä°<\ÑE0\×`^O\"šg“E\0Ÿy±Nl)Áô\ÍPd&23\Í=G\Ú&\nxÒŠ)l„À#ŸZ@\Ø3õ¢Š`\'¿¯4\ç\ê1À=¨¢€\00=iBo\É>´Q@ÿ\Ù'),(39,'barts',12,1,'asdadfasdf','ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿ\Û\0C\0!!$-K0-**-ZBE6Kl`roi`ifx‡«x~¢fi–Ì–¢±·ÀÀÀr\Ò\áÏºŞ«½À·ÿ\Û\0C!!!-\'-W00W·{i{··················································ÿ\Ä¢\0\0\0\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùú\0\0\0\0\0\0\0	\n\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿÀ\0,\"\0ÿ\Ú\0\0\0?\0­(\Í&ihh?4Œx™¤cÒ›Wÿ\0E<\rµ*Ê­œ08ô9¬\ë(’öx\á›&$~\Ìğ\Ç8\æ‹Ï±Gm+À©kwª\àúw ’ûJ¡°X\îib£pı9¡I>CHüœ\ã9¨­ô«V¿º†U2\nÉ–?( ñÖ 5T‡K„\èM3FLş[0m\Ç9\ÅXM.\ÅR\Õdƒ/(Á;]¹õö \n\Ôğj¶“j÷wk$YDe8\É\ï\ïP&Ÿo™u<±nx\ÙÂ’Ç€z\0\Õ\ÍªJµškWŠ<B\èY\×qÁ\àc¿¹ªñD­\'•d‚{’€?uG¯¹ \rq\"“€\ÊO 43ªı\æ\êj”\ÖúlRI±GnUAI3´œ÷Ú¢µ†¥‹\ë\ÔûL½\Øg¥‘ØŒzÑš¡6™lš¤\ì>Lªÿ\0»\Üpc‘Ki¤\ÛIqt$Œ²¤P<\ë\ï@ó\ëKšÊ·\Ó\íSNy®\"\ŞÁ\Ød±\é»½J\ÚM¯ö¤qˆÈ„\Ä\ÌWq\ä‚¯½\0iJ\rfC¤\Û6£r1\"¡E\Üx\È9\ï\íUá°·»\Ó\â’ö\É\æ…rôİƒ\ßÒ€73HdP\Ø, ú\ÍbÜ¢Y\\]½1ˆa\npIù˜õ\ç\ĞU©­4ûCO\Ó9\èG©÷ \r\"\Øc\ïB°a• PsXö6\Ñ]Iq\æHn-\àm±)l®1Ÿ\ÇÒ›silö–\×P\Å\å$djH¤÷\Å\0m\æŒ\ÖIÒ­¿µDb2!òw\Ü~öq´A¥[\ëµxÉŠ=»q\ã#ô¯š+]>\Õà³–\Êù² |1\åH9jIô«e\Ôm£HÈ‰•Ë®\ã\Î1şô¯š\\\Ö±³–Køc‹l†<e~¾´\ác7\ZzD¥g?¼‘÷\à2hf–’Š.h\Í%\0¹¢’–€9ÒƒM\Í«4šF\éIšF?-\0Z±[‰n\â¬‘\É\ZYó†éŠ»~‘j:T\Ó<afƒp\Ü=W¯>•B\ĞÈ˜š	*dr2ô5b{›«¸Œ2b¾÷–[ó¨$Ñ¹ÿ\0­?ı\æÿ\0\Ğ\rG\ã\Äs¯÷ Sùş½SŠòö–50\È…gpø¨S\í\İı©]br\à\àƒ\éLP#d\áv\Ùâ‰\êõªÚŒ¾V¡¦§ûgùıj“\\^½\â\\“\0tRppA¦\Ü}¦ö\â9¥hU\â\ÆÍ \ã9\Ï4·+‹V\ßÿ\0=eUüğ*¶ª^•$cşZ8›Vmı\İ\äÁF·8\ØQL¸\Ônn\ÕQ\nª¸oœPœ\Í‰>\ŞM¹‘ı:UYae³±‚Fe\Ú\çøN3š\'¸û4ö\è\Ñys3XŒÖƒÆ·ñª9WĞŠLª/–[;\äFx\Ô\ËÓ„z*°|2ª9\Ú@ü¤óuw[&x2*’*d0\İY\'—k$rDy\Û09¿\"j2l\Õt\Şz³\ÌV¤uµpç´¡1\éY“Z\Ü\\H·\Ë¸B`±ps^i\×)w\åo{eòœH»CrGL\Ğš\×ú6Œ\êW«f®\È\á#7_İ„Ÿ\ëı+:\ê»ø\Ö+–c\r»\ä\'­+E¨IgöV{`…6³ŒPö!!š\ãûÑ†ü…g\è\naó!\ê\Z4—\èH\çùSŒ:ƒYı”½¶Â›7a³Œb-nm\î<\ËV‡5B$·Ò•À¯¼d^\\:‡3;¦vÊ­[™¢ò¬¯\Ìs‰T…`:€:\Z}½’¦m¦`Û·n#§<S5”\"=´F\ä6=ñEÀ4\ët´k\ècûªù\Ó*\rU»m½gõa,®\í\äi¡¸WšOõ¢Eù[\Ó\éŠl\ÖWÉ¶òH•\0;cˆgO¥0/N\Â\Ş\ëû±ñ¤›[\\\ÎŞw\ä*”¶ú„Ö†Ù¤¶Wi`8¥{}B[Cl\ÒZ\ì+°°\r»&’<ı&\Ğÿ\0p\çòÈ«00¹\Ù?÷K¯\ë\éT\í\í¯l£1[=±‹q+¼6@=¸¤µ¶\Ô,\áò\ã’\ÕÁ%²Á³\Í\0AdJ\ëFQ\Ò\âIPe\Æ*W½‚\rb\å\î-OOJr\é÷\Çl\ÑIš&vmÀ\í;©¦\Êü›“\æZ\æ\ã¸n01\Å\0Nu›>\í \Ç\'÷M\Ç\éWQ\ÖDWC•a}Eg=¾£#H\Å\í‘6\àsş5z\Ş#´Q’Š>¸–Š( –’–€8\Ü\ï\ÑóxR\Z\\\Õ\ZX>oQF[¾( š.,ÚŸİ·Ö¦\ÍVµ8VúÔ¤Ô±n¥\ÍEšp4~iÀ\â¢œ\r\0AqŸ0óQŠ–\á~­CÒ˜‰TÕ˜\å**šš•Zš\İU…”0ô¬\Ä+MX(\àÔ´2\àjp5O\Î\"¥Šr\ÄqJ\áb\Ø½.y¨\Ë|Ô´®;\İH[\Ò\Õ= %S\Ã\ÕP\ÜÔ„ô¦‘ ¥\ëUC`\æ¦G§q4IE( ô¤¦HR\ÒQ@¢’ŠbŠJZ\0Z3IE–’–€8\Ê)(¦X\ì\ÑIFh-±\åªl\Õ{só¥JM\"Gfš4\àhğiÀ\Ó¥€*\ï#¨ªØ«©\Ï^X\ÌoÆ€·Ò—”)ô§­0!!‡­K\Ä\r¯ù\Ô\Ş^EA\'\î²iŒ•š¬[dŒ\Õ(\ØIŒpkB%Ø¢³cE…>´\â\Õ™MiGz‘ŠÏ‚j#/OJ\ß\Ğ\Ôe\éh>©\Ğ\ç5@J\rK\Ç$SBd\å¿JrI\ïU™ñŠT~i¢®)ûjš¿½!œ«òx¦„\Ñw4Sƒ\rIL¥¤¢€–’Š\0Z)( QIE1efŠf¢\ÒQE\0>ó~-AÃŠš‘,\\Ó…34¢S¨\Å<\Z\0š3S2	i¨#<Õ•4€¦CÀÿ\00\È\ìjuTpzœ€À‚*œ±4•\Î\ÓúSWmƒŠ«3o\â¤fnı*&S»\"\Ê%¶Œµt6Ró6€(˜\Ô1–^J®\ìM‹t©p‘Œ·\'Ò¤\ã\ê)\á\nl— ô\ÅEùr\r0¸öR†Ÿ`1¤g\Í>\Ìn=)¡1‹u5+t\à\Õm\ÛI¨ş\ÑûÁ\Ï†^I9¦I&NsH®®2*	\Ü)\Í4&i\ÚMÀ¯v¬[W\Î5¯\î@hD²JZJ)ˆZZJ(h¤¥ –’–€8¬\Ò\ÓsKL\ĞZ)( !ù\ÅJX\n®iKiÉƒóO _Z˜P!\âœ)‚œ)™5eMUCVT\Ğ«JÀ2i Ó¤s¶\ÂT”ª\Ù\æ¯Mn²®q\È\ïTXl\Ê\Ò(o\Ş=h*GCN^MN¨1Ú€ Y¶uV\âå¾\\WdA\éT\æq\È\ã dG-\æœ	I1œ\â‘p§£µ*)w\æ´d\"\Ú6qW\íSpoqT@À«e`>¦¡Ì¹\×ª\ÉÁ­›˜\ng#­e:\ír9¦‰d–\Îcr„’(¸}\Ç%ºu\'©§Eh\×38Q\Ô\Ñ\Ô:f\à\n×´“’µ‘,_e¹(9QÒ®\Ú\ÉûÅ©{©šZh¥¦!\ÔRR\Ğ\ÑIš(ii)s@P¢’Še‹EP1( \Ñ\ÜS!^¢¥CSw4x§\nh§\n@Jµe:UU«)@\ÉA§\n`4\ài(\èk>\åv¹­ª×‹‚(ª\ä‘\ÍMœT!)jV!;ª»¦i\à\Ğ\Ô®b\Ô\ÉJx\0S\ã\0¸\Í$şkn\ÅjÛ ŒE°R½ª@¼ò*ˆ\àWŠÅ¾µK¼\Z\è*¦¡x	\î9 h\ÅQµ\r\\°joõ5Q†v¨­8dj=ªF\ÊZ°\ãluTv-—A\ïVµ8L–\á”d¡\éUt\ÈÙ§Fiˆ\Ú¹¦\Ò\Ğ!sKIK@E&ihii( &–’Še‹KM¥¤\0M(¤4 ò)’\Ç’¾\â¤*,|\Ëô©VN\ÑN\"Õ”ª«V# dÂ)‹SÆ¹¤±\'5Vñ¹«Œ\ÛP\Ö}\ÃdÒ¸\ìSbGjaj‘‰<TeMP†\' \Âq@”\'4XW&BjK\\4œ€j´\ÒnPA¥µ“Š\Í\Ä*‹qQÉª\"u5J\êV1§VY|Nj„t¬)\ê‡5f;”ºŒ\ã\é\\¸”cŠ\Ğ\Òd>có\Æ:R°\\Kv5uxriÀúÔŒ\ZDUV%@\çÒ“4\ì\Ò\ì\Ò\æ›E0šPi¢–€Kšn­-\0:–š)\Ô\ÄP))i”´”P0&œ\Ôu*\0±\í\Ó\Ü\ĞK¼¹>•r½=È½\ÍB\r1\"a;}i\â\ã\Õj\nZ@[[„÷…Yh\Ïñ\n\Ì4i¿Šk\Æ\Êz05eŒ\Öm½³†&´GÊ˜\'&\Äw\ë“U%9©Y\ê&5#+H0sÒ¢\İ\Ï5;{T;>cT!Jƒ\Ğ\Ôn‡ş”¹¦\"®\â¤·û\Ôò¸#ŠDŒ\Æ\Ür;UGÀ\äşBP7\Z±!-\ëQ\'¢\Ğ@dÖ¶‚(Ï©ªqZ±\äñZPC°u¤\Øc\ázÓ³M¥¨\ì\Òæ™šPhL\Ò\æ£\Í.h 4\àj0iÀ\Óù¥\Í74¹ R\ÓihŠ\Í¥¹è¦œ!sü4\Æ0\ÑRıû•!€\â\0FMY·P\É\ï*#\ïf’& \àP’\â7\Îx {\Ô\0T\Ù<÷\ÍH‘–8\Å1JúV”V Œ°\ÅX[hĞ–§˜®S*(™˜\r¦µ-\íB`¸ü*\Â\í_º\0¥.*\\®4…\È\íÒ‡Áæ˜¤“I9aŒ\Z2\0\rEÇ©4¬u¨‰)ô¦!\ÌF­D¤³ex\ì<“ŠQ…nÀSÍƒHV¤A…\ëJE1… €8\çµ3@\n\r8(¥;n0iÂ€‚§Z‰idm±@_QKŸz\ÇiO4	¤^Œjl3b—5”·²ù©WP~\ë@\ZB”\Z¢º‚ÿ\0Ô«{\ïŠ[£ëŠ…gº0©\×\ÔP”¢šÒ—4\0ñKM¥¦#3šošj:\\\Ğ\Z¡ó\r&óI°úRùm\é@®!jU]Æœ\"5b\Ş¸M\0>\Ú\ÒI9\äZÑ\İc¡5* D\0qJ@*-!1McŠöj7“*JÌ¢Pi¬sM\Ïi¤\â˜É¢\æ(\ÇN\íD\Òf¨’6\Âö\ÍV“s6`T\ÆC\ÜqM\ÜOl\nd•X\àuõ§,™8\ÅXo\à\nc[\åi€DÄƒ“Š`\à\ÅV\äâ¦ˆL	¶Œu¤\\” Š\Ô]´„S…!lP—Še\Ãb\")\ê\à\æ«\ÎÔ€¨z\Òf‚i3Lb\ÑIKH\Í.i´´\0\àO­8JÃ£\Ze-\0N·R\â\ÍJº„ƒµS\Í-\0i.¥¢¤ş\Ò_J\Ê\Í-\0TÛŠ\\t§`R•D†1F9\Í.9\äR¨ \Å\ãÖµ\" ^\0\É\ëUm\"ù³\Ğ\nµõ2e$é¥¾”ŒFj=\Õ%Zc9\'\Æ*C’8¨™†:\ÓP\ÜR¨Ñ²9\ëN\êz\Ò$}E$Æš\Ô\Ù[\'#½14\å“\Ôf™\Í7>ô\ÄZYG`:sI‘Ö«”\Ï^\ÕD’1\È9ˆ1È¦\î¤V\ÃP±Ò”|§Š7\È\ÍHZ€*´²`u¢i6\rVf,y \Ç#g­,\Î‹Ö¢”\å\Í!\Í\Ú)ˆvh\Í&h\Í!¥\Í74P\éi´P©Ù¦f—4\0\êZnh\Í\0FzÑ/¸\Í\ë\ëVHc4\èÁ4Ó’\0ªHI\È /GòG\îiY©|¢¢/¦³e&›j2Ù£v)”J‰”õ)á¹¥rdûU!28Á)\êiNhŒ\ã\èiH\Í!Œ$šRp94\Ó\ÇÒœr’;P)1JŠx¦ U\ëM`µN‰‘šlÉ…&©Ê»­*\ÓùªALC\Ğ\àbœ\Ò\í\ïQ\î–\Å!w.y\ëJ«LQS/JLhQMh	\äSœ\ásL[ƒœ0´L½©˜«‚Tn\ãñ Æ­\×\î:Z­\ÇjŒ\ÂÃµ\02Š#µ\0´¹¤¢€KM¥ ¥¤\Í.h»rNh\ë\×ùQE\è:s\ëTHo\ã¿\ĞT‘j‹œñNS\Óo\ã@\ËT,\Ç=8 ¿aA\ç­C(hzzœô\Å\\œw­++usó\nC*ˆıN½€Wny¥se˜‰NHVT(fn8­P‚8S#\'=)\Ø#¨­h‘v”öE#†`»S Á\ïW\îl\ÒE;WkúŠ\È%’M\ÃM!6iŒS\Ö©±Ñ†ö©•\éˆb¢–<©>j) y\Ç!ô\ä4—N\ÇÚ¢\ßLDŒô‹\É\ÍE¾¤…²q@\np\éS\Ç=j\Üp/¥KE\\Í™JD& \Ôt\í[“Ú‰¡(8÷¬GFˆ²Aš“€h:Ÿ”ñH9Py\è?\Zv:\Üÿ\0xT\É*?z¦G÷G\Í\0v\\\Ò\å\Ë\Æ5n TMl;T	+«|¤\àz\Ô\Ëv?ˆR³\È\Úi„c­]Y\ÇR˜Õ½\é\\\n\"–¬µ°\í\ÅD`a\ïLQš0GZ(\0\Î[;~”€`ƒ\ßŞ§¾Gµ.}OÒ¨‘\ìOé§§©\Üƒ\×\éIŒ@ü)€¨üóR–\0d~]½şP*l2\Ì/º@¾¦ºeU@\0\í\\´PsŞºiø=iXw/\Z©5š¹/\nÿ\0Î§ó÷\Å$o•ç¨ Fqœ\Çû¶aÁ¦}®a)Q\Ó5kP·&ñòº­b‰Ì™ü\Ô\rq\Êd_˜j\Ì\Õ`¯c\ÍB²H?‹:[­ğ2±\Îi eû\İj™\ëV¾\Î(±@¶\É\Çj²p(M¡#¡ª— \Åc\ĞV£b³õ÷ZÉü4€Í¸“\ëM\Íb¨‘:ÓƒA£¿˜ fÍ±\İ5r:Ëµ¸\\=j\ìrn8Ë Ÿ¥C=¬\ãx\äwƒ&\Øòy¡J‘“H\Ë\Ë1nÊ€\ÕN§<[7(’[²x\È\Íb\à÷?…1\'?L\Òõ\Ïe¤l÷©2H(@\É8\È61…Á„\ç\î\äS˜\ã€F(\0Á4õ™Ñ°4\Ì\ãƒÔ˜# \ãŸz,µ»†*Âº8\àŠ\ÎÚªœòH\ã„\ç6\Í\Z·aMû2\ÕD¹t$‘\ëS-ğ\Ç*sJÃ¹\\\É\' \ïJw\0\Ş;L\Îzÿ\0:^¸ÛSVH¡KÈ¡¹\É#\éÚ[$ò½–\ÆF?J\0k}sô¦”#ƒRŒt>\Ôc\róZ`BPö«vT`œqŒ\ÓztÎ¢•\0RG§z@Xü¡É—>‚§:¹R8­-LøFÁÀÏ—8úT\Z–\ë »ıi\å7\Õü\Äe\ë7x†\ä\×^¢=B\Ş\å%…>I\Z>\ê¬@\Â*N|–ş´\æÄ¸ş#N‹cÌ¢I¦y5\Ö<\Â\ÛL‚MŠ\Ù0}ğ*\ÛX“T°•QU‹²¶^(©©\ØF€…Àã¡¤mZ\Çş~\äÂ¬\Ëj±\áF\Z6F\ãñÖª\Û\ßõ©¬ü D’İŸ(\íøP.§d\Ä´ı\r%\å\å¼A¢’Ui\Ú\İ\Ãk(\á\Ér\ä\ãh\Ïÿ\0Z—F\Ã\\Ş“ƒ\Ê\è4\æ7.z\Ò\îQüY®Ám\ÔjòMƒ\nòÂ£WûvÓş­\éˆ\ä÷)<R\îLrß…o\ë÷\Æ$’\Ğ[\åYAó=9ú{V¥¢$6vÑ7ô¢\àq”\ç<w\Æ1\Ô\Z\Ú\Ó\"\ë·\ê@\ÇQøœÿ\0Z¹ij ¾½!F\Ù\n¸üA\Ï\ëEÀç† \î¥@\'\Ó4£P8\Ø¡­-L:›m\Z´\ì±ı\ã“Tu«\Ë[Ä‹\Êÿ\0„o˜ G4‡s=\ï[‘ŸÊ¡IQI\'Ò·ü6¿º¹C\åRh÷¢y¥´1\ån;½~jb9\Ó\"»}\ïÒe\Éü+G]¼3\ÎÖ‰K†İ¼õ\ë;$ ~´\0}ßº\Ù\'Ò†\àu\ë\Ô\Ò8\Ç\ÍJK=(\0ÀÉ¥\äqH¸\'‘ŸÆ•²Nr:\ã€\0t)¡ˆ,98 ¨1\ÇJ62xö B¾\0Â‚Ö“\r\ëúÒªòX\ãÆšNO¥0\İ0 ?:R\ägo\'Ş„n\ä\äı(“š]\ä.ü…IŸlP@Ûº\r ¨Aœş\Ë.=(À0ß\0.zdœ\ĞóŒ€Nz\Ôrİ·¥?\æs\ÇaC#\ß\å##¹©ÿ\0È´¿\îGı*`Ow¹\Ç\çT\æÔ¦»\Ó~\Ë\ä\"¨\n7\ïô\ÇøSl¯\äÓ¦”\Ç—\Ì\ÇV\Æ1H\r\Í;\î^ÿ\0\×Ä•Z/ùıqo\ëU$\×\î6H\àŠ2ÀÛ³Šu9WKû¸(S~ú\0×¼ÿ\04X¿˜©o\Ïúu‡ıu?ú	¬Èµ\Ù\Ö$ŒZ#P3¿Ò«Í¬O=\ä“’D`÷>¦€:D™dX¿Š<\ÌVø«ÿ\0lÿ\0\è\ë¥ü—\"ù\Ğ!MşóU\ÒöAª›\ï-s’vnö\ÇZ\0¿®M\ä\êh@\Î`\Æ?\Z“Ã„±»\'®Wù\ZË¿½{û¥•FU6\à6sŞ¤\Óõ\Ó|İ‘¬¾a–\Æ(x\\gK^\íµP)³ÿ\0\Èv\Óş¹½aÿ\0iL–Q[˜—j8|\î\ë†\Î*f\Ö%’ò+¯!J\í\ß\×4g]¼•¦û\Ær\Ës¿ıjÖ–k‹gF\"\'p=ò1X\âd]¦\ÑrHş?CQ\\kOo7\ÙÂˆ‰8\İ÷³@\ZğÇ³\Äûğ«~¸ş•n	–xKVSõ\Ïÿ\0oKöŸ<[&vl\Æÿ\0|\Ôvš\ÌÖ¢P WH\În™\í@4±ue§›µ•\Ü\åš\"x8\à\Ô\Úü1=œwj¸|„©\ìk:\ÇVš\Æ	&ˆó´œc=ioµ)µEx–8”\çh9\Éú\Ğ†¿\Õ\\ÿ\0¾?•A ÿ\0\È^ó\è\ßúV\Óõ)l¡ `ylb¢²¿’\Æ\îY– \í.r»±s@­Ÿ\í{¢GA\ì*º¸_\á ‘\ÆsW—V–9n˜À¹¸\ÆFÿ\0»\Æ*+\Ë\Ù/c·W„F±»ºñ\éL\n n=@4rx\0}jHvùŸ0ùI\çµ\\+h\0\Ã½×Ÿó\Å\0P—¡§#LaKu\ÏZ½¶È‘ó6	\ï)qe“÷±:\Ğzw\'#süY«Š°ó’§“\ÜúqN˜Zˆ”\Ä\É\ès@\Ã+e½iDNyõ¦[4\ã†9\İÖ˜2”\è{S%¶ŒE€v\0´\Õ²sÈ¢Š`9T¹9=9¤H÷g½P7\ÊÌ£µ:5ó,O4Q@\Øv\Æ1\ë\Í!\Ú:s\×4QHh\Õ0H\Í P1\çÚŠ(\İû†\0À4…”.6òG\\\ÑE1‚’q\íN\Î\æŠ(§ \0\nTmªH#ÚŠ(Ÿ4˜\É\Îx\æ”\å\å\âŠ(›™A*yõ§\'-“\Î=h¢€\ZÄ·Ò¤Dı\É\É4QHGe\É&\ä°<\ÑE0\×`^O\"šg“E\0Ÿy±Nl)Áô\ÍPd&23\Í=G\Ú&\nxÒŠ)l„À#ŸZ@\Ø3õ¢Š`\'¿¯4\ç\ê1À=¨¢€\00=iBo\É>´Q@ÿ\Ù'),(40,'nan',13,1,'alsfjkslakj','ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿ\Û\0C\0!!$-K0-**-ZBE6Kl`roi`ifx‡«x~¢fi–Ì–¢±·ÀÀÀr\Ò\áÏºŞ«½À·ÿ\Û\0C!!!-\'-W00W·{i{··················································ÿ\Ä¢\0\0\0\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùú\0\0\0\0\0\0\0	\n\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿÀ\0,\"\0ÿ\Ú\0\0\0?\0­(\Í&ihh?4Œx™¤cÒ›Wÿ\0E<\rµ*Ê­œ08ô9¬\ë(’öx\á›&$~\Ìğ\Ç8\æ‹Ï±Gm+À©kwª\àúw ’ûJ¡°X\îib£pı9¡I>CHüœ\ã9¨­ô«V¿º†U2\nÉ–?( ñÖ 5T‡K„\èM3FLş[0m\Ç9\ÅXM.\ÅR\Õdƒ/(Á;]¹õö \n\Ôğj¶“j÷wk$YDe8\É\ï\ïP&Ÿo™u<±nx\ÙÂ’Ç€z\0\Õ\ÍªJµškWŠ<B\èY\×qÁ\àc¿¹ªñD­\'•d‚{’€?uG¯¹ \rq\"“€\ÊO 43ªı\æ\êj”\ÖúlRI±GnUAI3´œ÷Ú¢µ†¥‹\ë\ÔûL½\Øg¥‘ØŒzÑš¡6™lš¤\ì>Lªÿ\0»\Üpc‘Ki¤\ÛIqt$Œ²¤P<\ë\ï@ó\ëKšÊ·\Ó\íSNy®\"\ŞÁ\Ød±\é»½J\ÚM¯ö¤qˆÈ„\Ä\ÌWq\ä‚¯½\0iJ\rfC¤\Û6£r1\"¡E\Üx\È9\ï\íUá°·»\Ó\â’ö\É\æ…rôİƒ\ßÒ€73HdP\Ø, ú\ÍbÜ¢Y\\]½1ˆa\npIù˜õ\ç\ĞU©­4ûCO\Ó9\èG©÷ \r\"\Øc\ïB°a• PsXö6\Ñ]Iq\æHn-\àm±)l®1Ÿ\ÇÒ›silö–\×P\Å\å$djH¤÷\Å\0m\æŒ\ÖIÒ­¿µDb2!òw\Ü~öq´A¥[\ëµxÉŠ=»q\ã#ô¯š+]>\Õà³–\Êù² |1\åH9jIô«e\Ôm£HÈ‰•Ë®\ã\Î1şô¯š\\\Ö±³–Køc‹l†<e~¾´\ác7\ZzD¥g?¼‘÷\à2hf–’Š.h\Í%\0¹¢’–€9ÒƒM\Í«4šF\éIšF?-\0Z±[‰n\â¬‘\É\ZYó†éŠ»~‘j:T\Ó<afƒp\Ü=W¯>•B\ĞÈ˜š	*dr2ô5b{›«¸Œ2b¾÷–[ó¨$Ñ¹ÿ\0­?ı\æÿ\0\Ğ\rG\ã\Äs¯÷ Sùş½SŠòö–50\È…gpø¨S\í\İı©]br\à\àƒ\éLP#d\áv\Ùâ‰\êõªÚŒ¾V¡¦§ûgùıj“\\^½\â\\“\0tRppA¦\Ü}¦ö\â9¥hU\â\ÆÍ \ã9\Ï4·+‹V\ßÿ\0=eUüğ*¶ª^•$cşZ8›Vmı\İ\äÁF·8\ØQL¸\Ônn\ÕQ\nª¸oœPœ\Í‰>\ŞM¹‘ı:UYae³±‚Fe\Ú\çøN3š\'¸û4ö\è\Ñys3XŒÖƒÆ·ñª9WĞŠLª/–[;\äFx\Ô\ËÓ„z*°|2ª9\Ú@ü¤óuw[&x2*’*d0\İY\'—k$rDy\Û09¿\"j2l\Õt\Şz³\ÌV¤uµpç´¡1\éY“Z\Ü\\H·\Ë¸B`±ps^i\×)w\åo{eòœH»CrGL\Ğš\×ú6Œ\êW«f®\È\á#7_İ„Ÿ\ëı+:\ê»ø\Ö+–c\r»\ä\'­+E¨IgöV{`…6³ŒPö!!š\ãûÑ†ü…g\è\naó!\ê\Z4—\èH\çùSŒ:ƒYı”½¶Â›7a³Œb-nm\î<\ËV‡5B$·Ò•À¯¼d^\\:‡3;¦vÊ­[™¢ò¬¯\Ìs‰T…`:€:\Z}½’¦m¦`Û·n#§<S5”\"=´F\ä6=ñEÀ4\ët´k\ècûªù\Ó*\rU»m½gõa,®\í\äi¡¸WšOõ¢Eù[\Ó\éŠl\ÖWÉ¶òH•\0;cˆgO¥0/N\Â\Ş\ëû±ñ¤›[\\\ÎŞw\ä*”¶ú„Ö†Ù¤¶Wi`8¥{}B[Cl\ÒZ\ì+°°\r»&’<ı&\Ğÿ\0p\çòÈ«00¹\Ù?÷K¯\ë\éT\í\í¯l£1[=±‹q+¼6@=¸¤µ¶\Ô,\áò\ã’\ÕÁ%²Á³\Í\0AdJ\ëFQ\Ò\âIPe\Æ*W½‚\rb\å\î-OOJr\é÷\Çl\ÑIš&vmÀ\í;©¦\Êü›“\æZ\æ\ã¸n01\Å\0Nu›>\í \Ç\'÷M\Ç\éWQ\ÖDWC•a}Eg=¾£#H\Å\í‘6\àsş5z\Ş#´Q’Š>¸–Š( –’–€8\Ü\ï\ÑóxR\Z\\\Õ\ZX>oQF[¾( š.,ÚŸİ·Ö¦\ÍVµ8VúÔ¤Ô±n¥\ÍEšp4~iÀ\â¢œ\r\0AqŸ0óQŠ–\á~­CÒ˜‰TÕ˜\å**šš•Zš\İU…”0ô¬\Ä+MX(\àÔ´2\àjp5O\Î\"¥Šr\ÄqJ\áb\Ø½.y¨\Ë|Ô´®;\İH[\Ò\Õ= %S\Ã\ÕP\ÜÔ„ô¦‘ ¥\ëUC`\æ¦G§q4IE( ô¤¦HR\ÒQ@¢’ŠbŠJZ\0Z3IE–’–€8\Ê)(¦X\ì\ÑIFh-±\åªl\Õ{só¥JM\"Gfš4\àhğiÀ\Ó¥€*\ï#¨ªØ«©\Ï^X\ÌoÆ€·Ò—”)ô§­0!!‡­K\Ä\r¯ù\Ô\Ş^EA\'\î²iŒ•š¬[dŒ\Õ(\ØIŒpkB%Ø¢³cE…>´\â\Õ™MiGz‘ŠÏ‚j#/OJ\ß\Ğ\Ôe\éh>©\Ğ\ç5@J\rK\Ç$SBd\å¿JrI\ïU™ñŠT~i¢®)ûjš¿½!œ«òx¦„\Ñw4Sƒ\rIL¥¤¢€–’Š\0Z)( QIE1efŠf¢\ÒQE\0>ó~-AÃŠš‘,\\Ó…34¢S¨\Å<\Z\0š3S2	i¨#<Õ•4€¦CÀÿ\00\È\ìjuTpzœ€À‚*œ±4•\Î\ÓúSWmƒŠ«3o\â¤fnı*&S»\"\Ê%¶Œµt6Ró6€(˜\Ô1–^J®\ìM‹t©p‘Œ·\'Ò¤\ã\ê)\á\nl— ô\ÅEùr\r0¸öR†Ÿ`1¤g\Í>\Ìn=)¡1‹u5+t\à\Õm\ÛI¨ş\ÑûÁ\Ï†^I9¦I&NsH®®2*	\Ü)\Í4&i\ÚMÀ¯v¬[W\Î5¯\î@hD²JZJ)ˆZZJ(h¤¥ –’–€8¬\Ò\ÓsKL\ĞZ)( !ù\ÅJX\n®iKiÉƒóO _Z˜P!\âœ)‚œ)™5eMUCVT\Ğ«JÀ2i Ó¤s¶\ÂT”ª\Ù\æ¯Mn²®q\È\ïTXl\Ê\Ò(o\Ş=h*GCN^MN¨1Ú€ Y¶uV\âå¾\\WdA\éT\æq\È\ã dG-\æœ	I1œ\â‘p§£µ*)w\æ´d\"\Ú6qW\íSpoqT@À«e`>¦¡Ì¹\×ª\ÉÁ­›˜\ng#­e:\ír9¦‰d–\Îcr„’(¸}\Ç%ºu\'©§Eh\×38Q\Ô\Ñ\Ô:f\à\n×´“’µ‘,_e¹(9QÒ®\Ú\ÉûÅ©{©šZh¥¦!\ÔRR\Ğ\ÑIš(ii)s@P¢’Še‹EP1( \Ñ\ÜS!^¢¥CSw4x§\nh§\n@Jµe:UU«)@\ÉA§\n`4\ài(\èk>\åv¹­ª×‹‚(ª\ä‘\ÍMœT!)jV!;ª»¦i\à\Ğ\Ô®b\Ô\ÉJx\0S\ã\0¸\Í$şkn\ÅjÛ ŒE°R½ª@¼ò*ˆ\àWŠÅ¾µK¼\Z\è*¦¡x	\î9 h\ÅQµ\r\\°joõ5Q†v¨­8dj=ªF\ÊZ°\ãluTv-—A\ïVµ8L–\á”d¡\éUt\ÈÙ§Fiˆ\Ú¹¦\Ò\Ğ!sKIK@E&ihii( &–’Še‹KM¥¤\0M(¤4 ò)’\Ç’¾\â¤*,|\Ëô©VN\ÑN\"Õ”ª«V# dÂ)‹SÆ¹¤±\'5Vñ¹«Œ\ÛP\Ö}\ÃdÒ¸\ìSbGjaj‘‰<TeMP†\' \Âq@”\'4XW&BjK\\4œ€j´\ÒnPA¥µ“Š\Í\Ä*‹qQÉª\"u5J\êV1§VY|Nj„t¬)\ê‡5f;”ºŒ\ã\é\\¸”cŠ\Ğ\Òd>có\Æ:R°\\Kv5uxriÀúÔŒ\ZDUV%@\çÒ“4\ì\Ò\ì\Ò\æ›E0šPi¢–€Kšn­-\0:–š)\Ô\ÄP))i”´”P0&œ\Ôu*\0±\í\Ó\Ü\ĞK¼¹>•r½=È½\ÍB\r1\"a;}i\â\ã\Õj\nZ@[[„÷…Yh\Ïñ\n\Ì4i¿Šk\Æ\Êz05eŒ\Öm½³†&´GÊ˜\'&\Äw\ë“U%9©Y\ê&5#+H0sÒ¢\İ\Ï5;{T;>cT!Jƒ\Ğ\Ôn‡ş”¹¦\"®\â¤·û\Ôò¸#ŠDŒ\Æ\Ür;UGÀ\äşBP7\Z±!-\ëQ\'¢\Ğ@dÖ¶‚(Ï©ªqZ±\äñZPC°u¤\Øc\ázÓ³M¥¨\ì\Òæ™šPhL\Ò\æ£\Í.h 4\àj0iÀ\Óù¥\Í74¹ R\ÓihŠ\Í¥¹è¦œ!sü4\Æ0\ÑRıû•!€\â\0FMY·P\É\ï*#\ïf’& \àP’\â7\Îx {\Ô\0T\Ù<÷\ÍH‘–8\Å1JúV”V Œ°\ÅX[hĞ–§˜®S*(™˜\r¦µ-\íB`¸ü*\Â\í_º\0¥.*\\®4…\È\íÒ‡Áæ˜¤“I9aŒ\Z2\0\rEÇ©4¬u¨‰)ô¦!\ÌF­D¤³ex\ì<“ŠQ…nÀSÍƒHV¤A…\ëJE1… €8\çµ3@\n\r8(¥;n0iÂ€‚§Z‰idm±@_QKŸz\ÇiO4	¤^Œjl3b—5”·²ù©WP~\ë@\ZB”\Z¢º‚ÿ\0Ô«{\ïŠ[£ëŠ…gº0©\×\ÔP”¢šÒ—4\0ñKM¥¦#3šošj:\\\Ğ\Z¡ó\r&óI°úRùm\é@®!jU]Æœ\"5b\Ş¸M\0>\Ú\ÒI9\äZÑ\İc¡5* D\0qJ@*-!1McŠöj7“*JÌ¢Pi¬sM\Ïi¤\â˜É¢\æ(\ÇN\íD\Òf¨’6\Âö\ÍV“s6`T\ÆC\ÜqM\ÜOl\nd•X\àuõ§,™8\ÅXo\à\nc[\åi€DÄƒ“Š`\à\ÅV\äâ¦ˆL	¶Œu¤\\” Š\Ô]´„S…!lP—Še\Ãb\")\ê\à\æ«\ÎÔ€¨z\Òf‚i3Lb\ÑIKH\Í.i´´\0\àO­8JÃ£\Ze-\0N·R\â\ÍJº„ƒµS\Í-\0i.¥¢¤ş\Ò_J\Ê\Í-\0TÛŠ\\t§`R•D†1F9\Í.9\äR¨ \Å\ãÖµ\" ^\0\É\ëUm\"ù³\Ğ\nµõ2e$é¥¾”ŒFj=\Õ%Zc9\'\Æ*C’8¨™†:\ÓP\ÜR¨Ñ²9\ëN\êz\Ò$}E$Æš\Ô\Ù[\'#½14\å“\Ôf™\Í7>ô\ÄZYG`:sI‘Ö«”\Ï^\ÕD’1\È9ˆ1È¦\î¤V\ÃP±Ò”|§Š7\È\ÍHZ€*´²`u¢i6\rVf,y \Ç#g­,\Î‹Ö¢”\å\Í!\Í\Ú)ˆvh\Í&h\Í!¥\Í74P\éi´P©Ù¦f—4\0\êZnh\Í\0FzÑ/¸\Í\ë\ëVHc4\èÁ4Ó’\0ªHI\È /GòG\îiY©|¢¢/¦³e&›j2Ù£v)”J‰”õ)á¹¥rdûU!28Á)\êiNhŒ\ã\èiH\Í!Œ$šRp94\Ó\ÇÒœr’;P)1JŠx¦ U\ëM`µN‰‘šlÉ…&©Ê»­*\ÓùªALC\Ğ\àbœ\Ò\í\ïQ\î–\Å!w.y\ëJ«LQS/JLhQMh	\äSœ\ásL[ƒœ0´L½©˜«‚Tn\ãñ Æ­\×\î:Z­\ÇjŒ\ÂÃµ\02Š#µ\0´¹¤¢€KM¥ ¥¤\Í.h»rNh\ë\×ùQE\è:s\ëTHo\ã¿\ĞT‘j‹œñNS\Óo\ã@\ËT,\Ç=8 ¿aA\ç­C(hzzœô\Å\\œw­++usó\nC*ˆıN½€Wny¥se˜‰NHVT(fn8­P‚8S#\'=)\Ø#¨­h‘v”öE#†`»S Á\ïW\îl\ÒE;WkúŠ\È%’M\ÃM!6iŒS\Ö©±Ñ†ö©•\éˆb¢–<©>j) y\Ç!ô\ä4—N\ÇÚ¢\ßLDŒô‹\É\ÍE¾¤…²q@\np\éS\Ç=j\Üp/¥KE\\Í™JD& \Ôt\í[“Ú‰¡(8÷¬GFˆ²Aš“€h:Ÿ”ñH9Py\è?\Zv:\Üÿ\0xT\É*?z¦G÷G\Í\0v\\\Ò\å\Ë\Æ5n TMl;T	+«|¤\àz\Ô\Ëv?ˆR³\È\Úi„c­]Y\ÇR˜Õ½\é\\\n\"–¬µ°\í\ÅD`a\ïLQš0GZ(\0\Î[;~”€`ƒ\ßŞ§¾Gµ.}OÒ¨‘\ìOé§§©\Üƒ\×\éIŒ@ü)€¨üóR–\0d~]½şP*l2\Ì/º@¾¦ºeU@\0\í\\´PsŞºiø=iXw/\Z©5š¹/\nÿ\0Î§ó÷\Å$o•ç¨ Fqœ\Çû¶aÁ¦}®a)Q\Ó5kP·&ñòº­b‰Ì™ü\Ô\rq\Êd_˜j\Ì\Õ`¯c\ÍB²H?‹:[­ğ2±\Îi eû\İj™\ëV¾\Î(±@¶\É\Çj²p(M¡#¡ª— \Åc\ĞV£b³õ÷ZÉü4€Í¸“\ëM\Íb¨‘:ÓƒA£¿˜ fÍ±\İ5r:Ëµ¸\\=j\ìrn8Ë Ÿ¥C=¬\ãx\äwƒ&\Øòy¡J‘“H\Ë\Ë1nÊ€\ÕN§<[7(’[²x\È\Íb\à÷?…1\'?L\Òõ\Ïe¤l÷©2H(@\É8\È61…Á„\ç\î\äS˜\ã€F(\0Á4õ™Ñ°4\Ì\ãƒÔ˜# \ãŸz,µ»†*Âº8\àŠ\ÎÚªœòH\ã„\ç6\Í\Z·aMû2\ÕD¹t$‘\ëS-ğ\Ç*sJÃ¹\\\É\' \ïJw\0\Ş;L\Îzÿ\0:^¸ÛSVH¡KÈ¡¹\É#\éÚ[$ò½–\ÆF?J\0k}sô¦”#ƒRŒt>\Ôc\róZ`BPö«vT`œqŒ\ÓztÎ¢•\0RG§z@Xü¡É—>‚§:¹R8­-LøFÁÀÏ—8úT\Z–\ë »ıi\å7\Õü\Äe\ë7x†\ä\×^¢=B\Ş\å%…>I\Z>\ê¬@\Â*N|–ş´\æÄ¸ş#N‹cÌ¢I¦y5\Ö<\Â\ÛL‚MŠ\Ù0}ğ*\ÛX“T°•QU‹²¶^(©©\ØF€…Àã¡¤mZ\Çş~\äÂ¬\Ëj±\áF\Z6F\ãñÖª\Û\ßõ©¬ü D’İŸ(\íøP.§d\Ä´ı\r%\å\å¼A¢’Ui\Ú\İ\Ãk(\á\Ér\ä\ãh\Ïÿ\0Z—F\Ã\\Ş“ƒ\Ê\è4\æ7.z\Ò\îQüY®Ám\ÔjòMƒ\nòÂ£WûvÓş­\éˆ\ä÷)<R\îLrß…o\ë÷\Æ$’\Ğ[\åYAó=9ú{V¥¢$6vÑ7ô¢\àq”\ç<w\Æ1\Ô\Z\Ú\Ó\"\ë·\ê@\ÇQøœÿ\0Z¹ij ¾½!F\Ù\n¸üA\Ï\ëEÀç† \î¥@\'\Ó4£P8\Ø¡­-L:›m\Z´\ì±ı\ã“Tu«\Ë[Ä‹\Êÿ\0„o˜ G4‡s=\ï[‘ŸÊ¡IQI\'Ò·ü6¿º¹C\åRh÷¢y¥´1\ån;½~jb9\Ó\"»}\ïÒe\Éü+G]¼3\ÎÖ‰K†İ¼õ\ë;$ ~´\0}ßº\Ù\'Ò†\àu\ë\Ô\Ò8\Ç\ÍJK=(\0ÀÉ¥\äqH¸\'‘ŸÆ•²Nr:\ã€\0t)¡ˆ,98 ¨1\ÇJ62xö B¾\0Â‚Ö“\r\ëúÒªòX\ãÆšNO¥0\İ0 ?:R\ägo\'Ş„n\ä\äı(“š]\ä.ü…IŸlP@Ûº\r ¨Aœş\Ë.=(À0ß\0.zdœ\ĞóŒ€Nz\Ôrİ·¥?\æs\ÇaC#\ß\å##¹©ÿ\0È´¿\îGı*`Ow¹\Ç\çT\æÔ¦»\Ó~\Ë\ä\"¨\n7\ïô\ÇøSl¯\äÓ¦”\Ç—\Ì\ÇV\Æ1H\r\Í;\î^ÿ\0\×Ä•Z/ùıqo\ëU$\×\î6H\àŠ2ÀÛ³Šu9WKû¸(S~ú\0×¼ÿ\04X¿˜©o\Ïúu‡ıu?ú	¬Èµ\Ù\Ö$ŒZ#P3¿Ò«Í¬O=\ä“’D`÷>¦€:D™dX¿Š<\ÌVø«ÿ\0lÿ\0\è\ë¥ü—\"ù\Ğ!MşóU\ÒöAª›\ï-s’vnö\ÇZ\0¿®M\ä\êh@\Î`\Æ?\Z“Ã„±»\'®Wù\ZË¿½{û¥•FU6\à6sŞ¤\Óõ\Ó|İ‘¬¾a–\Æ(x\\gK^\íµP)³ÿ\0\Èv\Óş¹½aÿ\0iL–Q[˜—j8|\î\ë†\Î*f\Ö%’ò+¯!J\í\ß\×4g]¼•¦û\Ær\Ës¿ıjÖ–k‹gF\"\'p=ò1X\âd]¦\ÑrHş?CQ\\kOo7\ÙÂˆ‰8\İ÷³@\ZğÇ³\Äûğ«~¸ş•n	–xKVSõ\Ïÿ\0oKöŸ<[&vl\Æÿ\0|\Ôvš\ÌÖ¢P WH\În™\í@4±ue§›µ•\Ü\åš\"x8\à\Ô\Úü1=œwj¸|„©\ìk:\ÇVš\Æ	&ˆó´œc=ioµ)µEx–8”\çh9\Éú\Ğ†¿\Õ\\ÿ\0¾?•A ÿ\0\È^ó\è\ßúV\Óõ)l¡ `ylb¢²¿’\Æ\îY– \í.r»±s@­Ÿ\í{¢GA\ì*º¸_\á ‘\ÆsW—V–9n˜À¹¸\ÆFÿ\0»\Æ*+\Ë\Ù/c·W„F±»ºñ\éL\n n=@4rx\0}jHvùŸ0ùI\çµ\\+h\0\Ã½×Ÿó\Å\0P—¡§#LaKu\ÏZ½¶È‘ó6	\ï)qe“÷±:\Ğzw\'#süY«Š°ó’§“\ÜúqN˜Zˆ”\Ä\É\ès@\Ã+e½iDNyõ¦[4\ã†9\İÖ˜2”\è{S%¶ŒE€v\0´\Õ²sÈ¢Š`9T¹9=9¤H÷g½P7\ÊÌ£µ:5ó,O4Q@\Øv\Æ1\ë\Í!\Ú:s\×4QHh\Õ0H\Í P1\çÚŠ(\İû†\0À4…”.6òG\\\ÑE1‚’q\íN\Î\æŠ(§ \0\nTmªH#ÚŠ(Ÿ4˜\É\Îx\æ”\å\å\âŠ(›™A*yõ§\'-“\Î=h¢€\ZÄ·Ò¤Dı\É\É4QHGe\É&\ä°<\ÑE0\×`^O\"šg“E\0Ÿy±Nl)Áô\ÍPd&23\Í=G\Ú&\nxÒŠ)l„À#ŸZ@\Ø3õ¢Š`\'¿¯4\ç\ê1À=¨¢€\00=iBo\É>´Q@ÿ\Ù'),(41,'adfadfasdf',12,1,'asdfadsf','ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿ\Û\0C\0!!$-K0-**-ZBE6Kl`roi`ifx‡«x~¢fi–Ì–¢±·ÀÀÀr\Ò\áÏºŞ«½À·ÿ\Û\0C!!!-\'-W00W·{i{··················································ÿ\Ä¢\0\0\0\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùú\0\0\0\0\0\0\0	\n\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿÀ\0,\"\0ÿ\Ú\0\0\0?\0­(\Í&ihh?4Œx™¤cÒ›Wÿ\0E<\rµ*Ê­œ08ô9¬\ë(’öx\á›&$~\Ìğ\Ç8\æ‹Ï±Gm+À©kwª\àúw ’ûJ¡°X\îib£pı9¡I>CHüœ\ã9¨­ô«V¿º†U2\nÉ–?( ñÖ 5T‡K„\èM3FLş[0m\Ç9\ÅXM.\ÅR\Õdƒ/(Á;]¹õö \n\Ôğj¶“j÷wk$YDe8\É\ï\ïP&Ÿo™u<±nx\ÙÂ’Ç€z\0\Õ\ÍªJµškWŠ<B\èY\×qÁ\àc¿¹ªñD­\'•d‚{’€?uG¯¹ \rq\"“€\ÊO 43ªı\æ\êj”\ÖúlRI±GnUAI3´œ÷Ú¢µ†¥‹\ë\ÔûL½\Øg¥‘ØŒzÑš¡6™lš¤\ì>Lªÿ\0»\Üpc‘Ki¤\ÛIqt$Œ²¤P<\ë\ï@ó\ëKšÊ·\Ó\íSNy®\"\ŞÁ\Ød±\é»½J\ÚM¯ö¤qˆÈ„\Ä\ÌWq\ä‚¯½\0iJ\rfC¤\Û6£r1\"¡E\Üx\È9\ï\íUá°·»\Ó\â’ö\É\æ…rôİƒ\ßÒ€73HdP\Ø, ú\ÍbÜ¢Y\\]½1ˆa\npIù˜õ\ç\ĞU©­4ûCO\Ó9\èG©÷ \r\"\Øc\ïB°a• PsXö6\Ñ]Iq\æHn-\àm±)l®1Ÿ\ÇÒ›silö–\×P\Å\å$djH¤÷\Å\0m\æŒ\ÖIÒ­¿µDb2!òw\Ü~öq´A¥[\ëµxÉŠ=»q\ã#ô¯š+]>\Õà³–\Êù² |1\åH9jIô«e\Ôm£HÈ‰•Ë®\ã\Î1şô¯š\\\Ö±³–Køc‹l†<e~¾´\ác7\ZzD¥g?¼‘÷\à2hf–’Š.h\Í%\0¹¢’–€9ÒƒM\Í«4šF\éIšF?-\0Z±[‰n\â¬‘\É\ZYó†éŠ»~‘j:T\Ó<afƒp\Ü=W¯>•B\ĞÈ˜š	*dr2ô5b{›«¸Œ2b¾÷–[ó¨$Ñ¹ÿ\0­?ı\æÿ\0\Ğ\rG\ã\Äs¯÷ Sùş½SŠòö–50\È…gpø¨S\í\İı©]br\à\àƒ\éLP#d\áv\Ùâ‰\êõªÚŒ¾V¡¦§ûgùıj“\\^½\â\\“\0tRppA¦\Ü}¦ö\â9¥hU\â\ÆÍ \ã9\Ï4·+‹V\ßÿ\0=eUüğ*¶ª^•$cşZ8›Vmı\İ\äÁF·8\ØQL¸\Ônn\ÕQ\nª¸oœPœ\Í‰>\ŞM¹‘ı:UYae³±‚Fe\Ú\çøN3š\'¸û4ö\è\Ñys3XŒÖƒÆ·ñª9WĞŠLª/–[;\äFx\Ô\ËÓ„z*°|2ª9\Ú@ü¤óuw[&x2*’*d0\İY\'—k$rDy\Û09¿\"j2l\Õt\Şz³\ÌV¤uµpç´¡1\éY“Z\Ü\\H·\Ë¸B`±ps^i\×)w\åo{eòœH»CrGL\Ğš\×ú6Œ\êW«f®\È\á#7_İ„Ÿ\ëı+:\ê»ø\Ö+–c\r»\ä\'­+E¨IgöV{`…6³ŒPö!!š\ãûÑ†ü…g\è\naó!\ê\Z4—\èH\çùSŒ:ƒYı”½¶Â›7a³Œb-nm\î<\ËV‡5B$·Ò•À¯¼d^\\:‡3;¦vÊ­[™¢ò¬¯\Ìs‰T…`:€:\Z}½’¦m¦`Û·n#§<S5”\"=´F\ä6=ñEÀ4\ët´k\ècûªù\Ó*\rU»m½gõa,®\í\äi¡¸WšOõ¢Eù[\Ó\éŠl\ÖWÉ¶òH•\0;cˆgO¥0/N\Â\Ş\ëû±ñ¤›[\\\ÎŞw\ä*”¶ú„Ö†Ù¤¶Wi`8¥{}B[Cl\ÒZ\ì+°°\r»&’<ı&\Ğÿ\0p\çòÈ«00¹\Ù?÷K¯\ë\éT\í\í¯l£1[=±‹q+¼6@=¸¤µ¶\Ô,\áò\ã’\ÕÁ%²Á³\Í\0AdJ\ëFQ\Ò\âIPe\Æ*W½‚\rb\å\î-OOJr\é÷\Çl\ÑIš&vmÀ\í;©¦\Êü›“\æZ\æ\ã¸n01\Å\0Nu›>\í \Ç\'÷M\Ç\éWQ\ÖDWC•a}Eg=¾£#H\Å\í‘6\àsş5z\Ş#´Q’Š>¸–Š( –’–€8\Ü\ï\ÑóxR\Z\\\Õ\ZX>oQF[¾( š.,ÚŸİ·Ö¦\ÍVµ8VúÔ¤Ô±n¥\ÍEšp4~iÀ\â¢œ\r\0AqŸ0óQŠ–\á~­CÒ˜‰TÕ˜\å**šš•Zš\İU…”0ô¬\Ä+MX(\àÔ´2\àjp5O\Î\"¥Šr\ÄqJ\áb\Ø½.y¨\Ë|Ô´®;\İH[\Ò\Õ= %S\Ã\ÕP\ÜÔ„ô¦‘ ¥\ëUC`\æ¦G§q4IE( ô¤¦HR\ÒQ@¢’ŠbŠJZ\0Z3IE–’–€8\Ê)(¦X\ì\ÑIFh-±\åªl\Õ{só¥JM\"Gfš4\àhğiÀ\Ó¥€*\ï#¨ªØ«©\Ï^X\ÌoÆ€·Ò—”)ô§­0!!‡­K\Ä\r¯ù\Ô\Ş^EA\'\î²iŒ•š¬[dŒ\Õ(\ØIŒpkB%Ø¢³cE…>´\â\Õ™MiGz‘ŠÏ‚j#/OJ\ß\Ğ\Ôe\éh>©\Ğ\ç5@J\rK\Ç$SBd\å¿JrI\ïU™ñŠT~i¢®)ûjš¿½!œ«òx¦„\Ñw4Sƒ\rIL¥¤¢€–’Š\0Z)( QIE1efŠf¢\ÒQE\0>ó~-AÃŠš‘,\\Ó…34¢S¨\Å<\Z\0š3S2	i¨#<Õ•4€¦CÀÿ\00\È\ìjuTpzœ€À‚*œ±4•\Î\ÓúSWmƒŠ«3o\â¤fnı*&S»\"\Ê%¶Œµt6Ró6€(˜\Ô1–^J®\ìM‹t©p‘Œ·\'Ò¤\ã\ê)\á\nl— ô\ÅEùr\r0¸öR†Ÿ`1¤g\Í>\Ìn=)¡1‹u5+t\à\Õm\ÛI¨ş\ÑûÁ\Ï†^I9¦I&NsH®®2*	\Ü)\Í4&i\ÚMÀ¯v¬[W\Î5¯\î@hD²JZJ)ˆZZJ(h¤¥ –’–€8¬\Ò\ÓsKL\ĞZ)( !ù\ÅJX\n®iKiÉƒóO _Z˜P!\âœ)‚œ)™5eMUCVT\Ğ«JÀ2i Ó¤s¶\ÂT”ª\Ù\æ¯Mn²®q\È\ïTXl\Ê\Ò(o\Ş=h*GCN^MN¨1Ú€ Y¶uV\âå¾\\WdA\éT\æq\È\ã dG-\æœ	I1œ\â‘p§£µ*)w\æ´d\"\Ú6qW\íSpoqT@À«e`>¦¡Ì¹\×ª\ÉÁ­›˜\ng#­e:\ír9¦‰d–\Îcr„’(¸}\Ç%ºu\'©§Eh\×38Q\Ô\Ñ\Ô:f\à\n×´“’µ‘,_e¹(9QÒ®\Ú\ÉûÅ©{©šZh¥¦!\ÔRR\Ğ\ÑIš(ii)s@P¢’Še‹EP1( \Ñ\ÜS!^¢¥CSw4x§\nh§\n@Jµe:UU«)@\ÉA§\n`4\ài(\èk>\åv¹­ª×‹‚(ª\ä‘\ÍMœT!)jV!;ª»¦i\à\Ğ\Ô®b\Ô\ÉJx\0S\ã\0¸\Í$şkn\ÅjÛ ŒE°R½ª@¼ò*ˆ\àWŠÅ¾µK¼\Z\è*¦¡x	\î9 h\ÅQµ\r\\°joõ5Q†v¨­8dj=ªF\ÊZ°\ãluTv-—A\ïVµ8L–\á”d¡\éUt\ÈÙ§Fiˆ\Ú¹¦\Ò\Ğ!sKIK@E&ihii( &–’Še‹KM¥¤\0M(¤4 ò)’\Ç’¾\â¤*,|\Ëô©VN\ÑN\"Õ”ª«V# dÂ)‹SÆ¹¤±\'5Vñ¹«Œ\ÛP\Ö}\ÃdÒ¸\ìSbGjaj‘‰<TeMP†\' \Âq@”\'4XW&BjK\\4œ€j´\ÒnPA¥µ“Š\Í\Ä*‹qQÉª\"u5J\êV1§VY|Nj„t¬)\ê‡5f;”ºŒ\ã\é\\¸”cŠ\Ğ\Òd>có\Æ:R°\\Kv5uxriÀúÔŒ\ZDUV%@\çÒ“4\ì\Ò\ì\Ò\æ›E0šPi¢–€Kšn­-\0:–š)\Ô\ÄP))i”´”P0&œ\Ôu*\0±\í\Ó\Ü\ĞK¼¹>•r½=È½\ÍB\r1\"a;}i\â\ã\Õj\nZ@[[„÷…Yh\Ïñ\n\Ì4i¿Šk\Æ\Êz05eŒ\Öm½³†&´GÊ˜\'&\Äw\ë“U%9©Y\ê&5#+H0sÒ¢\İ\Ï5;{T;>cT!Jƒ\Ğ\Ôn‡ş”¹¦\"®\â¤·û\Ôò¸#ŠDŒ\Æ\Ür;UGÀ\äşBP7\Z±!-\ëQ\'¢\Ğ@dÖ¶‚(Ï©ªqZ±\äñZPC°u¤\Øc\ázÓ³M¥¨\ì\Òæ™šPhL\Ò\æ£\Í.h 4\àj0iÀ\Óù¥\Í74¹ R\ÓihŠ\Í¥¹è¦œ!sü4\Æ0\ÑRıû•!€\â\0FMY·P\É\ï*#\ïf’& \àP’\â7\Îx {\Ô\0T\Ù<÷\ÍH‘–8\Å1JúV”V Œ°\ÅX[hĞ–§˜®S*(™˜\r¦µ-\íB`¸ü*\Â\í_º\0¥.*\\®4…\È\íÒ‡Áæ˜¤“I9aŒ\Z2\0\rEÇ©4¬u¨‰)ô¦!\ÌF­D¤³ex\ì<“ŠQ…nÀSÍƒHV¤A…\ëJE1… €8\çµ3@\n\r8(¥;n0iÂ€‚§Z‰idm±@_QKŸz\ÇiO4	¤^Œjl3b—5”·²ù©WP~\ë@\ZB”\Z¢º‚ÿ\0Ô«{\ïŠ[£ëŠ…gº0©\×\ÔP”¢šÒ—4\0ñKM¥¦#3šošj:\\\Ğ\Z¡ó\r&óI°úRùm\é@®!jU]Æœ\"5b\Ş¸M\0>\Ú\ÒI9\äZÑ\İc¡5* D\0qJ@*-!1McŠöj7“*JÌ¢Pi¬sM\Ïi¤\â˜É¢\æ(\ÇN\íD\Òf¨’6\Âö\ÍV“s6`T\ÆC\ÜqM\ÜOl\nd•X\àuõ§,™8\ÅXo\à\nc[\åi€DÄƒ“Š`\à\ÅV\äâ¦ˆL	¶Œu¤\\” Š\Ô]´„S…!lP—Še\Ãb\")\ê\à\æ«\ÎÔ€¨z\Òf‚i3Lb\ÑIKH\Í.i´´\0\àO­8JÃ£\Ze-\0N·R\â\ÍJº„ƒµS\Í-\0i.¥¢¤ş\Ò_J\Ê\Í-\0TÛŠ\\t§`R•D†1F9\Í.9\äR¨ \Å\ãÖµ\" ^\0\É\ëUm\"ù³\Ğ\nµõ2e$é¥¾”ŒFj=\Õ%Zc9\'\Æ*C’8¨™†:\ÓP\ÜR¨Ñ²9\ëN\êz\Ò$}E$Æš\Ô\Ù[\'#½14\å“\Ôf™\Í7>ô\ÄZYG`:sI‘Ö«”\Ï^\ÕD’1\È9ˆ1È¦\î¤V\ÃP±Ò”|§Š7\È\ÍHZ€*´²`u¢i6\rVf,y \Ç#g­,\Î‹Ö¢”\å\Í!\Í\Ú)ˆvh\Í&h\Í!¥\Í74P\éi´P©Ù¦f—4\0\êZnh\Í\0FzÑ/¸\Í\ë\ëVHc4\èÁ4Ó’\0ªHI\È /GòG\îiY©|¢¢/¦³e&›j2Ù£v)”J‰”õ)á¹¥rdûU!28Á)\êiNhŒ\ã\èiH\Í!Œ$šRp94\Ó\ÇÒœr’;P)1JŠx¦ U\ëM`µN‰‘šlÉ…&©Ê»­*\ÓùªALC\Ğ\àbœ\Ò\í\ïQ\î–\Å!w.y\ëJ«LQS/JLhQMh	\äSœ\ásL[ƒœ0´L½©˜«‚Tn\ãñ Æ­\×\î:Z­\ÇjŒ\ÂÃµ\02Š#µ\0´¹¤¢€KM¥ ¥¤\Í.h»rNh\ë\×ùQE\è:s\ëTHo\ã¿\ĞT‘j‹œñNS\Óo\ã@\ËT,\Ç=8 ¿aA\ç­C(hzzœô\Å\\œw­++usó\nC*ˆıN½€Wny¥se˜‰NHVT(fn8­P‚8S#\'=)\Ø#¨­h‘v”öE#†`»S Á\ïW\îl\ÒE;WkúŠ\È%’M\ÃM!6iŒS\Ö©±Ñ†ö©•\éˆb¢–<©>j) y\Ç!ô\ä4—N\ÇÚ¢\ßLDŒô‹\É\ÍE¾¤…²q@\np\éS\Ç=j\Üp/¥KE\\Í™JD& \Ôt\í[“Ú‰¡(8÷¬GFˆ²Aš“€h:Ÿ”ñH9Py\è?\Zv:\Üÿ\0xT\É*?z¦G÷G\Í\0v\\\Ò\å\Ë\Æ5n TMl;T	+«|¤\àz\Ô\Ëv?ˆR³\È\Úi„c­]Y\ÇR˜Õ½\é\\\n\"–¬µ°\í\ÅD`a\ïLQš0GZ(\0\Î[;~”€`ƒ\ßŞ§¾Gµ.}OÒ¨‘\ìOé§§©\Üƒ\×\éIŒ@ü)€¨üóR–\0d~]½şP*l2\Ì/º@¾¦ºeU@\0\í\\´PsŞºiø=iXw/\Z©5š¹/\nÿ\0Î§ó÷\Å$o•ç¨ Fqœ\Çû¶aÁ¦}®a)Q\Ó5kP·&ñòº­b‰Ì™ü\Ô\rq\Êd_˜j\Ì\Õ`¯c\ÍB²H?‹:[­ğ2±\Îi eû\İj™\ëV¾\Î(±@¶\É\Çj²p(M¡#¡ª— \Åc\ĞV£b³õ÷ZÉü4€Í¸“\ëM\Íb¨‘:ÓƒA£¿˜ fÍ±\İ5r:Ëµ¸\\=j\ìrn8Ë Ÿ¥C=¬\ãx\äwƒ&\Øòy¡J‘“H\Ë\Ë1nÊ€\ÕN§<[7(’[²x\È\Íb\à÷?…1\'?L\Òõ\Ïe¤l÷©2H(@\É8\È61…Á„\ç\î\äS˜\ã€F(\0Á4õ™Ñ°4\Ì\ãƒÔ˜# \ãŸz,µ»†*Âº8\àŠ\ÎÚªœòH\ã„\ç6\Í\Z·aMû2\ÕD¹t$‘\ëS-ğ\Ç*sJÃ¹\\\É\' \ïJw\0\Ş;L\Îzÿ\0:^¸ÛSVH¡KÈ¡¹\É#\éÚ[$ò½–\ÆF?J\0k}sô¦”#ƒRŒt>\Ôc\róZ`BPö«vT`œqŒ\ÓztÎ¢•\0RG§z@Xü¡É—>‚§:¹R8­-LøFÁÀÏ—8úT\Z–\ë »ıi\å7\Õü\Äe\ë7x†\ä\×^¢=B\Ş\å%…>I\Z>\ê¬@\Â*N|–ş´\æÄ¸ş#N‹cÌ¢I¦y5\Ö<\Â\ÛL‚MŠ\Ù0}ğ*\ÛX“T°•QU‹²¶^(©©\ØF€…Àã¡¤mZ\Çş~\äÂ¬\Ëj±\áF\Z6F\ãñÖª\Û\ßõ©¬ü D’İŸ(\íøP.§d\Ä´ı\r%\å\å¼A¢’Ui\Ú\İ\Ãk(\á\Ér\ä\ãh\Ïÿ\0Z—F\Ã\\Ş“ƒ\Ê\è4\æ7.z\Ò\îQüY®Ám\ÔjòMƒ\nòÂ£WûvÓş­\éˆ\ä÷)<R\îLrß…o\ë÷\Æ$’\Ğ[\åYAó=9ú{V¥¢$6vÑ7ô¢\àq”\ç<w\Æ1\Ô\Z\Ú\Ó\"\ë·\ê@\ÇQøœÿ\0Z¹ij ¾½!F\Ù\n¸üA\Ï\ëEÀç† \î¥@\'\Ó4£P8\Ø¡­-L:›m\Z´\ì±ı\ã“Tu«\Ë[Ä‹\Êÿ\0„o˜ G4‡s=\ï[‘ŸÊ¡IQI\'Ò·ü6¿º¹C\åRh÷¢y¥´1\ån;½~jb9\Ó\"»}\ïÒe\Éü+G]¼3\ÎÖ‰K†İ¼õ\ë;$ ~´\0}ßº\Ù\'Ò†\àu\ë\Ô\Ò8\Ç\ÍJK=(\0ÀÉ¥\äqH¸\'‘ŸÆ•²Nr:\ã€\0t)¡ˆ,98 ¨1\ÇJ62xö B¾\0Â‚Ö“\r\ëúÒªòX\ãÆšNO¥0\İ0 ?:R\ägo\'Ş„n\ä\äı(“š]\ä.ü…IŸlP@Ûº\r ¨Aœş\Ë.=(À0ß\0.zdœ\ĞóŒ€Nz\Ôrİ·¥?\æs\ÇaC#\ß\å##¹©ÿ\0È´¿\îGı*`Ow¹\Ç\çT\æÔ¦»\Ó~\Ë\ä\"¨\n7\ïô\ÇøSl¯\äÓ¦”\Ç—\Ì\ÇV\Æ1H\r\Í;\î^ÿ\0\×Ä•Z/ùıqo\ëU$\×\î6H\àŠ2ÀÛ³Šu9WKû¸(S~ú\0×¼ÿ\04X¿˜©o\Ïúu‡ıu?ú	¬Èµ\Ù\Ö$ŒZ#P3¿Ò«Í¬O=\ä“’D`÷>¦€:D™dX¿Š<\ÌVø«ÿ\0lÿ\0\è\ë¥ü—\"ù\Ğ!MşóU\ÒöAª›\ï-s’vnö\ÇZ\0¿®M\ä\êh@\Î`\Æ?\Z“Ã„±»\'®Wù\ZË¿½{û¥•FU6\à6sŞ¤\Óõ\Ó|İ‘¬¾a–\Æ(x\\gK^\íµP)³ÿ\0\Èv\Óş¹½aÿ\0iL–Q[˜—j8|\î\ë†\Î*f\Ö%’ò+¯!J\í\ß\×4g]¼•¦û\Ær\Ës¿ıjÖ–k‹gF\"\'p=ò1X\âd]¦\ÑrHş?CQ\\kOo7\ÙÂˆ‰8\İ÷³@\ZğÇ³\Äûğ«~¸ş•n	–xKVSõ\Ïÿ\0oKöŸ<[&vl\Æÿ\0|\Ôvš\ÌÖ¢P WH\În™\í@4±ue§›µ•\Ü\åš\"x8\à\Ô\Úü1=œwj¸|„©\ìk:\ÇVš\Æ	&ˆó´œc=ioµ)µEx–8”\çh9\Éú\Ğ†¿\Õ\\ÿ\0¾?•A ÿ\0\È^ó\è\ßúV\Óõ)l¡ `ylb¢²¿’\Æ\îY– \í.r»±s@­Ÿ\í{¢GA\ì*º¸_\á ‘\ÆsW—V–9n˜À¹¸\ÆFÿ\0»\Æ*+\Ë\Ù/c·W„F±»ºñ\éL\n n=@4rx\0}jHvùŸ0ùI\çµ\\+h\0\Ã½×Ÿó\Å\0P—¡§#LaKu\ÏZ½¶È‘ó6	\ï)qe“÷±:\Ğzw\'#süY«Š°ó’§“\ÜúqN˜Zˆ”\Ä\É\ès@\Ã+e½iDNyõ¦[4\ã†9\İÖ˜2”\è{S%¶ŒE€v\0´\Õ²sÈ¢Š`9T¹9=9¤H÷g½P7\ÊÌ£µ:5ó,O4Q@\Øv\Æ1\ë\Í!\Ú:s\×4QHh\Õ0H\Í P1\çÚŠ(\İû†\0À4…”.6òG\\\ÑE1‚’q\íN\Î\æŠ(§ \0\nTmªH#ÚŠ(Ÿ4˜\É\Îx\æ”\å\å\âŠ(›™A*yõ§\'-“\Î=h¢€\ZÄ·Ò¤Dı\É\É4QHGe\É&\ä°<\ÑE0\×`^O\"šg“E\0Ÿy±Nl)Áô\ÍPd&23\Í=G\Ú&\nxÒŠ)l„À#ŸZ@\Ø3õ¢Š`\'¿¯4\ç\ê1À=¨¢€\00=iBo\É>´Q@ÿ\Ù');
/*!40000 ALTER TABLE `tblservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblservicecategory`
--

DROP TABLE IF EXISTS `tblservicecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblservicecategory` (
  `intServiceCateCode` int(11) NOT NULL AUTO_INCREMENT,
  `strServiceCategory` varchar(20) NOT NULL,
  PRIMARY KEY (`intServiceCateCode`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblservicecategory`
--

LOCK TABLES `tblservicecategory` WRITE;
/*!40000 ALTER TABLE `tblservicecategory` DISABLE KEYS */;
INSERT INTO `tblservicecategory` VALUES (11,'Massage'),(12,'Hair Cut'),(13,'Hair Wax');
/*!40000 ALTER TABLE `tblservicecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblservicepackage`
--

DROP TABLE IF EXISTS `tblservicepackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblservicepackage` (
  `intServicePackageDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `intPackageID` int(11) NOT NULL,
  `intPackageServiceID` int(11) NOT NULL,
  `intPackageServiceStatus` int(11) NOT NULL,
  PRIMARY KEY (`intServicePackageDetailID`),
  KEY `fk_intPackageServiceID_idx` (`intPackageServiceID`),
  KEY `fk_intPackageID_idx` (`intPackageID`),
  CONSTRAINT `fk_intDetailsPackageID` FOREIGN KEY (`intPackageID`) REFERENCES `tblpackage` (`intPackageID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intPackageServiceID` FOREIGN KEY (`intPackageServiceID`) REFERENCES `tblservice` (`intServiceID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblservicepackage`
--

LOCK TABLES `tblservicepackage` WRITE;
/*!40000 ALTER TABLE `tblservicepackage` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblservicepackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblserviceprice`
--

DROP TABLE IF EXISTS `tblserviceprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblserviceprice` (
  `intServicePriceID` int(11) NOT NULL AUTO_INCREMENT,
  `intServiceID` int(11) NOT NULL,
  `dblServicePrice` double NOT NULL,
  `dtmServicePriceAsOf` datetime NOT NULL,
  PRIMARY KEY (`intServicePriceID`),
  KEY `fk_intServiceID_idx` (`intServiceID`),
  CONSTRAINT `fk_intPriceServiceID` FOREIGN KEY (`intServiceID`) REFERENCES `tblservice` (`intServiceID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblserviceprice`
--

LOCK TABLES `tblserviceprice` WRITE;
/*!40000 ALTER TABLE `tblserviceprice` DISABLE KEYS */;
INSERT INTO `tblserviceprice` VALUES (5,31,50,'2016-02-27 08:26:10'),(6,32,35,'2016-02-27 10:34:07'),(7,33,50,'2016-03-03 17:38:21'),(8,34,50,'2016-03-03 17:43:27'),(9,35,50,'2016-03-03 17:45:16'),(10,36,50,'2016-03-03 17:45:34'),(11,37,50,'2016-03-03 17:46:01'),(12,38,20,'2016-03-03 18:02:41'),(13,39,50,'2016-03-03 18:06:16'),(14,40,20,'2016-03-03 18:12:38'),(15,41,25,'2016-03-04 00:18:49');
/*!40000 ALTER TABLE `tblserviceprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblservicepromo`
--

DROP TABLE IF EXISTS `tblservicepromo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblservicepromo` (
  `inServicePromoID` int(11) NOT NULL AUTO_INCREMENT,
  `intPromoID` int(11) NOT NULL,
  `intServiceID` int(11) NOT NULL,
  `intPromoStatus` int(11) NOT NULL,
  PRIMARY KEY (`inServicePromoID`),
  KEY `fk_intPromoID_idx` (`intPromoID`),
  KEY `fk_intServiceID_idx` (`intServiceID`),
  CONSTRAINT `fk_intDetailPromoID` FOREIGN KEY (`intPromoID`) REFERENCES `tblpromo` (`intPromoID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intPromoServiceID` FOREIGN KEY (`intServiceID`) REFERENCES `tblservice` (`intServiceID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblservicepromo`
--

LOCK TABLES `tblservicepromo` WRITE;
/*!40000 ALTER TABLE `tblservicepromo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblservicepromo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblservicereservation`
--

DROP TABLE IF EXISTS `tblservicereservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblservicereservation` (
  `intServiceReservationID` int(11) NOT NULL AUTO_INCREMENT,
  `intReservationID` int(11) NOT NULL,
  `intServiceID` int(11) NOT NULL,
  `intQuantity` int(11) NOT NULL,
  `intReservationStatus` int(11) NOT NULL,
  PRIMARY KEY (`intServiceReservationID`),
  KEY `fk_intReservationID_idx` (`intReservationID`),
  KEY `fk_intServiceID_idx` (`intServiceID`),
  CONSTRAINT `fk_intRReservationID` FOREIGN KEY (`intReservationID`) REFERENCES `tblreservation` (`intReservationID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intReservationServiceID` FOREIGN KEY (`intServiceID`) REFERENCES `tblservice` (`intServiceID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblservicereservation`
--

LOCK TABLES `tblservicereservation` WRITE;
/*!40000 ALTER TABLE `tblservicereservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblservicereservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblservicewalkin`
--

DROP TABLE IF EXISTS `tblservicewalkin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblservicewalkin` (
  `intServiceWalkInID` int(11) NOT NULL AUTO_INCREMENT,
  `intWalkInID` int(11) NOT NULL,
  `intServiceID` int(11) NOT NULL,
  `intEmployeeID` int(11) NOT NULL,
  `intServiceStatus` int(11) NOT NULL,
  `tblServiceWalkIncol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`intServiceWalkInID`),
  KEY `fk_intWalkInID_idx` (`intWalkInID`),
  KEY `fk_intServiceID_idx` (`intServiceID`),
  KEY `fk_intEmployeeID_idx` (`intEmployeeID`),
  CONSTRAINT `fk_intServiceWalkInEmployeeID` FOREIGN KEY (`intEmployeeID`) REFERENCES `tblemployee` (`intEmpID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intServiceWalkInID` FOREIGN KEY (`intWalkInID`) REFERENCES `tblwalkin` (`intWalkInID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intServiceWalkInServiceID` FOREIGN KEY (`intServiceID`) REFERENCES `tblservice` (`intServiceID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblservicewalkin`
--

LOCK TABLES `tblservicewalkin` WRITE;
/*!40000 ALTER TABLE `tblservicewalkin` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblservicewalkin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblvip`
--

DROP TABLE IF EXISTS `tblvip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblvip` (
  `intVIPID` int(11) NOT NULL AUTO_INCREMENT,
  `strVIPFirstName` varchar(45) NOT NULL,
  `strVIPLastName` varchar(45) NOT NULL,
  `strVIPMiddleName` varchar(45) NOT NULL,
  `strVIPAddress` varchar(45) NOT NULL,
  `strVIPContactNumber` varchar(11) NOT NULL,
  `datVIPDateCreated` date NOT NULL,
  `strVIPUserName` varchar(20) NOT NULL,
  `strVIPPassword` varchar(20) NOT NULL,
  `intVIPAccountStatus` int(11) NOT NULL,
  PRIMARY KEY (`intVIPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblvip`
--

LOCK TABLES `tblvip` WRITE;
/*!40000 ALTER TABLE `tblvip` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblvip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblvipreservation`
--

DROP TABLE IF EXISTS `tblvipreservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblvipreservation` (
  `intVIPReservationID` int(11) NOT NULL AUTO_INCREMENT,
  `intReservationID` int(11) NOT NULL,
  `intVIPID` int(11) NOT NULL,
  PRIMARY KEY (`intVIPReservationID`),
  KEY `fk_intReservationID_idx` (`intReservationID`),
  KEY `fk_intVIPID_idx` (`intVIPID`),
  CONSTRAINT `fk_intVIPID` FOREIGN KEY (`intVIPID`) REFERENCES `tblvip` (`intVIPID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intVIPReservationID` FOREIGN KEY (`intReservationID`) REFERENCES `tblreservation` (`intReservationID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblvipreservation`
--

LOCK TABLES `tblvipreservation` WRITE;
/*!40000 ALTER TABLE `tblvipreservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblvipreservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwalkin`
--

DROP TABLE IF EXISTS `tblwalkin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwalkin` (
  `intWalkInID` int(11) NOT NULL AUTO_INCREMENT,
  `intInvoiceID` int(11) NOT NULL,
  `dtmDateTime` datetime NOT NULL,
  PRIMARY KEY (`intWalkInID`),
  KEY `fk_intInvoiceID_idx` (`intInvoiceID`),
  CONSTRAINT `fk_intWalkInInvoiceID` FOREIGN KEY (`intInvoiceID`) REFERENCES `tblinvoice` (`intInvoiceID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwalkin`
--

LOCK TABLES `tblwalkin` WRITE;
/*!40000 ALTER TABLE `tblwalkin` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwalkin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dbsalonmanagement'
--
/*!50003 DROP PROCEDURE IF EXISTS `createDiscount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createDiscount`(IN strName VARCHAR(20),
								   IN strDesc VARCHAR(60),
                                   IN intType INT,
								   IN dblPrice DOUBLE)
BEGIN
	INSERT INTO
		tblDiscount(strDiscountName, strDiscountDesc, intDiscountType, dblDiscountAmount)
	VALUES
		(strName, strDesc, intType, dblPrice);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createEmp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createEmp`(IN strDesc VARCHAR(20),
							  IN strLname VARCHAR(45),
							  IN strFname VARCHAR(45), 
							  IN strMname VARCHAR(45),
                              IN datBday DATE,
                              IN strGender VARCHAR(1),
                              IN strAddress VARCHAR(70), 
                              IN strContact VARCHAR(45),
                              IN strStatus VARCHAR(45),
                              IN strUname VARCHAR(20), 
                              IN strPass VARCHAR(45),
                              IN blobPhoto LONGBLOB)
BEGIN
	
	DECLARE intJobIDRetrieved INT;
    SELECT intJobID INTO intJobIDRetrieved FROM tblJob WHERE strJobDesc = strDesc;
    
    IF(strUname <> "NO ACCESS")
    THEN
		INSERT INTO tblAccount(intEmpID, strEmpUsername, strEmpPassword, intAccountStatus)
        VALUES(intID, strUname, strPassword, 1);
    END IF;
    
	IF(intJobIDRetrieved IS NULL)
	THEN
		
			INSERT INTO
				tblJob(strJobDesc)
			VALUE
				(strDesc);
		
			SELECT intJobID INTO intJobIDRetrieved FROM tblJob WHERE strJobDesc = strDesc;
        
			INSERT INTO 
				tblEmployee(intEmpJobID, strEmpLastName, strEmpFirstName, strEmpMiddleName, datEmpBirthdate, strEmpGender, strEmpAddress, strEmpContactNo, strEmpStatus, blobEmpPhoto) 
			VALUES 
				(intJobIDRetrieved, strLname, strFname, strMname, datBday, strGender, strAddress, strContact, strStatus, blobPhoto);
        
			COMMIT;
	ELSEIF(intJobIDRetrieved IS NOT NULL)
		THEN
			INSERT INTO 
				tblEmployee(intEmpJobID, strEmpLastName, strEmpFirstName, strEmpMiddleName, datEmpBirthdate, strEmpGender, strEmpAddress, strEmpContactNo, strEmpStatus, blobEmpPhoto) 
			VALUES 
				(intJobIDRetrieved, strLname, strFname, strMname, datBday, strGender, strAddress, strContact, strStatus, blobPhoto);
        
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createExtraCharge` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createExtraCharge`(IN strName VARCHAR(45),
								     IN strDesc VARCHAR(100))
BEGIN
	
    INSERT INTO 
		tblExtraCharges(strExtraChargeName, strExtraChargeDesc, intStatus)
	VALUES
		(strName, strDesc, 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createJobQualification` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createJobQualification`(IN strID INT,
										   IN strDesc VARCHAR(20))
BEGIN
	
    DECLARE intJobIDRetrieved INT;
    SELECT intJobID INTO intJobIDRetrieved FROM tblJob WHERE strJobDesc = strDesc;
    
	IF(intJobIDRetrieved IS NULL)
	THEN
		
			INSERT INTO
				tblJob(strJobDesc)
			VALUE
				(strDesc);
		
			SELECT intJobID INTO intJobIDRetrieved FROM tblJob WHERE strJobDesc = strDesc;
        
			INSERT INTO
				tblJobQualification(intJobEmpID, intJobID, intJobStatus)
			VALUES
				(strID, intJobIDRetrieved, 1);
	ELSEIF(intJobIDRetrieved IS NOT NULL)
		THEN
			INSERT INTO
				tblJobQualification(intJobEmpID, intJobID, intJobStatus)
			VALUES
				(strID, intJobIDRetrieved, 1);
			select "blah blah";
        
	END IF;
	
        
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createPackage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createPackage`(IN strName VARCHAR(45),
								  IN strDesc VARCHAR(50),
								  IN intType INT,
								  IN intMax INT,
                                  IN strAvailability VARCHAR(20),
                                  IN dblPrice DOUBLE)
BEGIN

	DECLARE intPackID INT;

	INSERT INTO
		tblPackage(strPackageName, strPackageDescription, intPackageType, intMaxHeadCount, strPackageAvailability)
	VALUES
		(strName, strDesc, intType, intMax, strAvailability);
        
	SELECT
		intPackageID
	INTO
		intPackID
	FROM
		tblPackage
	WHERE
		strPackageName = strName
	AND
		strPackageDescription = strDesc
	AND	
		intPackageType = intType
	AND 
		intMaxHeadCount = intMax
	AND
		strPackageAvailability = strAvailability;
        
	INSERT INTO 
		tblPackagePrice(intPackageID, dblPackagePrice, dtmPackagePriceAsOf)
	VALUES
		(intPackID, dblPrice, NOW());
        
	SELECT intPackID;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createProduct`(IN strCate VARCHAR(20),
								  IN strName VARCHAR(20),
								  IN blobPhoto LONGBLOB,
								  IN strDesc VARCHAR(60))
BEGIN
	
    DECLARE intCateCode INT;
    
    SELECT
		intProdCateCode
	INTO 
		intCateCode
	FROM 
		tblProductCategory
	WHERE
		strProdCategory = strCate;
        
	IF(intCateCode IS NULL)
    THEN
		
        INSERT INTO	
			tblProductCategory(strProdCategory)
		VALUE
			(strCate);
            
		SELECT
			intProdCateCode
		INTO 
			intCateCode
		FROM 
			tblProductCategory
		WHERE
			strProdCategory = strCate;
        
        INSERT INTO
			tblProduct(intProductCateCode, strProductName, intProductQuantity, blobProductPhoto, strProductDesc)
		VALUES
			(intCateCode, strName, 0, blobPhoto, strDesc);
            
		SELECT
			intProductID
		FROM
			tblProduct
		WHERE
			strProductName = strName
		AND
			intProductCateCode = intCateCode
		AND
			strProductDesc = strDesc;
        
    ELSEIF(intCateCode IS NOT NULL)
    THEN
		INSERT INTO
			tblProduct(intProductCateCode, strProductName, intProductQuantity, blobProductPhoto, strProductDesc)
		VALUES
			(intCateCode, strName, 0, blobPhoto, strDesc);
            
		SELECT
			intProductID
		FROM
			tblProduct
		WHERE
			strProductName = strName
		AND
			intProductCateCode = intCateCode
		AND
			strProductDesc = strDesc;
    END IF;
    
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createProductPackage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createProductPackage`(IN intID INT,
										 IN intPID INT,
										 IN intQuantity INT)
BEGIN
	INSERT INTO
		tblProductPackage(intPackageID, intProductID, intQuantity, intProductPackageStatus)
	VALUES
		(intID, intPID, intQuantity, 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createProductPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createProductPrice`(IN intID INT,
									   IN dblPrice DOUBLE)
BEGIN
	INSERT INTO
		tblProductPrice(intProductID, dblProductPrice, dtmProdPriceAsOf)
	VALUES
		(intID, dblPrice, NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createProductPromo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createProductPromo`(IN intID INT,
									   IN intProdID INT,
                                       IN intQuantity INT)
BEGIN

	INSERT INTO
		tblProductPromo(intPromoID, intProductID, intProductQuantity, intPromoStatus)
	VALUES
		(intID, intProdID, intQuantity, 1);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createPromo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createPromo`(IN strDesc VARCHAR(70),
								IN strName VARCHAR(45),
                                IN intMaxHead INT,
								IN dblPrice DOUBLE,
                                IN strAvail VARCHAR(20))
BEGIN
	DECLARE intID INT;

	INSERT INTO
		tblPromo(strPromoName, strPromoDescription, intMaxHeadCount, dblPromoPrice, strPromoAvailability)
	VALUES
		(strName, strDesc, intMaxHead, dblPrice, strAvail);
        
	SET intID = LAST_INSERT_ID();
        
	INSERT INTO 
		tblPromoPrice(intPromoID, dblPromoPrice, dtmPromoPriceAsOf)
	VALUES
		(intID, dblPrice, NOW());
        
	SELECT intID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createService` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createService`(IN strName VARCHAR(20),
								  IN strCate VARCHAR(20),
                                  IN intStatus INT,
                                  IN strDesc VARCHAR(60),
                                  IN blobPhoto LONGBLOB)
BEGIN
	DECLARE intServCate INT;
    SELECT 
		intServiceCateCode
	INTO 
		intServCate
	FROM
		tblServiceCategory
	WHERE 
		strServiceCategory = strCate;
        
	if(intServCate IS NULL)
    THEN
		INSERT INTO
			tblServiceCategory(strServiceCategory)
		VALUES
			(strCate);
            
		SELECT 
			intServiceCateCode
		INTO 
			intServCate
		FROM
			tblServiceCategory
		WHERE 
			strServiceCategory = strCate;    
            
		INSERT INTO
			tblService(strServiceName, intServiceCateCode, intServiceStatus, strServiceDesc, blobServicePhoto)
        VALUES
			(strName, intServCate, intStatus, strDesc, blobPhoto);
            
		SELECT
			intServiceID
		FROM 
			tblService
		WHERE
			strServiceName = strName
		AND 
			intServiceCateCode = intServCate
		AND 
			strServiceDesc = strDesc;
	
    ELSEIF(intServCate IS NOT NULL)
    THEN
    
		INSERT INTO
			tblService(strServiceName, intServiceCateCode, intServiceStatus, strServiceDesc, blobServicePhoto)
        VALUES
			(strName, intServCate, intStatus, strDesc, blobPhoto);
            
            
		SELECT
			intServiceID
		FROM 
			tblService
		WHERE
			strServiceName = strName
		AND 
			intServiceCateCode = intServCate
		AND 
			strServiceDesc = strDesc;
    END IF;
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createServicePackage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createServicePackage`(IN intID INT,
										 IN intServID INT)
BEGIN
	INSERT INTO
		tblServicePackage(intPackageID, intPackageServiceID, intPackageServiceStatus)
	VALUES
		(intID, intServID, 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createServicePrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createServicePrice`(IN intID INT,
									   IN dblPrice DOUBLE)
BEGIN
	
    INSERT INTO
		tblServicePrice (intServiceID, dblServicePrice, dtmServicePriceAsOf)
	VALUES
		(intID, dblPrice, NOW());
		
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createServicePromo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createServicePromo`(IN intID INT,
                                       IN intServID INT)
BEGIN
	INSERT INTO
		tblServicePromo(intPromoID, intServiceID, intPromoStatus)
	VALUES
		(intID, intServID, 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deactivateEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deactivateEmployee`(IN intID INT)
BEGIN
	UPDATE tblEmployee
    SET strEmpStatus = "I"
    WHERE intEmpID = intID;
    
    UPDATE tblAccount
    SET intAccountStatus = 0
    WHERE intEmpID = intID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fetchJob` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `fetchJob`(IN intID INT)
BEGIN
	
	SELECT 
		D.strJobDesc, Q.intJobStatus
	FROM
		tblJobQualification Q
	INNER JOIN
		tblJob D
	ON
		Q.intJobID = D.intJobID
	WHERE
		intJobEmpID = intID;
		
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fetchPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `fetchPrice`(IN intID INT)
BEGIN
	
	DECLARE intMaxID INT;

	SELECT
		MAX(intServicePriceID)
	INTO
		intMaxID
	FROM
		tblServicePrice
	WHERE
		intServiceID = intID;

	SELECT
		dblServicePrice
	FROM
		tblServicePrice
	WHERE
		intServicePriceID = intMaxID;
		
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fetchProductPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `fetchProductPrice`(IN intID INT)
BEGIN
	DECLARE intMaxID INT;

	SELECT
		MAX(intProductPriceID)
	INTO
		intMaxID
	FROM
		tblProductPrice
	WHERE
		intProductID = intID;

	SELECT
		dblProductPrice
	FROM
		tblProductPrice
	WHERE
		intProductPriceID = intMaxID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fetchProducts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `fetchProducts`()
BEGIN
	SELECT 
		P.intProductID, C.strProdCategory, P.strProductName, P.strProductDesc, P.intProductQuantity, P.blobProductPhoto
	FROM
		tblProduct P
	INNER JOIN
		tblProductCategory C
	ON
		P.intProductCateCode = C.intProdCateCode;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fetchServices` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `fetchServices`()
BEGIN

	SELECT 
		S.intServiceID, S.strServiceName, C.strServiceCategory, S.intServiceStatus, S.strServiceDesc, S.blobServicePhoto
    FROM
		tblService S
	INNER JOIN
		tblServiceCategory C
	ON
		S.intServiceCateCode = C.intServiceCateCode;
	
    commit;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllEmployee`()
BEGIN
	SELECT E.intEmpID, J.strJobDesc, E.strEmpLastName, E.strEmpFirstName, E.strEmpMiddleName, E.datEmpBirthdate, E.strEmpGender,
				E.strEmpAddress, E.strEmpContactNo, E.strEmpStatus, A.strEmpUsername, A.strEmpPassword, E.blobEmpPhoto
	FROM tblEmployee E
    INNER JOIN tblJob J
    ON E.intEmpJobId = J.intJobID
    LEFT JOIN tblAccount A
    ON E.intEmpID = A.intEmpID ORDER BY E.strEmpFirstName ASC ;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getEmpJob` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEmpJob`(IN intID INT)
BEGIN
	SELECT 
		strJobDesc D, intJobStatus Q
	FROM 
		tblJobQualification Q
	INNER JOIN
		tblJob D
	ON
		D.intJobID = Q.intJobID 
	WHERE
		Q.intJobEmpID = intID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `loginEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `loginEmployee`(IN strUname VARCHAR(20),
								  IN strPass VARCHAR(45))
BEGIN
	SELECT 
		*
	FROM 
		tblEmployee
	WHERE
		strEmpUsername = strUname
	AND
		strEmpPassword = strPass;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `trial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `trial`()
BEGIN

	DECLARE try longblob;


	SELECT blobEmpPhoto
    INTO try
    from tblemployee
    where intempid = 26;
    
    if(try = 1010101)
    then
		select "pareho";
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateDiscount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateDiscount`(IN intID INT,
								   IN strName VARCHAR(20),
                                   IN strDesc VARCHAR(60),
                                   IN intType INT,
                                   IN dblAmount DOUBLE)
BEGIN
	UPDATE
		tblDiscount
	SET
		strDiscountName = strName, strDiscountDesc = strDesc, intDiscountType = intType, dblDiscountAmount = dblAmount
	WHERE
		intDiscountID = intID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateEmp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEmp`(IN intID INT,
							  IN strLname VARCHAR(45),
							  IN strFname VARCHAR(45), 
							  IN strMname VARCHAR(45),
                              IN datBday DATE,
                              IN strGender VARCHAR(1),
                              IN strAddress VARCHAR(70), 
                              IN strContact VARCHAR(45),
                              IN strStatus VARCHAR(45),
                              IN strUname VARCHAR(20), 
                              IN strPass VARCHAR(45),
                              IN blobPhoto LONGBLOB)
BEGIN
	UPDATE
		tblEmployee
	SET
		strEmpLastName = strLname, strEmpFirstName = strFname, strEmpMiddleName = strMname, datEmpBirthdate = datBday,
        strEmpGender = strGender, strEmpAddress = strAddress, strEmpContact = strContact, strEmpUsername = strUname,
        strEmpPassword = strPass, blobEmpPhoto = blobPhoto
	WHERE
		intEmpID = intID;
        
	SELECT 
		intJobDescription D, intJobStatus Q
	FROM 
		tblJobQualification Q
	INNER JOIN
		tblJobDescription D
	ON
		D.intJobID = Q.intJobID 
	WHERE
		Q.intEmpID = intID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEmployee`(IN intID INT,
							  IN strDesc VARCHAR(20),
							  IN strLname VARCHAR(45),
							  IN strFname VARCHAR(45), 
							  IN strMname VARCHAR(45),
                              IN datBday DATE,
                              IN strGender VARCHAR(1),
                              IN strAddress VARCHAR(70), 
                              IN strContact VARCHAR(45),
                              IN strStatus VARCHAR(45),
                              IN strUname VARCHAR(20), 
                              IN strPass VARCHAR(45),
                              IN blobPhoto LONGBLOB)
BEGIN

	DECLARE oldJob VARCHAR(20);
	DECLARE intJobIDRetrieved INT;
    DECLARE intNewJob INT;
    DECLARE intAccount INT;
     
    SELECT 
		J.strJobDesc 
	INTO 
		oldJob 
	FROM 
		tblJob J 
	INNER JOIN 
		tblEmployee E 
	ON 
		J.intJobID = E.intEmpJobID 
	WHERE 
		E.intEmpID = intID;
	
    SELECT intAccountID INTO intAccount FROM tblAccount WHERE intEmpID = intID;
        
    SELECT intJobID INTO intJobIDRetrieved FROM tblJob WHERE strJobDesc = strDesc;

	IF(intAccount IS NULL)
    THEN
		IF(strUname <> "NO ACCESS")
        THEN
			INSERT INTO tblAccount(intEmpID, strEmpUsername, strEmpPassword, intAccountStatus)
			VALUES(intID, strUname, strPass, 1);
		END IF;
	ELSEIF(intAccount IS NOT NULL)
    THEN
		IF(strUname = "NO ACCESS")
        THEN
			UPDATE tblAccount SET intAccountStatus = 1 WHERE intAccountID = intAccount;
		ELSEIF(strUname <> "NO ACCESS")
        THEN
			UPDATE tblAccount SET strEmpUsername = strUname, strEmpPassword = strPass WHERE intAccountID = intAccount;
        END IF;
    END IF;


	IF(intJobIDRetrieved IS NULL)
	THEN
		
			INSERT INTO
				tblJob(strJobDesc)
			VALUE
				(strDesc);
		
			SELECT intJobID INTO intJobIDRetrieved FROM tblJob WHERE strJobDesc = strDesc;
        
			IF(blobPhoto = 101)
			THEN
				UPDATE
					tblEmployee
				SET
					strEmpLastName = strLname, strEmpFirstName = strFname, strEmpMiddleName = strMname, datEmpBirthdate = datBday,
					strEmpGender = strGender, strEmpAddress = strAddress, strEmpContactNo = strContact,intEmpJobID = intJobIDRetrieved
				WHERE
					intEmpID = intID;
			ELSEIF(blobPhoto <> 101)
			THEN
				UPDATE
					tblEmployee
				SET
					strEmpLastName = strLname, strEmpFirstName = strFname, strEmpMiddleName = strMname, datEmpBirthdate = datBday,
					strEmpGender = strGender, strEmpAddress = strAddress, strEmpContactNo = strContact, blobEmpPhoto = blobPhoto, intEmpJobID = intJobIDRetrieved
				WHERE
					intEmpID = intID;
			END IF;
        
			COMMIT;
	ELSEIF(intJobIDRetrieved IS NOT NULL)
	THEN
        IF(oldJob <> strDesc)
        THEN
        
			SELECT intJobID into intNewJob from tblJob where strJobDesc = strDesc;
			
			IF(blobPhoto = 101)
			THEN
				UPDATE
					tblEmployee
				SET
					strEmpLastName = strLname, strEmpFirstName = strFname, strEmpMiddleName = strMname, datEmpBirthdate = datBday,
					strEmpGender = strGender, strEmpAddress = strAddress, strEmpContactNo = strContact, intEmpJobID = intNewJob
				WHERE
					intEmpID = intID;
			ELSEIF(blobPhoto <> 101)
			THEN
				UPDATE
					tblEmployee
				SET
					strEmpLastName = strLname, strEmpFirstName = strFname, strEmpMiddleName = strMname, datEmpBirthdate = datBday,
					strEmpGender = strGender, strEmpAddress = strAddress, strEmpContactNo = strContact, blobEmpPhoto = blobPhoto, intEmpJobID = intNewJob
				WHERE
					intEmpID = intID;
			END IF;
            
			
		ELSEIF(oldJob = strDesc)
        THEN
			
			IF(blobPhoto = 101)
			THEN
				UPDATE
					tblEmployee
				SET
					strEmpLastName = strLname, strEmpFirstName = strFname, strEmpMiddleName = strMname, datEmpBirthdate = datBday,
					strEmpGender = strGender, strEmpAddress = strAddress, strEmpContactNo = strContact
				WHERE
					intEmpID = intID;
			ELSEIF(blobPhoto <> 101)
			THEN
				UPDATE
					tblEmployee
				SET
					strEmpLastName = strLname, strEmpFirstName = strFname, strEmpMiddleName = strMname, datEmpBirthdate = datBday,
					strEmpGender = strGender, strEmpAddress = strAddress, strEmpContactNo = strContact, blobEmpPhoto = blobPhoto
				WHERE
					intEmpID = intID;
			END IF;
			
        END IF;
        END IF;
		
        
	
    
        
	SELECT 
		strJobDesc D, intJobStatus Q
	FROM 
		tblJobQualification Q
	INNER JOIN
		tblJob D
	ON
		D.intJobID = Q.intJobID 
	WHERE
		Q.intJobEmpID = intID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateJobQualification` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateJobQualification`(IN intID INT, 
										   IN strDesc VARCHAR(45),
										   IN intStatus INT)
BEGIN

	DECLARE intRetrievedJobID int;
    SELECT 
		intJobID
	INTO
		intRetrievedJobID
	FROM
		tblJob
	WHERE
		strJobDesc = strDesc;
    

	UPDATE
		tblJobQualification
	SET
		intJobStatus = intStatus
	WHERE
		intJobEmpID = intID
	AND
		intJobID = intRetrievedJobID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updatePackage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePackage`(IN intID INT,
								  IN strName VARCHAR(45),
                                  IN strDesc VARCHAR(50),
                                  IN intType INT,
                                  IN intMaxHead INT,
                                  IN strAvail VARCHAR(20),
                                  IN dblPrice DOUBLE)
BEGIN

	DECLARE dblNewPrice DOUBLE;
	DECLARE intMax INT;
    
	SELECT
		MAX(intPackagePriceID)
	INTO
		intMax
	FROM
		tblPackagePrice
	WHERE
		intPackageID = intID;
        
	SELECT
		dblPackagePrice
	INTO
		dblNewPrice
	FROM
		tblPackagePrice
	WHERE
		intPackagePriceID = intMax;
        
	IF(dblNewPrice = dblPrice)
    THEN
		
        UPDATE
			tblPackage
		SET
			strPackageName = strName, strPackageDescription = strDesc, intPackageType = intType, intMaxHeadCount = intMaxHead, strPackageAvailability = strAvail
		WHERE
			intPackageID = intID;
    
    ELSEIF(dblNewPrice <> dblPrice)
    THEN
		UPDATE
			tblPackage
		SET
			strPackageName = strName, strPackageDescription = strDesc, intPackageType = intType, intMaxHeadCount = intMaxHead, strPackageAvailability = strAvail
		WHERE
			intPackageID = intID;
            
        INSERT INTO
			tblPackagePrice(intPackageID, dblPackagePrice, dtmPackagePriceAsOf)
		VALUES
			(intID, dblPrice, NOW());
        
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updatePrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePrice`(IN intID INT,
								IN dblPrice DOUBLE)
BEGIN
	INSERT INTO
		tblServicePrice(intServiceID, dblServicePrice, dtmServicePriceAsOf)
	VALUES
		(intID, dblPrice, NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateProduct`(IN intID INT,
								  IN strCate VARCHAR(20),
                                  IN strName VARCHAR(20),
                                  IN strDesc VARCHAR(60),
                                  IN blobPhoto LONGBLOB)
BEGIN

	 DECLARE intCateCode INT;
     DECLARE intMaxID INT;
    
    SELECT
		intProdCateCode
	INTO 
		intCateCode
	FROM 
		tblProductCategory
	WHERE
		strProdCategory = strCate;
        
	SELECT
		MAX(intProductPriceID)
	INTO
		intMaxID
	FROM
        tblProductPrice
	WHERE
		intProductID = intID;
        
	IF(intCateCode IS NULL)
    THEN
		
        INSERT INTO	
			tblProductCategory(strProdCategory)
		VALUE
			(strCate);
            
		SELECT
			intProdCateCode
		INTO 
			intCateCode
		FROM 
			tblProductCategory
		WHERE
			strProdCategory = strCate;
            
        UPDATE 
			tblProduct
		SET
			intProductCateCode = intCateCode, strProductName = strName, blobProductPhoto = blobPhoto, strProductDesc = strDesc
		WHERE
			intProductID = intID;
            
	ELSEIF(intCateCode IS NOT NULL)
    THEN
    
		UPDATE 
			tblProduct
		SET
			intProductCateCode = intCateCode, strProductName = strName, blobProductPhoto = blobPhoto, strProductDesc = strDesc
		WHERE
			intProductID = intID;
            
	END IF;	
    
    SELECT
		dblProductPrice
	FROM
		tblProductPrice
	WHERE
		intProductPriceID = intMaxID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateProductPackage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateProductPackage`(IN intID INT,
										 IN intProdID INT,
										 IN intQuan INT,
                                         IN intStatus INT)
BEGIN
	UPDATE
		tblProductPackage
	SET
		intProductID = intProdID, intQuantity = intQuan, intProductPackageStatus = intStatus
	WHERE
		intProductPackageID = intID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateService` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateService`(IN intID INT, 
								  IN strName VARCHAR(20),
                                  IN strCate VARCHAR(20),
								  IN intStatus INT,
								  IN strDesc VARCHAR(60),
                                  IN blobPhoto LONGBLOB)
BEGIN
	
	DECLARE intCateCode INT;
    DECLARE intMaxID INT;
    
    SELECT 
		intServiceCateCode
	INTO
		intCateCode
	FROM
		tblServiceCategory
	WHERE
		strServiceCategory = strCate;

	SELECT
		MAX(intServicePriceID)
	INTO
		intMaxID
	FROM
		tblServicePrice
	WHERE
		intServiceID = intID;

    
    IF(blobPhoto <> 101)
    THEN
		IF(intCateCode IS NULL)
		THEN
    
			INSERT INTO
				tblServiceCategory(strServiceCategory)
			VALUES
				(strCate);
            
			SELECT 
				intServiceCateCode
			INTO
				intCateCode
			FROM
				tblServiceCategory
			WHERE
				strServiceCategory = strCate;
		
			UPDATE
				tblService
			SET
				strServiceName = strName, intServiceStatus = intStatus, intServiceCateCode = intCateCode, intServiceStatus = intStatus, blobServicePhoto = blobPhoto
			WHERE
				intServiceID = intID; 
          
		ELSEIF(intCateCode IS NOT NULL)
		THEN
    
			UPDATE
				tblService
			SET
				strServiceName = strName, intServiceStatus = intStatus, intServiceCateCode = intCateCode, intServiceStatus = intStatus, blobServicePhoto = blobPhoto
			WHERE
				intServiceID = intID;
		END IF;
        
	ELSEIF(blobPhoto = 101)
    THEN
		IF(intCateCode IS NULL)
		THEN
    
			INSERT INTO
				tblServiceCategory(strServiceCategory)
			VALUES
				(strCate);
            
			SELECT 
				intServiceCateCode
			INTO
				intCateCode
			FROM
				tblServiceCategory
			WHERE
				strServiceCategory = strCate;
		
			UPDATE
				tblService
			SET
				strServiceName = strName, intServiceStatus = intStatus, intServiceCateCode = intCateCode, intServiceStatus = intStatus
			WHERE
				intServiceID = intID; 
          
		ELSEIF(intCateCode IS NOT NULL)
		THEN
    
			UPDATE
				tblService
			SET
				strServiceName = strName, intServiceStatus = intStatus, intServiceCateCode = intCateCode, intServiceStatus = intStatus
			WHERE
				intServiceID = intID;
		END IF;

	END IF;
    
    
    SELECT
		dblServicePrice
	FROM
		tblServicePrice
	WHERE
		intServicePriceID = intMaxID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateServicePackage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateServicePackage`(IN intID INT,
										 IN intServID INT,
										 IN intStatus INT)
BEGIN
	UPDATE
		tblServicePackage
	SET
		intPackageServiceID = intServID, intPackageServiceStatus = intStatus
	WHERE
		intServicePackageDetailID = intID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-04  3:11:06
