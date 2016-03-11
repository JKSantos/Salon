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
INSERT INTO `tblaccount` VALUES (2,38,'NOT ASSIGNED','NOT ASSIGNED',1),(3,33,'NOT ASSIGNED','NOT ASSIGNED',1),(4,34,'NOT ASSIGNED','NOT ASSIGNED',1),(5,37,'NOT ASSIGNED','NOT ASSIGNED',1),(6,45,'NOT ASSIGNED','NOT ASSIGNED',0);
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
  `strCatalogueName` varchar(45) NOT NULL,
  `blobStylePhoto` longblob NOT NULL,
  `intStatus` int(11) NOT NULL,
  PRIMARY KEY (`intCatalogueID`),
  KEY `fk_Cat_ServiceID_idx` (`intServiceID`),
  CONSTRAINT `fk_Cat_ServiceID` FOREIGN KEY (`intServiceID`) REFERENCES `tblservice` (`intServiceID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcatalogue`
--

LOCK TABLES `tblcatalogue` WRITE;
/*!40000 ALTER TABLE `tblcatalogue` DISABLE KEYS */;
INSERT INTO `tblcatalogue` VALUES (3,34,'Barber\'s Cut','�\��\�\0JFIF\0\0`\0`\0\0�\�\0C\0!!$-K0-**-ZBE6Kl`roi`ifx���x~��fi�̖������r�\�\�Ϻޫ����\�\0C!!!-\'-W00W�{i{���������������������������������������������������\��\0\0\0\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\0\0\0\0\0\0\0	\n\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\0,\"\0�\�\0\0\0?\0��(\�&ihh?4�x��cҐ��W�\0E�<\r�*ʭ�08�9�\�(��x\�&$�~\��\�8\�ϱGm+��kw�\��w���J��X\�ib�p��9�I>CH��\�9����V���U2\nɖ?( �ց�5T�K�\�M3FL�[0m\�9\�XM.\�R\�d�/(�;�]����\n\��j���j�wk$YDe8\�\�\�P&�o�u<�nx\�ǀz\0\�\��J��kW�<B\�Y\�q�\�c����D�\'�d�{��?uG���\rq\"��\�O�43��\�\�j�\��lRI�GnUAI3���ڢ����\�\��L���\�g��،zњ�6�l��\�>L��\0�\�pc�Ki�\�Iqt$����P<\�\�@�\�K�ʷ\�\�SNy�\"\��\�d�\��J\�M���q�Ȅ\�\�Wq\���\0iJ\rfC�\�6�r�1\"�E\�x\�9\�\�U᰷�\�\��\�\�r�݃\�Ҁ73HdP\�,��\�bܢY\\]��1�a\npI���\�\�U��4�CO�\�9\�G���\r\"\�c�\�B�a� �PsX�6\�]Iq\�Hn-\�m�)l�1�\�қsil��\�P\�\�$��djH��\�\0m\�\�Iҭ��Db2!�w\�~�q��A�[\�xɊ=�q\�#����+]>\�ೖ\��� |1\�H9jI��e\�m�Hȉ�ˮ\�\�1�����\\\����K�c�l����<e~��\�c7\ZzD�g?���\�2hf���.h\�%\0�����9҃M\��4�F\�I�F?-\0Z�[�n\���\�\ZY�銻~�j:T\�<af�p\�=W�>�B\�Ș�	*dr2�5b{����2b����[�$ѹ�\0��?�\��\0\�\rG\�\�s���S���S����50\��gp��S\�\���]br\�\��\�LP#d\�v\�≏\���ڌ�V����g��j�\\^�\�\\�\0tR�ppA�\�}��\�9�hU\�\�͠\�9\�4�+�V\��\0=eU��*���^�$c�Z8�Vm�\�\��F�8\�QL�\�nn\�Q\n��o��P��\��>\�M���:UYae���Fe\�\��N3��\'��4�\�\�ys3X�փƷ�9W�ЊL�/�[;\�Fx\�\�Ӟ�z*�|2�9\�@����uw[&x2*�*d0\�Y\'�k$rDy\�09�\"�j2l\�t\�z��\�V�u�p紡1�\�Y�Z\�\\H�\��B`�ps�^i\�)w\�o{e�H�CrGL\��\��6�\�W�f�\�\�#7_݄�\��+:\���\�+��c\r�\�\'��+E�Ig�V{`�6��P�!!�\��ц��g\�\na�!\�\Z4�\�H\��S�:�Y����7a��b�-nm\�<\�V�5B$�ҕ���d^\\:�3;�v�ʭ[���\�s�T�`:�:\Z}����m�`۷n#��<S5�\"=��F\�6=�E�4\�t�k\�c���\�*\rU�m���g�a,�\�\�i��W�O��E�[\�\�l\�Wɶ�H�\0;c�gO�0/N\�\�\����[\\\�ޏw\�*����ֆ٤�Wi`8�{}B[Cl\�Z\�+��\r�&�<�&\��\0p\��ȫ00�\�?�K�\�\�T\�\��l�1[=��q+�6@=����\�,\��\�\��%���\�\0AdJ\�FQ\�\�IP�e\�*W��\rb\�\�-OOJr\��\�l\�I�&vm�\�;��\����\�Z\�\��n01\�\0Nu�>\� \�\'�M\�\�WQ\�DWC�a�}Eg=��#H\�\��6\�s�5z\�#�Q��>���(�����8\�\�\��xR\Z\\\�\ZX>oQF[�(��.,ڟݷ֦\�V�8V�ԤԱn�\�E�p4~i�\��\r\0Aq�0�Q��\�~�CҘ�T՘\�**���Z��\�U��0��\�+�MX(\�Դ2\�jp5O\�\"��r\�qJ\�b\��.y�\�|Դ�;\�H[\�\�= %S\�\�P\�Ԅ��� �\�UC`\�G�q4IE( ���HR\�Q@���b�JZ\0Z3IE����8\�)(�X\�\�IFh-�\�l\�{s��JM\"Gf���4\�h�i�\���*\�#��ث�\�^X\�o�ƀ�җ�)���0!!��K\�\r��\�\�^EA\'\�i����[d�\�(\�I�pkB%آ�cE�>�\�\��MiGz��ςj#/OJ�\�\�\�e\�h>�\�\�5@J\rK\�$SBd\�JrI\�U��T~i��)��j���!���x��\�w4S�\rIL��������\0Z)(�QIE1ef�f�\�QE\0>�~-AÊ��,\\Ӆ34��S��\�<\Z\0�3S2	i�#<Օ4��C��\00\�\�juTpz����*��4�\�\��SWm���3o\�fn�*&S�\"�\�%���t6R�6�(�\�1�^J�\�M�t�p���\'Ҥ\�\�)\�\nl� �\�E�r\r0��R��`1�g\�>\�n=)�1�u5+t\�\�m\�I��\���\��^I9�I&NsH��2*	\�)\�4&i\�M��v�[W\�5�\�@hD�JZJ)�ZZJ(h�������8�\�\�sKL\�Z)(�!�\�JX\n�iKi�Ƀ�O�_Z�P!\�)��)�5eMUCVT\��J�2�i�Ӂ�s�\�T���\�\�Mn��q\�\�TXl\�\�(o\�=h*GCN^MN�1ڀ Y�uV\�坾\\�WdA\�T\�q\�\� dG-�\�	I1�\�p����*)w\�d\"\�6qW\�SpoqT@��e`>��̹\��\�����\ng#�e:\�r9��d�\�cr��(�}\�%�u\'��Eh\�38Q\�\�\�:f\�\n״����,_e�(9QҮ\�\��ũ{���Zh��!\�RR\�\�I�(ii)s@P���e�EP1(�\�\�S!�^��CSw4x�\nh�\n@J�e:UU�)@\�A�\n`4\�i(\�k>\�v���׋�(�\�\�M�T!�)jV!;���i\�\�\��b\�\�Jx\0S\�\0�\��$�kn\�j۠�E�R��@��*�\�W�ž�K��\Z\�*��x	\�9�h\�Q�\r\\��jo�5Q�v��8dj=�F\�Z�\�luTv-�A\�V�8L�\�d�\�Ut\�٧Fi�\���\�\�!sKIK@E&ihii(�&���e�KM��\0M(�4��)�\���\�*,|\���V�N\�N\"Ք��V#�d)�Sƹ��\'5V���\�P\�}\�dҸ\�SbGjaj��<TeMP�\'�\�q@�\'4XW&B�jK\\4��j�\�nPA����\�\�*��qQɪ\"u5J\�V1�VY|Nj�t�)\�5f;���\�\�\\��c�\�\�d>c�\�:R�\\��Kv5uxri��Ԍ�\ZDUV%@\�ғ4\�\�\�\�\�E0�Pi���K�n�-\0:��)\�\�P))i���P0&��\�u*\0�\�\�\�\�K��>�r�=�Ƚ\�B\r1\"a;}i\�\�\�j\nZ@[[���Y�h\��\n\�4i��k\�\�z05e�\�m���&�Gʘ\'&�\�w\�U%9�Y\�&5#+H0sҢ\�\�5;�{T;>cT!J�\�\�n�����\"�\����\��#�D�\�\�r;U�G�\��BP7\Z�!-\�Q\'�\�@dֶ��(ϩ�qZ�\��ZPC�u�\�c\�zӳM��\�\�晚PhL\�\�\�.h 4\�j0i�\���\�74��R\�ih�\���覜!s�4\�0\�R�����!��\��\0FMY�P\�\�*#\�f�& \�P�\�7\�x {\�\0T\�<�\�H��8\�1J�V�V ��\�X[hЏ����S*(��\r��-\�B`��*\�\�_�\0�.*\\�4�\�\�҇�昤��I9a�\Z2\0\rEǩ4�u��)��!\�F�D��ex\�<��Q�n�S̓HV�A�\�JE1���8\�3@\n\r8(�;n0i��Z�idm�@_QK�z\�iO4	�^�jl3b�5������WP~\�@\ZB�\Z����\0ԫ{\�[�늅g��0�\�\�P���җ4\0�KM��#�3�o�j:\\\�\Z���\r&�I��R�m\�@�!jU]Ɯ\"5b\��M\0>\�\�I9\�Zю\�c�5* D\0qJ@*-!1Mc���j7�*J̢Pi�sM\�i�\�ɢ\�(\�N\�D\�f��6\��\�V�s6`T\�C\�qM\�Ol\nd�X\�u��,�8\�Xo\�\nc[\�i�Dă���`\�\�V\�⦈�L	��u�\\���\�]��S�!lP��e\�b\")\�\�\�\�Ԁ�z\�f�i3Lb\�IKH\�.i��\0\�O�8Jã\Ze-\0N�R�\�\�J����S\�-\0i.�����\�_J\�\�-\0Tۊ\\t�`R��D�1F9\�.9\�R��\�\�ֵ\"� ^\0\�\�Um\"��\�\n���2e$饾��Fj=\�%�Zc9\'\�*C�8���:\�P\�R�Ѳ9\�N\�z\�$}E$ƚ��\�\�[\'#�14\�\�f�\�7>�\�ZYG`:sI�֫��\�^\�D�1\�9�1Ȧ\�V\�P�Ҕ|���7\�\�HZ��*��`u�i6�\rVf,y�\�#g�,\��֢�\�\�!�\�\�)�vh\�&h\�!��\�74P\�i�P�٦f�4\0\�Znh\�\0Fzю/�\�\�\�VHc4\��4Ӓ\0�HI\�� /G�G\�iY�|��/���e�&��j2٣v)�J���)ṥrd�U!28�)\�iNh�\�\�iH\�!�$�Rp94\�\�Ҝr�;P)1J�x� U\�M`�N���lɅ&�ʻ��*\���ALC\�\�b�\�\�\�Q\���\�!�w.y\�J�LQS/JLhQMh	\�S�\�sL[��0��L�����Tn\��ƭ\�\�:Z��\�j�\�õ\02�#�\0�����KM����\�.h�rNh\�\��Q�E\�:s\�THo\�\�T�j���NS\�o\�@\�T,\�=8��aA\�C(hzz��\�\\�w�++us�\nC*��N��Wny�se��NHVT(f�n8�P�8S#\'=)\�#��h�v���E#�`�S���\�W\�l\�E;Wk��\�%�M�\�M!6i�S\���ц���\�b��<�>j)�y\�!�\�4�N\�ڢ\�LD��\�\�E����q@\np\�S\�=j\�p/�KE\\͙JD&�\�t\�[�ډ�(8��GF���A���h:���H9Py\�?\Zv:\��\0xT\�*?z�G�G\�\0v\\\�\�\�\�5n�TMl;T	+�|�\�z\�\�v?�R�\�\�i�c�]Y\�R�ս\�\\\n\"����\�\�D`a\�LQ�0GZ(\0\�[;~��`�\�ލ��G�.}OҨ�\�O駧�\��\�\�I��@�)����R�\0d~]��P*l2\�/�@���eU@\0\�\\�Ps޺i�=iXw/\Z�5��/\n�\0Χ��\�$o�稠Fq�\���a��}�a)Q\�5kP�&���b�̙�\�\rq\�d_��j\�\�`�c\�B�H?��:[��2�\�i�e�\�j�\�V�\�(�@�\�\�j�p(M�#��� \�c\�V�b���ZɁ�4�͸�\�M\�b��:ӃA����fͱ\�5r:˵�\\=j\�rn8�ˠ��C=�\�x\�w�&\��y�J��H\�\�1nʞ�\�N�<[7(�[��x\�\�b\��?�1\'?L\��\�e�l��2H(@\�8\�61���\�\�\�S�\�F(\0�4��Ѱ4\�\���Ԙ# \�z,���*º8\��\�ڪ��H\��\�6\�\Z�aM�2\�D�t$�\�S-�\�*sJù\\\�\'�\�Jw\0\�;L\�z�\0:^�ہ�SVH��Kȡ�\�#\�ڎ[$���\�F?J\0k}s���#�R�t>\�c\r�Z`BP��vT`�q�\�zt΢�\0RG�z@X���ɗ>��:�R8�-L�F��ϗ8�T\Z�\� ��i\�7\��\�e\�7x�\�\�^�=B\�\�%�>I\Z>��\�@\�*N|���\�ĸ�#N�c̢I�y5\�<\�\�L�M�\�0}�*\�X�T��QU���^(��\�F���㡤mZ\��~\�¬\�j�\�F\Z6F\��֪\�\������D�ݞ�(\��P.�d\���\r%\�\�A��U��i\�\�\�k(\�\�r\�\�h\��\0Z�F\�\\ޓ�\�\�4\�7.z\�\�Q�Y��m\�j�M��\n���£�W�vӁ��\�\��)<R\�Lr߅o\��\�$�\�[\�YA�=9�{V��$6vѐ7��\�q��\�<w\�1\�\Z\�\�\"\�\�@\�Q���\0Z�ij ��!F\�\n��A\�\�E�熠\�@\'\�4�P8\����-L:�m\Z�\���\�Tu�\�[ċ\��\0��o� ��G4�s=\�[��ʡIQI\'ҷ�6���C�\�Rh��y��1\�n;�~jb9\�\"�}\�Ҟe\��+G]�3\�։K�ݞ��\�;$ ~�\0}ߺ\�\'҆\�u\�\�\�8\�\�JK=(\0�ɥ\�qH�\'��ƕ�Nr:\��\0t)��,98��1\�J6�2x��B�\0֓\r\��Ҫ�X\�ƚNO�0\�0��?:R\�go\'ބn\�\��(��]\�.��I�lP@ۏ�\r �A��\�.=(�0ߝ\0.zd��\��Nz\�rݷ�?\�s\�aC#\�\�##���\0ȴ�\�G�*`Ow���\�\�T\�Ԧ�\�~\�\�\"�\n7\��\��Sl�\�Ӧ�\��\�\�V\�1H\r\�;\�^�\0\�ĕZ/��qo\�U$\�\�6H\��2��۳��u9WK���(S~�\0׼�\0�4X���o\��u��u?�	�ȵ\�\�$�Z#P3�ҫͬO=\���D`�>��:D�d�X��<\�V���\0l�\0\�\����\"�\�!M���U\��A��\�-s�vn�\�Z\0��M\�\�h@\�`\�?\Z�Ä��\'�W�\Z˿�{����FU6\�6sޤ\��\�|ݑ��a�\�(x\\gK�^\��P)��\0\�v\����a�\0iL�Q[��j8|\�\�\�*f\�%��+�!�J\�\�\�4g]����\�r\�s���j֖k�gF\"\'p=�1X�\�d]�\�rH�?CQ\\kOo7\��8\���@\Z�ǳ\���~���n	�xK�VS�\��\0oK��<[&vl\��\0|\�v�\�֢P WH\�n�\�@4�ue����\�\�\"x8\�\�\��1=�wj�|����\�k:\�V�\�	�&��c=io�)�Ex�8�\�h9\��\����\�\\�\0�?�A��\0\�^�\�\��V\��)l� `ylb����\�\�Y� \�.r���s@��\�{�GA\�*��_\� �\�sW�V�9n����\�F�\0�\�*+\�\�/c�W�F����\�L\n�n=@4rx\0}jHv��0�I\�\\+h\0\��ן�\�\0P���#LaKu\�Z��ȑ�6	\�)qe����:\�zw\'�#s�Y���󒧓\��qN�Z���\�\�\�s@\�+e�iDNy���[4\�9\�֘2�\�{S%��E�v\0�\��sȢ�`9T�9=9�H�g�P7\�̣�:5�,O4Q@\�v\�1\�\�!\�:s\�4QHh\�0H\� P1\�ڊ(\���\0�4��.6�G\\\�E1��q\�N\�\��(��\0\nTm�H#ڊ(�4�\�\�x\�\�\�\�(��A*y��\'-�\�=h��\ZķҤD�\�\�4QHGe\�&�\�<\�E0\�`^O\"�g�E\0�y�Nl)��\�Pd&23\�=G\�&\nxҊ)l��#�Z@\�3���`\'��4\�\�1�=���\00=iBo\�>�Q@�\�',0),(4,33,'Under Cut','�\��\�\0JFIF\0\0`\0`\0\0�\�\0C\0!!$-K0-**-ZBE6Kl`roi`ifx���x~��fi�̖������r�\�\�Ϻޫ����\�\0C!!!-\'-W00W�{i{���������������������������������������������������\��\0\0\0\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\0\0\0\0\0\0\0	\n\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\0,\"\0�\�\0\0\0?\0��(\�&ihh?4�x��cҐ��W�\0E�<\r�*ʭ�08�9�\�(��x\�&$�~\��\�8\�ϱGm+��kw�\��w���J��X\�ib�p��9�I>CH��\�9����V���U2\nɖ?( �ց�5T�K�\�M3FL�[0m\�9\�XM.\�R\�d�/(�;�]����\n\��j���j�wk$YDe8\�\�\�P&�o�u<�nx\�ǀz\0\�\��J��kW�<B\�Y\�q�\�c����D�\'�d�{��?uG���\rq\"��\�O�43��\�\�j�\��lRI�GnUAI3���ڢ����\�\��L���\�g��،zњ�6�l��\�>L��\0�\�pc�Ki�\�Iqt$����P<\�\�@�\�K�ʷ\�\�SNy�\"\��\�d�\��J\�M���q�Ȅ\�\�Wq\���\0iJ\rfC�\�6�r�1\"�E\�x\�9\�\�U᰷�\�\��\�\�r�݃\�Ҁ73HdP\�,��\�bܢY\\]��1�a\npI���\�\�U��4�CO�\�9\�G���\r\"\�c�\�B�a� �PsX�6\�]Iq\�Hn-\�m�)l�1�\�қsil��\�P\�\�$��djH��\�\0m\�\�Iҭ��Db2!�w\�~�q��A�[\�xɊ=�q\�#����+]>\�ೖ\��� |1\�H9jI��e\�m�Hȉ�ˮ\�\�1�����\\\����K�c�l����<e~��\�c7\ZzD�g?���\�2hf���.h\�%\0�����9҃M\��4�F\�I�F?-\0Z�[�n\���\�\ZY�銻~�j:T\�<af�p\�=W�>�B\�Ș�	*dr2�5b{����2b����[�$ѹ�\0��?�\��\0\�\rG\�\�s���S���S����50\��gp��S\�\���]br\�\��\�LP#d\�v\�≏\���ڌ�V����g��j�\\^�\�\\�\0tR�ppA�\�}��\�9�hU\�\�͠\�9\�4�+�V\��\0=eU��*���^�$c�Z8�Vm�\�\��F�8\�QL�\�nn\�Q\n��o��P��\��>\�M���:UYae���Fe\�\��N3��\'��4�\�\�ys3X�փƷ�9W�ЊL�/�[;\�Fx\�\�Ӟ�z*�|2�9\�@����uw[&x2*�*d0\�Y\'�k$rDy\�09�\"�j2l\�t\�z��\�V�u�p紡1�\�Y�Z\�\\H�\��B`�ps�^i\�)w\�o{e�H�CrGL\��\��6�\�W�f�\�\�#7_݄�\��+:\���\�+��c\r�\�\'��+E�Ig�V{`�6��P�!!�\��ц��g\�\na�!\�\Z4�\�H\��S�:�Y����7a��b�-nm\�<\�V�5B$�ҕ���d^\\:�3;�v�ʭ[���\�s�T�`:�:\Z}����m�`۷n#��<S5�\"=��F\�6=�E�4\�t�k\�c���\�*\rU�m���g�a,�\�\�i��W�O��E�[\�\�l\�Wɶ�H�\0;c�gO�0/N\�\�\����[\\\�ޏw\�*����ֆ٤�Wi`8�{}B[Cl\�Z\�+��\r�&�<�&\��\0p\��ȫ00�\�?�K�\�\�T\�\��l�1[=��q+�6@=����\�,\��\�\��%���\�\0AdJ\�FQ\�\�IP�e\�*W��\rb\�\�-OOJr\��\�l\�I�&vm�\�;��\����\�Z\�\��n01\�\0Nu�>\� \�\'�M\�\�WQ\�DWC�a�}Eg=��#H\�\��6\�s�5z\�#�Q��>���(�����8\�\�\��xR\Z\\\�\ZX>oQF[�(��.,ڟݷ֦\�V�8V�ԤԱn�\�E�p4~i�\��\r\0Aq�0�Q��\�~�CҘ�T՘\�**���Z��\�U��0��\�+�MX(\�Դ2\�jp5O\�\"��r\�qJ\�b\��.y�\�|Դ�;\�H[\�\�= %S\�\�P\�Ԅ��� �\�UC`\�G�q4IE( ���HR\�Q@���b�JZ\0Z3IE����8\�)(�X\�\�IFh-�\�l\�{s��JM\"Gf���4\�h�i�\���*\�#��ث�\�^X\�o�ƀ�җ�)���0!!��K\�\r��\�\�^EA\'\�i����[d�\�(\�I�pkB%آ�cE�>�\�\��MiGz��ςj#/OJ�\�\�\�e\�h>�\�\�5@J\rK\�$SBd\�JrI\�U��T~i��)��j���!���x��\�w4S�\rIL��������\0Z)(�QIE1ef�f�\�QE\0>�~-AÊ��,\\Ӆ34��S��\�<\Z\0�3S2	i�#<Օ4��C��\00\�\�juTpz����*��4�\�\��SWm���3o\�fn�*&S�\"�\�%���t6R�6�(�\�1�^J�\�M�t�p���\'Ҥ\�\�)\�\nl� �\�E�r\r0��R��`1�g\�>\�n=)�1�u5+t\�\�m\�I��\���\��^I9�I&NsH��2*	\�)\�4&i\�M��v�[W\�5�\�@hD�JZJ)�ZZJ(h�������8�\�\�sKL\�Z)(�!�\�JX\n�iKi�Ƀ�O�_Z�P!\�)��)�5eMUCVT\��J�2�i�Ӂ�s�\�T���\�\�Mn��q\�\�TXl\�\�(o\�=h*GCN^MN�1ڀ Y�uV\�坾\\�WdA\�T\�q\�\� dG-�\�	I1�\�p����*)w\�d\"\�6qW\�SpoqT@��e`>��̹\��\�����\ng#�e:\�r9��d�\�cr��(�}\�%�u\'��Eh\�38Q\�\�\�:f\�\n״����,_e�(9QҮ\�\��ũ{���Zh��!\�RR\�\�I�(ii)s@P���e�EP1(�\�\�S!�^��CSw4x�\nh�\n@J�e:UU�)@\�A�\n`4\�i(\�k>\�v���׋�(�\�\�M�T!�)jV!;���i\�\�\��b\�\�Jx\0S\�\0�\��$�kn\�j۠�E�R��@��*�\�W�ž�K��\Z\�*��x	\�9�h\�Q�\r\\��jo�5Q�v��8dj=�F\�Z�\�luTv-�A\�V�8L�\�d�\�Ut\�٧Fi�\���\�\�!sKIK@E&ihii(�&���e�KM��\0M(�4��)�\���\�*,|\���V�N\�N\"Ք��V#�d)�Sƹ��\'5V���\�P\�}\�dҸ\�SbGjaj��<TeMP�\'�\�q@�\'4XW&B�jK\\4��j�\�nPA����\�\�*��qQɪ\"u5J\�V1�VY|Nj�t�)\�5f;���\�\�\\��c�\�\�d>c�\�:R�\\��Kv5uxri��Ԍ�\ZDUV%@\�ғ4\�\�\�\�\�E0�Pi���K�n�-\0:��)\�\�P))i���P0&��\�u*\0�\�\�\�\�K��>�r�=�Ƚ\�B\r1\"a;}i\�\�\�j\nZ@[[���Y�h\��\n\�4i��k\�\�z05e�\�m���&�Gʘ\'&�\�w\�U%9�Y\�&5#+H0sҢ\�\�5;�{T;>cT!J�\�\�n�����\"�\����\��#�D�\�\�r;U�G�\��BP7\Z�!-\�Q\'�\�@dֶ��(ϩ�qZ�\��ZPC�u�\�c\�zӳM��\�\�晚PhL\�\�\�.h 4\�j0i�\���\�74��R\�ih�\���覜!s�4\�0\�R�����!��\��\0FMY�P\�\�*#\�f�& \�P�\�7\�x {\�\0T\�<�\�H��8\�1J�V�V ��\�X[hЏ����S*(��\r��-\�B`��*\�\�_�\0�.*\\�4�\�\�҇�昤��I9a�\Z2\0\rEǩ4�u��)��!\�F�D��ex\�<��Q�n�S̓HV�A�\�JE1���8\�3@\n\r8(�;n0i��Z�idm�@_QK�z\�iO4	�^�jl3b�5������WP~\�@\ZB�\Z����\0ԫ{\�[�늅g��0�\�\�P���җ4\0�KM��#�3�o�j:\\\�\Z���\r&�I��R�m\�@�!jU]Ɯ\"5b\��M\0>\�\�I9\�Zю\�c�5* D\0qJ@*-!1Mc���j7�*J̢Pi�sM\�i�\�ɢ\�(\�N\�D\�f��6\��\�V�s6`T\�C\�qM\�Ol\nd�X\�u��,�8\�Xo\�\nc[\�i�Dă���`\�\�V\�⦈�L	��u�\\���\�]��S�!lP��e\�b\")\�\�\�\�Ԁ�z\�f�i3Lb\�IKH\�.i��\0\�O�8Jã\Ze-\0N�R�\�\�J����S\�-\0i.�����\�_J\�\�-\0Tۊ\\t�`R��D�1F9\�.9\�R��\�\�ֵ\"� ^\0\�\�Um\"��\�\n���2e$饾��Fj=\�%�Zc9\'\�*C�8���:\�P\�R�Ѳ9\�N\�z\�$}E$ƚ��\�\�[\'#�14\�\�f�\�7>�\�ZYG`:sI�֫��\�^\�D�1\�9�1Ȧ\�V\�P�Ҕ|���7\�\�HZ��*��`u�i6�\rVf,y�\�#g�,\��֢�\�\�!�\�\�)�vh\�&h\�!��\�74P\�i�P�٦f�4\0\�Znh\�\0Fzю/�\�\�\�VHc4\��4Ӓ\0�HI\�� /G�G\�iY�|��/���e�&��j2٣v)�J���)ṥrd�U!28�)\�iNh�\�\�iH\�!�$�Rp94\�\�Ҝr�;P)1J�x� U\�M`�N���lɅ&�ʻ��*\���ALC\�\�b�\�\�\�Q\���\�!�w.y\�J�LQS/JLhQMh	\�S�\�sL[��0��L�����Tn\��ƭ\�\�:Z��\�j�\�õ\02�#�\0�����KM����\�.h�rNh\�\��Q�E\�:s\�THo\�\�T�j���NS\�o\�@\�T,\�=8��aA\�C(hzz��\�\\�w�++us�\nC*��N��Wny�se��NHVT(f�n8�P�8S#\'=)\�#��h�v���E#�`�S���\�W\�l\�E;Wk��\�%�M�\�M!6i�S\���ц���\�b��<�>j)�y\�!�\�4�N\�ڢ\�LD��\�\�E����q@\np\�S\�=j\�p/�KE\\͙JD&�\�t\�[�ډ�(8��GF���A���h:���H9Py\�?\Zv:\��\0xT\�*?z�G�G\�\0v\\\�\�\�\�5n�TMl;T	+�|�\�z\�\�v?�R�\�\�i�c�]Y\�R�ս\�\\\n\"����\�\�D`a\�LQ�0GZ(\0\�[;~��`�\�ލ��G�.}OҨ�\�O駧�\��\�\�I��@�)����R�\0d~]��P*l2\�/�@���eU@\0\�\\�Ps޺i�=iXw/\Z�5��/\n�\0Χ��\�$o�稠Fq�\���a��}�a)Q\�5kP�&���b�̙�\�\rq\�d_��j\�\�`�c\�B�H?��:[��2�\�i�e�\�j�\�V�\�(�@�\�\�j�p(M�#��� \�c\�V�b���ZɁ�4�͸�\�M\�b��:ӃA����fͱ\�5r:˵�\\=j\�rn8�ˠ��C=�\�x\�w�&\��y�J��H\�\�1nʞ�\�N�<[7(�[��x\�\�b\��?�1\'?L\��\�e�l��2H(@\�8\�61���\�\�\�S�\�F(\0�4��Ѱ4\�\���Ԙ# \�z,���*º8\��\�ڪ��H\��\�6\�\Z�aM�2\�D�t$�\�S-�\�*sJù\\\�\'�\�Jw\0\�;L\�z�\0:^�ہ�SVH��Kȡ�\�#\�ڎ[$���\�F?J\0k}s���#�R�t>\�c\r�Z`BP��vT`�q�\�zt΢�\0RG�z@X���ɗ>��:�R8�-L�F��ϗ8�T\Z�\� ��i\�7\��\�e\�7x�\�\�^�=B\�\�%�>I\Z>��\�@\�*N|���\�ĸ�#N�c̢I�y5\�<\�\�L�M�\�0}�*\�X�T��QU���^(��\�F���㡤mZ\��~\�¬\�j�\�F\Z6F\��֪\�\������D�ݞ�(\��P.�d\���\r%\�\�A��U��i\�\�\�k(\�\�r\�\�h\��\0Z�F\�\\ޓ�\�\�4\�7.z\�\�Q�Y��m\�j�M��\n���£�W�vӁ��\�\��)<R\�Lr߅o\��\�$�\�[\�YA�=9�{V��$6vѐ7��\�q��\�<w\�1\�\Z\�\�\"\�\�@\�Q���\0Z�ij ��!F\�\n��A\�\�E�熠\�@\'\�4�P8\����-L:�m\Z�\���\�Tu�\�[ċ\��\0��o� ��G4�s=\�[��ʡIQI\'ҷ�6���C�\�Rh��y��1\�n;�~jb9\�\"�}\�Ҟe\��+G]�3\�։K�ݞ��\�;$ ~�\0}ߺ\�\'҆\�u\�\�\�8\�\�JK=(\0�ɥ\�qH�\'��ƕ�Nr:\��\0t)��,98��1\�J6�2x��B�\0֓\r\��Ҫ�X\�ƚNO�0\�0��?:R\�go\'ބn\�\��(��]\�.��I�lP@ۏ�\r �A��\�.=(�0ߝ\0.zd��\��Nz\�rݷ�?\�s\�aC#\�\�##���\0ȴ�\�G�*`Ow���\�\�T\�Ԧ�\�~\�\�\"�\n7\��\��Sl�\�Ӧ�\��\�\�V\�1H\r\�;\�^�\0\�ĕZ/��qo\�U$\�\�6H\��2��۳��u9WK���(S~�\0׼�\0�4X���o\��u��u?�	�ȵ\�\�$�Z#P3�ҫͬO=\���D`�>��:D�d�X��<\�V���\0l�\0\�\����\"�\�!M���U\��A��\�-s�vn�\�Z\0��M\�\�h@\�`\�?\Z�Ä��\'�W�\Z˿�{����FU6\�6sޤ\��\�|ݑ��a�\�(x\\gK�^\��P)��\0\�v\����a�\0iL�Q[��j8|\�\�\�*f\�%��+�!�J\�\�\�4g]����\�r\�s���j֖k�gF\"\'p=�1X�\�d]�\�rH�?CQ\\kOo7\��8\���@\Z�ǳ\���~���n	�xK�VS�\��\0oK��<[&vl\��\0|\�v�\�֢P WH\�n�\�@4�ue����\�\�\"x8\�\�\��1=�wj�|����\�k:\�V�\�	�&��c=io�)�Ex�8�\�h9\��\����\�\\�\0�?�A��\0\�^�\�\��V\��)l� `ylb����\�\�Y� \�.r���s@��\�{�GA\�*��_\� �\�sW�V�9n����\�F�\0�\�*+\�\�/c�W�F����\�L\n�n=@4rx\0}jHv��0�I\�\\+h\0\��ן�\�\0P���#LaKu\�Z��ȑ�6	\�)qe����:\�zw\'�#s�Y���󒧓\��qN�Z���\�\�\�s@\�+e�iDNy���[4\�9\�֘2�\�{S%��E�v\0�\��sȢ�`9T�9=9�H�g�P7\�̣�:5�,O4Q@\�v\�1\�\�!\�:s\�4QHh\�0H\� P1\�ڊ(\���\0�4��.6�G\\\�E1��q\�N\�\��(��\0\nTm�H#ڊ(�4�\�\�x\�\�\�\�(��A*y��\'-�\�=h��\ZķҤD�\�\�4QHGe\�&�\�<\�E0\�`^O\"�g�E\0�y�Nl)��\�Pd&23\�=G\�&\nxҊ)l��#�Z@\�3���`\'��4\�\�1�=���\00=iBo\�>�Q@�\�',1),(5,34,'Trim','�\��\�\0JFIF\0\0`\0`\0\0�\�\0C\0!!$-K0-**-ZBE6Kl`roi`ifx���x~��fi�̖������r�\�\�Ϻޫ����\�\0C!!!-\'-W00W�{i{���������������������������������������������������\��\0\0\0\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\0\0\0\0\0\0\0	\n\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\0,\"\0�\�\0\0\0?\0��(\�&ihh?4�x��cҐ��W�\0E�<\r�*ʭ�08�9�\�(��x\�&$�~\��\�8\�ϱGm+��kw�\��w���J��X\�ib�p��9�I>CH��\�9����V���U2\nɖ?( �ց�5T�K�\�M3FL�[0m\�9\�XM.\�R\�d�/(�;�]����\n\��j���j�wk$YDe8\�\�\�P&�o�u<�nx\�ǀz\0\�\��J��kW�<B\�Y\�q�\�c����D�\'�d�{��?uG���\rq\"��\�O�43��\�\�j�\��lRI�GnUAI3���ڢ����\�\��L���\�g��،zњ�6�l��\�>L��\0�\�pc�Ki�\�Iqt$����P<\�\�@�\�K�ʷ\�\�SNy�\"\��\�d�\��J\�M���q�Ȅ\�\�Wq\���\0iJ\rfC�\�6�r�1\"�E\�x\�9\�\�U᰷�\�\��\�\�r�݃\�Ҁ73HdP\�,��\�bܢY\\]��1�a\npI���\�\�U��4�CO�\�9\�G���\r\"\�c�\�B�a� �PsX�6\�]Iq\�Hn-\�m�)l�1�\�қsil��\�P\�\�$��djH��\�\0m\�\�Iҭ��Db2!�w\�~�q��A�[\�xɊ=�q\�#����+]>\�ೖ\��� |1\�H9jI��e\�m�Hȉ�ˮ\�\�1�����\\\����K�c�l����<e~��\�c7\ZzD�g?���\�2hf���.h\�%\0�����9҃M\��4�F\�I�F?-\0Z�[�n\���\�\ZY�銻~�j:T\�<af�p\�=W�>�B\�Ș�	*dr2�5b{����2b����[�$ѹ�\0��?�\��\0\�\rG\�\�s���S���S����50\��gp��S\�\���]br\�\��\�LP#d\�v\�≏\���ڌ�V����g��j�\\^�\�\\�\0tR�ppA�\�}��\�9�hU\�\�͠\�9\�4�+�V\��\0=eU��*���^�$c�Z8�Vm�\�\��F�8\�QL�\�nn\�Q\n��o��P��\��>\�M���:UYae���Fe\�\��N3��\'��4�\�\�ys3X�փƷ�9W�ЊL�/�[;\�Fx\�\�Ӟ�z*�|2�9\�@����uw[&x2*�*d0\�Y\'�k$rDy\�09�\"�j2l\�t\�z��\�V�u�p紡1�\�Y�Z\�\\H�\��B`�ps�^i\�)w\�o{e�H�CrGL\��\��6�\�W�f�\�\�#7_݄�\��+:\���\�+��c\r�\�\'��+E�Ig�V{`�6��P�!!�\��ц��g\�\na�!\�\Z4�\�H\��S�:�Y����7a��b�-nm\�<\�V�5B$�ҕ���d^\\:�3;�v�ʭ[���\�s�T�`:�:\Z}����m�`۷n#��<S5�\"=��F\�6=�E�4\�t�k\�c���\�*\rU�m���g�a,�\�\�i��W�O��E�[\�\�l\�Wɶ�H�\0;c�gO�0/N\�\�\����[\\\�ޏw\�*����ֆ٤�Wi`8�{}B[Cl\�Z\�+��\r�&�<�&\��\0p\��ȫ00�\�?�K�\�\�T\�\��l�1[=��q+�6@=����\�,\��\�\��%���\�\0AdJ\�FQ\�\�IP�e\�*W��\rb\�\�-OOJr\��\�l\�I�&vm�\�;��\����\�Z\�\��n01\�\0Nu�>\� \�\'�M\�\�WQ\�DWC�a�}Eg=��#H\�\��6\�s�5z\�#�Q��>���(�����8\�\�\��xR\Z\\\�\ZX>oQF[�(��.,ڟݷ֦\�V�8V�ԤԱn�\�E�p4~i�\��\r\0Aq�0�Q��\�~�CҘ�T՘\�**���Z��\�U��0��\�+�MX(\�Դ2\�jp5O\�\"��r\�qJ\�b\��.y�\�|Դ�;\�H[\�\�= %S\�\�P\�Ԅ��� �\�UC`\�G�q4IE( ���HR\�Q@���b�JZ\0Z3IE����8\�)(�X\�\�IFh-�\�l\�{s��JM\"Gf���4\�h�i�\���*\�#��ث�\�^X\�o�ƀ�җ�)���0!!��K\�\r��\�\�^EA\'\�i����[d�\�(\�I�pkB%آ�cE�>�\�\��MiGz��ςj#/OJ�\�\�\�e\�h>�\�\�5@J\rK\�$SBd\�JrI\�U��T~i��)��j���!���x��\�w4S�\rIL��������\0Z)(�QIE1ef�f�\�QE\0>�~-AÊ��,\\Ӆ34��S��\�<\Z\0�3S2	i�#<Օ4��C��\00\�\�juTpz����*��4�\�\��SWm���3o\�fn�*&S�\"�\�%���t6R�6�(�\�1�^J�\�M�t�p���\'Ҥ\�\�)\�\nl� �\�E�r\r0��R��`1�g\�>\�n=)�1�u5+t\�\�m\�I��\���\��^I9�I&NsH��2*	\�)\�4&i\�M��v�[W\�5�\�@hD�JZJ)�ZZJ(h�������8�\�\�sKL\�Z)(�!�\�JX\n�iKi�Ƀ�O�_Z�P!\�)��)�5eMUCVT\��J�2�i�Ӂ�s�\�T���\�\�Mn��q\�\�TXl\�\�(o\�=h*GCN^MN�1ڀ Y�uV\�坾\\�WdA\�T\�q\�\� dG-�\�	I1�\�p����*)w\�d\"\�6qW\�SpoqT@��e`>��̹\��\�����\ng#�e:\�r9��d�\�cr��(�}\�%�u\'��Eh\�38Q\�\�\�:f\�\n״����,_e�(9QҮ\�\��ũ{���Zh��!\�RR\�\�I�(ii)s@P���e�EP1(�\�\�S!�^��CSw4x�\nh�\n@J�e:UU�)@\�A�\n`4\�i(\�k>\�v���׋�(�\�\�M�T!�)jV!;���i\�\�\��b\�\�Jx\0S\�\0�\��$�kn\�j۠�E�R��@��*�\�W�ž�K��\Z\�*��x	\�9�h\�Q�\r\\��jo�5Q�v��8dj=�F\�Z�\�luTv-�A\�V�8L�\�d�\�Ut\�٧Fi�\���\�\�!sKIK@E&ihii(�&���e�KM��\0M(�4��)�\���\�*,|\���V�N\�N\"Ք��V#�d)�Sƹ��\'5V���\�P\�}\�dҸ\�SbGjaj��<TeMP�\'�\�q@�\'4XW&B�jK\\4��j�\�nPA����\�\�*��qQɪ\"u5J\�V1�VY|Nj�t�)\�5f;���\�\�\\��c�\�\�d>c�\�:R�\\��Kv5uxri��Ԍ�\ZDUV%@\�ғ4\�\�\�\�\�E0�Pi���K�n�-\0:��)\�\�P))i���P0&��\�u*\0�\�\�\�\�K��>�r�=�Ƚ\�B\r1\"a;}i\�\�\�j\nZ@[[���Y�h\��\n\�4i��k\�\�z05e�\�m���&�Gʘ\'&�\�w\�U%9�Y\�&5#+H0sҢ\�\�5;�{T;>cT!J�\�\�n�����\"�\����\��#�D�\�\�r;U�G�\��BP7\Z�!-\�Q\'�\�@dֶ��(ϩ�qZ�\��ZPC�u�\�c\�zӳM��\�\�晚PhL\�\�\�.h 4\�j0i�\���\�74��R\�ih�\���覜!s�4\�0\�R�����!��\��\0FMY�P\�\�*#\�f�& \�P�\�7\�x {\�\0T\�<�\�H��8\�1J�V�V ��\�X[hЏ����S*(��\r��-\�B`��*\�\�_�\0�.*\\�4�\�\�҇�昤��I9a�\Z2\0\rEǩ4�u��)��!\�F�D��ex\�<��Q�n�S̓HV�A�\�JE1���8\�3@\n\r8(�;n0i��Z�idm�@_QK�z\�iO4	�^�jl3b�5������WP~\�@\ZB�\Z����\0ԫ{\�[�늅g��0�\�\�P���җ4\0�KM��#�3�o�j:\\\�\Z���\r&�I��R�m\�@�!jU]Ɯ\"5b\��M\0>\�\�I9\�Zю\�c�5* D\0qJ@*-!1Mc���j7�*J̢Pi�sM\�i�\�ɢ\�(\�N\�D\�f��6\��\�V�s6`T\�C\�qM\�Ol\nd�X\�u��,�8\�Xo\�\nc[\�i�Dă���`\�\�V\�⦈�L	��u�\\���\�]��S�!lP��e\�b\")\�\�\�\�Ԁ�z\�f�i3Lb\�IKH\�.i��\0\�O�8Jã\Ze-\0N�R�\�\�J����S\�-\0i.�����\�_J\�\�-\0Tۊ\\t�`R��D�1F9\�.9\�R��\�\�ֵ\"� ^\0\�\�Um\"��\�\n���2e$饾��Fj=\�%�Zc9\'\�*C�8���:\�P\�R�Ѳ9\�N\�z\�$}E$ƚ��\�\�[\'#�14\�\�f�\�7>�\�ZYG`:sI�֫��\�^\�D�1\�9�1Ȧ\�V\�P�Ҕ|���7\�\�HZ��*��`u�i6�\rVf,y�\�#g�,\��֢�\�\�!�\�\�)�vh\�&h\�!��\�74P\�i�P�٦f�4\0\�Znh\�\0Fzю/�\�\�\�VHc4\��4Ӓ\0�HI\�� /G�G\�iY�|��/���e�&��j2٣v)�J���)ṥrd�U!28�)\�iNh�\�\�iH\�!�$�Rp94\�\�Ҝr�;P)1J�x� U\�M`�N���lɅ&�ʻ��*\���ALC\�\�b�\�\�\�Q\���\�!�w.y\�J�LQS/JLhQMh	\�S�\�sL[��0��L�����Tn\��ƭ\�\�:Z��\�j�\�õ\02�#�\0�����KM����\�.h�rNh\�\��Q�E\�:s\�THo\�\�T�j���NS\�o\�@\�T,\�=8��aA\�C(hzz��\�\\�w�++us�\nC*��N��Wny�se��NHVT(f�n8�P�8S#\'=)\�#��h�v���E#�`�S���\�W\�l\�E;Wk��\�%�M�\�M!6i�S\���ц���\�b��<�>j)�y\�!�\�4�N\�ڢ\�LD��\�\�E����q@\np\�S\�=j\�p/�KE\\͙JD&�\�t\�[�ډ�(8��GF���A���h:���H9Py\�?\Zv:\��\0xT\�*?z�G�G\�\0v\\\�\�\�\�5n�TMl;T	+�|�\�z\�\�v?�R�\�\�i�c�]Y\�R�ս\�\\\n\"����\�\�D`a\�LQ�0GZ(\0\�[;~��`�\�ލ��G�.}OҨ�\�O駧�\��\�\�I��@�)����R�\0d~]��P*l2\�/�@���eU@\0\�\\�Ps޺i�=iXw/\Z�5��/\n�\0Χ��\�$o�稠Fq�\���a��}�a)Q\�5kP�&���b�̙�\�\rq\�d_��j\�\�`�c\�B�H?��:[��2�\�i�e�\�j�\�V�\�(�@�\�\�j�p(M�#��� \�c\�V�b���ZɁ�4�͸�\�M\�b��:ӃA����fͱ\�5r:˵�\\=j\�rn8�ˠ��C=�\�x\�w�&\��y�J��H\�\�1nʞ�\�N�<[7(�[��x\�\�b\��?�1\'?L\��\�e�l��2H(@\�8\�61���\�\�\�S�\�F(\0�4��Ѱ4\�\���Ԙ# \�z,���*º8\��\�ڪ��H\��\�6\�\Z�aM�2\�D�t$�\�S-�\�*sJù\\\�\'�\�Jw\0\�;L\�z�\0:^�ہ�SVH��Kȡ�\�#\�ڎ[$���\�F?J\0k}s���#�R�t>\�c\r�Z`BP��vT`�q�\�zt΢�\0RG�z@X���ɗ>��:�R8�-L�F��ϗ8�T\Z�\� ��i\�7\��\�e\�7x�\�\�^�=B\�\�%�>I\Z>��\�@\�*N|���\�ĸ�#N�c̢I�y5\�<\�\�L�M�\�0}�*\�X�T��QU���^(��\�F���㡤mZ\��~\�¬\�j�\�F\Z6F\��֪\�\������D�ݞ�(\��P.�d\���\r%\�\�A��U��i\�\�\�k(\�\�r\�\�h\��\0Z�F\�\\ޓ�\�\�4\�7.z\�\�Q�Y��m\�j�M��\n���£�W�vӁ��\�\��)<R\�Lr߅o\��\�$�\�[\�YA�=9�{V��$6vѐ7��\�q��\�<w\�1\�\Z\�\�\"\�\�@\�Q���\0Z�ij ��!F\�\n��A\�\�E�熠\�@\'\�4�P8\����-L:�m\Z�\���\�Tu�\�[ċ\��\0��o� ��G4�s=\�[��ʡIQI\'ҷ�6���C�\�Rh��y��1\�n;�~jb9\�\"�}\�Ҟe\��+G]�3\�։K�ݞ��\�;$ ~�\0}ߺ\�\'҆\�u\�\�\�8\�\�JK=(\0�ɥ\�qH�\'��ƕ�Nr:\��\0t)��,98��1\�J6�2x��B�\0֓\r\��Ҫ�X\�ƚNO�0\�0��?:R\�go\'ބn\�\��(��]\�.��I�lP@ۏ�\r �A��\�.=(�0ߝ\0.zd��\��Nz\�rݷ�?\�s\�aC#\�\�##���\0ȴ�\�G�*`Ow���\�\�T\�Ԧ�\�~\�\�\"�\n7\��\��Sl�\�Ӧ�\��\�\�V\�1H\r\�;\�^�\0\�ĕZ/��qo\�U$\�\�6H\��2��۳��u9WK���(S~�\0׼�\0�4X���o\��u��u?�	�ȵ\�\�$�Z#P3�ҫͬO=\���D`�>��:D�d�X��<\�V���\0l�\0\�\����\"�\�!M���U\��A��\�-s�vn�\�Z\0��M\�\�h@\�`\�?\Z�Ä��\'�W�\Z˿�{����FU6\�6sޤ\��\�|ݑ��a�\�(x\\gK�^\��P)��\0\�v\����a�\0iL�Q[��j8|\�\�\�*f\�%��+�!�J\�\�\�4g]����\�r\�s���j֖k�gF\"\'p=�1X�\�d]�\�rH�?CQ\\kOo7\��8\���@\Z�ǳ\���~���n	�xK�VS�\��\0oK��<[&vl\��\0|\�v�\�֢P WH\�n�\�@4�ue����\�\�\"x8\�\�\��1=�wj�|����\�k:\�V�\�	�&��c=io�)�Ex�8�\�h9\��\����\�\\�\0�?�A��\0\�^�\�\��V\��)l� `ylb����\�\�Y� \�.r���s@��\�{�GA\�*��_\� �\�sW�V�9n����\�F�\0�\�*+\�\�/c�W�F����\�L\n�n=@4rx\0}jHv��0�I\�\\+h\0\��ן�\�\0P���#LaKu\�Z��ȑ�6	\�)qe����:\�zw\'�#s�Y���󒧓\��qN�Z���\�\�\�s@\�+e�iDNy���[4\�9\�֘2�\�{S%��E�v\0�\��sȢ�`9T�9=9�H�g�P7\�̣�:5�,O4Q@\�v\�1\�\�!\�:s\�4QHh\�0H\� P1\�ڊ(\���\0�4��.6�G\\\�E1��q\�N\�\��(��\0\nTm�H#ڊ(�4�\�\�x\�\�\�\�(��A*y��\'-�\�=h��\ZķҤD�\�\�4QHGe\�&�\�<\�E0\�`^O\"�g�E\0�y�Nl)��\�Pd&23\�=G\�&\nxҊ)l��#�Z@\�3���`\'��4\�\�1�=���\00=iBo\�>�Q@�\�',1);
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
  `intStatus` int(11) NOT NULL,
  PRIMARY KEY (`intDiscountID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldiscount`
--

LOCK TABLES `tbldiscount` WRITE;
/*!40000 ALTER TABLE `tbldiscount` DISABLE KEYS */;
INSERT INTO `tbldiscount` VALUES (1,'Senior Discount','For senior citizens',1,25,1),(2,'Student','Sample Description',1,20,1),(3,'VIP discount','sample description',2,100,1);
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
  `strEmpEmail` varchar(45) NOT NULL,
  `strEmpStatus` varchar(1) NOT NULL,
  `blobEmpPhoto` longblob NOT NULL,
  PRIMARY KEY (`intEmpID`),
  KEY `fk_empJobID_idx` (`intEmpJobID`),
  CONSTRAINT `fk_empJobID` FOREIGN KEY (`intEmpJobID`) REFERENCES `tbljob` (`intJobID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblemployee`
--

LOCK TABLES `tblemployee` WRITE;
/*!40000 ALTER TABLE `tblemployee` DISABLE KEYS */;
INSERT INTO `tblemployee` VALUES (49,15,'AQUINO','BENIGNO','CONCANCO','2016-01-02','1','ASDFASDFADF','54645646','aasd@gmail.com','A','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0I\0\0\0P++\0\0\0sRGB\0�\�\�\0\0\0gAMA\0\0���a\0\0\0	pHYs\0\0\�\0\0\�\�o�d\0\0��IDATx^\\�u\�W�\��}\�\�s\�ٻ�N:l\�N�1d�\�33SI�Rq�\�,Yf��\�\�羀y�c�ܻ��\�r�K?Xc�1֚k�Ѿj��\�[��\�\"\�\r魳XO�Ż�m��\�b\�\r�3\�Ut�^\�\�彽\r\�s�\�zt\�Y���EZ\�,L\�\"]Wm�_\�Wk��*t_�`O���\Z,:\�l�~���\�5\�\��u\����:[ꩶDw�-u�[���Ve\�N>�\�\�;b|g�\���ZS��45\�Lo��;,\�\�h��\ZK���jK�\�[�s[⽑�:r���r[\�,1�e[���\r_{�-�W\�*\�\�Vi�6Χ�\�\�j�hW����\�9E8�(߭\�\�1ڪ-\�Q�q�rN\���\'\�\�s�c��h�U�\�Z�s^\�\�\�y�%��,9\�h\��zK\�[b�\�\�C�{\'\�\�m��vZנ\�R\\�\�;\�\�\�=�\�\�Wx���j\�\�*��TZ�瘟���ꮶ@O���-:\�\����[��G�EZx���ۦ\�\�d��K���f?\�\��1~/εL�[f���\�s�����\�Z\�l��\�\�.\�B\�Y�7��p�\��%��X���k\��wVY��>\�z\�\�m�,\�q\�\�\���c�\�ob�G\�%܋�\�\�TbsՍ�\�\�`ޖz�qM\�o��4�b��s�\�ĺ+8\�2��C	��\�\�>�\��Z�e�le�\�6f�m\�;`[�[��\��|�\�g;,;\�k�\�^K�wYj�\�r��ma�6h+�\�;d��^�\���\�=��\�;c�	��\��e\�0\�5\��Xt�\��`e����\�jm��\�\�*/\�lM�M7\�\�\\�U�q;\�S]��ȹ�:\�-��Pw\�\�j�\�\�\�L]�M֔\�\�\�+�Z�MTW\�tM5׺\��͕h-\�\Z���\Z\r�Xd�\�b\�S\�(\�3\�u\r���j�\Z���\�\�,:\\I?�J?��%���\�	����\�5�\�/���R�Tb\0\�\r�`��ց \�\�\r\�*�>L\0B_\'�\�-Ԗ��\����ZZC)[�A\�\�+l����r\�\0\�\�ɻ�@�\�`g���jx�\��\n!MH�\��\�ט���\�Z\��\�\�q�#\\���Z�i\�b���U\\xΡ��\�t�s\���[\�V{�Vb�\�R\Z\�\�/\�.�:��\�č\�q��ܼ\�_+���看�\��\�qnz�BC�k^^_l\�|���/\�r\�u̺\�ܰE�\��\�\���W@���5����7�\Z�C�\�����6и��g�\�\�j��\�B�.\���W�\�R��X��\�\�x\�|\r��F%\�x|�w�c	�U<�q\�P_�g����\�\�K��{\�ʽ\�1�\�N�\"\�)�E�**�E�\��͵�\�,m�\�_\�:,\�]��\�s6_\�ul\�[8M�\�|\�y��z�x<|\�\���V\��	L��*\�U\�q��\��j(ն�1y	\\>����\�o+\�	�M\0\"B��_=k\�\����\�K\\�Rt����V[�����[�\�\�t�\�&;,=\�\'�-=\�\����\��\�\\�xߊw\�\�G	\0\�V\��Ҷ\�S����\r�_��ef-1\�k�\�6Blܛ��\n��.�ɪK6]Wj�\�U\�\�\�	��o��\�\"���	3\�\\3\0.&\�*m�>9n\�闓u%�rέ�k\\a^�\�\�p�kɹ�T�K����iz\�\��T�\�2�\�C���d?\��/�\�Ds\�Ss\�\�\�.\�\�ŋ6]r\�F*\�r�@F`$��]8\�ps-Q��\�\�����M6\�Zc3�D��\�6u\�\�^\�f��X~��\�/\�XI�\r^����.\Zz�k��\0�(�N0O�\\�\�N�trQ\��}�`vօ�k��\�J.\�UH}�\�p�g�/q�t�+\�\�f.�\0u�䊍|\�\�^�\�&K���\�oi�l�􂍖~\��w\�\�x\'J\�\�\�:S\��]g��\�\\�	�\�xM	\�[f�\0E7`�`1N@\�F�\�m�\�\��\�,!�\�\�	~�t�j���֦+*�\r���\nL\0H\�Q\�\\sn�lu�i\�3ͶP\�ȍ��7Ԙ��\�<�s�\�D\�x	n�F��cq���̦�б*.\�|\r\�R�\��w�,��\�.���7{��y\0\�<�\�j�{9\�E\�\�玓\�9\�Z:W�@��Ƚ�n_+�m9O\���\�1\�1y��Y�k��\��Lu\�<܏E>7�\�\���|�\�RaӜ\�h\�U�ϴs^(� ,\�\��\�C�d�\�� \�\�хI\r�_%\�U���\�^��M��\�&.��\��;�\�;�y�j\0e�o�\�T�&{,�g\�:-9\�\�X>\�\�\�,\��==���نܶ�3\�\�\�Iۍ\�\����G�m�fl30\��\�Af�ߒ��D���P(�\�4`�ߌT_�I�\�<\�\�\�I�JI�9\� }\�O@]�P����֫(��6)�\�z�\�D#����J@_\�~/�_��]S5g\0�\'\�	�\�]���P\�(\�v� ��j#|]W\�\�\��{J9\�[\�xNL\�\�\0�j:&?^Y\�A�\�\0H\0�#�=�D{��C��y\�\��#�y.`��U\�\r�\"�2��Bg���\�\�znz�M ŧ\�\Zl���E%L���\�Ͷ�\r�w�w�\�<�\�\��@\�GF,<9bޡ!�\�\�7OG��\��Z�,��c�in\�\"�\�蔵�^��^���+�\0\�6^E0�.�SVpS*iU��sE>�U�\�R�V^�\�0\�,6{�\��܌Y�\�\�ƨM)\"\��\��\�d�Q��<�$�\���\�q�4x\�4n��\�&\�9\�FΕ6\�\�hs\�M\�\�m���v�tw\�\\w�-t�\�Bg�ͷw\�\\G�\����6[\��.t��V�\�j\���&��`Q�G�\r\0�\�AfP6��	�\�:x\�B\�\�yx\0\�l!u\�%�.6���,\�1\�F>\�^\����\�b\�>?\�5#؎VVr.��ؤ\�\���9�<�\�\�3�-\�q\�>?\r@�a�yT\�<�b&�\��Qv^:�&ixQ�\Z]���\Zwo�	\��\�\�Xy�M\�7\'��1\�h��\�\�\rW|cå�+\�\�D�\0q\�)\�\�H+\�\�e˰ya�\�r=��\0���c�>\�\���\�\�G���Vh\�6�\�1��\�N�Nٺ��\�\�{W��0;\���Y|�\�I\�Eԉ��$���\0/؆\Zuv�u�j��\�RT�\�\Z�_\0�\"��F]G3\�!x�PN����\�\"\����-D�\r*\n�S�y����\�/u;Wv���\�M��C�\�4�\���6P��(\�\�P]�\r֪�\�P]Ѧ��O�k\�#�\�B\�i>:����\�։O\�\�\'t\���D0:r3o6YQc\�%\�6XRa�\0�\�\�;l��\�\�ښm��\�\'`L\rt\�xo�=�83`�\�1������yGC�Xt>j�h\���\�y��8�h\�\�yM\�d��M�\r\�\\\�(Ab\�滻l��\���[���\�:\�\0?>P\�Q���S��6\�\�nH\�1$�0\�:�m�c0\�7j�8�<��N\�Ig\�Q\�\�\�6\�\�N\n\�ut\�Z�$�m��\�z���\�DV@�5\���M6\�u�\�����A�\�\Z�\��wb\��\�8�Q\�y¼S\�6?:m��\�s��7\�ؐM�\��ЈM��\�\�\�\�\�\'`���\�\�\���$\Zm^�	�Bܓ�\0���\���Y�c��N\�yx����6[l#�vs_�H\�\� �O\�\�\�^XwK3\���\�z^\�Z^����W9OΛ\�\�\�\�^:�\"$\�j\�9�\�\�\�\�B\��A0��\�[\��]�\0��\�N�\0�X=^[�/\�q]g	���\r\�w��\�jA��\�:\�W[\�\�Z\�=_o]\�5֌�i\�`ݗ��\��b!z/��Hf�\�\��d\0ba�\�V`�\�t�e&\0�d?��\� ^\�\����X��O\�\�>@>��A\�\�\�C\��a��\0�Q+p/\��Flu~\�\�g�mer\�#(^�3\�ꅩgPO㐦T�\��;\�\�`Q��/Y�@$\n�}�1m\n�|�k��\�C1,�\n�g	\�(6\�d\�E\�y�RG˾B��\�\�/}i�\�>��\�޳�o?�\�\�PUߢn��\r\�o6y��\��8\�O�xĺ\�Й�\�P�\�\��#\r\�\�ࠅF-2ڏo\�\��h�&��uY�\�5�?2\�\��HޖV$^V�\'�77\�\\t�\�nؼ\�|_���S�f�,83c��yK�-��X&��T*c�x\�\�c9[\�𸒵B*fiޓY�Z\�\�\�ż\�|vڢ3Ԁ\�\�\�m~P��;�v����SXOg�\�uuF\0\�\0,�Z\�m�q`Үf�>f`�Y.�\�9O��\�X>Ee�\�GQ:a%�@4[\�\"�\�ǦP\�	\�\�\�9\�\�x?A�\�B��l\�ӣ��Ef&-晴�\������8.X\�뷤g����\�\�\�	K.L[j�c	\�-�,\�Ԕ%h�I�Nr\'�-4\�\�\�\��\�\�Ġ\�h��^\�W���a\'5\�\�D�nCRw�z��-4\�\�\�z����7�\�.�5�u\�޵pn-���ق��\�PY��v���\�G����[}������\�\��>,�At\�\';,�z�k\0jD�o\��4��@�(1,B4!HAAi�ߛll\�\Zw\�Ds��8���\�\�婮F�D\�n\n\�r���\0p@?\�\�|}��\�yv�ז��+��j�\���6f닓��\��u\��\�d\�\�/�\�\����\�\�3\�J�\�\�7Z� /:?>\��\�\�˪�Y���_d�`u/�ǋ\���з��!#_+V� *e\�\�\�̷(��\�8Jy�\�9\��\�+\���O\��\�\��|��u}�Gk\�\�3_\��ed|u=]q	���\�8\�1�e��m\��3�\����賀o\�\��i�\�虶\����\�\�,73d\�:R�E�J1�\�-:\�d��F�\�*\�{;\0��Wg7���\�\�g�@�#��NZ\�\�\\`\�r��\�\�1+,�l=����5\�\�ٰ\�k�vc\�n\�l٭�u�y�j�kK��^�\��׶bAیm#�h�I�\'�\�b\�B�>�\�.X��43o��a�\�q\�\�޾&\r\Z�E%L\0L\�FHpKtv?\�+\�,`ÖAndt�+\�B��aA\"=M\�D�(�a��\����\�\�љK-\�X6\�Bp�N2\r+LXi�L[6<c\�\�Y[�\�\�J��䳕T\�V	hk�\���mG\�t4��V�\�v\�gɰ\�$#���\�&\�E�[,؊β�9ü%	~��Q\Z\�07n	X)6=`ѩ~\�\�\�s\�\�sF�\�\�\�jΑ��\�=ML�Zbr��D�p\�!)��f\�]+װ��	�	ޱ�.���Ybb\�3�<4:d�1~b�\�\Z�%\�od�8��9��aˍ�\�2}a�\�`\�$R;�\�^B&\'g�-\�\�)�O�\�^��4\�E�Fz����H@�uw�\�Q��H_/ֳ�`\�haU���\Zm��t�\�\�7:`��p�e\�	\0��� ��\�\�Q\�ܛ�!�?h_?׵���oϽڊL\�&#8i��S|Ǹ\�(��\�z\�d+K�\�\��2�\�j�J@\�`��,h���4YxP��E_c��!I+M�S���y��8%�s�̺��\�Z��Қ?�Ě>~Ϛ>�К��\�\Z��W���Y\�P)R�ވ�\0\�s\��Y��x�\�\�A\��c/ϧ�\�\��\�Z\�g\��\�y\0d\�;�LZj~�\�\�\�\�f�I���%�N�a��>nX/�\�㝰\n\�\�\��\rA�i�6\�SÖ��\0\�\n̶]�MX};���l\��\ny@�jG\�v}�vm\�nl\��\�\�[�+vmu\�v\�>@��l+\�A\�΅m#�\�x\�rѨ�\�aK��X\\�Y�\�\�\�\�EI`d\�\�cS\�\�S�Y\n\�\'\��8n?̢�\��\�Z\��\�\"�|�-�0\�\"\�\�&H�a�\�\�\0\�cʖ��+\\\�\�\��\� \�\�1\��\'-��Bl\�֓~�p�v&b;9\�+���|ʮѮ\�v��\�Am{i\��S;\�<�9\�\�\\\��\�\�W\�\�1��F�V�-\�\�\��3�\�7s\�4�.���\��Nd\��0�\�^(HôA:AX\�>í�R�f�{��\��02,������Qx�\�^���i\�fa�$�%\n`3�|~\�2<�\���\�#p\�\�O\�W��f\0 �\�c\\�\n����>7=�\�F:þ9���\��\'\"53���\�\���He�:�*�̒��\�D�\�8��F\�\�<���.\�/���b�~[E֯	\�0��\�\�\�=,\�G�7yq�~\�6��b|�诠r�(�v�U3� ��ac�\�\Zy�/\�j\�����k\���ac�-��\�Lh�\�\�Q�>\r\�\��}\�\�E�O�\01�Z\�&���`]\�|��j]����\�\�V�������\�w\�^vU��ј��� \�+`��B#4�Ԡo�\�f	\�\'\�a�\���I�	MY>0	����\�@:32&\�\�\�qC�\�C�\�ݜ4� \�\�q\0\'j�\0,����2P�b�qn\�܄�\���m\0�m:\�A.aG�Y����[\�+vF�\�o\�\�\r@~so�\�v��;Aa9\��\�\�|�߶\��{\0ᠰd���\�\�s��O\�f6n�x��O\�;e��1�t��!\�Bѩ1�g0���[\�(`:wH\��3�\0�_h&p�\�\�&}� \�#����?$�:\�G��\�E���0�\�1��\�\�p \rsA1;�.�b\���\0z!i\�WRvs5mwֳvo#gw\�rv��f��N!\0�A;X\��F�眍��ŵ܈��B~[�xm%�\�p�W��M9?�gbF���\�\�\�ŠF\�؂<�3\�{r�d�!�9��2�\�K#�33b\�^Xq�`�\�E`\��7�eze��y�\�Zx�\0M��m�=��<\�\"��0nv�k\0Ө�\�$;7\�\�\�\\\0\�\�\�?�R׏@��\�\ZE��Q\�!2\�f�qT\�\�\�\���\�i\r\�u\�\0sy_X膝�l�\�5)(\�wp\�\0��\�,�_��\�Q�=\�\'PT��8��\�\�9&%��\�5as븖ը�J��)��\�\0k�-`7�0w�[9?J�Rio�F�\n\�\�Fg9��\�:*Q�\Z@��yT\�lֱR�^%6Pz\��\\�\�\��\�\����y����Ֆ|m\��\�\�H\�e�\�}�\�Dh\�qO\�\�X\��\�8\�k\�b(�(�\�\�Fd�3�\�Fv\�\0~N�G^�`�\�Y�>�lSK#Ò\��-N[�Ÿ\�\�n�#\���eȲ(\�2G\�\�;��n*BG���\�\�,؝����n�\�\�\�!\�\�oz��m�]ﹱ���|��;\"s�21�VSvH�\�\nvm-o��\\\���$�\"�7s¡�Q:�$/RW�\�N�4�P�{z�}�K�\�F~!�A\��.���P3~Id[r��dVQI��&At#��F\�a�\�\���F\�ax\�	�\�_\�p\�y\�)o7\�sv�\�\�\�\�]�\�<\�	��\�u�\�JԮ�P:a\Z\�Wc�?εX�=�\�.\�a�k�͵\�\"\�m`\�\0���\��YX3\r\�\�8\��D�.�	�Y�$�:�b\��\���-\�����\�\�1��\0�d�%W�#4@/��W�\��)\0���ɣe=6\�W;q�\�q/v�e^@+��	��g.��\�@\�;\�J\�y\'��I\Z\n�7\��yJ\�&\�`�\0�\0%\�\��\� �=}\�ϻ� x\�\�\�z��=R�{�LX�v\�^[�\���퇊�~Q���:��\r�)\�o+\�a~�� \���j�\��\��\�Wm��\�f�V\�\0q�\�v^���K�\�\�ӗ4��\n�\�\�\�+l����6����oD�\��U�6^QjCe���l�؈�Rk�H+-���Rh���\�Z����-6\�\�,\�j,\�5ӵ\�bճ��,603\���\�[\�o�\�a\��ynhЋɓ�>��\�\�)d��aL�>n1|\���a$~�\�R|�`\0\�u�`*X\�0��f\�&�v�\�\��{��\0_�\�\�\�\�{�;2�\�v�\0�\�$\�C.�] �Pnn\�\�\�2mŮH�\�\"\0�vlv�+�~\nω�N\�3�\0��?>ׇ�\�c0Gt��C>�Xf\�\�LE+7%@\�o��\��=|�Fh�\��#td$�*t=: \0r~�\�w\n�`��V\�.*\�\�\��\�\�\�r\�\�\�z���\�\���%�[��BP�\�^���\�\�u\�DQ�\�\0$\�z&� )\�L\�ǐ�\�u�=�K\�N��䰻X>=ց�o��~�Or	-3=xY\�1�~�V8f�5T̪M�\�tc\r^^C\�`=��-�\��iL\�õ���.\�k(��H\��\�ۊFl-�\"и\�<VeA\�\�u\�.fm�@�\���R�R��\�ܒX\n��jE�\�-\�A\�P��_�R����\��>7h�T��$�0\���0��`y\0e\�ePCiJv��\�o\�\Z6\0h\r\�U���٫�6S\�\�*mQw�Wa�*dw%@/\�Ͳ�׻iO|\�S2,�\�S%ty5����\0zM}�\\9\�c�^�F�\��ի6\�Xo�]-6C�\Z\�3ϰ7�n��4\�gq�I�����L]E��.rM�A@C�ǸQ��kH1EZ\r�hPF�]�<)�A|\�Wp�\�\�)\0\�\��\���t\"��\�	I\0�ΰ���w=ZI\�m�\�]u/�;\�\��b|�~�\�^x�c���w��f\�n��7��[\0\�\�s\�\�<�w�\�~���\�T\��nF�]�i.\�4�w���$=\�8�0!d��4\�\�%`us�t�\�^\�@ߋ$�.t߯)�~)�z\�W\�k�mY+\�opն�|�\��(�t��}g\�\�\�\�\�P3w�9�-�熥���\�Nڝ�%^_\�|\0��3A\�\��\0�\�5��l��&d#t�(\�Y�\��\��^u��RsQe\Zܓ�O�\�\��v�\�jK\�M�f\�5��Ϥ%�\�H\�lM�\\_\�76t�\nt\�-D�g屟\�g#v�\0|����C�\�Av��\�s(6/A�o�\�\�*�\�5Ha/\�wD! \�Al\�V$d\�ع\��4\�o\�i����\�\0K�x�U@��iKЋ\�W��E/���_]\�\��\�\�	\�yOA_��j\n\0�\����%��\�F,q\�\�>%�����l\Z\�\�\�_5�<v`\�asw)�^\�\�Վ\�\�\0��WR����W4\�\�U\�\\u�\�V�\�d\�e�|\�_����m��\�\�\�\�\�\�j�!\��İ�!6���\�:V%��4}/C_̢�\n\�y���|8��\�%a��-�T`\�SC�5\�.\0\�R�?\�cR�	�t�\�p�\�\�;ұ}�\��q[\���\���;b8�|i\��N�w���x��k��h\�]۲\�\��\�,�.@\�\�\�|\��w	 w5.��E\���6sH\��{D��\�u\�\�Թ���P�8��K��\�F�a��\�>�i�\�b�d}�\�\��{�ؗ\�17P����\�\�\�\\C�\�&�{���(��\0\��9\�G��C�#�\�\�q���\�\�Mٽ�8!�i�\�\�\�N[KڭU\�r̎�!��\�@�\�x\�my~�c\��\�l\�H;��s\�\�|8\'\�Rđ����&���5[��<IfI{:��֔��\�s\0W2^L\�Gͅ\0x\�n��\�X�$-�e\�\�c\\��-/\��.\0\���= �\�\�\�7���cu�\"H�����\�C\�y7��I\�\�.m�QRX���c\�7��\�g\�T\'�\�\�\��\�^A���_vM��4\�\�?<��\�\�\�c͊_�xEy��G���\�7�\�\�ue\�!\�g\0�\�UX�	�ߥA_X\�19�\�-7_2\�_\0�]\r\�\�nD1b\0|��\Z먴\�*�B�\��*/s��<f����l�^y\'\r|��~���QZa�\�<\\��\�L\�\n��t&nK�%KC�y�Ez)`q\�\r^Ј�*�u\�I�9\�-���~\�I�%X>)�O7��?�Fwax|qƌ\�\�b�)n\0ی��\��\�B�z@\�\n�;f?��#:��M{t�i�y���uڶ}�\�^���ޅّ��a\�;\0\�.����G\0��\rpM\�����\�k� ��@!�\�C\�\�cA�Pt\�:o\�\�̄X;6�b�Q�k��\��������-�\�\�q���P�\0~\�^2W�\ZV���°<��\�2��w\�\�ul����\�\�q\�\nv�8\�\�~�sɠRv;}\���i��\�vo3mw~�s=�� \\(8&�#\�?���\�7.��O���\�۸�x��z\�[�%Ǜhbz$�D��\�.ha\�\�\�E \'Xn\0�-~G`\�OP\��\�`�q\\q{@�z���eݱ\�\�R�B��G\�&࿱\�1B@��8���0\��\�|\�\r�Ǎ<�\"��	h�~g5��\"\�[BU��+�F[D}�p9�~z�\r�+\���%\�\�\�\��\�\�u\0�@\0\�ϩ\�l�@��\��\"\�K\�?���1#� \�\�s\�qH!ԭ\\�\�ec*ik����l�M\�h�\�{O%���\�2؝ �\��z�@O`\�#}؁\�\n�6d\�j�M\�\�\�.����\n����\\\�\�\Z-�\�\�\�Zպ�\�$v=\��[��@[�\�\n\�2��\��B�\�D\�Nl\�	5�+�//\�\�a\�\�\��0��n���%a67u3�閔�\�#b\ZrQ+�\"�B\��VL�.�-�^�V��w��_���t�\���=9ڶ\'\�y��i?\�ء\��-d��=>�\��a\�b\�s��\�q���t�k5s$m/uS\�c\��~��\"��4�\�\0/?? 墄�@�$n���qCjn_�/�=Hܭ,�E�\�\��/5c�+\��z��~o�s�R.b����@����\�\�\�[s\�p�kS\�y{��V(6�\�#\�CT���>�\�.7�6\�\�@/�\��\��U��\�F3��0w�-)0�#�ia\�M��9�w�wL\�\�^s�Y�lZ�\��k!0:\�\�x$�\0/��Du�\�\�{	TLʁ����\0uG��R���j��\�^�Ӣ�����\n�	^w�0��/7�-7 �[�\�\�*!r6\�z\�o׳^ۉ\�acp�ff\�\��P(���\�.\�^���5Ix�K��Sv��=t@���j�\�ӫ)_ͥ㆔��\�\�@&�\�OvY��u)\�U�Ф�\�r���UtZX��]���:\�\�ȼ�\�X\�#㕥@\rG�kP�\�\�J\�J\�\�+6S]�\�l�З���*X�� �\�\�vٳn�;\�\�vjz\'���[+J�\�\�\�bP\�\�P�׹�{��F.n\'v�g�\�\�_ ��i�>�e��#�a\0��\�\�@��o�\rct\"u�����L�C	I\�-$\�a.榦��g\�&�Qy��\0��?�=�!�\�\�?n\�ڏ\�\�E\�_\�u�/�@�b\���\�юAok\r\�\�\"〒s�y\�\���h\�ASv\�\�k/&\�z��\���@\�O {\Z\��ls\r\ns�t�\�\�\���蚞Z��5��)+\�Xd鸚�Ò< 8����\�|\�t^\�\�\����˜ǲ=\"@>B<\�=F�?F�<\��\�؀G;9{�\�\����1az�~;\n\�5s�A7�~\��%e\�=�E�)Sn�\�⚗\�\�;/\�\�}m����-\\X�k�#�\�%��zx�s��u\�\�0\�\0��\n�\�l.9K�p?�m�\���.�d+\�,\�)P�V\�m���|fM�\"�%P��k�>v\�\�J\�n\�on\�\n�[\�\n,t삏{\�[<\�\'P4��fh�6�\�F}¾\Z�,\�_�Z+\��B�׵�+��07\�%\��\�k��)��\�\�����\��Zi�r\rV��P\�\"-C�W���2�\�e\�)_���\�ʴk\�F�p\�kE�����{��T#\0h\�l�[\�x��\�ה�M3՗l�\��\�Mi�E١K�\�,j|�\�Ξ��\��P�R�\�\\gȁ\��\�=Z嚺ٮ��8($�eA\"�XP��\�5ߪV!\�̍�\\�8d.d\�x�>���\�6�]�)F��v!;�`\"\"�\�^§�o�\�w�\�\Z��G\0�?؏o\�\�#��qk\���־�\�\�.`߁�\�\�%ņ\����@�w\0P��)(�����d�g���\'&`���\�bz���y�SY\0� 6\�g\�\Zm\�\rRvYX� bEec�6�\�\�ϣ�\��3\0l��\0�� �`��D�v3\�\ZX�6^^,\���\��q^��\ZA\0�?<����\��\0��~\�\�{\���?ާ\�\�\�{\�#��\��,�\��4@&\����Wv[^�7\�\�\�h;�E��x\�~T���s������\�L\��Mx�ѱ\�\�\�窄�U\�a\�\�^翏4�8��t<{i���Ǉ\�\� \�k9: \�{\�\�\�n�\�K\�\�}\�J�\�w��.A�/�\�V@Yӣ3\��4�\�\�\�m_�M\�\n�˞[G�/\�\\S���\02F�?�	\�9^/�����٩,}A�?���z1�\�7�\�U\�J;�M�� W\�+\0�\n,^��\�\�\�<�����כ�\0u�Z<�Z���\0~�A�C	`4�\��^�bl(�Y-���\�k.Д�5Q\��4m���\��ׂ\�\�9jE�\"����=�\\�\'[Y{�\��}ڝ���8�S\��H�\��i\n\�dQ�q;�\�\�j �ǼKCT\��\�Rt���O�/\�&���C\�?\"���N.\�ƫ\�\�\�ڵ\'��\�z������\�\��~�\�\�i�U:��>,z\�\"�zF`\�\Z\�\\��_u�������,��x����悘�|ٕcЧF-1\n\�\�~\�\',\�B\0ЌŒR��5eه\�\��ȫ5\�\��N\�4R\�/&\�\��nZQ�؝b\�x\�\�\�:�\�|\�I���\���1`r�E zS�=\�\�=�}�G<��\�\�e5r��t\\�\�\�\�\'\��:5\�\�y��\�Z\��3���ӏr\�8�q:2�I#��~��\0\��z\�\�\�\�.	g=<͵\\@b�܀u9攆T�ғk\�\��t�v�@%K\�9�Zp\��`��?\���ׯ\��\�4�\�%H��>���+����C@��\��&\'	8�x�)��\�Z���1^�\�q\�vt\�X�\r�)`J\�\�\�tTk��%��=ex^�\�\�|y���~\'�?l/_��e��\�~��iG�\�Nd{{)�W`\�KΟG�>��\rV�l\�\��ʮE�\ZlQ5Z��-����u��6%\�T�U{\�W\�\�T\�9��?�m�\�\�*-���6SZ6\�\�RNa!\�FA\�P���\�=\�\�#�@	\���\�\�ֳv\�\�?��v�1��]@�_�p`/\�`1\� \�8H08N�Ѕ$\�e�a^�����^\�E[Q/љ���+�\n8�G�\�����\��%\�a�\�=���8�yM{�X�(�y��?�)i|\�\�\�.�I\��7V\�\�[\�s/\�\�N\�(\�S�:�\0f�\�\�\'\�i\�T\�6�\�\�(�iId�\�f��,jhy����l{\\��wmY�4	�\�EV>���\�c7P�sZ\�q́޵\�z\�\�8/�\0���\�=\�xG�\�ǻY\��\�\��j6�E\�\�%\�j\nM���I|�\0\�\�}�\�Ǹ?\�t�N\�i\���v7N\�\��R��K(�%^\\��k��\r%\�\�q�\Z`�\�\0��\��`\�\�%a��k�$\��\��0\r�D�SsJ\����?؉\�\�|6;��a#|_Ե{\0�WJ\0i���\�0}f��h׸\��(,�~;��\n\�\\��9�����\�	X\�U|��]\nH�^\�\�ҿ]FM��\Z�/����\�|M\�\���\��&�)\�\�\�U��v\���\�����N�K͕�\�\".���M�|�\�\0�0��*�^asuH|d�,?Qw�\�s����)�\rw�\�ŵ\�\�\�c\��L�\�fz�M\Z7\�\�\�Q�\Z�y�\���\��;q�_��ߡ���gm��\rS���\�/�7\r\�uQ\�+\0��=�vK0\���\�W\��^��\'\��%i5P��\�;��\�\���\�`���\���\�5r\�\0^�\�O���k��47�/\�/`\�x\'�W�,�#\�\�\�5��v{#�|̸��͘�0\�,��K�ȟ�\�\�ʿ��q՜\�%�)\�|\\\�G�}���s�\Z\�sM\�)�e+\n\� \�w���\�!`8��\�H�K\�;�F8\�b��,�Y�\'77x�n��	�E����\�`�@�z/�h\�\�h\�4T��ֲ�>�\��\�~+�\�9\�)�- ����\�i�\rO*���\��;\�G�$	r	\\bH�X\0�C�H\�A�\�\�|or�wVb�����	�1�w	��\�{\r\�	�(@���x��\�=q\�/բ@AۧS\��\�4���\�w��=X�V!����y��\�n\���\\\���@�\�qm*]֧�\�~\Z>^\�x��\�*��\�2��[��O�\�\�<\�$�\"\��\�M��k\�\r�i�O�!��1\�;4�\"n\�^Kj;r�\0$>J@M�唖뀯�;޳�\���\0\�\�k]F��\�x�|\�e@~֦�\�\�x\�Y�<c�W�CT�ķB\0��\�f-��V\�`\�m�%\��\�f\�M�\�\�\�\�I��/�\��E\�\�\'nK�\�v��+\�)N\n�/�s\��*��E���B ��\�\�\�{�ڏ+{k\�\�\�j��F\ro\�D��\�bh\r\�=�g�|�\�������\�[�\�.o�\��G\�+<F*�\�\0��! _ ����\�\�\�Zv��^H\�Y\�HC�\�\�ִS2#\�V@<R�\�5�\��\��\�����^�sSK 3\\M�(g�Q�\�~&���\�W\�v�sV*�T�%�\�\�\�c\�y\r\�\0@�\��\�]C]��\�)���gp\�����\��\�o\�+\�G\�ɫ]\�F\��t�[\��\�f\�\�\�t�)�,>�]i\�:\�`�R�%s�0y�\�\�MKFS�{\�\'�3\n@�\�7#\�Wd�\�<�{%`�\�lw�\�w\�G\�\0\�b�c\�?Ls߲\�ObO8\�\'(�\'��\\���<�f�\�K�=\Zȋ9ƿ�����\�i�/d7����Aй�AUiNkUdz�O\�\���u\0\�\�\0\�k桸,VyE�^|��=@\�\�\0�Rr�\�xjE\�\�\0�\�Q\0�n�\�	r=��oIK�5Bߤt\�\nk\�\�~\�\���i��\�P�K˥)W���\0$\�	\Z�\�J\�)�y<��^\�Q�~��Ԧ�\�xO3���o��v��X=\�_Ӟ�QNw\0�m~;a7w	\�X�\��P�R\\�w�\�\n(��\�Z�\�]\��B���Z&O\�i|��xd�\�Sx�,J`Oy�M��\�\�h\�@\�佘�V���\�����#�w��\r\0P\0�}\�\��\�\�?���`�\�c\�\�E�S�\'\0�	�y|�v�\�`\�&���\�\�tRx\�%%�(�+\�0-EMp.K0v@�4�HG\�(�\�wP2W#��^Sz��V\�O\�M!\�\0J�\�F\�+�D���\�yo��ǰ�?Q1��\����\�]\�5��Ê\�\�\��\�{�\�\�k�\��\�\0?��\���Ǜk\��y��\n�{�z\��[\�-<�\�ZqZf?���\�$�)yFKDב��I��1�|��u��y|�t�c:A+\���Ӥa�$\�A�W\n�V�)\�G5\��\0o�n\�2w\��\�+^�\�#��I\�^�\Z\�(\��I\�\��#\�\�\�?\�\�|?��\�}�գ�p\�y=�B\�\�i\�\�\��~?\�:��U=���p[q+�\�\�TaFl/_O�ը; \���A��:Q�SO\��\�}�)\�5m\'i_��z\�ߔ��\�E4���c�J`�\�@\��g�,?\�m���p%\�\�T\�Di�W-\��\�|g���F\�%���\Z �\�>5TB/͍\0�6@ߨl\�S���H�\�Z\Zj���6a�!\�~��@kՏ�\�X\��2\�\05�`�kO_��k�\�a\�o��\�-ڐ\\�A\����:�\�\�,��\�DE�/V\�J���\� \r\�X�oh��\0�u�{KT~N�-�\�Tܿ@O{\nz���S\�\n�a���\�\�o\�#�tح8�S\r~@z�h \�Mw)9�w	0�;\�\�4n��\�zd\���i\�?����G�$��\�cRLG0P�\�pk���\0�@Mc�gaz�,#\�1;x\�\�\�.\�\�-w���\��׭M�����~_r\�?�\��	?�\�\�ο\�7ni\�Rl�ඌ<�\�\�@W\�\����:�\�Z���t�\�϶`�-Mi��`(:��l\�2\�\�\�,1!�\�[d:\�[�{�!�\'	ު\�\�\�$��XqM\�\"#;Lr1}��\��\�|�\�E{\03Ϲ=A�<�\�?ãT\\\�s�{:\�c\�\�	r�G��b{΃���{��	\�O?\n\�#�7W\�<WO�ߢ)�/���S�\�m\'����\�\�+�|�sV[\�\�\�k0�ө;1�\�ǣ���>\�\�k���/\��ޥ KH�\�ZM�t5�Tm��O+jJ͇<^W\�K\�7�z�\�|�[B�b��\��#\�]U!\�\0 �\�Q\�M͕\�L�e�Uɬ\�J�S\�\��z�@�\�Op\�\r\Z\�@\�\\VR6\�w_\�P�!Qn�\�@���\�	O�R?\0�w\�7VRn���(A��0\r\��x�\�4��\�\�M�\�\��A\�\��~\��TZ*�Oi��\"&g32��\�5�pcv������MSt\�vz\���a�\�=�@9�BG\�8V����[�ػ\�L\�\�D�\�r�\�\�\�l��{\�j>��\�\�F\�k\�pW��_��\�)K#�\��Z_F\���\�Zm\�\�K\�hJRI8\Z嗧ժ���j4e7;\��v\�J�8�Un�-䷒��\�س�\��\�{{�߷zX�~g+\��\r�\�ً\�\\�G�\�c\��\n~R=؂\�DR4wQ1\Z#\0\���-��i�F)�\�\�\�w/�U\��\0��\�\�|���\�0�W�Hs\�X�Ia��e9O�\�FT�Ţ}\�\�S	\��\�@.�T��������\�\�=|�\�)�\�Kq����\��F\�\�\�|5\0�����`�[�dO\�\�e\�FPpK\�\Z\�\�\�%\0\�\�n�hJ�\0\�ӹ�}^��������\"\�gl\'8M��\�\�\0\�\�JŃ��S!�\�c�z\'�|��F�\�5\�T\�\�+\�\�t|]3\r\�/\�\�QJi\�s�6M\�g�����2\�~�Z,U�=U�mF�79\�>���ʹokt��Z|\�d=�\�\�.�V\��\�9�C`U�k��\�f�m���T\� 75j\�����\�Mq\�р\�*\�B| K�$.\�pH\n�\�1{�]�\�\�\�Q\�çm\0Ԃ�e��4\�\�O\���Ǡ\�MxZvj`�u��h;^��Τ\�\�!�0\�歯啥�D�G\�==lv\�~�\�\��\��\�iO\����nL���XL�P�\�拾\�ߦ\�q\�\�`y7z�\�р�<3R�\'潖�s�یl\�\�/\�ZvQ\�\�\�\�`q�T٨�1��M�t\�j��^_u��R\0\Z\�s)��\�Yێ����\\$\�0�\�S!\�9�\n�7a���2,v�@�X6L�^\���\nr�oh\nR�\�M\�\�wax��G7\�]�@Ⱥ9\�k�>�=d\�^wsi\�Va�\�UX�\�\�Qb�VK\�\�[r�\�R\�m(\r\��\�	t\Z�T\'V]�F�v\����\�a��\�Fh\��\�v--O\�Cb\��d}�o�\����GxyM)r�O�?�)\0h\�n?U��\�\�y\���k�\���t\�(��\��l\�\���O\�\�W�ӯ�|�늟���\�|\�}�`	Ы\�MP2^I4\� \�֨f��\����\�\�jd�2�A\�5\nZ�\�\�r�\�\�G�U�ԁ�>�Ll,N��>�@cV��H\�ObC*��J�%�2��\�*�HO9׮|tXl@�\�\����\0z��� \�s4`��Z�\��\��s�\�\��\�\� \�gkUe��[��B�K�:V%\�\�az\�|�6nE\�\�8��!\�_���ˊ����%\�։\����\�y\�6�V\�\��>\�I\"\��B\�j���tr@�!ʤ\�&i\r�\0��X�h\��\�y�hD\�\��S~�2��\Zx�TWj\�\�}:����\��C{�\�}\�?B\n?��T�\�k\�]y\�i\�Þ? �\�`I\�\��\�\�?\�j\�N��n\�.�3v�\Z\�G\'<\����\�I#\�l�x���=\�2S�!U]fi�âSt~��n�\�T��kz\�>�k�\�\�U��6��L,��\�w\�F�\\Z?O\'��>��ʹ�J\�rio#_\�j�Zӑ���\�\��\Z��\�B@O�{pD�\�ͣ=�-��\�Dn7u���\�\�,\�N\\\�\'\� w)Ϫ�����H��\�i�\��f��\�V��)���ZK\�\0�Z�R��j�Erj��Hg+l\�\�{\��\�A;HM�j�\�z~\�ne\�\�n\�k�9\�H�.\�^\�M\�*Y�B�\�G:��&�G	\�9\�<�c\����O�\�kz���P��t\�����\�\��kI��u�\�\�x\�Zn\����Ay�\�\�Fr�\�^�!���57X�lWF�\�;\�\�\�v�:����_c0��\�,��\�|v\�\�\�;��y-��d{�Eu��\ni\�S\�-:Tg�\�2�^,2<�>\�]iK�\�\�F��eT}	\�����\�\�J\�\�\�b\ZՀ�\�<U6K\��Q\��j\�Bm�y\�/���\�-�٬�f]�-L:\�+�!�\�E���85\�S=�A\�\�\�A�T�]�\�7x\�EXy8g\�K~��`\��YK\�Nй�3H�\�VIi\��j�\rͭ�V\�*\�l`L��\��֢\"	\�x�kxL�SJ\�#\�F�\�<�\0V�y\0\��A,zX�!>�\0�\'\�\�]�\Z\0|X��@���՞�\0\�k\�[L�\�\��7��7\�\�\�u����\�\'b\�]e�����qu�T�\�-!�.#�\0o\�\�7Yh���L6\�\�뵄X��R@�9-\�Њ3����=x\�%\�[\�\�Svm5n����\�x�5R��N~�\��`A\�!�?8\��K\r]\'��\�}��#@�X�w���k���\0J\�`�\\@F\�]e*5u��s_&[9d�h����8�j�X�-�7����iG\�\�\�\0�Պ?9ނ\�k\�G�ê\�0����\�\�9�\�\�\0\�@\�\�\�#ϟp\�?���\'��\�C:\�5��Zɟ��G?\�1�\�\�hڏλ�yy%\�\��F�\�\�v-\����0D��9�q3\�\�� ��\�\�z\\��0�_5��lE��&�\�\�(��N[�V�\reQvBf���>*\�\�\�T� �G(__�q4շJ \�$���\�\nr?�\�\�\�{\0}r��8T�o\�\�7_0_k	����E��\�\�4����V��\Z�\�Y�\�\��bx@\�\Z\����\�\0�E{\0T:/�\�T�\�,�\"�r/�w�\�uYx�ج�\\\�ٞ�[\\�\�0����\�W\��RX�i��K�\'�\�	\r�\\C&\�$��T\�v3Y[�\�,=\�\�\�rAƭ��\�\�p�	\�҇,\�%��s\��x\���vے�K\�{�Sxh\"3����\\:\�\�C\"��2ӊ�\��\r\�\�^��\�\�k0\�1~�\����\����\�h\��\�#�d\�\�n\�w\�\��5x�BD\�=<\�\"�;�[xƛ\�\�6V\0 �~?�\"��\����x�Ɨǉ��{\�Z�\�\�>����ݭ��f&��[1?�� �|\\X�\Z%�h\�n	���\�]��\�\��V��D��^�wb{�C܅\r5�\�\r\��p<G_l�\�Wb\�\�e�i�E��n,�\�\�\�m�+��s\�\�\�X�\r�\�א}{�7\0�\�*ƭ�@jF5�\�\�`���*�\�H5,\�l�a\0?@\�\�}���\�\�z�<\�6\\Y:�@\�G\r%�\�6L{�0o�V\0�*�^\�\\��\�0\�Rrw	���9�\��\Z\�ѡ\��	\00��tR����+�GX�v~�\�X�E\�<>�ե\�\�5��\�ԣ�#�$\ZԖO\�\�\�-�@6�rU\�\�I;\��\�\�4U\�My��= \�cGUA7\�3\�j@)�Z���<\�gk�5�ъ\�l0\n|�\�\�\����X+\�\Z/\�|\��k��UnW��\�\�Zl�?_Si^@��ZkL�;9���\��K��\�{-�f���\�\�i38�2�:\�_�4ہo�Cм�	\�b���Y���UOP�\�ٓe�@\�M:\�\���2a�a��!|D��%�p�9@�\�G33����\�@O�E\0�\nj`,\��O�\�\�\n,-�\�\�jI�\�\�l�\�\��nh0\���\�\�ݨ��;�z\�\�#�\��}/+�_\�P���\�	�\�;\�+\�_��4����yzWT�{s\r�\�o }�21;HԈ�\Zd\\#(iY�f&�b��\�\�0\�v��/�H\�\r�\�[{��oxo���\'ɷUF^��{�#祱�\�׷ax%\�l�\��\�G�x��\�_���\���bv��\�\�~�MYy�\�S\�\\UKj\�l�܈�\�Kn��n�J�E\�z6`ג\�˘6j��\�@,�\�\r:i���\�*�\�\0�r��sL\�\�IV����:@_ka��Zdl��\�V#���	\��Y@鱻\��z�z�}W#�+�\�\�c����;R�\�_�F�`��\�[�\�\�#v3�� w�f�\�~O\��7��\n\Z�\�t\�\�<��\�\�`{�\�=�\�4#n�^Kj�:\'\�\�`�\\��*V55Ջ]Qe�6\�L�b8���J�\�6oi|劂\�t%�g\'\�me�\�\�d˓��_���K@�;\�ߢ݉`\�\�K6S�9�ˀ_r0~�Ǟk(���+6[Qjs�������\Z\�`��ԍ\�k�Nu\�}\0|��\�m�2\�Pj\��\�\�:8b\�\r�n�\�8�@k�kn��\�Z��s\�h\�@�����wS�Y\0_��ى{{DO$\�5�9fT�\�o�aϋgMN ׉�\Z\�\�j\�fv\�-\\P�R\Z���ď�\��S�g\�\'�Y\�~�\0\�z�E��ˍ\�R\�\'0��G\�\��\�ڵ���g�\���\���6\��\�?\�\�\��$ݕ\��߫ipf �#��\�.\r��_\�g4��e�7�2{��\�uUD\�\�*����p#th�l��`�	-+妎jڎ�64\\l\�#��\�՗s�ri\�1��F�Cv�Y�9����\��k���:M3��\�~�\�5�\�s��K\�\�ԣ�掟kY\��}��7\�\�Wq}�\�\�U�\"Q��^]rJ\�\�2�\�[�|�`\�O��T�.\�a]�.��Zء���\�\�G7l�}ٴb\�eU�#\��j�瞿�\�<x\�\�\n�N4[d�\�\�\��\02ֿ�����i<�\�\�ңv���N0N\�۵Lڍ\�\�^ӈ�`�\�s~d�\���S��X/U5\�F��$\�9�jC�`\n|r���������\�;\�\�\��{\�Լ\�mM\�\�飜�[>���5$3#n�Ab�k\�\�9�VX�\�B���a�\�\�\�\\\�M\�\r\�\\k��:���Ζ\'�Zv�\�R|F[Cۚm��\�\�/u\�\�\�z/)����6Uw��h̀�\�yZ�#��\�n+��s�6z�MT�Z�����-�\\@(ڴ\�\�7\�\�$�~��������&��\��ڨ�\�V��l��\�5:\���\"�\n-v��\�!\�\�l\�Ke\��X\�\0�����\�D-�8�\�lG�\�(<0=\�w\\Y\\�\'?�)�3�������\�\��00�wn\�OYA\�a	*�t��٭:)�$\��\0`�\�@O�@\���\��WR\�5��[�\��:-�q�\�=����C\�z\0�y\�H\�Z\��\����Te/��1$`\��a\'\�W�Gˮ��K:s\�\�<�\�?�tU\��$G\�x\�x�\�am��\�	�\�{赐\��r[�\�\�#ە3�q\n\�\�Ph�\�)\�52�\�\�-�\�Mar.\Z�G�\�uy7�pk[\�7��\�\�o�R_5�}����Y\�\�\�\��]\�,/B��\�Ȥ��֎,��E\�kE��\n\�s�\��X�\���$W\�\��u0�v\�şj�\'\�3Pe�\�xX\�\�\�Q�\�A|��\�ob)�\�7V<v��\�O�\0|�ΙG��9\�\"\�\�͢|v�~+M�\0\�;*t\�jb\�V�i\�L�`\��t\�s\�ᵪ/�z�C&Zh�\�՚�\��\�6�\�\�\�y\��T\�m�{;n+�	W�T��\\�P\�Jk\r�\�3\�\�\Z뿊htE_T-9<;o\��I�i\Z\�_��{��hE\��\�Fˏ\�Xz�\�x�Hg��צJie\�n\�jؼἓ�>\��\�v\�\�ھ\�\�\�S�]x\0��r�RbSU\�m��\�=g��Kn@m+��\��t���+���r�	@\�\�Vǀm-Ns\r|\\W\�}\��Ka>\�A	\�״�R���@\�\�(\�L�K\�\�\�r�\�0�\niLM��\�d�>>��y�HڧKn�\0� \�v\�o�8\0J:��w\�\�U\�k���\�`\�?\0��n\�_\�g���\�߷�\��\���u\r�\�!�5mW�\�n\n�\�\����\0\�\'��\r\\h:Ky\�w	��J1\�T�\0��?�E\�V\�8��V���\�a:�\�\�\�F`=�O)�ȨĨ*9g-��**��汕�\�\�R\�#\�{���\�OitY\�3\'~ލY\�\�@%��\�c�\�&~]	G�\����pC\�	���\0�६�C�˦�Zno+\�h��V\�\��Z�v�s�e\0ߎ><n\�\�pUy-\�4���ؤ���uӬ\�\�B\�m\�#t�\�VK�4\�\Z-5TO\�=j*�1\�l\�\�>x���I\�K�\�>+ă�\\�\�j!aGt��*���\�\�\�½MΉ\�~��|�\"���17b�\��\���[`F�jш\�+�`\�\Z\�ay��m\�f\�B�{�5\�Fu�~^�-�\�zd\�\�Q8~\����\�ϚЖ��\0�JT�\�,2_�����\���)��$\�j\�\�h0o˰�DM�\�ZP%\�z�\�\�M�!�{�\�]\�Z닻^e\�Ƀk�8�\�Zc\�Rk\r�&�|��\�VX�C;DW�⼦p\0�\�\�\�\�\�\�	�6QYcs�J\�mtS����.����(\�,\���%�\�f<��>�����2\�:\�\�a�`{@��\�\�B�.)�C�Pc٧�qx^|�Ҥ\�g��\�8 \�H\'@��S\�\nѓ�\�\�K�2s�\'y�H\�\�G��:��Z\�txXЭ�SZ�c�M�\�\�=��w�\�\�\���@\�X\�\�(y{^�\�Ս\0�JOu��v�k�BHC\�Q3��z\�O@B�i��ԔvB���\\y��+ђZ\�\���\Z�77\�ni\�\�#\�U*,�u\�bւJ\�\�\�(�e\����\�l^��n�vrS	;\Z�\�s�����]�S��<�\��ܔ�|�pm5賦Ր�\����8W��\�\�F�\�,�%\�Pj*(1n�~�F��\�eϴ\ZRZ|\�3�Wx�\�a\�^\�fx�W\��4�E������l���\�a�&��i\���c��t\�m;���\�T\�\��\�����`\�r\��[���\��?�=������(i�}����D\��IT��\�r��\�\�a\�[�\�V>b�ZL�ښ/\n�\�u\�n�\�/\�_R!R�	����ڭf�\�Z�\�g��A\���\�\�<��wĶ|�W	eZE��\�X�rs�\�\�S1\r\�$ZL\�Y�-<��`UЉ��XG-\�\��W��6z\�\�\n<����\�{-ʡu\��Vg\�\�2�8\�Pa�MTT��wi�\�F��\�\0A�\�T\��/ӱ\�q����v\'�\�k\���^@��\�{���=��0/\�#�5�̺��bK*A4KG�B��\�	�>��\�*\�ń[���<��\�T*\0���(��g�<��\�-HO��rƵ��#\�s\��\�74h�m�`:\���\Z؃�!�\\\�u@\�F��\�JP���\�D�\�ZG\�\�:��*��u�K�jU`�#$g��TM5�Ȇ=�\�Z5��9\� @e&\��\0��2Z?\�U\�?�ħiosM�h�Ј&���\�Cst�\���P_�Ɵ�\r�]�1�䏯�4��E��(�^\�\�Ht�l���,<\r�鼱*N\�o�����\�\�[�\�S�\�r̭s\�\�j?�\�\�\�ɬ\"o�\�\�\�n7�ZW�\��\�t�KNڦG[\05\�\�H\�,�/7\�cy�~�\��\�\�\�`�\�\�N\�m�m�=��:\0���|\����\�?G�H���V\����,6=W�\��\�0:l�\�\�qѾ\�Y�\����.\�2\0\�`q�Q�vSv��l\�\�z,\�_󼶜�a\�2���\�qcs�\��7Gݺz\�\�㦊]J�x	�^e&3�6x}k�\���\0��\�7\0�zPUi��°�\0[CE��i�)[�\�:��JE\���0�U\���x�\n��m�jR�\�YTn=\�\�bl\��I�;\Z\�\�Vm\�\�\�\�>T���TN˯��V�\�\��]�n\�\�h��^�}�:\�5����\\��#�ێ��Sz̽к���\'\�\�oqӮ�X\�\�/m���\�43�\�I\�L80�f�\�i�h=:�N\�3�M\�\�Uh!9��\'(�zM��o�F\�RJ\�nN��\�%\�i\�\��F������: 8B(\�Vw#�{Hg\�y\r\�m�N<7�ߠ\�\�\�07_\�:>��y��!7n;K3�Ӝ�\���>\�ǑEi�aI��8k��\�`\0n�hf\�8�k�\"�2\�4�)\�\Z\�=0\�z���FU�\�8.@�G숀��H�n�|z�̣#�yw�ίrTϿ\�\�\�t��+��\�\�:A��*O^�6�\�H��\0�\�\�q�\�\r^��k�\�n\�\�-\"E�\�Ɯ�L��6Ʊ+�\"\�_�� ۫a�\Z\�\�Y,���+6��\��-V�n�\�.[�鷭�!;����\\\��Z\�)9�E�so�$\������{�@�qOs�\��5ޣ\�Z<���{\�3�hm\�m,\�#�T�?a��c\��\�\�hj�\���G�\�/f���3k9.v\�f!l�I�]\�͛�Ӱ5�\�kJ�i�}Fw5�\����A \�<�(\\e�mĴ�J5�{Q�(��?a��\�UHc�X�ǠO\0�HO+\0���拦Z�J���c����5p\�\�U�}#�\�ì��\�Ͷ�EX\�Ц��\�\�R-��\�v\�\�+\����Ag\�iy�\�|�\�\�\�V� \n>ܥ\��zw�\n���������ע�=���\�(�dOS%�\�M%���M*2\�`m\��\�h\�ܘi!NP\�n�|�j�\�\r\r\�υ\�\����S\��^7\�M\�*WSW[�P���z^��~\����\�\���\�9�w?f��;\�v\�\�4\�\r�[_\�\�Zv�|��-�\0��Y�M܉�Ĭm�`֢ܸy[!��\0\�iډF�E%��w�\��\�\�\�\�\�\�+��l=|~���*	<~vn�\��y���\\d-�\�>r�\�|�V��\��\�ӻ�w�& ?9\�\�Y��f&d]4E�V|M\�{=J��8Z5	z���2\\��G\�K0=2���\�?���e�\�1&����\�tt	���\�t\�\�\�@3\�F�\�\��\�`��\��S_�e��\�Qǵ\�{�m{�\�:>�v\�\���\�B����@>\�\0�\�\�\�\�\��K���\\�A�3������1���{�!��2M��ۣ��=9^�D�|\�-�\r\�{�\�5X�L\�-�%%��\�6b�-\�\�WF\�1\�G�r�\�HzW\�\Z\�i��V\�)����f�@s����߫�5\�Ӱ6\�@\��\��\�jA,\0,��廦mY+P5��%�iVD[�ui1M%���4�\�\�;02��D�k5�\0\�\�4EE6��p�\�\�\��������vU��\��j���jD=��\�7Xy��	�:\'� \�n\���\�{\�Yy�Fw6�h)���=\�Vٷʛ8�a�+1\�\��,![El9�\�=�~��ᵢLHe���x\�r?;�\���X�_C�RYs\ZH�u�s\ry�i%\�\�5�6ń�\r��U\���䬘Y���o`�}^\�\�>\����j\��|�����[�+Y{D�?�*ΨR\�1\�\�l?\0Ezo��\��3t\nd8\�o@\�=���\�\���]\�%\�P-\Z\�Kh=�<;@P~LK\'yT XB�j\�ǘ\�L\�\���\�Z��W�c\�J\�j^�\0��ł�@]@\�\�uy^\\A\��f��Z\�f!�D��Y\���\n�<@�hf@U�t=$�oiI-�-y/\�k��:稠�&h\'	\�	\�_|���\�O\r\�,�[$\'�b�� G�#�\r\�I�QZ��\�2t\�\��~�ٶ\�{\�\�r\'偩�`%`�W��uV�\'��Zީ�\Zv\�ܻ �2�\"�(\�&7�����>��\���0\�ڂS\r�訏��\�\�#`\�\�\�m��c\�	vN��wP��\�j\�\�u�c?\�\�\�sO�*9c�\\Ժ|���EfW��<}�P\����\�\�#�\�\�r߿\�@\��\�`\��[�^\�\nٶ�f\0=ħ1-�i|���n4��w׊9/�\�\�5���F?l>؄,o��U�	E�z���\�i)�\���v\�\�_n��6\�r\�%��\�\0�\���K\ZCІ�\�zd�~=e\�\0�-�m\�\�u��[��T̍P�,�\�#��\�㭌�s�gZ\��\0�V*�o�!{żt�B[k\�J�ެ\�7���aG���x��zhܦ�<��\�Yގx\� t��~\�h\��j�on��\0�k\�����\��\�\�\�\�\���nI) \�\�2�v�)+���\�=\�k��\"\�5~�Z�\�-�7��\�9��\��~�߁\�ax-�Y�)s0\�\rt;�ʮ\�ח`=�\�.i\�\�)0�𪥦\�%��*Ϩ��\nK\�\"�s\ZQw��\�֚e>�.\�1��\�\04rK\�\��z\rY���*s�AI�V�\�q\�\�5 p�v�S<�ʹ\�\�\Z�\�\\�j\��\��E�\�\�cP,XzaΖ�f,26\�	E	XQ\�\0�8�=�lO\��V\n윿\�\�i��Xo3l\�hY���\�O�\��l�\��\�K#v+9mw�^{��\��֣�\�#\�iI�Msƀ~K\�`�\ryP\���dM\�\�H\�z\�zzԮ#��\��%���BP)�;.���o.\��\0^�����ZoO�CG\�\�\��m����M8�\�\�u\�_�ǎ\�	j+(\�e7\�L?���B�2\�\"�^�>�\\�u��ҍ�Ģx��E\0쿩j:�\�5\0�~���\�\�I@�\���\�ࢧ��\�\��\�\�\�\��ԮBa�z;�o%�jCK$�� \��\��\�\�})?�=�\�,���U�\�Z��΢=u�2\�c��Ȱ�Zp\�iL.���̂\�\�\�\�\��>XG%�9��A��<>����ˋ7Wc\0y��\�Z2n˱�\��Z~�\�h�]rx��S\�Q�,syq\�vv��r��*�sF\�I�\�\�]\�,-;\�\0�X\�m\�\�q\�D!e���oȺ\�\Z,O���.\�\��q\�\�lR�8�����}��W\���|\�m\��\��x\�ֱ�%\n�v��\Z��ܠI\��\��Π7Z($ Da���\�h^C�h*��\�<�F����E6/{��>-@\�B\�I\���@�\�\���\�\�˵bW9\�*r�%�	�j��\nR�\�M��\���\Z\\��\�%\��y�P;n�\�JWi<f�/�>\�w\�\�\�6��\��\0Ǯ� �;@NN��\0���r\�C�\�LE|�\�R\��\�~m�\�\�=�H_�c�߮%�\0\�l?g�\�?r\�i\�p���a����!R󁫪\�W����7���Z3cד#|W/m�\�;�=F\��D�Hv\"N�>\�\��鰏֕ۯ�:�r��-����n�y�\�|�¸m�JW��9\rJ��\��8���쌶\��SCV��3�H�q7���m\�Q*��\r\�w}��^4�����)���\04���d�B}\�6��rί��\��	��\�mܝ\�3Ao�-\���ho�6�\�|S�\�5\�vm�\�h�(�\��\Z�A\�O�^\�{\�	W}�-�\"2��U����\�:\�\� C�W5f^ӈ�\���z�U�x�\�\�Y#0s�N\�SM��f񅩄m,��Q:�@\��lY�\�OӴ\0����d\�,\�E\r�� �]���\�!��� �鈮L��D\�\�����P\0�9�t`��R�%\�hYq3���v�YW\�)Ǌ]8�\��C\�G\�s�^\�2�S\�\�1B�\�6�1���(1G�p[?q��3���ˍ\�\�)�ֺi,X^e���ڦ;�\�wI��.AG{���<<\�2�c36\�U\�B\�I뚵�]+�\�ɟh4Zl��\��Jqь���m�)�D�uŵ\�DQ7\�j�J���k�}��\�\\\�l�@/�Íw煥Җ\�k��Z��[\",q	nR,\���1���*��@�\�J�\�\��j\�^EQT\�Y\�\� 볼WUb\��{)\0p\�\�\�XH�U\�݇\�\�\�\�\�k�\rY��|�����\�\�\�U\�%�	7Pד\�<��\�t\�{�{HPxHpx@��\����{�<2��s�k�zyZ�Sl<\�5��(�D�)\�x\�U�]C�ke]%�&VW�BQ��\�G���7A��HA\�\�\�|���a����\��QM⡧\\B��(�rPA-FӬH�W�\�5n0/\�Si4�)�Pg���\������u �;��\�4�@\'\n��@��w�5\�Ѣ\�\\�U�\�TB+��j����2\�뀿�4K�/\�K\�\�\�G�E�â\�QJ����Z��\"S���\�\0/���\�ų\�\�mD�\0Ģ-\�\r=������?ˉgx\�Љ\\�#��Q\�mp�4ݩAEW\�4W\��%�Q.\�M\�\�+\�\��=�~��d�^\�\�2�F\�z��@�k	iq\�&��V,�qkU	7�נ�v\�\r�\�w\�+Ou�5hx�\�u3���%Z��t\��[\�.�\�\�\�Q\�\�K��L\�yh�0�N\r y�ȩA�|53�����\�\��\�0\r��,s}��J�\��\�\�2��X\�ȩ��\�\�:绊bA\����\�\�S sI+�r�����i��@�\�y\�a��`|\�\�}\�\n\�M t�V�����\r\"�:7�#�6\�uK/w9W\r�)5Y\� ��K~\Z�5U�Īh��\��*�%��Ŵ\��\�cc�.}71\�e\�n;�N���\'��\�x�\��\�\�\��>j5�@.\����4U���ʭ��& ��\"x\�\�\�Q S �\�\�`��\�\�naB�a�4��2\�Cs�Mp�K?�#\�t^>�A�bA\�!\�4����z��G\�\��Z4Qi\�[{\�\�g;����}�	��\��\0�U��)�!͕/�Y� ���] �\r��\ni�Y�[�~\r�\�Rʱ��x���\�\ru��\�,\�݁�간��4z\0y\�U�tT;��><�6\�P\� �j�v���}��\�a\�K_Ai�B��?W���W\0~�Y�1ܥO\�E������\�\�|8\r�\�D�m\�7�\�\�߻8\���\��JnA9\�\�d�dn�è�\"��\�!zj$T	\Z\�\�\�)n\Z��\��\�#/\�\�Rwi�8��HEUڹ�i8:\�-d�[TB\'��\Z���p\�Z\�;\�\Z�����\��_\�i{\'�^�\Z\�\n��q�J\�\�*ku-W\�\�u�`�Br\�2T�\�N�\�겸\ne�%��\�\\;�&\�ic��\0���ĕ\��m4ż�\�\�\�\�=�\�]Ԍ���o\\���6\�����y\�\�m�c�)M��\��Q�A�k�\�\01c��\�uђRn\��k���\�Jq�R���Hmm	�G�р�\�\�\��kY��\��2�eD\�>�����\�\0\0�t~TMS���n�Ng\�ε#�\�x+��0�r��4\�r\��\�T*����\��xT\�f\�r\�\�r���m\��\�s#\�E)\�\�����ح$\0�\�\�գd>�\�J�\�:\�k�\r��nnꚨD�<+*\�j\�.\�\�&\�0\�C�ig!������\�.�k\0�8?\�\�)�MKm��^�\0蕀\�F�U\�\�?\��ڢ�k6@�gl# \�\�\�N1�\�\�\�,<�UrU\0�\�ZS\�V)j�����;M\�z�{I}��&�V�<��\�>�Z�\���*�\�o��\�f�I[5��޴L73\�m��%!\�s�5�uS��܂\0��y�kt�߆p\�b\�\���N�\0�J;�RRJ�\r�\�ڂM6K��\�r#�!�j\�$э6�RZ�t3N2�<�¢\�!\�\�\�$\Z\��<x̃��(C8\����u�P\0\�ʹ&�an�oJ�f�g\��#:��/�~��ӑ5�P\�Y`W\��Jr\�g�%\�k\��\�\Z\�\�\Z�P;\\�\�\�@s�\\��8\0�;Q?7qi\'��G{L5\�##H2�\�7U�q&�,\�\�391\��\n�\��F�.	�\�\r\�\�\�G�\�!\�}\0\�\��ڨ$�]\�TT\�2QW\r�kT[Li�J�ЫH5|\�An\����\nF,\\\�QN�\�\�e)\�s=\�9ȴ*m_��������0ʦ�\�Vfjd��Z�o���m�\�dفNˏ�n\��\�T\�z��^4э�\�=\�\�&\�xڬ\�\�<\�Fv��$&.\�3ݻ{ܧ�A�\�x	f\�\�\��\�\�\�5\�����_\���\�(1i\�\�3v#>o7c�v���d�x��\�H��m�8�����&�\��\�\���\��{�Vr\�\�\�0��\n\���\�a7?�}\�T�&\�3�>�J�-\�xO��xzl�\�j\��9�7$�ɭkC\�aw\�cۮ��,�\�\��ܬH�@�\�{ØW=r\\E0�M鸚�kt��4w\����\�\nЯ\��e��\���ٮz�\�[�_�uh�4C)\n���q\�\��\�nt��;\�y\�7�\�\�*z���,��&\�\�68�!\�\�Z\�q\�);\�j\�\�!o9\�\��ŭ^�\�����\�\nf.�|\��?�i!\0�\rC�\�\0^�W1~m^Y�և�\�\Zl����\�\�0	x�[J\�g7T\�P���v�CN\�\�r\���*��\��vL�\�\0�\�Ԫ2�C^\�1=o#o/^G�I5�~�(Y\�)\�o\�}\�}+��	�]�tQ�\�O�ڒ�\�@�i�\�\�0�W\�$Cϳ�cx�iΓ\�\�K�h�d?��C\���ky@=\"x�@\��\�\�u<J`\�&�^1�֋K\�js�#nԡ\0�־qS���\�/\�\0Mr� \�<\��$�`��\�xOL�Ӷ�ND��\��e\�\�-�]����k+�A`�\���(*�\�.��x��\�*\\g�VY��\Z\�SoiO�m�z��Q:\�Tq@��\�\�[\'>\\\0�\��\"���4\��3�3Z\�A�\�pߧ\�`i\�c���ע�v\��__R �@�|\��v�ϋ�`v{�N �g�MG�#ۨ�e#��\��ZH\�l�.+Ћ\�GPt2�LKo]�\�ݲ�����f�	*��9}l���\�ݠm�]���.\n샊\�\�&��y�ˠ�v\�\0V<=\�<r\�\�C0�X^�\�a�0r>��\Z�\��1o�j\�z�>O`� \�g��s\�|Wc����`zԃ\�paRc-��M\�Au\�-�ӏg �E@/Lq�\�7�\�uԞ�l\�\�\�I,��v->k\'(GwЋ\��b\�C:\�v��zl=4\�͚�!�#�~=\'h@/1;d��~N�\�Xlj\�\n��~6O\�Oö��\�`\��5�Fd\�h\�v��Ӏ�﫜1y\'6\�\�s�\�\���jk�k�h�#a4b.y\�\0\'�\�U��\"�F�o*�i��b\�L\0 ((\�&\���~��%�\�\�\����/�6;jn�/\�8%Dx�x��q�J��\�\ZL\�\�8�%\�c\�\��i\Z�N��RN\�\�\��a�k\�\�C@�\�M\�4\�>��@\�\�*5��ᑢ57�:����D\�nb��\��x�nC�\�\�q�\0\�al\��C�\�\��mo�m/t\�\�<�3\�V�kc���m�\�k�4|k�Z�Yy\�fJ��y���ʦ*�f��鲿\����\�\�o\�Su\�|\r�-H �\r\\\�t6~gi��8\�&l\'M�!\��ws00\�s� u\'3Ql��6�\�fI�i�\��i�G\�.r|�\�\�\�A|خ\',.�\�\�q\�\�^�[>\�Q�\���\�Xk 7����65U+90\����]\�\�\n��<�����\�b$;H\�\�f�n݁\�\�uVH��۪�K\�ZT��\��\��t�>9;\�\�`\0K\��^�\�Z�%\�]����{\��\�nn^�`h�o�@�\���\�\�BO�y�\�ӆ�o�5Oc�\�Цh�V|~\'�^��\0�iv�?\��{�a�\�$\�򢠸��&j\�X�\�4���n,\\\�\'{\�\�V�\���\�\�k\�\\\�#�}.�:\��֝#_W�*�N[^��yI}%(h$\�;\�湋�\��-��\�*#\�[�\�\�q\�\��YS\'l��/\'j���D\�-��(�\�r\�5\��<\�q\�\�If?!VG*\�\�7��ђ\�bCBJ\��>\�~rCc	�Ki�\Z\�\�\\����T�^ ]i�Rk	F\0>���\�G�(c�Y싫�\�{TO堵`C���T\�Ƿ�l?��\�_�\�h��ַ����|�r�s\���ܐ=��Og=S�5�r��v��CX����\Z��@�m�\�*\�Ԍ/Ň\��\�\�ga\�z[����J\��[��Ē-\�,T��-T~l\�\�\�@\�m��\�6y\�c;�|�\r_��\r��\�\�ʾ�\�+�\�\��Ol���m��Om\�\��9��\�;���a\Z`F~\�O\��q��9\�!;��\�1����a�׎\0��؈E\�t\�\�k�	;�B�\�[�\�\�\�>:p�m;��^��\�\0Z\���(ߋܗ,��BYp�����cTu����g;@��n�\r`\�\�mz�2Z�EX�\�/�v�q\\��\�\���y��,��  ?�\�q��}\0_m�>��j��(\npЖ4e7\�\�6�p[R�,Vg�Ŵ�y^\�.�w�\�� \�azgQj��\�(�_#�\r\�ؾ���\r��	\�R\�\�|�(��\n�/�-e��\�\�\��i�ւ+WKA\�\�I�,\�\�u\�\�B��4�1�\�n\�\�\�;kT<d�\0gɺ�\�b\�r����\�:\0ўf5�a\�7f9Z\�Kq!\\\�t�[�h\�_��T�>[�\�\�\�N0\�r)�H(�\�&*b\�?\�\"��\���N��\�&i��\"�\�8\'u@�\�\'\�餵`h�,-8\�\�G�s�r��XU\�[~ԃ�������\Z�$xe=CN§4�/\�\�\0xZ����F�\�(�@�GTr���h��\�r�\��4�\�~\�M\�%�i�\�&�_A\�\0\�;t\�\�#��N�M\'ݢ�n�\08Rsg�\�6�:lm�\�V&�my�\�R�\0\�\����:��h�7�h��%\��j�,T�g�=����\�-�Ӌ\��\�\�\�˷��OY�^��Ok=����?|h}\�}f�U��\�3����M~\�g�p\���\r�\�\�k6��7m\�\�wm��x[�\�Bz�\�\n���1\�b��4�Z�m�:`CZ�\�!�L\�A�\��}\�\���l\�;`[\�\�5�\�l��\�\�\���|�\�ֽ]�v:v��/�cSP4�\�h�\�Q����\�\'\�\�\��#\��Ȍ\�Їv\�W;!ͷџ\07/����j\�i\�mn\�v��\�s�\�J\�).�UP\0�0��\'�zA�	W�f���\���%\�3Zm��\�ݠ\�\"�_\��Z%\�\�˫�h��\�\"}\�ν\�b\Z$Q��N��Q�+\Z5a\�m���Y�\�j��aɚ/\�|\�%\��1�Ef�높[�k\��L;ﬅP\�*�\�C�Y�������M�^��\�N�}\�4Z�l���\��\�\0]\�zM�/�^�\�\��b�\�E\�f\0�;%3�\�:`؎S$78�u\"\�:?��´}�\�T7$�X]Pm@�}ö\0\�6�aG* <C\�frS�ŀ\�\�kX�CW0B�ص���\�v�\�*H���=�\�.�S���/lԴ�h\rf\�\nT\�\�b�c�\�xl�Z�k�?�\�w\�\����\�Yչ�\�S@sm�s\�\�\�0;�Q��Vz�>�9z\�����{G��`��\�[�n�\�T�\�\�k-?Xm��JK\�ŗ�\�[�����Ϙ���H��m��]/yצ.�c��O�\�\�\�6{\�=��\���\�e\��\�9k~\��?��U���U���ս��5��k~�9k��uk�\�\�\�u\�#\�;�\���\r|��u���u��;k��Y�\�s\��\�K\�E \�\�\�cW\0\�l���p,Ɏ�\�`�\�K�\�+�\�P��F�\�F\�t\�\ZZ-\�\�d+�\�\�X���u\��h�e5=\�j���]�\�\�Uλ\��S��E�d9�,�-O\�ۖ\�\n��M0P\�\r�.��0\�.}DVA�h�>�\r8��\\W\�\�f@�V(�J\�)\�~O��en�\�-�\�\�֮��\�\nkj\�.8L�	������\���\�Ӻ�4ABٚq�\�k1?}��\n�_\�׻��1\�\���Ȁv@\�t�*$��-�\�A��{�,I\�\�k	\�l}=_e����~N�o�L�h��J\�\�d\�V+L7٪�\�\�\����)�A\�\�*�]@\�\��q�]?�\\����\�C+wy\�\�IN\�ͦ�/\�\�^���ć��j\�յO�Sл\0@�\��_r?�l=��Å\�\�n+ϝ�&\�\�t5\�\�\�\�\�\�\\��+\�����[\�\�R��\0E@\�vD\�5\�\�)���S�D8����&\��jZ4���5NL�lW�B\�,�ԃf\"6	<\n>kH�e����bq����\�5`�\�<�6,KZiȀ�\���N�\��{�_|�c�ȡ�|\�\0�:M�\�\��G:F��\�b�˨�\�\�-\�{\�b\�W`�o-\��g�\��\�J?��oN\�ȗ�\��_i_�\�_�i퟼c-��l͟�\�Z>����\�\�;��\�ӿ�\�y�\�ϭ��W���]~\�]y�e+y��V�\�o���/�\�g\�ꇿ��O_�\�?�h�\0�񃗭�m^;�[�:�\�����������U|��5�\�n�@\�/\��_P}\�\��~\�ƾ:mc_h>\' �\�檿1_\�9\�e�VW\�b-\�\�\�hі&5\�s^5\�Zc�\�\�6�\�\�\�J-Ђb\���E�&]�\�+��^�u,\�\�l�m���0\��B�\�ҏ,�9�-�\�\�o��\�G`�\r%�y�S\�ϵ\�p\�\�hby���j��|Ɛ�\�bz��1\�\�\"�E�jA�R��i\0����\�/JE\�^�\�\�)֯m�L[P���\�j	m �\0}��txE�\�`y\�|�\�*\���F���\�\�궰�#�\�#\�Ug\�\�\\f��+j�j	\�o\�zp-{!Y@��㼮�\�\�^�\�E�oG\'l��k�r\�\'6\�\�*��iȥ]$�XPlE\�{=���z^S��\�\�:��\�ms\r��#\�\�o�A[\0L ]\�\\)@\�ζ�6��戻lE\�����=\�텗�,�h��2�r��L�1���(�o�h�|�\�NX� 2-�$b\�\��Fp���紜r�c\�~l�Ӳ�cv@(���@O���6��Tm���g�\�;\�\r�%���{O�}qQ�6Jp\�.S��ʹ\����\�w)\�\�#\����Hg��\�\��M`�ol�\�K���>m\�ް�o^�.\�x�\�Z3@n��V{��V�\�)�|��8���\���\�*^�?V���c%��\�V�\����7�Ӯ��+��\�k����\�\�/\�\�W~e�N�\�.��K��ί�\�\�\0h�M+�Y+��p�9+y\�7v\�\�_۹W~kgO=g\�\�y\�.~��]�r\�M\����sT\�/i���w��\��NZ\�\�o\�\�7\�\�\�\�Om�\�_l\���:w�]��@C\�x�#Y\�+m��V�]�C\���hA\�C���\�:�XRc�UV�C)4\�\�T#j��Ύ��\�6��q`\��rkZ\�H���\Z�,\��kY�:�i�~�L\0\�;\���\�\��$�Ы���=ߵ\Z�\\\0����TŶ�*��\r1]1�}\�1\�5�ަe�*���W�m_���Fﵟ@��ݍ�;л\"�\�@1�����\�ോ-��ۄ�o(��TY��\�X�ǲ(\�\�\��{t-:l1lP;�q��0A�6\�\'\�vk�\�a\"�|\'RX�f���\\��@Q\�\��E6��\�5N� �\�1����9\0\�W���s�0+l��H�p&�x+�\�m�F����\�\"N��v�\�j7혪TX\��*9\�ָ�w��\�Hɤ�b\�(!\�M\��}9ddٶ2E`�\�Q=K@\�\�\"\�P�S\'R%�ִ\�d��\�8\�\��|�\�@\�{]�\�\��.���B�h�,A)Е��\Z\�vұ�ՇH:\�\r\�oG�Y��\�;o�\�+_\�$|䛷m\�\�\'�\�\�W��\��/\��g�\�\�[\�\��ao�\�\�\�����h_����������\�k��\�.�����\�\�\����\�~cWN=o߽tʾ��v�\�g\�\�\��iN�\�.��{\���]x\�\�v\�4A\��oh\���K�?g\�_}\�\��s��\�.���]y�+�\�e��\�U��	��\�\�\�1��.�\����\���k\��Ǘm��o�N>�\�3_�\��y�[����F\��\�\�RO�E�kx50{�ź�Ģ�\�<V�v\Zy_�+ו\�\�gZ-\�u\�8I\�j\�S�\�=\�O\0\�\�Vȃ\�\�.\�\0�	�\��vX��q/�E3\�\n�c~���@�eY*���o������j\�KM��\�6\��\���Rr��\"���8�\�\�^\0ݎ�oH�=�W�\r>_)���&X\�ӂHyĈ��!\�\�\�����F��Z`�fS�,�\�mF	\�k\�\�2���b�\��HG��.�\�F��;�\\�-�m\�;\���s\'�벍�C�+J@?9pq\�1)v-0\�	!ed��\�\�\'\���tw�G\� o�U|E���\�\�\�f|\r���Jf|\�Ȭ���MZ�\�\�Ri&�=\�Si\�%�֫��\�\r�G{�>�ֶ��>\0�UM��$�\�&��mi@[,1\�l).`f�\�2|ov�\01\�o�~��\�ʸ�\�r<\�,\��X����ʩ��\�\�_�\�\�M\�b\r��6�\r�w\�k\�]��練��2\�\���\� I\�C�\�X���Yu\�f/�\�ƿ�����u�2��Y�����վ�[|���\��_Z\�?�+��\�.\�\�\���\�x�/���|\�g4�{�7v\�_ۙ~i߽�@�{;�\�+�\�+�\�\�O\�Y�ą��7����%H�}�\'�8\���\�\�\��\r)��\�ٹ\�gg\0�Y�\�<�\�\�뿵�w���_��OOZ٧�\�e��y\���\�~g߼���\�w.�:i\�o�d=c���d\�~\�&���͜��y\�\�\�\���\��X��p��磵ܟ&\�����4\�ʽ\��q\r�\�`�\0O܅\�!��\�\�\nq��V-\0\��X�%&y�\�\��p\�Q��I��R#0L�@8��\Z�_�\0��\�t�Z^�k��\�\�^�*����f7f\�C��XN�HL���=\�^t\�ؕ�J��2�$�im��Z���A�^\�/\�s\�\�|�O�jSҟ�]��\�.�\�\�\�6\�,7Ou�\�\�\\���2��	�1�b��\�jHy/��� 8��%Hr]rS\��k�\��\�	U���]Q���X\�/�8�氋�~ƭFS\�t\�\n\�)൥�Rn���\�zM\�.�\�?K\�D ���ZS#\�;M\��\�q��\�\�5�\�(\�G$��F�\�\�\�\�s(��nS-��\"#�ʍ�r\�ܒQ.\�\�\0� �\"(dz~\����U\�K��9�1�GVm�\�&b�\�\0�zn�^||f/\�\�+��ɑ�˲�\�mdH\�\"\'\���\ZT\�.\�\�-x�&K�NZ;7�\�MW~m㗾��o߶�?�\�Z?�\�?�C\�\�O�\�JOp����H�We�iW\�\�����_��\�h\0�v\�=��\0�+;��/\�n߼�k;{��U@��]~�e�+_8�3^��}G�8\�\�;�v�\�.0\�\�ΝDҿ\�g%\�i\�_�5���]z��]~��v\�×i/X\�\�\�\�w^�Ko�l�\�x\�J���`�w��*\�W��kV�ɛ\��\�[6�\��6y�3d��m��\��\�,\�~	F�ٻ+�GzTK��\r|)m5�\�=t\�^��\�\�=徻b�b�y\�-A�\�\�\�\�(=�=TA�H\�\0R��`Sa�r`-�Y��w\�f��#C \�`3�\�(+\0\���\�v�YG	+1g+ �\�.���9~\�;^�9�i�.�Į4����\�\�`\�\�r\�y%\0��P�v�mt{+��\����\0?�\�sn�n\�?fi��\�{��[\�\�[_����~��\�mT\�_V�\�\�}\0�̴�BUM�~��\�\n\�3���&KL4\�Q¨\�Ԉ\�\�[\���ǋ��G�F���_E\�(\�\�_�\�|=A@#\�n\�^I:s�\�\�H1��\�Q\��\��,�Y�G\��\r��\0�A/\n��QO\�[/��q�������� �V\�J7@��1�\�\\DD|Q@s��\0\�$�4��\�\�G��I	H(H���\�\n\�\�%\����(@\�ع\��\�d`�\�\�Q�\�B +\0v7`\��i�N�]�\�*�\�f�9^\�nsC.��?7Xm	:vDK$k��\�\���\�>��?���Ocu\�\�\�\��� ��`�?0\���o_�?�\�s?�o��\�	Ā\�|��ܖ׾�*\�,\�~�?`���3����K��+X��ի��\�^	\�~\�JO��\�ή�s�	�_\�o\0\\\�?���\�\��\���Ϟy�箝}��]\0�\�9��9�΅�8�w��ҏ^��\��ޏ��\��ӯX�\��/ع���3o>g\�b-.��\�\Z��u�\�%�ꔍ�{\�fJ>����@\�|��������P�渋-\�YE+�\�~\rA�y�j\�>*�nŏ]�[20ha\��f�-H?��\�B}��\�0f��6�X�㒛Q\�L4\�\'P�\�\��T+6��~I`��\�@\�V\�@V�����\�M\�\����d�fӀhT5\n\Z��J��\0�*�]�/\�\�5�>\�\�=�~��A\�\��x��\����\��X��X\Zm�\�\�[�-�%6S]f�0�,�\�\�^�\r�\�o�\Z�^m̒䜞n���ٳ�Sb� 3VW����PR\�؋*m%\0,K���\n*z���]��\�b\��vj]s���\�<�\��4 J\��\�\�Y�%%���ue��3)�!\�ӽ�\�&���\�Zު�X\0\�8{ЫT�:I�Ц�\�O=�C����\0\�A\"�*��\0}V\�\�]�IHY\� \�\�\�:\�s�~�%��:O\�\�\�+�\0���2=\�Ix\Z@�.zw�?\�{����j*D�\��\�\�(m� 6[��\�f\��l\�\��`\��Ț�x\�j>~ͪ\���U����\��ú��Y�<8\�9�?�;۟yF��\�\�_�\����\'���G?/p\�Y@�\�&8|u�9_�\�_�\�\�\�w\0\�ۀ�4\�\r�\�{/���]�\�/Ȼ��,��k\�O�\�?�\�^\�w�\�y\�5\�{\�\�3\�\�_y\��V���?x	пle�a�7^�K�\�aA�Ê�޷������\���z�\��	\���e\���M���\�W�ż\r_!c\�\0�R�=׬�ֱX\�*\���n��$\�UR\�tq\�gM��	\�~��o\�\��\\\��an\Z%7J_�\�\�3� \�F�I�ګ\�\�x3��\�\�\"\Z̃\�5Ч9\Z�Sq�U��\�\�׬\0Af#�\�l�tXMM��8\�{������\�հ�c\�\�\�]\�C\�˷k\�4b	�i9n�K\�	\r\�[l�͒���\�(vPE4��%\��\�\�3�\��D~_y�^ԭ�甤�kɷ�)õҦ-Q,P5�4�BvS��vB9�ʰ��V!E�ݮ\"e�ο˿��5e\�!\�Wx\\���[\� ��\�\�,L\����\�\0�\�\� !�[d\�\�q���r��Q	��r�S�%-����@\n\�[�\�\�\�a\\�Q&@OpR)@�@%h�\��\�\�\�\�\0��FHa�U*B3\n,1.�~K)\�T\�K)\�9\0��\�99��1d�\0�ۚ[\r&\'(��\�b(�]�v\0_��q��Sv�\np�5`\�^j5G\�~j�_�e�_�eW\�\�\�\�9i�\� x\�K��%\0�Q���\�\�\�a곿\�\��\�ο\0�^��\�e߽B@x�ٙ��\�\�\��b�7~��\� r�\����\�\�/\�ׯ�@�o�Ҿ}� �.l������6\��\�\�\��k���/?\�o=g\�=�k�\�����8��_緐�\�Q\�xU�;��\����S/X��xW\r\������\"2�E\�\�	<\����ӿ\�\\���w_�2�_\�wV��3�&\05~��u����_�\�f��`���Y6�#��\�\�+��\��*�	`r�\�*v�m,ښfd4�\��)APB^�\�ԃ�\�\�eC��K?�.@�K\0j\�\�S	+� �0*���\r���v!\\F˭�w�\�lSe��\�>8n+���/\r*KYF\�`^=��\�\�V\�\�\0�͍\�G!(�(�\�\�\"�>��i<텇\"\�6c���q\�\�i\��t=\��_Wi�\r�\�\n�_\�{���v�\�5�\�j\�(\�\��\�=ڃ1>\�o\'\\\�\�qS\n��\�U,rٯz�	\�͕�W\�\�\�\�/ӊ`..lXժ$\��dL?�f	$)�j�w\�X,֐�Q��;	���)�]@�H\��Yܢ2��8}^�VY+�@fD�n��0�.h���\�Nns��_\�+@)�q�Z<�\�\�<e��6E\�uY����N\�\�\�J\�PS\��5�E%�\�t\Z�\�Ӕ\�B\�U\"�9�.��\r}}\�:>{ޚ>z\�j\�}\�\�\�~	�\"\�O�\�1�����Hl�{\�4���v������j\�\��kE?���\�/\0@\�\�_��/�	#�/ċ��<?˞?E|\��]\��\��>��\��\Z\�[@~�\�~\�;�����W�\�\��{A`9\��h��c��6A�c\�(�?�\�M�E+�?\��K\�<G\�\�@\�3���\�0=\�\�o�x�R�VF\0� \\E)\�|\�ھx\�z��\��G���\���-�\nu�X�[\�y\�\�:\�\��-�\�\�ӹ\�5�2\��\�+��\�&\�F\�04b�A���� #\�YJ)�J��fg4�\�jK�ݨ^\�4H��<mf�Q�.[�\�ȷr@��v��\�\0~ضBc�=}�c\�¬*��-�\"=�}\�~��\nf\�4Wuy\Z�\�\0@\�`zO�������\�|�x��r�S\�| o,3Va����>����S�\�bc\�Hv��\�Ɗ\�S�}�&\�\�\0:��J\�J����E�\0>�F\0\�\�x5ysM��$�\�\�9\�3\�Š�\���_�\�\�	�\�\0\"8I�\�k�\�Ս\�E%\Z�\�^r|��=��7\�\0�K�\�\�)\�ËI%��\�\�<�x�q\0\�՟\':k���\�E\�G\��5\��Ҏ3\�5�p�ZT(�%��NFkx~O	\Z�S��<�J\�Ѐ��\�4�\�r��ٟ6\0�$ˁ\�\��m�\�\�6�\���kx\�?�?\\w��\���N��]|�\��x\�o�&F\���\�\�\�\�/ٹO_��\0\�,����,u\0�^��}WL���\��/�~\���[\�oWh���\�=\�Y\�;|\�\�v���\�\�\�\�>�ķ\�\���(�s��3��\rM�?EU� N�>\���]~����ု\�C\�\�sW\�x\�\�\�\�}\�J\�;\�{����\0(��o���j\�9�\���PB�+\�J\�|�Ͽb�O�SoZ��\�Z\�g\�\�w�\�?��\�6��p,�4�vØ�~i��85\�u\�q\�\�zx`�\�r\�T\�H~%\�\�#\��\��\0s�@�Mۤߨ�&�U\�u���_�8��-h\"\�\���Y��z�\�&�\�$�\�J�ٍ�\�N�\�!%�A\"(M!k6)J�׺x\�T�&\�4\�\�Z\�\���P�q@�\�W�|e\�\����5O�Y��=o���D�����B�\�a{\�34V�~��m\�\0tq\�\Z�F��ư,�M�\�\�k�N���\�}�\���@\�o�t3H_�]K��5dy�.��,X4��)9��B]�Wb̈T\�vOP^^���|vVSa ͱ\'ON�spcD�1�\'\��!NS�_m�\�{T\�5�A@@,�SR*@�N�\���\�\�\�#�!�{�0\0B�\�R\0��������6\�\\�q�Y^SrMV�GY8�W\�=205K\�\�b��\�1�:q\��+�w�\�I���U���6Z�\'\�?��	��[�|\�\�\���`<\0�\��7~]�\�\�;�\n\�\r\�\��<�\��\0`(μ�k\�����s\�.�tI�\�o¤0\�1=\�\�~�\�.�e\�Ŭ�w�eϽ�2,\n{�A\�U<7�\�M\�[?�\���/?g߾�[�\�9Y��څ��\'J��\�\�\�\�\�8Q\�	R\Z\�s�\�y�\�\�K\�y� �	RN�h@\nY_�ދV�>J\0;p� v�46�p�P�\�KV�\�k\����\��\�m�\�l�\�\�l�\��[.[�m��(\�Ս\�\��*I�2_\�g>;\�FPn\�^v\�{l\�ך�$���^\�\�^@J\�r�׆N,/\�\�\�u�	\�\"\Z���&d\�:�{7���\��\�hm%����\�֚>���I\�*O�\�ڽ&@�\n\���W��\�U�Z{\�\�4�\�@\�nK�\�|��J]\�r�ms\r�\�\���\n��f�\�O�}\�e��\�o�\�n�k\�1h�#5Js�\\�!\��>3\�\�yh��\r|u\���\0\�JK\�uz�.ϭJ\�\��\��Yۢm\�f�?A�ࠩ��\�Ы\�A\�UЙ�#�W�ț(����Ҹ�[�Åw\�`�K�\0\0[ѷ��iwf�\���\�=�^K�>\�wGg\�,\�{Z\0�\�ۼ?7\rh	\ZiX>>\�\�\�\��X`�\�\�\\��/0\��h	\"\�4Z\�\���1�\0\�\��p\�\�e�\�$)F�W[���\�\�r:N7���WU\�*<f��/&�`xOɟl\�7�����\��\�|o���S��U\0�ć-/��\�i\Z��K߆�F)r�\n�V0�\�UM��ھ�\�\"��}�\��\�\�)��\"2�L \�oW��+�_\�\�	��r\�}�\�[\�w0\�\�S���\�\n <� ��g�\r�����\�뗞�o������]z\�٥�P#o\�\�9�s��N��\0\�\�N�S��}���>�\Z\�-և��y\�\�%�`\'\�`�ry�^�<kg\�\' �˵�\�;J_��Ur\�5g\�\�oY\�7[��l�\�k|\�9^�l$m�Y��K\�6\�Ka�	1{���UO�n�O�rO���\��\�\�r:r^M�6���J\��&\�\�\�5E\'%\nd \�\��\�b\n�\�6��QIk\�<�����h7�\�K�Q\�Ayh�|Fh\Zg\�j;Ǭ�\�ka|\��[�\'KM;jN_[�K�Z\�|W�\�\��\�\��H�4U\�LS�M7\�\�4~��\��\�\\��\ZK�(���<�(�:l�\�v\�\Z}~��L�\�\�y�\�\�$�\�c����ybY���КO\�\�U\�c�Z\�\Z�we�\�p�w�\��\�m֭�\��,2Y��T6_�\�Ĵ	���\�*ʟ�jT��9r5�\�_�d5�3�)��%�	I$y��\�\�&l�\�$a��F\�\�����*ؙ�\�c\��QX~¢\0s�\�4-�0\�ԃTCJ\���B�rVdAO�\��\�^��@�$�/Mss��\�\\��f(W���\0\�\r\�>�\�\Z�����\�M\�M��v\�Z>yު\����	�\�\� �\'?	�_\�;\0�����o\�^G�Ӯ\��K\0l�(}Wj\�Wv�\�_\�7�\�\�x��N�־\�g`�s��y\�\�W\0\�%����\�_�\�/�MK\�|?��}��>��k����-�Gr_\��ϼ�x}O�h\�!��E\��¯��Hs[\���so��\��)���c|7�J\��\�|PW8��\'Q�:|5\�\�m�\�\���g\�,\�uV�N}�\"��\��f��\�_��/ް�3\�ZO�G6Z����g�|g�\�+nsH�\�+aG�\�Zm8\�\0�5\0<uh%��\�*`�kzMUsֹ�\�\�����y\�n\�;�\0Q\\V�\�W:�^\�3�|^\�\�7\�\��\�\�lh�\�+\�\�\��Y�d�f�\����SE_�j\�I\�k]=��G���^^#������E�+�>\�ȯ��6\0\�Zm��y\�\�\�Rg3-\r��\�f\�/!\��e��XWe1~#�]���i	χ���\�~��Wށ\�\n5����\�ku\nI#�\'�Q�W\�c+�^[�l+\��В\��<�yω�fx\�U��\�w��9>7k�\�	@��ր\�=@�\�\�Ug\0�?\�UB���,\0\�\�EW\0���\0\�\��\���WX�\�H,x,᝷�o�\�\n0H��5��\�\�xǦiB����5�];3��\�\�����i\�@pI���F\�5\�@�W�M��^\�>\�i�����cbZ \\4M*�AـC\� j7[h�\�\�/\�d\�_m\�\�\�\��\�׬\�_ەW�\�.+�\�\�s\�a��\�g\�w�0p\�Hb|\�\�w~o��S_/���y\�e@U�\�/����ZSu_\�/�[�\�K\�\�\�\'�\�_�Kx��x\�\0���\�\��a�\�\�\�K0�̹w��\�a\�\�\�?x\�.����JӨ�����V6\�Hw~���\rA\�[���w^����\�\�\�\�_`7���\������R�Ͻ�5x���O\��g_���.�P\nF�a�@0:\�9�\�)�\�/\��\�.ٙ>�\�<cUo?c�Z�\�\�\�o����^�´a�\�}b\�W��׽l��*��5Xr�\�T\�+=ڈ�%\0Lt���,|��\�\�k\�X_	6Cx~$�O�nap��\��\nD�L\�\�\���\ZT�\��\�n\�v�\�\0��K�\�VY.+�>�\�w��\����D�%ͽno{�-j#Kp*S/�#}\�|%\��\����\�\�c�@S|�.uWk�ڣ�6\�VG0h�\�6\�x\�&�/\�p\�e��E\�wTc&��G�h�P\�!��v�W)�pƃB\�`\�t\'*��\�Ep\�����t[\r,\�����B\�_���J!J�-�~�\�\�ʻ<\n!\�C�pd�6�H\���]a�=\�V�l\�hq��	�\�nF�\�,.�\��6�8��\�rA?mѵe�\�\ZC6c#�u����B�	\����n\�}+\�J\�K\0\�� \�\�\�¼\09H�h]�j`r�<0H\�t^��F���\��	��6~t[*�W�\�\�Gnr��/\�h\�_��\�G\���[\��ً0,L�R\0i��<�?\�ɗ�	�b\�+x\�+\��˰��\"`�\��.��a\�\���\�	\n��W�߯�\�o�D�\�w\�$h�\�v\0��\0��3���\�R\�\�\���\�S����\��~,W�\��\�\Z\�?�<6�v�%;�\�\�v�v��t��\��[sb\r,j��\�.+\�%r�\�\0�\��\�+\�\�:�~G\��\��\�g(\�?�\�.��]��cS\�9����_\�\�wa���\�\���[\��\��\�[.\�a��;[l-E&\�\�q��c\��Xe�i\�{�\�\�\�ٗ�\�Zh#`j�\�\�\�\�5�\�k圦��\�j��J���+6\���`\�\�:�U\���r�5ն��\�S���\�\��\��\�\��\��\���=��>\�2U��ɢ\�\����*�5W��}/l�\�g�\ro{��<a�\�MU_���+6]Sn��pw�i\�\�\�\�k�%IBi�(Q�\�\�4\�)\�u\�Mu`�]\�+1����	\��A\��{OA�6\0�+����^�\�#��W��L\��\�·�\�\�ǟC�+ݕ�by�C� �S.?\�]@.\�S\�\�ky��\�kn3IKh�� l�\nqlk|R%�B��\�n|�\�q��va\�Ir\�j<\�NDl\�\�ԳD�[���(\�� \�?Ǎ��C0\�5xI4/pC�~\�\�Z8��t�+�\�n��v.p���,���6q�/\��\�w����V�٫V���\�<�\�!�\�#\�%�/�\'�\�0\�e�y�����ӯ\�%d���_u��O��\rx�\0�}�U|��U}�U|\��?|\�u\��\0�-���V �C_�\Z1/����U�<�\n\��\�\�\�,�S���p���|\���O٥\�_�+��fW�\�R\Z8<\Z\�\�إ\"\�\���\Z��J��Mx���\�3?�o��/�\�\0㿂�.(\�\��P�\�2\�Q�\�;\��\�/�\�ӷ�\0�\�����JN���q\�?��O~m\�_�L@}\�FJ��>C\�Xj)K�\�M�\�\�\�\�\��\�\�=m\0�\�\�\����~��8i\�\�\�O�r\�Z�\�݌�S�\�4j\�b�\�\�\�b\�:َ��!\�i��]\�l����Z���QL�i������\�ʵ_Pã�`\��\�lV�\�=-nU���K�t\�[i��yw�\��\�\��\�\�\�7Ok��\�m��̦\�\�\�S\r\�y_�㪅:kxo�\��\��\�R��f9�eC875�#D���\�{��\�y\�\��*i%y�s\�\�\�\�\�\�*�)Ы��\�\"Lkʇ��ƹ�!\�#U\�l�f\��u>�\0:,f��\�\�]��Ń��P\�\�\�Gl���B\���I\�\�&hQ\Z\n$�\�\0\\5ݣ\�\�T��u&n��G�\��Kv�I\�n:i[\�A��J�\�ۉ$A-\�\�\�\�	^^��\�\�\�8\�}>@\���b���Sń�\�p\'\n/\�͋qS�um\�\�_l\�oY\�;���M�b\�wŢ\�y׀\��\0i\�w�\0P 苣\�\�\�\�\�\�`�W�\�}���[H�Ӽ�+}��U}�]����\�S��\�gV���\�@@x\�]���\0e��ʏ߱��߶\�޲\nd}%V�����/s��\0\�q]:�{��*\����\�~\�\�\�Ͼ�:\��u+���\�K�M\�\�/\���WP\nR %��R/���<kg�\����\�\�_\�7\��¾y�g�-��\�\ZR�[�\\\����m�\�Z>\�j>䷤~^\�u�\�e\r��=:�3~�לϋ\������\�g6S�w���fͮk��\�hZ\�\�)�\�\�xa�\0�>P\\N�\�\nkLَ�\�z�\�\Z�_�\�\�t.}WIfZ=\�F\�*\�R,2����8�+\�1��U����+/O\0RF\\��\���X`W�\�\�+}q{j-�j����\�Z�v佖\�6�F@�׆�Z��ئ\"\Z*�Ym��*\�\r\��j�\�\�U�%��\0>��PA\rY�\�,?�\Z\�z\�>���(\�,vES\�Z\n��\��i;�\r����jq\�w\r\�]G:k\�Se\�e���߮�^\�_�}�nD?�\�7Hu)�\�\0\�\��\�j\'Y�\'v\�.�)�\�]����&\�p=m��Y\�Z\�\�\�*m=oۛy\�\�\�\�\�\�\�\�X�����.\�\0_�\�?7dخq\�77r|g^u\�v���#W��\��|_�#��L\�)�\�,\�簹\�\����\�\�\��ܾ��Ŧ~Z��D\� \�S��\r��к�x\�\�_\�\�_}\�.�x\�\r\�KG}	\��\n��|\�.���8\�]y\�\��g\�\�V\0*��+\0@Ň�[�Go\�\�\�\�X�䣏\��X\�\'�\�\�O?��\�>wA�\�iZ\�\�\�Y\�Y���\�ϟ\��`�_|��߰���\r\0�I���? ��\�Kv�\�\�#ß����S\'9n�p j��\��\�|4X�\� 8���o_�D/E�\\\�y�|`�\�o_?���\�\Z�o\0�������ܾ՘\�k���R�Mץ�\0��?)�+X�\�\Z�|K\��uIF�\�\��\�y\�\����M����K׺\��\�\���څ\�%\�h	\�,\�\�E\�i�@ϣF\�ajU�Q]\�ӫJ\�ʼ�rN4�B�\r��]�8��x\'�\�\�\�v\��<j��69\�i\�f�\��YI�9-����\�}��\0\�M\��{$}\'����\�\�7Vٜ�\\��\�\�-˭E�xm���Vw\�f\�+l��\���\�km��\�R*q�\�g�\�R\�0��`s�w\���\\�$�0�\��*W��ͰW�s�5\�UB���j\��|SZ���J\�2�_k\�\�T\�. \�\�y.�?M\�q\�:�L�\�\�\�f����u�zN[0i+��\�\�\�v\�\�v{w\�n\�\�\�Ά\��w\�mo\�x�`\�\�l߳��]��\Zي\�pivi������+I��v���L\���5\�j\�TLe�u*�|D�8@-\����\Z�\\ĺ�F,+�\�\�\�6�\�\�\nSHH\�\��7\�[w�\����|}\�Z>{\�jz�kx\�S�\�\�<���6���\�\���������`X��Fg�$�}V~0?m0��\�Y /\�5�\�}f���O>��O?w\�W�R�D�\����=��\�\�\"\���\�1\�?��\�D\r�\"��\�h�\ZPʬ2�^z�ο\�#\��\�I���/\�9�\�\�\0�r\�\�.\�\�%��2,C��R�[���7`\�7\'�+\0\��\"\�9�\�\�\�ڷX�\�^��}��\�3�\����nPS���_/���f.(-X*�s\�\�u�\�)�\�7���wm�\�����PM�>;\\\Z�ݠ�Cۆ+��\��~���>\�RtWa\�5�BN\�\�Y\�@\��/\�\�\��,���	�EpK�iO\�b�P՜MBy,\�<\�΍��\r�\��\�\�\�����sX^�iSK\�\�ibp\�>\�>,��\��\0][is��:\Z�_hF-4j\�]\�t�F��M%\�i�j�\�\�`�\�Ƒ�\��>gZY�Kb#Щhn��\��+�VjV5*���	�g\�\�i�<�j\�\�vSS�[k�Ui�\"-�մކ\�kz��J�Z}\'�^\��+!\r���Ҫu�k\�я\�uFm����sv{�`w�\�v�\�[���vo�\�n��<w�د\�\��N`���\��`lU�U�\�\\��\�\�y��2����k�\�a�\�W\0��{O\�\�1��K :rlO�SK�Й\�\�\0p:�[q7��VC�1\�\�\�%UFiQŗol��G\���\�[\�����N�no�\�o�/���K��:\�EM\�9?�\�\��\�\�4U�\�{v������<�\�m��\�|�.�\�[\�\�Hz\0_�\��\��:�}\r��\�3=��\�\��\��� ��<޳ʏ\0��<�\n�~9@)\�2�\��e(���?\�Xނ\�_\0\�X��\�\�Q&�O�^��_�!\�\�\�S\Z�\�y\���\�\�\��r|\�G(Χ%q\����\�,\�\��\�g�gN���,�\����\0߾��\�_|M�����\n\�~�\�\�R\\�7QE\�$-\�\�\�+���\��ɫ6��;6]���{/��M�p\�\�.�q\�\�i�t�u\r\�I��JnE9��*�\�\�\��\�:jU�e��\rP^�\�l]WQW{\�k\�^�@Ii\�]ԁ6?Q��\�zag\�\�Y\�.\�wz$������}W\r̯��\Z��j�\�\�\�s5�0{)�W��||�\�V�\�TU	j\��+����j\r�\�\�U/`�\�\�j��5�\����3���,��ƞlD�(X\���%\�=�8\��\Z+�~�/X\'2�PFN\�C��\0e\�\�u灵8���P\�\�W�@?gkQ\�AR�? �WS0n\�n \�o�=��\�\���=m\�\�]�i[�õM��e���ã\r����=�\�l\�#ޫ�\\�s\�M�S ��W�\�+<\�v\nvm=\�c4�=\�v$�?=A⚶�JEm?����ZB\�:��nr�Zz�|d\���+ɵ>\�m)�m\�\�V]�\�3��W\�X\�_�\�_#Q?>eU��\�wN\�շNY��t\�7~\�ӴF>X~V,�\�]���v�폭D��g@�����K�O��ӇV�\�\�η\�|[�\�0��\0�sX�S\�gV�7�\�~�c�\�{	W��}��x�Ӱ\�[\'�\��\�\0@��\�o�!^�3;��i�V?Kp��\�w^\�\�\�)��@#\�\�gN����|�\�x��$l���C\��c@��X�7�\��\�\�\"�@6\�»�d�y\0�\�\�ן�\�#��\\�\�v�Y���n�\�8��o��vqeV��if˶llY3333cHbf�\�L	�Z;0\�\�\�+W�}~\��PH\nE�}�\�\����JDTt4����\0NPH:�\����X�?�B@�\Z�����@#E�yO�\�R�\0~ݣ�֗b�-\�X�J\�#o\�\�u�9�\�1�\0�L\�����G�\�:�;fo5\�\�f��`�T��1o\��7	\�X�\�\�ў6�\��]\r	KEg�m�B�@C�/�a\��^;�*�\�r�/���\�\��:�=K\��#\�\0�J^\�\�\�_�\�5��\�\�NB\�\'\�`a��\�\��0{f���*\�>\�|�~�@2UW\�2Q]9��y\�*�۞@�L�\�nV�[{\�=��ymv\�\�&t#\�\'`z�o\�A\0A�w�v#�\�/\\T\n��Mt���\�\rR٬Jf]��\�\�\�^��\�9d��,n\"�5ύ\�W\0Uh\���\�\�\�\���߲�\0�\��]��ٮ�\����k\0\�|w@�����\���ᖯ�4#�\0r�l/�V\�n��\��ޢ=\'0<ߞ�g[\�o��_��\�\Z5\��;=�5�!w�x��\�\���>b|\��\�6�˗x\�ϴ��D.�+�}�C\�o\"qa״\�-\��`�\�\\��/�O\�\"u\'x�d��|\�%\��+�-\�\�\n�\08\�.��\0��8@ϻs`�Xah���q{�߱��\�\���\�떯�	fݺf97yM\��\�i\��\��[��	\�\�\0\��s��=\�uF�?e	����=dz~>�`CЊ���\�\�\'���\Z\�\r�S.}���[���KÚ�^\�\�/�&.�t$}�\0�3���\"\n��G\��QJ\�ZD�\�@ď<�{\�7�iQ�_�\�\�x���Ѣ�F�|�\�G�\'��K8�[\�)\�\�?�d���֑j��[\�*\���\'u\nC���\��\�&RWt�\�\0^�\�T�b=\�Ջ��\0�\�\�\��\�ν;�?\�\�_�\\@Pp\�\�y\\3J\�:q\�6�%��ג�#bq�\�|\r@W��.\�]���z�G\0�\0\�(D�b\0o?T�i#E�\�,�7\�\�\�uW��c5	�֑A� ���\Z\�jl��\���6�c\��v[eI�\�|�W��\�\�=��?�n���&g�4Q\�\�\��$R)>\�o�3�����_\�r��=`\�Z\��\Z 𕲫J;\�\rS>?34�sm\r���\��\0}wV_�\�\0�\r,�~k�͞�|�\�X��\0\�?�س_�\�\�\�\��\����t\�)\0��z.2�\�\�e�7\n�ݎf�/a	�\���֒�b�~�]x��M�>�w_�0��w��5��\"�M\�\�\�m\�6Ƒ��/b�/��d\�L6�\�d#���6*\�J\�޳��W��\�A�1�2���%\0\�2\�=��=Y	8�T\�\�\��w0\�IK��\��)A0r\�%@�4��\�xd|`�\�\n��P@nE���~��<d=�o%�	\0���\�z\�\n\�>�,~�\�\�\r\�˻u޲���,�8K�,|I���H�\�s?�\�?[$V$VG~�x�Ax}�\�r�׈|OD�(a\�u\�9��;�7���5\�[\�T���?cM\�[:A&�6��\�F���ctZ�\� )	e4�\�xO��zx\�$�g���E}��������O���,�/�\�\��\����\�����/�?�!�a��\�Xa\�9kzl\�\�16W�\�\�mUF�\�S\�\�K\�o�/,�惱Y\�<\�}-\�h\�\�@o+�\�\�\�\'\�*Rv\�֘6�P(Y���k�Ζ4���ĝ�\�\�\�\�w�c�o�-�1T���\�FP#�\�6\�\\j\�M\�6\�X�e$(�\�9�q\�x�\��}\�\�]�g�����\"�L,��	��\"n\����\�����\�Cm��\��\�\�R�\�u��O�\�\�\�&{�:�\�\�\�x��\�\�\����\�O�\�	��\�k��\�\�R\�\�2��\�γu�\�m�:y�\�Z?Kg\�\�\�;l�\�Hi���r0\�/~\��V,���[\0��L��9�\�}\0�\�Y\�V��\0Y\�\�?\�\�\�\�/��\�\r��\�!\�	\����noQoWx�������/d\�\��\��8vF\�7�10�:\�,(+����;kl\�*T��j�*kM��\��\r�g\\=˝(��\�˖~��e�;��\�ӟ�ѝ�\'^P\���\0\�{K�����\�	�x�̛��\�w�\�w�]\0~ϊ��\0wD\�>�#���C+�\�\�\�Y)�/�E���V���\0\0>6!\�\�EX�<��ݸ0�\�YW\�Z�q�<��sw��%\����P)<\'\��@\�\�\�\��$��4\�D�\\�ʒ.��\�}��W�\�S���X���~�,\��ϖ��P�HB\�\'��\�\\F��.Q=*����P\0(���m�\���\��%\0�#~���o�\�\���\�\��\�\�d3N��\'�\��%�]=i��\�/\�\n\�|m��u��m-\n��\�\�W�ɵ��޵&V\08<�\�-}O^]��8\0\�$gG�������\�D:��\rn�[�߬ğ~\�\nT\�T�\�\�3`�*OG\�g����Jd}m�k�2\�R\�f=�t�������P��\������&6��<\�:x��8\�:�5������J[j\��\�﵍�a۞5\rm\�\r�ҵ?7\�k\�\�\�4\�\�p�=)���2\�\�/���b\�\�˷���\�6\�0�D��ߚ臱�\Z\�*Я\0r5\�ר�M-\��\�u�\�߬�㉆���\�s��ru\�\�\�\�[1����\�/a�ׇ��t\0�O7\0>���\�{\�xX�\��\�)�P?#�<\�\�*\�ODf\�\���\�\�\�}\�\�}�\��Q(�������=Z�7;���,�g\���\�	@χ�*R\�W:\�嗆TxQk��\\\�J���\�`@�^�\�2`\��p�\0��ϼ$\�;c�\�a\��H\�\�bw<���\0\�\'�@�^�,<x\�\�ۖ}\����í4,\�*�Zţ+��\�\0?:ܱ|Yx�U�? \��Y9�/�Ũ�\"P!��\�>\� Kv�p�_��{-�\��I�{��\�a._�\��\�\0\r*\��%<���r\��K\�\�ǋ�)�\0�r���\��r�������\�?Z\�U\�\�U�Vڥ�x\�(�QAx}<���8ejC�K��Kֱܟ�F���N}��\�^��\�G��)�ǿc�\n\�e��{R\�~c9\�\��_[\�寭5���\'^4^�\�Uf�^�7�<\�\�Ӗ��\�&ך|�\0���T_C��-ܚ|��X,��\�Ȇѷ��q�FfM�|\�\��\�CtJ��@�*�l�)��T\�+Rw�ᖙ��ҕ_O�#\��\�\�r�B\r4jPE\�8\�\�uN?TL\�P:�\�s��i\�M\0��̵�>\�g3�ji\�^�j�6���k3��2	1#�{\�m��О�\�\�vW�-�\�J{��u$ى\':������\�D�}��dy\�;�_ҔZ<̚�;RGRX��4t�7\�E\�\�L��9\�k���\�Z\�w�7��C-�ÿC�ğ~�c��ز_^\�ן\��\��\��\�\�G\�\�?\�����\�\��\rXF?�\�\�ۻ�|�f�W��,\�\�\�ǲ��\�\�\Ze��yп#h�ޜ��˼�Y�\�h�ͷ6\�L��\�\0�\�Ov՚�C�І�ӭ-#\�*`Ԓ0|t\�\�P\�H���\��\�W,\0e�ů��\�䏑��!\�\�9\�\n\"  �3����|�\��u��\�;�s>�\�\��\0�Q����p+�z`e�\0�a�UFDZ\��?�\0\��C!V�\��\�\�a��\���\�H�\� �\�r\�]q�ywy\�wx\�v�\�\�\��_�e\�\�ݰ\�[^S\n�=͝��\Zu�\0��\\BO:̜	\�3.���:��\�\��ce���\��T��v���\�,�\�\n�X�\�\��+�X\�\0_Y~\�\�K>�7Se^$� �Y\�I\0�cC�VMA\�i}�+K����=뻯,�ǯ��\��Vu\�޵\�\�8��\�\�s�p\�r�<�\�]�vn7\Z��ε�R��	�/\�ߔ�\�{nR�cxoB��I�jF\��\�p{\�أ\�}%pɯ\�\�j�Q�n\�a�J�U�$�^���ګ,Ц\�\�r7\�z\\\r5�l��\�\�.[i�CJ\�)ͱ\�R/�Wg�;\nl��Ԗ5f��\�m\�\�\�%�w��|Oz\��}�ŞO7ۡ6/����-\��:;���dy\����iۜ\�\�\Z\�\�\�\�[\�\�M\�\�\�\�\�3���Y\�\r\��i���D\�\�n\���4]��攽F��?��uW`\�\r�3�\�\�]�\�\�������_\0^\�ۯ/���s���\0�o\��H}\�\�\������\�p\�>j!\�\��?�π�\����\�C1�F\0�����\�1v\��ʔ=�\Z���6\�\�.����n��e\�z%\�Lv\�\�HK�u&[U\�{\r\�\�E~��\�\\�\���c� ���\�\0\�e\�#�a�L\�2�\�e+�}o\�\�u\�\��\���\0�\0�� \�\�#���a0+\�\�#í<\n\�KiEXET�UE\�ZUd�U?�d=�\�\��\��P��~6)_�_\�@\n\0ٟ\�]�\��\n#n[\�CV\�]+�v�7�\�t\�Rx\���\\\�\�kS��\���|\�\�`\�l\�5Y���H�\\\�\�\��i0��\�N\�,�B\'q�^�y�?�a�\'\�dCEA\0�X\�?hd��i�?����0\�\���4W1x\�NDs�cƘ���\��\�[\��n��\�wb��o]���a6T�h3���\�W\�\�z4��K���\�T\�d\�f��y��\�(f��[\�UP�䗧G\�;E��\�X*;\�&�\�>�`�\�\�=U\�w\r�D�WK\�k�]��\�ɧ��j��b-\�\�O���\����y\Z|\�_.V\�οr\�Y���鏴���AE5\�\�7\�[i�cu�>\�fG���FQ/�\�\�5��Y\�\�\�I{�\�W�W�l�&Q����כ\"\�i\r�\\�\'�3v�\�/\�u\��\��\�j6\�Wzys`r�\�\�f��T\�6\�\�	��C}<\�%	\�c����\�H�\�~\�\�T��c\�ǫ�\���9�/׹\�d\�p\�~}u`����.\�~�pK<\�#X���\0�\'������x�L`Y\�9�~\�\'\��C���n\�^i2�&\�u\�t#Q\Z�/v\��?\"�\\>��7YQy\�]ǜ���\�o_�]���Vp\�2��\�\���c6L\��9��<\0)��eúwn\"�\0�/x��\�XY\�\�=\0/��\�����\�m�C���䏬J+\Z\�\�\�\�</\Z\�j�\0����}��n���P�\�\�\���w\nݱbXi���\�\�#n�nYz�]\�&��IXp\'\�\�@ң\\\�\�j~	۫=V\Z,�	\�g_\��hؘ$}\�\�ؗ�	H}�C\�\�ݱ]\�\�\0e(���]�\�\�\�{\�\����hyv�]��j\�}J\�����-HT\�޹����,�\�7���\�~�3}�^!�\�\�Vr޺\�\�\�_�f�jy��h^\�Hi��o@�6;��:_\�u/҂�6\\�GP\\\�\��]X~i���\�*�\ZWbN�-�3K�M6?It\"\�a\�!��Y_�\�6\����ɺ\"�\�\�t3��W��:\�\\lX�\n���\�J\�0*�lX_+\'_;�.�7\����)\��\\/5\�`��~O�\���C�juЏ\�[\����\0�ބ�J�z��\r�f\�ī�%{�>c{+\�n��\��A��\�\�W��j�D\�>$�\0_jӋH)�t��䲔��+\�\�^˛\�jn�\�ho�\�v�c\��OO�\0#��\����\�\�9Xy\�~#��y	�\�\0��\0^\��d�\�[�=T������\��B1�O\��\��п{<o��L�,\�\���\�\�x\�\�\�y{s��ْ�s0�&UE���5@ \�n�\�v|}[�\r\�Z�\�$��\�߰��^�k~0��}\�\n�:��yY�e�-���H���y];�\�-�̏J\�\�E��,�r�,\"\�J#���\0��\0��]\�%\�a�\�XB,ߋ�	0r?\�\���ߏ|`U\�<\�\�<�\�H~�À��B�($ݳ��0���o����>\�{\rY�b�#��.(�����w,��#��/\��}\�[�Su ~:\��\�,��_,�\�W��[˾�=r�$�?e\�\��$�s��KK�c\��\���\'�<��]\�Gu�U%��v\�:I\�*���2��%��WKVW g	T�\�:�7������|/��u\�oV\Z�\'k��j�9�6S�o\�=\\��\�\�W\�>\�>X�<X���\�\�nvj@�\�\\G\�\�s+@�\�|�\������\�\� Ry��\r[B\�.�4�P�*ʂ���\����$�Z3	UT\�\�\�O\0z���k\�ts�M�n�\'HU*�>\�m�\�fp�\�\�\�>\����Ms�\��y�\"[\�\�6\��d�m\�v\�\�b�=]\�\�ۏ\0x���\���\�V&\09�?�\�\��i���\��\�wf\�RW��z\�@ﳣ9\��\�z`�\�\�I�c.��y{5\�PS��4\�e\�	��\�\'\�\�-<\�?�ՠĜ\��\0q{\�\�\�)\�Lٛ\"\�\��{�\00\�������%˟f�g,�/x�\�\��=6\�Ş\��$\�?\\�d�\�26?��\�G3X�~/AпEڿ\�\�\�ᴽ�\�]F�FI\�϶�\�npAW�i֜z\�s\����Zcf��Fk�\�&�F\�Yx\�%\��E\��9A��5�\�ʺ\����\�\0��K2+y&9� �v�.y^�\�Wr[\�\�Հ�\Z��yt\�\�x�\�Va5��.1\�j��:�ϊ\�>ϭ�yh5Q�V#���$h��quP\�\�)䥉�d\�AR�5$\�[CB�5ƫ,��%��g\�	DiX�\�߹\��b��o	\�\�80\'\��꒓�3.�òz\0�t�����\�%\\<\�U*\r?\r\�?Rq\�\�?[�쪺����E���>_��_w\�\�\'~\�h\�O�I\��\�\�\�m�!\��\�h4\�ʟ�\��e\�J��q���ZGu�*��і:Y\�_t5\�ꝯ�\�ؿ\�6�y\'Џ\�X��U瀵�P.��~���lقeHb~�\�f�=��\nw?P�e���\�T����V@�Z���?l��&\�(q�W\���\Zؼ6\�\�\0�hE��@q2r_}�Q��\�W�n5\�\�}�ώ`�\�+>{-�_�ۻ\r�[�fk\�\�\�NB�{/\�\�\�\�X��;�dɏ��\�c@�$U�͌\�\���m��{�/�\�nH�y\�&\�aK�\�=.��Ku��{�;/*�vў�i-\���Y{��y�Ӯ�B7�\�5\��?e\�\�2 \�7��v\�>A�+i\�쿾\�eiP��\0���\�h\�_�F�\�s\�\�\�\�s�ױݢ�$�� \�hj\���*\�\�րK�̶ ��\�TkFx��\�\�Y]\�\�c\�߲�z:�O\�iژ�ų�nj�N@?\�έ\�mӯ\��Cn�\r�`+�m\�c\0r�XP\�j�@5A�\�\�\��`5��\�T\�ܷ����3\�\Z�\�)9�\�~-�������x��������\�\�\�~J@�׊�&��\�	I�~r�U��3)�֒�e\�ɉ֔�Кx�)=\�\Zӓ�!�\��\�,\r���w-+�s�*뚥ߺ�w�hi\�\"�b�\��cf�\�~�<�ON�e~\��\�\�K��3�\�-��w.�>\�G5\��\�b~�`��+��R�^\r@%\����y�?y�Zs��[��*\�M�\�K�.?�\'\���\�:mq����һ��u�A�3��(\�R׈U�4Oa���\�;\�\\o�\��~�Jo<2]�\�h\�\�\�[E	� \0��Cr�x�rP�5�։���P�#�e6X�o}Ejy�a��Q�?WE���\0��|�QT�,\�\��\�3^�\�y.YG�Dc\�б_i\Z���\��W���vU�\���׎�F ր���_�r��~�\�\�`\�`��?�\0�`\�>L\�	��.\�`Y\�ܟw)�ʝ\����V\r/\�\0}���Zk�\�~��5\�\�\�<��Û�?5hG�\n$\��lc�_\�\�\�9\�-^nO��8�����\�k\��}x��\�\�;\���\�\'г�{���\����\�\"@\��\�?�^\�\���\��z�x�P\��+%ꬢl\�\'\\���1\"� R��\�\�IS�\�B\�\�O��6y\r`\�\�s\�\\\�\0x�\�}&++�\n���\�\��LT@�ϸ�\�J����;V�0ƅ\�\�5�Fp\� \�kYuܯG�\�\�:�WPk\�y��b�	fVה��X�m�|]��\�}�uq��\�XX�G�ߐ�b�ii֘�d\r	V\�mMF�5efY{V����Ykj���x[N��f�Ys:\�M��\�G\�x��Vx?\�r\�\�X~_i�ڴ̺\���\��KڵW\�\�)?\�6sX���Q:7t�q\�R/�t��\�\rw\�;SS��q��_!�YJ\��\�� �\n@\����\�?,\���\�\���ź�\0�S�\�WS�~�u\�߻l\�\��֝m���_H@/s\�.4�L\rU]�de\�!���\��\�ھ�d\r8\�U�t�`���\�\�c�\�\�\0\�?��>u�VS\�\�\�ط\�F���[]e��ڑ�T\�,=\r�WS\��/|��y��a�>\�i\�9�\���+�^�!C���\�+�_\�:�l|4^�\�26zu\�\���\�\'��;\0��~�7kwf\�#A\�\���\�a���	|��\�,N\"&\�p�\�O��\�w��V��\�	�^5��\�\�\"K~�z\�\�;��\�O���W\��I��<I\�x�w\�\�7\�|}�~�c�\r{\�z\�\�\�^@�\��_��\�\�\���_\�\�?�oR\�\�w|<X柁\�Y���\0�_\0=�^y\�Ȏ�_\�κ=�\�6m4J�)MSP3����b\�\�N�\�8\�v$>84ȊBnZ�=m\�Yν�}��� �s��\�\�p\�y�Z;�Aװ\0,\�\�\�\�\��=|2\�oH��mm��-�r�{���ޘ�\�xE�\�0|B\0\'\�\�xkL�e\�XCj�\�\��\�$�O�#8\�Z�Ư��x[n�uYgA��\�gZs^�5\�fX[��-�xN�ud&�QI\�yi֖�n-0~sJ�5%����\�V�(\��C\��\�B,\�\�m\�\���\�^�_���L+��(+��\��~\�-U\�%�;速x\�;K<��c\�\�\�[�\�q	�?}mQny\�u����\'�\�\"��-\�\���\��\�����?�5v낕ܿm%׭$򒕄]�b^C[r��\�\�\���%�>\��\�\rw\�\�q�\�\\_�M��\�L��\��\�n+oB�v�u��3�\��\��t�\�Nv\�>\�ug��@\�\�iqAD=\Zu\�\04\�g[o���,�܊\�\'��\�֍��\�\�E6XY�J\�\�\�\�8`y����\\wf�:\�(��\�f��]�i��F�\�:�\��be\0����\�\�x�98��=g��\������<\�;̷\r\�wY��=\�\�#\�\�5G\r$�*�Wͼ�~M���\��(��ǉ�jD�;5\0\��kS\�>\��c\�ǀ\�1��(�V�ή}`�w�;�\�\nn�\���\�d��/�%�@`w\�t��>����E�Yo	��r��\�3,��u\0\�yΛ\�\�~\�^�O�\��\�VB�X@��\�;��;3ɚ$�#\�ZY\�M+	�e�bmn��:���\�Y�����\��w�����\��?��3E��3�c\07R�^˱5\���\0qc\n\0O\�\�6�Z�\�-<ތ�oNJ\��Dk\�Mi	֜\�g\�\�Y֔�\�c�3߯C�ץ&9�ޚ�i]\���r\�)*�\�B@^�o��<�#�\".\�<\�\�Ͳ��L\�\�ϰ~�-#\�Z\�2�Ј��AQT`%J\"\"�0\�\��\�;JPR6a\�\�\�2�\�Y�0��!;�j�l@��<��g,�<�?�%���;\�\�6\��0�w\0�\�^zZ_z�?~^C7\�f\�7\�G\0Pc�\��\�\�\�Sc�\�\�e\��ب��|\�rP�\�wJ<>:_\0\�+ls�O��\�*\�E����l\�>�z�v�[;\�>���Ƥ�ێ\��@/�?\�a\��\�A���y5yvX�䋲�[\r1\0\�l���*Ƒ���\�=/_\n×8u [0��\�\�\"�a�Yx�@\��x�>�D�>:ϟl�@�4�\�\0\��?�\�W�\��ְ�\��\'�$@��O�\�ǝp\��\0����`\'�\��|�\�,y�=\��#\0y�\�\�{\\\�kM�\��\�o)W)��:\�y/I��\�\�F۞\�B-�ڳ�	W�nO`����OWam�vIx\��]����>�8�ϯ��e=?�O<�\���\�ozi�J\�Q�\�֬�e} �}\�n\�.ޅ�M·N\�/گ�-�\���}P%\�\�AalO\�\�\�	{�6nO��\"�\���o07#�U�x��>�\Z#ì.\"Īt��j7���\�\0\���\'��\0�2W��\��\�;|�\�\�.��{�\� �k����\�H�\�7MK\�\r��\n�\0�Ւe�Z�	֖�b�\�\�\r�yk�\0\�\�K�\��lX;\�\�sӑ\�t�X\�R��2�^Z\�EXe\��U\�W^ju�6\�\�\�?e{�\�[J�� \�:	\0\�H�Vd3�15\�j��FaT\�\�X�\�G8\�\�\�˾�\��\�U�\�\�[�^w�C�(\"��\\�\�+\�,��ϖzF5\0���;W����sx\�~�Im�iS\�\�|O�z�\�5\�|��Yķ�\�\"~�#\��?�w�\�v\��q��R.\�솒���\�`	޾E\r7J�Vkm��=\�f;#\0��\�\�\'3��|�7\�c˝�\�=e\���\\{mVK\�oMtr]xm�\�ɩ�\�`��r�tb�\�\�\��d\�\�o\�E�&ڔ\�t��\�	\0e6V\�W�\�(L\�Z5�\�sN??۟�j�E:��\�\�\�&`Ʊs\���N�x�\�\�Ӆ!v\�^l�p�K\�\��\�~\�>�\�>Cv���H�\'މ։\�9?r~\0���0<�ߞ\�\��\��mq��ET�\�z��Mmrmt��\�Q�ԩA	Ը\�x87rzU\�3��\�\��\�5\���l\�~`��\�\�<�\�^�^=�__\�//>^�=2�\0~ˋ�=k�6��/\����\0�{)	�\�k$�\�{d�G�ć�%|`Gҿ�\�\�lMثu�=_�&\�gO�*�U5�C�u�\�Z\�\��yxϪYe�ru�)�\��C�;��)	F��\�\�a71}!��$D��w�$��\��zy�:$}=r]�%������\�4V\n���\�I�\0?�ǻ\�\�v�v{6\���\�\�\�Y�c\�\�9\�[�\��\�V!\�XbU\�\�V\�py_��\�U\�(~\�\�Tl�F��F*U�\�`Y�W\�Y�ss����.�Nz�5�(\�	6�\�	�\�X���B�D��[��{6��B�<�V�nC\�8��\r𳂮��\\\�r��\�\�Ϗ�\�j\�q�[�ѧ̽ؓ_z\�\�\�\�\��\�\����G{�\�|_J E��\�[5\����\�\��3���ؐ�VqǺ�b��\�طR|x5\�k�m�4\�\�H���\�\��6{9\�mo�\�h�kwg���\�\�]_�W|õ��|v��|���,wu�\�4KGrå0=\�\�\�^\�@A�c\�@]�S\�M�6\��\0��\�2�\���+o�4\�k�)\�\�=л�|T��^���T����c\\\�~{�1��։\�$\�<��ϛ\��L����x�\�B�Ǡ?��5\Z��\�1۟U��!W����\�S�%��p\�UK\�R*�\��\Zm��\�\�\�B�R;\0��~�	�xw��\r6I�OnW}\�\\�����\�W��\�\�C�\�\��\��]I:ڬ{�\�v\�?\�<\�\��������m\�z��b/T\\����`�ޭ\\\�«5���͛��\�#����5��C\�\�!\���D`@j�S�s\�T<\������\�\�^�nC`~�(�E̯��\��`+��-���\�\���&JmQxy\0~�\�\\/\���e\�YGV���\���\���\�UǗ�|\�\�}GN�udZwI���\��\0~pXi��08\�\�\Z,/\�k\�=\�bk���6�Zg�Mb_\�Z�\�Եf\ZW\���\�R\�E֓�om�\0?�\�o\�E\�g�4����V�(\�\�Z�c�)1\�>�;��\�\��\0j�\�M5��|\�R����OY�\�,F8\�\�+\�+�\�g��֨\� ���\���s4r>\�\�_�\r?���\�S_[\���\�T�C�@\���WK<��e_;k��v\�O�h̢F`\r֡T5�\n�a\�\��Gcm��\�E�\�b�]�\�\�%\���\�S\��v�&���À��\�y�Q��\�c���X_Q��\�Ż\�ͬ\�D��\�B�uJ�$�o��X�K�j;\�6i?\�ϩ�\�e\�\��K0\�\\��nt���\�=[F�n�Ц!�I{/�\�\��\�Ƅ�!���5�\'$�;\nX\��#8<�\�?p�\�1\�!�?T+�\�;\��\�l\��R\�\r�Dί)�4\�Z-�5\�i�Uc�\�c�	\�ќϽ�7[Hn$�[d\�;d�և�9�馬<�\�k�\�W���\�}�\�\�{�\�/����\��\�\�-��\��i�b~y��\\\"\�6���E�5 E�\�h\�^\��5���\�\�k\�\����\'k#�xc\���mgf\�6�\�.�\�u@i��q�\���������Gw\�}yy�|~\�U�\�:�^9\�7��o��`.�{V\Z�rv��2\"Ԫ\0AU\�#��\��ݑ�F;���\�c\�\�\�+\���\����\r�xj@O h\�J�Μ4罻\��(���Ch��XC��~c��hy1̮\"\r�d}�o���N\�\Z\�F\�\�8�ׄ߱o\�,`\�l��:U�q\�[Wn��\�h�U��dE]\�b/P�i�X�8�P�U� (2��7��	�m\�C�\���G\�\���\��\�\�{\�\"\�?o�\�\�Z^<\�\�I���şe)sO\�z\�\�[?:\�5\��\�G��s��Y�Y\0|Xq?�\�b�\�b�SE����\�2/����\�\�L�A\�L�?\�uUq�\���-\��v_�\�\0�6\�\�jkX��bud<\�of?\0~HL#�\�MWs v\�[Q��<G1��+\0-\�I\�u�6P�d���YH�r��\��ei\�D���7��\�X-�\��]i�6��[>\�1\�\0|M\�\�D\\M\�]_;�G\�\�b}�\���u}�\��\�i\���|�\�>�\�?���D��7����޴�PS�\�\�)\�\0�i�Lځv\�U`��[\�\�ADL:\�\�\�q�:�,����P�d�\r��	�O���rs\�^m�>Zo�\'\0��$���O6\�7\�\�kG�-,/�?\�1�\nf�X;\�\�\�\�\�\Z��\�\�\�\��o<W\�x:\���jx�x�[T�\nu\�\�\�N��\Zv7fmc5`+KC��Z��\0��\'�\"\�9\�DC���A���q��$\"\��2* [�$�k\\�o�\�\��\�\���|Ƀ;\�e�����\�g��Y\�q�\\e�>Y\�\�Q|\��1\\+�#3\�1}S�^L��Ț������*NǗg[Wq�u�fX_E�\r�#5�@�\�1\�\�\"�Uh�\Z��ŉ�r\�\�s��F`먱�Z5#\'[jl��ʁ^L~.���B�;�z��\�y\�Y\�\�Ft\�U�R=Ч��:�)��e\�\�)\�J��W�`�0\�~\�Q\�\��\���>�\�Ag-5\�%_E\�k��*�~��~oѧ��\�u����_`���\�0<l�\0�ǝ�g\�Y��\Z\��\�7��\��:\���\���2U~{\�5F��\�u\�\�7Ic@�\���\�q5\�\�P^~?K\�4d_G\�OC*�.;[j�1\�\�rP�z��\�C\�\��^V\�\�E.�v�\"͆X�\�\0��ӈ�\�ܹ\�|V�G�Y����Wk�^��tT\�k3O\�~%Y6\��8\n㫱�\�\�+�g���\�\�\�j�)\�V�[�\�w��\�A�7\�&��\�h���Փ\����H�_�ßv�\�{vB�\�\�)>P��\�_O\�\��j\Z\�\�\�Mmռ�\�>\�	�\�Ւ�\�63T�\��;#x��Aw\�w��W?�\��gw&��\�\��&`��\�.\��\nH������\�7\�zX��3{�i�_����\��9@���m$���\�5\�\�!@laX�T���O\�\�\�mm�\�\�\�MϏ\�vfi�`[��o\�5��h�t�\�YJ~	\�\�E\�?�gUѡV\���� +���{?{�%��wGh�\��j<�2&̪�\�[m����h��Mɀ99���\�\'kxA+��=3�\��\�^\�qҞ\0ԙ�\�3��\�-δv^c\�\�<\�\�3R\�E\�.�\"�*qD\�\��F��W�G�if���t\�;\�Z\r\�5�E�|݌̇y�\�M�)�\�����J�y֭�J�\�\��t���}S;�oV�@�\�\\]���V�\�)j%����a��\�\\u�u\����[g]O��\�?Y\�\�\\w\�\�O�,\�G@��Wv�\Zpx\�_[\�\�?[�\�s��{��hG%�?��\'�s����ws\���e��\��/��ڰ`\�\��\�>\�lG�e\�\�\�֞`�z{\0�$W)��j��V\�oͯ�2\�X�\�\�\��\��lS�:\�*A\�6���\\�\�\�a|�`�ʸ�fM��\��\0}.�\���\�\�j�9����|e\0��>�i7��\�t.\�c|����\�h�\��z\�\�L�=[�\�\��\�^\��Ҹ\��V�Vp���b�[\��q��~@813:h�Q[��\�J`̖}�� \�_\�m��\�\Z[\�\r[\�(�\�.5*����\�2gPF\��\�m�\�M\�\��_�\�\�\�\�;\�o�Ѧ\�De\�\�������T�펓��\"\�?#\�\��`��\���J�ѹ��\�b���ط>\�g�\�\0t��}@�y�\�x�=g\�v\�N{\�vקle\ZO?k{3�\�WaQ�\��Ʊ\'}�\�\�Z�����kz\�u\�{i\0���B\0_t���b\�!H�p<<Ҿ���2:ܪc\�M�\���\��_OD��\�Z����oN��O¯\'[WN2\�^w1V�\��v�\�p\�>�̈́maz�^WE�\r\"}0\�,=\�T�?�v��A4V\���W1\�$�l�Y)��5T��f4\rEY�H_�N��\�@�>Ac�0�j\��@i>����am�ޝ\"\�D!9ٚPE�^�&\�tU>�\�\�V�(܊x_T�sGe\�\0�,\�\�e\�\r���Zt\'�;�\�\\��\�\��	j���|��\�m�)�\�VJ\�kg4\�C\�2S\\]�\�-��O��+�u���\�8�2\�h5��\�S\�m��Z�\�׹�6�\�ss�&�\�\':\�\���s \�-�~KS�\�\�+k8!N�U8���t=e1�&\�`u?@�h́�s`|��\00Y�-�>n���\0?\�\�\rv\�\�\�_��\�9z|�r�5�~� �\�\�\�ӽ�df��ύث�q{�J�\�o�^T[~\\�\�޹d��e�D\�w�\�\\�\�1}`tܦ673cs��͎�\�\�`/oL�-w\�\�Ql��Ҫ\"|\�8�I��<\�f��u�D&I��\�.�`�\��a\�ǫ�Bg��\�K�\��<`G�R5^C��\���\n�\��k��+|�y~�\�+�\�k��|{�\0\�w�\�<\�g�P	�\��.��\�=�Guo�f\�\�\�[_t^\�|\�\�\�Ʋ\�\�\�\�ʄ\�f|�6\�\�l=M�\�R�_M~`x�J�\0?lU\Zd%��0�#\��{���\�z�[���\�\�\�kbbYcB��%\�XGJ�u�\"\��\r�ؾ#3ɺsS�	�\r���X�\�T|>��3�\�{�x=H�>.�a@>�LW]v��+���\��G\�\n��\r\�6و�o(wg\�.T�|v�\��ysΧy.%#p�֔\�Hu�KT\Z\�\�^Q.�ϲ@ߖ��*I�\��=�9\��\��y@���� �2\�\�\�\�\�S�\�SC\�\�pTR�j�/:�IC6NZ4�{�G���%�u\��S���p�2�$`\�{?}kj�\�\nsN�w�\�\����j\�4�ԋ|M ��\�[˹z�b�I�Yn+�H|5G\�vMOW�\�m��ڧ�\�j����\��\��ݬ^o��\�\�o����AK���L�Ɩ�\�{�\�v��\��M�\�W�EP��\0>l?\�R\�}\�\�纍?\�HS\�sK\�m�8Ձ^0��r\�E���~��\��h������\�Xr^\�H�y`\�\�Fl��:[:-3�\�\�[\������	�!%ƽV\��\�\�m-N\��\�\����3��!�j$�x�}m0>QP`\�h\0��\\ͤ����i�K}]H&�\��\�\0~\�^\06u\�y�?�\�\�s�\���\0\0�z�\�\�ܯv\��y�niOl���ؕ�\'ɯ�Z�]\�\��w�=[��!\�\0?��b���\���\�vfݱ��\�R\�\�\�%SC\�g\�s0>�\�\�K:�l����f9\�\�y-R�OX�0��J$~\�}�}\�mo!�\�\�B��~(�\�Ŏ��Հ@@h�iZ��> OM�\�\�aI�zZ�u�\�TV�uf�A	\n鉀=�@�e�j���m�E\Z�P�\�x; Ua VJ�\��u��j\�\���:?��\�t�\�tf\\[\�<�7E���\����J\�*U����#�\�\�<^C��򚺳3P ֚�\�d�\�\�Lm�@�\�\"�c\�W�F \\�>�(_v($\�J]�\�\r�ߐy��%ݸh�W\����pQ��O䓖��\Z:\�C	$�\�Y\�U�����l�\���\���%�S�+�ɒ\���쏖tѪ\"��\�\���Y�\0�;K]_��N_�豭\�x�A\�4\�ڈj\�\�\�uf�!\�\�\Z\�\�q\��t_y*:B\�\�Z\��A����\�!\0���bu�X��)���Bg�|\�_�D���|&^^�G\�t[�b�b�ǒm\n�����=_�WK~{�跷,e\�n\��m\n�:\�K�Z��7/�\�S�6\�\�!\�_y�k\��|s����_\�#,\�~X�u[d�\�?!���\�j�\�Z\���n\"]G�M��\�Lg�-�\�uT�3��h:�\\\����\�\�q�I��~�1����n\0z}\���\�{����\�\�Of/��nu�\�?\�\�?q��\0�����;5\���ƛk3�qs\�>\�\�c܎���\0�������Y�1�|\�oGS���,�@C�kJ��&\�a��(.^��Z�WXK\�QE\���\��\�#aU\�N�(�\�]Q�@j��!.��8k\�w�%Z\�]Y\ZSԍG\�NO�n�S\�$�^X��0\��\\N)\�]�\�\0��Ǖ��\0�*�tAh�}�\�\�\�WW��\Z<��M\�_m\�U�����4\r�H��٧\Z����@Ae�9\�:�rAV\�#A���\�\\\�\'u\�`���\0>�� \���$\��\�r\0\� 2\�JDX�:�\�\�&0\�CPH�n�:�f߹eiw�\\w\�\�^\�.\r\�H\����\�r\�o\��\�|�|�侚t�4S \���?kI�θ�\�\���̂�=����\'\�{Q#��\0~�|M\�\�P\�MX{�\�`������k2\�u\��?\�i����qM�\�f~U\�\r�\�l[\r\�큾O��\�\�\�}X`�\��\�h\�D�欘v�g�\�~�\�\�}\�Ѣ\�\�C\��J���}@\�\n�5\�\�m�\�u�r\��ً\�q{���Ŷ~F\���3m�<Z�>[���\�!\�ߞ,\�o\�f\��\�,���h\�>�؉�9�k��tu֞�\�\�ӥiWt�;5kk�m�O		\�\��D�U\�/���v��zly�@19fG��\�\0K��\�-w\�Y\�>\�F Ǜ�TZ^����\n�\�\��\�ܾX�\��\��{�Ȓ�_\��o:i�|���H}5�T\�{@�~��>i\�V}�rC�S�FM<`{e\�\�Y�W�g���i{�\Z��\�d^�(ؗ�`-���8>Ze���R++ؼ\�*�qw�-�jZQ���\�\�,\\���/*����ŵC\�˫g\�.i�d=xvM8\�Ѭ2}M\�qy\�%y6\0� K�m�\�\0��5���\�S6�\n�t�\��>]�\��w=�Ix���h\�\�\�ku\�\�`\�^\0�^,��\�\�\�\�o2l_�Ō�\�SO>L��\�`uh\�~`C�	h5\�\0��\�U\0\�E#������佺O��\�Zw\�\�EX����ٷoZ�\� K�q\�ү_��k\Z\�u�u\�M\�\���a:K�_<�\���\���+��?�X�[KD!$�d��v\�Rn�&���\��\�\�b\�\�I6�.�\"󻱩\���\�_e|�\Z\�\�\�o��\�=R_�߆\�\�a\�\���x\�\�\�\Zj \�\n.\�.��٬\�\�&��8�\�T�0�\r\��6\�\�ƫ�\�k�E\�9j�\�\���\n\r�\��kq�0Z�	i��6�2\�6�bAN�س�{�\0���~3`��\'엃9���W�i�[�u0m����f�ݜ�X�vSbw\���\�\�׭Rr5\�\�?\�U���J\��چ\�\�۬�������A��\�/ԝS�YL�f�H���Y5��\�\�G%	�ڿ�}\0�\����\�\'K��\�\�g�H�(�Y��,�W�<�?\�\�E#\��\�\��\�WSLe\�\�\\�70�\�\�Q\�]鷣u�=S�=K��o�Zv\�\\\�Zb���˵�N�\�BG��\��103�\\f�n[i�*\�\�YID(�\�aV\��JywmX\�\�\��\�?2�&:\�ml\�\�Fs�+�6\�\Z�d\�\�\�\0��Ց\�$XOa���\��\0��\�-Jd|\�\�\�&\���Uȡ\�\�\��\�҈\�\"@]bS\0^kZ=\�\Z*l�ϵԲ\�\�{�\0:�_3\�f\�+��\�\0.\�q~\�O���R\nڽwGw���\�\�W��|m$v\�	\�)\�z�;���]}�Y�$�r\���q��2�\n�\��U�p\��X\�M��\�\�w\�ݕq\�\�\�\�\nR�\� ˸u\�2a�\�k\�]��\�\�\�\�5UG\�\���i\�^ܩ�����a	��\"x\�;����ԛ?[\�\�3��,\�\�\�Gܶ�\�$�\�ϵ�\�b$}���Uu\��+y�\�5�\�	�@/�=\�\�\�\��\0���U�iu\�Q^�-�W\�tg1r]�\�JK\�΍\�6�`��bJ�>X_l?ݬ\�h56#u�5�L\�sSm�\"Ч���\�0�2\�|\�(��?\��&�\\\�+m��\�ƻ\�\�\�=[�A\\c\0\�\��=�\�+J`ۛ�\�S?m���2����\��$j`\�Nl�G\0{����GKS��ӣ�t�\nl\�\�\0;̿�\�{�>�\�����U\�f\�s6��\�pQ\�A��\���\�9TV�r\�M�y\�~E��Ӎ��;\\\0\�Ȕ\��.U�RD\�\���\� \�`	\�	���s��\0^�b�\�*�Q\�\��q{�5���\�\�Ϻr\�כJ��v�z\�`z�\�Z����i�ȴ\��*>�\�HWm�v�{\�m\0\�m�W;*�v1:\�^!��z}�@���JU\��l\�b�G������\�\�XkI��\�\\9k��g��8XS�y��P��z\�\�jܱJ5<�o�,��]_��:�%�ɣT\�)\�|��ƦX\�u�6���\Z�\�M5�nѬ}�_��氩#�\�ө�J=ay�Q#��L����0�k�Z�u\�%�z\�x��n�!�k#�%���\�k\��x�*u\0x�!bx֭knCT�\�z�\0��\\}e���\ZՕy\r��\�,\�|^�ϯ6Y�\�5��Y¹X\��=�>\r�\�0O5<ɽu\�\nn��ZN_R���M�\�ů�\�\�\�uܯu\�&\��\�\�X\�#x;�.�\0\�{kmE�\�\�\�uW\�RO�-�\�	SmK@?T�\��z\�}%�}e*r?��$�\"��\�k+l� ;YS\��\�)�aT�hY2\�\n˧\�x��\�\��}y:JT\�}%��:\�\�j<�\0�#�п\��Ch\0[%�jM�\��%\�O�i@?a\�\�\�\�N\0\�Mى��Q{�(p���sv0/Џ\�\�5���\���A\0?l\�\n���<�&~t\�4(�\�4xb\���)�QV�\�N1b\�M�5���@�\n���!J\rT�\���VZ\�.@�\"\����\�y{��]X]{�\���z\�\�|�9a/�\�\�\�\�k�ٷ.hd���.\�٘r\�\�\�$vf\�m6\��:\�F\�PE6\��\�\���\0�[@\���W\�=@~\�\0_p����Yj\�וX�Z�9�urU\�\�\�F��\��4\�\�l^@Gs�f���d��I6P��\�\�f:��#�]vO�K�u\��$\�\�\ra���۫\�\�\�Ga�1}O�i?\�\�Zkm���\�W\Z�w>�`\��J��wK�\�\�\�\�k\r\�N��W�\�Mv���ޕ�f\�)	��V��x\�%�?\'\��cx�:QmB0��ܻj���Y\�u�>�/�\�&�x���\�rSԋ��IK\�H-%�\\���I�gK��\'K��-K5QW\�D.[���w\�ܼh5�oZoj���f\�|;��{\�lu\�\�r\�\0�Bw�\�w\�\�\�+y�\��+lQ�8Z\nm��\�Tds\�k\�0ӂlo)�\�\�|\�Ͷ^غ��\�\0�U�\�`u^_T�5���b��E��\�8j|���$\�\�\0߁_��\�@?\�{\�@\�\�\r\�d�\��%\�`�ǳ��~�C\�O��yۈ\�\�\�֪�\��\�׭\�ޢ>\0�ϻ;��\�8\�׻�N�-\\��v@2^\�2���\�;�~ǁ�\�4@AԈbE���\�\�\�\Z\�-�]M��u��\�;\0�I�\�T\���\��!j޷�?Y�\�\�{�4\��9Y�2\�v\�\���\�[K�3��z\�նj\�yޤ\�g�����%VW��\���P�͆&\��U\�ʄ\�\�p\�z��P+\�6A�\�\'�6�\�\�\�qjK\�\�N ���\�z͗\�Ku~�U��<��\�*��{ą�%o�Ϳk�\�Sߕ�\�\�\ZAs2R_r�;\�/\�\���x\�I�\�\�Mu�_L��C\0Q�jbze\�}Y.\0\�\�z?��\��\�~�\�1�\�\�\��\� 1g���-�(��2��=ԃ[\�78.\�o\n�\�\0\����f�\\���\�\�k\�ՐE^cWv\n\n&\�U\�\�cm����ďC���jZv\�m\�)/ށ�\�e���yFV\�\�E\�Q-��+���\�\�yM�U{\�\��\0���a��\�s�A�r\�\�\���\��2PY��\���+�\�V~\�:�\�Hq�ʹ�\�2~\�˓Y\n\�}��8@L�{��=ն\�Qn+�Վ\n�rV*y�גּiS\'\�!\09��\�C\�Ve\�HM\�gF0u�/\�Kl��!P4̒knu\��\�\��\��\�d\��F�}cH~?���\�Ŋ�\��X�\�v\�ӥWW\"|}@\�~PS\Z��[1=\n��6�`��qp\��P�\�\'��i�2c\��z\�=A�\0��)$<l\�\��>\�v\�G�0�\�\�je0�!\�k!j*{I	\r�v0;�\\W\�w+\��~5�Br\�\��^#K^�\"U\�m?\�dj��1귃i^\��\"\�E�	+�e{\�\�\�\�%{)O\�\�k\�\���8i/��\�\�K ШO%��7<�\�\�$%`���\�/���\Z\�\�C\�)M��D.NX�\��m\0�\��*\�\�\�\�\r�\n\0}\�Wk�Nw,����WQM$^>\�Z`�$\�\�;t������su-1֖ǂ�%���\�w��\�I,\�k\'�و\�\�\��\�\n.\"��\���1.\"\��as?�OLh���6�*����\�`�\0?\�P\�2���M(w�Ԩ�c~�6�\�\��\�o�~	A�(\�1\�`>UVD�ג\�\�L�	֘\��\��#�?�u������[��\�P\�\r���\���.\�)�`�\�\��\0\0��IDAT�\�\�K�t\�Ro�;\�\�\�]�\�JP�\�\�?X�O?p���o-\�̏n\\W�f�]��?m97.Z,�\�U�_�քPȏ\�}(�E$��:\�=\�ﰷ\\\�<��\�\�\�w�\�l��\��k���}/5}0\�^N�-��:\�|�\\�gX%)\'\�GW�=��T�\�t}9�@P�W�\�\�`�8\�H�\�J<}�U������=�#��kT�\�;K}���\'K}��n!Ay��Ӧ�oowQ��wj���\�\�y[z�\�s\�\��ۋ���\�Y-�$�ڽۋ\����\0$�\��7@YB\�	\�*�jTp4=\�\������n�[��\���XR\�n�δ\��$o�_O~�!\��/\0`1;�\�\�\��\�\r��\�,��\��;V�	{�,O\�Z���x�W���Rv����Ǩ�\�e��(���h�J��wat��S\�\���\�¸Ӈp��\�<�\�}@�L4^y,�O|h�.\�&OI�v\��@ܖ��3vBv2��ؕn\�\�2�\�\��������^�?#>�\�\'�#�\0�\�\�׏ו�Jf}\�\�\�\�O�hg�\ZpWca\�m����u����\nnZ\0}S!֠��\�\�Q�C�~X�\�b�8���\�nr���\�Y���d�T0\�ec�t�Q=�A�\�\���;\�aq\�^��º�\nv��w�X�\�+�\�C*\�I��~�\�-\�:\�\�\�k���dƝ=\�v\�\��5Kwc\�xAA�?\�\�)˾q\�r�ԡ�4A\�\��W\�\�j\�}y�ށV+\�t\�\�\�\�V\�b�\�^���\�]���{\�\����}_�W����\�V�GL\��~\�?��*\�rGpS��\0Y�\�h�Be\�(+,\�$�JǦ\�e�\Z�\�+�\�K3l�\�\�\�¥0\�P	|�*\�\�wf��\�6\�V������&;�봧\�C\\\�j�ȱ\�N\�C���o��\�v!\�\��\0G�\���Hk\�~�\��,��\0�>\�܎\�}\���\0�]����w|��_ \���\�x3S\�\�u���a\0�s \������\�`\��\�p�\��&;\�p�Ǟ��2\�ݑ���B�w�^~��\�Yw���\�_!g^)����\�;�ߙ�\�(�WH����s�\�ӕ)�\���y\0��8n��;�c�C\�\�`;o��ʹˬ\�W\0>l�/\�\�T�C�\��\�-Wz��_�(ԥ�V\�D \���:\���!F*L�\Z\�r\�[���[\�R�-Sk*�M���\�k\�^��馮+��i�\�\�\\<\�\�\�Rw���_��vJJ\��\�q��#�u�;(V.�i\�*��5�S��|�l\'h;\�\�\�c�V�~�\�o$p4@��#�\�0�dHI9N\�#\�e-\��5n�8\�I|�^����\�\�8k!\�5�`(��;��S\�Ϩp�rw\nr׊�E���Jp*�s\�\n�oY�\�[��\�\��ٷ��]���W]?\��[\�\��\�\�\��:�?���\��q\�J=��%�;m�g�ZL�{K�r�\�\�ʼ��߽dM�a֟��\�)��\�\Zw>\�[��������\�v\0��\�j��]�w��v\���v\�o�@?\�\�hS\�X*M7.\�\�Oşg\�$`W�U?A\�\�\�W{َ\�7^�M�\�B\�l\0�i�>\�\�q�\�%�\��\��6��kA\�;\�?Ք��.�]�\�N�@��\\�ʭ�*���\�l�\�u\��Ƹ�\��\�\�}�q{\�>l������\�}n«6\�^\��O��lof\�mح�\�\ZL�]�!���\�^j��6\��?@�a�\Z~\�m{\������\n\�խ��L3\�WFa\\R���������2b/]%�6!�\�\�ǏH�\�\�O�o�*��i�\�x�\�\�m5�\��D:��|�?\�\�H��Q�\0�d�\'�)���\��ߊ��\�:~�f9�/\0�k�=\��\�C��\�<�Z:����\�\�ὼ�0�KP�Y�\�[��4\�(\�.\�T��nu�\�\��\�η���:���r�}JӬ\��h\�ǝ�@\�\\�\�%u\�\�/�X\�F\�PI�M\�\�U���xy޴�\07t��_䔎\�\'�pg9:\�\�\Z�\�	\n \�ɗ�\�1\��6�tĘ�d\�q�m�^�-}\\��\�0��ը)>\���\�8\�\��w��Ps�oi�>�\0�s;ț������L���L\�D\�\��\�Rn���k�w��\�\�/.��\���\�\�/j�\�)K\�9\�\���\�I+�s\�\Z\0}_n�M5��z}\��\�F5&ڗڄ\�]\�-l\�\�\�\�\0<�\�\�\�\r\�)\�揣h\�Zm	��햼�p%\�.P\�\�\�y&x�&\0�$�wy\r���`�$�GU`S�\�J�\n��\�\�z=�mm6ր\�Tp=�e��\��\\Sl�!\�\��JF5��ۣ�_p\�	�o��U�2doVG\�6�և\�\�ƀ�_\�\�j�k��\�\�\��&>\ZI,��L>��\�>}0�ٲ:\�Ug�xy� ꍐ,қ�\�\�ꑯ�\�]\�\�\�l�\�cHp�\��\�����\0\�g\�\0\�sd�K�mN;ב��\�%SԳ�52\�6\�T8��s�5j\�6\�t$�=eb^�\"^�˿�]�!\�L9\�~$Y� ���X�v\n@%��ά�\�lCȾ�G7� XR�g.��Vr*IJ\0\��\r�\�6�\�ν\0�\n<�\�\n��]�6�^>�\�v\�\��\n�/P�j:�v\�QK%�FB.k��\n.����yg\�i\0<\�\0�\0��g\�dS\�\�qݲ\�bYk�\�a\�!�އ�\�\�\�HCv\�{$�Lk�M7\���\�\�\�q\�q�y�D�M\'.V5`$ph\�~D\�:=\�\�*(\��\�XW�@/��Vkr�5��ux��\�}\�\�}\�/��t\�cyS�1e\�\�\����4k\�\�;\�\�N���ԍ\�\�޼L 8\�:\�f\��\�\�Raq�\�Rc�Te�]<��?mr�y.�e \�/�s\�q\�z`z�b,���Z�k����\ri��;װX\�\��\�Z\�\�m��&;AnC\r<G\�ꜫiH\�\�o+�Ql\�0�{P@\���ғ��\�X�\�V>�\�J4�O��-IuGu�J\�\�|��\�X�Հ�ߧv\�#���D�\�\�3l���Qav@��t���-%\�h�刽\�&\��\�\�0ֺ�\�c�;\�\�|�\�:����E�\�\���M�\�$�w\�\�^���k�)//\�]�°@/\�W \�\�M\�\�g�\�#�a��_��wz�\0�}��{o�\�f\�\�-�/j�MG|\�{@��˻?c=�\�_�^o\�\�\�^�\�W�e�J\�:\�l q\��	&\��#��\�\�o\�_\0�\�\�\��]��(?�m\r�|�-. \�A\�`b{���\03\�\�\�Q\�\�WE	�ު�	墺\�o4%>r�)\0$�|J�(�n�>\'\�\'\0\rE�d�H��v\�uAHF�Ĭ\\8ڼ�v\��u:�疯\�\�\Z)��X_%�\0O��ʷW�\0-]\�j&�>m�\�N�� nI�jSP	9��{ڵ\�\�.r;��%$�t�S �w��|���y�\�@\�Ǖ\�g8�l��=�\0�&\��#�\�o\�\�%���]\�w��#�\\\�\��7.\�\�\�񹜲\�`��\�On�/]4��/�\�\�\�s\�2����nOY\�]���u\�ƻcͅ�Iq���ޕ��\�UO\�y\0\0<��\�;��j��=��r\�_쭳\�N�#M_��\\}\�Uk�\�&���G]Ͷ)9���Y�\"\�6\�5\�Cej\�>~�__�^��v��\��JԅG]�b ��\�^h\�õ��$�\�1�-$��}��\��\�9\�\�|���\�gӝ�d;hD\��\�\��\�L@��\�\�\�y{\�\�D��\�Cx�~\��KC\Z|�\�;y#x\�x�~\��\�\�潙DN���3��?�\�\"��� \0��\�\��\��\�\0_�to���Ґ�\��\�\0\�`E�?\�Z�\0�\�1��.�\\Py��<\n\�\�\�K\�\��\�a�#\�c��\�\n\�?\�\�k\�\��=]��Fm���2��1�*\�\�,\��\�\\�\�z\�\���n��T!�\0�m��\�]�qi��	\�L�91\�I\\�\�6\'\�8���x͵�5Vv�>\����\��i\��a���\��hI���S/P\�:\�/\���?ۗ�Ne\����Z�{_e�fIJV�\�lu^�k�\�\�Gz*�\���V1��\�\�K\�\�|�\�f9\�V^\Z�O�v�M^^\�\�Z�\�\�\���\�~\r�G��\�Qx�\���\�0+A\�+\�Q*\�+OVO\��h��Fkk\��%7\�e\�l\�+�s�����\�\�˻\�]��+-\�\Z\�\�81�?�2j\�\nM~��\�\�+	�B@������\�2��\�az��\�f���\�\�u[\r_�;�\�Tj�\��\�j��}+W�So\�h�y\�~�4R�5�峫\�&pf9ЏU\�:%5Ѡ�7%n?a�AA�ǫ\�-W�!\�%\�L֥\�\\s�W\�f\�p�2������B\�?2U�\�6f�Q\�;\�v�\�E\�\�̘=�Ķ\�X��.;�ЏƚlW֥��\�d\�=�vB���%\�\�\0ے}\�\�y���\�O`\�\�a<̀���ʈ�V��\��!�:\�T\�%<\�B7o&�x�	D�|<\�ǋ\�\�sm\0��\�9\�\"қM1�6\�\0�\n��}\r���r\r9�%՟�\�U\�\��K\�t\�\0�^v\�-]7P��\�>��ݛ㍼\��>���\�\�z�\�܀_l\�@ϛ�3\�\�ԇVǅQz\�\0�\�{���\nC\0��^�\�zu\�)	�\�>\�\�ƅ�H\�G֖ȑ��\�6\'G{\�FT\�v\�;r��2�9�,Wy\�p��\�}�\�k\�L����\�\��v�\�O\�V\�\�ʷTؤ�zG�Mv\�Z��\�Ƒ�\�:�o��RoU\"A>\n�\�\�Sɭv�U�\�y�\�\�.c�r\�\�[~�;�\��r=6�-��\'\�x��[�|�\Z��\����l<\�iF�rJ#\�[�r�-A1�\\�A.��\�\��\�Y+\�gj\��\�\\\�7\Z�	k�\�`��M\�u\�\�_�l-\0�}�ei\�N~^�4�\�L\r\�y�JîYC\\�u\�F�[3\���\�s%�i:��\�٫��X^�Sگ�u�\�s�d\��5o}�\����FS=�(\�I]�F�\�\�\ZX�c�|v�}5Ԙ�\�s\�n�\Z�\��\�D#\�e\�M\�e\�|K�-w�\�\�\�l��\�0X�H�����(,|�\�O�)��\�Y�*���@�\�\��\�ߘ폌\��h��T���lo�\�6�\Zl��\�VZ\Zl��\�NhF�\��\��AW\�\0\�$��̰\�L\�6�t����5<�ʨ�ev���0�\n�g���Zos���d\�%w\��GL�Ѝ\�\�wo�䯑\�\�{W2\�\�E$�\�|Y��\���\�\�\��)�\�?��\��\���U�5f���؅�s���aԄ��\�^�k?�\�9�[�W\'������^H\�����6�\�j�ǯ\�9gE�B�`�;WY��G�j�4�����r\�Fi\�\�Ć�:\�\�\�\'+	 �I�\�Q��\"�Y�6�x_@ӕ�b=�Hd��KkU� \�Zڥ��\�\�1�8@t`g	\�j�\�Z0!\�%׵�[+l�\�t\�\�LO�Mu\�[��\��<6���\�Z�y7\�\�)O��\�\�m֦���\�W[L0�/�v�\n:�\�\�5+g�\�AX�W\�6�^>A�rP3Mby\0���ң#L7�\�\r\�\�\�kW��\�P\�_}��,�?�\�W,/��\�\0�\�j�\�E\�B�_\�׏G�_pc�\�t�$< ϸ\�\�\�g^�֗�?\�e��\0��_\�:\\�n\�\�u>pl<\�Ucs}\0V�\�1=\�\�*_�?�_�\�\�(�6Gf\Z��6�\nP\\���W�\�9ۮ\�r�/2,�	��V�=�?A�n\�\��\�\����*\�P]�=\�\����l�\�6\�\�\"U0^��T�=�+,a/֤?/Ч\�L�2�\�P!��h�é\�u	���\Z�#?�\'���\�&\�Q�0Hy��ζk\�Ċ�ö\�\�ja\Z\�\0�eB\�Ynz\�΄�UuG\0X\�ly�7٣ѿ�CȜ�z^�Z35\�o\�\�X7�Dw}\0�\�^.\�[\���v�Y\�|S`Q��\��.�)v\�\�\�r�\�?��\�=w~�\n�??�\\\'\0�2\�ϴ�?\�gG3v�\"��a{\�\�(\�gG�\��?\�g��ME�\�O!��m�OI\�Q���?[�\�\�x̳,%�\\\�\�k�K$\�d~\�]�{�\"\ZWl\��\��p�K/\�g���\�\�L\�J\��]�\�W�sb���\\\�/-�ޒB\�vm���Ǹ\0��Y�\�y.e\�9�+�\�=迌<�QSK\�;\�\�}�\�vr!\�\�ռ��\�O�\�v6؜؍\�OuTZ��\�\�\�vr����~??�\�Эv�5;]{\nzݽb,��O]|�3�S]z�N&�\0�\�UW��}bv�J\�$�\'JK�;ꮃ\�\�\"�G\�uN\�Q7� �\�EYN�u˹�o_A\�{K��\�1d��S(�\�a�\�-=\���\'7PT\n@�z\�W..Yn\�e+	�j�J\�Q+�\�J@\�\���@ί\�\�\�5gm\�۔\�W��˽\�\0��k�\�ݮ�n�\����ᵑ[쪳�\�-�\�:�(JF�e�vf��V	SMX�}�Y��f��\���\�F��t*�\�\�Vz\�(kp�\�\�{��[ٚX*�-�Yl\�rO���\�ĵ\�	��\�~����@\�c�ڡ�\��%�}uX\�\Z\�����\��\�G�;?pI+.QF\�~�}�\r�7\'�\0=,�R�X%����\�J��RoT���I���\���\�)\r肕{YH�\�~{<P�{]�:�\�r\�	@6\��N�\�\�}\��Ώp;\�\Z���1�\�I�\��\�P�\��^׫�1\�⹞C�\�\�\��)�2�Up�8\��hO���;�ee)Vs˲|�c�\�3V|	\�n�woZٽ\�V�ĜP5\��s\�;O\�/�\��6���T���:��\�O�\' $Z�z\�)�� \�z�C\����m}\�4�\�Ũ:\"�P�;�K��\�\��I|�:�N�\�\������i$\�Y��\��o�z\0z��\0��\�i\�-%�\�8I�=%\�\�\"\��J�1�[_i\Z�$\�z��(�e��\��,\�\�ɰ�l?+\�+W=�\0���˷W�,�:\�2�\�#��dE<���V��>l\��\�\���0=\�>\�\�?$�\�0\�\�˾\�x�\�\�gek�\�M�\�cn\0r�?�\�YW�������BȻ�=��Vf�U5LYD���nD^\�\�\�cY���.�4��\�f���}\��\�nS-��\0\�����s�zO�S��\�Xӛ4�\���9����қ\�A�F,�\�\��G�JtV\�\�\��\���J͵O\�⡪J�>b���֓���\�ʉ\�n�@�6\�Y�ڨ\�#\�\��4z��Ã���m��-\�:\�[\�/ƚ�b	*\0=�eg\\C\'\'�\�؍�4[��\��2\�6a�M\0��4�su�7\�\�\Z�\�\�.~�mu\�\�@�m��xÔ¸7�9\�-��;�l��	\"�NX�B�<�7\�@j�#˳)��$̬~��MyM\���\�\�D=\��+؇->\0\�\�鶭�*G\�Lv�D��\�U-\0�c�@�O�\�\��j���\�\��Y��qV{\�2\�\�[�\0댕_�r\0_\Zl\��\�Ye8,�\r\'\0<�\�G<�\���Ku\�\���yIzu�\�t�\�V*\�\Z\�b*\�:s\�\�UH��9�\�K���\�\�u<�ܮB\�U\�\�U\\,0�v\�\��ZS��wZ\�>W;,5\��\�OM0\�\�km����F�\\�\�ը�ȃ\�ګ�� h��:��2�~��*Q(?� \�땼,Nee\0�L�\�¦dbW\0�1�[4Z+Q��|�@_��Jl\���Y\"�.��Ն�[\�}�!\�R\�\"�>��\�X�\�\���\���n���iR���tͭ��W\�M\�D\�\�k�y��e��L�\�^F\�_>\��\�r��yA\�\�\\YoE\\��X\'[%͵C�x���]K`%���e���\�\��\\\�ˣ=�1\�\�5\��\r4ی�O��	�e�$\�5XU>\�P�l�:\���t>O�\�\� \�\�+\�F�y�k�\�\'TIW��|O��\\�\�]\��\�\�\��\�9�Ǒ��6\�V�)�\�\�\Z\�\��F�VZ��	o�5\�ZO�\��\�ULpʰŞ<�\�R;�܉\�\�Q�\�\�̈m!\�W)\��\�RP�u\�k�_#}7Ɖ�\�\�,/9\�tX\�\�Ud\�z_A@t�y��(Sg[�-�\�\�`�\�P�5T\�s�yN9ox)�D\r	�\�\�\�n\�&\�a[����nʈO��0��dx,mz�\�[��\��&������`���\�<2��B��\��\"�\"O3\"�\�p���A���&��y��%��5owY��\�\�+�����V����\�\�\�\�pu�\�z�?߄h\�Ht)�]�?4�0��vŕ\�\n�G�\�n`�U�#��`\�jo�����\�$�\�յ\��ei�\����\�ʯo� 0p\�L7\�\��q�k�\��\nh\�n�`0\�\��<>\�\�5ȔjP3�1�\�\�o��\�	��\��ѩ\�{=�y߲�h�j����֌�o\�~�$��i�~\�bq\0�\�pW?R��p�5\�\�J	������\n�H{lK\�wg�aw�\�\�W2�\0�?�r�5 �\0\0~\�˽��yݲ�i]b��\�\�-\�\�%@\���+x=�\0.��=ۏ�\�:X\�\�Y\�ZZĒʖ.u�\�P\�x}�%�c\�=\�\rp\�ku\�*ĳ8\�`3��6A`���!�\�[K\�(V�4��b5!QV#��,\�|.�Y�Xin�}�FRWd`��\\ǝ\�j~���Q�\�\�I\�3 ��=�W�?I�I��\\\'��\�7�Ў�\��&\ZlR�j����5l\�j_9J<L��C<�\"�h�n\"�W\'{l�H\��s�n�~~or�_\�mۣ��Qmx\0�?�\�W��\�\�\�j�)����\�\0�R��l\�>jEI\���.EW�-w�Qa�-t\�!C�5�0^]��Z�\�\�g	�\Z�5\�@`R`\�6Ԙ��\�\�Y�\�:bQkn��\�؏\�\�T�\�,^��H�\�k\���d1\�`*�\�%�\�\�߳.���?[����(\�\'\�\�\�\�	\�Ϻ}\�%�\�R%_H\0�:\�\�D�\�\�\��C��\�5\�����D.�kȊ���x7㬻�\�WR\���H�\�\��Q�\��}P���7\�}H}�\�Y�m�J֨SwՒ�I$��6�$\�\�\�U6]Wͪ��&X��P����\�\�g+|\�H���\n�\�wL��\�\�a��\�$��\�\�^S7��зs��\�\�d�2�-�� \�Z�6-q֒\�u\Z�N�j.�\�\�0+��g��\�Xi$�	�\�\n�T\�\��Y��Rj�\�;	ut�C¬\�\�=7,4�\0�\�\�rM��\�-\�\�\���\�\0�\0~V�\r�A��A\0\�\�>\���\�Qg\�\��x;���֦��\�f��\��6�\��y@�\��:\�Jg*@A\�\�*rv0Z\�\�\�p�\�\�xs�\ra\�\�\rw\0�J�B\�\�%jx�nè�>u\�K�f�ky���\0:�s�E7��zM��l�=?�>���f\��\�N��\�T-̱\0Vl��\���+�\�UX�:ۙjp\'+��0:AVJ\�\�&_��\�P�K\�w�>\�?�\'^�\0�\0]�_�)�\�4\�Y}ke0�!z\�\Z\n����6M^Yb��\�\�\�V�\�e��<���Z\�q^�&�6\�|[��\�\��\�D��..�v\�H9\�*Y\�L�\Z\�\�k\�c\�m���V�.�\Z�����-��\�r��&��C���L�,�V\�\�l|H*\�f\��*͸�3�<0�Z1��\�r��d��}�\��\\(,�\�%�\�;\�\n�?@_��z�\�A����s��Sgظh�I@\�&G��̺\��|Ȯ\���B\�a�\�1l0�\neĲ\�h��,c�8 \�b�\�G��\�H�&m\�TK�\��\�|1��qj�\�~��i�\�\Z��B���Kb��V��|�.\�WW\n\�h��giZ\����\"Ϻ��]H\�΂����\��WQKz�5�bo�xX>^�W\�1�v=íKT�P���TT��@\�Uy�Bu.g��u!�U��rXٷ��Ʈ�\�\ZY7`x\��>o�s\�[��\Z\�}O\��a�\�|fj]\�N\rdS\�y��F�\�\\S\�7���ku;�/K⫾\�K\�(d��_D\�gK\�\�\�c��뫵��\Z��p�M{:�U\��jh:�\�י�z܏*۱8�\�\�\r.\�R\r~dP��|�>��f\�\�b�\��T�\0���\�\�L��\�-\�\�&�\�fdYb%h�����au5����\�rw�\�\�_\�)�t�>�:\�&��.ƺmC�u\���\�!\���\�\�|�@��\�\��*<\�\�\�\0`V9\�\�ămQ\n��_\��\0O}�V��C����\�\�\�\�\��a}$�\�a��\�:�km H��&_EDY^\�AA�\�j�Ճ_�`��lYF-,v�\�\\7ޜ5\�͇Ѕ#,t��5�U�4\�eŊ��tԈ\�X\�r�㋚\���\�[\�\�-�\�o񁧬\0�_|�\�K\�Q:n�.\Z@_�\�1x.R.֊w�Fy1��&.\�͝�O�\�&ģ �1>\�\�RӬ\'[\�\�H�<\�Z�����x\�y\r��,e\�V�g�q���W\0D��W�:�1$�ύ�*\"h\�v\�s��\�6\�\�e\��ժ��;\0>\�H�\�@j{5X��\�މ��\�k-D]\�\�<G?+o*�+\�\�-m0\�\�9�0X7�lJ\'����|�\Z��$U�/��\�{\�O $ �m��	�)3�\�aأ\n\0^����\��}i8��s�;:�������\�\�\�-��\���`�\�p��2�t&\�\�gݸ�\�\�Ϝ�\�\���\"6\��\���y��\�n\\9	\\�\����ۑ\�\\\�[���~M�\"\�\�ᵸ\�Ҁ�\r7\�F\�\�\�\�Ӯ~=��\�\�&��ajs&\�kct��\� ׆)A�VUw�s_�F��(9\�\�X=e\�ԕ�\'ЗruSұVq�@;�\�\�j5P�֐gsM�6מ�\�\�|3ʚ�;\�ߜmf��,��|�\�N\�iםh���u\"\�\�1\�7�3��s\�p���YJB/#�\�/|P\�ubN~V2�\�\�\�\0v�\�!\"\�0v�7u\��fXW	<�|;@mm��\0m ��0���Z\�r\�j�\�5\���N�\�\�Rjv\0���:)X\�཭\�]���փ\�#\��\��{�p\�\�C��u�3V��6ƅX1l��MMS;\�\�<�_���\�\\|���]�\'�\�^\���UE�\�W��\\\�JF�\�\�u�άAB��\���4\�\��\�\�\�X?l? _\�2\�rm\�̪���\��\�a_Ʌ\����h�\���\n\'\�UN�&��\\pZ3��o\�\�\�Ϗ��U/��x\�v\�\�\��@=\�`��Fy\�pC-2�@��\�8�j\�\�/��\�v�axW[_�yև\�\�)\�\�\�P\�\�S�r�CMB\�b�)\�\�\�\�\��5q�\�}��\��y�B\��2<�\�(��/r�\"w���ː�\�R�\�\�\�@�\n�V�$�\�g!ٯ\�\�0��\����\���g,���ޗ�\�,@�M@ϹsΩ65\�zb\�E��\�˝��կ4\\]ê%\�\0^��V\���[��c�q1�_s�M>\roU\�\�\"\�y��\n;�R��G\�)�\�W��Z\�w\�[�.\�*#��`P��EH!㕈�3{>U\�xn\�c(\0u\�Ώ��\�\�L��^�\�0Aw��B�\�\�\�k\Z;0\�\�jα,\�,w�ߥ\�\�\�|H �\�s�\�\���:�\�f�g\����>\n�CΘ� �0\0Ҙ$m-\04a�\�:�Y�\0|y�Pq\�W�K�\�_%(�8\�\�\0\��K=�yW7\��w��^\�x�R�)D\�9\0=�~�J�\������\'qG+J������6���n�\�\�c\0~u�\�F_S@C�,�\"x\�cu�Ŕ\�\���\r�\�\�f_G\�s\�\��x��wo�j���;V~\�*`#1�\0_-���xV��\�l�!5\�͜oMM��ddpb�u�\�֛\�\�\��$�>t�,�\�ι$=�F�!\��\�\�u\0,0k\��$�\neT*������*,L5���\�5\�T�1\�\�\�hP���:+\��\�:k`�r�k��\�><|�S\Z���\��b`e\�\�Y\\�\Zޠ^o\�#\�Uq�0\0�Z0\�u�iW������%�S\�{\\��Qn�\��=��\�\0]\�K\��x\�}|>� \nIE�-�}���\\\�]\�U\�\�uڵ�x�3��K�\�ұ>?�Ǖ~��\�J\�\�Ħ)m7\��\�H�sV��6A+\��XC\�\�*\�v�kj�\�N�:��u����\�_kJJ.+U\�\�q���D�]M(\�\�\�\�O�\n�w\�����\�}\0]ِ\�}Ż�DY�I4\\s�d�<_VK\�0\�\�j�1�\�֕�\�Zx/;y��a{��|%�*�lR����<�QeS�\�ss\��~T��r�J�D�M\�|kL\�\�D5�\�7G���x\�)\����&$%@D���\\\��e��\�`/l�4]�&\�\�\"#o�6φa\�z\���z\�ad\0ߩ�:\0\�+\0Qg��0�ˁ�W��bw��S˃\r\0;�%c\n0/�zxm]J�\0ؽD\���g�qS\�\n<.�h0Go~�\�\�Vx\�x	\��\\n����NRVgU\�Hܖ�\��\�Zz���\�:�[��y�g�\�M�\�\0`\�\�\�xm\����\�K\n�и@�\�~IAn5�ԛGWƇUa3��4\��\�ëBN\��\r\r6Z\��a�:@ߨ��\��jh�c\�N�j{=��UR\Zh!VjA	l�{�6\�\�\�\�!Tcd\'\���8QB^�f�C>�u����ң��\�LU\rv\�5\��S�W��\���\0_	൉W�\�\�T[\�(\�\��j��\�iGj�\�k@h0���j�����~\�Kȹz\�\�֧]�\�҃~v�O\'h�_?\�\0->\�����\�)\��>��ؓ����Z\�W�\���\n�Ux\�\�\��Ī��\�$�az1�\�N>\�пA\�\�V;��cWUJ\n�b~�ޫ��B��IՌ(&�E�\0�ђ\\��~N\0�\0\�\�\�\n(��j�1T�h�9�\�	\�[	���\�I�`g�4�\�G\�|\�|�?��y��-�)�ہ\�`M�0&e\�9X�n\'V�\�\��:�����m��\�\�ؐm븎\�i7��\�z�����|�1�*\�a\�yx~�`q|��\�\'��\�Σ�u�>�\�$y!\�q@*I��Lq\�>�}Pc�9�\�����~~�\�\�\�s\��\�9\n����V�\�D)�\"V\0��i�\��*���\\��y,\�\0�\�\�E�����?[\�Ud\�5\��VY\�\��J\��:�C\�?���ͻ0\'\�\�[�#�kU{k��\�]y\�n\�kW!�^Ym|H\�\�R\�z\�\�������f�\�\�^3F\�\�y\�jo�c�X~��`�\�h\�(R\�\�ݕ�s�n;\�\�s�?\�\"EVG �\�dM��^��]5|6�lmѶ�\�[��-\�H+���W�7�\\��6\'���5���cH{\�\�k�f�z�4\�@\�W#\�+܎��\�\�V�>K=ayd�<}��C��\�^\�\rr)\�\�ZT��\�Ge\�E�\���\0|6?��\�2�|\��\�2��tA �O\'h+a\'S\�z7��\�c*����e^9i�\�O[Ń[Ζ�\0i���\�ͩ\�\�!�y�W��T��Eu�o�\nq\\#�a��+�𐔎��\\\�è6<3M���ۏzW3Q���o\�g+p��j���\�\��\�\�Z�\�׌;�\n�UO��\�\�\�\�Q\0>\�zrE\�\�\�t���\�\�\�\�ut�#\�ㅟW��k�\rt�J����k\'V\���>\�Q[l.�������]k,�\�&�}c0<\0�U}׍\�\0�\�k���\�ܯ��\�\�\��C\�Xm���%\�*L\�m�\��\��\\\�96\�0{��\�\�\�7\�\���\�W\�cU���\�}��@��\'h���~\�0\�E \�Bl\���a����4�\�<j�~��\�\�!�y�*L��rM�Ta@�q\�e_��nrQ\�\�\�l�eea�{.\�7�\�۱�_m�\��O\�\'YG�δ�\0<\�>\�k��\�.+\0\�\0	��q\�\�\�q��|���[H��:�74���\�m-6\�\�ns�]6\�;\0pGm���\0WC��\�۵�\�w��q�U��\\�\�N��[�f����J6���~ʕAϵ���\�\�)\�(����_\�ri�\�(�F����\ns\��\�\�_\r>\�Y���<�d}l�UĄ�\�:�S\�pS[�B�^\�h\�=X�\�*Q�j��\���,|\�I\�\�e\�\�3o(��˼ƺ\�^��(\0\�\�gz�\�jC\�\rȸ�\Z�\�s��B���2v{V*�\�\�\�!0���E�k�Td1\�azMeV�g\�we��ĭa�\�\�\��y���F\�;xoQS\�,\�G�Wk�>��6��5{�\�{��\�`ط�\��7��w\�N�\�\��\�W�c\��.1}�>SR�}�\��\n���®\�b\�\���ҳ�p�b*5\� �+?C_O��zZ\n\�Ĳ�\�y��1���\�.�!\�\0,|O��%�K\�#\�\��\0��;r\�,\�\����\�Q\�0�v97���\�m�~7Q\�\'�\�\�זzZ��b|\�Z\�\��j�<@\�\�z�S^\�\�\�s��\�[\�z/�\\\'RH����\�\�j�`+z��ȇ\�\Z�\'Z��7���-�%M\Z\\$�Œv��^�\�,\�f��pa�}s\�\ro\0#�\�o\�fuqx\�D���\�}�\0�\��N�mHz\� \�\�j\n�kd\�(���wc\�H9d��v\�jm��\��:���\��l�u\��|6\�﷉�-\�lu�\���ބ\�X\��v���\0YS\\�:!�iV٧꽑�\�)��}���l�\�B\�$3M<O�o@�\�\'}\�W��<mzl1�g\����\�\�`�<\�.PJ�<}�}3�o�G�h\����_�x\�j\�\�f\�\�>Ts����}+\n��?\0ؑ�w;\�rB\�-�\���|��?\�-\�Ϋ\�6\���\�Y��\�\�\'�/Uvڲ\0}�[�۽׀l\0,�vY}�+\�n_p���*k.\"�L:\��0G�\�&�2,��/�ŵo��\�A�ĳ\�_�e�\�\Z\��m:X5IH���H{|�jF���\�`X�)YW�lx\�\��j~2V\�y�1$�ږM+�Yݍ	jn�-*C%\�ZG6�*C�R\0}�SR\n8\�\�\�\�m\�\�V���X�M��觚Y-%6\�Z\�Pu,7\�\���[x�=X^�ƛ\�	p\�\���50�\Z�_ц�\�\�\�(��Q�\�.��Ɖ�J�9��	<_\�6�a\�%Ixm\����b�dW�R%�,:\�\�X\��3ݰYW�\0��|��]��ビ�_\�\����ذ�\��\�@�\�\\m��Ȭ\�[	3\���O�a�\�\��u`�\�}�v~�^�\�ѐ�1˗�Ya\�\r<i�ۜR^C��1\�F\�fVf�7\�\"+\�\�^��4�J�h\\[i�?\\\�a�q��8^P\�c�\�\�kl�\�6l\��C6\�}\0~�/`C\�S611e�S�1\�\�\�Sc[�u�\�\�?١:<:\�2\�Y\�\�\�v@?�?A/\�\�(\�{v@`��\�y~��z��f\�ٳ��Uk�\�8T^\�\0\�ST�m�\�\�XoA&L��z\�\��^\�;5\0���M��4�u\Z��\0���\0\�?����z,�S,7\�eܿmYح�\�W]�||�V\�\r@�f\Zw/[\�=\���|;�\�Qh��\�&\�6\�j\����{�z\�k\0^?�\�%lE0�YS��μ?R��0P?R�K�^�h�\�\�v�_�\�\\�\Z��\�k���������\�1Xy�ϵ7O\�P\0m��\��G��\�c\���~l����\�(\r˘h�\0T�Ge	��s�\���H���kQ*7�(R��<�gJ٘�~F�o�=�ϴW�\n��\�\�\\��Ӏ~��sbI;\�n�]\�2�]\�Ѧ�O�	�7V\0�5��\�\�\�\0���z\�\�|xz��J\�&�\�\�e\�a�q$��rz\�\0�\�^i\�c	�\�6D\��D^�xy~m�5�7\nx�y���\�\�v�3\�sfa�\�.n�tV\�\�\�\��\��\�.\��\�\�(a tq�k�0o�FDW<5�f\�>f�,]x��\�0\�\r\0\�~��ۭ���\�Gz\�6��\�vM��:\�\�v\��\�\�\�4q\��\�\0�dV�Y\�Dh�kLg�,��\�F\�D�\�\�	�ʛnv#���\�QUsZ(-)���b[\��r�_!@j�c��\�\�}1ׂ\nmڐ\�0�_������j\�4\���W�:yy�\�\�\�\�\�lER\�y�r^���\�V\����\0�a�<�q�\�镨�`\���b|\�4� �ׇ��	J\�×��\�í(<\�\r\0\�\�ˎ�DS�\r\�\�\� \��wGGvޔ�l�[H�l\'�an��y�N�J��ܿ�\�Gҧs���\�ܻ��(�j\�\�w]Q�K=\\\Z�X],�\�%\�\"���K\\Ϫ&�	#�0���2E\�\�\�\�M�O\r����W\�PU �\�G\���7�Tz�v\�w\�\�+�Z\�C�NM7\�\��c�\�W�\�>yu%�\�A(\�\�\�\Z]ݔ��(\��z��\�+��\�^&���6���5�Jy-z=0�R�\Z�usa	\�ʻ\����\�&�k0�\�ݸ�;M�\��~��/�o\�~+LzX}\rK�$�%\��&�r�:\�s��%�z��\��x\rJ\�YT�s@UY#��႞�ɦ%C�몃�Ç͢f{Yݭ\\\�,<�\\o�-h\��%�rIy\����z\"i��::�\�\�{\�h\�\�\�HI.�\�Fwq�i2\n~�8\�+�|bՑʯ��8�*l֐\�E�\n�k�>+\�_\��\���`�l(�wL��+\�:\�:&-�Ց\�\0o���\�#��`�>�y��J[�\��V\�c\�U#\'\��	\\\�)�3�p�@`��\�[A�,�Vb�*lAC\0��>�skұ�op~^㎗��3��\�0|-L��S�jc��\�`5j�\Z��\�\�|�\�c�x���\\,�\��*\�䑕��c;|�N`WG`���j͈w��_\0_(�HK#��))܆r5�2&\�\�\�u\�\�\�%�ށٝGg]�\0���\�5\���|�<����\�Y?Z�u\�\�\0�?Z\n�^�my\����\�답��l���!�~~@���2�v�kx�kyI\�w([\�QI\�.��\�\��B�Q\0_�L��\��%n\�SJ��H>�ϽT�ܓߓ:=\�3ֱ\�h9A{R{\�Y\�s�϶�\Z��*�\�\�#\�|��TQVA\Z�1\�Z\�Q��\��:�\�r��~)��\0׍�~\�\�-��\�9\�\�,~~�kE|zL؆�\��̐�\�\�*�\�\�ټ�ꎗR�$�>�z���m� \�j\�\�*o\���\�\�s�y�\�\0\� T0p�\r�\0\nR\�\"\�5��4\�_G\"�\0\0v�\��s\����\��\��\�\��9~f��\�~FY|\�D\���;BD\�\�1J	\0�5�@�i@d[j�U�ޱW-��B̡|\�\�k\�\� \�Z�\�C��\\�j�Y\�Vj�|�U+\�ߨ\ZQ�\�\�/\�\�4)\���\�\�D.�\0Y_\�\�k<\�>\�ˌ���\ng\\c��1S�m	���\�[@�hsƓ�0�\�a���\"��E\���<ϛk+�\�YD��\�\ZV W��{�\�_c��b�\�&V�wy\r\\(:\��#��(\r�)��@\�\0赩�+���0�Mp�\�ڸRэ�@��A24\���K���e\�E�\�\�#X\��0��W�Ĝ�[Vl\�	w�,\�&��\�(\��>�\�\�\�5�\�F]V \�&6,MGv\�{鬥^Ļ_���}\�YI�DOE\�\�\�>mo8\�볘&�-���)5�M<\�(�f\��Zu�9Z��&7+]W\nR$���l�R�ոT�L\�\'x�Ft^_W\�gv�j��|��y�XG{\0f�\��#\�\�#@/��\�]�UY�i>�Ƈ��\'�\�AM\�q��~�PMP3	,y\\G\�߀\�y�\0[CL\0~J�\�K\�\�\"�g!�u\�Y\Z\�\'�\r!uFm	�_R�\���\���lG�*Ǒ�〜 ��\�\r�2�zm-\�k�H~EB\�h�\�o�zx\�\0oL7\�܊T�\�	k\��y?`C.���\n�\�[\Z\�sAGk�ע�l�s#rv���\�R.�p�-��\�\�\� \�\�9XD�/7hS�����N^CL��\��3Su�m\�w�޻u����\�׸���:V��\�Л.kLGIU�\\\�z\�W\�*\�6\�Ր7�\�-��FSy#�z���\�/�\�S\�,�\�\�P\0�Q\�N\�\�\�\Z��\�j\�\�\�C*\�ܑoSu�6]��\�5�#Uf\�S\�P#~�\�MM\�\r\���O\�gd)\0\�E��\�=\�g\�[��X\��r���\�\��@�\�\�su�\�r�a�q�Ki�cW�\��v6��f\������Ǡë�u|�\�\�G$�G��9���]z\r�(}p���6e��\�IJN�\r+P[\� ���k.;\�\��n\�E-�OY�\�S�t�[\�=���\�\�9,�\�\�o�羷�K\��;~\�o^\�3Jp��\Z����*T	[�\�\�)�ԭ\�B�\�|^��6�\�\����5]D\�\�6a%=\�3�{9�Tg\0�ә/�F�Od\�k�J\�\�P;�|�#:����3�\�&��k�Q5_+��\�\r(\nfoN�\���l���7?\���f(cSG�s\��^�\Z��U\�\�)��\�ܞ�,rW��\�( ��\�lU�\�?l;\�,n�X�Zr~S=\�\'\\3�U��)�\��Hvn����\�\�\����\n%��\�\�\'���\�\��\ZAa�߿:6\��}���.{\�oہq\�\�gx|�\�59j���5\�\�\�1�\��Ըm��m�k\�ە\0k\����}�Ys\�J:O2M�U��J`�C\�Z\�\� .�K���{�Y�Z0\�\�^�}�\�\�}�d��\�\Z����\�c���5�$��po����SO�/\�\�+Ǿ\�K�`���\\\0:\�Ŵ*|q�ju�\�\�\�\0��V\�\�B\�B�I��Uv���CEi�F��i�\�6V�;$\�\�O��䂛G�/5U���;�E:\�\�šzz�\�4*A�H�\�7��h����I\�lȨ6���,?\�J3\�]\��\�� \�2\�:\�c{\�.7g(+y�\�{\�	��Vg�1�\\��W�a�ꐫ<{�jh0r��e\��9��a��\0?\�u\�K�\�g#�\�&�t�\�\��\���R�|O@��=L��%���\�\�p���t\�*�j���\n~\�:�Q�U*�+\��\�Z��T[�\rl�誖dЫ�C;�ڃZ\�\ZS����jf�ʒUG� �q\���\�Xs�}ڑWC�j\�sM�x\��`\\9Hu�@\�C�}>��*]�� �઱k\�֜\�*6\�\�H�����@�6uگ�\����ZP :\�Eẽ0��ަ�ڵ{�����iۜ�\08c\0[�\�F\0�Y�\�\�[\0o�\�L&�@O$t���Yfl\�M\�Ѡ��)��ȝ�\�4ja�7���g<6`gms�ۙI\�Q��;Z\\�ù۟��\�y_����i;X�g\�\��\�_\�\�\��\�-O\�\�R�\�lq�\��mo�\�6jm�\rɫ�\"� ƑN\��V�k\�\�0wV,v��̽{\����:+.\n�\�\�8&\�r\�+�\�\�Z�N\�7�!\�1\��{�Yt:�\��\Z��6\�ʰ\�C�\\I/?�Q�o�\�\�\�8Q\�Ï�qך���Y�ฎt\�`�7V�iÅ\�S\�����H���x\�_�\r\�\�PN�\r\�D��=�^�б�a�\�PST�z|@\�﩮^@��&��:\�N f	jӥ3�a^\�x3���SN�\�\��1��a}�\�\�\�f\�>Y�����C\0\r�LL���k�O���$�m�UE#�!��zֽpm�eݾ���g�wC��\�]S�\\b�r��Y|�\�γ\'��֒\�ؿA\�k��yʵo-=\�K���GK:\�������\�\nn]&�<�\�*\�7\�,\�o��ɦ�\0_�Pk\�e|\�?�\0\����b�Mml+\�\�2���.�H��Rz� u?\�\�\�	I\�eI�\��\�:U�LW\�\�j-D\0�x��**\�\�\�\��\�jK��;�rQ�inø=5��Fe�d��\�ٶ��6\�6Ni\��\�\��\�\�\����@�\��zg�;�_�\�\�\�\�\�LO\�\�l��\�\�ms\�g\�Ӛۮ$�\�\Z�\�a\�	\0\�\�\�{�\0]{*���\�����q�٦�\�\�ό��73l��\�7��y;Z^�\�k�dcޞ�\�ٓ�9;Z��\�U\0\��õE{��bO7׸]�\��y֜=vϝ�g\0��\����\�(��Ζ���p�l�<\�\�AÎUU=֙�i�\��Vʅ�j9!�xI@\�*�w׊BC�\�!���\���XU鏬$i�b��m\rj\Z\�]\�\�l���Z�VV\nӫ�B�\�?�l\�V{\���9���N�c|\�n%�$�\�(\�\�ڂd��Փ�\�l���@\���\�\'\�u�=�\��H\�L{\�����PFx�O\Z\��:^�nj��|3��@\�ǻk�yZ�\�וq*a���p�w\�\�_�2�X\�\�\�ؙ�jm�߭���ڸK\�U\�L\r�L��V�R��c��1V�?���\�.=\�k߷��p+�\�\��\�{\0?��\�ݼ��G\�_�h�\�l��C.Y\Z�����\0=\�\'\\����;���\��oaw��o,\�\�?,\��)˻s��\��+�a@ع\�>OO�\��@�\�\r\�w,�*\�v��d-\�Wg(�}7�ב��Dڕ����p?���+�Am&QT����\�\�1��qW\�,6\'�+�\�ks\�\r4\�Ɯ-ﵮ�]/Ũ*$�\Z�tj?��\�z+ʬ��̆�Pg]\�X\r՝x�/�\��\�\�\�\Zk\"U�:�5	�Q��gK�xa\�\�aJ\�rsps\�\�UJ\�,�\�=��v`\�	�a�#�09D\0и�A@�\�\�\�<_\r9\���P�\�Mسo�\�7\�f\��\���jo7\�\�\�\r{��hOwg\�\�kƞ\��؋\�m{��k��\�\���=\�Y��;����f���`�	 /\�x]D\��4\�\�P�\�O���x֎ji����YKA�Uq!\�>����,+\�+\�rC�[��U�� \�d�ZC\r�J\0i�L��\��V�JH}d\r\�\�\0ߤ��w\�\"���ڼ\����!yi�C|��j��2&\�\�^z��\�ɧ+(9P��+/���Bk\�Ʌ5��91\�Q����b��)֔�f��0�2���\�9�\�\�\�:�ѭjZ�:�{\�jP)M�!\�\�\�\�\�~P\�:)\\d\\|�z�R�oǪt�\�\�\�+\�k��\��ՕΫ���@{\�2\�gI�u|\�/�=G�\�\��@�פ\�\�,\�\�Kr]�jR�X�\�^�Ԧ&��:1\�����x�P1?A_�{�\�\�\�5\�<���E\�yt\�rboZZ\�\rK\�\�\'\�\�\�/id5\��\�IK�\�\�\�\�\�g�ٿ[¹�Y\���Z\����z۪c�G��3�\��}uΗ/\�x�\�\�;{\\=\�bW���)��\r�A�rP\�G��\�Jr�\�؉\rj\�(p\����9�e�>_W=Y�3y�\\-֨���5Q��RU9�֧\�p�Nv�P x�\Z/O2�\����,ICA�[7����\�\�[WU�u6\�Y?\�ͯ\rs����� \�\�b\��� \�9p�\0�/�\�e�^�/\�W\�\�\�=�+\�]\�I�,@�Yv\�\�s`kZ\��\���\�w��\�\�\�RuL�\�\�\��\�\�\�\�K\Z,�.�\0s�\�\�\Zr�zs\�^o/\�\�U\0�f�\�\�\��������`�\�\�\�]{w�g\�\�ٛ�m{y�\�sV\�5\�׬�wk<�`�\�k�\�r$|\n�����k��;`i7G]\�(\�a\�\�8k�Z��0+���D+5�%\n��t\�js`\�\�d�t�I��*)Y�^x1��\�L\r/�r\09Ho^̧�\��\�lW�6�+	C\�\�I�|���[�ا\�\\Ԁ\"��x���]�\�+U�k�u\�ً`�R�\\\0\�β6�F[^��\�\��֖gM����Zb\"�I3�\�Y%J�.2ܚ��m\0�#\�\�\�\�ʊ��\'\"S�H՝%\�\�K_9�\�U�y�\Z1\�6�r$e_Y�\r(ɨ\\�%\����<\����R�\�Tr+�\�4�\�\�4\�s`��kDԣ\0\Z\�	^�\�x�KVo|���H+\�Q_\�w����-\�F����۰+�q�\�ۖq\'ؒ�.\0����FX\�\�\� \�\���g���3��\��hV\�%��\0X�Z\��\�Z;\n��0\"�\�߂�W�V�+�\�\�Z�5U��*<5�\���&JVE7:�[\Z\�g�U\���㮃-\�6޴i+k\'p;5U\�uY]�c�\�r\�\�Gkav7�NlO�@\�\r�\0j`z�\�b\�tN�\�IC\�D�\�����\�xw�M\�\Z�o�\�(�}l��4�Q\'\�q�\�\��c����\�v���w\���=\�Db�\�\�\�ʤ\�/��\�>$��++\�\��6�׎�>R\�w��un���\�~��	!\��\Z��\�\��N��~\�z��`oa\�w[�ng\�\�j��\�z	\�9\\\�+�\�1�?Y��O7\���=־}~�o���\�9A\��\�! l.\�G~\�+\"\�rW5�I�.%�<\n����\�7�\�\�֚G�\�p\�zرh��!��`\�2�zY\�#+�!5R�R�p\"`�HV\�]��\r���0\�\�\�#�yߚc��UoW��0��3��\�\�\�6N�6\�*�0\�\�,͡ \�\�\�r�\�+)(f�;�sg?���:Y���J�G<�Aq:\��K��ִdkL��ڨ��|`u��V�P_�\0S3��96� a\�X�\��֖�\�-�/3\�ue\��\�v�\�x�\\l�/���{��$�{\��_�k/�E�ZnHN̯z�\�d��y�IVLU�\Z\"0t��Z4�;+�@�n-�\��2�\�.\r\�CY��\�w\�Y>�/�\�v�\��^u�\�����~\'\�?��?ȿ��?,\�4,��_,�ԟ-ꇿX\�ٟ,\��=��MB�T��c\�W\�\�\�W ��\�q7�]2�V�\�Ϸ��;c\�\\\�\�\�S���Q��/\�(\�K���HS{s_\�窋�mUR�O\0U\'$�PP�QMV��;~\�{\�J~b�f\Z�Rtub��|\�;\�е�c[�^;ˡ�\�W{hjl�xaҍ�{*�]���/6x\0��5\�o\�؉w�0\�\�\n�_r�Z�ߛ�\�\�`�_��c:\�v@-�a�{z\�ہ^Yz:\�\�ξ��@\�\�N�\�x�4=�kƼz�@�|\�\��\�p�\n��\���e��jۧg\��`�\�k��b\�>�رO�\���@3뗱��	�\�ܜ�\�0ݣp��Y�\�\�\�.�3M%Q��\n��\�Z`\�z@[��oO�r�\�+��\�n�\�e\�U@܀\�\���!D�o\���(�N\0\�$,�\�{Kr\�\�*AU9m\�\�\�v\�0��\�\�zo9TV\��Y��)�\Z)\�G�\0�ߦtL�\�`E�`\��7ayd��S��%�a��\r\�e��\\\r)\�c\"�\�\�\r\�	�q��\�G L�(�nTB/ܧ�Nԃ�Yh�l�\�KE:y*E\�\��>\�u�\�\�5�\�Oj\n\"��r�\�]=�\�\���ZI�f��\�g�ӎ��z\�]\�Nc�\�iE`�Xa!�\��\����\�UZ\�a\���W,\�R�\��\�\�r\��Ӯ������\��\0���\�}\r\�m1\'��ԋg����%5���\��M6\�#\�\���\�U*�:�\�\�Yw^|\r�\�V\�(\�\�#�U�\�Z�\r�n%?��܆��\�X�X�!\rU�ܬ�\�\�h�\�%����\�\�﫹.k\�l��ϝ@+����\0��Q�*~R$;�`\�\�m���\�]cۦQ\�s�k\n\�3\0���owf\�\�\�=]�\�3\�\�y;�\�`\�^\�\�SXS�c�.�`CGe�^B�]Ga\��\�\�\��+�\�k\�~|�\�\0&��\Z>�\�ó�\�\�\��\�����\�|��\�Q\����;���\�u\'�\���%��n��ܱ_`�_�\n���\��\�~�e��lڧ@�1k���_\�ex\�d��ժ�\�\�b�6���P.:�怆\nhc��\�|\ru��\Z\�,\�̳f.���x~\�UD�X�[V\Z\�\Z^\�>�ZH\r��Pi\�^��#\r\�\n\�\�	�C���>�_\��j�XM)\��ŁZef���Mu��+͵��U\�T��t�\�s�\"\�\\k��\Zo\��r���&j����*\�\�\�\�o�T٥Pn3\r05㙛P/\�b�a�n�&\�Es���\�\\��>A��E\�YwZ��@\����\���t@�倯��C�}�0�\���B\�\Z(\��\�k�v\�zh�O\'\0\�R�v�@ߑ�\�#�IV<���\�5@C2:2\�\\\�nc\�=��\ns�)倾\"���K��wnZ\�-UB^��]\0(��~z!V���}�K��7K��\�_�\�\�\�\'#��Ο���~�l쁂�Rd�-\�6\�\�d\��u6\�_k�ڐs��*�F����v퇸�Շ\�Z��K	x\rX\�\�Նtֻ\�r\�wm�I\�+\0J��\�V{6�qiKl�\�_V@\�I\�!q}��SR:��\�\Z*\�\�}׌CX^%��\�\\J���u�잛5bOQ\�ϖ4�	r\�\�.\�؋m��9���\'(\�\�\�IϺ\�_�\��\�\�?�5㵏���\�\�\�֔uG�S\�߭@��x�7=l�Ӏp\�j �$=^G�߁~�`\0\�?^G��<y��~����[^�;l\�{���hI��\������o\�o��\�\0�١���Ё�7@�\�m��\��\��_�O\�\�(o|Sl���zLX�,\0�f	\�\�ј�\�)ˬ�7�IV�\�̱��T�O��\Z%\�D�Z!,������Hg\�\�\'��\�+|�RX0V������\�\�\Z}�(�1�\�Dm�MjW\�5��v\�\��\Z��E�\�\�\0F\��M4U[@K\�qJ�\�g�{>RS�KL�\��K2��Ԥ[o\0E�\�\�u]i\�T��ġ\'�\0}Sb�5\'	�0>��%1ʍ�nc��\�v���\�D@�\���\�X�\�\�\�V�݋<%2@\0P�i_��/��J\�`�N�\�X�	�|[f,2��mm,��\�`O\�84)s/��Ub�$\�\�\�\�\0��\�Yq\�\r˿sͲUZ+����\�W*�U��˖\�e\��\�R��l�W�nq�}\�\�,\�\�O�|\�gK<��\��\�&����_g\�\0w���ډB\�veo�ȿ���\rF\�\0�]��\�\�\�\�{\�^��Mu\�w5Wۄ\�D�N\�G��X$�\�`o�\�S��\�\\]��b�3\�u��*J\��\�yE8\�\�)\�t�x*�ՠS��\�8W�6K\�\�\�`��\�\�Io\�4\��\�>v6�\�\���\"�\�c�\�\�\�c�x�\�~�>ٚ���w\�m�{w\�AV��|�\�v��\�w�\���\�\�Zf)�G\��5cn-�\�§\�\�\�n-{`\�\�8���?wr�\�}|�f���\0\�-������\�\������\��\�;\�������\�\�*\�\r/߃W�@2\�V�q\\\�\�Վ���|E|���F2!�\�\Z�tS�A\0.��ô=�\0k\�M�&<fLY\"֏\��M`}d�0Emb�\�i�Sf�� �ۑ\�]�񀮛\�@�!>\�!>\�a����Y\Z�/_gsJ~Qν\nZ\0��O�����Vn4�M\�\�\�B\�E\�Ziq�\�_A\�ø�\�K\�T��\ZX�\�.^O�\�\\	�\Z�ђo\r��d\Zx�]�]-,͞S�@\��jƲ��Ⱥ\0�\�[ǅ�\rw3��n\�\Z[���.\��Z��\�T��;\�s�\�\�\�Rš\�\�[5\�\�Y��֠/\�\�����w]Q�����޲��\�V\Zv��\�\�\�\�\�Sg�ԫ\0�EK\�6S\�u7O[v�)K���%\���%\\��\�!\�\�)9G\�u\�X򍋖��5\�^\�i?��mU��uqm���a�y\�4Z��׀J\r�\�k\r�Tk�!;\�j\�k] �uS\�\�p)��X�0\�\0U�U�6�~\\�\�vW9נ�\�<>_亀�tl�h�\�\�\�+�vG\�\�{	\�%\�x���2�\�j5%Չd�\�\�\�\�\n�+���\�CU�W`�\�_vl����\�I\�x�>�O6~�=Y��xs@����)\��:��=�v�G\�{�\�\�D\ni�\�O �\�\�k\n現��\�[s\���\�|������d\�>>\�q\�ӳM�����\�6�\����\0�X\���b\�\��\r{�x�\05d�mJ^P�{/�\�ş�&!�2-�\�r^Y\�x\"�Ek7U�ߕw�6R>��\�.+�N\�_;`�0�z>�:Fs٢p\���\�S<�#�U�\�+\�EMj\'�X��G�p�JY�2\�9��@��oel�\�x�2�t.\�\�p���\��)]S�_h�Ǡ��\�<xm�\r�\�[�kj�am�^>�5\�\'z,Nv���Ք\�Ҩ-�?e��ߗ\�\�\�-\�\�\�ޝ��/л��G\�H+�t�����\0�o\�s���\�vd|�G��t\�h�.\09��U����	�\�G���\�}\�me\�]���g��\�i��ϖw`��u\�,�\n���y�g]��j\�\�+\��W�p\�\�\���Vy�\'-��9K\��\�޷fTр2U��\Z\r<�����t[uu^qtT��#:�bT�f�\��\r�Jx�p���5n�Nu\�#�x�G�\�\�\�R\�J\n\��<\�js��\�׃�\�o�5^\�\�y	\n\\�\�:��ř\�t�\�F\���\�f{\�lu�\�=bG\Z��a�\Z\��;\r\�\�\�xl�;],O\�\�\�\��;q��iG\�y�1l\�4\�~�\�\�\"\�g4�/3�\n;o��\�И@\�+\�n�\�O�Kn~�\�4%G�W\�\�e��\�S�\�n�v\�wV�\09��;ٿ�\��3`w;�ί\��6~~\�~}\����\�\�߿b\�>\���x\��s;���Vнy��\�Y=%I6T�\n��\�\��ś.�\�\rS�\�,\��\�1��SX}E\\\�x\�.\�D�\ZjbU(�	��\"\0�ON  $Z�6��\\\�(�\�Xе��D\�s)QC�N\�\�?�\�R}�� \��\�JX��;#/�\�\��%<O\�x\�\�\�K\�\���~�����r\�\�µ\�v\�3�\r!II\r\�h\�\�B}�Z\�A�j\�\�\�\�zz���W#�G\�W*�Re�\Z�	X�6�j�\���\\pj\�,\�K\�+�h�ҋzR:h[z>fW�\�ޖ��\0\�\�I�8Z��ơ^IM\0�:B�mT�l\�7�\"\�?\�t\Z�\�^��+7aq\�A���e\���uʲ\�\�H\��\�/���*�J��3l~ʒ�|c	�a��\�Y̙�,\�<\�\�IK:o)\�\��5G\�o\�]�-\�	e��\�b[Q�\Z\�\���\��7�%\�\�:;u�\�B�z;~��\�\�wV�\ZuF/I/�id�N<\0:\�N\�J\�����kD>�6T��*���y_,��2�ҹf��=�\�9֖�\�f��J_�\�w\�\��\0,��_�	��4~}\�\�\�\�\�CX^�?�\\Y�������ڜ�@��l{+�H�${��7\��x�\��Lc���\0�6�F��6\�\��\�>@\�C \�{*�\�\�o�a��Q{�\�\�\�\�\��\�5|`?Xw ��w\n�^L�\��]@���[�/�~�\�c[.\0h}\��\n\���Ow�lc��72ߺ�a\Z-d}_y�\r\�f�\\��$��7ici\�\�U�\�ԕ\�4�9Y�4c� �+��� 9\�֡���!�:�Ә$�\0z�Yl�*\�ſ�\0E\r\�N���Հ\�CE�7�w\0:K}\�zG�\�\�]�\�l���r޼rI;�?�a�:������\�t#\�\\PŅ�\"**pl]y��I�\r੃��㣝�׆f��\�Z��:�L�^�\���\n\ZD���\�\�]��2�\�(CC+�(�2\�\�)\�gez5\�\�\�8�N.bí)��5�aHx�\�{\�Ã�x.\��G\\��0\0碥]�jI\�o\��O\�\����\�Ү|���\�\�\09�\�S����!П�\�˧-\����$��,\�\�y��x\�bQI�.Y:v��\0���v��K\����mTX3�*\�F��\Z��?f�f�\�\�d�k\�\�\��;L\�\�]��zW[*�@[�\�\�ȅڄ×+	H��X�u�\�ll��S�`;Sm%5X\�)�~�>�kV�.��띌褦=\����M�\r\�\�\�D�=�뷧K#���ن`!��\0ޭ\�{$೸�rk\n0f/6& _\��\�Ԉm������\nl��\�Un�}��\�?�5\�\�X~K���F�v}\�\��+ �\�팣&F\�\�¸�揼GR|z�\�v\�?J\�k\�\�?<����#\�\���\0��ׇn��\Z�\�\�\�azd�/�v\�Ӌm�$%\0\�\��\�\��6\�	+�\"w<T�d����\0\�\�\�ժO6\��\�xӔ2YeS|�DM%@\�c\�\0D���bz�;3\�:RR�91�1�\0Ә ��5�!����G\�\�\�tf-�+_�G\��\"�ƚ*�\�\�yM�\�`���S(C�#\�\�����<�8\�|.]X��Gƍ\�\0z�V�v6�I�\�\�\�\�\�\�\�\�\�w�\0*\�\�ѝR`�\��g\�a\�f�\�;�ˢ(�\�FZm\��\�\�\�\��<�\r\��\0*�\�\�*\�@�+7�\�$�r3�	V\�\�7X$\�[R�?���Ms�kX\r1a\�ju1\Z﭂%����F!\�-7�\�\\��{\��+\�:��\�\�\��\�.�\�/�\r���?	�O[\���3U��O�~�?g\�\0<��ؓ.\\\��%KU��:���@=Z[es\�m��QE\��\�\0\�ul^sqLc϶a~5\�\\T�t����\�oy�\�\�~���kJt���\�\�5�*\�\�.\�\�\��\�y�\�\�`������܈R)�|\��J\�\��\�\����}�\�e!գp��\�Vza��6;�\��\��j\��e뿺#˶+M\��R�~\�\�\�UY�YL�E�2t�kw\0\�\�Z�\�Ҡ\Z0�Zk�\�Z{Dx�K&���\�>�Kf�z\�\� �s�\\kε�X��\�??\�F�oC\�YO��O�<��閽�(<\�8��\���k\�\�>�YG.��՜c\�\�>@Qkۃ�W�\�\"�\�\�\�f\Zꢫ)��8�>dOV\��ފ��5��\��K\�w<�K��|�\��8���LA;��t\�\0���[O\�y+У\�1�������?\���\�1\�\�V\� <�E���2��-D\�\�y��@\�!�\�kxY��\�\�\�V\0�h+^XGha\�W�ݍE\�y�FMM5\�\��+m��]\\䀮�5}ZP|y|%�L\�K\�r\�\�\�U\�C\�\\�R\0z\�\�ڀנR����\�1H\�m\�f(\�t��^�\�c�硆nVy[��\�Yl3E\�x\��ܪ\"��V}x_�M�JmJ>\\���/U��4t�\�\�\�\�۪Iew��\�RP23��\�N��Hd�\\\��-��O\'j����\�,^_��e*���?�a*�Q0.ӆtDX(	��J���X\�`��\�ޝ\��\����(w\�V\�4l2>\n�G;\�\�$\�1_\�}˿ɺ�\��\��{+\�{\��,\�4=�\�պ�%��ʵ�*�{ӊ1Ej�u\�\��;⫍���\�\�=/�v������\�L\�޴\�\�Y��\�\�\�s\�\��\�/\\�8�N�c{C��ֱj\�y�f8j~\�ְ\�6�\�F\�@z��y��yTSQ�5] *N���i\�>�V�\���9-�\�Q�j��!�\�\�S\�lI�\�\�nS�\�\�5�~\�ޟ,\�O��W�\�/r���\�o�\��\�M��_B\�߂\���\�֪\�T��\0\'��\0e��\�\�TV\�1�[x��\���p����i�Xe\�\�/�����h�\��=[[t��p�~\�\��\���\��W�\�\�@�.�A�3�\�yy\�y�\�x~\�xQ�G�\�+�f�Qg�H�g�kv��QPi��Y��\�ŀkڪ,�&W��6�&=��ѦJI�*\�\�|�\�mZ\�p�\�+4]GR\�c��,)���\�Y�!0Lգ\��;�\�u���\�\n�i:IX\�\0_��a��Z_)���t�H\������S�\Z���]h�\�\���\�>�\�x\�6\��<�l�)\�&k3m�\"\�F�R-��dù�6���)ȶ!4s�0\��\�\\7\���\��w\�U\�N\�\�KW\�Q�uf<�,5�����l/\�\�#5i\�+�\�\0���@\�\�2�\��`�\��:\n\��*\�\0�j��\�6]\0_A��{wf,�;\�\�\�U7i�U\�������\�}�է\�[M�����Ҩx+{c\�QVs\�M�){���\�o}aE\��\�J�\��>^\��o��\�-\�\�������<�|��\�V�\�\�?��8�\��3<��\0^Go�r\���j߮\�J�\�^�\�	�{qڞ(\�m%\��\�Z2�Jι�ڰm�b\�\�\�W�#\�`�\�:\�\���\���\�1][\r�\�s+\0\\�x��\r�\�3\0\�.����j���\�5�v�߭`<v��Q{��W\��\���p�j?\�_\0�/��p�k�&��\�u(��\��\�.7y\�qG\�\�\�Rb,�\Zi~�UG\�kN�i�)֯@EY���\�\�;\�8C-�.Vg\�\"��[\��=�?[�@�|}\�^\�^A7�nyv���/\0��@\��(�.P;O/��濃\�+��`���k@�\nO\�s|v\��ޞ\�س�M;�\Z\�8i������m`M[U֌u�\0\�5\�U5Ԝw5�Аn\n\�W��Ԭr�5�N�\��*Ӎͯ\��x�1~>�\�\�y��/�\����]\���.�VK\"��\�W���~~\�m\�5\��\�h�\�\�\\��z\�P�	\�dY�MT�\�hE\"\�50\�C\�R:�8)ʺS�7#\�zE�3#�7\��gǱ\�ҙ�/=\���\� 	���\�[+߷$\���\��d7FZ=��\�R�_\�M�\�\�\�/�\�\">s9^\�()@.��yD�+9i�ƃ�P\�@��9\�\�O\�5�\0}�ue\�\�\�X[Z�2\�̞j��x���DkNK�v\�F3\��T����ϴ��,kL\�J\�(D\�\�Z\��P�/-�\�?X\�W��g�7�d�׿1\���V\�c\�u\�|c�wnX^�,\�5�)#3\�Yo�\�\�\ry�Yz�rt}�\�\�Ѩ�mjڪ��G!\�|���\�3xT\�(\�\�u͑�pq\0$�\nq�Ǹ\�0Gixi� \�~F\�\�Pt\'\�t� ,�Z�\�\�@\�Xa!=O^\\�Om�\\�z\�y�\��G\��\�\�\�\�dv\�\�8п=���\���b\r����=�w�d\�_�è�\�w��\�zq`׺#�+�\�޲\�\�\����\�ݱn,���B�!�Θ\�4�\�L�g9�PWQ~i�I�\\���\��\�[��\�p\�ޝo�\�\�z�\�\�X\�u\�ͽƓ+��\��ݹ��g��\����\n\���������\�\�O\�\�{��FٷÅY���h\�I�\�7�@�\�W�M.�\"���\��D�m�\�\0(\ZP�������(\�U\�UA�Pm%^�\�Fuf]R\�(��p��j��@ߢ�\n^_\�\�D\r\\�\�i)�z��\0\�\�k\�}�\0\�\�*�Ty��\�P|�0֘�ɲ\�O���E�c�+\�u$GZ{R��ᵔ�^��e�i�{��9�k��\�\�\�oX\':�;)\��WE?\'6��\"�\�\�D�C�6\��w\�ZG��2s]�_\��\��]\�I]XGT\�\r��x�c�(I	\�\�Nuu\�\�=�-\r�Ħ�T\�doV@�\�\�53@�����\r�w\�\�X;��ՒUb-i\�֜^b\�\�\06\�\�T����\"������\�\�\�\��\�͇\��]\��\�P�߸::\��ݻ;���xk\�\��U�\�v[\rj\�,t^u\"s\0[\�<n~b\�\�\�^��q֤;�Ҡ���Z���ݘ+\��<#\�k[�ސP\�ӫa\Z/����v\�)G�W��\�\�;�\�98=o\�/�\�u<�#\�y�6u���)H������)�5\�\�F�+z�z�\�df�d?^�\�\�\�U֚�p�\�ϐٗ0c�;\�\'@���=�^碍�7��޷\�x����\�\Z#�[+ֲ\')Ɔ�m\�u>G�ɔ5<\�)����Ϲ���C��g\�\�Ɯ=ۛ�7\�\��\r��@�3\�\'��w�/P�_u\�.��Q�o�D�����������\�9���o\�\���π�\�ɡ�8<�\�.\�\0�*\���\\D�T4]�T\\l\��F�\�v&[mcL�\"\0�\�JuA��L�\�\�D\�t=Uê,\��\08��À^\�\��:Y�**�@37��\�V�\�Ӯ\�;N\�E&\0��@�\�+Я\rh\�Y\0cӋ\�\�0%\�Z�Yu�\�ը/\�\�\�=\�q\��0\�Z\�YC�]��Ǫoߵ�{\�ވVy�����b��NA0\�i��{���V��mD���w��7�]�\�u4��5�\'?�P��4\�����\�\�\0�a\��օ�\�U\�2\�xw�\Z�\�\�C\�ظ�\��\�\���\�\�ڈ�\n[�Q��n`\r�L9�\�{P�l�5�~[�`��2:�\n\�=��k\�]\�`�\�=֑Scm��\�\�h��\�\'Zil��\"���\�]+��;@���\'��WV|]�k(��.ݶ62\�jb�`\�\\೾�&�\�*�i6�?���\�\�!h��\�a�ʶS)\�	\�T�`�h�A����ap���\�9�~��T\�izox�t��,j�\�*�]\�2�\'\\\�M�r`�\�\��k\�\�\��z\��u\0_��2\�[pi��F\�:\���\��&;�a<Cӿ\�\r\�\�9{w�\0��g_�a�aë�<T�\'(�π�@�+��U�o\0��Q߲�>�\��_�����\�o�!\�;�L�.@\�\�@\�\�u\��tA6S\0~\�\�\\,L\�#���\'۳�\�x\�^�\��\��O��s/\��UKg\�\�yy\�\�:^�\�><\� \��1ʾ�\�\��e�Y\�J��8�wg\�v��\n�\��[*\nz\�EQ�m�0\�&\�,��q\�\�A\�E\�m*��\������\'*�\�e0�Y�V����T\Zꕇ*C\rЋ	�,T���s+ݚ*�\���\�û�w\��S��A4}\0O?4\�Ѯ@͔G\�F�0g�\�\�JK�� ���҇x\�x@\�u�\�#��\�\�\�$<�\�(�g4; i\�\�V\���r̿�	ܷF�c\�\�h<,\�I��\�I3@?�d$[k�z\�I\�\�5F�0\�z��W^lC�Z^}�\�iG�\�\\V��7�\�8\�H��}\��\r�\��ݸ����7\�޷\�Cmt�\�b�\Z\�\�*�����\��>`\�0XE~>2\"ϱ�\�\nk\�mb�Z���Ҙ�\�j�S�21\�\�cӬ42\�y�_Y�wj���|߭�L�/\�\�1\Zv�J�T��\��+�>\\\�j�<��6<��\\B\�5�Ry��u>W	���n~\�0��\�\�\�k\n3,`�\�\�L\��T������0\�0̉zb�\�<\���a\0|\r�\�l:���\�A\�Ul@�6*5�ئ\�H��\�=^�\�H\�k/+�\��#訁9�\��x�$`\�kC�to\�\��\�,:^^��hУ�nگ/v\�����Wd�\�F<CmV�*�*�K���ª����\�\�\�[�h\�\ry�<Pg\Z9u�@\�\�,�g�k\�\�#�%\�\�\�=h�Ŋ�~��ص���\�\�ￊҿ=�\�ky_\�uh��Ϝ��\�\�y�\�E\��\�s�坲�\0�|��+�d�uh�6�\�\�\�}Wu��\�&炩\�a��\�Wc+\�>��˱\��,�ŋ\�Y ?Ɇ��c�P�\�:֩\�Y��\�lȅ�\�|Wǚ�b�����D��z���~W�q5%\�\�\��J)�\�\0:^c�\�z\�Z�\�B��:[l���Zm�\�\�6P^k�\�Jk\�)���hm^.ͪ\�ӭ2\'\�jr��M߀voL�@7\�Z����������w-�6@���\�3W�\Z)I֚\�ߥ\�Y\r2�^TO۔�hM.��fC�i6�ʻ�,t����\�=r�\�(\�U\�Ufr=ҡ\�e쯱�\�l�u���6�\�wߚp\�\�X�k����E5޹�\���H�*<v��]dfZw�z\0z�\�\�Aa��\���<\�*x�Op\�D�\�Sˬ*�\�J\�Zуۖ+ͽ��\��\�o�����\�(U\�mXN�u&ƙ	\�3mr��G��v&=\�m;��1\��uir7�A�u���X\�̌��&\�0�3y\�x\�\0pp87Ms\��㍩W��:\�f�P�I��f/i��F�{j,\�\�[��\�%\�\�T�\�^�\�Zs=�jSl�)\�F\�`�8$5C]iga@4�r��R\�\�%\�~^��\�Ԭt~�\�\�\�ݶ;\�a\�\�\���`\�ޞN\�\�㐽=��\�/\���K�ˋ\r\��>\��\��3�\��\�Z\rT�\�\�	��\�\�~f\�\Z\�(y��[֎�Td�\n�7\�:\\5\�tkI\�W� \�O\�\�	{���X�7��\\�\�\�O�0\'\�ߜ\�\�Yʝп(hwz�\�J\�+\�^Q����\�s}s\n8ca$^�\0���?Џsa���\Z�\\m3��\\ �)S\'�e\�\�j��\��H���D\�͎��,6�\ZN\�\�\�h���ո �b\�u�6���-�\0@m|\�3O�Ŧ\��AG㔐\�չ\�\�y��\�\�05�\\\�5�=�\�\�#�8h\��V����}�\�d�M�f��\�7Z���Wn�\�h\�B\�*)��\n�u�\��2�93\Z@_\�7�3�6\���UF\�3\���V�d\�\�O�f�A\�3��x\��\�8��uJ�A#w\����\�\�\��S^�\r���D\�+4��\�\��k�\�\�\�rG�U�6��\Z �K3�\�1\��)P��\0\�e-��񞧯D�נ��c\��	�0�\r��Y\��P�%\0\�P�j�\�\�k+�p����0��4kG�4&g[u|�U\�\�Yi\�=+�{\r�b�/���;\�WD|cՑ7\\/�\�P\�\��(η5���P��L�յ�\�z]\�\�\�m�\�U�\�f/(*Pw��\�OK\��;���9\"��\�_w��\�P�\��\�6\�;\�)\��b��f!��[u����f��٩c=\�/\�\"�.\�T\��/vjm?\�*:����/7\�B��T\�\\�Q\rP\�\�둍m\�^�J�-�٣�!{y0\�y\�\����G\�z���߶?��(�/\��=O[�V��?��x\\�bh���J\�|c%�5\�;[�$�J��\�N\�\\*���yꐫ\�\�\�Qׁ�\�z=�h/.6\�ݣ�\�!�\�\�?�\��\'@\�-��*!\�_�{\�\�����#�\n�RI>�燀~�\�r�_�c��˖tt�\�<��E�\�\�[�Z\�b[�m�&\�F��\'\�\�W�)\�zr��\�\\jW=Q����\�BՆd�U�\�\�ϡY->h�\�D���ҥ\\�6<�FFit\�~�ݶ\�5ls�\�\�C���\Z�\��!�a�-���l�E?ﻷ�M�\�1��нVF�\rWײ1T�\�bSu�6\�{T7\�\��YM��ο���[yķ\0\�[�\�|mU\�;/ڙ�4\�B\�\�\���\�[��5ޯ	\�j\nm.P�n\�A\�GC\��y3mV\�\�\�ǰ��\�j�l��\�\�\�Hu9��\�z+���,\�\�c+F�-;\�F\�\�1�ﹶ���р�\�\�EC���s�\r\�E�W�\�b(+�\�[?Ʀ�2\�Z[���o\�ZZ1�\�t\�Ěs�`dmt$��L4\�\�\�\�6\�\r�(�Wa��S��u\�ڃ\��^\�cl�\�Yn��\�\�L\��qd�V\�J\�E\�\�\�U.\�&\�.x�^�\Z��d�\�9-�\�\�F`1d�A\�Z����]#\r�\� 5�\�ToD����f�!�&P\���\�w\�\��=F�]\�A\�a���;X�\\S�-6�\�Rs���2�j�\�g�\�Xi�Ts:\��\�\\\�zc\�\�\0��=��\\<>\0s,���S@�L�~ϯܙC�Vz=覵j\�&�\�t��\�\�\"�\�6P�Λ-Ë�\�L�Nϖ\�9GM1U�0f\�x�\'�Ӯ=ϫ�mSG����x\'�C@�B�{^^\�yz<�/\0]\�V��^>�\�+�^g�N\n\0|y�_^\0z>�~\�é)�c����eU��\�Wj\�<\�EU�\�=�&ˆJR]RJ+:�1ʙ�\�)R\'<\Z�\\]aT\��r�\���/\�\"c�\�\�!XD���\�[\Z��ܷyA;�OB\�W\�\0v�m\�\�w\'U���\��8\�M^�\�i���f\�A�Yb\0K]6\�\�nA���&ӄX5TT+mvd%[%V=\���l� +����s�f\�\�\�Ni�\�^r\�@I�L\�ۣ���ܩ\�/˱��\"\�/\�F�@\�0\�|~3\�Ӿ\�\�	U\�\�U\�z\0(�\�.΅~g\"C}\�\0�=;\�y��T�=��fє�`ux\�Ƈ�\����g��.\r��~J\0R���W����\�eSwu�Y�\Z���x�\�\�G\�}\nV#[���0z\�ϛ�R�͝�pP_\"oXhz�\�Wzn]�M\�=\�͈���4Ue\�lC�-��\�N_�k@\�\�z��\�=�iFy,<�\�\"�\�9�\�Q%\��\�?p9�\��\�\�\�`	�>\�퀾� �\�=�=�\�>\�\����\�[3�\0\'4�\�P7\\�\"[\�^\�\�I�\�\�b��Pm�\�,�ϊ�`!ۗ�\�*c7\�)L\���\�;�{s�dߟ�ۏ;�\�\���ث��E��\0\�k\�=\��_�EA飯[����YQބ�\�֞\rNr\�	�56��VQ	Н�E,�*��|g�\'+���{s�k.xx\�\'��) W	�\�g�\�Z����\0\�\�\�\�_{Ut\n\���+���?�y\r�\�w����\��^z\rP�v\rPO{՝/\�\0L-V\��6T�鎩\���!ϑ�c]l���JkA\�c f��ݭ6\�&�`\�\�\0S�\�sM5a\0�ޛN\�\�P�ūa\��oe\�-��&��k�L\�w���S�>\�5B�h\�i\0\�8t��\�wfWY+\�x��N[찹\�v�\�A+�\�T\�\�Z�7���\�l��K�¨˺i��b-��C+�K�ʴ\��\�1J��H�f����gXK�OM��d\�2^��\n�C\��>\���d\�\Z�T,�H\�\�W�>|�\�b\�+Gb\0�\�\�\0�v\�,U\�]%\�\02\�\�7#\�(\Z00m�\�֗�e��l,\�\�s�5�\��\�xi�M�cp\�@��3Z�1�W01Z�ξK�޴(\�H�z*\�L�}�ᖕ�[y�*\���\Z|q�K\�V�%��\�\�c�EVܰ��\�����~k�̯�vx\�\"W{��q_\Z�=�ǆ�\�N��z�\�\�3����\�\"�ZM}��!,@\�\�O]#>\������d�Z�	\�\�\�T�&\�(�:%TU\�ioi�\�\\;\�\�H�V\�M�z���j[i+\��%\�|\�m�\��\�b�\�	���o�O	UE*o��tً���ޝ�7G��xM���_\�\�o\�O�_.9�ח����?��\�_+��\�޲��P�xt����p`u�Qv��xM\r9\�\\�Cg� \��\�\�R\��\�S\�\�j�uո����k����\�\�ʋ{Q}\�g����9����\�<��\�M\�%�\�\�y�#{}�\�n�&��\�\r�x\�:>i�	<�j˥_;��ؐ9x�B\���\� 7iB-�\��ā��\�\�nL\�1VW\�\Z=�\�\Z��\�JʑWze��+��2\�#\�}-///����6ѸJ0�=FA!6\��E\�;5�o{r\0}և.쳵1����a�\�\�\�Bm�\��\�\�_T�4\�9\�hű���V��v\�T�?zo1ݪ�:|v����\�y\�Pp4~v�ueY�u��\�\�\�d\Z��Z\�k�6\�\�\�Cx+��L6T sJ\�5V�=M`N\��#\�\�n\�\�\�Y��ݤ\'Y�&\�\0�\�lu\�\�v=��C�Y6R�ec\�6���B\�k�D�\�p4�0�T����X\�+c��x���x��@~jz\�\�7x�H��$\�n�m\�ݯ��ǆ�\�1\0�YK���,T�e˚\n�\�)��F�	\�;x\���Z��iE\�\�N]\r4F\�\\�)�\�\�a\�ϕ�.�?\�sӀO�1\�R�[JԙU�@��\r�\�\�04njs�\�4{`��\�\\�Q�\�:[i/���<[n����\�l$����\��b=��\�\��d=\\붌<�d�펶\�\�r�=\�\Z�ת��\�\�쇋@�a?�_p�??�\0<\�+:�[\��\r\���]ӌ���;\�h�\�ku+ё�\�V\�3\"�eih�j6{�m�`\�\0=@?^��\�;Y�E\�Ϡ�g\�\���h�7!z\�?�\�����\�[e\��,��\�Wp\�W�_z_\�7�zQ|�^�?��e��\�����\����\�ޜl�&m\r/)��Q?\n\�)j��\rE�\�z\�Rh�\�2\�+���\�9��_\Z*�||�=bi�\�<^�\�&5P�;��S]���:��\�7�k�\�S�U7��G�<7s��=��L�ޘ<�ׁEuؚ\�{�<�v\��\�* {R�o}\\]Z�,<eD\"\�oʯ�� \�x\�?�}�cM�������o��\r��1\�\�5�6V��x�i\�fGA�[=j�Q�.\�=\Z�Uci\�\�u\�4�,<4��跅>?L�\�M�UN�泍֕\"\n]\�a\'޻5	��v�\Z߭�_�q��CИ�b-��<\�\�Z�<<l#\0���A5\�Dr���߽H��\�x\�ξg\�Y߲�J_{/ª\�\��h�_D�\"#��6�\0v\Z{\�9,�_ZYR�\�gV|�OV��2�>�\�{�[=��!\�+\�L�c\�\�\�9�Ҥב_ބZ�\�\�&\� ���a��\�\�a;�A;;Џ����>�WFީ`N\�V�U��x���~;t\'�\�\���0�V�X\�\�5�0:UO��\���\�\"�-5d\�b]�͕m�񿱆\��\'\��߬?\��֕p���+��\�bt:\�\�j��\�N���Ζ\�\�Ga4�*\�/�t�e\�\�p��\�\�QF\��]Ө\�\Z.b=/Z�p�u\�ߵ���.���\�>���˽��Q���~��\'�\�Ҵ����d�\�\��L�<\0�G�\�p,��|�_���b-�\�\�~ܿB�]��;\�;��\�{U\���M�\��\�\���\�a\r\�\�ɷ����SP�y����vQ�\ne�\�\��Ru�m\�R�\�\r[��\0k�\�\�\��L;�\�\��.贲��lFi��ޤF�ZjI�l*��W�I�?�+�\�(=�ט��R\Z\�s\0�=7#?����0�a:[T�\�\�1�x�-\�\��4_Q�\�a����a�\��~���,��B\0X\0[T\�\�܇֞�d�\\�\��9s0tYP\�\�\�\�)Z\���J�\�oх�U\�6բ~}�\�Ӏm@s\�FG,\�\�˃��\0\�\�Ր�\�p\�Q��jS�PC)bXX^�Mmb�\�\�\0ts\�fՕ���OA�\'[N��g#+�\�D#\�:޵V�\�\Z��N�\��\�Z���]^���\0DYŭh+gUGFY\���\�\\E\�\�n\�\��_y|V�wV�Q\�_Y�\�\�?��Y\�w�YŝϬ\�֟�)�;�M���\�5W������tJ�Q\�>Ě�\�sY\'j�\�*\�`l\n�q\��O\�\\��\��8��X�Nv\\\�[i{I�n���a�4�:~;�\�\�~yy� \��\�Sӌ\�b�k\0k\�Q\��\'+�\��l����u\����܁�ܸk��L�z�H�ӥ�=\�@\�\�\�\�\�,�~\�>^�\�\�7�\�\�\�G��\�П��#��<X�k5w��\�X\�[�\�X\�\�;\�\0\�\�\��\�h-\�qn6\�lg#�M�ͫ\���>4_]s4\�R\�m4�\��\�\Z�D%~��\�b\�3C\��\���n�5?��\0vK�W�_\�9���\Z��Ѯ}U�\��Y[\�\0�\��,L�\�T�j��<��f\0���\�؈2ɪT�\�J�-t�4p�?8�\��ª�^�z-du2\�\�\\�<|	���WNu%��u\'�\�[q�o�m�	���W\�\�\�\�\�k�=\�\0쳱\�fI�?��f��Yv��\�L�\0\����p\0�\�\0�bl<�\�5V�ʠ\�j&郱���ZG�t�<k�u\���P	/\�z{x\�+\�@\�(��d�W#j1����рm�c\�\�lsl\�V�m��2�\�>ScNi\�iރ�1{�s��ix�$�H�\�\�)�MYwQV�\�2:�ߚ���H�\�Y7lğ�\�+\�ߘ���ʪ��G���\0��\�\�bY�\�YC\�m�z��\�J�	Vs�qߪ\"\�@sy\�u��w�oX_�\�\�qa\"\0?���?����ϭ�\�1�5߭\�X��?Zg\�=�E�\�S ��\�ڗ�W\��({O\�U���\�Z�j��4\�\��_Yy�\�O\�\r<�r\�Pr\�%\�\�a\0���W\\�\�\��ZCD\�{l��\�V�\�mQ�\�ɫ\�a���\�ܵ��寭\�\��\�Z��[��\�?X\�?�\�Z\�0(\�\�!p�S�Q<��=\��w\�|y���\�����M�Q��\�\�1����l\�jo\�bE݄\��w=��\�IMl\�&�7�zsmM�a�Z.W4G�g�:\'��\�@\�\�~\�J��Y�g	\�<�������z+xv\�d��/\0=��\����?�Fy�����^\r���U\�:\�Za�-���^%���T\�,�|=0\�\Zp}}�\�Q�=n�\�y\0��>@�c?\�8�ʻ{USʗ�\�Ji�Эxa�<\�\��\�^��\0\�k��ʄ a0{�l���x^%�l0�\�\�sZ�(�\�`uHA�6�\�\�f�q``\�Q	�z$G�\�\�+�l�\\%�xl_�u�d�\�s�#?\�^\��\�]/)ƻ�Q�φ+|.�-���ZnbC�\��\�\�{ɻ\�L�\�\�H\0\�\�B뮍B�u��g�\�3\�\�	�\�S��\�n�T�\�\�E\�\�b�\�ɌD��Ck\���~�wvI;\��\��(G\�R\�ZUt�\�o��������G�R�\�;(F�HVr3\�JoƲ?��\0�R\'L�\�:�u_`K�G}�����\�7޺���\�\�q�\\�\�\n��\�J1\0-��@n���\�@�}�\�@���4{*���]@�\�w�|ͣ\�g��}��\�.q]\�I3���ʠS�}��=?\����\�f\�m�:\�fjc�O\�6\�\�\�M7�Ӧۛm��\�\�c������/�����[\�MX\�ş�\�{\�\�\���/L\�#5�\r�\�\����\�y=���0\�_cm8o�\�\�\��\��\�dO\�K,)\�>\�\�\�x^\�y�����Y)\�\�z��\�\�\�Ǻ	�^���n\�T��I;]��\'���zo\�ޟ�zyh�\�\n�^��_�(�~�?�/\�G\�\��:�W�·\�\����\�\�\�|�ʡC{��x�P: \�ݎ�o�t�ʚ��c�\�@\�\�c[��Q\0C���&zmO�0�\0\�\"\�\�>�\�\�z\�lS+b\�}�ݦcA�vg���\Z��\�F�1:�\�\�@\\������k�6L@��\��\�\��.2��\�1^Ћ\�/�y����q�v<<�Z�Y\�J�UgY�z��^Td��yPyV~\Z>]\0�\�\���\�R\�]�k|1\�Wt�����\nG$\�\�y?�6\�x�!ۘ��zo��NB\�L�91Ś��1.\n�g�V�\�\�`�t�\�;���IqVw\�U\��w����_�\�\0�=\0\n\�.��;+�\�\�-���Ɗ��g�\��\�*�\�\��x��\�V�\��\�]�c\�75�C������\��\�R��>��\�\�E|��)D}\r\�?���\09\�(��+T�΍\�,\�Ɵ,�_r\�:�8ކ�G�z<\�Z��ZZ{�^\�y\�x\�xۺ�N\�\�L^�x^3\r=G8\�o�Yx�W���<|�^t_}\�U]���\�\�\�b�\rݰ�\��\�\��\�&\�\�]��bD:�Qw\��k�֖�n}����l�\�@a�\�5����\�0\�g+��\\\�lԗrS��!�j\�>���s\�y�Σ�p~8E�/�\�o|�M\�\�\0z4}<^�ji��\n3��+C]|������+��0��\�<�?[��\'\��z{\�\�am.�\�=�\��\�\�\�R[ޟ.3���K�\�\�?>R\�\\y{e�9o�.;?*�\�1��\�\0\���7�[v��\�\�T7�no��F�T㝪\�\��6\�ւ\�\�Na��	\�D�\�k\�%��1\�\�jh-6��i�1eI�\nn��P]\�Y\���hmE�W���\0h:�>\���|�D:��6\��\��1o\�hS��4\�xw�\�a|\�\nֹ\�+\�x��^��E\�M�y&\��[%2�\�\�~��_\\l�EJeՀH6	_����)�!\��Fo��ւj\"C�\��h\��\�\Z��u0;\�<��\�Vp\�6��1f:�P0O�}�9֖�j-��)6ޚ��\�1\�d�\�[�&�\��8\0��w�5�t�\�?��U��V�QS�{\��\�ߣ��\�2\n+\�{5�V�#o᡿�\�o���\��\r+���k}\�Ͻ���\��\�*��\�P��\�/]�m����/�`y_}ny\�|\�Jnso|\����i-)Ⱦ\n[\�Wf\�\�F\�s�t?D\��\�\�퇔Iɞq�\��Ы(GM\�R\�\0,(f\�\�}7\��0ݤ\�9�\�\�e\�\r�@�wiO�l�*\�:3����?�\��\��Ҿ�يB[\� �iO��>WK2��bOO�4Y���\��\�V�\�Χ{\����8�\��ؙ�\�;\��\�=\\���\�OV\�\�ɪ�?\�\����\�\�#<}ɍ/��\�{.tM��z\�f�יk�ur��J\����\'ۆ\n\�\���g�H�\�{���<n�W��fs\�ީ\�,\r\�\�B=�xC�Yj��Å\�_��Y\������\�\�?�x����/y -�Ӌ��_�֛@�.ЏC�:���\�^o\�,\r�T�IЇt.�g^\�\�+\�\�f\�\�\��\�\�h\�í\�8Mmmq\�{y6�8j\�r)����\�6�3}\����\�*)G\�\���\�kD0\�a\�\�6��D�\�\�!��\0#�M��7�\�\�\�\�ׇU�\�\�ku�\�i\��lW��|��\�%\�xC\"Kl/�\�6��(C��\0�O}�\�-P]a����:\�\�\�c@\��;l���1\�J\�\�8t筸��h\�m(\�6��\�,�\�p\\WQֱ\�|��nf�\�\�\�qx�x�`B�u��)�\�e��ҭ-#�gU���a��\�߳B�w^7��-��?X��p��K�\�\�욇֐�\��7�\�\�W��ş,�K͞\�\�(\�\�\\M1�tT\�\�\��_�����}�9F\�s\���%o\�\�\��w`Ѽ\�\�\\\�`Ѕ>?\�m\'�S$�\�FX�H\��\�W��{�t����Zb+ewFl�\�<\�T�U�j��]e�.�!\�ԕ	g\�E\�1\0bZU֐�lo~a�\��\�\�|g�Y�\�\r1E\�5\0��r�O{ǅ45�`�8�\n\�i��\�A{�\Z�W[�8Y��3k/�`\�\0[m�ީ�F[\�/��%{��l\�v�P\�\�����g\r	��qcb���%A\�Mm�\�:t&�\�\�E`ﰴQT�t���\�G\�Rh��=go�,\�\������\��Ѿ}�\�\"�\Z�\�r�\�>\�)`��a���\0�\'��C��8���\n�\Zx|�ޜl�En҄K�U�m��\�\�\�Eo0\r��n�\0uQ\�r-.�bC\�lh\��N\�\�o�\�A\�Ի�\��\�\��𮟙ˋVO�V7hb�\�\�i?��<(��*!gUe�y�~\�c�\��\�\�l&˹\�\�\�S#�\�6\r\�OFt�\�\n�\�G�.;O��M�\�����<u��\�\�\�h��\�\0��~�&�\"a\�J]����J���!�7���\�\�z-P\r@�����6��wҳ\Z�\0+ف޺�Q}�؈Ӹ��m\�l+��Jprm(/\�z\�]�}\�\�xu<}�C�}�u���kG37eeX}6+?\�*3��06ʲ\�\�dݰ��\�-�^	]O�\�gF[}Z�5%?p\��U\0�\0Ч~�K���V�\��\�*��=\Zއ�E\�A\�߰\n(坯�\n\�\���|\r��\�K\0+�w\�\r\�lz�l������\�\�\�Q$�\�\�FO+�s\0\�����˛;\��W�w��\�\�ލ�A�^��ϫVC&\�;\\poý�W�\��3X\�buYUu/\�\"�\'��{6�r\�FuB��ad\�\\����\��ͥ�eUbrl��\�\��\�\� \�c�\�q{�\��\�@�J�#�����\�	\�;b,�E{����X\��\�5\�]���2:\�j\�\0�X\�u�\�݅U\�\�\�ǳT�h���\��#��96@^AE�U\�\�^z\�Ϟ�L٫�y�9\�\�b\�ޝo\�ۓ\r\��`�\�|4�\�!���\���\�\����1��\��\0�)�\�\�\�|w�������ɶ��ܶ׼\�\�%4��\Z/֍6\�m墨߸\ZP\�R�W	\�\0V����#�v�\�\��\�/����jg\r\�\�f!.�:��\rtH\�P/%�\��U-�\�P3\��[ŋ�\r(\�B�\�:\�\���hrʡ\�4�����]�ֵ\�\�\��\�q6\��\0)M?\�\�\��\�\���\�\�I���^��:���@M�\r\�7\�Hk�MvT1>ﺎ��Đ�in�\�FFKRG�\r�\�\�CޏJH5\�\\A�6�z\n*)\�\r�@V�\�f\�CkK��\Ze(�&]����+\'������\�\�\�ZGQ�u��YP��n%�Ix�D+��\�D[qd�U$\�X}F<�����V�ee1�Vt��\���<5���ނ\�#\�\"�3Ͱ+�b\�J\�\�*\�g\�w���4\�\�37Բ\�\�\�6�\����Qm@��ʥ:�p=�f\'�k\0\�\�\�\�\�~e�\�	Т�\�\�}��\��?�S\�>��}�\�;\�\�Fts\0�ղ\\\�iTݹ\�<L�G\�\�1W3\nTs_���\�Rk(,�\�\�\\�ʱ`m�i Oߢ�x\0��Ц��5��\�de�\�ۊ\�\�G\�#�|c\nPOC�g������\�l�\��\�\0\�xތ\'�w�\�Z�\�>�U�%S�%5EHr�\���\�\��\�Du�\�Їl\�\�/� c�\�EP�і.^_Q\�c(\�1�����H\�Ѧ�9۰���b\�^�3Q�c��)�� \�\��//\�\�/��У\�\�\�Y���.\�\�rC�i��\�\�\�f\�N��\�~\0��a\�<�2}�OYw���\��ZU\�\�\0����\��\n��慳m�a����\�هD\��j(E�}j���\�6�;0\0ư>k�Cwu�\�f\�`n\Z��;\0\�>\0\�O\0�1NE^G�^Q�͉[Vv��\�BH�9Q\�\�.�_�\')$=:��\�6\�\�\�o��5\�Xs�`Cm�6\�;`3C[➬ᱤ\�w\�т\���mE�a\�\�\�\������-��\�{ڟ�c�\�\�Ј-��\�\\\��\�\�d�{���\�Xs�r\�zM�I�^\�\�fـ���j���h\�)���k\�.�\�\�<�J\��S\'[uB�5�\�x�I���X+�O���+��o�jc\�*A�[\��[V#��\�WDݴJ~_ţ*\�J\�\0��dE������%\��\�\�\�.\0XH4\�m���4\�\��H�b\��&���^����\��\�F9�2\0�]q,\�eN�ig�\��k��#\���ex)�\�R\�c�ir����\�p\����q)��#PɞA��lY9\�\�\��LD\�\�[��{ubߵ\�\��KlCT�\�*�f�Y����b�����θ\���\�i\0>m��g]\�\�\�\�7\�\�\�n\�^lM�i{��V\�)��o\�\���:>\�\�\�\�H\rs\0~^��\��\�N7z\�@)�lNiAў�\�&tv�߭��D�\0���\\��ϏW�&\0\�3ki��Q-�~�D�?>w��\�g\�\�?q\0W��\����č�Rm���\��0���h�\���=\�\\��y(\��\�\�\0e�ٖ\0��λ���u���@_/������\�ݠe�\0�,5�͖\�Y��P\�|�\�\�Cq\�4Qu>\�\�yM����\n0V\�\�\��-t�2�\�Y�\�MDE*��\��k\�\�\�91,�\�I�\'�9\0Q�M7z^g\�l�vs5j�\��\�8�O�I��\�\�f!?��u<�6�I��O\�N\�2*�m@�\��\�\�=���|\�3\�\0�nMa(л�c�\�c\� R\"\�\�\�xq`{j\n\��+\�\�YU\�������\��\�\0\r�\�\�7I�u\�X{A�u�䚿���\�4kF߶�%�kL���$(/l�,&\�\�U\\�@�씐��!�p��\�\�Vs\� \�\�ޱ�ػV~�K+��\�x�\�Y\�m<>��P\��њ��\�\�\0\nü��\��[\0Y�G�^\�\��X\��\�d\�k�ktv\�H���*\�\�1ɟ^���},�\�\�!{��jR\�U;,ͩ[T\�+�\�\\W�\��\�`\�kau\�+~�S�6U\��6O�G3\�\0;\�h�\�\nwֿ\�ߙ\�\�~�\�Ex�M\�S<����=_�b�\�A��g��\�Q{�>f/�\�\�\�Y�V\n\�}\�y_\�wV���I�nq�[��i�\�϶Vf���&��\�4�o��5�-܁7\�\�\�\���@Gꠣc;��\�;7�Zx�ϫ\��\�~}v\�Y��\�g�����\�3�\�\���\��a\\3LM�ݰ\���p\�ޢM^\���V�\�Kܰ	g��\�\��\\d(�\�\'<܅w\�vg\�+\�p�\���~��_D\�/�\�m\r�s��\�y�\�Bmȵ\�l�i1B֚�\�]��P����^���}\�\����m@\�ק�>�!�\0�>6�@/*\�p:jt=\�f\0}PGf\�C���\�\��\�\����xX?T\�6\�\�\�\�\�w������6�\�P\r�nKIF��r(����\�28j�\��\�F�o��w\�T\�\�L/�\�tqi\��:�\�\�OMAuyTf!rH\��\Z��חe-\�ix�,kO��\'�[g\�Ca��1P��b�}/����I:�\�꽗b�eI6\\�ic�\�|��5\��x�v[�n�xC�C����ÓGvu\�y\0=\�\0\�\�K#��b�|q\�M+��m��-\�}SO@E�o�\�J\0~\�\�ߚ\��\�V�\�\�\�x\�\�,��Z��\�ژ�\�\�^\�d/\���vad�\�\�\�5�-M��WGK\�+w\�1n\'�j�\�>����\��\�4�V�N\� T�����R~Y\�\�Q,�\�\�5��\"�E��Q��!\���;\�\�uי\�\��6\r�D\�\�,���\�I�kM�\�\�d;#�\�6;Y\��\�	\�`\�\'�S�4<a��u���p�=Y��+ð�\��ZUl��\�.^>ҚT�\�j\�y\�\rK�\�\�|�_5��׎��\�\�9�;�\�b\��wFѣ�:\�o[X���q{�9\�m\�ζ�����\�\�w]\��\'4�O��#o)j�����uD��\�O�Koֻ�uӼ\����\�\�:&mY��[\�v����I�]WT�2���\�\�F{l}\�\��_\��9��\�i3��6Ӯ�GI`iuU�d�\�:�\n�z6JC�+�]\�\�HH�i� �~�S\�\r��>h�8\�	\��I*�\�=�1\��l\�\�\r8/!�.�\�\�8�\�)ʍw;P�\r�\�$@����6��VQ\�e���\�y���|\�~[\��O\"�t\"��\�q�*\�NU��?�1\���=�\�^}�\�U-y�\�\�(\ZV�\��\��[c��1�\���Sפ\���Нy�X\�cgᱳ��?;\�M\�Un�~�\\{\�W\�\��J\r���\�d�%@��|�JRm�0\�z`��@\�ªON��\�N�U���s_\�cl�c��ѷ�T\�\�qw��}[\�+bn��\�\�R����\�gV�Dߴ��D\�GC�Z0�S��\�g�\��\r\�m.�{�1�\�ؑ����v�6�(Uu�\�\�n�A\�D\�i��\�ו��\�U\��B3@V\'�_\�a��x�\�&ڨ)˄2G]�\�S��wj�	��}\�\�\�\�\�\��\��%\�2[��\�\�F�T�z}\�G�\�;\�\��Og0�]n���>;�\�g�Cv�N#�S����\�vm�;2��\��Pn\��7]	,j�q�EP�{\�K\�C�U����=�\�\�b����/tN�n�\�\�_l\�nm���_�,E�E��\\rΏx�����\���K0x\�\r\�w�io\0���e{��hO�\�bm/\n\�\�c�T���kh|\�5\�ٸ�~[\�{\��[�g\�\�;l��ۂ\�h\�\�z6{Cd�Cx�Ѻ:��\�\�׸�M�U��k^ȵ\�TkD疺\��\�\��Z�S��\r��\�O\�\�ѝ<z^w_��\�\�\�:\�#\����>T&\�\Z�Eg���\�b��&�\0�\�\"�\�\�u����\�\�K\��t\�u�zȆ>\�K]\�N��\�\��`���Z�\�ij\�1^M4vڻ\�{Z�k#P`I6����\�;X^\�\�\�i&�\�\�hI\0γ\�yt\0_�w/J���4��\Z�db�u\�%�b1�\�_�h�AVON��(�de}r�����8��\�\'\�\�me\0�\'U��G�&FZi��\�\�Vr\��7Vx;J\�\n\�mE\�\�Yq\�mkd/�֨�\�6\�A\��\�\�zt�iv�\�?\n���<LC1D��Q���B���AۍA��vn�x7,S%�\�9��R\�\0��\�r\��tm\�{C�M5ֹ�l�3�\'J>v�`��\�\n�E8\\�\�7���ڰ\�\�h5:�5gP����q��A:`\�3�v�\�!\�fo�\��:���:\�4\�\�r��ƺ\�ZC�75�5=\�uf\�L�������\�`�ڪ\���M��l�s.�\�\�o�>q\�\nHI#\�z\�\�&���YGa��$%�o8]��u\��\��^\�\�\�y7H\�-t��\�߿?^���x��9{�;\���ws�\�D��Y:�\�\Z�q�<�tf\�*�L[Z\�\�-`\�mm|\��s\�\�\��]Z�4�M56Z[k�U�6\\\�5���\�\�\\\�һA���)\�\�i˰\0͚Sz\�{\�ߦ\n+�x3\�{�b���\\J���z:\�ձ����8�\�k���V��\�¢�H�\�\Z\�l��&�b[�����P[�y�+\�\�\�k:\�)�\�6�ͪ.G�J�\�xyx��\n\��\r�\�\"Q������0�\�j��ꮩ��x\�\\)˷��\"�\�\�2Y\�Q��\�\�jx\�WR\�\�\�h-o�V��!\�\�E���ľ�ڧ\'\�\�Sp@IV�k\��uI�\�a�k\�Q����Ax���J��ǲ�+}\0\�W�{7\�w��ݿe�Q\�Zq�?᮵\��F�)�@�}=d{|�<�\"�A�V/{\�\�#]�f�bD���W\'hX.�WZ\�4l��\��9\0�\�Jno\0\�yh��\�J�k���Vtޥ\��{9)k���ל���Z˾jS�j?ʑV\�6R�nC�6���\�\�C�\�\0\�\�`7��\�ٴ\�=j$\��\�W\�D��\'\�lo�ݶ\�v�)5\�\�XkJ���\�\��\�ޔ(\�N��za\�\�:_��\�\�w̅P�@�?\�s����\�tU�A��WG	������.\�_�����5J������ުh\�\�����s���\�Ɋ\�8z�;e/v�\�qċ\�\�~�Bm��\�\�V��\��pgJ�Cv�\��\0�\�<�WGk��y@6\n�\�wz\\Q|ݰ)<��u4)t�J_W\�x]��\�J*\�&�������\��B\nE���74.Lc�t^�#<\�\nq��\�\��\�\"�\0e\�ц���8޳R`\�T����]\�6�\�kC��P�6��QCX\�6�wc��\��G�^�y�s�\����\r{��.���u\�V\�C��n氥`�K\Z\��5#�jM#�5�n�<���MFT0$p�c\�1\��R\�@y��U�{_�\�zs��W\�tr�l\0=?$��\�&�g���=�\��n�ʇSRXI,5\�s~k\�TC\Z�j�\�x�\�\�;�\rvI\�\r\�}�\�ނ%\�w�b��\�6�\���\��`�Op��ؔ\�\�%v�Zd\�\���\�9� FS�\�\�w�4�qV��\�\��Şv\'Cj\�\"�w�\�ݺ;z|�(�\�n����\��9i}\��K=k\\7\\\�\0�o�i���\Z���y\�\�j��]{w\�3\�>f�{\�T\�C�΀\�Mt\�@\�ms5�\�C0���VmR�d5\�hOQvU��ʶ$��\�S�U./���q\�\�,h�C���\�@O<\��r\�&\��\�̵\�^�\�:2��W��\��\�p����e��jN7\0�����د�\�#(��AA<��\������Iʔ=ߚ�gs�8D�@U\�9\'�5୔M�I&�VC�\� l��\�϶\�\�ASx\�a@��~׳.��W��Qe�	�*@�\'\���G�\�c\04RK�4Uh��\Z�=�\�ҹ��p��C+�\0�\�\0���[%\�(��P�<�\�so�7`:VR�ކ�\�z0lZ����l\���\�I�>�z|�	%�0\�\�\r��r?\�f�\�ϯN�\'h}\�KH�zK\��S��\�\�es\���v`ۓ\�0���l	#Ћҫ�J\0]��D�A?(/x����\�C���P��b��l��\�:\��\�\�X?z�0ͺ�R�99	��Y{V��qfKf�[��\�<�YS���ؓ)\�\0\r�H����_�@\\�UĲԅ�\�\r��M+��mI�d���J�\r>\����\�\�ֹ.+0�->�3�ba\0\�@=�\�\��=Q{�\�*H�6\���Z%Z)eYNe=\�k\ZG�	�S�*ҪqQv�ᑁ\�;u\�U�\�\�Zw�\�\�Kq\"�ES�Jl��.�/�Q�\�m֫e��c@u=+l\n㱈�T֭a��H��\����=\�\�J�{l�}��\��a\�\�l\�J#\"��\�v���8\�,/V��\�B�\�x.t�,:��qĦ\�\�{x�]}x<�\�7�V)�\�&\�E<9�vp��x��c�{	\�^\�_k\�\����\�\�4n��\�X�}\�%�\�\r\�k�=�\�_\�yk<*\�p\�^m)!�o�\�p�K\�\�_\�d\�~7\�sϸ\�\�XaG��MC.�q\�r�b\n~�<\�gK�P\�\0_�]��0\�i��\�&*+X�ni2\�T\r4c0Y\�k*�!�,\���!,\"�\�}Wi�\�\�\�xf}\�\�\�\�?o-\0\�\���\�<�{�\�`\Z�(\0�k�\"��K�r�\�\��dg�\�\r\�w�q�\�o��+��^o�\\	7\n��NK\�0\�\�6�;nś�c)X�&�\�_5|�1\�3x9d\�6\�A,c��тU6V]%\�s3\�{�p\nIx\�T��b}9\���4\�)G��goy�4\�+ox#�%6���\\��\"�\�|\r਎y\�\��ێ�l�\�\�δ�\\e��~2\�_�\0\���K�si�����\�-+�\�[�\�\�\'DZmV��@��\�þVu�`=�E\0?�\�����o\\�<\�\"\�my��q\��.s�p^G\�I�f�^y��\�\�$FZՈ}\�6�DT榊�4\�N���\ZVрS@\Zz偨�5�x^�\�\�d&\�\�S=G�;3\�q\�J��}j`�8 @?\�Y\Z%\���sI�ﭡ.�#\�\"\�8^^~RC;1\�\0m��\�_�xcuq1XPe\�\�YKZ�k���\�U>\�X�NE��\�&\�@;-6�k�?%�:െ�\�e���P\'Վ+�w��Q\0�gr��N\�S�3�)n��!x��ho�\�9{�9a\�\�\�\��\����\�/�X\��|m̞����qɤ��{�\�:�\�mt\0�6\�\�(+�\�\�\��w�\���:\�J�B\������7\�T�-&*>�2�^jA\�\�T5�w����\�_��\��e���X%)\0��\�۠���ȃ\��Oݐ^�\�cx\�a�`&�\�D\\�-X���%���P	�[ \�Ő\�\��T��N:Ȑ(n\��d�J�{(�փ�bԦK\�tW������9\�\�靷\�Q���|�Y�m�\r<��\�\���ޝ�h��D\�\�e\�$Y/�/G\�sM.{K1x{\����b�(v�\Z\�_\0\�H��tkMK�\�\�G\�u֯��NdeW�\"�Y\�]�f by{��2F���u8�j�Ue\�}������cE7\�/ꁕ\'%Xs,�{��_�*\�Ĩns��\\\�0�c	���*��*!�FKC\0|\�N\�xx~e\�q\\2��|��\Z�afk\�#Q�YU\�5{�_T@��\�\�Z\��\�\��\��j@�$0�\�Ro\�2\0]����=�\�W@�+C�~\\�/\�\��\"���Dպ������8�V\��U_�\n\�݉n\�0��6p\Z\�ȴ���6�\�\�\�\��Hz)\�\Z��\�r\�\�ƺC_�]ݸ4�;\�E�{�\�\�Tr�\n 	�;l%t\�N`=��GlXu\�uG}l�s�\�p�!�֨=�9<FS>]�C�\�\�\�]�xqȞ.\�	��D�>^\Z\�g�<jA\�\�q\�F\0t\'��	�c�_h�\�\�󵌀\�EZw�A��\��vV\�9�\�lm\�֦\�\�\\��FoF�x��U\�\\��>^?(\�\�s\�h�����\��zt�\�\�P�-@�ō؄\�os3v����ƛs��\Z5\��A\�6�Uw\�r+\Z]� ..\0\�\�\��=-\�՞�!1*\�eo�ٴTĳ\�Ϗ��|F\�Z?D��Jr�\�O\�~��uF�³|<�^�?�\�\��X��Ɇ�:�%xr\��4V��\�>���x\�\�~h�\��~�z\0\�\�ye\�Ĝ�R轖����@q1���\�3��\�!�\�\��#�|XD���]_1�$\��\�\�\'��Տ3�\�FY-��&)\�*���w�����,?2\�|q\�V�<\�,)��h�1z:�\�~Qd�\��\\\�\�_,��u6ZP\�g�)`?c�:��#O9<���\'�vЋ\�n\�U9\�x{\�\���65\�PG\�z\��\0uW7�PS��ժ�8��\�\�+�J�\�\�\�6\�Ya�P�p7\�Qu xuz��09\�(\��~\�DN��p�\�i\r,R�Z�;�˫z�\�W�bB\��֖��\�L�\0mjT\�=xj�\Zj噇\�\�\�P\�=�\�\�\�<׵RQj\�\���j���PuQ.���!\��\�(���\��#�\�	���r���X\��b?o\�\�H\��i��\�`��\0̓`?\�q\�\�c�wF��í�hp�_\�y�`7�૕z��\�}Ϩ\�7�\n\0\0.ׇ\�rcȶ\�t�\\@ESU\r5^鳱\�B��.ĳ\0��0� \�&�	�\�\�HO���\�XҰ�ӥ\�nB��.\�B��:\��\�pǼ\�\��\�D�\�v\�n>\�ET_\�}\�pˣ+h����(\�\��}=� f%���aQy\�ưb^��	\�^\�9�m�\��\�f��J\�\�Q\�1�W���\�i\�t\�\�v`\�\��~4j��\�\�\�B��nG�@���\�\�\�\��>@?��\�1T\�Ce\Z\�U\�\�j\�Ql�\Z�1^\�>�]b����W��m�ܠ/\��1bnFq\�\�\�y\�\�cث�\�5P�ZV�\no\�\n�A�ǧ[UZ�5\�\�\�`\r\0Do�cDUҬ�\n8\��{��ϯ\��5\���\�TC\�/V\�\�<�\0�b!	^C\�\�)` �\�\�^a�US�؍�g?�p�Ӫ\�l\�\�$\r�\�cx�\�L�5[�U\�\�\�pxj(�\n�4\nk�=\�\r\�yT�-���كe`\�\�\n*]\\�t�\�{�`\Z�Q֘\�\�v1�\�9c\�\��\�\0~g0\�/\�gXkF��d��2PI\�g���*4Y�\�\�\�x���;���\�s,6��,F�E�\�ʟ@/�\�\�٤N�s���<�\�\�+\������\\m�x n,\rhsEy-\�`\�h�V�m\r4\�.\0ߖ7\�3+8�\�\���~��@7As\�\�\0�\�\"\�^��&dWu\�Ai\�n\�;Fd�� ��s��\�;�:��+��\Z@\��\�\�\�\�}��k	�xz�^V�Q�\���\�˼\�j�X�\Z�\��8�\�\�a\�\�p�\��\r�Bט C\�\��\�&��\�z\�m\0�\rU����\�\�@w�\��\�\�(v�f��\r�S��P�5\�\�#!d���Y��6�KB	���g˳��\�Nff�q:\�\��s\�z�Ə�u�@\�\�\�R�z\���H�g\�Y�z\�\�C���\0U\rI݄[�>\\^\n�\�}޿�^��.\�e֥\���<z�,�����\n\�55E\�g�G\�٣�\�ěwT\�\�ZMB�ղ*�#�4\�4���\�(�\�TW\�T\Z�}������5�FNs�\�Ϫ\'�\�W\�+\�v\�>\��\�,�!�\rg��7�[1\�\�p^jq�}��]E\�	\�S\r�8\�\n��9Բ�\�5�܎���/\�!`ܷ��+\�O�SWLH��\�~p\���\�3��8ŗx\�j�\�rò\�\�d=\�s\���\\A_�mŴ`�\����C\�\�X�Ű\�>�&��fj�a��e�B��o��\�\�B�Wچ�F�(ڤ�l��~6^�7�3N}VW\Zeq\�L\Zˢa�{�%\�W+`A7�޹�U\�\��lcP\�X\�\�0a�E\�]�kK_��\�\�{p\r\�W��55`��\�\Z6d�� ��\�\\\�\��C\�k�+�-��c8����\��ߛ��\�����~\�mo]�@\n�uPZT�VfcuP\�zN��\�P��vZ��\"�5Mh.�z\�|��\�\"�FS�\�.\���H��\�{��\�8qw��E\�T:uP+�m��\n_6�\�\�\0)SQڭ��\�#(��`�m�v\�I�\�\�o\�R�u���\�\�*X�\�\0�da\ZO\��\��lsx8~>�!\�\�oB\���-\�\�f5e.�^�\�tD��`��\�JS�{\�\�C�1\n�<gЗ\��l\��|h\�\n����JdBE��K*\0|��X�\�P�\�z*=w�(ɱ�\�\\��ז�Mv�����>>\�*c\�&.\�\�X�\�QV\Zyת\�c\\�F�U\�,FwYY�Ӓ:8e\��,����4=�\Z�\�)%0y�U�\Z\'\�i�<\�`?8+M��\�\0z�\�$�\0S�\�z9��w\�\�\�S\Z�\������xv\�+�m��8�e�b�\�ՌC\�\�u\���K�}ף\�+Ы	J-NH��*�Uj\�*df�\�u�7���C����\��\�_�\�\�\�a\\kIK�<�*����YP��\"\�\Z϶\�)\'���SP}��\0\�%3@/�\�\�$��\�	6�9|=Z^F\�xnI)\0\����\�&�y#�Ɩ�\�\�M�\�:g��.\�\�\�FV�O\�\Z��ߪ^r����δ�|X���.�4{\��_EW�U�&�PA��q���q\�Z=f1�gE��4\�TK�M��ư��Q6%�+h��\r:�+�>4���\n�����[\�r\�5�|�\�\�\r�7އf���!�\�\�\��\��^�\�\�$�6\�\�\�MI\'\�#]��kC~�[���\�T\�ʆC�F\r*\�\�1�܋.�ދ����r̕�w��{�\�j�\�\���\�x�%\�\\\������j��d�	���H��<\��T?�\�#�=\�5�\�Z[f���2�-(\�书a#\�\�\0�\�M\ZgÎp\�U\�\�X+d@_)�A�0���E\0�?P,\�\��\�\�\�`nKL��y]l�U\�@\�cb��U�y~7�\"6�g�\r\�\��\�X\�c\�\�Zj)qKq(9�\�\���\�N\�Ţ7�A�?Z��\�\r�\�:z\�\���F��k#I%û�\�I��+�B9\0G\��\�}���>f\��C\�R0V�ؓ\�MMc�\�n�9��\\�yx|~�����NDi�S�+��W�\�94���\�1�[H5�\��[�\0^ \�WV(\�E\'H\����!�����5�8O��\�qIO^!�Z�G�P\�i;dc(�K\�A��\�&\�H\0\\�\��B�\��AUg)��\�QSE�ut��RgI<�b[\�\�\r6\�&Zc�:\���\Z���&ޖÊ�pA��t��\�\�͞w=\�:jl����G\0Ds��P�[�]�˪�G\�K\�n�\��\0\n�)����:\�\\�[�&Z�w-�\0���v}%�\Z}��\�J���\�A��@?\r\�C�\nzs�}h3%4z��=�c�k��(�s8Z�\��\�1Z\�\�\�TPG\�&��(I*����z\�\Z:��wQ�e\�\0@e\�H���&m\���\�$r/\�:�p��E[��\��\�)Ď\�\�u�pJVQ=M�j\��mH�6P���,k�η��>M5�\�c-��\'?\�iqe��\�\��\0�\�x�V�gs)\�\�\������\0?\��\�Ce\�@\Z#!�0E\�G�W{v�k\�\�\�[|}�7��.:\�\ZD[U\��\��\�߳\�X\�\�ϴ\�*�\�tr\�Œ�\�\�\�\�\r\'�\�\�Y2�{���\�\�ܔ=^���x��\�ՠ\�mL\���\�\��P~]?pI61�5�D#��j��v�H�}٪��\�^�aG�c��)|�bS?|/����}-\�\�$�+�V}\�Ub�Q\�aD5���면p�\no\0=Nq�\�\��x�UQX�=~$�cρ&\�+�\��;\r��\�|oa�k\��\�{�(\0�>j�:|h���*�\�7ظ\�i��C5Sn�C�\\�`v6\�E:\�MZޱ4{�1\�\Z��b�\�	4�U�\0�u�����.`�kW�\�\�\�\���M\�m�B�Y���<��2`�\�roZ{pzK\�i{øQ�\�W12�P\�y4\�|?�P-q�\�!&��x�	i4��<}O%k큞��qg\�\�\�rb31\0\�\�3\�|�&\�����(�&i]���\� *\�QGr\n90ݱ�[\n�r\�\0����;z�\Z�c\�T٧�=x(��84�\�U�4y\�\�mN�\��C��t��EΖG\�bM�\�J���ǫsv����\�,���\�\n\�-\�\�\ZFQi��\Z���\0����\�\r��gѩv\�8���Dkϓ\�.\0�E^�C��k�\�V匥6��i��kڄ\�ư�\��\0~�;)�aT�\�\��\�灾#\'\ro�d�\���\�k��v\�,Ք��A�\�<�\�\�mk1\�\�@M�-(\Z&�	sR����NJ�8G��-���˔z{�������0\�5�{��#\��iW�0�=\�:&�\�\�Z>\���)p��g\�Y	Z�\�3�ܰ� \�ϵ_\�g�\ZYƞVٴ\�H\���\��:\�\�yE\�4��C\�|\��F`O �-\0�M��\��\�o�/��\�_鷥\�aLG\�b[#\�_\�\\\�Fu\�fr���BS\�\�b�Oa�at\��w��f\�C�,\�չ�.��W8\\`�*�9�\�q6��V�<\\��\r�\�Euu��B�Oby\�y#x\�Oc�tR�N���\�E�\�t��1U\�xw�P�Z]\�8D�+u�)J��C�m��\�.k��^� v0�\�$͑SQ\�2�Y�\���\�\��`O�B}C�01bK�\�\�\���Rov#z\�\�4�]\�o����\�S*%Ku\�\ZQ<�ϴ�����U�\�]Gc�J\�Q��\�v�\�$�\�+\Z/�\�%\�|\�-`c\��/\��\n\�\�\�|���\�E{\�5�3M\�G��\�?u\�\�:H\��\�O0,�\�/�F?Z�Ǜ#��lc\�uR}�:m�V�\�\�icOc�&�� ���QoS���\�^M.�\�k$vkF�5\�����\�\�\�\�Gj|.}9Ԉ\\jR\�Ht)\�W��kHG[��)�\�h�f�\�||y�_*\�%\rၾ3W�)ɺ��)1֔����1\Zv���Jýiu\��֒�cmͶ�\�e\�^8h�ˢ\�^\��\Z>3e�3A;f��z�d%Ր,LB�y\��昂|P����\�\�H.���lr*�8\�{]M�WF\�s\0�\�f�t\\W\�\�W\�]S\�@\�Zd\��\�;5B����j\�\�u\�]�\��rz�BW�\�8lr����)����F���g\'Y��0{|ql���\�#�\0�J�\�0\0\���\0�\�JyclX\�KC\�C�.��c������\�\�x�\�%%1\�\�x%�3����\���{\�\���cG\��K�@�\�H\�u6�(\�*1h��\�r�\�ݹg;T������T\�\�7v�}z�\'\���i���<\�kH3�M���\�&uf�����\�5W\�:\0߀�n�\r\�Fp\�\�&G�ƚr:^,5\�U\�G���\�[q���R+��;j^�G\�p����rܥ\�z[\�3}N��J��\��aі\�$�\"ST^:\�\�<�\�\r\��\�\�X\Z\��..�4�i`8\�\�b)\�ko�Y\�J\�T2\�&4n��\�\�|�\�1�\�\�A7\�Qxz�Q�\�_09%S�t2��D�ٌ�T�\�*\0\\\�mt�\�]��P\�Ln��fgy��i�+\'ņ|�n\�W\�\�X\r��p7x�s\Z�\�k\��$�)(�ʵ\�\��8ri����+t\�`�4��c��\�\�\�\�L�\�\�\�@N4$F�\�\�[\r4�\�WDޅ\�_�\�\�xk\�\�s#\�v0��}W�F\r��\�4(x�\�\�\�c��-\�P���\�\�]�\���贉\�\0�\�Gg���8��\�f8\���\��q<�@>\�gs�1�7�\Z�\��n�\�#Q\��t\no=�D�\�>.\�ѕ�?\�^\�ךG\��u�\\\�EaH\rH%�R\�@����T~2!\�o`\�\0ld�anh��`\0\n��jh\��\�n(�YP��B�\�{.`96Б:::\�fXа~\�\\���x�S.�\�=/�Pœ\�\0��\��g��\\E�]��\�\� \�hF]g�hz���\r\�Es\�G\�\�\�\0\�\�H\Z\�tPv���G\��>4+\�^\�\�o�f��hbH��m*\�P,\r����C�ks����c��in|h��g\�\�\�X��Ak=\�u0���	\�G\�q���\�ؔ�\�+\�r\nj:\�(*:��ι����\�\�㺳Y@;VZG0�5\\\�VG\�5�vs\\	8}l]�O�\�@��X.\�vlz\�\�q�]y�:˕\�\n�k�l-�_\�\�#u�i�\��Et�\�-7��;\�\nZb�|=\�\��\�\�p�y?T\�\�\�\�\�}\�\�a\�+Z_Y|�\��F\�\\tY��\�[���\�9z����[Oa:�9\�\��\�\�\�\�\�iNI\0��(xh\�%��<\�ƪ�-#��׬{��G�EÕ6��f���\r\n�C(\��#*U��k�jϕ�e=��nM\�͈��$<{\�]����J(�\�\�+���U\�\�[CV>\�h�]�\�1�\\\�c\�:\�\�4\�J��1��\�I\�OU$:&�\�tb�ψ\��K�\rK\��$�$gW&��#\0	��\�5M,�\�\�\�G�׭\�Eك|ƙFh;T	ʿ\�\�~n��!\��hw��pߦe�e�\�O\n\n���\�K\�U`�А�S.�YVb0j,��bM�\�+l\�_\�~)�9\��\��(�o�LM`Z��\"ה0v�_3\��s��\�\�\rX�b��S�[��苀]�\��c>���D\�O\���K:\�\0\�x��9<*zPy\�G<GB9\�ꝧB�]\r�\�\�)�@�Z�\��\0\�56vص�\�<\�[)X�ěU�ے���_\�B\��]��%�\�bz%\����\�CqǺl\�|�f>\�3� ȝ\�J��ޕZy�4j\��by\0L�\�\�\'�nw&�\�G@�\�Ï�3��O�_Z_咲�j:\�\��Z�z+|�5��\���\\\r0T\�\�\�ń��:\��(�\�sp��0�|\�\�\Z]��S��U\�Q\�\��z�r.`�T�\�R�@1�\r��ƀ�s�ZU�f)��[�C\nൔأ\�b\���\�p.(\�Du.\���\�V<��\�\�\�X\�٩�1ٕ\�*�UyNǆĎt͚|h�<�r�Z<N��j�UG���4��~��m��\�\�!��\�\�Ӓ�33\�\�25%\'ʪ\"�:FC0\�\�\�X1޾!�\�ãv��\��]����\�\�s`\�\�\�+\�Y݄\�\�U��H�ߛ\�\�a\�:�u��:q�\0�\�ֺ�aT\�[è\��ڧ��y��\���jr9\r�B�\���r?sY�a�ٿ\Zw�A���a�\Z�پ���f)V�LX7��fO�\��\�5\�Q`�N�`\��E�Rx���<\�\�\��Z��A��Nĺ1H*�mg���\�5f��r�\�T\�\0h/��u4\�!\�U)��\�j�\�|(�� ʯ靺(�P{�����\�]��S.�)\�3Б������\�ku}\�\�\�v:)�h]\Z-�,z\�f]�\�QSe�!�ܪY^��\�\�\�uz��g�\�,+\�\�ܘ).�t��\�\��\�\��p�ߎ�\�JGU+\�CU\n:�\�\�q�?ߘ�g\��K\�\��h�j7CQ\�O�熊h�N��c\�5ׁ_g�n�A\"\Z\ri\"c%+*���\�\'\��@�R��\0�\�\�K˻v\�JT\�\�@\�u<\'\�K\�@5 qB�Q\�B\�;H�0�[\�=j�3\���}k���W�u�MIDټ\�x\�_����Z�a\�xb,��\����9�\�\��lܩ\Z�\�B\�}\�\�\�ތT����\�\�&9Zߍ�W\�M`��ئ��3�>\\��$RK1�/\�x\�J��Z��y�����dZo��\�,�GOV:�Ou��;2c�-;ʚң�>\�\�\�ܲ�\�o�<掕\�G[[A��\�\�$��}\�g\0V����中N�9)���,VMG\�\�;Ktw����U\�\�\�\�{x�׀	�\�U��ل\Z\�rA�/�P\�\�a�\�P\r{��ϫ�y��E�5�\�U/H5��}�.̮\�F`\��+67�	u\�O���\ZŅx\r�\�t�4\�?`M\�\�Uل|A\"�Z+~\��(\�vU`��V\�_��^�l�\�l��\�7=�\�.[hs��xz,\�H��#\�\�\n\�2iOzh��WA׈AtHt�G�\��\�P�C,��H�ݏB\\0�\�^	\rvР�\r�\�\Z\�a���\�\�..	��\��0�S\�e��b-rq\����\"�=l��6��ZDw�i:���\�g@7[s\�t�\�٦� �T\�^;\����+\rf�:6�\�\�\�ZΜ���m6\�\�\���Bu\�(i3Qzmd\��\�F_9���Ie湥\�G#�&\�xvxP\�#h\�a�\���7\��\\�r*���\�\�0\��\�{w�@>���\�)ij�����\0�e$]UKTN�I�\�\r�eiD<\�l]���e\�Al�\�\�Z䜒��[ђj��~mmb+|>�8\��F�R,��d=�[\�g�|��\��\�R+���?P��\�X\"�Do����\�Q�R#���\�i\�X� �W�\�b<{a��\�Z��[\�\�Z{\n^>UǃQ֘e��Vs\�j��v5�\�\�	\��aX��O��\�\�rÔLU\�\�\�1\�(�W%\��\��\�\��yIT\�\�]֩2P\�\�\0W %��F\�e\�c.b[Z�\�\��2�jy���WW&�s�9阵WN��	�^����\�\�\�\\Х\�z�Y�Ȳ\�ك�6\�\�@M;�G��U��{̍����ހ\rJj�\"	��,�-\�qb`Vz��\Z\�\�PS�M�\�PY[\0A�8\�4�Zb\�Y�u\�\�\�xF�\�W��9\�B�9�ΛU�\���x,��\�\�7�?\�kT���61��ב\� o�zԏ�\�si��|\�PMN]\n��O�X�.t@Wd��4X\�\�w=�XG�B�*�t\����\�O�\�j�6S�xV�����{�\�\�\�z�nS�Q~I\ZU\�M45\�u*,PV\�0uBu\��\0\�\n����W�|�L\�kA��\�\�[�!�I��>V�rSA<-���A�tC钢�|\�\re۱d�d���.�qK]���\�}=\�F6��vZ\�\�M=Kz�\�E�;\��\�e6�Cxlչgf�yt=Y\�6TRh#*\�\0t�\�\����ϲ`M���&\�H!:=;\��\\\�\�k\�O�\0\�\�<|���c�\��V�\�W�xoQ1z���~�CS���\�{U0��1@��U�>\\�^\�u5q7˺RM���s�]�@\�ޭ\�\0>�5\�GZC|�\�\�\�uC+\�|\�b6먮����\�\�6;�j\�\�tf?�\���\�({4莡u�]��N�Xxs7�\n�I9�9\�W��\�Ee\�\�\�)\�D{[\'1k\�x\�>�y{�WƇ1\�g��\��D�\�`f\0_c˖�\�Q	�s�\�\0C\�\\&��#N�\�*@(#�\�\�\n7�w\r\�/\�\�BK��1\�k��u��F7\�\�\�9�:����5\�|??G\�\�a��q2\�8\�kӃC�<��V{��zګ����\��-�q\"ЫG��\�/�v��#;���B�(\�ꤪ;LV\�Ճc�\�7�~�\�oN��1[��\�&`��99d��mL��\��_\�jx9����&\�h\0\�\�Q6<�|�\��c�ۄqlͳ`[\�2e*\�E\'|�C�\�\�XF\�s��\�,w��pc:�q\r6^\�\r�as*\�\\\�b\�\�\�f5b�*�\�x\�\�m^q��W�\�2\�w\r/�\n(\�	�*�U4~Mld�\�y�ui}�Ͽ1$\���)ʯ\�z\�Q\�E�\�V�}�\�w�H\r\�\�\�Q���t�6�4L/K\�\'�$I\�\�Pyk_q:p�\�P��\�|x�B-�Wϲ1_:�=Ϟ`�\�̟a]\�[@Sך�\�kN���֙k=\�q�^���\\\r|_a�{M[Gs��;A.�U��?^S\�@?R	�+�wE���;_����Y\�֡VZ)�\��oJ\�\�\�EZml�UE߳\�\�\�Vq\��^�\�]����+��Pm��\�Px�2{aO5�N��\���\�=WN�c�\n֡\��\��N�ΐ}\�H�h��z�=kPC�S���\�\r�Fz+�jV\�\'_&��\�.r�X�\�h��0\�:b^@�/`��8׍!gψj�;\�\��`\��H����U��X\�h��\�\�Km�����W[\�	�C\�W\�\�z(>\�[g\��u�\�׈i�kK�8c{\����\�Y֜�Vf\�3X\�eu˙tG��\'|`\�C)\�\�F�(\�s���*\�A\�\�5�A[1[XI7+\r����S\0�j�������\�\�lֶgf0\��#� \�Z�1�\�\�`�g�\��x\�Y4�z��հ\�;s�\�ku\���\�F\�Bݰ\��pY}\�\��P�/b2�a;^\�\�\r�P]0�:�-\�F���\�n�.�_\�\Z������]�PK�;�\�w@\�\�\Z���j\�ћ��z�+P\�S����\0\�/���݊\�k�LWU\\*\�T�¥X\"{\�@)ϊ\�\�lk�\Z���\�k\��(^�\0\�$�f��ֆ���l\�\0\�e��	�\\cC\�e�<\��S�/-Ѻ\0ul��\�^�\�语���Vu\�\�޻e��w�)���\�߃rG6<qV�����\��\������z\�$�H\�g��t\Z2Q#/�Q\�6V��|\�\��l�8ߺ�2\�\�֞�\�12y�z@_e1�拈�\�;�\�\���\��YP\�\Z\�\�\�\�v\�:]*�\�o\�Ͻ9?�#\�1���\��\�t	�0#�.�\�bqn�+�[��Ѯ	B\��\�y\�ձ\�\n�`��ׂ�=\�\�$&����8\��Q�\�y�������E\�\��\�z���1\r��r�0\n�f��\����Vn���\�B6Q�e��4�W&�E�@>�\�\Z/!\�;x\�.E֕\�JgFC�\�\'\�:*X���ڮl�\�p}ю\�\�\�tc�.�\�ǳ5\�l%\�R6zw\�T�NC�>�\�U\�\�!wFUf\�ǰ�\��\�x�|��T\�uu\�\�G6�=\�\�\��\�.\��y�΂��\�\�\�dm��lG\�eXǒ�\�=\�\�\�|]\�k�N�\�ix���h]�]��Bݎ0d����;\��4<��\�keZa�W�_\�R���{\���!��Yt\n2�j*\�X\�@?r�P-�\�\�\�\�f�V������@/�k\�y\0؊�B\�\�n��Wd~mP�\�ʨR\�\��\�Z\�h�S�r�*���\�P.9,�k�\�y��UӀ�<PM5MPpS\�`Z	6m\�6\�\�lcx�\�\�ViD#\�6\�HET�\�r3\�x;�R�5!\�\Z\�\�Ym�M\�M\�\�޴jV�=<\�\�ւ�n�r��~+3/3\��9Y6X�\��\�Ux<iw\��F/\�\\�.*�\�<|��\�~�Rc��m�(׺3\�5\�\\ӌ8k\�\�7�\�\�߾Z\r3\\�\�7�\�i�\�]\�\�\�l�k��Y��:�h��\"\�{3\�\0�\�\�%��)j\�8y\�\�ޑ�\�5\�\"<ag�LC1�\�k��5\�؆��\�O�eC�*�)�����(.��\�ŔO\�\�#\�wc\�\����\0�؂\��\�U��i˝\��\�P(NP�k#���������\�\�08�~쳱�\�U7]\�e*0\0�.�?�,�PM\�\�W�ڵ��\�]�G;+��ǧ�+v���\0\�\�\0��t0\�u|�ָ>\\�v��\0�j	\�ٌ�׮\Z\�M�\�&k��#\�bUr�\������m�\�\�溝oo\�\��M{~�\�{\�\�\�-�\�\�\�\�\�5{�\�1l��X��\�-�U^��_[\�{O۾R(Ë�hu\r\�\�\��\���lm��=k�|6\�\�\�s,��ߚ�\�7rZ\��\�\n6I�U�\�z4o�@_\�h���M\�|U��5-�\��ۼ�:�\Zz��\�\��\�:x��0�\��<�߄\�^qH`4^k	�.�\�y_\�\�\�>d���UH\��\�\�\�^a\�\���\�E��:\�pF�5\�\�m�>�RO�M�Y\'\�X|�(w�\�Ԛu_`\�ٹV��b���Vm\�\�Vq\�\�\�_��X�}�j1ր\'n\�#�f���`\ry6R�����T%�\�J\��3��\��\�ZM\�\�ug�#j�Y��!�\�Na��(\�cҚ\Zo\����d��x�߲JNe\�V<\�GZ�ûV�o�\Z�]�\�o�y>�*pK= �ٯ\\/UU\��\�G��h��WK?\0\�D�+\0�pt�}.����\�\�\�\�\���\�y{�Vך\�V�U9�b}|\� 9X+F\�g\�\�ͷ�`X!�]���\�mx_\�\"�W�T]u\\r�d\0Fq�	�͞R��d���\�n\'jrm0?ٺS\�7=�X\'����\\Yus���h��Ϭ_S�l���\��\�4(�Ѯ=;\\����u{\�\�s}\r�/7�\�\�\'Oh��\�æ�Y�^�y5\�8�\��*5\�R��u\n�~k\��]�bZF.\��/\0�\�u@�n���-{|�cϏw\�\�鶽\��\�\�.`\�^\�����8\��������y~�\�ڴ\'{�\��\n\�^�\��W\�\�\�&\�a\�ζ�0\n�v	�/�,�7\��\\|��\���B\'gN\�(�@j��\�J�8�\��t\�4\�t}	74߁^\�QʸR�|y{�����&\�\�ۼ��t��\��~\�of��݂\��\���2�\�s^Z����`\0���zO:]Y\�˯\�\�OG���3\�\���5������`��KX\�\��>�﷐\0�b��6U\�`�\�?P^f~_��A\��2�&\�U&\�XM\�=��������h7R@MWD\���2]�0\�U[-�\��,\�)�x`�\�O)��ל�@i����w�\0\��ř�=vw��\���\������7�����:\Z�\'DX}\�m�ˌ��\\�	\�+�Z\�n@\�w��\�\�hy�\�z\'���� \����p\�~^K@�_�<I٫��T8\n\�\��8U@\�n�%<�FO�\�\'J\�qIGPn��rc�U\�+�\�<x=^\�\r�^\�ī\�uz�c_��Z\�Q��VX~��\�V�\�*C1\�\�\�#)f\��+SaS�M4!�\�a\0|��\�f0\�s��0:f��#\�\Z����^S�\�WG�Һ���V\�@z@�	���w\���\�Ӌ\�C�d5���*�8z$���\0\�\���5{�\r�w\�\�=;ٶ\�g\��\�T_o\�S�v,�o\�\�\�M�\�\�{��L#��\�\����>\�\��m\�.\�\������\�xq�\���xg͞\��Y0\"Oe���\�3$\�\�\�E{����@��Ϸ`O�1[�N닝��f0(�ESk��\�jm��Sj��j��i��f�3\��j�nj�!4\�\�|E�v�d\�\�u�\�Q�	���H<�71�\�y{�O\�4��x\�x��>sb\�J;��z�\'\�o9j\�-�ɓ�W\�\0=W\�tf�\�b��>�\�\�\Z\�È���ۦ�r3o�����\��j�\�j\��\�\�v��NN\��\�Z}z�\�\��\�̑�\�d\�L(\�\�P{�\�0�=�\����15���\��\�\�1�1�2�\�f�,��\�k�\�໲\�\��q֒\�L޼*����oYq\�]+{���b\�@\�5$߶֌h\�\�M\�p�t\�>\�\�K \�\�HTGƪ�w�\�S�+\�g\n�iߺT\\IP��WW\"\�B\��\0�\Z�\�T\n\�\0�\�G\�50Q\�\������pj��؅j4\�\�F\�I�zs\n\�|��R\��eh�R�RjaA�żd��cU�\�\�h�\�zk�\�`e\�<\�\Z\�\�1!\�\�2�1\�\����	�w�\�m!0i�CA[\Z���䌅\�\�<�|~$.����z+�z�\����,/w\0�&T\�+�^i��&�Q\�Q�\�ќ�b�>V�ha��\�b3v�g�\�ī\�l\�w����ɞ�ȯi\�����\�/���+���S}�\�\���\�\�%\��b��\�~�\��о�<v�\�\�bx\r�X0���G�\�sX\�s@�\n�\�	��=AZh��z\�_�\�ٳ�9{�=c�K���rL�\"��O7Mg�:~���\�K\��j���\�\�\0}����\Z�I\�^y\�\�\0�_K�o�J�lw���W6���\�eܩWZXF\0\�+���,\n�*�o��W�M\�\0_S|\�\0\r�^��\�XG-�Wx��ϰ:\�\�\�\r��*\�\�\�W��*�\\\�Eh�J:�0n�~/3.͍GR\�E�\�c�\�\�\�S�);ٚ�\���,\�erj���rї�j<v}�\raѵC�^���r-�و���\�Bt?��9��*ζ~�jO�ƣǻS�6LsF&1ʪ\�\�Z9�$\�#3ʢ��*:\�j\�\"�\�ߞ\Z��H�\�\�Zئ�|u���9@�Sx�\�\�\�	�Γ\��I@?�\�Z��\�i4����=\�{����f(b	WC\�~\�{�\"\ZQth�K\�\�Y���GW�)�#\��>�^���pO�-���\r\�;a��\\O�zt��\�&a��R$�Z\�5>L�Ɣlkϯ���&mi�\�^���M\�\�\�Ԣ�ö>�l[s��3�u�\"��qn�v\�\�\�{w�k/?\��}�r\�\�]��\"\��e\�\�y�kH)���\Zu\�\"��Ȃ<\�=\�u�\�l\0z���\�t\�\�\0ܷ��\�%^��\��\��4\�\��{�\�ǧ<\�\0�\\��F\�?ߵ�x��\�\��\���y\�W�W�\���߽>;�7G�?����\r{�x\r�y��Ā�?Z��v�:d\'K���66����\�r�/�f\�2��\��5\n\�H��\�t>\�Z\�M���\�k�Vtk�SPj���\�\�\�\�Ыd�*\��z�ã۠q��\n\�)uR\\\�s�dI�-@\��\0�2���g}J\�\��0���yx\��\�^\�\r\�Tn\04\��?x&�\"�x��F�d���\�\\��b\�Q�3\�]!Vg^O��\�\�\�X�|\�\�v� Z�k\�j�Q�:z�\�|<�`\�q\�DU����\�pq�\�7T�\�\��E96X�t\�\�B�w\0���k~c��n�]޽�i�1V\�+\"YQ\�h�\�\��\��V��f\�/�٧\�\�U[��W\�\�Y\�9�WK0o\�F@Yyhv���\�?Z�Rq�\�w2\�^\�3t\�5aX\�TjJ�\ncS�kM66A\�}\\;���JM��72M�u\0�u0uWZ\�迟\�u\�H\�W\��u��T5 *��A>�\�kx�zy1\�c[Ğlj�9�{xP�k\�ħ�\��r\��W6\�dc��\�\n\�\�6�W�\��\�v\�\�S{��\�_\���%\0�l/\�\�JI}�B�Nz�GPiyg�J\�\�r��(�\�@�����\�?\�x؞��\�\��\�k(\�\�\�=���\0�\�\�~\�P\�Ǉn�\�֏�\\�n5�Z\���@\�s�eo1T\��{�\��\�#{w~ho��\�[\�\0���>ۑ�?\��>\�\�$��@�\�\n-a��\��򧕽�3o�߸\�\�4\��\�3�\���\�뼾QwZ�\�K\�\�h���)&jz\��u*m\�U�\�ݽθJ\�\��z�;\�w�G�+\�N݁\\`/�i�Jԁ�ks��v@�@�7\0��\�e�1�\�k���{5\0\�\�	�\�R���\�\�m�:\Z�\���ڸ�J�\�:Sk�q�Y�Z^� 6\"TS�&\0%���~�\�\�\��k>�Ż\��^m�J�l\�7��\�x�FK1\�\���EP{��Zj+Уz�\�kO��6�\�\'D[]���(�=�Eܳ\�\�n��yew#���ǆ\�\�LL\�ޔa��mgt�#h׽\�;�ߙ�\�P(\r[\�{\��!�Wŝ@��xn.=l@\�{/����a;\�p�I�:̪�z2(�ZFYՏjl�JG5	�lF���\\$]ٚ:�\�C\��)\rSё%\�\��j��ԥ\�e6\�C~Q�j�\0�A����ѩ��Y��\�(r��Dx�h���I0��\�ع�<)��f\�{;�\���t\�^��ڋ0}\Z\��B\�\�\�\�\�7����\�/�`ϥuWg\�14\�2���\�>���β]y-\�%\�\��?\�\r�\�` ���6\r\�\�\���2T\�&\�\�\��x��\�\0�G\�\�?<9bzb�\�\�\0�3o�\�OO��\�ث�\0^\�0\�_�\��\Z\��S^\�\�yޣ�\��\����\��\Zs�\�`\r�\�\"�*�\�\�\���α`I�\�H�ݪE�.\�CmM\0\0\�W)0\�\�PWU\�)}U\��fV+\�QK�N\�e\�-ʚ+U�\�_6r�w=�,�\'=(�;\�_���j�\����;\�\�RI�;ʓ\�([c\0�\�\�\�{l�=6\�fܡ\�נ�\�C��?\�t��;:���Sߴ\�!\�7zy\�`\�\�Q<�F:�-\�SM:k/Ń�\�@q�{OV��f\�<t.�>_����]i\�^@ˣ��\�\��a\0/O?RR\��\�\��}A����K�����H\0\�Z\���V�e�xzM���oU|]v\�k+���n���\�\�\��RL#\�t䩖\�\Z��sxW0\�rmەt\�=w�%��X^\�\��j%�	C�*Й����z��\0^}\�G�M\�\�7�1�V�r\�U5\�Q\r\�5\�CǵSO�BFŠ���6���\�Q����֖qaD�/�\�\��UE:\�TA΂2��0N\�d��\����O\��G؜\Z\\,\�ٓ�&7\�\�����\��X��\�M�\�����ߞ�5\�_\��\��\�ʷ+h\�y{!��u�蟬�\\��\�\�9\�CMi�\nx�\�X=\��\0�\�\��F�\�\�\\\�r�7\"\�?ٛ�KX�U<�U\�\�G<�/\0�yqys\�\��ƀ]���kN�\��3��\�\��gG��@\������p!`��\�\�p��\�0(<\�����~\���`\�sb��~Ov7\�|�@\�g�J3l$=\��I6��eK�\rx\�~�x޻\r���W�\�.���r�\�\�*o�6)ˍV�BOJ\n(��Č�\Z\�R/k��е�zV#��\�\�$�QG�.�m�P��\Z}�V`.����G��$W��1E3p=1;�\��\�3\�\�\�Ƴ1ׇL���~�����qE�[\�\�\�	:���)6\�\��jkŪ(Û�B��\�:\�ϴ��L\�\�\0�ꌋ6��\��B~\���\�jc\�\Z�\�K\�zɁ��L��w�\�S\�\�w�%B\�\0��\0���&\����!=i\�\0=\�>\�߶\����/�ڊ���\���o\0�M\�17\�X\��D\�\�\�Y�\�\"3��Y���>W\�\�<@\��\r�DUt�\�n��4@T\�C`���J\�V!ԁZ��q݆`�H�\�>\0\�\�&\�z��\Z��\�PLD3\�2:�\0�n@Hz��\�ƻ\�ެ@;��?\�ĳ��V\�:�}��\�\�\\m|�\���\���x\�)z\��+\��\�56Ҥ�W{�\Z�gk�0s+\�<;\�~q��\�\��\��8\�No۵�4)п;\\�\��zw\�^l�\�l֞\0\�\�Uu[���\�\�h/.�\��]\r^\�\�ItQP�nAȓ�y�7\'\�\�l@\�?�����\�3@\r�?�\�E\�\�z�\�\�Ϯ��w?�<�<J\n�\0+�,����\�]�s�\�\�\�<ٵw�aZ\Z�	\�\�cԾ?B\Zn\�S�\�	�esy\���u�6�[j�1\�\�96SSkah\�\"tx�B��}\�Xm%���!@?XUdCJ%�â\��Z��N\�y^s�5\�`ZJ�\�Peh�\�\�\�f\�u\�\�\\7\�\�`}�.\�F��@��i`]�\�&w�غ\�ʱף�Ct�x��v6\n\�\��#Q�\�\0`\�\�\����z��f\�#]�\�\�\�\��;\��\�\���xC\� �\�\�I�\"0պ+)i��\�&k1p��J�i�jf����OwmD\��ӡ�J\Z\�\�S�@j�La@�\�~w��UA�u�(}��|W�CkK����HkN�c\�q��;\�s0GZM\�}��}\�jb���غZˬ6��G���\\�oV\n\�cnZh֢�E\�]`N	8ʾst]\�_��,us��LT�Ⱦ7�M{x�\�<*\�7!\�k�cbT=�)@@B\rB�]�,�|w�MC\�\'\Z\�m���=\�s\�\�.r��\�u\Z\�~�WA�Ht�{�\�\�Bk�-\��5�vư�PEެ�\�+C\�\�\n�Ꙡc\�!���\�\�\�]n�\�	x}��~\�\�~w�c\��\�\�\�\��\���u�.؃%�v�t߮���]~���]p��{�\r�\�\��ڤ��\�g+���=:x���\�3x�i\�~-T+�\0P�LA��,��h��o��\�N�\�\���\�?�}�\�=��\�ڃ\��<\�\�\�\�\��|�I�����\�\�\�g�Ӌޝ�\�3���t\�B\�cL\�=۵W�\��\'X=,\�+�\�;\0�\���ME<=�~sk\�fl�s*ڃ�\�Q6Y��l���N���\�V��Z�5be~\0\���\�`�\Z>�\�D�E��Zg�]\�\0^��/\�X`\�\�ylV��r:N�\��\��M�z[\Z���xvim�8�b@j����,�7*\�pc�a	\�\��e��WLSb���e���$�\�\�AE\�\�:\�hD�~�/U�\r�\�,la~�\��~�\�\r\�j��4�\�|s�W;��\�՘�\�\��\n0��\�x	^Y�\�d�P�^@ߧ�H��֗�h�i�/3��W\�tZ�@A�u\��Z|\�Q�\�xh=x��\�x�\�ה�g��>𪍏�gu\�[ͽ;Vu��5�>��\�6^\�\�\�l+y���\����}�7\�{ӆ0@sHudڙ\�35\�pD�\�t\��U\�\�\�l?�\�\�\��\'j�+���3�w�O����(�������\0>�\�u4\�)(�:<�\�(Z�S�\�\���\\Ld	���_\�D�wh���)��$�bJ\�q\��z����\�n\�\�+ev\��Zk\�H�\��¤]�\�أݐ]N\�\���z�|�?ٶO\�h��`\�1ON��\�]�U�\Z���\�jH$\�\�^ݻ`�3\0��SM�]���%Zɵ\�ґ\�H][]\�U#��fC�y��\�s����\�6�\�Ŏ^_#�7�\��x�m��\�߂\��\�X�\\���=F�j�\��O�?���>>���\�s�=\������\�o_�������|oN�6G��{�PR\�\�֊m/\�\�\�\�$Zj�\�+�m�D\�%XV5\�t\��z\�N��r�\�W��ΰc����W�\�ʡ��n]�N�#l�An�H\�R��\�\�\�.UN\�B\�\"\0\�`\�9���~Ώ�\��$v����l��n\�<QA\�k��\�QnS�\�J�N�\�]c���\�^j�\�>V����8O\�P��)���\���UUo|�q��A�\�\�\�6�\�H�&k���\����\Z*^�jm�\�֕\�sҬK\r+�y\�H\����%��\0`ǣ�\�%�p�l���3\'\���\�I���\�kN��FU\�\�\0��\0�M�X{\�eV^�\�=6\�YcU���k���\nn���\�?#ݝ����w�\��]OG\�x%�	�^��\�i���#f��k�F\0\0��IDAT�О����ޒ�`\�ki�>�W\'$\0\�+h�2+Wu$cZk\�;ϴ@\�\�S�}	\�^I6\�?���\�0\�\�[yy$�X\�\�\n�\�J\�\�s.�OM2\�ruAR,F\�|ʺT\�\�#����y\0�h\��\�GP�SIY�0��G(����p��c\�\\�k���<���Gۀ~\r\�/z\�ޣ��ǽ�4\�R=:\�V\�\"I�hf�\�\�I���%��ba\Z�1g\���\�\�\�i|�*�.�\�0\0�I\r�<\n��\����x�n\�?Z\�\�a\0�\�v��s���S��_�\�Y�?-�\�[�h�\�k���o�l:�{u~\0�\��\�\�߳7:\�􏕤\��tǒп	Ô�\�gh\�\�\0���HFK�w\�\�\�R��\�t�\���,\�D\����>��k����k��`7{��`�\no-\�Z�3\�\�\�*�R�\�녪\�\��D\�\�k�e@�\0\�Cȅ	�\�\�o����Z��D�`l�Eųm\�o�\�Ѽ�h�,��\��D\�\��\05-���\�]T`#\�>-\�5��</ɲ��\\������\"g����\�\�[�b\�ũ\�\\�n�\�y\�ڡ��ꆛ�\�N\�\�\'\'\�`Z��g$!�\';�\r�\�D[?��;+ѕ\�v�\�\�h\�yi\����\�\�i�\��Q7���\��7�\��u�����>�\'\������\��\��\���/�w\��\���\�o�����\�z\�=�b5K0Ѱj-`�*�\�C�^\'M�J׉{�j�l\�53��\�\�:�������<�S���үT\�:\�%,\�_\�d�RnCM��z\ru[Rv\�R�o+��\�\�JmN��\�:����\�X���#\�����\�iHj)V�`\�34��\�m���\�\\�Ϲt�g\�\�\�`��\0�\�ǩ���Gz�/p�P{9\��ُ\�+v\�\�{�\��=����?(.�%l��\��hy@q�A~����!\�+02˅����\�؏�\�\�\�\"4C\�����<�\�\�\�~�\��\�,�\�{yv�z�c<E��\��w�\��[/�\���\�\�2?\��+�\�\�\�\�\�\\\�^%��������3lJ>Z�\��Ȉ\r���j�L���\�߃׸jāN\�\Z\�\�\�\��\04\�u�Z%�xX���V yG�\0�^\�^�\r@�\���UKcѶ�f��\�/0�Q�(�\�\�?�P�\�¢�\�l\�\�Q{\�`u����m�$Ϻ�\�̟��\�\���Y�\r��8Ȍ�a(�Hq��\��i\���S�̏&W˫~\��`v�\r\�gZ��`\\��y>\"P��Q\�u�\�\�\�i\�S�w.��㥛���\r\�މGo�r7iltR\"\�M���tz�u�\��}ω�\�\�}�x�\�kMSin��<���xh=��Ua�Qw����\�7�6\�U\�ܲr���\�3+��7V������\����Y\�\��lUQ�}�K\n�v9`\�r��t\�$o�\�8�O�\�\�S\�\�0\�\��Z�*�չ��f�3�7\�l\����\�J:�]S�*\�ڲ\0�^\�1\��:�\�\�5~���І�\��-�y\�l#R��M\�c���\�\��Zx�\�\�T�h�U\��1\"Kj{�,\�VB\�F�V�3�-�\�\��貽;\�ɘ\�\�\�S\���짧\�\0\�y���\�\n�?߱_��\�~BO �`����Nq\���\�������}\�\�W�Xh|_\���۫\��~\�/\�\�$\�/x폗\��3y�-�����\\OΒ\�\���\�\��\�}�����\��^����\�S�\�\n\������K\������Bg��6�\�#�\�馽\�¼�J9V��F\�9F\�\�s8���\�rS\'�\\�����R\�xq��QM\�\�P���\��VW�Z�om��Ѧ�\Z?4\�Pk3�޻L,�c��6[���֙��\��:�CX�i����\r�g1\n�\�\�R�]y���B�^`�\�DC�\�\�k����\�[\����\']��Ļ\�� \�\�\�\�ٚ�\�_y֏G�\'\�\�\��o\�GK��b�>}\�\�X�\0Ԯ��\��Xw�S+\�. �o͙xd@ܘ�`M<O	1��q\��\��\���|k\�k�\��rk����\�H\�/� ��al0W��������yo5jam\�\��\�]\r��>}\�J����_[\�W���\��ފ>�\����\0�\�-��\�[��_Zu\�}k\�\0�UV��4*M^|��B�\�Y���\��	�=\�\ZskϿ�\�\� SujVy���9j��\��j_��\�<OlpByʡP�c�M��{Wm3h�	�\�PE)�*/#�ζP�V\�ic:�\�&z\�l�o\�\�z\�,4�Ĝ��\������6;\0\�ĐZm\r#\���AʈF���#�\�K����d\�E\�\� �\�\�D߃���\�\�\�\�O\�#����U�	��\�w\��/o�\�__\��X�g��.\�\�<��\nq�$�6u\�̵�](���3i{\�\�l\�\\@7\�wQ\�%�ʌ��\��t	\�y3?\0|\�՟��\n&�^\�\�\�x�׀�����^�ǧ\0�j}\�k�t�\�ܿh�u\��s\�\�|4�OOx�%F\�*y\�K\�y}�m�OXǀ\�\�-` �3|uPQs�9�~�\�RY��j�q4��c,�\�8�Ѓ\��ʰ\n�\�A�&�b��\0:\Z{\�ich7^�c>�_NC딂�\����j�5\Zت�H�8Wŕ\���*G�\"N\�z}\�F�Rl=\�	���ς�Xcl��퀶oޚ\\`mi>\�*(uE3��\�\�͵�LM�ɰ�t�yj�u%����vWr�u&\�X[B$���}�5F|\�VT�!\���6���ǲ��\�1�V=oLN���2kKϳ���H�\�\�[/L�+/�ѩ\�\�Ta4�0XU\0z�UE\�\��zu\�m�\��T�\�ܴ��_Y\��\�[�\��h��\�cY_��e\���?��\�}�%{C�\�b+��\�\�r�o��g\0?�ߟ\�qܸ;�\��0(��\r�W�Fz��\�=��W\�55Q�<��ʥ\��e7vj\0�\rZ�^#���V	N0�Viz�\�ƽWM}k�\�\�\�g�Fl�w\�\�\�meb\�6�x�[\�\�!\\\��L�\�h����#\�i\���k��jo��i\�q��Ŀ�~l~�̞,/\�fw�\�\�8F��\�v\�\�L����%Zt�%�\0z�\�\�c@0m\�z\�\��U��\�\�\�\�+0\�E��@�Z?;��\���{Khv(<Z\�\��϶\��\�x�W���͡��\�\�~~wj?��\�\�\�\�.\�\�W�hr-O�K���\�[~}�?�__c\�^]\0|�wz�\�K��^\��x���\�|�ߟ\�&�.oO��Pkhz\���\�\�\�L�Oe�X�)Y\r��\�ObF�m=��{X\0�~���\�\�:\�vT�]]]薛h\�\�\�i�+/|ƕVB\�\� �5^\0\�Ϸx3�:UxQcSm\�6�f�\�8�\�2dC>���dZ�F�gYEl�U\�\�Y\�\�\"(w�u�ϻ|�\�U\�e�%=\�^\�b]U\���\Z����\�jk(��\��U�X}j��%\�S�36\�:��-%\�\Z\0\��\�V~\�K+�\�V��\�����\��6\�3����ǯ���7<\�;+��\�VE\�M�O�p%�\0�%1\�Z�}Z$\Z>\ZCgM���$@���M���N�\��QV~�U\�ի\�\0{<�h�\Z�L]�u���\�\n\��޲o�βn}f׿��/g��G\��\�\�-\�ϭ�Вo\�\�嶦{�\�^\�x�[Ӟv�\�\�s\���Y;x�-\r��k7�\r֪\�]��\�u���P��\0/\�=\�ڌC�u\�ꗮ\��p��\r_e�\Z\'�\n\�*\�j`�ay�c����6\�Z^����6[\�\�p�(Wz:,\�\�5>]FǫI\�*��ᡫ�N�K�� [T1�3Q��\�U/���\��]\�\\�}�\���\�9\�k�Zce\�\�\�tᡬ[6���]�\���\�(\�\�<�\�W�\0��=�><\��@�\�s\0.O�\\��ПΏ�I�\�@�\��\"�\�\�m���\�Ļ���\�~y�\�~X\�p@����\n�^�ϯ�\�Ԣ.���<?@��\�\�g��h�K>�@�\�q�߁�\�:п>ZE�\�Ny\�X�1\�Q\�\�	�\�Rj\�����V@�ԗ�ͤ�n�\��k�\�|V\�W*����\�F\�bRs\���\��\0_t)P\�Ul�D\��4b�/\�$\���\��^a�E\�1.\�g��\�F*�]z�f��\�s�.%ߚ2K�=�\�z\�jl��\�F\Z\��߆Y��Nnn���\�v�\�pK��\�0\r\�髶��*\�)\�o\nl ;\�\��\�\�k\�I�\�\�h7@��\�\r�]\�\0ܻk\ZY���\������}\�+�\�9\�\�w0H�=�:�GV;߫�esZ�5\0�\��D�N{hU�\0)Ry?\�*n\�\�[ߴj\0_\�c+����\�J#g��~c\��\��`\��\�\�>�\'K�\�\�[\��\�W_`\�Zk6�\�:�jz+�m�מ\�f�:\�_y|��K�\�\�\�\n\�n�p��@�a[��}P\�,�\�jˮ�,��}xc5���\�å%6*j��:�pO\�\�攚�\�f~�k��\�\�£w阶�\�1(\���V\�@\r/��.�@���ucx�\��A\�\�\��ƌ�\�\�V��˶�M�\�����O\�_���kD6\�޷�\�?�澵��v\�ϯO\0\�U�LT��\���^���\��\�#u�Y�1u\�9\�\�\�]̿�^m�v��V\��)�J�?û_\�\�/�,\�\���퍗G��\"o��\�{�\�.J/�.\�\���\�ߗv����\��迓\0�\�s@����\�\�1��\�+\��z��\\I:;\��\r{y�\���ȒI�z\�\��͠���\�a4�OG$n��P��ʯ1A\n���T4\�\\��*�\�أ*Ω�\�7�\nc�\�W\�ɘ��\��*�pC30\�7�����#��:�E��\�X�7\�\�H]�x�!�\�p}������\�^Q\�\�:Y�R�\0W�n-�I\�*\�C��\�Pޅ� ��\�y�Y<\�8\�f��	[\��ptכ��Ղ�\�ʴ�d+IJ���b�ϊ\�b�(\�+��[˻�wV|\�`��[_���H4y�=ש�))ҝ���\�ab�1\�ե\�Z]^�\�ZUJ\nF$���k\�x���V�w��\�\�G݀�������k_�����o,\�O\��?a\0~�\�,\�cٟ�\��m5q��#z\�P\�t��ܐ#K���Hν�ۛe	�ʽ\�\���\�Ch�:^~\�kB��\�v\0�z:�5l�`Il#�	\�V`�ˣ�f\rbza֩�Z\�T9F\Z����.�\�\�̒T2T���Z0��Σ�]��\r�	뫐\0^�����~\0�\�\�x\ZG���\��=ۜ�;n/�:^A®;\��\�\���\���3ݙ���\�6\�V��\��;\�Ή���V����N\04[`r�:s��O�\�\�gn�\�\'\�+AG\� XO\�&.�.\�)�W��\'\�!��\�2y\�0\"߳>@?U�\��������+F\�\'�\�c����<�x=z^��3R����g�����G��\�\�\�=~}�bϷ\�1�\�\\g�,3!.f�\�1�����k@������\�M3�>�^�[5,T`F`�i��\���]��\���(�WE\'c�=\������/�J׬Uw�1�UEPBo\�a�ל@�54\�HC-޻\�F����+��\n��M��\0j~�ׁG�e+�\�B�@q�^;|�m��*Mm�6\���6te�\��6�-�l�M6\�f�WWX{I�\�\�\�Yun�U\�VXyV��\��\�\�w�\�O�{�7Vt��V�-��\�V}\�U�jtyM\�]�x\�\�«<�)9\�\Z�\��i\0?\'\��IIV����\�o]{\�j\0��o�\�\�oy���������\�?[\�o�\�2����{\0�Oe\��/��G�\�7_�\�_gF�;z\\\��l\�\�i@��%uv\�\\�Q��\�jʑf8xm܇ػ�80ɀ~���\�u�\Z��	\�S\��-%��\Z۬5~\����\�*`Ԩ1�&\�\�בr�Wqo��ǀ^��op�W\�^�\�\���D�0\�(k�C���:���-.\�z\r����\�\��\��.�i�]�\r\��jg\�^,\�\�\���b\ri���\�\�\��N\�x-\�=��`W\�=�Q�͇f\�\���\���Z?<\�s9�J\��1�W�ʹ+�9\�Q#�O\�%\�r[2��\�\�\"�~e\�e�Td:��r\��\�\�\���\�#\�\0��+:��31��Fy�P���\�\0�`?�\���\����\��-\�\�\0�c\0*\�9\�� U\�lC\�~\�ޟ,\�@\�B�S\\�){\�g�\�\��cA\�\�q�\�\�ef�\0��\�\�:Ѭ��*\�Ƹ	\�Xj���w7U$��\0��SF�Ȫ��\�j\"1\�z�=`�ZS^t\�\�\�T��//tg�Sj\�\�\�\��f�촑�m��)E���-�x\�ls��\��\�ڢ�\Zx��\�g\��\���:lo�\���c�.GWL@\�3k�\�\��$��EԘQ}\���ˊ��֞E\�H�\��\�a%wnZ\����\�\�u+��U\�R;\��Vs\�\�r}�D\�k\��>�\'Da\�YC\�a4\�\�[Ul��GEXiD��\�G[YD\�!�\�*\��\�|7�\���\�,��o���\���Z�\��ʲ�_-���=���?����\�r~�\�Vu\�[k�Y�Om��i\�yw�\�G�\�\�˘so�&�Q?�\Z\�r(�\���z\�\�W6\�U�^�#T�\'���\�j��\�_���i�\"\�y�\r\�ֈ�\�^ul��\�=tEYke�9�|��(f�\�-�jo\�\�h��8��z\�Xk�pSm\�`ט3Nm���u���\��=�y�Fz�\�_d_+~���\��\�\�m��\�=��Á=>ڲ��U������\�\�\�%���/Ϗ\�\��x�\0���7\��t\�^(��>�w��!�Ζt�=\r���A@Xf�\"�ӑޓm4=�C�W\�\��O����)�\�J�q�^K^)�O�+\�\�\��;\�w�<���\'\�\�\�{\��$�!�؂�s���>�O�lo���r��=�\\V�i���\�$\�݋\�\�M�\�\�Ւ��=�\�5ݮ��\�B3�\\v�\�m����b�\�m\�=PVj�\0\ZЏ\�e*2\�Cߕ�\Ze\�\�4��ĆTu�N��V�O����&\���\�|W\�z��\�\0��_g\�x�P\�\�uO�d�l���\�\������~4\��*h�!P\Z�\n86�\�;��~�\0�~��\��Br(���\�Tח�F9V\�,R#��V\�\�}͈\�I�vu͑�\rX\�߷�\�\�Vz\��m�Uލ�:(����:r��\�K�\�\��ѓ��V���Cu\�*�\�[)�Wc˒{QV~\�U�*\�~\�\���~��-�g���\�\��I��	��\���_Y\�?�\'K�;�o�\��~�wVu�+k{xz\��Ot\\�\����\�c\���A�k�%��G�w?�\�q\�\�5\��#W���\��U`ZFCa�?l\�x�uh�Nztl�֋\�Wa�\"�ɸ\Z<��\\�R\�ـ^\�S]\r���ԀVQ�f~\�cl�EMjR7\�ʭ�����3�	�N:].�Zp?�q;\�\�����l\�>>Z�[H\�]��=��ў]\�\�\��ƾ��\���\�~O\�>>ޱ�O�\�#\�g�x]\��#%\�ً\�%{�\n\�\�\��\�{�\0��N�~n\n�O��\�?�_s5\�\�vg\�\�ъ�֒\n�\�\�\�\�t.�7��\�v�]@թ�.\�\�_\�\��\�\�\�d$�@\�\'\��;*]W�\�)2B%�j\�!/�\�<��u.\�\�=��\\��\\6�\Zf���\"�C6\��\�$�\�\�\�U7��-M�\�\�\�\�\�\�\n=�\����W<1\�\�s+mj\'��\0��\�Wb\�U����\�JJ,���ZP �ҫ}\�(/?!�z5ZP�\��[�]g�n{��ԧ=F����\�\�\�9yO\�IΌ\�\0\�3��lɲ\�\�\�\�\�\�\�̖L��#\"ou|�7ז�;F}Xc������s����n*y��\0ɟHu�HU�\�\��	8��tF$rR\�`\ZX�T�\�1��)\�%�\�\�\�HN�\r\���t\�\�=�b?Z�>\Z��k=\�\0��ޙ\Zj-���V\�C\�{��\��]�̛\��W-\�K}\�/X�<�\�\'\�So \�atI/f�M �a]c����,�~�u|�ճn\�=����|� �*`e\�\�\�}m\�\'m��\�\�b�����/�%��\�o,��\�ٽo��_�\�\��\�b����_:FP�\��/\�*@\�Pl3\�e\0�\�Fs�\�\�e\�Z��o\�\�\�\��3\�\n%<��\�\��x{��S�Ֆ,vz\�L\�\�@\�V[�\��Y\�\�CeڈS:�R��]\�\�^P	v�˭�l\�uq\�ԎZ\�P\�Q�K=�\�z��QZ���\�\�ٵ�|��.\��C]�\� >n\���~��5\���\�c0�x�\���\�\�\�\�y\n\�>c��\r\�]�\��\�\���*T\�\�-X�le؞\�����C��\��\Z�_�\���\�V\�\��~�/��\�x\�~+�Y��\�GZlg�\�-��� ��˞\��1�~#���W\�÷?F��4Ta��\�\��?��Q@x\�$�����>\�~\�u\�Q\��5y�4\�\rT\�\���\'�j��2a�\"6\�6^os�\�\�\�{l%�\�K�\�#�f��\�9��\�L \��ru�Q�Q\"\�`}��V\�ZWy�ug:�֐�{#���\�j��7\"\�\�:[SZk`yV4�������\�\����o\�\�?�W{%�\�r��\�\�,Ű�Wν�kÔ��[�~�LS�\�D8^R�eQj6\�ǉ\Z$j����{\�{ǺbB�+:\�\�\"#�)\"\�ꣃy_��1^ω���0k��m�Q7�2�^�\�!��\0��\�3^V\ZK�2�a�d\�;E��y\�r�oX��z\�]�\��@�g\\\�\����\0\�\�\�_9k1�\�Y��S�h3.�\�\�Z\�\�? \���~�_\�\�\��\�?۝��W�����\�cAG��\�,\�\�\�[\���\�^��\�?f�x���(\�̱�ZXRٔ�\�\n�[+<�rӷ\�\�-6\�\�ꀣ\�KS-\�� H�*U\�y\�s\��2��\�\�\Zծ\0\�\�\"o&./�${�V\�NZ4\�J\�\�4�\n��N��\��g�\�$9U0\0\�U�/�\����\0zm�d���\�0^U\��;��Km��\�\�+l�Џ�ڃ�^��p�\�U\�\n�o\�\�m\�\�\�\�{��fm\�^o��e\�ޢ\�\�o\�\�g���%I�Q�\��\�\�\�z\�\��t��A\�\"\�W\��y��\"������\�7��jg�\�\��\�ӕ)\�\�_�\��J@\���\�\�\�\�\�2r]\0�F\�O\"�g2vy�V�^��y+�\�\��)�N\�w�\n\��\�w\�\0z\��\�Y�EO!�ʅ��p�\�\�\�O��W�mL�w\0�4\���\�LUWM\��\Z\",����UZ�\�\�Y\��0\�\�//\�\�ɐ\�*�l\�\�[,��T\�0y#�oH�G\�\�[��S�8\�U�ֆ�d�\�\�\�\�ԱIȍѕ�\�tOA������\\\��\\\�+,\�N\n4�F&\�\'��\0r\\0\�\"\�j�\�Zmd�Յ�[}\�\rk�bM�|�9(�\�\��[�\nd�}�<\�ת\���>��\�߲\�\�\�Vx��\�\\\�+_�<��s\�\n��{\�\�U\�s��/v���xwo/�s��p���z\���\0�\"���\�Q^\�\�G_8k�N\"\���_Yʙ?X\��_[\�\���\���\��濛\�\�~e~�o\�\�c�w�����hw�\�\�}�[��o��\�8j9\�u�m/*pM?\�P\�R\�X\�vM:C����\�\�٨�\�:\�\�Y3�-H�V�7��\�\�\�\0�K\�E\�햺A\�g�\�k��\�6�Ur\�﨨m\�r\rQQ5\�\r)\\\'��T[�\�곓l��=\0I�*��(�g�����eZ�ƲW\�x�fz@?\�g	JK]��>\�&:]��\�ܐ=��\�M����$�q\�:\���\�\�2\�\��Wk\��zy\�>\�E�>�C\",�\���\'I��ZZ)O]��\'~���\�k#O�x�\�H�Y5\"@\n��\�z=L\�\0�\Z�@��ti\�^��Ŗ\0\n`|�\'i�\�\�\"_�\�{�\�\n�	\�K���w��=A\�;K��߹ �\"�\0�\0�K\0��H�\�\���&\�\�ܸ=Q\�?������\�8j;j�=�ڂn\��E\�6x?eq�y\�d-�����\����mQ�c\�}��\�\�\�R\Zi�\�\�B�t6�\��wW\�GX�!1\�zn\�Fdt#��\�7&y6�\ZR\�.HP�=h-�j=u\�U�6\�<I\Z\�\0H�~\�|_Gv�\�f[ʀ\�@�ק�\�I\�5�}���6T����{��\�z���k\'��]u���ߺf��W�\���zYI�5+�u��]��[�-\���\������\�,�sER��kR\�\��ڠ\�ę4_d�\��\Z gyy��XʵK�\0\�<+E��%H�-`\�_�\�ϟ��s\'\0�Q�?�\'�9����\0^���ߚ��ߘ\�W�j�?��\��\�7�\�~gw~��\���\�\�\���Ղ��\�\�.�L�VA@m+(�\�*m�iDZ���4\��9C�\�ړ��o\����T�$t1�%\0_lZ���\�~Sŝl��c��\�&�4s���K�/y���\�X\�=3ৢ�R�\�\nΞL\�ޜD\���\�i֏\�f�\Z�h(E/^\��<\�\��Y\�X��V�^�/�x�l��\�6\��\�\�\�\�/\�\��7�O���\�3\�|w�͞,�bه\�������3�yW\���kv��\�iG�H��\�(@����\�\Z��\�2x`���\�\�\�4\��\r�~�\�v�\�	$D!٭��\��\�\�\� \�\�\�t�\�\"Av�D;X����$kƱ�{\�{���\�]ϟ\�s�\�\�kOB�\�\�Hp]]rT�;\��!O\��\�\�\�\�o�$󉌻:�\�m\"\�׆�[�t$Í2\�\0�5��\�3n����<߯\��\�D(��\�bw�2X�f=��AO�\�#��6\�\���6!@��{!ʚa��d�\�\�\�	\0Z\�\�W `5�V��2�z��n �E�֪\�\����lu\���T�w]j$\�\"oi\�(�zmFGYMd�U�YA��e�{[`ιy\��`\��[*i�a%�c\�\�k<\�\�\n\0�\�u+̹7/Z֍sx��n2l�Փ�~\� >cI7t\�\�\�i�\��Xƭ+�}��u\�Rz\nr>\��EK�\�a�4�z\�\�S��\���\�	>	�f�2�\0|�\�,�\�o,��\�\�\����K���\0�\0����\��\�\�����\��\�\��}\r\���|\�_�\nG,+\�;ʔ\n� HO+�#ӕ`���1\�\�\�w�\�\0��n��1	�\'�=#Õ��\�\r�\��Y@\�iH��:S��I�gk-\�˗\�h]�cc1�z\"*��]y��x)\�$�OCfbղ��\�\Zb�5\��)9�G�ֱ��7T��+\�\�N�u\���Aju��\������B���v۝�\�{\�\�R\�\�`���!\��Hxp��r\"_Bq���AWa�\n\��\��̐kt! \�\"h\�~y\�v���\�\�Z����Q[�\Z���>[\�\��>φ���2yu��l�I����	:�Wz����\'�qo\�|m\�I\�^1�\�	{�=d���\�\�aR?��\��u\0���d! \�\�owT�?�+[BpQ<$̓�AV?��@��Yd)O��\�\�o\��}�#�kF\�R�\�Tc�˼Ssš�<iʷ�\�B�\��A�-��\�<�T7W�\�\���.S�\�-:�\�5�}%^�26\����\�+�&\�㕩\��Z\�\�G_����\�$\0��\�\���z/\�\�8ݴ\�b	r\"]ϵ�\�\�%:���(\'\�y\�\�hk\�Q!j�66\�j�b�<,²�\�Z��\�\0t\n\�L�\�So|�8H#��\���,\�k6]�\ZRz]�%\�\\ůΤ+�Y\�Y�\�	K���	\n)<+\�gݾ\�ϟ��[\�,庒tx�p\�\�\�8\�8\��G-�\��t�\��0�s\���Y\�\�\�-���\�?[\�\��O��˯\�\�G\�\���\�_�\�\�\�\�ڱ�\�7v\�����[\��\�|Y\������%^=b9�\�n\�l	�\�[k+�\ZVY㤺�\�;��\�\�c-�\�R\��D \���\�\�`%b9\�C\03-�\�(\�n>\�\�u|@?\�}1T8k�\�Y\�Q�l� h%�\�\�[ݱA [%�\ZۧYw�F�kE���mҪ\�\n\�֛�mjV�F*nBM��\�\�G*4n��@T�ʮ�\�ۙ\��഍{�Þ.����ָ��?۫Q\rX\�\�������!|�pz\��\�\�GHu\�t�%֦\�!2��\�/<\���\r��\�5�b\�V\��_\�\\�\�\�\\cu��\�\�Zd=Z�m���=\�6\�\�>B�k���\�:Z\�Q�$9^䅚gl\"U6�,�|��:\��s����A�\�I{ND�\\y�\rHX��j�\�����W�[��m�(�Ё�\0\�\�gi��>vfK�\�s\r?�t4��	\\tZC#\�\Za��ގ\�k/g��a�vb͍\'�W\�:\�ݡ���X\0ˇYUl�U\�󨆑����v(J\0V֦~^�>\�\�mH��oT��Jv�f\�u��}n��k\�\0\�\�D�>�-\'\�Z��\Z�j.���GCJ�ա\Zj\�42ʊ\"\�,/4��\�\0�`Y�,/\�\�k:��\�ݻi�jY�$\Z���\r�\�\�R!\�y\0�\����^Sfԕ_�\�OW杺\��]b�E����]2K�v	�?\�R\�\�?Z�\�#�xY\�~=Ɲ�Ң�\�a��ł����_~e>������v\�\�ڝ/m���\����t���z�ok������-��\��������\�\Z!�\�\�\�<\�U�xJÝq��ը\0\0\�\�o-w@��[\�hv>^\r4\�_m���ن�\�s[\�g\�\�\�bP��H�.���aڸ�\\\�VlZk\ZL��|�D�磢\�\���b	JK����1}{A�\�ۉ}\�\�Ow;�Cej��\�z\"\�\�n��Ȧjm������mc�ӯ�\�\��^\��>{�\�9�\r	�ޚ�7Z\�`G��#\�f5\�7`��\�1���\�\�\��{+�jsgmos\�ànm.ؓ���t��ZVGپv\�<{�V\�����O�	b����\�GK����kC\�u�%(\�-R��[\�w�Nd\�\�:��Uy�*\�\\\�Jm�է3�%\�<���\��]ڋx\�{v~\�\�ϫ\�\��|�\�\�{/�\����.�\�6vf����\�~��\�a�9\�4��45f�/hL1k��*<5RP�\�	��p�&��fm�\073\�j�:��\�\�H\�*�xG\�\�\0�\�\�{�?pG���� (D�㼆d\�^\�`\�\�8n ��\��{z7R�K�\�H�i\�\��F\�\����֔�\�\�WK/^+#\�\�\n�	�\n\�Bh\\U	�@\�\nC�\�\��\�\�\�ܹ�<�F�{[\�5\�\�\�_�\n\��\��\���7N[\�\�K��/\�_{|\�s���\�\�.�6��\���Y\��#\�c/*O�?��%_�֒/}mѧ�dA�e�\��{�\��\��jw���\�\��[�g��v��\���\�7�-~���\��\���8\���\\\nQk�߮R����L_D��=�\�E4�n^�wR9��E��JW�m�w�V�\�� �V[$\�\�\�#Og�SMb]��k�Rl\�H�\�l\�\�C�tZS��\�kMO�&�_�\�o\�)�<�QaÕJ�\�?��\�T��\�ʲ�$ې\�Rw\�B�,����&�\�6\�\"Jf�߃�ǒ\�\��(Je!���v�C��P\�R\�o�̯\���>�^�uO\n\0/�Ŏ��Щ���P\���\���\���I��![\Z\�q\�#��;\�\�v\�-����\�[b�\0�w,�/\�\�\0xG\�-U\'fV^�o��U��c75\�t5��J�]\0\��\�S��xe@�z\�\�z�\�\�i����lLٓ5l\n2�\�\�(,O`a=��\�5oЁ~��\�{_\��v��H����5�\�gV��!t��6�\�Hc��\�#\�\0\Z0�\�CMDz7\�)-\�\�R\�\0r$O������@+\n�m�w\�P�Mj�Օ�\�ZY�\�TQ��M��5#FG\�k2.@n\�Dd&[�V2Gg^��ǰ�Zg�\��ݘcU\�aڕ(�� ��L�܀\�X�NԜ�h+���ԄX�~\�\�\��r_\�\��*__����\��\n\\�7�\\\���WYW�\�\�{���t�}�\��G��\�e�T/T�*�\���s\0�\�a�?��ŝ�\�b��Ţ��\�B�\�w���۝��\�\0��f��/�\�����\�f�x��~��G\�\�\���o�h!?|aɗOY!��)!\�\n�e)��\0�ն\�\\�=\�\�ꞣp�\�Nz����)[���\�\�;�l���Ͱ}#2\�X\�B�5øME.^�x\Z��N=}ʝ\�U\�<�_u\\G\'��`1}G!��0���B\�/�\Z�ba���\\\�Ӓ\\��J3\\E_AB\�\�\'k��m�:\�\�\��;6GQ\�x�\'\��\�  Ƴ�\�K�.пX\�\����}\�6*`s�\�0b�=�O\�\��\�Ø���\�65�xП\���c	��\0\�}��6�\�{mi�(9\�)�S�iI{�վy(\�k\�zy|��\�?��z�����\�z�sy�\�\�9.�W��\�|ͱ��\�P$���W�OKg�O	 \����(�y@?7\�*���<��V��\'\\�\��?�/6u)��-q�\�l\�eh��G>\�׆\0�`S�\r6�!�<s\�\�2��\n�\�\�\�,uD�\��t\' �K\�,��\r\���$��\�xs\0��c�65\�j�\r��\0�M\r9�3\�Q�z\�u\�\�\Z�\�Y�\�n�Nأ\��<� /\�\�\���,.V�X/\�za�F֬�.^�9#\�͘���H\n��\�@\�	�\0?\�\�ʽ\�o\��y�7��\0�[2+\�\�߼\�\�\�=\�5:�K�v\�b�|i�W��\Z&P����zd~\�\��{p\�GK<�\����\�O�5L�\��\��\�|ax\0\�\r\��}�/v\�s��\�~mw��W�C\�\��~(m\�\�\����G\����\r6\�\�Y+�u\�\Zc#l�`8Q��\Z@\�z\�d@��3w$���,\�tJ�צ\�~/?Ҡ`�^=�<O���Oroh\��4�z��\0�\�=\�֫%y��k3ϥ/�e\�\�nCV	O�1|/\�\��\�\Z]\r�s��/\'\�=\�\�o��Y�b(�\�\�w�n,cOY?\�&\�`�T+K�)�\��E}+��\�\��R�\�\�\�ӆV�\�\"2\�\�zOnk�\\��E\0p�-P��=�\�+gyԁ^\0\�9�K��rK\r6\n[���rw՞\�,�Ed���CwQc��\�\Z��Ux�\�\nʐ{�;��Ǜ?���X\�\�\0X-}�쯷T \�|^W\�\�]\��!\�\������j���\��b]������Z�?\�*�\��{��\nD\r4vf�x��~�\�V;�	�q\Z�ԨI0e�PE\��Q��\�9���+\�\�f\r���<w����S\�\�n�\�u.��\�ؒ\�M�1nw]�\�A62�\����0�m͙Z�>�]\�%\r�jb\�M�TlWZ�R4�T\��\�\�\�\�f\��<v�y�\�oy��\0?\"\��\04Y�\�xn.\�S\��I�\�\Z\�x_�؏\�+�	�b�\Z^�\�ʻ{\�5�ȹ{\�2�[Z����RN̮u�\Z���w,�\�\�y�\',�\"\�~�\�\�G�p\�\����,��_,\n�E��\�-���lw~�O\�������\��n޿�?\�\�\��\����_\�\��m\��,\����9�=v�\�\�(�\�Y��\�_Y\����s�5\0��\�\\��)ŦUqMklZ3\Z��\�\�S�,x�;��\�\�׺\�:��VO�~������Zw��\�@\���\�e\�\�xc��#�G���߹n\�\�U\�i���Iuڰ\�ܙ\�z�\��|\�\�\�\\\�\�l��+�\�r\��*�\�\�\�+#�OCP���X�\�\�|\�\'\�1�xe�\��>�\�jls�\�vg�\��J?yО.a_�\�\�l˿\�Vv�6ȧ\\>�<�\�Mmz��\�K\�d�6\�<�h4�\�\r`|��f\�\\�놩�\�5�|�j/�\��\�%{z\���\�n��빭����K\�Qq\r�:Z\�\���_��9\�\�`Yb�\�\�\�k�����g�\�\�\�sn�ȱ.��\0�z�{.J\�%A\��J{�\�|�\�G���xz�\�\�D��\rw��GWS\�\�I\��\�P\��_䢼fč\�W\�87�7�\Z4+�N����\�\n|])L�g-\��F\0ߔ��J��\�\�\05�\�\�ĩ��]������&!\�\r�\nQ0q���Z��\�C�\�\0�j�\�VJ \�\��\��j\�DԈ�RI\�L��\�@��\�\�OD�Lv7�Zw�`��t@��	�\Z,IU�� �Di��4*\�׵�.\n��\�,#\�e]Cܰ\�{>��H�	��+1/\�#\�\�/_A��X©\�0�9\�	\09��\��\�b�\�B��\�\�o�W�\���\�\�\���\����������\�|~���w��\�2����� |`|�o~g���d�\�}n\�?|i��=\�ǿZ�?�}�\�k}�\r�\�r\�Pi0�ҧ\�mF��s�¤d���\�\��eWQ��M0{�K�Q\�Bo�\�u+۔`@�м:\�#�&�\"�Gk���96�$\Z��}\�,�^I8\�\�\�\�%��[]`\����`r%Z��f��\�Z��䫝V��q���C���N��\�\rŰ=ւ�q���\�Qk\�\�\��]�SX]G\�\�Q꯰\�o���\0�f��ܗ�S�V{x�W�cxz\�\�!�}I�5<�>���ʷ��}\�-U��UW]�\�\���;\0�\��j�\�\�z\Zs\0�^K\�5\�SB�Gҿ\�9�\n0\�\�P���\�\�\�Zg�\��{<�K��\�z-����	eMT�/��t9�\�50�5���:�x��ߙ\�\�	M\�\�	D+�/\�TgSu\�\�H|\�|��^\�s\�\�\�+l\\\�ͥ� g�J\�``{u6\�Y�v\��&d���7\�&\r��|�5\r|(\r�keV}�@H@q��)%��<(�U�-\Zy�^k�)\��\�=L\�[�\n\0�\�\�˞bO���x\����f\�\�����:+n\�fT9o#���Ք\ZA���ڔp���\n\�OI�\Z^�X��M+\�l�\0�~���\�;o����^�\�w\�2oy\�\��-�f�\�R}�X2�K�\�\�c	��\��w��\�]�ΒNa	GK\�տ�Ϳ�5>�\�v\������?�_�_��\nj�\�ڰS�\�\�7�\�?Xķ�\�￰\�ð�����GU�\\/kJ�t�N�\�\���\��nޟ�����\\xT[�ȵWO��6�\�V��\nr\Z]���⍡�Զ�_M0���T\�\�hU�\rW\�\�\0�,%ա\�X\���U=Y��jٴL\�<}��+\�<^�u欚���\�H%Ya\"AD��y�\Z7�\�\����\�\�\"7xc�Џ�����ڇ��\�\�u�\r�%\��\���ng�W\�\�e�Pe��ch�\\��\�?yn\�\�.v��B\�\�\�\�U1�D����Ou\�j����/Ƈ���ʏ�\�\��g0\�0�ܔT��\�Yz�X|\�T\'�tm���5\�\"�\�\�\�\�_��\�ڴ\�r<¿?�\�Qݿ��!�~wZl�ɵ\�k�v�\r?\�\�\r�l-�\�S�\�\�\�a��ZO坚\"\�G\�xxBU?�����ɥ�\0i.iߘ\"y��9�\�Ϊ�\r�\� m\�݅U�B\�a\"M#�5�]\�z\r�a֘�\0H�y=�\�#�\�|)\�	��(��\�\�v(\�\��\�|%�tg\�Zo��\�֗\r\����\0�&7b=��\�ْ�L���q��<\�߻m9\0Z]jso\\D6�Aʟ����{�\�;ȣ�vŲ]�-/\��#0ܺb\�^���\�\�\�\n<ki��,\���\�y��\�_[깿X\��?�\�?�ω\�\���\�v\�\�?�\�\�_\�����1�3_\�\�c�[��\��\�B~\�\��\�B��7�\Z��Fy����l�G~g\�\��\�Ү�b\�G+�e�:I^ĵ��k�_��.ێ �l�)�V]\�\�l	\�/�$�\\s�\'�\�!\����A�\�\�7\�_�ICY�tY\�F�\�A�?O�m\�\�X\�D+י�]\'\�K\�\�d�ӕV\�U;�M\�LC,tݺ�_\� K\�}\0;6T\n\�y}�\�\�a�\�^�\�>S��#������\�\�6O��G��ro�\�Qi��\�ԛR8�\����\0�-KR߁ލ�a\�-\�eF\�f\�[\�\�;\��y�]:,����\"\�j��V\�/PN\r�\���\n\�p�\0=A@�\�\�XZ�\�\�\�06c�ϧ��X\�#۝��O_�͇Q%�n=]=8�\�gԞK\��1�W�\�\��vB��5\�P\�\�\�5\�c�\�{���D��z[\��-4s \�u�L�)d\�tC=��Y-����Bn,@��\�i֯���\�Xڵ˳�x�\�\�\�iy�\�\�(ds8+\�M��Sk���QAV�E\0 8�^k*\�\�n>?\�\�R\�<�n��\r�X�=\�\����\�\�\�\�\��ݰz�;#\�\�yR\�\\\�h.\��7\�GY-��2:\�\�5>\�6\�\�k9\�\�\�嫖q���_>n\�\�OZ\�\�Ӗ��٫-\�<�y˺y\�\n\���\0\��\\�k�X?�\�iK�w\�b�NX\��c�x\��?�����\�n��\�|��\�Cv\�\�_\��\�\�؍�6\�K_�\�\�\�\�\�\�v�\�\�\�cȑ\�\�a�\��͂���\�;�{��\�-��,��O�v\�J���\�mD�c�};\�F\��\�s\��@���im\�q�Wx�}��\�\�9��z\�b�f�\�\n0\�@UV*\�4=���\�ʘ�\�\�5QV&�Kߖ!\�\�X�j+��-��\0_\'.��\�\�~��{�\Z\�w���\�\�eFQ\�U\0\�yzA��\�`\�\�\�\\q\��h�+}w{r�hE��`�B��#�\0�<�3}�ߪ�_\�ǟ\�\�[�\�t�JaXjm��u;��`|\�r�ͮ؇G��^\r.�K\�\0�\�\�\�e\��ϠWO�\�}�6�<���C\"\�3)��@\�\�#K\�-0+(x�/I/2\�{\�c�y��.p�����0�\�ܨ=\�Y����~��\�}��㍖\�#��\�\�)tt���Ym��IG5\�\�M\r\�\�ת��\�X�\rT\�s&az�4\��=\�<Ol14rYݪ�8d��\�j\�\�\0+,\�\�C���k5����k�\��\���B�1A�P{X\0�I�m�}�vЌ��<e\�C�0׺�]��\�{?\�ɍי�\�~Ԡ�)Ы\�/.ƍ���\�\�\�%\0���>V�l���^%�\�=y�ڐ�rђ\�\�\�Kn�.\�\�\0~ֲo��_\0\�Mp@\�\'^\�(\�+�\�M���\�bd\�c~��=b��?d�G�f~\�e���]�\�6\�\��l����\���\���/\�\�\���_��\�\�\���\\J\�oL]t���~�\�B����ek�Àލ�j\�ڵsݸ�.٦MSk\��\���F[\�n�\nkxI{|��\�\�kQ\�y\�Z#\�{\0}7�\�.\���H�\"ךLM,ճ�\�uUB\�Ƶ֑]C\n�\0\�6d3S�&\0<W��\n\0x`\��r\0�}�Jl�j,��ƈ�\�h\� ׵e��W����\0}C�ۋ�\�\��Ց~�/�\�9O\�!@\�s\�\�\�A{F\�\�L�/�\�@փ�Wv�3y]��\�8O�מ\�ԃ��/���	H=�_��@\�?\�\����=m��\�\�\�},\�\�N���\�\��sI�\�A{<\�;{Z\0\��\����-\���7��8ϐ��+D�%�Ò\�^�y��\�L?n��{.��b{zd=`\���Gs\�~\��\�\�x�o��.Ez.:p����\�JE\�8HEuC�l�\�W\�\�!\�\"p.����\�\0UŮ1b�kn�a\�҅\�딗H�\�=%��\�RC�����F\�(��\�b|�л,�?<\�\�F7\'��Z��$5\�P?>��f\�d�$Y�\�	\�k�6\�:\�y+њem)(!�v)�\Z��XGT�U�;\�Q���b��\�M\���a97nZ�\�K�xܒ\���g-A`׺t\�\�/�ç�ܧ-\�)�-�\�w�*�;w\�\�/\\�ī|\�\�����E�9i�G\�Z\���\�G-�ȷ���\���\�_\���\���\��\�����\�\�,>�\�\���\�\�\0��\�\��\��\���\�o-�\�IӰ�|�KX�0�ɱ1%\�h��k�b�9�>���\�S\�\�ֈ�o���P\�^�5\�a��\�Y;�� �X=�\�\�\����\�uE,δ��\�y7�\\CJ\�\�\�L5�f�\�mE\0]�:�˵\�\"T�\�}/\�\�&c4�Z��+2\0}�_{?\��Q��n��\�\�mM�\�͠=��s}��j:��bq�\�l��\�\�uN����M>�u\'�=^V��d1���ĘOK\�CkNE0�\�7I}��AY��p�#\�]S\�\'[6\0�\�\�9��\�ک�\�\�|s�\�\�)G�H�p�\�=\�-�Ǩ���\�=���\�\"\�g=\�|���z}]��ð9R�\�?`�I:�<o\�\�<P\��?��\�q\�A�&�l\r\�/���?\�5�XZ�@?Ռ�R2��.��-\�\"\r!�F��	b�B����$\�m\0�;�\�<�_�\�\�\�g�.*��T|_�5%%X]l8lhհ�__\�ܒ�g�Q!֬b��p��\�O�\0_�6���\�J\�IN\�\�IHw5\�@^f\�\�.ڰ㹩0;K���� lD�U����Y�����\�\��]�<\�k\��+\���S�\�u\�R�\0�\�Y@,�\�g\\|\�\���1��؋�\��<�\�ß?N����.Fw?s��E�\�/��\�s\'-�\���\�9�ZZ�\�\� \�\�|�[��\�\0��\0��v\�Ͽ����]�ӷv\�sT\�w\�s�\�\'P\�;����q\�{?*��N�>d�ڛM4U�u\\G0ǧ\�#\�e\�|\�\�h\��Z�u���ߥ�7ʿ��\��27�D�\�\���\�\�\��\�%\\{M�\�o�d\�`a��\��\�\�{���C����%E�<\rQ:	\�=\���b\�AI��7^���$�\0�.:\�_���O���L�\�)D�MJ\�\�\�po\���mm�ť�\�Nq�k�\� ��g\�s5\�X\�G\�\�ă\�uF�\�<\�\�ks�\0�\�\'��ª&\Z���\�d9KL�\ZvO\�+��|MSk�\�\��O�\��\0��\r>\�k�~�\�<\�\�\�i��\�\\+��^�Gnr.\�v�\���{0\�e���\���5U\�\rx�\�z�\�\�(n�\���U\�\�\�\�\�\�\�\�?T�p�\�ki�~s��\�J��tQQ\��T\���\n5�OS��\��\�TJ\�A\�\r�s\�\�\�\�td�o���\�\�c\�\�\�\�z��G�Ty\\X�__i�uy@߁\�\�\�\�v\�^��r���/\�0\� C<\�`k\�C�>2�j\�{(�w�ߘ\Z�U`!ٕ�ۤ�}y\�D�\npR�H�H\n\�w�z\�\�e<�\�3^�\���$\�ߊX\����\\\�+xu���\�}\�2�\�i7N�\�\0>@�r\�⯜���\�#0�ws�+�>�W�>�Ŝ�\����?dI��\���h)؀�\�W-�\�u���bQW/Zإ�t����d!\�O[\����_\���\�\�/?�[�_��\��\�k��\�\���\Z���E���g���/,\���y�(�\�A沕\�DXW9y>QxuF\�9��\�\0��)\�\Zbt7\�=\�\�3Ѧ��\'\0Ժ���\�\n\0���)�\�r\�.M5�#<�!�\�UeY\����Ui\'�՞�^��H\�ZxNp\��-O��O�a�u�\�\�iKQ>��������T@*Ē��5�?U�\�ߐ\�\�Pj�#-\�ZЌ��aWK����9xx��Qr�.\�\�\�}O6�;�\�U\�*Ky�W�\�\����{�\�\�D\��\�`\�\0\�K\�bս�Q�\�����\�Zb���\�\�H����h�ls���:1\� ˇH��ݰp/K \�c�XI�\�x\'��\rf\�,\�\0\�\�~N�\�]n��ᮄV��Xف\�j�\�	��{�\�\�~�\�6&;m\�O�4\�x{�ks�\�8SJ�\�N�\�\"�\�J��\�W&ɗo\�Y\�Ս1ʗ�c�q��\�\�n\�T\�In\0�\�bz��&ߨ7-�\��q�V�\�!�a\�Pmu\�G�*���+	\r�\����;�o͊$�$q�d�,Ҭ%)pG��\ZI-~�NC*Uᧆ\ZQ\�X�\"�G[i��\�n�� \�\���-�\�U\��Q����z�\���\�\�ٯi�\�iW\�G���\��\�\�_Z�֩/-��7{\�{@��\�K\��Iʳ��#��p\�%�\�	\04�\�5��\�mq\�7-\����_8g�ǎZ�\�C��/\�\�0�\�_-\��Y+���\�\�p\�	\�N��0\r�<v\�\"O�g	N׬\">\�\�a\�A�x��\n��^���ꈣZ�6�뻹�0�F�ͫ?�Jn	n\�\r���\�*��<\0�\�\'U�\�s�z3*�\�,�>�*�Ϭ\�\�滦�R\\Mjr��b���F�� \�\�Q\�\'Ы1i_Q�u\�:E��\��\�D\�\�R\�d\�?\n\�ǝ\�\�D\�\��{�m��\�\�F\Z�A;�\�\���g\�e�\���\�\�ڀ�\�\Z5U\�)\�͎@N%�Q��G�\�ĿEvkN�Kt��\��\'\�{�\�`xW-��7���\�ݵ�M�t\Z7\�i�\�9\�ÿy��\�嵈4O�4*\�%\�u\�;�a|]�3\�\�Ҁ}�n�\�	@\�\0|޻���\�\�v_\�N�4\�ב\��*\�\�\�\��a����h� ��q�`��\�\�\�\�[��~kQ\\.zs�\�ƚ\�F�\�(D��\�R�v}\�lD�U���>uns�\�\�\�\��\�\���\�\�eY���|�\�\'��\�W�\�cR�\�%\�yr�\�\�`�`��s�0�i�ѱ�xX8@FX~P�\�\�P�D�5��\�\�#����x<{�ze�!� f5A\�nSP��\�#\�+�~y�@\�M�-�\�k�\ZDy\�4�&�O�yޒn\0�k\'��\',��z��\�x�zr>\�\�0�y\�/}\��=�Ş:\�u��=��S	g��\��\�Z���q\�\�?Ч{k���e�[zp�\�\���3�,\�\�	8�\�9}\������\�\�^S\�Z\��#\���@��%?\n\����,���U&FZK�|r�MԔ\�\�a�F����\�\"�{�\�\��n�m�:\���|��aT��qW\\��\�\ZF5T\�HM)�O\��u�A�{b|�\�z�ꬱ�\�*SQX\�֑�\�\�\0\�H����\�˳��,k�$ڊ5�TL�s\0z\0�}�\�4\�\�K�!��06a�䀘��~́>Ղ�\�Ʊ*?ۊm��\�6ƚ�׻lo��\��;\��\\�=[鳗\��(K����q�s���\�<I1���ݔ�X�/��\�6~Y�iܕ�O\n��,ۇ\'Kn}|�\�B\�\�\�_�W�\\s\�^+\�\�u\�\��@��\�=-��=.\'�`��z\�\�\��[ǳh\�\�\��>\�d[cu�>Xg�D\��f\��ۓ\'\�1��p���zm�`�\r{+\njN\��Q�7\�Ox��9�\0��]�̚\�y��2\�hS\0z\�\�(C�Ϲ9\�[\�Y�D�r�\�PF^�\rUX\'7V�Ϧ\\k5�P��f\�\������J\�\�1[�����\��\����\�Ϫ�=IM1#�8\�M��F�j緁�PÕ\��%(���\�@��\�	A֘�w�\�*p��$Xϭ��\�\n\�#���\0<\�\�\�\�n\��~$�gϠ4����[\�\�[�\�\�mY����&\�ls)\�R��):��|6=�o�΢.|m�\������E\0��չ�s�>�7�Q!\�\�P\0G-\�:ݞ��-�\�!X\Z\�\��}\�5\�̺\�e�|-\��>���\�\�m���s\��\�	9wڲP�7�[Б\�ٍ���\�\��\��\�7s����r\�\��\�nxG_e�;F�i\���n�l�k�\�R�<UP�է\���x�y\�˫QFK5�\�SV�\�9J\�Td���4�\"S\���/���\"m)��\�\"R�5�\��(�\�t�s�U&\�r�\�Xs�*!� \n�\��\�\�j\�\�.P�}��\�ko\0�/N7\r�а\��U\�z|�\�`\�\�\��\�t{�]���\�V\���\�T�=�!\0\�wzu\�¿#�7\�\��갽\\\�,�ڳ�.�쵪\�`�|͆߇��錏\��R��\�Q\���\�m����\�\�[���VX[��|�����_<��g\'\�գ��x\�><���x�wX�7�\�k)\n�窘G�\�t��<a�D \r\�tC3�\Zl��k�O�-w�\�rkU\�E<g[�ŏ\�\�mg�?\�\Z\���c��>\�b\�c��6\�\�\�\�o�a\�P\00�\�\�6\�mgT\�0�z\�q���NUs\Zo��V2n��ʵ;m\�\�\��ufۚ�k\�IV��d\�	\�Dx@��n\Zx0��P�r�5�\�2#�9K9\�\�d��$\���\r\r%\�\���.\�7$�\�Xk\�\��x�J@\\�,���aw�(\�\��[M+.��l�\�P\�B8�=\�.\�~\��Y�K���� oT�/��\�\�k��43��ܶl\����\Z�r�#��7�rПWi���7q�s9�G9�9�{=�\'=�9���E�\�1~\�)\�\�}3�b��Z\��\�0�\��Ǐ��%\�8fi�\�X��ރ��ܻ\�{T�@(*ʲ�,\�\'\�\�����W\���,\�/�5�?��]�\��\��OvSUx_�\�¿�\�\�`?.{Y���L��\�V̱\�z�\�曪�wjm��� ��Q\��`P�+\��\�F�&\Zi��{`A\�;���5&��ڰu���E(	\��{�p\�%N�\�\0�$\���1#ߊ�\�	\��։�Skk\���<T#L\0߭\�J�ZwQ2�^���\�/Ͱ!��\�`�\��;�]&�rF�\�\��&xߋ�\�%�!��\��O����\�\�o\�%�׆\�\�ڨ��\�\�SͶ7\�h{\�����t\�³K\�\�\�%�u���\�x�u\�0\nO���p\�\�\��\�\�\r���?Zq,���`���\�\�֊\�\�i{�~\�+��@�\\_\��T;�\�\�\Z���N�\�!�*x,���\�R\�쫷U��j���V\�\�\�\���~��o���F��\�]\0�\�5\�d�CM\0�ɶGPR|m��Ζ��j{<\�\�\"s\�ګ\�<�	>Wk�I�Z�\�\nJ�\�)/ǫ�X}v>�N�\��k�j\��\�qӹ��k\�M�f@ߜ\r\�\�!��\0~�k�!\�\�UJ�\�\���}�k���<�EZu4r_�\�0}L_x\�r\�޶��+\0�Xyp���_\���U��ZE���|y�`\0r\�\no\"\�}\�|�\\M������~�i0�X&]8nI\�\"\�\�\�\�\�\�_[\�\�-�ğ,\������\�\�#�\�?\0�o-\�ė(�,\�\�Ey�\�(\�~�6�.|\�q鹙7\�Z��\�V௉��Q\Z\�a�!1��`)wc,�?\�\"oܲ�\�\�\��Q��\�{���W\��\�\�?�\�W�n\�㕋�\�\�ceq֒��u<�6�\Z\n��E\0�\����\�w\�\�OHթ�\�M�uL\�u\�>\�\�DC;��6��\�xu�ۼ�\�ԙ|\�<e�\Z`���&\�:ܝ٬<\�\\F\Z(�\���\�E\�b�\�rm��5T�]z>ŕ\�jJq�ƣJ���<e�\�x��\0�Su\�p\� \�\�K!\'𡾔\�\�ۣ-�}�=��hi?lA�.���M�\�{8Va\���֕m�=xJ�y\' *\�\r���|߿ݙf\���3��\�\�d�v\�<�\�E��gG\�k�V^K�v*���c�VA\�\�k	0*��\�(�,�\�vOy�\�c�\�\�k�Df5�o\�\�\�\0��\�B��\�3j�\�Umk\\�\r$�z\'@\�h���\0\\gk��#�Yk}��\�WcK=Dx\�r_5�\��e\�]\��\��\�\�\�ЎG\�O\� \�\Z\�\r�r��\�\�ш�j�%���\r6TWo]�\�^Re��b�,k�w\�\�\�z*;� �\�\���q\0^7C��ra;]�.\�K�J\�P�X>I�\�!V������H>\�JCB�,$P�\�Kg�\�;x� \0M\0(������$�8`_ï_�ʰ�V�\n��\0=_m���Y>Y%�nݰ,��\�\ZO�ӑ\�)�>�{�\��~c!?|e�\0<�؟y�G�\0\��l0|�zܝ:i\�\'�Z8 �v��E\\�\�?��?����\�����\"ɏ[ֵ3��\��F\'UJX�����t+MʲrdrVb����ߍ\0�;{\���^�{G��\��\�{�\��\�^9c����s!n���tPN\�\����\�Ky6_�,�\�\�*\�\ZP���(\�y\�\�\�\�\�\�\�=�_���\�o+l��U]�Ur]�ʳq^{�=R�J�d\�\�P��Hk\�\nw6�>UYx:�S�|�;�S\�\�Py\n�IXD��D�%\Z�^�|��G\�;U���r�\�@?\�\�Ѽz\�$����*\�\�m��كI���v\�_\�\��i̿3ۋ�U�N�-�\'\�tu�}�\\uդ�\\;X랃|�_�,�\�\�[\��Qڹ�\�\n��\�}\�6�6�TRë�\�%��J�Y��W٫\'\0�\�\�]�\�_4�\�\�L�r1Z\�t\�q\r#�ʰ)��{�頱Qn����!H�9��L=�$_\�B��\�\�BQ�\�K�|u\0\�\0��(tx|��@�G�4\�\�ɼ�v�X�\��kk�I\r�hi�񛐆M6P\�h���6X[c��%�\�Ms\�z�t\ZO��\n\\L\�\�w\�%8Ћ\�\�\�^�A-�\�SbXр^+ʱ}]����\�qQH�(�x\���A{\�*\�\n�aI+�e���p#\�\�^\��^�/5A��\�ܾd9�,[�m�\���-\��\�\�\�\���\�Y�&ў�ֳ�f�\0\��o-\��\�x\�Y\�a\�\�/`y$�q<�qXf�\"0Ĝ:bѧ��wy��E\���.�X\�]��:\�:�M\0��ڠ;\�\�/�\0?\��\�\�r\�\r�qV��?ϲ��t+#@�\'\�[\\D�\�\���>x�4������8��k��\�\�E�\�\Z$ز�\�%Q�\�\�p�\�\�,>|\0\�b\�d\�tn�b��]g�1\�{���_炽\�]Oq?M ���!O��Kz\�˱j\0]�c\�4\���`lO�v��ʠ\�<��\��\n�\�*�\�b\�WY:���ջ�\"\�\�y�\�\���\�?\�����\�3����ɷ1~\�p\r��\n\�\���4w~��\Z\�[c\��\r*X\rj�\�msD�j!�,A�MT��v�}��7WO\�\��\�qXY#�A�{�G�kig_\�-\�C� �)AG\�\�,\�ߗ\�\�\�U��n�\0Y�{\�\0�w�������	S\�\�\'\�cY���k��\0�d}\�����\�5�\�\�!���53jjA0��\�\�p1\�\�b���\�T�\�\�\�\��D�b[\�\�\�\��,.�Z\�\���c��&.�\Z\�/v�s�\�Y\\\�y��\�\��=o�q�ZJ\�ol���\�\�c;A��\�\�[[�IZݎ�0G-�%\�{rX��\�t���B�SYtxz=j\�F޾.�\�\\?�RWW�\��\�\�?/\�jb\�:*\�j�I\'�ǳW\�\�K`�\��\�㛖\�\�m9\�ohX�\�s�\�\�e\�w.Y�~�ey�̫\�-vM�vĒn~o)\�Ķ\'\0\�w�|��l�<�G��g\0\r��i�\'Y̱o-��/-�\�Hj��\�0lԩ����\��\0�-\�{>��a߳_\"鿲8�@y��;^�\�y����dJ*_Ӡ�,�S�\�w͊n�\�\'\�Jó�з�L��_�Ǽ�dˎ��d\�\0�\�U��\�1�{\�\�\�gErn\\��\�{0k�@FW�\�0�X\�+��LC!��{Ag����j,��\��\�\�\Z]=��-\���`����NI\�\�L^l�ssG+�殟A�+�\�̀�����h�Ab��CrWn&?V\�\�~\0��~�i�EOI�����2M�\��\0O�\�=�\�5�D0�\��A�(K\�o˴1\�\�X_l�b\0\��t��xKP�<�A�M�6�\�\�S\Zw|4�~yܞ�s\�\" \\�\0�\�_���V�9wP���}\�}�\�1�;�C��\�u���\�\�Y���\0ʱW�Ϻ\�{�.?\��Z�C�\�\�\n�^|\�;��ۘ跉�F�-�Q$\�8�f/�w5H\�\0\0u�ю\�X#Ky\�u�~�M�)\"\�8��\�\�d�	2۠\n��\�YgK]\�Z喛V�l,�Q\�$Q��\�<A\�s��\�it5\�3�{��\�f�\�m�W#�ڰ\��z�	8�y\�ȳ^\�\�+O�\�=�M�^�\�\�Q=\�\�HS�\�j��\�.es���J^Ӑ��}7)%\Z\�\��w��w`C|��:��\����cy�\�\�\���}\�ٮ��a��0\�i\�֎�U�\�^�D���x\�{K����\�_Z��\��\��0$s菀�GX\�m\�\�\�,�\�W\nˇ�\�B�}���p{k��}���:��GnG*\0��\�bx���0�\�o-����\�\"P1�u�G\�!�\\\�\�b�ܰ<�KY(.1���\�(�P���Ycq�\��\��\�\�a\�\'\��^~�\�\�,���5\�\�hY2,����.@�\�\����\�j�A צ����f^Sj5�rV)\�=\r\�ֹn�(\�q\�D�Ћ鹿x��)�!�y/r\\L�J\�\��xO\�3�oKD\�K\���\�rlP\rN\0�@$�U��F��jy\��%��9EQ\�y\�.����\�Ud(R��T�\�D�\��򱩅ܷ\��b�b��ڼ�\���u�\�_V`\�y�V��c��\�/��\"�^F\�+;oq\�͎�a�\���\n6��\\�i\�~y�l�U{\�_\�\�_\�\�#\�\�\�ֶj\�g]!\�%����\���\�_c\�ܟC\r(xx쁀\�\\����[\�p�}�\"YB��, \�\�/zX_\�&��6,\�C0��*�1��jӤ$\�\�s\"f5���(\�䚥�\�E\�F\�R\�]�FU\�\�\�\Z=\�n	��\�\�b˃\��4\�n��}a�\�4\�s�\�6;m���p9A��\�j$ZoQ \�\�k\�_�G��\�D\�\�R=�\"����\�l\�\�w^m\"\�\�u\�\r�r͕�`�x\�\�C���Vv �\�Y�\0���t\�k�r�;�}�<J\�kvu\�\�b�.X�\�s���բ\�|	X��l��������k�\�\�G�(\�:���x\0%�>�\�\�Qǎ�~�0B8?}�\�\�j �r\��9n!��风��/�\�+z?~�v\�ם\"TD��1a�Q$h��PSm��\0\0C6\�dZylJ&\����/[ʥ�����ćA��\�xL��S|�\�z\��`���k�\�i�\��Z�\��\�TC�y�zj��!�\�-:\�\��҆\Z\���p�4\��X�p��K�n8��O���\�\�H�&$\��|���B\�uJ�\��\�q��t���\�ϵ�#|�f�*\�\ZG�N\�qVm\�po�~�\"\��j�Q�\rդ�@3��\��ʳ�\�<X]�\�(_-�G���\�:\�j�5VUP�y���\�6\�ě�Ӱ�\ZQL!ŧY�0�v�+@��x\�#\�x\�G�\�\�k�����\�\�\�_\�/as\��}ن-لY{�m\��;\�;�\Zi�^6��\�\�\�&\0I\�\�\��Ϩp�E\�\��\"\"%��b�\�\�$�\�\r\�\�t�2\�?R��\�\�l\"~�M񏜫m��F\0ނ����*m\�`\�i%d\����9fx\�/w7��\�k�=��\�ݶ:\�e�#�\�\�f\�+H�\�FT�|V)���/�֩[�|>\�\r�=���?X}\�\Zf�嬀�U���\�\�\�j��\�R\"�&)̪\�e7\�*cB	\0�V\Z��u)��>8Њ�-�n�\���X��\�\�Є���\�Վ:\�\�u�\�c\�^\�-�w6�%ё\�\'�\�0y\��/-�\�WvT@�\�q�=��\�\�>\�y�\�`죎�\�Έ\�[�1�\�\�N\"��:�\�\"~<\�v�#Pgx���z�;e�\Zeu��%{��$R\��떁D/	�wy����}��\�X�&f\�wn\��yV��n9��-�z �k\�߭�㡢D�L��6U�\�\�ՕV=ۅ\�\�Hj\�\�\��	\��z�\�k\\\��^�8s(<=\�`�\�3a�u����:\n�\�f�\�\0\��]�P\��]�X�tU7\�X\'2��k�s�H@�*�X��a7�\��\�<@\�az��V��^w�K��T\�TO\0��\�5\�^�DI\�SĽ_�F`˂��/M�nM�\�&���)\�[hz��ӆZ�ͭ\��ك\�\�լ��7VZk=��0�*\�\�\0v\�:�\�͒��%\�U^�\�\�uwn�A\��\��G�|��4jy�d?H\�\�~�\���\�\�o|1����T�����3�I�s^��\�M[�����~ilv\�zT\���R�sS\�XG\�]��I\�\�?D\�PÚ\nB��&2Ϸ�Č\�\�&[l\�\�M5ҚO7\�H\�0U]qLs�gx��vu��\�luDY{��=\�I�\���!�ɿ�\nYh�˲1\�\�@�N���֡�m\�i�]M-]\��\��)\�k�\\�v%�͒�w\�jK-�`\re�)ۯI\�5�\�c5ɱVi倿$��XQX\0\�\�\n���w}\\g5�L��J��x\�\�/]�\�K�-\�\�%\�<\nò\��\�`@��\�g��\�7\�cxz@\�%�=dq\'���	\�\�C�������\�m�E��\�\����||K��\�c����\�	4g,\�\��t\�b%뵯p��K\�I�\�D�Kؔ\�\�ԡ�\�\�\�:��L@\�\�V7؆b�Ȇk*���\�\��-38ɲ�\�Yw�:!غ�#l�(\�&˓l�D�k�v�\�\�aҍ|F�7j�Y5מ뎧\�\�͜\�ĭq>ߵBW\�\�a!5&ڵ�r��\�oMA\Z�,\�:gXG\Z��6�VjYޙ\ZA���y\�S ���H�%\�qi��uv��\r���<�\�I|\�޻U\�vD�A*��\��*3P���/Շ�B���\�6ђo�H��\�\Z\�\Zn���>\�\Z�\�\�1[�\�X�F�\n�pqΞm@@��\�\�\�u��p\�\�\�]s\��\Z@��u�\�O6x�z�h\�\�\�s}m\�S�\��<\�p��Y�\�\��X~\�>>�u#v_a��m\�\��-O\��@�뫯���\�\�Mdl\�,aփ\�\�\�|�\n|\�gHl_U\�v���+l��\�Z \�e3��}�\�7K\����]���[h�1���b\�}@�l�MX~��\��\�Y.\��s�<\�F�bs@�\�=�\Zw\�\�&�&y�\�st��O���t\�f5T�\�\�_\��\�S#~NS[�\�,|�6�5)�\�\��V\Zl�\����;V£r\�},\�H\"{a�$X>��E��x�B.���OY\�\�c|��%]8a\�s_[(�D�����״/ow\�[K��\�|m\��ހ<\��a$���#	\0	\'t�\'?��\�xz\�>\��sL\��\',�\�U@\�k1�/8�O����\�\�\�9�\��nyYY\�uk��N�[_f\�Ꭻԑv�`;K\�\�[sA�U�\�ZiB�)�yߒn])\�֧.:�I\�\�ǵ�V\�T+@\�P}�֤z\�\��Q�j�\�\0\�R��\�ö\r��\�sN.o?���C\�N�\�S\��l!p�g\�\��Q �\'S�$We�\�ڠ\�\�^\0vP���._K\\\Zr�\\\0�?�\�B\�O�� \�\���{�2\���r\�a���7�\�\�o\�\�\"ȭj�l/�V;<U\�N�ftd\�c�������b��\���Rk\�=\���\0}\�_2�ƪ\�\��\'+\�|��\�7y�\�\�r\�w���5\�\�?\�\��s\��\��O�\�?�\��ӓ�i���l\��V\�\���=]^\" M\�\�͍�\�p߀���Xwm�� \���Oķk�|�C��)ꕹ\�:�Q�sY���v\�i׬\�+�ތ�\�#�5y\�\�\�\�o�\�����m\�x\��D�m��\0~��\�\�\�*m\\\r(a\�a52T�#>\�C\��J\�;i/\�O>\0�vﵑ\�# \�ȓ\�S \��цg\n�\�\�\�#\�\�\�F}\�r��\0�\�X\��\�Op��\�	\�V�\�\��c�j]}Wi�7-\'\��\'�O�\�d�U\��e�8w�⮜�\�\'P\0\�a\�c0��>��E^�\�¯ \���\�h\�/J\��G�UH�R�0%�υ�;�\\?e\�gNX\�\�-�\��\��E�\�^�~c؅���\�o>�\�C\�[\�	o�fQ���*�U\�\�4�\���f7�2\�\�߱�\�P\�JS3I,��O��Za\�\�:mj�~y\�\�\"k\�ΰ\�d�\'�1Ve��AV\�gm�!H\�l��\�\�\�\�\�\\�.&�|\�\�i��\rY�]^c��1\0�i6z�\�kz���4\�P]mtn�͹�\\g�˰\'\�;\'�O��\\,\\A����@�L_ν���m�R�U�\�R��6\�Սi�珡&�o�\rCm�j ����r\�{\�\�\Z�#\�Q)�\�R�\�,��!�\�?#n��\��\��[\�\�\�\�\�Ƣ���\�>kc\�SPs\0�\�u\'�{\�!\��	\n�\�\�l��{�\��G~N��#\�_\�9��Sf���\�8\\�Q\0y8�U����ڻO�x��\�p\�\���\'ۓ��:es�s616jc=m6\�\�����*l\������\�|u������g��S⍲�t4ǅ\�Y�k���Vx�\�N[#�lhD���\�,�\�Å\��\�{[lM\�\�Q�A��)�\\��]5\�}ڴ\�¸\��\�\�\�{�r\\�{�%dx��SPhǿ���a�ƌ8V��fkh%�% Ћ\�����ꑾ	V�\����\�oY~�7�7,�\�5wv-�\���W�Z̅K�p��>k	WN���4ً\���?Z\�M�\�{\�\�n���s��ͣ/\��G�		}\�ҏ�=�t\�\�\�_����S\�-��\�:?\n)O\�o��\�_�\�B}cѧoZµ^\�\�e\�IA�^�ֵ\�\�!h߶��[V\�7G�Z{\n\0\�r]\'��\�*U�ڄ��s\�JU`Ӂ|nJ�1\�Va���@G6j�,	`d\�xs��\�\Z=�QU:�ˋ�]�s��v\��[/\�p\�*��ܘ3\'��^\�K}>�WǛg\�ڸ~�\�|\�\�t\�\'r$\�\0��@�\�az`V\�_\�r��#\�+���eS�`�!�.Џ�3\�\�#=��:\�j�`�@2\\\�kKl��\�F\�Y<j�\�lg�oA\�cM�=�\�\\�۴\�pG\�Ŗ�\�\ZWL\�\�0�{�\�\�2�\�\n��\�SO`P�\�O��\����\�=A\0\�\�$>�����2\\\�x~\�-�\�\�\no�:��y��\0�?,(\0�\�\�+�\'�\�s��>�\��β\�_����l���\�In�Q<�(D\�.�A5\�\�\�1ɹQEq.��U\\��\�Y葔�j�\0�/v\�&R~gi\�\�,���\Z#�H�\��ZlU�\�J��:�ψa\�Z�\�Sc.����\�\��d�UK��\�S܆�R-�5��@\�6��\�\�k�	G\�k\�q^.\�07�`��<�{N�\�|\�Vi�\�VjE�A�\0\����*��eY��-\�ﶥ�Zj��%{|���p�u\�q٢�\\rE1	�\�X<^?\�\�)�g%\�<0\�Z\�%u\�a�q\�\�3N%\�\�\�cn��[�-\�\�i�<\�k�=kI��D$��\�y�	\�	|k\�>⇿Z\���\�\�,\�\�e+&@���1���\��_[��o,\�\��޳���0��Յ߳�\�0kO�s�uޮ#څ�\n�9>�S\�\rn�}����ꬣ�\�\Z��Y֐B\0MU\�(��\\\�t��4�ZG�K\�+����\�^�v ��N��bRv\�׈jM�\�\'\�V�V��i��\�%\n\�\�ye�)�xu�\�~�z@>(���k�)E;�(I}�\�\�T��*\0�m\�]\�y��\�J��Gԏq�\�^�c\�\n��\�np�\04�c�#\�V�kms�\�\�G���\0�q{�1%Џä�0�L\�Yo,8�\�&�f���:z�=��=@�4G^Uv?\�m#ͷ>�H���z�2�zU۱<e��\�2�\0�k\�;\�G^�^�<P���:OM7��~^�����]x��x�\�؝����1�;B\�\�\�\�|.\�X}\r�վ{v]5�r���Yn���:<;��u6\�\�ņ�\��myt\�v�\��Ƽ=\\��K���\�\�a{4\�i\��܂Nr\05�=9\�:��=\��\"�X]\�\r3p���<\�\'t�N\����\�HT\��@\�<K\�T]\\\�~��\�\��\�\�v�a޶)y�k�\0�Je�\�a\0?\�J\"C� 8�XQ���\��p\�\�\���nY\�\��|\�\�a�8dt\�\�kH�k\�up���]}�}`�^\�,��\�K��ϯ�}�\�s\�b��X\��\�}\�\��ĳ�TA,�Wf^R?�~\�+����sK9�x��һ�sw\�}O��Y�\�e7_�44\�KV�#ѣ\"�-)���|ee�z\Z�m^�}M\\\�V�\"h�v�ZOS��VUZk���\�\"�\�QH\'Ѯzm�Mס\0��+�\�\Z\�tY{8J\�U)(w[8\�Y\�\��׮#=5\�\�>\��;�e�\�\n�\�R\�\�֔k��S\�\r�\�ƛ�\��!\�(�C��t\�J\�\�N��tXj�\�\�g\�e\�Z�!\��w\��{�gT\�5\�\0�d�\�*Q���Ħ\Z���^y#�Ož:G���	�L]3=S.�\�\\\�\0\�G\0� �\n9��ށ{\�I��X\�\�|O�k<Gxb{U\�m����\�\�\�<_�?�l�d\�\�z\�\��7x�\�n\���\�?�x`�w�\n\�\�$�$��B9�\�\�\�\'k��\�\�o\�\���97o\�3658`#�\�6TSo�%����b�^�ggI�ċ\�^\��\0>~�\�&�\ZmZ\�\�\�ö69\r\�\�\\\r�\�\�=YDYh<\�l�m\��[���O��6$uC\�mk���\�p\�y�`ʣ\�siu\�& \�\�\0���\�&W\�T�\���m\�I%H9\�x$��@\�Y�Q\�HD,D�n\��$kԔ[$o�&J\�t\0=l�&��0}��r���\�Zf\�=$3\�\��M7^:����u�u\r�{Y���\0�\�\�Y\�.��#V�x\�\�\�\���\�	OZ�\�)�	��A\�_\��\�I�\�&$^<�\�q�D懳BN�гG��\�Y\�9�\���#8|k�\�Xر\���o-\��wu\�{��E,�\�j\�$\"�\����\�5�C;`5$\�r)�X�ج.��7\�tO����pg�\r4\�Zo]���c	r��\�ܤbx�.��@~�M�\�l]�-a��%�~��\�\�*˩?��f\�\�~\�l\�v@ \�b{Y\0��^�\n���\�$3\�\�X��]ayu\�i/\�\�Z\�\�\�\'�r\0,O�v\�ꦫc:\'��\����\��w]pk�\0��\�\�ǣ��è\0u\�\�\�\�\�\�@�<�!ϫ-�)���\�\�o%��7T\�rO#\�\�\�Kbm��`�\'ꑧ��/\�\�\�\�갽p���?\�g\�\���.�@�����\��\�j����\��\Z�\�\0����/O�\\���a���\�!\����[m\�=9\0=\�\�ָ�_\�}l�G�6��\�	 �u��z\�ՍG|�;��hsͶVVlaz\�&�pc��j��\�gK�lDmy�Nn�^n��f�\�\�L�&Z��\�V&�l{n\��֕�h\�\�x\��Yۛ�\�S=0\�6\�\0qkT�5��YU�\r���m-	0~Z�ufŹ]ն,e\�\�1�ּ:��\Z\'tO�s��va�v\�©cy�\�l\0�\�:\�C�\�0t��#<�\��.2T�+�\�\nse��!V�J\0\�x�\0\�\r\�\�\�\�O\0��v�\�\0}<\0\�(�\�\�\���:\n\�%�y\�fO$($\\ë_9n\��X�۝?\���4�\�:��ח�\�\�����\'-\�\�)=}҂Ϟ�\���\�?X\�%��\�/-\�\�p�pi�w2\��;\���#(�s-���e\�A��7�a]��Q8H{\�p�V\�X lm�-0�M�\��\�G�\ZQzu\�\�\rU��QQ\��\�\����Z=Y\�6\n��a\�y�\�\" Vo{\r�\�Q����\�:)i\��\�Vh���<�W۬\n\�q�\�\�[k�t+_��\�y֞�\�²oـ]\�{\��z�؇xy�yu�鮯�\0����),\� \�赃\�\��Ӌ�\�\�F^��W1Δ\�\����\Z�\��\�\�`\�}m�`�\�/��A�\���\�\� _G\�\\\�\�ð���\�\�ë\�vO?C\0ܰ\�Oj��l�D�|\��\�}e\�9~H\�\�\�\�\�s\0\�\�\n�\����\'\�G�T\�G��$�Z�<\�p\��\\Z/�K\�\�k�\�\��:)X\'\�,z|�̼�b{\0��:�\�_��i\��$|�6\�\�0\�\�b3}\��4\�e+cy�����y��O\�ٗ\���ڨ$\�\�,\�3T�������\�|W\r><V���\0��{p�Yy4 E�`gƻ4L\�+Q\�\�>\'��`\���v�\�^�nȽN��@\�v�u���\�Y(�,�3��_߮���j�\�\�	��\�Pk��\��P@�5\����h�	���\�(@$J �`f�aA��V�\��e�w},\�\�MK�\�6�R��I�H\��}\����+�\�\�%wv�p)\�k\�^8�\�\'(��\���b.���u��ֱ\��#ȣ� \\�\�k�s�;=��S\�\�\�,�ȗ��!�\��񨅡\n._�̛�y���w\�j\"�)M=�SE\�\�a\�԰�j\"4Z��\�\Z/\r�\�B+vM�	\�\�\�.\�\�\\dt*��UYRS�\0�Q\�*sm�:Xb�ܜ#�\�\���y\�pu�\�JmQ�꟧fS-�&,:^W�V\�p�2\�ʭ��ԺJ\n�C`\�*\�\�\Z\�\�\�EHz\�\�p\�,w�o�e���l\�\�{|/?\�W�j(�\�\�\�q	ӏ����2\\V\����Boz�\�P\�\�c\�\�Q��\�0<�����\�n\�\���>7\�\�\�Ƥ=ݜ���9�\�\�Ұm�6\���ms�ƞ.u\��~\� �W\�\�\�3�\�z�>\�.x\��\�f\�G���{�A��&�\�E�#\� tt�\��:�{�\���]z\0�3_W`��\��\�_l�\0\�>{q\�#\�?𼟞���$�� ��^M6�\�\�δi�\�\�~?_�x�=g��\�67\�o#\�66\�a���6;\�kkS��93\��93j[��\�?\�\�\�\��p\�ٰ|�=c�\�\�mge\�6��S��.n�\�h�����\�ܜ0i)޺.C�\�\�]j|o�1j�\��b�U���S\�jU\�$�\�\�^�\�/�\�p�N$���N8�\r!5VT��0�O\n���{֜l\�)�֊�hI� \0D[K,�+:\�\�\"	H\��xԈ\�gx�뎣�<\�e�ZF\�m\�\��\\��nW_#��}n�\0|-\���;\�\��hY>\0\�y��9@~\�b{�ٯa\�C\0�[���k�s\�[����E^�)��W�L/\��������\�|\�\��r�����\�By=r\�B�`a\'����-	��\�C0\r\�\�\�Zcr\n\'č�T�!Ǹ����S�\nJm}��\�\�\�j�-ww ���`�\�Q{l����=�Q\�oC�\��\�\�G\��m��\�fz�ln\0y\��^���R��~���CML�$&�����F@O\Z\�NTUz\r2-�\�\�2�������a�\�B\���Du\r޼\����\�zOI���R\�\�ݨ�l?�O��\�}�\�Y�=ɺ������_:�}��H�q�쇪TW�zlk�\�v\�-zu\�\�\�<\�^r\�g?\�_�\�\�6\�.��Z\�˓�Wꗍx�<hϖ\��Ҡ�\�{\�\�{\�\�O���\��$�z>\��$ �\"U�\�\��\�����\�}\���$\�\�{���v\'\�\�Ψ\�6h�����t�\�o,|�\�\�0����\�[_u��;�h\�O\"�\�l�ޘ�m�-M\�\�){�>\�.���*�ߞuG��\��z��\"Ⓧi{\�k<\"J\�qCuq����W��Z\�]X>2\�j���yܔDr7o\\UHȶL���c9\r�hC���؎l\�\�k��H�<�+�л\�;\�e\�\�{�#Yk\��֘b����:\�\�\'Z��$��\��5��W{��pk�E �\���\�\0S9��~V|� u\��C\��,��r�����۞��\�h�O\�i\�ga�3�|\�4^��ū�G�>\ns+�ƿ���|آ/���\�,��c�8V�\��y�fҫCn\�i%�(}�\0rJ\�9	�@|\�,�s\�2n^%P�YCB���ţt\0=�\��bml)��V�\�\�h\�~��\�ֆz�\�;\�\����\\a��E�o�%ލwV���rߕG�c��\�()79+�M�\�n�Z\�Y�boJ�\r\�/;\�h\Zx)��j\�&�\�^\rE٬&+��Z�����\�\r\�(����U�j,A9@-$Hf},\'\��\\Gs�\�N\�\�0��\�P5�W�\����^4�RǷY\�VR\�*Rǚ�`�*\��-)�d�\�w\�\�B�\�in�ja���LS_搼ݽ��0\�k/6`\�5X�|�4d{s=�d�\�O�\��l�k���\� ���\0w�.\������\�����?\��\�9\�\�\�\�>��Yݒ�W�\\\�ͱf\�ͣi����\�\��\�&\�?\0>2�\�\�Q�&\�<h祔a\�\0��\�?{�`/���\�/�5�s��.a\�\'��P2/��{�۞mh\�2h�\��z�9i\�3\�\�\�fM��V\�kU�G\r-\�G-���ve�R|7א2��<w]���<5\�\�\�+\�\�\�\0\�\\.\Z��\�`��Q;�J\�\��Q|�S��:>�*���:\�է\��Q�=\�\�BZ��4Y\�\�[`\�an.�FP��@G;��\��@\��\�v��	\0y�\�[�EK�q֒�O\��OZ\�哖x\�l�v\�ڤ;�/?iѧ�\ZR>\�<>�2\���>\��N�hq��Z�٣�tN^��E�\",�6�ϝ@1&��p�\�\�y��Y~�+\r�e�)1n@���\Z�:WB��=\�i\"R~	˶�\�\'���d�C펙\�a��\"���\�|��c�\�߇�\�H�)�����hY�M\�\�����_\�\�ՏQ=旇�*�\Z\�u�	\0}MX���Ћ\n\��f��\�\�\�P\�\��&�P	d1\�TMp��I�.a\�N{\00�!��+J��\�\�ӎ�M.������e���\�\���zi(�h�LH��\�|k)C\�4�:\�x_��OZ]�\�*�u�ޝ\�p;���Q�\��/Wgmk~\�f��KD�\�Z`\�r��{�	20�zj{\Z\�㷧\�\��Y|.v\0,.�J�#�u\�MA�uw^�\��\�\��O�]E;��o�����:2{�}\�\��\�\�\�\�7\�\�۬>�\���\�\�9z]��:�]����:�(\0�\�Bu\n ��.=ot�\�\�(SP�oQڷx��y	�_nM\0t�\0��1�*����Q��\�N�by�\�g\\+r��8T�MUL��M*q�1\�s�ށp�w\0�σ\���\�q\��w��\�\�+d\�̷<\�\�\�\03��>%��#�2.\�j5\�߬��M�Am4\Z�^~�::\�*\"C�4<Ċ��\�\�SU�\ZbV\0��@@�Rɹ�c�;�}\0�L���z��%���_�$��z\�%\"\�/��?�~wv\���\�:΂\�/j2-\�_�ޱ;��\�1@\�\�_\�\�H�V<�\'�\�C��.��&h�\�v\�\��6�\�(�\�ԃ�\Z�ǅ-5*\\���j[\�\�{\�=Q��ƍ{�>n�%y|�\�T{��9?�n�1\��ҕ\Z)���.\0(\�w�4˕`�S\�RG���$V\0�\n�_h�El\�\"��/�\�^x�O�\���\��z\��ay@\�\0K�5�\�R>A3?\�\�\r6�ok�uaj��AT�t���*\�\��\"ԇr�˝�ё� ����\�:\�*���\�:�\�l��\�&zmnhؖǆle�\�V	zk\0~}�ö!\��Y@�\�ʦ�$?{��h�\�\��W\�\�	`w���\����ӽژpr�5\�ͦ\ZhL&\�^�/\�ѵC\�\�>Ks�H�_\�)�:\�\0@�/y����l\�~\�צ�f\�d�\�JR�-�\Z{�-@\�~y�����\�_��\�{��\�\��B��\�+.�\�=���X}W�{�|�f�}��p�(�\�[��<}\�\���Q���\�\������4b}��V�]b\�\�iV�x}9\�6X$��\�&�5��L���6��\�:\�t\�\0�|�%\�kGZ�\�\��8<_��\' ݒ��ӈ�\�Dv��UP�a�x\��\�\\�NJt\�\�eG\�,�&\r���Z\r���\����\�b�\�/��\��+\r�\�=2_�5�\0}1\�>\�\�M�?�^�\�%퓯z���t\�&\�;FK��\��_:b	��S�\�u\�_\n P\'\\\����\0p+5�\�IK=\�Rv\�%��Ö@`P0H$P$^=f)\�N{�?\�\�e�Aښ\Zn}A嵏\�<\\�\��\�\�b3����\�𒲫C\���^��rh\�:\�+\�\�\��\�\�x\��b\�+d���̷��SU�@�\�\�w\�\�2?�\�\�.�i5\0���|Ufvi�_;��\'@\�\�{a	Я�6\��\�\�`]\� \�\�m&�E�\�j���\�FڛmH���6١Ӊ\n��7ݬQ\�6��`\�Hs��56Zok��u�\��и-M\�\�\�²\�_Z��\�Yۜ\Zt�-7\�:]g静{\�@?\�:W�Z\�3U�iB\�3��\�J�y��$�)ִ��n���r=�t�&@�\�\��|��g��3\��	\�\�9���$�v\�?�\�yT`\�\����֎\'�W?�u����\�\0�O/`z\��A\�=�\�<�\�@O Q�\�}>V� \�U\�~\�ŧ�_^��t2���w�zL�\���m4<�}�\�m\�\���Pl�6a\�\�}\�R\�h\�EE��NO��\\<\"�~�8�|��E4\�\\YXN\�gYg^6,\�B\�\�N\�nzJ��,� �b�倝\�_F��\�{*��\"�\�f0\nܨ\�&\�t#\�\�3���1֬\�5�Z��`\��\n@_nE0~Q��\�߶R�<\�\�J\��:\�\�\n\�ݲ�\0\���\�{Y��\�\�|�+�\�\�e�<&_���O\�\�^�psڵ\�NP�\�\�\��\n���c\�\�_j\0�&\0Ĩ�Ν\��sN�\�5\�%�t��mH�:i���\�\r�Z�=o���G\�G��\�8�]�\���K\�w\�\�Z����>\�\�z\0Y�۱^\�h��4\�ƒ�n�@9`��P[5L�\'o�\�k��:\�\����n��\�4\�Pi�J\0�\��ЀO�S�E��\�A�[\������+=\�`m�\�\�[�-�{�\�\��J%\��\�6\�\�lZ�XY�̡6Ԥu��\�7\�t�z;lz�\�\�\'Fmyv\�6\�mw�{sy\�%�\�̏!\�{\�\\�\�1ָ\�C�\�\�l�\�-�\�5�\�^�\Z�L�5\�\��\�$8\r��؜G��\�\0��[e\�-:��D��<{\�[%\�`f\���&\�wtί?~V?\'\���|�\�;��:\�\�\n| ��,=)��QI?x��\0�#������G��\�\�D=|����\�*�P\0�k�M���IgU^\0\\I{O0^%�\�u\0�w5�n\ZȖ@��\���Qѵ\�\�Z�ǀ�י��\�\�G�)î+\'\rϞ\��m��P�S|YU�����\�摺�t�n��D��\�T@�\�sx�B)T)PdXOq2ύeE\"m���\�HOm���\�3w��ؾ1%\�\�Rì6%\�j\05q\�V\r\�]\�N\\��\��ۖ\�ۊ\�ܶ�;x� \r�v2_�h�Y~�\�5\0x\�R�.Y捋�q\�\�\ZU\�\�7<\�x\ZW��U\Zuᔅ�9mQ��\�\�\��ݑ����:O@�|\�⮠��@\�%m�\�&��\�+\�y\��yK��f\�~\�F^V�h}�\�fm�5\0�v\0/vﶭ�~۝2\�#�?\�Ǎ\�\�@�\�\�\�x�������\�_֬B�7\�\�\�y&\0\�8\��DjOIj\�\'�\0\�M�k�sxTEC)��\�\�\�Ϩ1�k�\��y�|�\�?�\�Y|��\��W��\��U\�\Z�`\�k\�a����K���\�!>g\�{\�X�ET�\��Ku��*\�h�ٞ[\Z��\�){���\��\�-Ϻ9��ݸ=�=\�\Z{�9\�\���� \�f\�Sm�k�L�y�\���\�k�\�\��c�~g�L\�\��\0Us�\�>��\0#\�%\0�s|Z@\�\�\0\�Ǉʵ�0�O�\�/\n�\�c� �A���6\�܂\�\�R��\��\Z��\ZpL�\�4`r��\'\0\�ޱ��\����-^�>����\�Dҿ��Ի\�))	�\�Q\�?\�\�\�\���OS\����Q\�6�h�\��`\\��\�9\�\�6\�ue\��G�eng\�m�\�ʂ<+Q�m6��c����l�(��\�|�\�*\�q;\�\�\�\�/�0�\�|9r^M4�\"���ߕm=���;��U��.��\�s��֚o�Jۜ���t�MM�\�`�0O\'\�(u\�	���@+\n�c\���\0����>/��kE\�wf�����\��_�j\���,��fϧ]?��\�:G@�\0\�\��{\�UX\Z�\�\0܈sg-�\�\0}\Z��\�=�=\�y�l\0JA�\��$\�C�\Zgh&\�OFާ��r��2|/[\�-~���n\�3?&.�y|�\n\�xE�v��\�&\r\�\��ڞ\�w_\�\�q�\���9\�\����\�]��֬Y-\�\�<;\����=>[�l�_�+]?<��b-�\�;�$�^huǅ\��bw��\�7��\��b�\�\�\�\�����zЯ�H�zmy��`5\�\�\0k\"E�D YD]�N���[���\��9{��`��\0�\�h\�4\�yoQ��4\�\���\��\�с���G����\0����[\����\�\�=\�\��qX�\�v�\���\�\�Z|��\0s;i/�lʵ�$\�H\�|d�{��^p��]��co��\�\�Yz|��+O�\��Գ��y���#\�\�%\�~�m?�d��\�g;\��]\�=�0�m\�A�H~\�ӥLt��c@-�(�*/�9/��\�)iae\����\�\�ʈ�G\�h\�\n��j�\�6��{(�\��i[�\Z���n�m\0�:?ͱ\�\�lu�4�֭\�	UEU�B@�%�\�ؚV�.;��j��L=C\�AbNW�*�\���*#/[I;:��15Ь\�D��X\�̌�\�\�<kȬ���\"�K�\�߇XuL�UFi\"m���Wb���V|�\��\�+�`_���\�/�6���\�\�\�V6R?\�[Se.X���\r��\0�\�1��_�|\�\�\�\�\�\�^<��؀ɟ|儹��\��E��\�\0\��8م\�\�=R�:�A]}�8\�O`�\0\�\�Y�\�9�\�y���5��\�3\\�cW�+/	���&`�\�!X\�\�\"e�(��a>���![\�`�+̿4D\0\0x\��X�~�\�Z\"�+�gZ�k-�6���|W��\�z7\��.\�\�N�g\�o��-\"�{\�\0i-�_���\0ն�D_%P��¸�\0\n�[\�\�\�0�dTi\�V\�Yc\0�6���~@�H{��\�\���=��i�(\�}\�\�}Hl}̞.\r\�\��^\�\�\�71�x�\��\r\�;�O�N<Z�\�\�@��\�{@/?�\�	\��\�w[��5��:���H\���\��\�\�%\�\�\�\0y�D��\0�@�i�F�\�\�\�\�ꐧ������ݖ6ᴙ\�\�\�\��\�<���h�p\�m�����Z[�~\�? p첶\0=`w\��j��E@��־���\0�k\�\��\�/�\�Rw\��\�\��u\�׬{7������\�U!Hy�zxD@\�^�����\�\�Fz\��\�%�pB�}O1`v�z�,�\�\�b��\�%k�K��}�Q��Z���^)�ʰR3Ȟ���\0Г��\��tci\�\�W\'�k\�iq֒�m�\�֐�c�I\����V$Lb\�!V\�*�w�\�.\�\�ca7�0\���\�\�췯X�\�U\���oj�W`}@��O��S`om�\�]b�\�qW��1�],/��H\�k\�O\�|\�\�Y�\�F��\0�\n�$�C�Ml\��K(�K���e��3|?�W]}\���x�V�\�/N1��҆\�\�p\��F�ؾv\�S�c�\�\�C��⃹\��\�\�!�\�\�XH~Xu_�:\�g\�<��q\�\����u6\�P�E+tm�&a��5P\�\�b=z<�v\���/��M�ӭy���%\�\�0�@��G�\�\�p�ǆ�\r\�\�8,>N�Ѧ\�(`H�D��\�\�g�v�\�Ow\�\���{\�k\�\�{4\�m�a��cm��;��x\�&�oNH\�w\0�ݐ\�g+cn\��\r�\�\�&�ȵ��x\�w�C�j�\�__\�? \�?n���\�\0sV{KHk\�I\�x�v\�?\0�\�D\��&\�_\�\�5&\�\�ߧ�<z�6�����	\�P	�\�O<G\r5���\�!\�\��s\�\��酀�ͽ�\�+#š�;�\��I7!��\"�6\�ܑ�\�\�|�\�-ysٞ����W�\�	@\�	oX�\��+cO	@ϑ�϶�U�3D\�qk���FX��V�r\�W\��1X^d\�e�6XR�\0���*RU�:\�h�|�\�C\�+ղ@Uw\�\0?�  �O�^�ߚ��\��֠4\��kJNt��\n\Z�Uf�\�Vi\�a�\0?\�M\�)\rG\��\�\�o[�2􂽭�\�u<�U+`e\���א�\�,\��uK����rr^�\�\�/oY��\�\���k*�=nQ\�|\�\�\�\�uf��\�IR\Z^�\Z�Sg,�\�9,\0\�a�$l�\n~t$xM�,>O�����(�\�kR�\\ *�cj._�	�nT٤�\�.�\�\�n	\���\�QXm�\�\�`�a\�@b�_cmL��\�![\�\�\�#=N,\�\���ēmJ�Q�{9A[%�j��LKm,����`A \�F�W\�|w9�/��.�\n\��\�H��\�j�����9�\�\�\�m~�}��5�j\�\�c3ϯ���6k�R_\�o[⾄�4PV\�\��K7\06\�֔�\�\�>�\�m�\r-�\�Aj\�\�\�!{�0bϖ4\�RS�zmb	\����$�]��+}�jM[�H�M$?r���)��N~Ü�w\0SGwb���6\�`\�\��\�\�\'Џz|�����S`\�F\��\�%\�(\�n\�~\�~�?}�;ԙ�* \�/6<��\��\�\���O��\��\�^��?��K\�89�\�{\�\�\0��1쭍\�\�ڀ\�\�z�yv\�\�=\rA\�<�^\�\�A�L0\� x�\�KX\�\�֬=^���\�	\�趡�J\�sg�9�y�c�^���\0\�.)t\�<:\"�zW^��;}�,E��\n*\�\�N�\�\�x͢O`\��D�~j�K\�m��\��\0���h$>��r\�q\����,7�\�r\�\�\�׭?�\�\�\�n�nx�\�\�\0�\rK�z\���\��<�<�Z��ox�_>O�V���\�ţ��#�s�b��=\0����	\��\�S`�\�Wa{Oe�:������2�y(\�c	6\�g���\�M�\�\�Cy/�\�\�\����Y�}v\�\rA}�\�\�\�kЋ\�\�����gmO\r��\�#�-1m/�ۖ�׋�e~�\�f:\�$�\�ӏ�k�QV\��\�/�V\�Vc��\��\�+\�\�|g9v@Wے\�v5g�\�\�@,�2��Ƣ\���Y\��n�tu@\�X�9@�\�\�x�mwaƞ`\'�bC]��q۟W\�N��6��&*C�!=��\�\�\��\�c�O	�/P��7�7�szX�5`�ޅ�\�ŋ��~{�\�k�\0\�[\�\�[~�RTu��~�<�$�)�\�\�\�\�{\�r\�y�\Zc�\�kü�{�:�\�N:ԁ$�\nu\0�d��\���o��3\��/\�\�y��<~\��|\�>k	p���\�??\�`��Ϸ\�\�ξ+��\0\�3eG �G\�\�bW�\��\0\�K�?�X����G[<w\�\�&h\�\�r_\�J\�QҐ���u\��Q}�~VY:\�\�_���\�3��\"�\�6hP�\�bw�ޚ�a\Zu\�W�i�H���<��T\0Pƕ:�xZ%��z��G�yZ\�R��;�\��J\�Q��(kM�\�	n�Bs\\�K\�iN	�ƤP��sSo\�X~YT��G�\�{��6��\�\�x�FRg޺n��=+�O�\�J\�\��d�\r�y\�\�~\�nZJ���&\\��\�~\�\�\\�\n�_@�\�\�\��I8I\���+0>L�R]���l�\�JS�/�OS�\�-o|�\r�~��{L<\��S��i��t��T]|���L�\0��/\��k\�!�V\�7�7�c\��\���=��\�\�F\�\��xx�\��Q��(?;b��^;���~�9\�j\���V�\\\�@?V[\�s\�x\\�\�;`�\��>/�e�r[\�p\�N؝�s\Z�֩t^|>l��*XA�l�\�[\�]�\�\�8\�P�m#��\�Yy�\�V���e.P�vQ,�ܳOQ�O!�gJ�[\�\�����M��\�Ss\���$.H~\�\�?�뷧\�X\�	{��U\�*u��\�\��ƻ�\�P�m����a�\��D�a��W0�|�XR����|��N^,\��\�a����������f\����@�P�k��^\�\�\�x�_`�_P?�\\��zZh�=~\�/bzT�O\�t�\�?\�& l��U������8\�ߣ��O�\�u�\�9\�s}\�5�|\�����\���\�\�?��\�\�c@��!E�\Z�/\�?\�o|\�xX(�\�\�q[\Z\�\�\�V뮭��\�\�eY�*��\�#H~\r\�\�2uPA��c\�A3D\�$���\�\�Nr_�&jʁ\n`udɿGZs\Z\�۷$\�Yk< )\nya�0�҂�b��\���h�\�K#­,잕��Y�>\���e\�\��k�\�{Êo\��\�\�{\r\�^z:���}�\�\�\�5\��#,%\�\�R�oX��������y���0<\����w\�q\�Y7`v�<P�\�\�ʩW�O�\�e\�$\�d�:���M�~�{N\nL�\��\�$ ���`b�E�\�t\"\0�\�\���Hy��W	�<^ׁ^Y,�??\��\�c=��\�?�f����Ɯ\�h�[#ѱ��cx\�.��.5�\�\Z\�:�)\�|3�n.�ن��϶��|[h,��&T@�A�-����\�6�\�\�U\0�\�\�{�\n�z�ɮ�`&\0=�\�\�W+u��n��_�mh�\�\����{��\�3�~m�f���Q\n�\0\\��_ �/���td\�\�\�1�\�9��%?�F\'SܳJ��L%��v\�6�~\�;\�\�\��|k̞o%\n����s�uJ�\����i��;� <�\�ӯ�ƧZ�}�ޤ��.�\�m�y���:���F~�Ӄ){��xǛ\�Q��?��TmGpp��J\�E\�\�SSN�\0�ߕ\�\�=��w�{�\�\n\�}�{o\��\�u&/�A�b�]�V\�J�u|.��v\�1�\�N܆\�\���\�s?\�紩�����6�\�\Zs=��6\�\�i=\ru֥�jd��~�\�8#\r\�P#\�\��c��z\�a�\�4Ϙ$��\Z-��b�\�\�\�\Z[\�Ң�^#����5!ʍ��\�N�\Z@u�g\nNyd >\�m\��\0v֝ +��\�[>�\�jpe.���|��ӧ\0\�\�+\0�:\�\�?����,\�;9~\�\��\0\�����\�M�?\�\�Ξ�\�O[�3���۰s3\��k\'y�$\�/��}�>\�\�e\�\�Xi\r\�\�P?�\�G\r(9(�\��2oܴ\�\�`T�\�\Z�\�L\�^��~_w�b�	�\0\��\�\�\�u�5\�\�\�`u\�\�Gs�=��\��x<3fO�P�\'4\�o\\cV¶e6���\�\\w�\nԨ\"\�Fˤ\�Rm�(\�F�l�\�<C�\�MW\�\�L�f\�\�LC�i��L��|\0}G̭\�A\�Pn�\�O�����q�@?���W\�\�*p�\�\�n;\�S�t<\�m���\�ܷ�B�d��7ً|\�v)Ǯ\�\0�,\�U�����q���rf�>7�\�F֡\�\�%\�d�\�X�\�%\�\�\�*9G;|3D�np=V�/��;�G\�\�u�\�@\�YJ�q]q\0�\�p���;ڀ\�\�pX\�\�#�ݙ�Y U\��ɕ����zs\�\� C^c)^o�3�=ǃ�_�\�>���G!�\�FG��\0�6�P�\'@\��ɽg~�\�\rAD㺞�(���rUB`rޟ@�\n�{@\�߬�}\n5�Й��\0�S>~FxN@x�rC7�flo��\��huڶ\'m~b\�F�Ѓ�Un�ߧ�d����\\)��!<\�\�\�\�(�\�K\0|�z\�\��i\0\�j\�c�\�ץ\�\�)H}X�1=Ѫsҭ*C���>F�6w\�\0���@+�d�w¬\�/̊nݵ\"\�[�\���u�\�$�}����I�{�X\�\�`K�bɾ\0�\�{]�\�+g,��zp\�\��\�1�\�e�\����\�\�\��\�\nW�\\�9T���q�\���W�@Ձ>\�\�*�\�k/\�$�d�22�ߴ2Vk\Z@�\�\'c�\�&�]�\�\�R]l�w�=���5e{K|��\�WXqe\�TA�H\���\�\��\�#d�#��C��\�`�m�U\�ZW	�]\�a2m�*݆�R�_]�2Q[Y	֛k�Y֝h�\�!6���=�0\�\�K\�m�*\�&k�\�d�\��\n�lPV]��� ��:�\�i\'\�c#�F\�l��\�f��m�0\r5�\n���\�^{��\����[��Q@�<ģo�5\�H���\�\�߲>�U �\�W@��\��\�{m{��y�=�|c\�^��\�\�9\��\�\�Q\0\��ü����O\0$�V�\�Ϗ\�\�\'0+K`{\�\�\0\�\�v\'\�&�*ao�\�6�j\��d���\r\�\"�\�h��}%�h\'��\�\����\�RI\��\n<W�s�9\�\�ut\�|\�B�+\�m\�Ia�>԰S)ï�\�y��ag/����A{I\�{�\�\��5�[��t^�!�o$\���P\n/�?\�Y�\n,m�^�<C@P\0\n�����6\��me�Ϧ{\Zl��\�M�\�)*ƿ\����b\�s\�j<\�)G�;\�\�\�\�\�\"�� \�:�b�=9���\�D\�\�ۧ\�X;,ߒ�h\r)V�]}�\�\�[ed����`ʲ�`C�,0\�\n�\�Z����e\�\0_�\�\��\�žw�Yq�f\���}��?}_\�G��ݑ\�yK�t�\�\�_:�2��\�\�kWx�?�\�|�f\�!ݱi\0=U���\�����\0\Z�L��\0��e��ٷ\n\�\�,\�\�u�rC!ǫ�\�\��U\�rs\�\�\0|d�C����j \�\�U�\Z�ǻ>V\r\��$`��D\���eg)=��V5�\Z_6i�m��Uţ�bl�\"%b��֙NPU�r�5ǆXW\�=댽m-\�׬9\�\�Z\�|�-ٟ��\Z�\�gb≼N�iJ�\n��*KM���V�$�\r\�x{�\�v��\�#%�����޼\�\�ʍՔ\��;\�!�\�\��u�L\�U�N�`KdG�q�6\��QY/\�\��7`��	���O`\�EŌu\�\�xA�\��&[�@7��}�\r���H\�!{�h\�^\�\��9W�n_�\n\�\0�\�O6�כ\�q\�+�uE\0\�\���Ou�m\"��6k�\��`�\�^.�:#\�R���\0���R�w��戽XW\�(�\�ƃz���al��\�{\��\�Zʾs{Q ��Z*�E\�-!�\�:\�\�|;����\�^.\�+��E�\�/x?J\�y�\�\�J\�}C@y\�?ӱ߮T���\0%\�i\nJ`S�\�\����۵y�\�_��g\\��\�\�S\�S��\�\�\�k���\�e\�	\��\0{�\�\�\�d{v\�݈\�B�\�V  :�5?\�\�r=\�1۲b�-3\�\�3\�#=\�ZS��nJ�sM\'ꔑb�\��V\Zb\�!,>�D\�\�܅M�]}\�\�[��\�ܰL\�\�߾j�׭:\�\�*#|���g�x\��~���\�_�\�\�nc/���K�x>�l\�0�\�iׯ\�\�_�4���\�uA��\�\��\�K�퓥|.�\���\�{\�2���>�\�\�\���\�\�׬�\�C���,��f\�w/lƍ�9ˍ�\�oV\��M���N\�\�f\��\�\0��:Yy\n������M���w��RӆB�+ۏ`zۚ\�o������֖\�c��~V\�o�w\�Xu\�mk\r�i\��W���)��}\�*�NYU\�ykL�����֑�%�p9���Ph��\�G_bӝeH�Z��\�~G9�M@�%\�5�[GN�Mb��/`����W��\�5����4\�\�<��\�\�E�hj��9�\0�\�8�r\�o�=\�m�{lK���CM�d�֞-��n{\0=>�-\��y�����|��[^�@J�\�V<W㮆b{�\�?\04͟ӎ����7�LSD��*w��?\�k/���\�\���N\r�,�t~\�\�;\0����\�\�1\��OW�\�ڏ|\�\�\�8\r&W\�<�6ה1�M7��(&�bo%\�\�-�\�#$\�\�T+���`�\���w\���8\n0\Zʩ�c��Z\0�[�\�S�������ى\'�]\�\�\'�^��\0�\�\�\�\�)�W�@�>d۰\�2\�4\�\�k\�m\�6Tۈ|/�nuT\�\�t%�\�\�wR>��0_\r	J\��ӫ]V[��\�5\�Cc�\�~�����N+��\�裭!!\�\�c#�62\�jB�\0�=����\�Y�=_���U�|:r?\�/Ȳ�	\0w�Z\�]\�_���b\\��z�\�\�kx}\�\�Qg\�|-`�\��\�o\�p+�)�\��MT��\'\���	 �\��[��\�,\�\�\�f�\�\'\�	.Wn�u�/\�OȾu\�\�\�{-\�6չo�q\�\�\\��he\���v\�vU�J��ޞ�#�����\��#�Ͻ�f\�4�<ubu1���ܰ\�0/�\�e���hU\��&\�U޻he~�C�-ˑ\��y��i˾��e^<jY׏Y�\�I���{W�*\�5\�߶\�h���\n\�W�\�p�ڰW��(Ko��\�\��\�E	\0=\�ZX]�\��R�@��%\��`M�L� C�u\�B9nj\�\n��6Vg�\�\�\�\�=�=\r\�g��0��7�\0�\0��ǖY���\�b\�L)\�_!\�\�7O\�Ϭ_�\�\�ߟ.lXU岟6\�\�ҙ:`w\�\�*�! (\�Vm�> �\�I\�z\�2��\�BC%6����\�ma�\�; �\\���뿔\�v��\��9��),�։�\��Aw6�\���\�}�\�FF+�\�s�&�kO@�����_@�\��d�\�v�֘Z*�\�&�C�AN�\�\�\�>�ޠ˷W9\�{�v\�xT�\�yy\�\�L�����Q7�q���aj�ᬁ�tn.�6�\0���$n�}��9�V\�msn֖\�&m��\�z*����\�:r�\\�}\'K�Jz�w�xH_\r3��\r���׶��[f�u\�?\�\�\�\"a�kH��}<��q\�r�\������\�\�\0��UQw-@�߾�\���\�AH\�\��C֫c.�ڥ\�*+�\�-\0#\��\�Z:B\����ҽ5,л͸��+O�=?+�!�|-?\�\�r\�d�+�\r�\�\n���\�ޖ�Jȸz\�R.`n9;�\�w\�2Q!%֘f�i6\�Z\�\nI`��rm��MT\�Oh:�K�\�/Wg\�9���^pZ\�/�(�a�A�\rՕ����֜k\�Ygx/gxs��[��)˽v\�r���\�G-��	K�:k)^g,\�\�\�_8\�tj<W\�\�#�x\�GK=wܲ.�����P����2�G�EթCN�\�\�\�ج��\Z��\�96��ɺ�؃�\�P�ε��6{�5|�쾽\�5\�U��\�6�\\1�f(j��N�^\��\�߅�N�\�ù>{0�\n�k\�ZT7!\�\�\�@�\��\�Rg��6\�\�Js&�)\�>{\���~��\���/\0�w�=\���2�[\�`\�y�i�\�8�\�*�|�\�R���\�)b�\�\Zp��i2\���G\�\0��Ey%�\�ձ�\��%�Qxj�����\\\�r�UA\�\�p)X\�\��Ҁ\\,\�mX\�[ ���\�]��\�kڹ�D�\�a_\�\�5\��{ܦ\�c�QOW`P:5\�oq�5�.����Y\�i��|�O�ϻ�a*IgW>5�g��\0��\�\'\��^�,\�\�\�܄-��\�T���47[ou	�?���[���\�RŞ�m9�0�l�\�~�QFJ\�\�׷�yX��oF\�7��$\�}b�\0�W\'\�H$>,_�ǯ�\�&�\�\0񮕅\�[eT�\�\�\�[ix�\�\���X\�m\�f[\��Q�;�W\�\�;���~�p�\�\\�������kSN9\0jly\�5\�,\n�\�\�;���0X�\0\�����[<z߲<�O�/�\�\��	@!\�\�\n�X\��>�@C;���\�Yq6]�o}�x\�6��7��\\�@�1k�to\0z�\�7=\���׆푲׸֐�㭵֎}R��+\�-�\�YK�z{r��u���|�+\0]G���\�!\�G���^���,�\�Y�9s\�\�Ξ���\�,\�\n?\�ke߼\�L5g���\�F;;m��\�\�	8����,\\�[r�\�\�\�\�	��|�;�{�|�EE�\�\�#\�\�\r���m�\�ߝ�>ۙD���>{D\0x�w�0\��:\nɉ\�G�mu�ז�\�Mf֐KMXn*�\�\�?��J�(\������_\0��\�\�x\�`�\�e\�i��@\�\�\�u.C�����\�tc\\\",\���\� k7\r%X\�O�ۮJ��������]\�vzm�:\�#`\�y�XT���\0�\�k�!��\Z��\�rGw��Aǋ]�5\�3.���4���pv\�jǗ\�\�t/�4��\�!�\��r\�\��Ȟ��_��\�u\�\�\�\�3\�O�}���\�\��_\�뀟��6\�\�\�J���~{{X�+Ӷ�0o�\0��\�z�t�ꜚc\Z\�\��\�}�W?|7�,?\�\��Z[N\Z?\�:s<I;j����m\�)�@g�\0\�\�)�>.\�*4\�>�j\�H���ڼ\�+\�Eb+r\�>B_q�\"~\�s�����\�\�훷�g�r\�_G�\�-�\�d\���[�\�\�JB\�YA`�\��F�������\�\'�\0\�VI�\�i\�ݱ�;����\�\���\�(Բ�\�\�\n\�~\�3\��\�	�w}�).\�ƋSm��\�\�5\"w5�au%Y\�T�\0���?��1\��p�k\��v���\\����\�����r+���_?7\�/�\��9{�\�.\0h�\\\"\n#\�\�\��[\� +	\�o�\�ߏ�yǒ��Y�o�:{ɢ��\�\�׸f�g/�,\'[�[`\��\�6;���1[\"\�Jo�0\���	\��(4���99\�Ƹ6�>����,�\��ڬ=\�y43d\����n@\�c�x�;z\�~~\�\�\�F/km�K\�d\�`oe�1\�kk�6\�\�hu%\�[Wa\�\ru0�6ԴSX>\�\�\�ߟ,\�\���wL/\���{�>رw;廒X\�W׆\n�S��\�����\�\�-��\�x2��\�\�*^\��\0�=�^��\�\r(C\�>F\�;\Z}�\�q���\� \�\����\�%��\�\�鞳b�xʵ\�^�����&<�\�k#�5wgT��\�w\�#\�\��\�9�[��\�Ԁ\�-\0\�:\�h\��\�x�p�(��\�\�}�\���\":�t\���rm\�P5:\�\�G�(��\�����e��\�\�\�_\�\�(+���\\\�\�5��;\'��x��}쯾n<j&^�=+\�ڲ\�\\3\�\�s&�\\�e5\����p��\�0@\�\rt\�r\0S>\0-\n	��\�0kJW2`#��<\�\�A�\�?Vϼu���\�z>�^p���g<�rJx}ס�\0S�����p�>%���0��q *\nVY�\�v�[q����\"�!��sϟ���\���Vju\�I6PVh�]\r\\�.\�ý��Q�\�3\�\�s��wL���\�#�?Bũ�\�\�	۝�5��Dw�5��ZIr��EX�\�K��u\�&˟\�O�\��4��\ZneQ�\�{X(\�#\�r�-# �RP*\�\�}Q~����X~h�\�d\�Yw���\���2_�\�\�4�Y���$Ř����\n3\�2o��\�9@\����\�\�5{\�k\�,�\�.��\�w\0�\�)l���\�#\�bW��\����v[n�Ց.[U��0\�;n0�hW����\��@�@/_�\r�Q�	�|w�y��/I\����g)\�\�M�a)�\�\�\�47���\�z�sw\�\�אW���\�\0�O\���\0�d�\�$\0֗�P��6uί��\�����\�=��\��[O p�\'p�t��j:�כ0��\�	\0*�y\�M�O\0x��\�1�?E�$BnT$ݟ\��Xc\�>�\�\�	\��\�\��PU:�� �\�]��v�5e\�\�\�\��~Sg�J\�E�hO�\�U\�\�\�3�\'ϐ�ω޲**]\�-5�n.C�5��\�n�=L\�\r#�d�\0|�@n�g~}6��\�N0h\�Q�o+\�\�Mk\�O\�*�=��\�z\�u\"\�C\�WD�\�\�\�{\�n�E8̔v뺕D\"���差Z��6����\�&ϻ\�\n��\�\0�\0?�W9�wa�@@�B@���\�0��	�ڄhkJ�z��\0Ʊ��\�y~�A}�\�YI�\�̺�@�\���/߃�a\��{\��{�HˏH�\�B\�B���\�QS}�d��\�,)\�n\��Qu\�	\�\����z�\�ĕ&���\���\�ꔭύ\�\�\���7uXqv�eĤY>﯄\0V\�+ð;��Vc\��إ8�\�\�Hj�զF[yJ�ǇY�X]� <\�\�\�r���\�z\�;mfr\�vx/\�wF\�ˇ\Z�U�e���\�Ym��f�=�\���\��ɊL�?\�Z��(\�1d|�mkO��ǇJ��n\'\�\Z\�t\�y[�H��~�t����|\���۞\�\�-\�\�ܔM��;�v�\�>��U�\�k�\�\�U\���|zy���]�\�\"quv-V��\�C�\�\�D\�_J��k�LR\��\�\�ŀI\�}M���}\�B�\�N��\�\�S�\�ޱ�v0�a�\�;@�Y��~ϳ\\�\�����neѽAZ�<�\�\�Q��\n#\��*ʐ\�s\��>j/��h�\���\0���Xm.�\��>(��\�\�\�5\�D��!��pj@���u\�q������\n\�\0�Ŷ\�\��\�_�\�=�\�te�\�\�/m��\��]}�~W�$>`��s�<��\�9q�\��w\�e�G�˟\��Ymى�w��Q\�㸑a�r�͒��w��n\�/Y�\�\�V��\�\�s|a�7�Vͽ&V�-1:�����;\0�,,\�\�e��5~J���W:p��h\�&��*&µ���T\�O�c�R~����μwx-�\�g�Ѿ�\�m~\n\0\�������ɱ�\�J�\�n\�zm��+/\�\�\�O�f��\�\��\nO�\�\�����\�|m�\�:=j��}\�Z_o�EV��l\�\�\�\r�I��\�3S���\�L�m\�\"�6��j�⬒����U�h�\�<75\�Z\�*l��\�f�a�y�/�\�\�\Z\�<Pm\�\�\�6B o����\'\��Q֘�jI�\\q�\��\�\�\�\�{��\����6Q\�\Z�\�=�\r<��r��_UK���\�\���\�\�FlM��Q=�\�߸�8k�eP��K(\�*�m�^��03`�7g�\"�_ 3���\0�\�y]�yS?9���\�J��\�/��>\'��\�3�ZO�5�\Z���\�X\�\�Ͷs!F�\�k�\�AG[u��\���}|\��~J\����j\�L�/)�\�v\�\�\�(�w\�\�{�>V=�&��\�\�Q\�Ag\�m>߂��}\�\�S\�\����[\�Q\��\�(\�c�\�m\�#�PD\�i\�l�=^\�\�\��6\�P\�I�E�\'�NQh�PAL�n����\�_@\�<\�����Y\�k$\�$�3ɶ�I\�Z\�C�8:h\�C�66\�g�}�\�\�\�b�\�\rVWXe�y֓�n�iםg]�qH|u\�\�$\\\����ᇼoA66�j_��J�t=��ab\�\�<��\�[��\�?�\�a\�h\�g4=\�&�� J�\0�@�k�N�R㴢#\�\�\n�U��:ej�A�5\�ܒ�\�\�\�V\�Ϡ\�yM~_y�K^%Q\Zr�\��ZU��U��Z5�Fg�M<�=>\��\�xY�-�\�\�[��ms�X�$:�\��!���&y\\s\n`k��\�ױ�>\�h�\������Qu\���\�:k�-��blR!�\�|T�\�^Q`y\�U�m]\�9�@�a\'yiV��f��V�c�<��\�F\�m˸=/r���\��T�-\�g\�`�\�I�v\�}3�\0\\c�Y�\r�\�\�F�\�6V짗{\�\�\�\�\�Uc�1��{�\�#\�\�d\Z�:9\�l�\�ҬE~�\�ħ�\�}\��{��3\�=�N�\�Z_�M5\�\0znRwd�xF\�?\�f�\��\�H\\e؉\�u�\�q�εZ\n\0|~p3?\�`��^>�|I�\����\�|<\np\�\�u�}�\��˫y\�?�=˓f+\�\�\�\�Ū\�Ք:\�4>�S\rI�W�R�un�%\�z\��_H\�	�:\�\�\�x3<�Sz&�H\��8\�\�\��k�VQ�\�Dc�\�R\�#\�\�tbY��ߩ;7�[\�W\�k$�6\�J\��߿ѩ�祳\ZJ\�d��\�0^sؖ��\�\�mf�\�F{���\�:ꚭ��\��4\�6_�b�\�\�֭\����\�\�\�\�\��홰<߂�\���j��F�g	��H��Ul/f\�9��\�}\�vi\�m����\�\�\�\��\�\��\�\0Q^�ƪ�\�yݪ\�P7��.9ځ\�\�\�\�=\�ؚ�h��\�\�\�|��p��!\��[	~�(𶕅��~V�̯��ڈ�,@\�\�n���^�\�HQ�-4U\�}n���^�#�Z����?\�\��݂\�W��=`\�\��K�\�\�� �\�c�C�\�\�Xnm\Z>Y��*%�V\�Zou��\�\�@m�{\�\��Agq��\�!\��)�\�:\�jl��\�\�;lk�\r��\�\�\�\nr�\�&ʓ�-:\�\�­;���	Ha�a�Rok�͛!\�^\�n|���֖\�^Ժ\�\��\�\�buO���\�\�\�R=�Q�;(\��ؗ�HU�8�	Q\�b	\�\��P�mtd\�DE�uf�z��~\�\�ut\�h~���\�\r̍\�\�J���l�\�|n\�M������\�N\06\�6\�\��\�։x�\0i�\��\�\�_��\�-\�\�\0\�ᖮ�\�����\'��N�\�m\�i`\r\�o�}���M�\�\�F�\�t��ڷ\��^�z�s��I�\�0\�\Z�\��s���Cn�\ZK�|�\�t\�T.�H\�\�G\�[F��\�#�ܔ���ѱCK\�!��(\��?\0�\�6������\�iɥ�D������\�	^�S\�\�\�\�\"~m���[��\�!nʶ�-��z�l˷�*�n�h�J:\�\�<�\�%�x�ɦ�y\rbZؾZ��\�\�+�	\�Kk\�\0:��\�\�\��,�v(�A��\�xn@_+WiH&�T w@�u\Z��i\Z�\��\�\�&�\�#��oH�\�k�V�T��\�j�3����c�*Ae��؂�(�\0�\n\�OU\�]\�\0@�\r�z^�6�@\�{��\n�z�D+?�B\�i\�\���\�\�,��#-]Wmzi\'\�\��\�S�:\�`��K\�s\�=�pz\�\��\���\0Ry\r�7\�Pk��ʠ˳��sC\'\0�X�\Zdָ�y\�j�M\0p(+�Z]F@��a<��\�\0\��C��\��Ȩm \�\�Z���(���\�����֔��ȴ!\�\�B?�8\�\nf������\�~z�\��O\�\�\�u�Q\�\���g\�\�.=�<ǽLpy��mY���\�5{�x˞��<�:�\����\�f\�l�8\�3���\�[�\����kp!F�|��\�\�\�.�;��qs\���K{�\�<~\�m�\�i=�R\�k;7����|�xQg��\�b�H\�S\"�>y=�.?ϣ\��?M�\�Z�{%Ȩ�Nr_���\0z)�\��\�\�\��j��`\�6y��f�����K�dY\�F��\�qΆ\�\�̨�ZR���J\�U�bffffff��q�>\��\�\�c�\�\��}?\�HΜ9g������\�>\�\�%4�\�:�3\�	\�\�\�\��)!t\�ÖuK�1ڋ\�wY\�z4RS��o�9�\�8\�\����x�y�46�����\��h\�c#yX]X���S��\��>�i�v�_[P���\��$d�7X\�E��TGCh�\�Z\�u9\�\�b\�\�q�ё\0\����_U\��Z#\�9�_��\n�~�\�\�\��.aލȶ۰\�RXC\�\�\�:J�r&Zx��\0z���y�2^�:@\���\�{0\�\�wu\�ݻ��؛߾=� /{\0�}\�\��B\�߃1 �`ŌR~��\�+�})��r>*�\���Q�UT�\\n�4G]\�0�<6������\�r\�1��\���6\0���7Y\�す\�;\�\��[3#�\�ߡ\�\�\n�.\�R�[D�(fI�ˡ\�U\Z�q�\��W�5����Ɛ� ����N\�8�ڵ\�\��\�VM\�a�oqMb0�)�MJPw�Ϻ�\�\�{!Gc��^N�i\�[�~\�\�T��\�d�,K�\�{\�\�n\�\�ۊ;��ߞ�\�L��g�v>�\�\�8=\���\�i\�ՠ�{˵ޔ�\�jztS�w��\��\�;�R�7^,�\�\�I^�_��N�\r�2\�w\�������5��\�\��/��\��|�8\'��d��3�\\�\�\ZP���\�\�\\���?�\��\�\�#{\�}����}��nzo��`\�~�\r\�?�-3L�#ϽN���\��8#\�\'\�7\��\�\��\ZԟI�c\�sζ\�zg\02�0,�:�F�\nK<\����h4�9�A�}q���5ڎ�ma4q\�9�-�\�\�/�!i~\�<���\��\�\�Δޓ����7ߎ�a̶�\�^\�8�\�1	�6\�\�bZ�s��Z\�\�\�dk�F��8��\�bⵕ�� G�\��\�I��&�97C\0\�~}r��R#9^�)q�Iq���\�\��!�\�\�\�Q\�\0\�\�9�q\�r��W;�\�Eގ\n^��^�\�n\0ru\�\�\�?d�\�=��]�\�0�\�8\�{\�4\�o30q�F\0�_\�l�\�|\�-@~\�{�0F\���\�\�\��K)\���.�~�ݔ�HC�yZ\�j��\�\�\��Aכ\��Ђl\"�vL｜\0\�a�\�c\��\�Ґ\��ų��\0�v�5��\�.�\�}�C\��\Z\��\�\\u)ƶTC���#P\���\�\Z�&��:m����\�\\ǹ�\r\�];+4Z��\��+a%�1=CmY)\�ɋ�\�]\0(\�\�d;��\�\\\�[\�\�sǌv7qZ\�ii\�tA\�1έ\�q\r�ywݲ)>��1��咗��Ǝ�m\��\��\��\���Q��\�:\�8���\�R����\�p�\�~`������5\�S�\�5Cv�=�~���\�kл�M�ּo\�\0�e���y\�zN���vf��\0\�\�q\0\�j8\�y\0k0�<�݃�{��_ޞ>�\'B���t1��\���{`�\�\�t�J�w�}&�9\�\�F�\0\0\�\�,�\���Y\�;SО�\Zq�oO���\�k��ui�Z\�\�l\�� \��JC�\0�%������#:�<{d�>��I�\�!�V�\�k\���	4\�$c\Z\����aӎ\'�\�\�gH�}�\���e\Zh�TO]�:�@�\�\�֒�9Д�\�\�D5�\'�>�\���\�F�\Z3����Tƺ\�=\�_�:�\�u��~�;��<���m_�\�^�8@X��Dt*\�e�\��\�w�\�\���	�<�C�z\�%L�O\�\�<��*�N%���\���֍\�\��򅰊Bw\�5��ơ�\�!p\�\�{x\�$�T��rOf�\05\0Ơ\�zi\�\�\�;h\�\0\�6�{״�sd��-�!K\�o\��7�ή�\�\�sJ�y�\�\�hu!��+Jx\\\�K\0}�F\Z�B;\�1�?��m�b^4�T\�\�f�\��h��Wh�)[CE�Ԓ\�.=�H�|dA�ڹF\�\\�z�KwI1@6f�a�{�����6\�2�W�6ǐza묇�\���-�timj�9\� q$\r\�x{<Q��jJ\�}�\�=��KQ\�\���\�\�zt�%�8�$F��z\�7g�9�\�\0]\�cN�\�Py��=�\�ۀlJ��\�\0�?1~~�T�G�R\�΄��kgo��<�\'9�\��^�r}=\�{��< vk+\���^��R]$\�͠7�Ǜ�U\�\�_7��h�\�^\�����\��(�w\�\�v`��a�\�\�f^]x�UuQ��x{W�	)\�\0\�+��\�\�9Gyw\�.\�tkt@\�CP��^mpa��k\0Л��\�+\�\0�۪g\\�L&��s��\�؏�\�a/��f�\0{0\0N$y�!|ʹy�*\�\�b\�\�\�\�3��f��x~�9�Չ͏�i\Z\�4хwjo\�HKS\�T\�U\�2۩\0>)\0�>Ч�o\� +5H��,�\�\'\�D<wZ��\�\�M�\��7�\0<�o�^��PU���߾�\�\�:\�H\�[9hho\�D�@\��}���z$���}��\0\0v���*�}\�\�P1�\��u�r\�\�K\�w�0�Ԛ��G�\nl+�\'\�I\�l걫��\�mo��W�x\�3k~����\�sa��l�f^g�\�\�\�[����\�\�\�f��T!��j{��\�\�i�ѵ\�5\�Z�\�Zmt\��\0\�\�`�v���\�]�\�\�|MT$h�$A��	\�+\�\�p}��0 ��٪\�\�R}����\�\�1�;̗]\�{��t+�T=e�l��Z�\�_��Hj���\�\\��\�>�?#gXrE�rM4ĩ=\�*O�\�c\�*���\�G�\�\�G�)\��%���\�W���\�S�\���|M��|	\�^fo3�i*\r\���xM�\�s]:Ь��`\�9��\�8t*\�[��\��{��vx3��˹\�D��\0\"���7�\�\"�xc\�Gr\�\�����#@�1�\0?\�\����\�L�WE9\�\��\�\�T_��?vV�?\�\�s`*6��\�г�Hν��\r:L�gL�=/\�\�x�\�hǝ\�a�\�ږ��p/޾�7j\�M���\�\�Z\��h���f\�9��CO\�x��\��Y�C�п�\�\�!_�����F\�%���Ѓ�|���g+�h\�)�\������>-�h��[���E����0���\�Ք����̰�\�\�;[�\�А\�h�D4<��`\�RZh�\�T]w\�x�\�\�B�稽X�\�jbc\��\�s}���)���Wb\�2]\r\�O��x\�x\�[\��s\�	\�}C\�\�ؑ\� T�6\�)?T��\�\�ˡ�e����W\�gۋr�9�\����WH\0�y2F;�ܓqq�\�\�\��8\�6D��s�\�\�%���-l�5k��B#5�\�1\����x�\�\rcLC�\Z/q��\\�&�Ts�f����\�_\��E>�R˨\��z��Ʃ�\"]C����z�7T���D\r�\�j/-ŀ\�\�\Z\���*\��п\�r����v�x\�i�mZ\��ݦ�\�\��\��d\�+\�ol\���� \�RN�\�\�J�\�w��\�Ϻ�\�;���\�>�G�=�\�-e޺��\�w�d\�\�щP�\�E\"~��z\�\�\�.�9s\�-�\r�>�OV#��\'�\�\�l�\�^\�~[Xi\�\�d+��\�ؒ\�MMu�b�v_z�\�\n%�\0���?�7d��\�,#\\�\�Kt6&пD���C\�s�\�2�ʮx\0\�.��;�\�{8�P!g\�5��v\�Y�sf�U\�\���x�&�ݚ\�&�\�\�4��\�\�++N\�\�\�Bg�:*\0~%:�\ZP��\�\����\�O\�\�O\0\�\�\�͸Ha�7x+7t����\�B}<^b|�2���&�,uF\���\�~hzt\�\�[\�\�LO�\�;\�5\�\�֊��+\�U^�\�\�\ntj�zJ�\�Y�D�\�8��a�=�e\�SY��ݮ���#\���hm{\�{7�\�T��\�c�z�\n�^�\�6}�\�\r\��0���%n1(�\�\�S�\ZJ�׹\�6�?4\�\�\�t�<:��n]�\�\08\�\��\r�\�\�y\�\�0+ZV�(\�U\�bd���4\rx\�\rF9w������\�\�Oq��9o���\����5�\��N!\�&y�sJ��;�a�U\��B\�\�(z}\�?�\��-V`�\�q�\��w���T�\�\�(u\'E��1�~MÙ\�՝�fk��\�j)|\��\�i��A\�-�\ZGk�k\�xK�溼4\��\0��\��ټXf�./2W\�p�����Pb\�hCe\�\�\�Pz�\'ȗ]\���z�9S\�iה尒��\\>�Hw��\\��ޯ�ߝV\�\�kʽ\�I�A�^r�\��yk�\0�셝o\�D��f\� ����\�v��tU������\��/��\�=��\�cyG��n\�d�\�8�\�0�\�3�\�N\�oO�\�O��O��6(�\�x�]t:\�\�G\�@�7\�\�\0��\��\�F��X\�G@\���\�\n\��}\�\�\�0xªë\�o\�e�8��\�rkЅ�X�yƏx�\�M�H�\�*�\�\�l/\�k�^\�wZd���]c\�\�\r\r*���Zl���\�i��\�ۢ��6\��k{��\�\�he��X\����\�e��\�d���c�\'rR\�4�u&\�\�\�\�ѭ�A@ߧ��n�]�V\�;��^\�s�ը��4>С��6\r��k���ը\�\�j�Ua\����x\��XUƣ\��֕Po/���F���W?��\�[�u�8\�ޣ:Ɓ:�\�퓝��H}�\�T(~z<#U���(ৄ����\r�G6\Z�;Vq���\�2\�UU�ʻ�\�]gxw\�\rˁ^�s�\�:%\�*��ڜ@-#1\�N�\�C��Jl(`2\��\�J\�z\�>õנSz�Qp>���k\�Ux\�hx�+��x\�л��\�j�.W\��՗�\�\�4V[���l�z\�.\�ʮ~�\�K_��\�ת�qP\rw���\�	�\�<��\�+�N�\�O\�dE�\�*���X��;�~\��\�\0o\�,]\�\��gz\n�4Ju/\�*纛\��-��6\�]G\��vB�Ql\"��\�sՖsK�\�x�o�\��\�\��C�w\�b��Q¹J�v6a�*�5P��ެ�z\�[f��z\�\�0xdSh7�\��W�6\�I�Ǔ�\0�r�\0\�\�\Z\�o�\n�3\�\��x�N.Fw�~\�Z���^ޕm\�~|�}(�\�\���\��\�y�x�H%S�\�\Z�k]��1B!p��w��\�M�\��\�<\�\r_{�]\�\�]�ׁ<�\n\�K�}~\�\�4�>kлx\�K�\�m��y\�\�\0n׺�mЇ]zMx�Hs���\ZF-޿^\�X\�0\�{�����\�n(X�\�\� y����	d\��f\��-�|\nKM>\�\�`�|^a3��s�_y�U\�#\�\�H�f�:4\�\�\��Ou2Z\��\�\Zn�c�V��4_\�9\�\04E\�II�I~��aM?$\�xi\�z��\n\��G�#�\�\�\�\�P�\�8\�%%��Q\�\"i�A>�_G.?ʟ	\�\�%�\��xD\�5��.<�P~\�V(�Q\��\�~S��\�*�62q7Ԕ�^��jCG{\�\Z\��\'�\� I�\��Ǔ{g\��� S���\n\���9�?�\�|\"�v�,6X�����ewo?\\_��*\�Py�F+�\�\�9h��4a�\�4\�\�0�ǩ5\�t��r\�~��SG�}��ΝR\�sʽtAY/\�;n_VL���ҝ�����\\ͶT�\�Y.��1\�\�\����ܛ�̱\��\�\�\�RF�[kc���99Ǽ�\��u\Z,\��\�rw\�K\�vE\�ʸpF���p\�˧)\�Z�\�rS\�5\�=8�7��;	���7\�#�wv��\�^���Ζ\�f\0\���{(A��\�9\�寞,��v\�̴j\��\�Lh\�wW�u\��]���9w���>�ׇe�\�<2���Q|~Ñ{G\�m(~\����\�z$y\�\�y�7�\��\���ַ\�3��:�\��\�\�\n�\�,>6B�\�x��\'�ӌ�:�l\�\��s{O�r�Q�y��u�\���69\�\�Z\Z\�7U�\�u-��k/Ӳ�y���=f�\�N{��\'g��\�ۮw�a�]`\�E;��Aa�x�ߟd�\";�\�r�ԩA�\�r��x�\�!&L_԰K���\�v�\�ԩ��LM9y�KOg$3T���؇*yx7\�\�+}��ǣ\��j�w�Pg���\�q\��8�>��\�\�aO@K�w\0B#�\�nz\0\�\�~���P�Tw�\�627C��\�{{\�\�%�\\ �\Z�\����x2@_��n�\��X+\0w�\�������\�T\�!S]\��%\��m�%��5�\�0\�;\��Z\�+\�\\��n��Ӿ�\��h��@3xř�|M���M)\�T�Uj\�\�X^R\�\�sJ;qN\�\�.)�h���_S�\�\�Jdğ���S�z椲N~��c�TzwYm0����P\�b��B�\r�\���\�\�!=\ro]��Wk���F~0e�s\�zuh��TmqW�wꀒ~�\��_(��ae\\<��{.5vC\�\�Δ4\�\�>@FE���QD}\�C\0\�5\�L���\�I2��\�\�h\"�\�\��2\"�\�-ǲ�29�^�]x�H\�J(P(����\�\�=��gw\�\�F�ǡ\�\�\�H|����;ф<�`p�m\���-Sz����A��5\�w+\�r\�\�1�s��f\0fW��\�\0&��\�ːMg\�τr\�\�\"F\�i\����8\�\�\�\�\�\�&+\��n�����0nC\�Z\Z\ZN4\�p�\�_���Zm�Ԅ\0�W:\\\�+�Y$�/�\�8�g0��ӗ���{�|w�[\�\��6aw.\�v����O�\��\�\�ңՑ\�)Ý[燺\"~\�ȁ�F�WT�!�X5\�Y�HLR\�uO9\�\�\�\�qh�xo�q�}䀃v��\�#	��|\�4\��!`�U�;�dšgy��@M\�Ԙv�[pAO\'�>�=�\�3�+�Q\�\n��@_m#\0\�\�\r�D7��U_%�\�\�\�h3\��\��,Fyn�s�V\�\Z9-�)\�\�5\r_\"\'\r�簸=^\�3+p.��\��\�i[\n5U��1����\��}��k���*T\�h\�\�\Z\n\�\�\��D5\'\�R}�u��\"\�b,cT�bFAL��o\�(5��R.F)Ч�N���\�/�>��;�\��\�ʸ���X\�ud\��H�~\�\�>�����܌\�u�\��\�\0~c?	\�\�>_���\\\��LU\�8�Tw��\�k=:zX��w\����\\T�s-�]藔{���\�^PA�@����\�:y�\��\�KDE\�=���\0\�{x�7\�P�by�\�\�V���\�\�/o\�u��\�>{Ê7���y���\\�\r@�rـ5la����\0e�q���;b�\\�\�.,$�Ē/\�o�\�;�)��\�\�\�J�FhAm���^\�|��a8�\�IH����?�a\�\\~x�E&�H�ٯ�\�v��I�N\�p��Z\�օ\�q�<Z��\�/\�r{�ֺ��	�\�\Z��].�ӱN��#�0G�=��]�_?��B��nL�=��\�H��\�]h�I\�3\�ԉްo<\�\��ǆQ\Zk\�x0�$���\�\�T֠��\"Ť�4��*�\�\�^nK�\\d8\0\�\\~�\�7�<��\�x\�\�ʧ���nz_$0�t/?�\�\�w�7\�x鸋��C2���?�\�N։���k�����%暑\�7\�]W#t�=7F�P�*\�s�ϴ��|�\�?��o�,\�]�!a$_lp�\r|\�#�a--\�^n;C-Zr���l\0����\���n\0\�0�\�6X��G\�Th���\��U�\�\�J۝\�\�\�\�WgE�z�\�\��\�\�\�P���\�L\�\�$(��\r%�=��#\�\�\�\�\�CJ9zD�\�)\�ؗ*��_M�\�4\\rK\�zC\�rM\�6m\�@\\,\�˓��\�\�|��~�\�Eސ�:ԗ�\�8��\�|��7\�\�ie\�8�\�{\�\�r�W�+<�Q\�uޓ�Aϯ\�\��\�2\�����wŜ�r\�\�����u\��\�\�䋀=N\�:�\��\�\'Ϲ�v\�\�z;lBq\Z�A\�o9����p\�=B\��\�\�\��{��޳\�C(\�a/\����\�G�s\��~�@\0zWF��Y���ڿΝ�NAo��1oF�\�}\��6���\�\�����=\�M\0�(:}vc�/�u\0莩n�4\�\�\�Ś\���ʗ\��+=h��2�tj��B;\rz2\��\�\�8�\�K���\�[\�\��\�ŬW\0:�nkv0\�$\���\�\Zw\Z�&J��#\�\�\�[���r9�\�\�<\�8\�۩��VuTը��Xu\�Y��\�I�\0���pw�w7ȽϿ5M�G����GPU<������O�+�\\n��%3������\�q�ʇ�UcFqF�\0�{90\�$��0b\�BG\�a(\0R�=����\���}# \�윟�\�D\�X�Ϲت\�\�{]\�\�\�u~\��x�V�+5Y��\�O\�pi���\�Qh�x��Pk\�\r)�+\�TS�\�;\�5H�s\�\�1�1Q��(5g\�U[A�\��\�^�����2\ZsSU\�9)Iz�XM�\�+J�pN)�*t�\�t\�\�_�V���=�����\�T��\�\Zm���Rn.u�6��\�\Z3��\�q[M��̄\�G+�4�>��NQʥ���`�*�~\n\�~44��\�~\�|��\�\�\��\��2�\�\��\�\'\�\0~�_��\0\���E\0�\�\�!1���<R\��m�\0��>ԧ|\�Q��]Pf.@(�\�\\~�\n�K$�n�E\�\�G*\�Dh�?�\\b��]\�\�\�\�\��1\�)L�\�#\�l`�����o�	�aL�\0������uяշqr0ϻ\�^�5��\�˙�(�$��/�\�N\�u�^\�9��g�th�n]�\�[w7\�y����_\�^v�\�q\�n\�\�5�G��\�\�Rc�\�;˵�:\�\�1��N�K7�G/Mg\'9~{�p7\�=�N��R�\�yZ\�d\�t!�\Z�\�DK\�Ih���\'ܚ�CZ� -�B\�0H}\�\Z\�hVgM�j󲙬Y������x\�FW�\�\�h\���\��ψ��[��Ԙ��O=�Zܐ3���\0�)\rՐ\�ګ|�gǻ{^�|��	�\���\��>\�s���\�\�\�}x\�)\��\�}Xv\�rȻ&\�*��?��#�u�5t�\�Pj\�\�ws\�\�!�os��s�;����34T^�!@?ؒ��\�\"��E�v#�\�9_����P6�\�\�t).:zZ�wO\�X.�\\��Fn�%�\��SWv�z\ne���dU���8ʏL\�\�|\�ݻ�\�k\�\��\�\�.C9���\�u\'^\�t�#��`�`kHF�\�\�\�Va3+�<\�\�\�\0����R���몽qL��*�(\�\�	e\\���Uz����\0�9���q\��(\��y\�E_�\�ڿm\�鿠�D��@���O@��W�����x���w�͠\�\�BGI��\�W崂\��X\�gkxVo5\�?��7\��\�^�\�\�20�H�y���\�\�c\r\�Ȉ$\�`d�\����ֹ�\�\�\�3\�ml\��\�?�*{��o\��A`	��	�z\�\�NB�\�\�7��)}��gm\�I\rz\�{6\�]\�\�cw\�\�F?n����\�\�`3\Z��\��-Z\�i\rQ\�ɚ�PZi/Ֆ;�NC�\0�|+�\�\�]\�R&�x�v�\�\�[�К\�,��P3\r\�x�8��$��4\�^j/\�J_e����\�\�TO�\�\�k !\����\"�h�Yo8ioP{]�Z+*\�R\\��\�\"է��.%�����\�\�Y\�;\�\�6څ:\\֫��\�\��f�@K�\�q�R�\�\�M��x�\�\0���C��*\�?�O���D\�\�G^x��<ט\�w%Ǆ�õ\�!8�9\��id�~лg���Y�\r��7�,\�\�[Ĩ3v\'\�0�x�udĩ-9N}yx���\0��\�|�4�\�R�@��N?Z��\�\�Poq\���7�\�B\'\0\��^=��\�Tu+Zuw���\�55\'\\UkZ�\�3a5\��*O�S)l�<顪8\��\�(�\\�RN���Tp\�\�n]R/�f�<�kZ���z\0K\��m-MisnD^�q�F\�Y�{��y�i\�2<��s\�uQEW/r\\\�{��\�O\�\0��\�D|\��ǱGy\'\�]@�G:{k��6\�x�\��n$z��\�u�@��sQ	g�\�\r��n�h��3\�?P�m\0�em\�\�&���\�=��#��\�\�u\�l8\�\�N�p|�1�ў\�\�\�\�\�\�\�\�t\�K5\�y\�\���\�D\r,\�\�1�\�w;\�\�-\�\�W��\�?L���6\�730\�wp�\r���\�\�\�k�O\0�\��\�z\n��|��{�n�Ab/\�>R�\'\�\�v�x\Z\�=�����7��[ж\r�[�z�B\�f�\ZB2\�dC�\�J�އ\��\�\��}��\�\nk���wF��\��\�\�\�z(h���\�aү�\��E\�?�R[�-�f>\��8�i�\�\\�\�~{\�\�	\�wG�#C�7{\�82ئ��N������]M\�U�\�)Ver���Ԙn\�;\�a�\�7�ą|�\�W\��ۻ쵎�;\�k�衢/��	шh�\��\��H�z�\�=���S\r@jc16fq\�)\�@g\�hڴ3\�ù7\��\�ٓ\�\'a\�\�9�k���\0\�\�hc�\n\Z��\�oGN\�w\�՛�\"\�#�\��h#�\�Z�@\��2\�[�H78�*����3Ws��b�dG�)��Q\��q\�=�³GUr\�;�]>��kT��.�\�Ȼj@¸\�xgᣐh�uᦒ�C�~\Z�-8sV�\�W\�+��N\�Bw�\�.\�F�\�����҅Ӏu\�g�� �s��\�\��zt��bN\\U\��uY%�Ω��q��\\��}GI\'�\��\��7ZE\�$z�35\�DC3Lq�^�t\��\�U\�tG\���GZBL\0c\���\�P@\�\���E\�ӿUx𪡰\��s\0�60�\0��I\�Ÿl�{�o\�����ӬoB\�s��_�7 #\�7\�h���\��\�{O����{x�\0zK�\�\n�Gw\�6���� \�Y�8���Ϻ������\�)��Gw�MWgqɰ\�~\�~��x\�\�\�:�oZ\�\��-\0�\�&ڵ1\�#�*�j��X�n.\�l[�\�;K`eZ\�œ�C/�kx_��\�s-\�\Z�L\� �;ڛ~S�	^W���ՄW\�\�r��x4i��\\i��\�\�\"�\�Ӏ\�F\0c@?\n]\�\��`ƴbD\�\�C\Z\�\�V_c�Z\�\�\�X(\�Wka�\Z��\�\�v�f��\�Ѵxzw\�i\�yw\�mt[m�\0\�\r)�k�9�z8�\��s�:\0�c\�$�Z\�[\�\0\�\0oy\�]����W/�\�{o\�\rEv�iN]~j�3\"�\�}�`\�\�X�Wk�9W�%\�\Z�L$�9-C�E\�!H7�\��G\�C\�p%��&��,Qm\�H��tզ\�,!���̻Iʾ�f���N�V��\�c\�?wP�\�(�\�\�]r\�K*���[\�ԈTj㷛\�bT� F\�x[\�s�wνp�^Týh��]�U�1*B\���Yc\�8^�\��\\\r�\'�#摕\��+�n��oũ\�\�}�\�Iᥓ\�=q@�G>�\���S��u\�L\�1Y�	�411zc�cDs\\�֐�5>\��\�dN V\�\�U\rp��5\�CM;G\��7\���5C�k\��z;\�g\�|�lj48\�	I1\�\�����\�ɅVְ���s\Z�����\0}�<��>.\�K4[�|���^\�	\�\�\�\���\���^��\��\0�I\��\\��\�\�a�\�]@�\��\�s\���U7��A�-�zW\���m&t�����w�p�x�u�i�\0\�F`�	v��\�\�\Z\�|��Z\�֒\rYPX�����Y��ZN5\�h�1�\�П\0 ��Z\�ڏn�.�FD���\�ޒ\�\"\�+I\�hu�\�ۋ�\�[�\�>�I\�\�Ψ��\"\�Ď7���λ\��F9V\�\�G�\'�5=���Q������U\r5j�,QS��\�d�57C9\�\�NS\'�\�@׷;��\�o\��eƪ\�e��#�M�\�n&�k�5p߯���_�7\�\0ch��\0\���\�4�6�x#\�bOCP�.��\��3\�0��\��\�\�ǑFh|\�j/̨!GC�\�x\�Rc\�\�\�x�G\�\�GB��*�ԘA\��\�d�\�W7\�\�h�Rw{��9Cji\�WmM�J������[�J�tSYW\�*�\�ae_�V�.0z\�8����\�\��/�V\�\�K0����Cu\�`\0�5iwT\Z\�\rO��w��ʮ�S\��\�θ�Ɋ�4V\�IO�\�;j5ך��\�\�#uq>Z]\�+�����\�d��<\�6\�\�Ҏ|�\�o�\�\�o�+\�̑P�\�\�Ո\�r�㝛zc�\n\�4r���do��6��\\�\�9G\��=x\0{d�s��\�:\�\��\�\�\�\��	?\�\��d\�\�_.\�t_\�Z��^\��\ZOo@�	\�7\rx���\�T[F�\�|_S���Q��6h��\�sr\�P\0�c	�mp\�ߞ\�e��[\�\�\�\�9�\���>��\�\�@�#���\�;�\'�\�i��\�f��\Z��6kK\�̭�4}�6^��1ڈ��yB\�j��`c�њ�L��\�L\r�3�\�\�\�\�B{A\r�n@�/Cy���\�\�`��~ހ�n\�\�W[q�:\�]\�@�|u��XK\�ZE�� -�Ǜ#\�\�\�&]r�\�U\���\�\�\��^�i\�\��\�|���>�����[\�\�֨��juV����H]�yL�uC�;�R\0}�:2\�C@�=k`P��Ň%�P\�\�\��]\�۵�\r���yY\�}��s�?���`�\��\�#?NCչhr\�X��O��\�\�{ٝ�\�\�t�\�v\�ȹ�\nހ\���#}\\j�=\')T\���E�;h7\\[��\�<�禪\'/A]y5P_���n\�W���������NN��w@-�m�ʯTQr�\n\�\�{��ҡ\�I�΢ّ\0Ǒ\0\'��\��w*�rRew/\�we\��&\�\�\��U�y		qF\�O�9��2\��y�Z.�\�d�,AE�\�Ώ��:�R\�U����bu��6R�tO9O(\��>=�w�|�d@�\�߾}�9\�\�\�Q*�r\�nV�\�����o\�\�7\�2�]�\�{\���47�t���~���u/;���\�s{�z\���-\�\�ze+�P[\����\�h�)�5�?oF��n�ߴ�u\��G{��ARg�ơ#N�@[�\�z�\�À\�\�\�Û6����^��~��\�\�0����<gְ���6\�y�\��$�<\�m�a#b\r�A_�\�Zh�\0�\�0�k\���F��\�k��_�٦|�W�i�8N�4��\�m��\n\�Bk��\�jM�\�Ϣy��<��J&�*%E\rx\��\�b�Uש��V���!W���D�\r%�B�\�wU\"\r��Zr\�7R�Y�kh��!�\�c\�\�\�\�[C�\�\�~<$\�L��2֡�Ꭰ�g\0�DO��[[\�\�\�u��2�\�\r�;am��ߝ��.�\��\���8�����\�\�\��\�\�\�Z}G~�\�\\�.ϠG�C�#@o\�\�c5�ƞ\�Fԛ�\�\n�\�Ifp\\�e�\�roHn��\�U6\�t��6�D+L����E�ϛ\�78pW��/UwN�Za\�>\0\�X[�6qTO\�degM\�?^\�\�a�\�8�ř���\0Y�r\�\n�r3^�ǝ�wFǿ���\n.|�\�\�o�Wװ�ܔi9^t\�r��� ��ʮW��\�\�?�\���\Z��\�Q\�=u\�\�A\�aU�i\�t��\��\�SV�VW\����x��b�;�G�V\�\�oUxᄊ��U\�\�Kʻ�\�?�_o�ד5�ߧk��=_\���\��ϓ�WȯwJ���H�Ao\�m\�@��\���\Z��\��?�C\��WlB}�\�\�\�\�A-\rثtD@\�Dkt>\�]xn�=\�v�\�cL����\Z��\���k\���N�	Ku�\�\0՞\�\�2�\�\�3xW��a\r��\���<��0\�7�n\\|��\rB�N�ucM\�\\\�1�۲�q0ɛ\'�`��2\�G�\�\�\�;wJ�\�\\��\���\'i�0F}P\�\�\���X\�\�C&\�\r&|�����oP�xK~I\�I.Ü���BuTk��V\�-m\Z���u\Zn�\�@S%���\�\��\�dx+pg@��Vz~����	�i��C�C�\��t;?x\\ǻnL�j}r@K\���\�\�\�HK�z��\�SQ�\�2�O.�\�\��S0TP~n;����Px�SKF\�>B齤��\0aSz�Z\0}[�G|\0}3�s�O��@u;b\�_�\�	m�Z\�r�e���\�\�\0\0])IDAT�3����\�<���t/�Uj�!]}0��\\K�|�,3Ȩ\�\0_��F�\�\�\"E\�\�m^\"\�o\�S⏰\�>Y\�ߟ.\�G���ޜ^\"q�n\�h6<;5���a\�\�u�8�\\w��u\0B\�s��W\�Sh�ʾ�׿rB\�7Ω\�~T\�8�{�!Xz\�^(<Zp\rp\��R\�!U\��k�^Q�ë\�LuA��j\�A\Z\�\��\�`�Y��|�\�ݍ^\�̽tM\�\�\�\�\��o1>_)\�\�~\�<��\�C\"Oʱ\�{�=��\�ǋ��\�\��?���A�\Z@���\�/�\���w�`l;h\�\�#\0>\�ǻ\�z7\��v��;\�ٽ\�5zwY�N�\�p�l4\�\�;\�+��[�	{x\�\r�v��uE\� L�_Sz@j\�C�_2\�H�o\�=�:\� �o�\�\ZJ~;�\�a\�3�\'ཌ�\�k�+��\�$\�lD�<�\�\�n�\�zS�o9\�ěs0q�\�\0�&\��\�9\�\�\�Ih�\��\��\�N\�q\�7�΅�n�=\�:��:�o�\r\�\�K�hv\�hsګ]6f\�١p\r�j(�TttO4\�ހlc�h���\�5x�j��z\��6�&\�u\��\�i	�\�䠥�z-{�o�&4�XD8P�9\���^1�\�\�vi0\��X\\as��ѣ)�\�`]���j���\�(.U[a�\��\��\�j\��;Iǭ�\�8�}����ґm\�\�k�A\�x�f\'�\�&\�W�A/�Aɻ\n�v5�\�(��?�\�\�b�9\�ȱ\'��3Ǹ6��͚n-P_94�(F��qK$�-��cU\�\Z\��7\�h��&l{\�,-W]f�\�*`L\���\�\�mo�\�\�6��y�=�2\�ate��\��\�\��ʬv�f��0���a\r�u���I\�U*,\�V^B���\�)\�Bt\���.�zJ\�P�Z@ߜ��s#S�[\���ʌ���+g�v�;e⡳ϝU\�\�jI�B&\�W#ƴ\�\�sח+\�<��d\Z�л�H\��K�\�ǟ�J	G>U\����]�|��b?��n}�G����߷\�\�|g)l��>�Hν\�\�#\��a/��\�v\0���e?^\�\�B]�?\�����x\�\���A8ڞvZ\�\�\�R�\�A��u}\��Έx{\�xg\�Eƿ@0=\"\�v\�e\rD&���!07�l\0�\0�G�\�^\0c�\ro�iB�wm`<�5h�3�n7\�ml�lX�wP\��\�\�m@�s�.$\�\0xO��I�໑\�\�\�9\�C�|\n\�6\�RgM7\�+��P��Xgf\�UC\�\�?£\�;\��M\�\�\�CU\�\'�>#C�\0���L5\�ꪯW7�j��!���s	%��|W3�n\�,��\�f\����Y�f�\'��]�m\0�1\0\�\��\�d�j,0\0@?\��]��>֎w�$a\�;?\0\�\�Mvho��խ\�\�.>ߢɖz<��x4���F\�h}\�qo-)T�\�C���\r�H\��\��d�\�r\�iH�4h*8�	�\�aK6\�w���d��̧0A��ӗ�\";�Cr�7W`�w�\�s��>Ҍ�)\�Pe*\�.\��\0\�s�\�\�?�����Քi��J0�ɖ:M�\�#��\�Z٪��NM��j	��٫�-�\����\��\�\�\�\�\�s��Tp6\�l؞\�0Lh�1��5�����V\��E\�\���G��/_T\�\�S*�\�W<���v:s2T��\��(�\�U\�]8�����x�\n��W}\�%��\�^\�H\�<%?P{\�]u$\�� x�\�-dߍHS���Jsk�_(��{��\�z�\�o��\�׭w�CQ\��Jo�=\�r\����{\�\�e�_\��s�\�\��w�\�\0�\�m��a*\�rS.j\�\�(�\��rݫ��!]\�A2����\�E\\O̞9d\�q���\0,�\�s\�H\������\�g)�@��t ��\�\���w|c`JI\�1�㻠\�\��\��٠v�̀6�_Q{����\�@y\�)\�\�D\�&�\�.�	�w�\�\�\�\�8\�\�\�\���^�\�8r\���5_�\r�\Z�|���;\�j��ɸ��8o[uه*�y��G賔5\���\�f�\�P���\n\r1AG[�d=xnG���\�f\��9�\�\�s�w\�>7\�\�\0�CZ`.�R\�`�\�\�\�@X�B��\�,�~�/\�-eś��h~w^j\�\�H��G\\��\�\�\nKh�\��n@g�F\�k5��\�/WW��\�\�,\�P\�@o\�q!�����4>^\�\�\rȀ�\�\�ۡ�A*�\�x�8e�\"]\�-%acӶ�r��\�\�tc��Q�\�\�\\\�+�=\�E\��\�j����\�{0B�%9\Z,\�C\�\�\�5\�X�Q�\�\�t��I0��.͎�k�\�\�<\�\�D��x��`\�u�\�\'\�\�\�̍]�c\�\�3\��\�\�c\��\�suaX��n`٧\�\�.\�\�*?!G�\�|\�\�/�U:�\�\������Z0r����\��J�{Mi\�\�J=\�\� �T\r3��-70����[Ty��ʮW\��\�*�}FE�υ9�N*\�\�=�\�=8��\�|�[\���?u��\�\�\0�_덿9\�=\�Z4�6�~�n\�\�\�@\��+\�\�Q\0=���kL�,-\�̠߀Vsr~\��?\Z\�\�\�\�YC�\�-����.5��:\�i�\�	\�6\��\�\�%_to:\��?:p\�g����\\�lBy���:��\�\�a1�f�j\�\�6#-�L\�\�D\�\�sBӎ\0z�\��a���O9��K\�u2�\\;\�e��\������\�3\�\�\��\�N\�8U��B\�m�EW�W�ۋ�X���vU{1\�{wu��x&g|<@OPY|�\��U�^�\��\ZuT6���N#\�\�\Zu�\��r(���\�n\�\�8]��/�\�\�Cu�E\0�0\�\�\�	��\0=����-�t_�f\�|/�\�m\�6>\���j,3V0K|\�L_�&�+y��\ZB=�\��$�H��hn�Y���p��_�\�\�b�z5�4_\�EPw�)HRs~�Z�ܰ�N@[Nb���Y/\�\�\�k\��h\�hi�f[J1>m\�\�\�\�\��UW��� �`\'�uy!6\��\�*\�\��f\�\�+)\�(Ld��D\�M�O\�Uϵ�/o��\�=\�H�\�ʄv\0�\�\����/�\�$\�\�<\�=\�\�6\�o\��y��\�\�\ry\�9��q \�L`}yV#ê�hSAr�R�*\��e(�)\�F�\n\�k\�/�\�`U��\nT������s\��>:4\0)�qAEnr���\�V6�=�\�\'J=��a���\��\�n7�\�\�z�����\�O��կ\r\�/}���\�\0�o\��P\�_��\�\�{\�4Y��=�)���?jۡ\�p���b\�Nn�\�s�b��\�	��\��:\� r̞�)�ص\�]!\�1xp\�\�9I~\�4W���xr\'\�D\ZD���$�ap��\�\�\�\�%���:;��\�L\�\"Bn��!d\���\0�+�|�_��\�֠j���c\�\�kp\"�\�\�8����\�|1\�1a���ן\�{��MO���#A�\�R\�6�k�<F�\��4�w[\��ԂgoJ���ī�HE���*}\�f�	�\�LScN�(PK1\�*ߍV�ʏzkn����Q�i\05\�\�b�hp�\�\0p���RCH�]\�#.\�\�۹\��j�9�\0�\��x��;�Ι	𜫺���=z\�\�R�\��n�\�\\G5�F+ݵZ\� ��\�\�ܷ��@F��V�\�}u��\�Bu�d�� 9D\�[��m�x�<ns\"^\�\����4�`����\�\�T�w�;j\�^�.�\n�`\�w\�\��\�\�&\�\�T5��Gw�Mx\�tW�\�Uy�F��c��\�E\Z��eH�*\�P#\�ù\n=ZG��H\�6߹�\\Z�n\�>ם\��q	&˜�\�\�^\�\�4��O��/\��3�Ür(�\"\�]gΌ�� \�\��y�*�Kf\�P��\�_\nT\�+݅aBqj�\�T17�\��\�ؽ�]R\�\�\�Xd��Vi��V�ϕr\�3���R�g�RƉ/�\n\�\��������\��IQ\��N\��^W?���\�g�������p^�k\�\�\�\�\�O�N\����\�7G\�\�\��d\�u\�|��~h\�\�e1\�K�b\�\�\�\�f�Ȧ�\0fg�[\�\�\���d\�j��d\�R�Z\�lË?1]�ǆ2��A\�\��9S�#�\�HCg?AG\�q�B�i\��|���\"م��\�\rz<��(=\��|\��W.�\�\�\�\�<jV�s?��~\�\���<w�\�jm�i��X+ΨsMe�zr�՚xRm�N��\�)\�\�9�\n,u\�ݫr��\��qʻ����tU�bmq���+5\�X�\�\�J<z�\�Zk\0Y\0�E�3�\�\�=5h�Z�W*���\�h��N\����,`}B\�=ܝ׭�W����kn��g-	\�֘ǋ�U\��*�!�t��Hf��㩯\�$c���[�y@�hV1Dk|\�:^~-1��\0�F�\�5\�^�\�IW�;ä����E�j-\�\0\0���+\�\�{�4��������!\�2&�~��s��p\�{��1�N\�5ٙ\�\�R7L�67\�\0*������(G�\��\Z�.\�H]�\\\�~��DS����\��f�\�s�Z�ti�amy\�\�0\��8\�_\��m\�3\�\�\��Y��\�f0�\�@\�xa\�fYʭ\�\�ӕI�9\0��\�\�\�\r�\�Fd�?���:U\�$��\�u�|Y\�\�/\"������\�C��\�1?�rT��HE�B�\�;Q�h���G�x\������)�\�J�\�#%�@��\�ս����;\�\�\�?�Z��n~�F\�-�_\0}\�Q��\ZN�ֿ^��RCe�6�Ul65oo\�[��kގ\�o\�CN=�!,\�E4�p����F��P{\�n���r\�\�g\��`{\�\�	�ڜ\r\0�\rp�ƙ��[0|�\�	n(�gO?Ӊ�\�\�S\�N[\0�\r\�1b���\��>��ą	[lm��/N\�u�\�i�;\�\�\0\�\�D�z6٦=�\�6^\�\�}�9�?\�p\�=��\�S{\�C5z��kh�ˑq�*n���\�N=br�<էU�)�,$\�tW�k�\�\�R���Z�\�р\�\�uBۃ�b�\0�N\�O<:\�m8Ŗɹ3\�&�{���`�7یt0:�.�\�-w\�q�\�5\�2\�/c^wE]\0�\�\�.��\�\�H�:�\�}\�{Z4˱\������U�4�mաB\�\�\�\�E�\�]�]�\�,b��I�Di�V?^������4O\�\�\�(̀槠�Ԛaώw�{��Xh/��\�-vr\�\�\�Lc��0ݰ\�\rG\�\�\nՙ�L�\�\0�|sz��\n�|����4X���u�c��uv��L3>v�vF�,�\�\�\�\��d�6z\�\�	�jøa \�K��g\�yn��6\�\�o�Yv�X��?_\0���3�|�\�<cn�����	��l.�iea2x��\�rU>JT\�kx\�a�L\�h5\�\�Tg���\�\�U�F$OMF�����\�J9}QIg\�)\��	=:vX��\�S\��\�\�G��|K�>\�\��W]}�ME����~���}�WE3�|�W@�lY�����\��\r��<�\�M0�\�.%����\�\Z\�\�t��Y\�v4|,�ܹ\�\�ӡ�\�/P����?p��44?�\��|0\�\�\'��=�7��^��w�\�\�w�y���f识\r�\��]W�Ю<\�\�*]��\�x��3\�C�\\�Ki�\�\0��\���\�\�:y䅵_�7ˬ�N\�hg�1Y�\�]\�*ע+��ũ#���SN�\��qUE�VɕK*�tU��\�n�\�#\�6V\�;�\0{j�ʋ��5\�+oW_U��kk5\�X݄�I��JSm\�xt�vwk\�\�\�\0ho:\��� 8��3\n���<�3\�\0h\�\�6\�$\�}�\��7Տt���3٭��\��x��*�\�\�[\��\�x\�U�+myo��\�M;�w���\�#5\0�T3&0\�\�\0\0�\�)��]H��؉�2�y���Z�5\�A\���a�J\0?�o\�MI1\�I1�m��l<~N,\� EC\�.7��\Z��\\?ϩ�>�k��V�\�x\�{!\�\�Y\���\�,\�@M	�TC�\�\Zm�\�xs%�/\�$c65\�c�W���u���W^6\�+4\�\\�(\�De�fa&\�\�Xi�ƫ34ۜ���\"\�\�\��4s��@�Ḑ\�\�8���0�L��\"}\�F�>^�\�?^\��҄Fz:Ր_�����\�\�\�甏֯��Ǐ���\�\Z\�IQ̨�<]\��J>C񧢕p6Z�N_P̱!\'J{\�\Z�-]��/���[��]]��=]��}]\�qԗҕ���\�_�>]�8��lM��\��=,�A\��?n\�]\��sko�\�\�״\�}\�\������\�p�\�/H�\�\�\�_�\�3�\rz�Rxk�Ǽ\�\�\�\�W}\�\�~>xx�\�v�34UH\�	�2\��\0\�\\؃\�\�mzc�W��p\�ݮ�b��M@\�a*\�>\�Û�\�\�Db�;�|\�s�\�d�]���Z},�\�h�*KC\�Ү�5d\�Rm�u\�<��*�a{xKe1w�m�U���Gh�Dե�\�3s\�YT�!t\�0@�k\�xC�&�\�5\�Z\�;\�@�gЭ�ε\�l�z6kƀ�z\�\0\�Y�8\�߁G\�kw�D\Z{&�\�r����\�\�9���{\�\�~N\r�\��� ,\�9E\�i�.\�\�\Z��#���\��\�r��73\�\0\�\�R`��)?��-�\���u���\0��~\Z\�Ϻ|3Fj\�0���k\�\�9X\�@X\�/\�d]%\�r�\�\�V\�}k���wxw\�us�Gj\nB\r�\�1�\�L��\�\Z��\�\�\�B��\\�\�\�\�m�)\�.\�\�@-��DC�p�k�F\�s�i�\�\�{�4g#5؀v��M�4\�P�)�\�t\�k�5Y���Ro\�����<�\�\��n��L[#\r\��/�˹!yl}6�M\�\�\�\\\���+O?^\��-M����Y��ʺqO��(\�]p\�ʣN�\�\�95\�D�!\�\���UIU{K�wn+\�\�=����\�>:�_�\�|��\�\�\�\���\��A\�>�\��~\n���џ�YQ��A\�_b�z[o��;�\Z���Ke\�k[ӻA�+\�\�[Zso�*�s�z\0{�\�\��{\��go��\�\�}\�{Im�O\��\�@�A\�P\�\�,\Z��e�\�k��p�oyI�FvO9J�G^��\�\0\�n8\�A68\�E\\ \�e�����L�.�=2b�	�\�p�\�^\�\�7\��\��\�\�k+�#���\����(:��BлŎ��f�$I\�9��\��\n<�3\�*\�b8��Z����x5\�\'������m�\�WWU����\�\rx�&\0ނǛ/t@��̦\��\�\�\�J�T�\�n{Lt1`�\�\�\�H�\\�\�Qǆ�轡L\���Ww7\�t\�\�k\�\�\�Z�\���\�|\�\0�@�\��1\�ם�\�\�{X��\��a��\�J\�\�Ȇ\r�R�{��؆`}�\�w\�\�k�\�\�\�\�`�\�\Zh\�La\�F�\�B\����6!\Zk4\��h\�=���*<~	\0���\�秇e�ְ\'�!,\�Z�\�7/Ica\�M�v&|M\'\���\�ȭ\�6@]�r�\�\�U��>\�� �|�\�\�\�Ծ\\㰑I\�\�\�j\�:\r�	�\�\nΉ\�@Z�ڏW\����\�\�i�*O#\�\Z,�tuc�z���eɚ�M\�RG!��ӳ�.�\����3�\�[ϟ\�`����e\�*LzU\�Ü�x}z|X\r5\�\�N\�Q�\�kJ=q�@9\'��\�\��FR�틪xx��̿-7){��\�\�w�~���٧�}\�\�\�gЭO~��-t�/��Z�	 ���{E1��W\�F�\�8��wM�%@o}?jԇ���9��=�)�=/t\�\�M�\��\0ÀFF${\r�ثx����ǯs\�\��ͺ\�4>$X\�ۛ\�G\�_�\�\�\rz\�UGv������{)\�\�Yw��?e\�ڡu��\�\�^\�^\�v� |�a*o\�\�؀��±Y�a8B�9<\�\�\Z��B\�y��Ʌ\�q��uݮ�\�l΀BfĪ6#A�n%������\����t&q�z�x}\re\�g2醛\0<o\Zz>\�\�\�%\�\�n�\��hD\����H0M�2ԡ%��8ѧ\�\�d|`���\'\�ԯe\�c��\�\�s�,\�\����\�x\�\�7\�wC\�H\0n\�c{}�J�W7��O\�3|?\��u����7�tj\ró\�X\���\�Y��\�=a\�k�\�\�%\0�\�ֺ[`	���L\0�!�A_c�:*ԉ�\�\�\�)�\r\0�>��\Z\�êR4YW\�.���k\�a\�Iȥ�:̌G<B\�g���@C\r%��P�zo\�T\�\�\�SHfr�\�Q{\�(\�\0�[U![\�1��Y�Y��f���:��He��K3Ջ�\�.\�\nc\0\�>Z�	+\�\�b{�6�\ZO1�/`�\�\�\�9eJ���?l�\�m����\�_\�\�܌���\�XݤҌle߾�Ldb\�\�\�:{D\�\�+\�\�i�\�e$\�%\�%]Pm\�5U=|��뷔{��R�|������U�ǀޞ���u\�˷���h����M\��ܞ�U��H\�ۅ\�\�ݐ\�=�:���\�\���\�K?q\���^��qc0�\��\��\�\�N�1 �\'5�|�L\����,\�lB�Ͽ\�\�<�!\�\�#-��m����a�\�@�<^�\�\�?P<4?ֻ�\�\��{x�ցC�ӛa\��	6\�t��|�G\�\�t.I�;̅\�)\�t}��J��1E�޿\�L\�6<}K.^(��\�\�ښ\�F�jqd�I\�]���J�^\�Kn�ď�z\�\�g��Y\�m\�R\0\�3\�_\�\�a텃gEs���x4�\�xi\n#9�A����:\�\��W�\�\Z�G�lYt[c\�\�}7��\�ǳ�\�?\�9?fO`O1�~\�B \��~_�W��\�1؄�G\0\�\�c>3f#Y\�ر\�\�xn\�h}zP��\�a\�\�@�V\0c\�Ɛ\��}(��\��k\�0�a\�\0�]\�\�\����\���\"$R�\�{\Z\�\�\�D9\�\�vl�z�\�ߨ~h|������\�W�\�y\�e\ZG��5[N�\Z�\���yĹ_���t٬c�~��\\�\�fYU0�r\ry=?4�(\����$\�zK�\0}�z�$>V\� ���pE>\"_��\�h/\�.��\�hm��ϼ\r|\ry��^�\��x�E\��2rvIk�s\ZUsC�\n�J�s��\�\�_T\�\�3J>s,\�\�\��\��\�E����gU\�2\�w��(��\�OV\�\�Ot\�K(�=�ǀ�S4��\������\��g\�\0��x\rM��=\�}��)�Ro�d�8zw��e{��\��g4��\�~�\��z� \�\�p\�UC��i��\���\�M񙤮?\�s���\��_\0���\�.�\�#o\r\�\�^�\�p�\�`L\"^\�,\�PE��ż�Xw\�}5��nR\�e�p\\�v��b��|\�xG_�&o\�fU(55݀n/ITwv,#��R%\�mx�\�Btc�����n�=%y\�\�|�\�	z�2\�x�Zgzy}�9\�\�)��x�hΠsyj\�8\\�R\Z�\�\�4\�`\�q\�t�|׹\�e��`&#t�u\�KA\��眅].��\'\�\�\\@�ۋ\�ӻ\���\�=FŞ\���1,\�A\�\�~��7�x\�\���~І\�\0\��8\�7l�\�x\0xgĹ\'�wR\�0��D�\��he\�\�:04��\'!��\���;4ɹ\�\�hG�\�\0w7�!?\r&\�\�X�0�Y�m�	)�{H6�u3�\�\Zu@w\�i�y�\Z�\�u\�\'�\�\�k�ls\�R\�0�%�\�=\�{`Y.WfO\��o�\��1�-|��\�\�\r\�a\�\�c��\�\�,R��w�A��޲<�LQ\�p{\�1�\�Tu�\�\�r�\�R�ͮ\�P\�\�U�<�\\�@\�O\�Ma_���/��E=a�/\�jbtT����-�P��T�_��G\�\�)\�\�1�~{H�g)\'갊�S��3*�>��ǔ���c]�\��?A\�\��x�x���>\�\�o>\�\�\�\�\���x\�-��_�WC�\Z7�x=B\�[\�vݘ\"�\\)f\�d\Z{k/�E2�\\\�\�ZB\�(@h`9X�z�=���\��\�Kt�ۛ%���.La�\�- �\nm�y\�\"��@�O��af\��L&��\�0��݀=\�\�\���\��\�\�Y&\��\��܇jCm���<�פj���y_mIwԕ�\�\�Due�)jC���\�;KҰ�\�i���\�\�\�M\\}e\Z9R_	��z:T���\���\�~[\�㙶��\�\�F��\�n��\�@\�\��\��sxOW��4�1�m\�z��=�\�	�\������N|2�6F���%D�w\��w\�.�����\�N�ţoc��D�P�m��+p\�H\�~\�ƀ\�\0|��t2\�_�\�=ι3!����\�-\�9��\�\�~\n�k«!H8�\�\r>7�KPs/.�vhy�WK#<\�\�bW[\��\�[j\�\�7#����ߵ����0	��=rga&�w�n:\Z;\�\\\�\�4\�]�\��\�d�\�z(|#�\�9H����w`6hz��B\�\���6E\�s��0@H�:�g�\�V�~�}��� л�V��+��\\�\n�?�7�\'*s5S�����~E~�W�s=�A-8Oo\�\�bx~��\�ʜ�f�c�_UU\�ʉ\�T\�Q�?zBI\��+\�\�A��\�\\�V�\�Q\�\��\����?\�\�\�\�;r�\��\����5Z�\�\�z\0x�ݧ�����w\�\��쥈��ƚWf|ߏ���ûs�\���\�\�x\�E�Ĝ;�tMi\�\�5x�\���!\�\�.�\�\���\���\���z�\�\��1@t@Π�x\r�\�k\�︀A\�@\��⹽t�F�@G\�ӹT@��\�a\�z��j�\�=b;`h�\�6��\�\�-�r�v�\�sB\�9��:2\�ԓ\�\Z�>m�\��\�\n(|E���HU\�}��\�\�\�-\Z|�溝�\�e�ְԵ�g_\�eһr�=y`�3 ځyl��^6�,�W\�u\�/j\�Ͻ=\��c\�G>��ɵ�\�\�\�u�\�\�\�x���Ak௿�\�[\���\�\�ޟ�\0\��\�`��RAq\���#�aR��{�\�\�\�)��\�t�k�1z6�!೮5��\�w��N��q:�������:~cl@ScH�Am\0��vh;^�@ud��|L�c�N\�m\�\�\�k�9�\�Y�!\�w�\�u\�\�\�}\Z�\�\�\�\�`0.~û��_D\�{u����~�)\0\�G^�>n@?\�qL�Wj������\�T7���n\�]\�*O#܎bF*�4��\�\�4f����:\�Y̪I\�\�:��@`��\�0\�\�d�@��\�Y-��-�PƵX%_\0���觎(����W�z\�s%|�~�\�_��G\��{]��O��\�u\�?\��\'\�m\�~[�}�\�#�Fp����\�߷WCO�>�\��H\�\�W\�\��])g\�\�x��N\�q\���ON\�\" \�v&4\�;\�k��)\��{\�\�M�C�j[�?\�qhˌ�\�uN���ق\�7��\�D�ڟCc���y���\0��7��\��#��v\�ϲ1\��k��v�8^p�]\�sL��b�7\�b�Ӡ\�	\��ذͳ1�\�<<H!�/���A\�\�\n����\�UC��\�\�u\�\�m�N�q����\�\�g�C\�\�f϶\�\�\Z\�\�\0��\�\�	���Y�\�\'\�r\Z��^��\���z�\�.`w3���{\�Os\���nk\�w[.�em \rX�\"ߏa�	^\�A�\r��\�6`�R_\0;�\r�`p�̞s �\�طB�\�\0ZK�=�>�\�\���\�J���$e�`\��\�}���1\�:\0�\�\� mq�\�޲19�ͱAm�i	\�=\�Ѡ�\�*\rԗj��J�u`�7kÂ�\Z�4Taʝ�A��#�cx��rM��#�\0���\�\��\�V��\�*�bū���zM�\��\Z\0�-\0ߠ纎2&\�\�4\�P�i~k�o\Z\�W���RiZ��z0GFJ����\Z�*M���8|~\n2�\�X믄]\�q\�\�pVN_7��\�	zio^OWg�xuZ\�\�\�\��A\rv4�*?OY�\�{\�b��V\��o�\�W�9���@w�������\�����\�oA\�o~�;\��\�7���o��x�����>s���������e\��\�\0�k�\�*8��3�0.r�ߛg\����\�\�Ї�sNT��[�{��\��#�\�\�_�\�ޞ?��\0�\�7\���|(��\��p{\�s]\0�1��`2>5��溈ſ@\�ݝ$�\�-�\�\�wݸ\�4\��f�={�Vzj�\��\�0ar\0v�ڝ�����x5�~I�\�}q˳\�[���Z�\\ޤ�\�x�j\r6Vk��J�\�\�i�K�\�lpu�O+�\�a7�p\��\�\�HM\�]1\�e����Ew\0؃\�\0��\�6\�g\'�\0&d#Fv�\�\��^�u�?��w� �f\�\0|\�lø��\�\�88\�vY^\�p�2Sv\�\�;\�\0zo�\�cD\0��\���.\�0\�w&\"\� l���\�8�\�\�8�s��s\�\�M��!\�\�\�|g\�ǎ6��~\�3�\�v�\�vh\�\��3=h|\�\�T_��\0�\Z߱\�y1�w&\�\�m���q�c�\���\�\�]D�o\����>\�\0\�w\����y\��^���g[*4l\�;�_[��\�|��&�=�\�U�;X^/N��4]�\�\�\Z.J\�\�a�(�\��4��r5!��D�\���j��$\�}l�\�s^�V8��$�<	����֦��޵7�E�CƯ2;O\�7\�x:Jq��\���/u���\0��\�;\0�O��\�?u\���\r\�����\�G�\�9���ҥ��\��W݅\�\�=�\�\��JoxK�+\�:1\�{+�U��\�߾\rȝ�\�\�*�\�D�\�ݕv\�j\�\�\�#8����,\���\�;�\�\r����\�·Ɓa\�\�\�א\�\�\����hN�|<\���\�\�=�\���\�譽�7\��[��uj{3�\�U`ױ\�k��Xz,�����2�\"�n#5\�\Z���A\�zJ�4S\�\\�v,w�\�\�9\�n{\�w��\Zx�9W�	�&�x�H�\�<�g�\�Z�\"�\�*:}m�\�\�^d��8S.��Kk>V{r�t22\�\�Nv��;x�\�I49ʌ\'�\�\��=�<\�~�\�\�4]v\�>�+�\0R\�N��e��\�H\�\�\�\�5\�\�9&�,\r�\��\�(9�/�ؠ���o[rY�;\�ǟ�@0�m\��\��\Z\�^6|\�9�\�a^x�\�\��\��\�ˊ>6�\���kO\�f0R[����\�a����,���Q\'����;M9\�\�z���\�f\�\�\�Ux�j\�a\�-\�\�=^ɚUoB\Zh\�,���\��6Ҩ\�@X\�s��B\rU3/0��^�o\�w\Z�Λ�AW\�1�wPq�z\��ߞ��C�p#^\�ǈ�s���~\ZC\����\�rN\rs\�\�K�\r\�4`cm\\Ϡ�O7\��l�ۭqmp~f�{\�SS�ڌ\�߹���\'{t�\��Hw\�\�>{O7?zK7>�\�׺�ɯt�\���\��Z\��-\�w���\��\�S�\�Wz�\���\�\�\�ۓ�����_\�\�\�r�z\�\��\�7��.!&\"�\�9\��;�⩙\�\\xwS�.%\�m=D�y�\�{s��r<T\�[c_zb{�@?��w����lc��0y���\�=aB3IB�GF���i�iM�����-�@߮et\�RZ��A\r\�\�7,;}��o_�yOe$7��\�T>J�\�(\�˗h�	�υt?��6�\�Z�[/�=uK��k\�LJ��:���\�D�nZ\�;\n\�J4SM��s\rކo\�\�\��v\��F�ǳ}s\0~d\�`F\�\�:>�5�u\�lϷaI\0���$6�O8O|~ܳ}~�ʵ�[|\���\rd��=3\�ѻM\�#\�\���a2x}�\r�W�绽\�\�\�p�˧\0|�b&6\�\�o�3\r\�f��\�\�\��m\�\�\�8\�\�K��L\�\�5z�c\�\�X7��d\rc�<֡\�\�v� \�\\�\�lɹ\�Ih�XM�F0\�θu�\r\���W{\0�Z��i�?j{\rf`�S}\�\�\��\0z��: 2�g\�[��\�\�c\�-�m�04\0�\�m�r�=;^�\�ă\�\�s#|ǈ\��̯)�u��T3Ȏ��J-�\'s\�s��\�\�^S\�z�~FO7��؄M�7\�,�\��eƕ3zt�k���n\�{���n|�n~���\�������x���\������gE��n|��`�\�~�7\\�\�M�^\�\��w\'�=z��-����;���\��޴~V\0�\�B}oo�2��2M�r\�w�\�\\h7M\�\�O�n\�u\���{=~ �\�?gr=\�k�`��\�\�aD�\��\�Ȇ���\�({�Z_�֘a\�\�\�\�^���|\��Ǔ֞\�u\�6F\Z�[�2�u1ڡ\�\�\Za\�3I��>\�{Y���\\]�^�z_S�:�m\�\���R��x�י]�y\�r��\0�0\�G:cc�?\�r�;�~�6Xyμ6j\�;\�\�]I���{\�\�\�\�m��<%\��9p�\�\����^�G�\�\�}x�\���U>\�u1���\�p�\�\\��\�j�����S��lC��rd\�:�\�cܲ+,\�w�9���,p<��߷<K��}\��\�4�\�}e\\\�x,\�\�^�E���6,\0�1�\�#\�1,�w�\�:}�m7\r5�r�o�6\�mHz\�`|�$\�	+\0z�\�L�s�_e��\�Z4Øp\n�719q\�	T\\\�ƒ\�هj�\�WQ�~\0>X�\�\��u��AS|���z6�\�S[z������i\�G�\�8<��l���\�a1�!����f\�R/sa���ʹ�\n\�:�xz�S}�<\�u� Q�\Z*ԝ������q\��\n���^W��\�\�@\��\�\��\�;+\�x��*�\�7u�=���\�\�\�W*z�xh�\�x�Ţ����\�w��\�\�6\��P\�f�\�@8\�g.\�/��^\��s@.RO��ğX\�m\�\'+X1\��P�\�5͸�K\0O<4�\�x�^B\�_�*\�\rצ��1^pj�3Z�\�h \�0\�\r^�\��@s��L\�ǀ�i�Ϡ�\�<��(�\r>�1V\���R�5���[��ކP\�a�	]\�\�\�`x�~tbOc�Ѕ���\�F\��Z́�~ޠG\"\�C\�;�&x��Pb\Z\�G���\�{�H qm���\�rՙ�Z�Ǡ\��xO��\�\�\�@\�pZ�8\�÷\�|�gЇ@���\�\0gI\��{�[:\�g\�5\��	\�\�\�\�8\�K\�\�\�\ZLb�533\�\�Kz�\�o�{[S��h\Z�\�g0\�\�0m\�\r\���&\�\�D\�\��?��~!\�\�\�]\��A�B��#\Z\�f@\�`6��^\�\�\'�?��a�3^\���\�\��|���\�6[Y\�:\�i\�\�`\r\��v�\nl\�\"\�^\�\Z\�k}0�~�\'\�e\�\�q\r\\c`�\�z�͚\�\�\�s�t�\�\�I9\��\�,!��\�ad�*�B��4o�\�\�Xug&�\'�_\�T\�\\\�CDzVe\�H�5����\�æ\nͶ�ሪB�d�g\�D�1�ly�k蝧\�U\n��5%^�7�*�\�	=:�%��no��t\�\���ο�\�\������\�q\�\�P��\0�ۊ�\��\�ѣ�*i�gz\�Q]/���e�?�\�\��?:b\�C��]<=�\�䀜a�\���\�j�de��\�\\x\'ԸW�\r�+ϘΛ\�yw��\�\�\����V}\�\�|\�\�|u\��+�i=�\�W��\�\�e_�\Z�c\"5��2\�kۛrv�=	�=�6?clapV`\Z\�L�\�F c2\�{>\�����k\�A+5���ţ\�6k��L\\��jM3&<*��\�\�Tj�\�[Jk�\�Q�T�\�\n\�\�֞\�ò��<\�\�\�~o�Ƙu(�\�\�\�$�m�	ȝq\��=�=\��\�\�y�\'���f�N�hooЇ̷E�\'5�FK˪\�|�1�ή&���޶��\�w8���\r�&\�c	���\�y^�cD���mOa!���\�\�9/�m�\�\�XL#]�\�\��aw�A�\�\�\����s	\\C�K���n{؀=�%C\���7�И\�^\�Z\��y�\����\�W/�%\�ڍ7q\r�ͺ\�\�\�(V7�\�a�  \�t\��\�\���y���yЇD3\�;�B p$8�_=���Rݥ�\�)\�\�D�<��B������\�$զ?PU⽰�����i�4\�g���ϔ\"\r*�5\\���R��\\�\�pLa\0�\Z�O\��j\�a\�9\�؉Y\�,F\�1�N�!;Q\�7���x\�\�\�S̉u琳\�\0���҅w\�\�o�N�\������E�\�?D\�����w���\���U̗o+�\���\�4\���\�:x����d\�D7��z{H�\�B��ƪ�\��8xr��\�\�_��0�\�)��\�:w.{\nTz9��>�\�U�ϹE\�34\�SS\�N�am�֠@�j��B3��\�^�\��\n,6\�\�7�\��!���7\��o`X|h\�*�~s��	\�gf�1.\r��\����Tq��P�\�\�b-\�\�i�1W\��\�.�\"Vk��N\r��/\�\�<��\�9ڀޕc�t\��sn3=ڀnC�\�\�\�\��\n�w�\�.\�\�\�Zz���6�\";x\�m&�&�	����S���c�3\��pY�p;^aͥ���A\"`,CO�@����~:\�u�л\�+0G\�?�s6H��\�\�D�:ޞ\�}\���Ӛzë \'yY\�F!,�M�}�/\�w\�.oV��\�?b�\"\�z\�:>��1E�Q�\�\�=!F��	KyL�\�1�\'ο`��.l�F`C��\n���;\�\\�\�Vw\0n֜c5\�}\�\��w\��j�d��\�;Wb�oF��w���Nf�6�kl\�x}�޵��\�e�\�+/V�\�,,P\'`\�\�\�W��:+N\�џ���\�L��\�4@��΂\��5��@\��\�j�8K�H�)\��xu�\�k�p&\�0\�\Z$h\�9\�Xؖ�!1�1*\�gO(\�\�w�;rX�\'�V\��Ot�8\�\�e\���.��G���\�\�\�\�_\�\��\�\���CW��\�?�?\�\��gѽO\�4\�M��V\�m�\�Y\�ס0f�N��w \�\�G*\�z	n\\\�;��\��Ϧ���\�=s\0�\�Ɇ�g�% ,�/j(l�u\��#�B�\�]Ż.7�h���j�� V\�m�W{*�\�]\��x\�\r�\�JW���\�ɥXk]���\0\�\�BM�gj�1ߞ�\�HK\��|�[24\�5\�S4������\Z*��\�8��\'k�\"S��,\�\"q�\�]���\��(�iC1\�\\��\�2�\rp,.�9\�]khw裃��CL�Q<�\�\��)�K<9�\�=\�a\�\��\�	C^\�sNÉ6a\��\��\�\0s�\�`�\�\��\09�\�/�1|\�\�Wc���Mɭ�mp\�ʖ;��35���^Q�\�bx7BtV0\nع\�\���Dvy}�[8\�Α��\�\�����\'�\�,x/ 2̆�[3!�߇���焃{}X24�y_JZ\�\�$�xve�}�3%gӍ58�ֹ�M!\�n��-D\�\�`@n\����\�\�=�\�ra�\�;�\�)�=��\�\�!�\��y\�\���\�C\n��w�F�\�4�almѐ�� ��\Z\�TY��\�b5�����R=�\�\�/\�\n�\0�����\�/�\��{o?Vͨ\�\�8\�~½��9\�풷s�Y_���qH|Ws\�=\�]����\��\�\�\���\�=��n����{\��\���\�\�w\��\�F��X��\��*���J\�\���n��;\�z\�k�\�\�x\n.\�s���V�à�\�:\0���\�\0\�P:n�\"�<� �\�\�\��\�WOf\�4\�\�N/��^\'�\�31�:\�\�\�Yw�rP��L\�\'cM\�\�\�\Z`]lq�\�\\,8V�\�\0��^\��b֚��\�X�e\�|c�<O��隭KѬ���\�h�<A\�\�w9္��\�y<-��Wg\�5�\�_U{\�m�%\�PK\�9�$�QGJ��\�n�/\���lC9�\Z.N\�D]�\��`�Ƃ�m5Z��\�\�\�T3\�\�c\���N\�{���uZ\�i�a_�\�\��irHc�Nny�w���\�c-;\�\Z\�\�?7��\�5�\�m/��\�Y�\0}C�L��\�c\'\�xyΠ_��\�9�A�h���>�0/��)���4\0�0�M�o\�1+\�`�p}\�|}��\�;��p\����a�\r�\�5\r��\�Ry�\�>�0�|\�x\��q:\�\�`Їz���ߍB,��~o��$/\�xXR�i\�\�;Ar\�h����\�\�K\�Z���\���\0\�\�\�^7[����\�;�\�{�F��26�\�\�	�\�\�j}nF�ͥm\�XW\�\�\�3c��\�\������4\�۠��\Z��6���]\r͝�\�Ugu`\�\�@eN%O�5\�)B\�s\�4%x}h�pU�\�\��\'E\Zg��7\�\��4]\�\\\��bs������D5\�\�Wɍ\�J9}Bw|��\�\����׵��ֵ\�\��\�\�\�5>r\��u�St����ѿ\�\��K\��E�C�\���o��\�q]R\�\0w��_�ݨM��řu��tV\�0�*�&R\�\�\�M0�q�\�.u)l\�\��P\�n\���z���`<�g\��G{��Ԃծ.\�<tf�\r�\��v\�rK�V\�\rl�nu�\�\�\�5^�\�\�{\Zʺ���[\Zȹ������\�Ϻ���\�\�K��֤��I�RC�E�\�\�K����E%w.��\��\�˻�\�)_�N\�׿U\�Mw9��[\�\�\�m��3j\��YW���\��\�ˏUw\�}�g\�TO\�]��%�R5Q��\�*V(�� Q�g\�~\�6^���>��\�\0^\��\�-\�\�]�ʲx\'\�r[gB�\\Պ\�\�\�p���&`��A�\�\�\��i�i=\�x��`\�c�Ao/Y�\�~x��\0X\�?�\�\�\�o\�r�P}K���4�\�	F\'%\�u�ޫn~a\�Rt+y\rz\�\��g��\��\�<@v�ɗxq2}\�T\�y�	�\�iÎ�vc)\�\�\��#�����ϛw�1��\��|[�\��θ[\�k/sΗ���<\��ŋ{s���B\�\�\�x�[W	^��A��x\�&\�\�e<\�A}k�\�ژG\�imrX+��E$\��p�f�5\�#=�l�\�`�\�Z\�\�WU�><|_Y6M��w�\�\�9\�?\��Z\�\�\Z�)�5\0|�A?^\�c\�㯌������܋V\��K\�8{T�\�\�ӝo\�\��o��k�~�\�N���\�\�o\�\�~�\��\��x�\�\�]ԇ\�\��\�ѕw\�Vԛo*��?b~�7�0!d\�\��\�b9\�v2\���Ƅ~\�?`�����\�:\�f��j˫���І+ɆM0\�#L.\�h:�^/�<\�s�^\�ٟ\�ݞ\�k��\�\nsԙ��\�\�,\�t/�X��U<��`�\"I\�y�ԛvE]	\�\���\�fR�ã��8�>�\�;5\��V׏+�\�_>��Ur\��<���G��\�)\�q�~wH�G�+�\�>���Rig�P\�\�Tp���~�\�}����T}��\ZR��!\�\Z.�.\�j`8�~�\�P\�C\rd<\���NhZ?\0F:m�\0\0t���zl2�\r�5��*�\�Qeg\rZi0\��\��e��.i���\�\�\�虓q\�\�;^\�\�\�;P\��\�M\0�\�u}�\�h\�`2;}wvp�Y��7H��\��Y/�m\�\�i�\rÁOg\�gA�ym�@\�}$\0\�a\�\�\�����v�\��\�k/��\�-p�-8�\��^hk鑘A\�7\�o���6̘BqO7�pё6�_�+!]\�Ӡ\�ҒWj�\�;\�\�{8���\�\���u�\�m���\�_\"Q~�j\�\�/șbF=ǩ�3\�1�N�Z��\�\�l-��G�460`^.쇁x\�eg:�:\�|\�I=\�N\�\�`��\�h��	s4\�Ga\�����\�\�NUK�]\�\��*��U\�3\�>����~\r\��o���}�G�\����\r\�o�\��+x��\r��\�\�\�{\�\�\�_�\�?R\�Q�{��\�����|(�\�\�5܆\n�x��\�\���\�y{z�W\�\�\�:���\Z�y\�k/�\�/y�%�\�)�\�#\�\�\��4\�pM\�j�=X�\��j\��c\�\�KNz\�IQ룇\�΋\�`e�\�*\�4]�HS\�1�(����\�~A�wϨ\�\�I�]9��K�Tr\�\��\�\�7�S����\�*9���O��\���~\�r\�~�\��)\��\'\��\��|�Oq_Pܾ}z�\�\�J8���}�\�ß(��p�c�\�Q�wo)��{\�:����|�\��+�\�\�=��\�}�\�K_��\�q\�\�:�f��+!JC��2\�\\K\r\Z�I�Z\�ԊW!z��xu{oO�.4\'�\�Ӎ%1\0N���~�� �\'\��\�Y�4\�\�.D\���g\0��\��=x�\�\�;��\�;6�\�\�Yf�\r9)bs\��OXG\�\�ݼ�:�jx\�\�幜\�X��o�S�G6�\��\�7�_�c�O�\�S@\�e��3\�?\�#x��`4�\�\��?�\�yD~\�߽�\�E�\Z}UH��nF\"�\\�{\�\�\�\��\�\�\�-\������\��H\�=sЯz�:,s��\�\�q0yZ�M\�Bu�ki�\�k\�P�Áŕ\�h�<[�5\�\Z�O\�PS���j�%Im9\\_\�񺐌\�Y���<7�L��h� CC\�zﹷ\��\0Bܖm_W�Qg�!I{xoGvJh\�]{[�7.�\�\�iDW:N+��\�u�\����m]\��\�\0�7�0��\�]\����K\����w]x�/:��G������\�;�\�%��So\�\�c��\�N\��a{-?2�\"\r$���ΰ�\�\�\��+�\\�y<�@w�u\�\�\��ޱ@�|�I\�%�F9\�P�\�-th�3_k\�yZm\�E�g�?3N\�q�Ԝ�֜K\�͍F\�@\�Ӡ\��\�x\�*�\�E�)�\�1e�8���\�)\�̷ʾĸ��\�\�~�\�\�s��R�@.�p\�����.�Y\�\�\0��(\�ӏ��G��\�\�C\�S܁���5\���諏��ˏt�˷u���\�ۯ��{\�\��/����}�\�J\��oJ9�%�X�G\0��/\�|���R�4X���J�\�B\��,�d�����_\�-\�|�xv\�p�)�׆]��^k}��>&/���>H�-\�a$\�\02�R�AoOh`��\�\�]��709\�\�|�yl�\�M�\�L>�\r;�\�\�<�g\�~\��\�\�8R\"�\�\�\Z\�k����\�	\�E�Ƿ\�\��07\�m�8\�)0p��)\�S���Ֆ�:�\0�a�X\�ۣ;\�\��Ӡw>$\�ɹ\n�.�Ѩ9/���\�|M��\�\�ca�i�:>��1\���\��cz�\��&�վZMT��/\�6\�\��\�\��#ᐺ��\�\�7j��Ouw���	h�I\�Ǚ\�}���j̄e�S[�E�\�ᘊ\�ՙ���o_K\�u�>R_f���\����A����b\��\0�e�=+UMi	�M|�\�7Uq\�nN3Ǐ(\�\�>\��]��n\�\�\����\r����.}�{��\�:�\��ԅ��C�\���\�7:�\�?�<��\���1o8�\�O?�\�{7�`�\0�\�*ּ\�\�5S��C\�\�HD\�Ǵ�O/l\�\�۴;T�\�P�=��6�x��I\�﭅u!7\����\�\�o����G\Zο��\��Q���*�sX��O�=\�\�n�P�.<Hyg�Q\�\�\�J?vT��>\�\�wJ���p��\'�r⸒�P\�\��K=:�O	��PҹO�x�3\�\�s�\�_r�\���\����s=\��%`�Bw��(\�E���;z��[��ٛ��\�_u�\�\�\�\�������b���b��Nw?��)\���*FTEU\��+j��EOVgJ\�&\Z햆�n\��\�Y3V\�2�a\�\�_�\�zjC�v\r௸\�vge\��Χ�W��w��i�Sh\r:��{��\�.<��}ȅ���Xg��5�\�=�����>v\�\��(��kNr\�ZϾ����0��g\��҇�Ak\�Ao���!d2��\�8��Q\��\0۶�^�\�h9�\�)��S^���p���o\��>\��\�\�[9(犻�]�|W1�j9�N�j\�\n�\�\�{\�<�\�R�\�x� �l8�\���ޢd\�=�V\�m\�\���Tz��j���7\\�\�K\�\�~\\��\�3� z��n���/Uz{�\�o���gT�0�\�k��s9xS�xꖄ\��\0tC\��\�Z\�=�˽�\�i��0d\�\r��\�\�[3�Ԙ�����GBսʋ>���\�\�\�\�}z#�k�ؿtͻ\�\�\��\�\�\���O~�w�=`g\�\��s�\�й����\�Օ\���k�Fo�X�\�ˍ)܆�o\�շ�:u:5pX\�V�\�\�d\�BlA���\�\�\�\�gx�g�\�\��\Z�tAuJ��\�X\�Rʹ��\�}Q�\�^�\�\�M\�\�s5U��ႫjO>��[��\�_A�?\�k~�\�Sߨ��	堿��\�k��\�P\�J;zTi\'�)�\����pB\�\�\�*�\�E�\�R.�R¥�zt\�$\�\�=��\'O\�6���\�xx�x��b\�\���\�s�(\��Nw~�\�\�ҽ\�.N�~�!x�\��\�]\�\��g\�\��G]��w�q\�w�su௺3���\�z\0sH�\�Ce\��Ly\�P�\�c*�pF�g���Q�_\��VW\�E�]��Zs�LeZ\�\�\Z�p���Q�wG\n�7\��Эx3/����\�lO\�\'�\�\0ƔבsW\�	��r\�x\�`��8bL�\��\�KC\�<\�F(�	\�w�a�a���X\�\�SVkq�YKP\�1�x�\����^k7(#��\0�ތ�ېe�q 2�\�5�\�.sĬoOy\�\�<r| ���\�\�\�,=߅C\�����\�g\��p�\�Ros\�|�\��\�\�\�\�\Z�ˆm\��\�r�p#\�Mx�\�B�\���m�l�SSV�\nn_U\�\�\�zx��R�wW/�0�kw���.�R\�\�̱J>~H\�8��\���q~��.\"/\�W�ٯa�_\�r{TEQ\�0\0\�Uw[Mn6��(\�\��{9*�*aC�\�_n?ݚ��\��զ\�\�\�\�Wm\�eG]R\�\���ۯs�3�\�[h�_+����\����~�uGt�_\�\����ޛ���\��Ag\���\�}��\��ZQ\�|���Io\�ʻt�눻\��\�h�Q\0��|\���W\�\�;S˚-\�\��\�?w���mP�\�lM3\��\�*�\Z�\�\�XM�&\��4�n�F�Tfi�,YC�w�\��\�8���z\�s���R�\�Y\�\�C��\�Ç���ܯ\�\�\��\�\�G�\�O;�\r�K\0��E\�^��%��l.X\��sJ�zQIQ�w\���\�\�+�\�i%]\�\�\�#�{\�\�N�\�Ğ\�\�#G�\�\�zt�l\��\�}��\�~��n\�K7�����5h�\�C\��oA�>Ե\�?\�\�O\�\�CF\�g*}\�\��o�\�)\��7\�=��\n/\�Sٍ���9�\���x�84]�?I\�5���Ic�Ԏ�\�P\0?\�\\ʄ�v\�嶼{�x�����\�Pd0\�^��1���{|�\Z䫃�殞\�m\��a���\�~G�f�3=��\�k\�\\��\�xΑf�b0\\>\�ˎ!\��\Z���\r�oC_{\Z\���ǖ��\�J>\�N\�\�9\�~3�P\�d�G��0�e\�\�jC\�50\�1~ݻ]�\��_\�8�\\\'\�\�\��\�U�\�J\�V61�aW��\�RjC�wCOg\�9��=?]�n)�9t\��q\�\�82�\�P֥�ʾpE��(%*J�/*�$��$�:�d�z*\�l3\�\�7J>򵒿;�T�G\�\�\�*�~Y5x\�f�}{z\\(�\�\n��\�@�*\ncO߇�wQ\�\�\�dd�>힪\�*\�r�/�Gwt�\�����nڻ�\�\�\�\�ͫ2\'?����6�hw\��7��o�Ig\�}K\��X}�(�\�\�ۿ1]ߨE@�9V}\�\�߷���\�\�7\�\�\�.qaЍ��s��#\\\�\�v\Z�\�Q�Ն\�\�\�j�2U\�eI\�)ƲƢu�� Z��\�\r\�\�$\rՑ|A\rw��\�\�!e�?�䓀\Z/�r��X�\�\�q�G\�*\�$0&�\�$s\�SΜ�\���_�r]�n1\�F1��#JY\�W�\�Q\\<GE��V4VܑЃJ?s�\�\�;\�Q\�\�\�J<u\�t��yXiQȇ\�\'{��n9�[\�~�[?B?���>\�_A�@���\r\�?\��t\��t\�ӷ�\��J��Se`Ys.�ߢ��ב&W�(}�}YE\�7��B��δ3\�ɸ�ެ�\�;������L\nK�\�\r�r�@�Va/�9��l��\��\��B�^����\Z\r��ա\�\�s\��=&�c������U\r�(\�Tc��B}�n9ݪ\�.�v�h�1\�խ�\�n\��wA��\��6<��: x�W�r\�ζ��z2^�>�\�\��iF�q`O\��x[\��\��|���\�\�:�\�:c\�{�kѠ_\�Ѣ��wM|Wv\�~\���,Ar��~\�َ���\�\�{�\���W�Sߘ\Z��[\�u\�\�y��\r%_�U\���̍���xO1\�\�(�\�-�\�5ş�V��(%�����ē����\�1=����=	c=��3gU}��Zc�#\�:s#-�]��\�Kw�y�5��\�.�ڿ!;QUx��Gw�\�7���Jǹ%\�~\�~}Gw�Q7�\�P�����K���+����߂\��Yބֿ�W�}�]|�\�?�H\�8%W\�}c�\�4ҥ���0M�a�[?,�\�{(�[G=Y�^|z��3��\�C��i�.GS\�i\Z؃��ՕuGMi7՜rM�IQjK����\�ܢq�\�F��q\�Ts��J/\�\�%�\�n��c%���\��<\��щ\�v\'\0\�1@�-`=�\�9�t�o.�/�\�\�E��\�F�\�\�^U\�h\�b��._Q>\�\�=\�\n�a �lYg�)�\�X\��J:q�����\�/\���l��u�xD��|w�\�w��P����&�&�rY\�\�\�֥O�����}Kw>{o��\��)�\0>��~~F�rCu\�2/q,L�2�O�̓��wHM1\�\�wJM�΢�4RxO\�Uɚ�\��WѪM�=\�<$�\0\Z��|a@��7\�\���T\�\��\�\�L�<\�.`wJ�\r�~u��x/A)��ZC\�M\Znh\�Xg�&�{5\�ӭY\0�\�\�\�T=\�_ozz�\��3\�\�\�\�qX\�o\���1�\��Ɓc�^�u�o\0=Fc\�\��w\Z��\���\�}@\��N1v\�\rK\�M��n\���h�\�@?\�\��خ:<�{���\0�\�(R��2l\�\�%S~\�˧�~\�����igՖ�4x\��heܼ�\�\�Iʽ�����\�	ʊ{�\�Gqʋ�U\��X\�ލ\��\�\�|��w�~\��R��)\�\�5%�����\�\�Uu]\r�\�\�\�Ԛ�HTgq�zJӡ�\�\Z�\�\�@u���#\�U\�l�)\'\�\�WҠ\��5\�^��^an��\�菾�;��\�\\�.��1�\��O�ŗ\0�}]yﯺ��?�\�\�\���х�\�ѕw\�ѵ�\�	\r0��xGo�.9s\�]O8Zk�\�.\�\�:\�\�,C\�\�0���\�\ZkKPϹ�,M�\�j��:�P\�)x�\�Ӫ{pFew\�4�O�`W]=��K\�T\�ȿrT�x�\��h���+����x\��\�\���:�\�K\�\��)�[t�\�\�SЛKJ8\��\�*\����\�oN\�yݽ���x��Q*�ŷ�7.)/��<l\�\�I�����\��+��gJ<�9ti�\�\�ߏ�T��CJ8rPIG�j\�\�+_C�\���\�(iw�S݅Z]��w�����N\�\�\�[o1��%\�\���n��\�|��\���b>}S�<�T��|o�t\�,����`#^-�ȹ�����\�\0|��[G\��\�όF\�\�\�aax�A@��r�\�\�at6�ٵ\���r�\�Z�\�ݙ\�\�)\�\�6\���\�P\��9��sa\�\Z���W�p�+d�E\�<��3,\�\�xh^7\�氃\�T`K	\�\�;?q?H3�;1C\�#\"?��VzoP\�4;�Ļ\�T���0���\0�\�pȻ�gV\0벃q��\�\���hʒ��6TǝuE$�\�B�\�q.���w\�\�~\�5�\�ֽ�Va=�H\�ά�H��x���W|kV�:2\�՝�[u!�L�!K��\�}\�yx\�B����\�\\��\�\�,U\�(7%K\�w\�a���~�6F\�Jn=PeL�\�\�bՒ�\�<p!l�\�_a໊o��޾\"�}N�jR�#��2��W\�\�\�J�|@�>ӃS\�\�\�\�7��t\�\�\�\�\�\�Q́�\���\�6\�\�\���\��3�U\�ɏ�\�-(�_u��]�\�\��X�+��)0\"�\0\0\0\0IEND�B`�');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbljob`
--

LOCK TABLES `tbljob` WRITE;
/*!40000 ALTER TABLE `tbljob` DISABLE KEYS */;
INSERT INTO `tbljob` VALUES (11,'ADMIN'),(12,'CASHIER'),(13,'HAIRSTYLIST'),(15,'MANAGER'),(16,'THERAPIST'),(17,'NAIL ARTIST'),(18,'ARTIST'),(19,'EXAMPLE');
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
-- Table structure for table `tbllocation`
--

DROP TABLE IF EXISTS `tbllocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbllocation` (
  `intLocationID` int(11) NOT NULL,
  `strLocationName` varchar(45) NOT NULL,
  `dblLocationPrice` double NOT NULL,
  `intLocationStatus` int(11) NOT NULL,
  PRIMARY KEY (`intLocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllocation`
--

LOCK TABLES `tbllocation` WRITE;
/*!40000 ALTER TABLE `tbllocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbllocation` ENABLE KEYS */;
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
  `intPackageStatus` int(11) NOT NULL,
  PRIMARY KEY (`intPackageID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpackage`
--

LOCK TABLES `tblpackage` WRITE;
/*!40000 ALTER TABLE `tblpackage` DISABLE KEYS */;
INSERT INTO `tblpackage` VALUES (1,'Wedding Package','SAMPLE WEDDING PACKAGE',1,7,'NON EXPIRY',1),(2,'Wedding Package','SAMPLE WEDDING PACKAGE',1,7,'NON EXPIRY',1),(3,'Graduation Package','SAMPLE WEDDING PACKAGE',1,7,'NON EXPIRY',1),(4,'Graduation Package','SAMPLE WEDDING PACKAGE',1,7,'NON EXPIRY',1),(5,'Graduation Package','SAMPLE WEDDING PACKAGE',1,7,'NON EXPIRY',1),(6,'Graduation Package','SAMPLE WEDDING PACKAGE',1,7,'NON EXPIRY',1),(7,'Graduation Package','SAMPLE WEDDING PACKAGE',1,7,'NON EXPIRY',1),(8,'Graduation Package','SAMPLE WEDDING PACKAGE',1,7,'NON EXPIRY',1),(9,'Graduation Package','SAMPLE WEDDING PACKAGE',1,7,'NON EXPIRY',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpackageprice`
--

LOCK TABLES `tblpackageprice` WRITE;
/*!40000 ALTER TABLE `tblpackageprice` DISABLE KEYS */;
INSERT INTO `tblpackageprice` VALUES (1,1,2500,'2016-03-10 16:14:36'),(2,3,2500,'2016-03-10 16:16:43'),(3,4,2500,'2016-03-10 16:20:37'),(4,5,2500,'2016-03-10 16:21:19'),(5,6,2500,'2016-03-10 16:23:21'),(6,7,2500,'2016-03-10 16:23:59'),(7,8,2500,'2016-03-10 16:25:03'),(8,9,2500,'2016-03-10 16:27:26');
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
  `intProdStatus` int(11) NOT NULL,
  PRIMARY KEY (`intProductID`),
  KEY `fk_intProductCateCode_idx` (`intProductCateCode`),
  CONSTRAINT `fk_intProductCateCode` FOREIGN KEY (`intProductCateCode`) REFERENCES `tblproductcategory` (`intProdCateCode`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproduct`
--

LOCK TABLES `tblproduct` WRITE;
/*!40000 ALTER TABLE `tblproduct` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproductcategory`
--

LOCK TABLES `tblproductcategory` WRITE;
/*!40000 ALTER TABLE `tblproductcategory` DISABLE KEYS */;
INSERT INTO `tblproductcategory` VALUES (4,'Hair Wax'),(5,'Hair Color'),(6,'Hair Gel'),(7,'Make up');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproductpackage`
--

LOCK TABLES `tblproductpackage` WRITE;
/*!40000 ALTER TABLE `tblproductpackage` DISABLE KEYS */;
INSERT INTO `tblproductpackage` VALUES (16,8,12,2,0),(17,8,13,3,0),(18,8,16,2,0),(20,8,16,2,1),(22,8,16,2,1),(24,8,16,2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproductprice`
--

LOCK TABLES `tblproductprice` WRITE;
/*!40000 ALTER TABLE `tblproductprice` DISABLE KEYS */;
INSERT INTO `tblproductprice` VALUES (9,12,95,'2016-02-27 08:27:33'),(10,13,100,'2016-02-27 10:32:23'),(11,14,250,'2016-03-04 03:28:52'),(16,15,50,'2016-03-05 08:25:50'),(17,16,20,'2016-03-10 14:40:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpromo`
--

LOCK TABLES `tblpromo` WRITE;
/*!40000 ALTER TABLE `tblpromo` DISABLE KEYS */;
INSERT INTO `tblpromo` VALUES (1,'Birthday Promo','Birthday Celebrants have free haircut',1,0,'NON-EXPIRY'),(2,'Buy 1 take 1: Black Beauty','Sample Desc',1,150,'2016-7-8'),(3,'SAMPLE PROMO','SAMPLE DESCRIPTION',1,500,'2016-3-23');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpromoprice`
--

LOCK TABLES `tblpromoprice` WRITE;
/*!40000 ALTER TABLE `tblpromoprice` DISABLE KEYS */;
INSERT INTO `tblpromoprice` VALUES (1,1,0,'2016-03-05 03:47:11');
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblservice`
--

LOCK TABLES `tblservice` WRITE;
/*!40000 ALTER TABLE `tblservice` DISABLE KEYS */;
INSERT INTO `tblservice` VALUES (31,'Sample Cut',12,1,'Sample Description','121321	'),(32,'Special Cut',12,1,'hair cut','�\��\�\0JFIF\0\0`\0`\0\0�\�\0C\0!!$-K0-**-ZBE6Kl`roi`ifx���x~��fi�̖������r�\�\�Ϻޫ����\�\0C!!!-\'-W00W�{i{���������������������������������������������������\��\0\0\0'),(33,'Senior\'s Cut',12,1,'sample detail','�\��\�\0JFIF\0\0`\0`\0\0�\�\0C\0!!$-K0-**-ZBE6Kl`roi`ifx���x~��fi�̖������r�\�\�Ϻޫ����\�\0C!!!-\'-W00W�{i{���������������������������������������������������\��\0\0\0'),(34,'Junior`s Cut',12,1,'sample detail','�\��\�\0JFIF\0\0`\0`\0\0�\�\0C\0!!$-K0-**-ZBE6Kl`roi`ifx���x~��fi�̖������r�\�\�Ϻޫ����\�\0C!!!-\'-W00W�{i{���������������������������������������������������\��\0\0\0'),(43,'Pedicure',15,1,'brazilian','�\��\�\0JFIF\0\0`\0`\0\0�\�\0C\0!!$-K0-**-ZBE6Kl`roi`ifx���x~��fi�̖������r�\�\�Ϻޫ����\�\0C!!!-\'-W00W�{i{���������������������������������������������������\��\0\0\0\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\0\0\0\0\0\0\0	\n\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\0,\"\0�\�\0\0\0?\0��(\�&ihh?4�x��cҐ��W�\0E�<\r�*ʭ�08�9�\�(��x\�&$�~\��\�8\�ϱGm+��kw�\��w���J��X\�ib�p��9�I>CH��\�9����V���U2\nɖ?( �ց�5T�K�\�M3FL�[0m\�9\�XM.\�R\�d�/(�;�]����\n\��j���j�wk$YDe8\�\�\�P&�o�u<�nx\�ǀz\0\�\��J��kW�<B\�Y\�q�\�c����D�\'�d�{��?uG���\rq\"��\�O�43��\�\�j�\��lRI�GnUAI3���ڢ����\�\��L���\�g��،zњ�6�l��\�>L��\0�\�pc�Ki�\�Iqt$����P<\�\�@�\�K�ʷ\�\�SNy�\"\��\�d�\��J\�M���q�Ȅ\�\�Wq\���\0iJ\rfC�\�6�r�1\"�E\�x\�9\�\�U᰷�\�\��\�\�r�݃\�Ҁ73HdP\�,��\�bܢY\\]��1�a\npI���\�\�U��4�CO�\�9\�G���\r\"\�c�\�B�a� �PsX�6\�]Iq\�Hn-\�m�)l�1�\�қsil��\�P\�\�$��djH��\�\0m\�\�Iҭ��Db2!�w\�~�q��A�[\�xɊ=�q\�#����+]>\�ೖ\��� |1\�H9jI��e\�m�Hȉ�ˮ\�\�1�����\\\����K�c�l����<e~��\�c7\ZzD�g?���\�2hf���.h\�%\0�����9҃M\��4�F\�I�F?-\0Z�[�n\���\�\ZY�銻~�j:T\�<af�p\�=W�>�B\�Ș�	*dr2�5b{����2b����[�$ѹ�\0��?�\��\0\�\rG\�\�s���S���S����50\��gp��S\�\���]br\�\��\�LP#d\�v\�≏\���ڌ�V����g��j�\\^�\�\\�\0tR�ppA�\�}��\�9�hU\�\�͠\�9\�4�+�V\��\0=eU��*���^�$c�Z8�Vm�\�\��F�8\�QL�\�nn\�Q\n��o��P��\��>\�M���:UYae���Fe\�\��N3��\'��4�\�\�ys3X�փƷ�9W�ЊL�/�[;\�Fx\�\�Ӟ�z*�|2�9\�@����uw[&x2*�*d0\�Y\'�k$rDy\�09�\"�j2l\�t\�z��\�V�u�p紡1�\�Y�Z\�\\H�\��B`�ps�^i\�)w\�o{e�H�CrGL\��\��6�\�W�f�\�\�#7_݄�\��+:\���\�+��c\r�\�\'��+E�Ig�V{`�6��P�!!�\��ц��g\�\na�!\�\Z4�\�H\��S�:�Y����7a��b�-nm\�<\�V�5B$�ҕ���d^\\:�3;�v�ʭ[���\�s�T�`:�:\Z}����m�`۷n#��<S5�\"=��F\�6=�E�4\�t�k\�c���\�*\rU�m���g�a,�\�\�i��W�O��E�[\�\�l\�Wɶ�H�\0;c�gO�0/N\�\�\����[\\\�ޏw\�*����ֆ٤�Wi`8�{}B[Cl\�Z\�+��\r�&�<�&\��\0p\��ȫ00�\�?�K�\�\�T\�\��l�1[=��q+�6@=����\�,\��\�\��%���\�\0AdJ\�FQ\�\�IP�e\�*W��\rb\�\�-OOJr\��\�l\�I�&vm�\�;��\����\�Z\�\��n01\�\0Nu�>\� \�\'�M\�\�WQ\�DWC�a�}Eg=��#H\�\��6\�s�5z\�#�Q��>���(�����8\�\�\��xR\Z\\\�\ZX>oQF[�(��.,ڟݷ֦\�V�8V�ԤԱn�\�E�p4~i�\��\r\0Aq�0�Q��\�~�CҘ�T՘\�**���Z��\�U��0��\�+�MX(\�Դ2\�jp5O\�\"��r\�qJ\�b\��.y�\�|Դ�;\�H[\�\�= %S\�\�P\�Ԅ��� �\�UC`\�G�q4IE( ���HR\�Q@���b�JZ\0Z3IE����8\�)(�X\�\�IFh-�\�l\�{s��JM\"Gf���4\�h�i�\���*\�#��ث�\�^X\�o�ƀ�җ�)���0!!��K\�\r��\�\�^EA\'\�i����[d�\�(\�I�pkB%آ�cE�>�\�\��MiGz��ςj#/OJ�\�\�\�e\�h>�\�\�5@J\rK\�$SBd\�JrI\�U��T~i��)��j���!���x��\�w4S�\rIL��������\0Z)(�QIE1ef�f�\�QE\0>�~-AÊ��,\\Ӆ34��S��\�<\Z\0�3S2	i�#<Օ4��C��\00\�\�juTpz����*��4�\�\��SWm���3o\�fn�*&S�\"�\�%���t6R�6�(�\�1�^J�\�M�t�p���\'Ҥ\�\�)\�\nl� �\�E�r\r0��R��`1�g\�>\�n=)�1�u5+t\�\�m\�I��\���\��^I9�I&NsH��2*	\�)\�4&i\�M��v�[W\�5�\�@hD�JZJ)�ZZJ(h�������8�\�\�sKL\�Z)(�!�\�JX\n�iKi�Ƀ�O�_Z�P!\�)��)�5eMUCVT\��J�2�i�Ӂ�s�\�T���\�\�Mn��q\�\�TXl\�\�(o\�=h*GCN^MN�1ڀ Y�uV\�坾\\�WdA\�T\�q\�\� dG-�\�	I1�\�p����*)w\�d\"\�6qW\�SpoqT@��e`>��̹\��\�����\ng#�e:\�r9��d�\�cr��(�}\�%�u\'��Eh\�38Q\�\�\�:f\�\n״����,_e�(9QҮ\�\��ũ{���Zh��!\�RR\�\�I�(ii)s@P���e�EP1(�\�\�S!�^��CSw4x�\nh�\n@J�e:UU�)@\�A�\n`4\�i(\�k>\�v���׋�(�\�\�M�T!�)jV!;���i\�\�\��b\�\�Jx\0S\�\0�\��$�kn\�j۠�E�R��@��*�\�W�ž�K��\Z\�*��x	\�9�h\�Q�\r\\��jo�5Q�v��8dj=�F\�Z�\�luTv-�A\�V�8L�\�d�\�Ut\�٧Fi�\���\�\�!sKIK@E&ihii(�&���e�KM��\0M(�4��)�\���\�*,|\���V�N\�N\"Ք��V#�d)�Sƹ��\'5V���\�P\�}\�dҸ\�SbGjaj��<TeMP�\'�\�q@�\'4XW&B�jK\\4��j�\�nPA����\�\�*��qQɪ\"u5J\�V1�VY|Nj�t�)\�5f;���\�\�\\��c�\�\�d>c�\�:R�\\��Kv5uxri��Ԍ�\ZDUV%@\�ғ4\�\�\�\�\�E0�Pi���K�n�-\0:��)\�\�P))i���P0&��\�u*\0�\�\�\�\�K��>�r�=�Ƚ\�B\r1\"a;}i\�\�\�j\nZ@[[���Y�h\��\n\�4i��k\�\�z05e�\�m���&�Gʘ\'&�\�w\�U%9�Y\�&5#+H0sҢ\�\�5;�{T;>cT!J�\�\�n�����\"�\����\��#�D�\�\�r;U�G�\��BP7\Z�!-\�Q\'�\�@dֶ��(ϩ�qZ�\��ZPC�u�\�c\�zӳM��\�\�晚PhL\�\�\�.h 4\�j0i�\���\�74��R\�ih�\���覜!s�4\�0\�R�����!��\��\0FMY�P\�\�*#\�f�& \�P�\�7\�x {\�\0T\�<�\�H��8\�1J�V�V ��\�X[hЏ����S*(��\r��-\�B`��*\�\�_�\0�.*\\�4�\�\�҇�昤��I9a�\Z2\0\rEǩ4�u��)��!\�F�D��ex\�<��Q�n�S̓HV�A�\�JE1���8\�3@\n\r8(�;n0i��Z�idm�@_QK�z\�iO4	�^�jl3b�5������WP~\�@\ZB�\Z����\0ԫ{\�[�늅g��0�\�\�P���җ4\0�KM��#�3�o�j:\\\�\Z���\r&�I��R�m\�@�!jU]Ɯ\"5b\��M\0>\�\�I9\�Zю\�c�5* D\0qJ@*-!1Mc���j7�*J̢Pi�sM\�i�\�ɢ\�(\�N\�D\�f��6\��\�V�s6`T\�C\�qM\�Ol\nd�X\�u��,�8\�Xo\�\nc[\�i�Dă���`\�\�V\�⦈�L	��u�\\���\�]��S�!lP��e\�b\")\�\�\�\�Ԁ�z\�f�i3Lb\�IKH\�.i��\0\�O�8Jã\Ze-\0N�R�\�\�J����S\�-\0i.�����\�_J\�\�-\0Tۊ\\t�`R��D�1F9\�.9\�R��\�\�ֵ\"� ^\0\�\�Um\"��\�\n���2e$饾��Fj=\�%�Zc9\'\�*C�8���:\�P\�R�Ѳ9\�N\�z\�$}E$ƚ��\�\�[\'#�14\�\�f�\�7>�\�ZYG`:sI�֫��\�^\�D�1\�9�1Ȧ\�V\�P�Ҕ|���7\�\�HZ��*��`u�i6�\rVf,y�\�#g�,\��֢�\�\�!�\�\�)�vh\�&h\�!��\�74P\�i�P�٦f�4\0\�Znh\�\0Fzю/�\�\�\�VHc4\��4Ӓ\0�HI\�� /G�G\�iY�|��/���e�&��j2٣v)�J���)ṥrd�U!28�)\�iNh�\�\�iH\�!�$�Rp94\�\�Ҝr�;P)1J�x� U\�M`�N���lɅ&�ʻ��*\���ALC\�\�b�\�\�\�Q\���\�!�w.y\�J�LQS/JLhQMh	\�S�\�sL[��0��L�����Tn\��ƭ\�\�:Z��\�j�\�õ\02�#�\0�����KM����\�.h�rNh\�\��Q�E\�:s\�THo\�\�T�j���NS\�o\�@\�T,\�=8��aA\�C(hzz��\�\\�w�++us�\nC*��N��Wny�se��NHVT(f�n8�P�8S#\'=)\�#��h�v���E#�`�S���\�W\�l\�E;Wk��\�%�M�\�M!6i�S\���ц���\�b��<�>j)�y\�!�\�4�N\�ڢ\�LD��\�\�E����q@\np\�S\�=j\�p/�KE\\͙JD&�\�t\�[�ډ�(8��GF���A���h:���H9Py\�?\Zv:\��\0xT\�*?z�G�G\�\0v\\\�\�\�\�5n�TMl;T	+�|�\�z\�\�v?�R�\�\�i�c�]Y\�R�ս\�\\\n\"����\�\�D`a\�LQ�0GZ(\0\�[;~��`�\�ލ��G�.}OҨ�\�O駧�\��\�\�I��@�)����R�\0d~]��P*l2\�/�@���eU@\0\�\\�Ps޺i�=iXw/\Z�5��/\n�\0Χ��\�$o�稠Fq�\���a��}�a)Q\�5kP�&���b�̙�\�\rq\�d_��j\�\�`�c\�B�H?��:[��2�\�i�e�\�j�\�V�\�(�@�\�\�j�p(M�#��� \�c\�V�b���ZɁ�4�͸�\�M\�b��:ӃA����fͱ\�5r:˵�\\=j\�rn8�ˠ��C=�\�x\�w�&\��y�J��H\�\�1nʞ�\�N�<[7(�[��x\�\�b\��?�1\'?L\��\�e�l��2H(@\�8\�61���\�\�\�S�\�F(\0�4��Ѱ4\�\���Ԙ# \�z,���*º8\��\�ڪ��H\��\�6\�\Z�aM�2\�D�t$�\�S-�\�*sJù\\\�\'�\�Jw\0\�;L\�z�\0:^�ہ�SVH��Kȡ�\�#\�ڎ[$���\�F?J\0k}s���#�R�t>\�c\r�Z`BP��vT`�q�\�zt΢�\0RG�z@X���ɗ>��:�R8�-L�F��ϗ8�T\Z�\� ��i\�7\��\�e\�7x�\�\�^�=B\�\�%�>I\Z>��\�@\�*N|���\�ĸ�#N�c̢I�y5\�<\�\�L�M�\�0}�*\�X�T��QU���^(��\�F���㡤mZ\��~\�¬\�j�\�F\Z6F\��֪\�\������D�ݞ�(\��P.�d\���\r%\�\�A��U��i\�\�\�k(\�\�r\�\�h\��\0Z�F\�\\ޓ�\�\�4\�7.z\�\�Q�Y��m\�j�M��\n���£�W�vӁ��\�\��)<R\�Lr߅o\��\�$�\�[\�YA�=9�{V��$6vѐ7��\�q��\�<w\�1\�\Z\�\�\"\�\�@\�Q���\0Z�ij ��!F\�\n��A\�\�E�熠\�@\'\�4�P8\����-L:�m\Z�\���\�Tu�\�[ċ\��\0��o� ��G4�s=\�[��ʡIQI\'ҷ�6���C�\�Rh��y��1\�n;�~jb9\�\"�}\�Ҟe\��+G]�3\�։K�ݞ��\�;$ ~�\0}ߺ\�\'҆\�u\�\�\�8\�\�JK=(\0�ɥ\�qH�\'��ƕ�Nr:\��\0t)��,98��1\�J6�2x��B�\0֓\r\��Ҫ�X\�ƚNO�0\�0��?:R\�go\'ބn\�\��(��]\�.��I�lP@ۏ�\r �A��\�.=(�0ߝ\0.zd��\��Nz\�rݷ�?\�s\�aC#\�\�##���\0ȴ�\�G�*`Ow���\�\�T\�Ԧ�\�~\�\�\"�\n7\��\��Sl�\�Ӧ�\��\�\�V\�1H\r\�;\�^�\0\�ĕZ/��qo\�U$\�\�6H\��2��۳��u9WK���(S~�\0׼�\0�4X���o\��u��u?�	�ȵ\�\�$�Z#P3�ҫͬO=\���D`�>��:D�d�X��<\�V���\0l�\0\�\����\"�\�!M���U\��A��\�-s�vn�\�Z\0��M\�\�h@\�`\�?\Z�Ä��\'�W�\Z˿�{����FU6\�6sޤ\��\�|ݑ��a�\�(x\\gK�^\��P)��\0\�v\����a�\0iL�Q[��j8|\�\�\�*f\�%��+�!�J\�\�\�4g]����\�r\�s���j֖k�gF\"\'p=�1X�\�d]�\�rH�?CQ\\kOo7\��8\���@\Z�ǳ\���~���n	�xK�VS�\��\0oK��<[&vl\��\0|\�v�\�֢P WH\�n�\�@4�ue����\�\�\"x8\�\�\��1=�wj�|����\�k:\�V�\�	�&��c=io�)�Ex�8�\�h9\��\����\�\\�\0�?�A��\0\�^�\�\��V\��)l� `ylb����\�\�Y� \�.r���s@��\�{�GA\�*��_\� �\�sW�V�9n����\�F�\0�\�*+\�\�/c�W�F����\�L\n�n=@4rx\0}jHv��0�I\�\\+h\0\��ן�\�\0P���#LaKu\�Z��ȑ�6	\�)qe����:\�zw\'�#s�Y���󒧓\��qN�Z���\�\�\�s@\�+e�iDNy���[4\�9\�֘2�\�{S%��E�v\0�\��sȢ�`9T�9=9�H�g�P7\�̣�:5�,O4Q@\�v\�1\�\�!\�:s\�4QHh\�0H\� P1\�ڊ(\���\0�4��.6�G\\\�E1��q\�N\�\��(��\0\nTm�H#ڊ(�4�\�\�x\�\�\�\�(��A*y��\'-�\�=h��\ZķҤD�\�\�4QHGe\�&�\�<\�E0\�`^O\"�g�E\0�y�Nl)��\�Pd&23\�=G\�&\nxҊ)l��#�Z@\�3���`\'��4\�\�1�=���\00=iBo\�>�Q@�\�'),(44,'TEDYY',16,1,'asdfasdf','�\��\�\0JFIF\0\0`\0`\0\0�\�\0C\0!!$-K0-**-ZBE6Kl`roi`ifx���x~��fi�̖������r�\�\�Ϻޫ����\�\0C!!!-\'-W00W�{i{���������������������������������������������������\��\0\0\0\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\0\0\0\0\0\0\0	\n\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\0,\"\0�\�\0\0\0?\0��(\�&ihh?4�x��cҐ��W�\0E�<\r�*ʭ�08�9�\�(��x\�&$�~\��\�8\�ϱGm+��kw�\��w���J��X\�ib�p��9�I>CH��\�9����V���U2\nɖ?( �ց�5T�K�\�M3FL�[0m\�9\�XM.\�R\�d�/(�;�]����\n\��j���j�wk$YDe8\�\�\�P&�o�u<�nx\�ǀz\0\�\��J��kW�<B\�Y\�q�\�c����D�\'�d�{��?uG���\rq\"��\�O�43��\�\�j�\��lRI�GnUAI3���ڢ����\�\��L���\�g��،zњ�6�l��\�>L��\0�\�pc�Ki�\�Iqt$����P<\�\�@�\�K�ʷ\�\�SNy�\"\��\�d�\��J\�M���q�Ȅ\�\�Wq\���\0iJ\rfC�\�6�r�1\"�E\�x\�9\�\�U᰷�\�\��\�\�r�݃\�Ҁ73HdP\�,��\�bܢY\\]��1�a\npI���\�\�U��4�CO�\�9\�G���\r\"\�c�\�B�a� �PsX�6\�]Iq\�Hn-\�m�)l�1�\�қsil��\�P\�\�$��djH��\�\0m\�\�Iҭ��Db2!�w\�~�q��A�[\�xɊ=�q\�#����+]>\�ೖ\��� |1\�H9jI��e\�m�Hȉ�ˮ\�\�1�����\\\����K�c�l����<e~��\�c7\ZzD�g?���\�2hf���.h\�%\0�����9҃M\��4�F\�I�F?-\0Z�[�n\���\�\ZY�銻~�j:T\�<af�p\�=W�>�B\�Ș�	*dr2�5b{����2b����[�$ѹ�\0��?�\��\0\�\rG\�\�s���S���S����50\��gp��S\�\���]br\�\��\�LP#d\�v\�≏\���ڌ�V����g��j�\\^�\�\\�\0tR�ppA�\�}��\�9�hU\�\�͠\�9\�4�+�V\��\0=eU��*���^�$c�Z8�Vm�\�\��F�8\�QL�\�nn\�Q\n��o��P��\��>\�M���:UYae���Fe\�\��N3��\'��4�\�\�ys3X�փƷ�9W�ЊL�/�[;\�Fx\�\�Ӟ�z*�|2�9\�@����uw[&x2*�*d0\�Y\'�k$rDy\�09�\"�j2l\�t\�z��\�V�u�p紡1�\�Y�Z\�\\H�\��B`�ps�^i\�)w\�o{e�H�CrGL\��\��6�\�W�f�\�\�#7_݄�\��+:\���\�+��c\r�\�\'��+E�Ig�V{`�6��P�!!�\��ц��g\�\na�!\�\Z4�\�H\��S�:�Y����7a��b�-nm\�<\�V�5B$�ҕ���d^\\:�3;�v�ʭ[���\�s�T�`:�:\Z}����m�`۷n#��<S5�\"=��F\�6=�E�4\�t�k\�c���\�*\rU�m���g�a,�\�\�i��W�O��E�[\�\�l\�Wɶ�H�\0;c�gO�0/N\�\�\����[\\\�ޏw\�*����ֆ٤�Wi`8�{}B[Cl\�Z\�+��\r�&�<�&\��\0p\��ȫ00�\�?�K�\�\�T\�\��l�1[=��q+�6@=����\�,\��\�\��%���\�\0AdJ\�FQ\�\�IP�e\�*W��\rb\�\�-OOJr\��\�l\�I�&vm�\�;��\����\�Z\�\��n01\�\0Nu�>\� \�\'�M\�\�WQ\�DWC�a�}Eg=��#H\�\��6\�s�5z\�#�Q��>���(�����8\�\�\��xR\Z\\\�\ZX>oQF[�(��.,ڟݷ֦\�V�8V�ԤԱn�\�E�p4~i�\��\r\0Aq�0�Q��\�~�CҘ�T՘\�**���Z��\�U��0��\�+�MX(\�Դ2\�jp5O\�\"��r\�qJ\�b\��.y�\�|Դ�;\�H[\�\�= %S\�\�P\�Ԅ��� �\�UC`\�G�q4IE( ���HR\�Q@���b�JZ\0Z3IE����8\�)(�X\�\�IFh-�\�l\�{s��JM\"Gf���4\�h�i�\���*\�#��ث�\�^X\�o�ƀ�җ�)���0!!��K\�\r��\�\�^EA\'\�i����[d�\�(\�I�pkB%آ�cE�>�\�\��MiGz��ςj#/OJ�\�\�\�e\�h>�\�\�5@J\rK\�$SBd\�JrI\�U��T~i��)��j���!���x��\�w4S�\rIL��������\0Z)(�QIE1ef�f�\�QE\0>�~-AÊ��,\\Ӆ34��S��\�<\Z\0�3S2	i�#<Օ4��C��\00\�\�juTpz����*��4�\�\��SWm���3o\�fn�*&S�\"�\�%���t6R�6�(�\�1�^J�\�M�t�p���\'Ҥ\�\�)\�\nl� �\�E�r\r0��R��`1�g\�>\�n=)�1�u5+t\�\�m\�I��\���\��^I9�I&NsH��2*	\�)\�4&i\�M��v�[W\�5�\�@hD�JZJ)�ZZJ(h�������8�\�\�sKL\�Z)(�!�\�JX\n�iKi�Ƀ�O�_Z�P!\�)��)�5eMUCVT\��J�2�i�Ӂ�s�\�T���\�\�Mn��q\�\�TXl\�\�(o\�=h*GCN^MN�1ڀ Y�uV\�坾\\�WdA\�T\�q\�\� dG-�\�	I1�\�p����*)w\�d\"\�6qW\�SpoqT@��e`>��̹\��\�����\ng#�e:\�r9��d�\�cr��(�}\�%�u\'��Eh\�38Q\�\�\�:f\�\n״����,_e�(9QҮ\�\��ũ{���Zh��!\�RR\�\�I�(ii)s@P���e�EP1(�\�\�S!�^��CSw4x�\nh�\n@J�e:UU�)@\�A�\n`4\�i(\�k>\�v���׋�(�\�\�M�T!�)jV!;���i\�\�\��b\�\�Jx\0S\�\0�\��$�kn\�j۠�E�R��@��*�\�W�ž�K��\Z\�*��x	\�9�h\�Q�\r\\��jo�5Q�v��8dj=�F\�Z�\�luTv-�A\�V�8L�\�d�\�Ut\�٧Fi�\���\�\�!sKIK@E&ihii(�&���e�KM��\0M(�4��)�\���\�*,|\���V�N\�N\"Ք��V#�d)�Sƹ��\'5V���\�P\�}\�dҸ\�SbGjaj��<TeMP�\'�\�q@�\'4XW&B�jK\\4��j�\�nPA����\�\�*��qQɪ\"u5J\�V1�VY|Nj�t�)\�5f;���\�\�\\��c�\�\�d>c�\�:R�\\��Kv5uxri��Ԍ�\ZDUV%@\�ғ4\�\�\�\�\�E0�Pi���K�n�-\0:��)\�\�P))i���P0&��\�u*\0�\�\�\�\�K��>�r�=�Ƚ\�B\r1\"a;}i\�\�\�j\nZ@[[���Y�h\��\n\�4i��k\�\�z05e�\�m���&�Gʘ\'&�\�w\�U%9�Y\�&5#+H0sҢ\�\�5;�{T;>cT!J�\�\�n�����\"�\����\��#�D�\�\�r;U�G�\��BP7\Z�!-\�Q\'�\�@dֶ��(ϩ�qZ�\��ZPC�u�\�c\�zӳM��\�\�晚PhL\�\�\�.h 4\�j0i�\���\�74��R\�ih�\���覜!s�4\�0\�R�����!��\��\0FMY�P\�\�*#\�f�& \�P�\�7\�x {\�\0T\�<�\�H��8\�1J�V�V ��\�X[hЏ����S*(��\r��-\�B`��*\�\�_�\0�.*\\�4�\�\�҇�昤��I9a�\Z2\0\rEǩ4�u��)��!\�F�D��ex\�<��Q�n�S̓HV�A�\�JE1���8\�3@\n\r8(�;n0i��Z�idm�@_QK�z\�iO4	�^�jl3b�5������WP~\�@\ZB�\Z����\0ԫ{\�[�늅g��0�\�\�P���җ4\0�KM��#�3�o�j:\\\�\Z���\r&�I��R�m\�@�!jU]Ɯ\"5b\��M\0>\�\�I9\�Zю\�c�5* D\0qJ@*-!1Mc���j7�*J̢Pi�sM\�i�\�ɢ\�(\�N\�D\�f��6\��\�V�s6`T\�C\�qM\�Ol\nd�X\�u��,�8\�Xo\�\nc[\�i�Dă���`\�\�V\�⦈�L	��u�\\���\�]��S�!lP��e\�b\")\�\�\�\�Ԁ�z\�f�i3Lb\�IKH\�.i��\0\�O�8Jã\Ze-\0N�R�\�\�J����S\�-\0i.�����\�_J\�\�-\0Tۊ\\t�`R��D�1F9\�.9\�R��\�\�ֵ\"� ^\0\�\�Um\"��\�\n���2e$饾��Fj=\�%�Zc9\'\�*C�8���:\�P\�R�Ѳ9\�N\�z\�$}E$ƚ��\�\�[\'#�14\�\�f�\�7>�\�ZYG`:sI�֫��\�^\�D�1\�9�1Ȧ\�V\�P�Ҕ|���7\�\�HZ��*��`u�i6�\rVf,y�\�#g�,\��֢�\�\�!�\�\�)�vh\�&h\�!��\�74P\�i�P�٦f�4\0\�Znh\�\0Fzю/�\�\�\�VHc4\��4Ӓ\0�HI\�� /G�G\�iY�|��/���e�&��j2٣v)�J���)ṥrd�U!28�)\�iNh�\�\�iH\�!�$�Rp94\�\�Ҝr�;P)1J�x� U\�M`�N���lɅ&�ʻ��*\���ALC\�\�b�\�\�\�Q\���\�!�w.y\�J�LQS/JLhQMh	\�S�\�sL[��0��L�����Tn\��ƭ\�\�:Z��\�j�\�õ\02�#�\0�����KM����\�.h�rNh\�\��Q�E\�:s\�THo\�\�T�j���NS\�o\�@\�T,\�=8��aA\�C(hzz��\�\\�w�++us�\nC*��N��Wny�se��NHVT(f�n8�P�8S#\'=)\�#��h�v���E#�`�S���\�W\�l\�E;Wk��\�%�M�\�M!6i�S\���ц���\�b��<�>j)�y\�!�\�4�N\�ڢ\�LD��\�\�E����q@\np\�S\�=j\�p/�KE\\͙JD&�\�t\�[�ډ�(8��GF���A���h:���H9Py\�?\Zv:\��\0xT\�*?z�G�G\�\0v\\\�\�\�\�5n�TMl;T	+�|�\�z\�\�v?�R�\�\�i�c�]Y\�R�ս\�\\\n\"����\�\�D`a\�LQ�0GZ(\0\�[;~��`�\�ލ��G�.}OҨ�\�O駧�\��\�\�I��@�)����R�\0d~]��P*l2\�/�@���eU@\0\�\\�Ps޺i�=iXw/\Z�5��/\n�\0Χ��\�$o�稠Fq�\���a��}�a)Q\�5kP�&���b�̙�\�\rq\�d_��j\�\�`�c\�B�H?��:[��2�\�i�e�\�j�\�V�\�(�@�\�\�j�p(M�#��� \�c\�V�b���ZɁ�4�͸�\�M\�b��:ӃA����fͱ\�5r:˵�\\=j\�rn8�ˠ��C=�\�x\�w�&\��y�J��H\�\�1nʞ�\�N�<[7(�[��x\�\�b\��?�1\'?L\��\�e�l��2H(@\�8\�61���\�\�\�S�\�F(\0�4��Ѱ4\�\���Ԙ# \�z,���*º8\��\�ڪ��H\��\�6\�\Z�aM�2\�D�t$�\�S-�\�*sJù\\\�\'�\�Jw\0\�;L\�z�\0:^�ہ�SVH��Kȡ�\�#\�ڎ[$���\�F?J\0k}s���#�R�t>\�c\r�Z`BP��vT`�q�\�zt΢�\0RG�z@X���ɗ>��:�R8�-L�F��ϗ8�T\Z�\� ��i\�7\��\�e\�7x�\�\�^�=B\�\�%�>I\Z>��\�@\�*N|���\�ĸ�#N�c̢I�y5\�<\�\�L�M�\�0}�*\�X�T��QU���^(��\�F���㡤mZ\��~\�¬\�j�\�F\Z6F\��֪\�\������D�ݞ�(\��P.�d\���\r%\�\�A��U��i\�\�\�k(\�\�r\�\�h\��\0Z�F\�\\ޓ�\�\�4\�7.z\�\�Q�Y��m\�j�M��\n���£�W�vӁ��\�\��)<R\�Lr߅o\��\�$�\�[\�YA�=9�{V��$6vѐ7��\�q��\�<w\�1\�\Z\�\�\"\�\�@\�Q���\0Z�ij ��!F\�\n��A\�\�E�熠\�@\'\�4�P8\����-L:�m\Z�\���\�Tu�\�[ċ\��\0��o� ��G4�s=\�[��ʡIQI\'ҷ�6���C�\�Rh��y��1\�n;�~jb9\�\"�}\�Ҟe\��+G]�3\�։K�ݞ��\�;$ ~�\0}ߺ\�\'҆\�u\�\�\�8\�\�JK=(\0�ɥ\�qH�\'��ƕ�Nr:\��\0t)��,98��1\�J6�2x��B�\0֓\r\��Ҫ�X\�ƚNO�0\�0��?:R\�go\'ބn\�\��(��]\�.��I�lP@ۏ�\r �A��\�.=(�0ߝ\0.zd��\��Nz\�rݷ�?\�s\�aC#\�\�##���\0ȴ�\�G�*`Ow���\�\�T\�Ԧ�\�~\�\�\"�\n7\��\��Sl�\�Ӧ�\��\�\�V\�1H\r\�;\�^�\0\�ĕZ/��qo\�U$\�\�6H\��2��۳��u9WK���(S~�\0׼�\0�4X���o\��u��u?�	�ȵ\�\�$�Z#P3�ҫͬO=\���D`�>��:D�d�X��<\�V���\0l�\0\�\����\"�\�!M���U\��A��\�-s�vn�\�Z\0��M\�\�h@\�`\�?\Z�Ä��\'�W�\Z˿�{����FU6\�6sޤ\��\�|ݑ��a�\�(x\\gK�^\��P)��\0\�v\����a�\0iL�Q[��j8|\�\�\�*f\�%��+�!�J\�\�\�4g]����\�r\�s���j֖k�gF\"\'p=�1X�\�d]�\�rH�?CQ\\kOo7\��8\���@\Z�ǳ\���~���n	�xK�VS�\��\0oK��<[&vl\��\0|\�v�\�֢P WH\�n�\�@4�ue����\�\�\"x8\�\�\��1=�wj�|����\�k:\�V�\�	�&��c=io�)�Ex�8�\�h9\��\����\�\\�\0�?�A��\0\�^�\�\��V\��)l� `ylb����\�\�Y� \�.r���s@��\�{�GA\�*��_\� �\�sW�V�9n����\�F�\0�\�*+\�\�/c�W�F����\�L\n�n=@4rx\0}jHv��0�I\�\\+h\0\��ן�\�\0P���#LaKu\�Z��ȑ�6	\�)qe����:\�zw\'�#s�Y���󒧓\��qN�Z���\�\�\�s@\�+e�iDNy���[4\�9\�֘2�\�{S%��E�v\0�\��sȢ�`9T�9=9�H�g�P7\�̣�:5�,O4Q@\�v\�1\�\�!\�:s\�4QHh\�0H\� P1\�ڊ(\���\0�4��.6�G\\\�E1��q\�N\�\��(��\0\nTm�H#ڊ(�4�\�\�x\�\�\�\�(��A*y��\'-�\�=h��\ZķҤD�\�\�4QHGe\�&�\�<\�E0\�`^O\"�g�E\0�y�Nl)��\�Pd&23\�=G\�&\nxҊ)l��#�Z@\�3���`\'��4\�\�1�=���\00=iBo\�>�Q@�\�'),(45,'jeron',17,1,'wwerthj','�\��\�\0JFIF\0\0`\0`\0\0�\�\0C\0!!$-K0-**-ZBE6Kl`roi`ifx���x~��fi�̖������r�\�\�Ϻޫ����\�\0C!!!-\'-W00W�{i{���������������������������������������������������\��\0\0\0\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\0\0\0\0\0\0\0	\n\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\0,\"\0�\�\0\0\0?\0��(\�&ihh?4�x��cҐ��W�\0E�<\r�*ʭ�08�9�\�(��x\�&$�~\��\�8\�ϱGm+��kw�\��w���J��X\�ib�p��9�I>CH��\�9����V���U2\nɖ?( �ց�5T�K�\�M3FL�[0m\�9\�XM.\�R\�d�/(�;�]����\n\��j���j�wk$YDe8\�\�\�P&�o�u<�nx\�ǀz\0\�\��J��kW�<B\�Y\�q�\�c����D�\'�d�{��?uG���\rq\"��\�O�43��\�\�j�\��lRI�GnUAI3���ڢ����\�\��L���\�g��،zњ�6�l��\�>L��\0�\�pc�Ki�\�Iqt$����P<\�\�@�\�K�ʷ\�\�SNy�\"\��\�d�\��J\�M���q�Ȅ\�\�Wq\���\0iJ\rfC�\�6�r�1\"�E\�x\�9\�\�U᰷�\�\��\�\�r�݃\�Ҁ73HdP\�,��\�bܢY\\]��1�a\npI���\�\�U��4�CO�\�9\�G���\r\"\�c�\�B�a� �PsX�6\�]Iq\�Hn-\�m�)l�1�\�қsil��\�P\�\�$��djH��\�\0m\�\�Iҭ��Db2!�w\�~�q��A�[\�xɊ=�q\�#����+]>\�ೖ\��� |1\�H9jI��e\�m�Hȉ�ˮ\�\�1�����\\\����K�c�l����<e~��\�c7\ZzD�g?���\�2hf���.h\�%\0�����9҃M\��4�F\�I�F?-\0Z�[�n\���\�\ZY�銻~�j:T\�<af�p\�=W�>�B\�Ș�	*dr2�5b{����2b����[�$ѹ�\0��?�\��\0\�\rG\�\�s���S���S����50\��gp��S\�\���]br\�\��\�LP#d\�v\�≏\���ڌ�V����g��j�\\^�\�\\�\0tR�ppA�\�}��\�9�hU\�\�͠\�9\�4�+�V\��\0=eU��*���^�$c�Z8�Vm�\�\��F�8\�QL�\�nn\�Q\n��o��P��\��>\�M���:UYae���Fe\�\��N3��\'��4�\�\�ys3X�փƷ�9W�ЊL�/�[;\�Fx\�\�Ӟ�z*�|2�9\�@����uw[&x2*�*d0\�Y\'�k$rDy\�09�\"�j2l\�t\�z��\�V�u�p紡1�\�Y�Z\�\\H�\��B`�ps�^i\�)w\�o{e�H�CrGL\��\��6�\�W�f�\�\�#7_݄�\��+:\���\�+��c\r�\�\'��+E�Ig�V{`�6��P�!!�\��ц��g\�\na�!\�\Z4�\�H\��S�:�Y����7a��b�-nm\�<\�V�5B$�ҕ���d^\\:�3;�v�ʭ[���\�s�T�`:�:\Z}����m�`۷n#��<S5�\"=��F\�6=�E�4\�t�k\�c���\�*\rU�m���g�a,�\�\�i��W�O��E�[\�\�l\�Wɶ�H�\0;c�gO�0/N\�\�\����[\\\�ޏw\�*����ֆ٤�Wi`8�{}B[Cl\�Z\�+��\r�&�<�&\��\0p\��ȫ00�\�?�K�\�\�T\�\��l�1[=��q+�6@=����\�,\��\�\��%���\�\0AdJ\�FQ\�\�IP�e\�*W��\rb\�\�-OOJr\��\�l\�I�&vm�\�;��\����\�Z\�\��n01\�\0Nu�>\� \�\'�M\�\�WQ\�DWC�a�}Eg=��#H\�\��6\�s�5z\�#�Q��>���(�����8\�\�\��xR\Z\\\�\ZX>oQF[�(��.,ڟݷ֦\�V�8V�ԤԱn�\�E�p4~i�\��\r\0Aq�0�Q��\�~�CҘ�T՘\�**���Z��\�U��0��\�+�MX(\�Դ2\�jp5O\�\"��r\�qJ\�b\��.y�\�|Դ�;\�H[\�\�= %S\�\�P\�Ԅ��� �\�UC`\�G�q4IE( ���HR\�Q@���b�JZ\0Z3IE����8\�)(�X\�\�IFh-�\�l\�{s��JM\"Gf���4\�h�i�\���*\�#��ث�\�^X\�o�ƀ�җ�)���0!!��K\�\r��\�\�^EA\'\�i����[d�\�(\�I�pkB%آ�cE�>�\�\��MiGz��ςj#/OJ�\�\�\�e\�h>�\�\�5@J\rK\�$SBd\�JrI\�U��T~i��)��j���!���x��\�w4S�\rIL��������\0Z)(�QIE1ef�f�\�QE\0>�~-AÊ��,\\Ӆ34��S��\�<\Z\0�3S2	i�#<Օ4��C��\00\�\�juTpz����*��4�\�\��SWm���3o\�fn�*&S�\"�\�%���t6R�6�(�\�1�^J�\�M�t�p���\'Ҥ\�\�)\�\nl� �\�E�r\r0��R��`1�g\�>\�n=)�1�u5+t\�\�m\�I��\���\��^I9�I&NsH��2*	\�)\�4&i\�M��v�[W\�5�\�@hD�JZJ)�ZZJ(h�������8�\�\�sKL\�Z)(�!�\�JX\n�iKi�Ƀ�O�_Z�P!\�)��)�5eMUCVT\��J�2�i�Ӂ�s�\�T���\�\�Mn��q\�\�TXl\�\�(o\�=h*GCN^MN�1ڀ Y�uV\�坾\\�WdA\�T\�q\�\� dG-�\�	I1�\�p����*)w\�d\"\�6qW\�SpoqT@��e`>��̹\��\�����\ng#�e:\�r9��d�\�cr��(�}\�%�u\'��Eh\�38Q\�\�\�:f\�\n״����,_e�(9QҮ\�\��ũ{���Zh��!\�RR\�\�I�(ii)s@P���e�EP1(�\�\�S!�^��CSw4x�\nh�\n@J�e:UU�)@\�A�\n`4\�i(\�k>\�v���׋�(�\�\�M�T!�)jV!;���i\�\�\��b\�\�Jx\0S\�\0�\��$�kn\�j۠�E�R��@��*�\�W�ž�K��\Z\�*��x	\�9�h\�Q�\r\\��jo�5Q�v��8dj=�F\�Z�\�luTv-�A\�V�8L�\�d�\�Ut\�٧Fi�\���\�\�!sKIK@E&ihii(�&���e�KM��\0M(�4��)�\���\�*,|\���V�N\�N\"Ք��V#�d)�Sƹ��\'5V���\�P\�}\�dҸ\�SbGjaj��<TeMP�\'�\�q@�\'4XW&B�jK\\4��j�\�nPA����\�\�*��qQɪ\"u5J\�V1�VY|Nj�t�)\�5f;���\�\�\\��c�\�\�d>c�\�:R�\\��Kv5uxri��Ԍ�\ZDUV%@\�ғ4\�\�\�\�\�E0�Pi���K�n�-\0:��)\�\�P))i���P0&��\�u*\0�\�\�\�\�K��>�r�=�Ƚ\�B\r1\"a;}i\�\�\�j\nZ@[[���Y�h\��\n\�4i��k\�\�z05e�\�m���&�Gʘ\'&�\�w\�U%9�Y\�&5#+H0sҢ\�\�5;�{T;>cT!J�\�\�n�����\"�\����\��#�D�\�\�r;U�G�\��BP7\Z�!-\�Q\'�\�@dֶ��(ϩ�qZ�\��ZPC�u�\�c\�zӳM��\�\�晚PhL\�\�\�.h 4\�j0i�\���\�74��R\�ih�\���覜!s�4\�0\�R�����!��\��\0FMY�P\�\�*#\�f�& \�P�\�7\�x {\�\0T\�<�\�H��8\�1J�V�V ��\�X[hЏ����S*(��\r��-\�B`��*\�\�_�\0�.*\\�4�\�\�҇�昤��I9a�\Z2\0\rEǩ4�u��)��!\�F�D��ex\�<��Q�n�S̓HV�A�\�JE1���8\�3@\n\r8(�;n0i��Z�idm�@_QK�z\�iO4	�^�jl3b�5������WP~\�@\ZB�\Z����\0ԫ{\�[�늅g��0�\�\�P���җ4\0�KM��#�3�o�j:\\\�\Z���\r&�I��R�m\�@�!jU]Ɯ\"5b\��M\0>\�\�I9\�Zю\�c�5* D\0qJ@*-!1Mc���j7�*J̢Pi�sM\�i�\�ɢ\�(\�N\�D\�f��6\��\�V�s6`T\�C\�qM\�Ol\nd�X\�u��,�8\�Xo\�\nc[\�i�Dă���`\�\�V\�⦈�L	��u�\\���\�]��S�!lP��e\�b\")\�\�\�\�Ԁ�z\�f�i3Lb\�IKH\�.i��\0\�O�8Jã\Ze-\0N�R�\�\�J����S\�-\0i.�����\�_J\�\�-\0Tۊ\\t�`R��D�1F9\�.9\�R��\�\�ֵ\"� ^\0\�\�Um\"��\�\n���2e$饾��Fj=\�%�Zc9\'\�*C�8���:\�P\�R�Ѳ9\�N\�z\�$}E$ƚ��\�\�[\'#�14\�\�f�\�7>�\�ZYG`:sI�֫��\�^\�D�1\�9�1Ȧ\�V\�P�Ҕ|���7\�\�HZ��*��`u�i6�\rVf,y�\�#g�,\��֢�\�\�!�\�\�)�vh\�&h\�!��\�74P\�i�P�٦f�4\0\�Znh\�\0Fzю/�\�\�\�VHc4\��4Ӓ\0�HI\�� /G�G\�iY�|��/���e�&��j2٣v)�J���)ṥrd�U!28�)\�iNh�\�\�iH\�!�$�Rp94\�\�Ҝr�;P)1J�x� U\�M`�N���lɅ&�ʻ��*\���ALC\�\�b�\�\�\�Q\���\�!�w.y\�J�LQS/JLhQMh	\�S�\�sL[��0��L�����Tn\��ƭ\�\�:Z��\�j�\�õ\02�#�\0�����KM����\�.h�rNh\�\��Q�E\�:s\�THo\�\�T�j���NS\�o\�@\�T,\�=8��aA\�C(hzz��\�\\�w�++us�\nC*��N��Wny�se��NHVT(f�n8�P�8S#\'=)\�#��h�v���E#�`�S���\�W\�l\�E;Wk��\�%�M�\�M!6i�S\���ц���\�b��<�>j)�y\�!�\�4�N\�ڢ\�LD��\�\�E����q@\np\�S\�=j\�p/�KE\\͙JD&�\�t\�[�ډ�(8��GF���A���h:���H9Py\�?\Zv:\��\0xT\�*?z�G�G\�\0v\\\�\�\�\�5n�TMl;T	+�|�\�z\�\�v?�R�\�\�i�c�]Y\�R�ս\�\\\n\"����\�\�D`a\�LQ�0GZ(\0\�[;~��`�\�ލ��G�.}OҨ�\�O駧�\��\�\�I��@�)����R�\0d~]��P*l2\�/�@���eU@\0\�\\�Ps޺i�=iXw/\Z�5��/\n�\0Χ��\�$o�稠Fq�\���a��}�a)Q\�5kP�&���b�̙�\�\rq\�d_��j\�\�`�c\�B�H?��:[��2�\�i�e�\�j�\�V�\�(�@�\�\�j�p(M�#��� \�c\�V�b���ZɁ�4�͸�\�M\�b��:ӃA����fͱ\�5r:˵�\\=j\�rn8�ˠ��C=�\�x\�w�&\��y�J��H\�\�1nʞ�\�N�<[7(�[��x\�\�b\��?�1\'?L\��\�e�l��2H(@\�8\�61���\�\�\�S�\�F(\0�4��Ѱ4\�\���Ԙ# \�z,���*º8\��\�ڪ��H\��\�6\�\Z�aM�2\�D�t$�\�S-�\�*sJù\\\�\'�\�Jw\0\�;L\�z�\0:^�ہ�SVH��Kȡ�\�#\�ڎ[$���\�F?J\0k}s���#�R�t>\�c\r�Z`BP��vT`�q�\�zt΢�\0RG�z@X���ɗ>��:�R8�-L�F��ϗ8�T\Z�\� ��i\�7\��\�e\�7x�\�\�^�=B\�\�%�>I\Z>��\�@\�*N|���\�ĸ�#N�c̢I�y5\�<\�\�L�M�\�0}�*\�X�T��QU���^(��\�F���㡤mZ\��~\�¬\�j�\�F\Z6F\��֪\�\������D�ݞ�(\��P.�d\���\r%\�\�A��U��i\�\�\�k(\�\�r\�\�h\��\0Z�F\�\\ޓ�\�\�4\�7.z\�\�Q�Y��m\�j�M��\n���£�W�vӁ��\�\��)<R\�Lr߅o\��\�$�\�[\�YA�=9�{V��$6vѐ7��\�q��\�<w\�1\�\Z\�\�\"\�\�@\�Q���\0Z�ij ��!F\�\n��A\�\�E�熠\�@\'\�4�P8\����-L:�m\Z�\���\�Tu�\�[ċ\��\0��o� ��G4�s=\�[��ʡIQI\'ҷ�6���C�\�Rh��y��1\�n;�~jb9\�\"�}\�Ҟe\��+G]�3\�։K�ݞ��\�;$ ~�\0}ߺ\�\'҆\�u\�\�\�8\�\�JK=(\0�ɥ\�qH�\'��ƕ�Nr:\��\0t)��,98��1\�J6�2x��B�\0֓\r\��Ҫ�X\�ƚNO�0\�0��?:R\�go\'ބn\�\��(��]\�.��I�lP@ۏ�\r �A��\�.=(�0ߝ\0.zd��\��Nz\�rݷ�?\�s\�aC#\�\�##���\0ȴ�\�G�*`Ow���\�\�T\�Ԧ�\�~\�\�\"�\n7\��\��Sl�\�Ӧ�\��\�\�V\�1H\r\�;\�^�\0\�ĕZ/��qo\�U$\�\�6H\��2��۳��u9WK���(S~�\0׼�\0�4X���o\��u��u?�	�ȵ\�\�$�Z#P3�ҫͬO=\���D`�>��:D�d�X��<\�V���\0l�\0\�\����\"�\�!M���U\��A��\�-s�vn�\�Z\0��M\�\�h@\�`\�?\Z�Ä��\'�W�\Z˿�{����FU6\�6sޤ\��\�|ݑ��a�\�(x\\gK�^\��P)��\0\�v\����a�\0iL�Q[��j8|\�\�\�*f\�%��+�!�J\�\�\�4g]����\�r\�s���j֖k�gF\"\'p=�1X�\�d]�\�rH�?CQ\\kOo7\��8\���@\Z�ǳ\���~���n	�xK�VS�\��\0oK��<[&vl\��\0|\�v�\�֢P WH\�n�\�@4�ue����\�\�\"x8\�\�\��1=�wj�|����\�k:\�V�\�	�&��c=io�)�Ex�8�\�h9\��\����\�\\�\0�?�A��\0\�^�\�\��V\��)l� `ylb����\�\�Y� \�.r���s@��\�{�GA\�*��_\� �\�sW�V�9n����\�F�\0�\�*+\�\�/c�W�F����\�L\n�n=@4rx\0}jHv��0�I\�\\+h\0\��ן�\�\0P���#LaKu\�Z��ȑ�6	\�)qe����:\�zw\'�#s�Y���󒧓\��qN�Z���\�\�\�s@\�+e�iDNy���[4\�9\�֘2�\�{S%��E�v\0�\��sȢ�`9T�9=9�H�g�P7\�̣�:5�,O4Q@\�v\�1\�\�!\�:s\�4QHh\�0H\� P1\�ڊ(\���\0�4��.6�G\\\�E1��q\�N\�\��(��\0\nTm�H#ڊ(�4�\�\�x\�\�\�\�(��A*y��\'-�\�=h��\ZķҤD�\�\�4QHGe\�&�\�<\�E0\�`^O\"�g�E\0�y�Nl)��\�Pd&23\�=G\�&\nxҊ)l��#�Z@\�3���`\'��4\�\�1�=���\00=iBo\�>�Q@�\�'),(46,'sdfghjk',17,1,'fsdjhkj','�\��\�\0JFIF\0\0`\0`\0\0�\�\0C\0!!$-K0-**-ZBE6Kl`roi`ifx���x~��fi�̖������r�\�\�Ϻޫ����\�\0C!!!-\'-W00W�{i{���������������������������������������������������\��\0\0\0\0\0\0\0\0\0\0	\n\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\0\0\0\0\0\0\0	\n\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\0,\"\0�\�\0\0\0?\0��(\�&ihh?4�x��cҐ��W�\0E�<\r�*ʭ�08�9�\�(��x\�&$�~\��\�8\�ϱGm+��kw�\��w���J��X\�ib�p��9�I>CH��\�9����V���U2\nɖ?( �ց�5T�K�\�M3FL�[0m\�9\�XM.\�R\�d�/(�;�]����\n\��j���j�wk$YDe8\�\�\�P&�o�u<�nx\�ǀz\0\�\��J��kW�<B\�Y\�q�\�c����D�\'�d�{��?uG���\rq\"��\�O�43��\�\�j�\��lRI�GnUAI3���ڢ����\�\��L���\�g��،zњ�6�l��\�>L��\0�\�pc�Ki�\�Iqt$����P<\�\�@�\�K�ʷ\�\�SNy�\"\��\�d�\��J\�M���q�Ȅ\�\�Wq\���\0iJ\rfC�\�6�r�1\"�E\�x\�9\�\�U᰷�\�\��\�\�r�݃\�Ҁ73HdP\�,��\�bܢY\\]��1�a\npI���\�\�U��4�CO�\�9\�G���\r\"\�c�\�B�a� �PsX�6\�]Iq\�Hn-\�m�)l�1�\�қsil��\�P\�\�$��djH��\�\0m\�\�Iҭ��Db2!�w\�~�q��A�[\�xɊ=�q\�#����+]>\�ೖ\��� |1\�H9jI��e\�m�Hȉ�ˮ\�\�1�����\\\����K�c�l����<e~��\�c7\ZzD�g?���\�2hf���.h\�%\0�����9҃M\��4�F\�I�F?-\0Z�[�n\���\�\ZY�銻~�j:T\�<af�p\�=W�>�B\�Ș�	*dr2�5b{����2b����[�$ѹ�\0��?�\��\0\�\rG\�\�s���S���S����50\��gp��S\�\���]br\�\��\�LP#d\�v\�≏\���ڌ�V����g��j�\\^�\�\\�\0tR�ppA�\�}��\�9�hU\�\�͠\�9\�4�+�V\��\0=eU��*���^�$c�Z8�Vm�\�\��F�8\�QL�\�nn\�Q\n��o��P��\��>\�M���:UYae���Fe\�\��N3��\'��4�\�\�ys3X�փƷ�9W�ЊL�/�[;\�Fx\�\�Ӟ�z*�|2�9\�@����uw[&x2*�*d0\�Y\'�k$rDy\�09�\"�j2l\�t\�z��\�V�u�p紡1�\�Y�Z\�\\H�\��B`�ps�^i\�)w\�o{e�H�CrGL\��\��6�\�W�f�\�\�#7_݄�\��+:\���\�+��c\r�\�\'��+E�Ig�V{`�6��P�!!�\��ц��g\�\na�!\�\Z4�\�H\��S�:�Y����7a��b�-nm\�<\�V�5B$�ҕ���d^\\:�3;�v�ʭ[���\�s�T�`:�:\Z}����m�`۷n#��<S5�\"=��F\�6=�E�4\�t�k\�c���\�*\rU�m���g�a,�\�\�i��W�O��E�[\�\�l\�Wɶ�H�\0;c�gO�0/N\�\�\����[\\\�ޏw\�*����ֆ٤�Wi`8�{}B[Cl\�Z\�+��\r�&�<�&\��\0p\��ȫ00�\�?�K�\�\�T\�\��l�1[=��q+�6@=����\�,\��\�\��%���\�\0AdJ\�FQ\�\�IP�e\�*W��\rb\�\�-OOJr\��\�l\�I�&vm�\�;��\����\�Z\�\��n01\�\0Nu�>\� \�\'�M\�\�WQ\�DWC�a�}Eg=��#H\�\��6\�s�5z\�#�Q��>���(�����8\�\�\��xR\Z\\\�\ZX>oQF[�(��.,ڟݷ֦\�V�8V�ԤԱn�\�E�p4~i�\��\r\0Aq�0�Q��\�~�CҘ�T՘\�**���Z��\�U��0��\�+�MX(\�Դ2\�jp5O\�\"��r\�qJ\�b\��.y�\�|Դ�;\�H[\�\�= %S\�\�P\�Ԅ��� �\�UC`\�G�q4IE( ���HR\�Q@���b�JZ\0Z3IE����8\�)(�X\�\�IFh-�\�l\�{s��JM\"Gf���4\�h�i�\���*\�#��ث�\�^X\�o�ƀ�җ�)���0!!��K\�\r��\�\�^EA\'\�i����[d�\�(\�I�pkB%آ�cE�>�\�\��MiGz��ςj#/OJ�\�\�\�e\�h>�\�\�5@J\rK\�$SBd\�JrI\�U��T~i��)��j���!���x��\�w4S�\rIL��������\0Z)(�QIE1ef�f�\�QE\0>�~-AÊ��,\\Ӆ34��S��\�<\Z\0�3S2	i�#<Օ4��C��\00\�\�juTpz����*��4�\�\��SWm���3o\�fn�*&S�\"�\�%���t6R�6�(�\�1�^J�\�M�t�p���\'Ҥ\�\�)\�\nl� �\�E�r\r0��R��`1�g\�>\�n=)�1�u5+t\�\�m\�I��\���\��^I9�I&NsH��2*	\�)\�4&i\�M��v�[W\�5�\�@hD�JZJ)�ZZJ(h�������8�\�\�sKL\�Z)(�!�\�JX\n�iKi�Ƀ�O�_Z�P!\�)��)�5eMUCVT\��J�2�i�Ӂ�s�\�T���\�\�Mn��q\�\�TXl\�\�(o\�=h*GCN^MN�1ڀ Y�uV\�坾\\�WdA\�T\�q\�\� dG-�\�	I1�\�p����*)w\�d\"\�6qW\�SpoqT@��e`>��̹\��\�����\ng#�e:\�r9��d�\�cr��(�}\�%�u\'��Eh\�38Q\�\�\�:f\�\n״����,_e�(9QҮ\�\��ũ{���Zh��!\�RR\�\�I�(ii)s@P���e�EP1(�\�\�S!�^��CSw4x�\nh�\n@J�e:UU�)@\�A�\n`4\�i(\�k>\�v���׋�(�\�\�M�T!�)jV!;���i\�\�\��b\�\�Jx\0S\�\0�\��$�kn\�j۠�E�R��@��*�\�W�ž�K��\Z\�*��x	\�9�h\�Q�\r\\��jo�5Q�v��8dj=�F\�Z�\�luTv-�A\�V�8L�\�d�\�Ut\�٧Fi�\���\�\�!sKIK@E&ihii(�&���e�KM��\0M(�4��)�\���\�*,|\���V�N\�N\"Ք��V#�d)�Sƹ��\'5V���\�P\�}\�dҸ\�SbGjaj��<TeMP�\'�\�q@�\'4XW&B�jK\\4��j�\�nPA����\�\�*��qQɪ\"u5J\�V1�VY|Nj�t�)\�5f;���\�\�\\��c�\�\�d>c�\�:R�\\��Kv5uxri��Ԍ�\ZDUV%@\�ғ4\�\�\�\�\�E0�Pi���K�n�-\0:��)\�\�P))i���P0&��\�u*\0�\�\�\�\�K��>�r�=�Ƚ\�B\r1\"a;}i\�\�\�j\nZ@[[���Y�h\��\n\�4i��k\�\�z05e�\�m���&�Gʘ\'&�\�w\�U%9�Y\�&5#+H0sҢ\�\�5;�{T;>cT!J�\�\�n�����\"�\����\��#�D�\�\�r;U�G�\��BP7\Z�!-\�Q\'�\�@dֶ��(ϩ�qZ�\��ZPC�u�\�c\�zӳM��\�\�晚PhL\�\�\�.h 4\�j0i�\���\�74��R\�ih�\���覜!s�4\�0\�R�����!��\��\0FMY�P\�\�*#\�f�& \�P�\�7\�x {\�\0T\�<�\�H��8\�1J�V�V ��\�X[hЏ����S*(��\r��-\�B`��*\�\�_�\0�.*\\�4�\�\�҇�昤��I9a�\Z2\0\rEǩ4�u��)��!\�F�D��ex\�<��Q�n�S̓HV�A�\�JE1���8\�3@\n\r8(�;n0i��Z�idm�@_QK�z\�iO4	�^�jl3b�5������WP~\�@\ZB�\Z����\0ԫ{\�[�늅g��0�\�\�P���җ4\0�KM��#�3�o�j:\\\�\Z���\r&�I��R�m\�@�!jU]Ɯ\"5b\��M\0>\�\�I9\�Zю\�c�5* D\0qJ@*-!1Mc���j7�*J̢Pi�sM\�i�\�ɢ\�(\�N\�D\�f��6\��\�V�s6`T\�C\�qM\�Ol\nd�X\�u��,�8\�Xo\�\nc[\�i�Dă���`\�\�V\�⦈�L	��u�\\���\�]��S�!lP��e\�b\")\�\�\�\�Ԁ�z\�f�i3Lb\�IKH\�.i��\0\�O�8Jã\Ze-\0N�R�\�\�J����S\�-\0i.�����\�_J\�\�-\0Tۊ\\t�`R��D�1F9\�.9\�R��\�\�ֵ\"� ^\0\�\�Um\"��\�\n���2e$饾��Fj=\�%�Zc9\'\�*C�8���:\�P\�R�Ѳ9\�N\�z\�$}E$ƚ��\�\�[\'#�14\�\�f�\�7>�\�ZYG`:sI�֫��\�^\�D�1\�9�1Ȧ\�V\�P�Ҕ|���7\�\�HZ��*��`u�i6�\rVf,y�\�#g�,\��֢�\�\�!�\�\�)�vh\�&h\�!��\�74P\�i�P�٦f�4\0\�Znh\�\0Fzю/�\�\�\�VHc4\��4Ӓ\0�HI\�� /G�G\�iY�|��/���e�&��j2٣v)�J���)ṥrd�U!28�)\�iNh�\�\�iH\�!�$�Rp94\�\�Ҝr�;P)1J�x� U\�M`�N���lɅ&�ʻ��*\���ALC\�\�b�\�\�\�Q\���\�!�w.y\�J�LQS/JLhQMh	\�S�\�sL[��0��L�����Tn\��ƭ\�\�:Z��\�j�\�õ\02�#�\0�����KM����\�.h�rNh\�\��Q�E\�:s\�THo\�\�T�j���NS\�o\�@\�T,\�=8��aA\�C(hzz��\�\\�w�++us�\nC*��N��Wny�se��NHVT(f�n8�P�8S#\'=)\�#��h�v���E#�`�S���\�W\�l\�E;Wk��\�%�M�\�M!6i�S\���ц���\�b��<�>j)�y\�!�\�4�N\�ڢ\�LD��\�\�E����q@\np\�S\�=j\�p/�KE\\͙JD&�\�t\�[�ډ�(8��GF���A���h:���H9Py\�?\Zv:\��\0xT\�*?z�G�G\�\0v\\\�\�\�\�5n�TMl;T	+�|�\�z\�\�v?�R�\�\�i�c�]Y\�R�ս\�\\\n\"����\�\�D`a\�LQ�0GZ(\0\�[;~��`�\�ލ��G�.}OҨ�\�O駧�\��\�\�I��@�)����R�\0d~]��P*l2\�/�@���eU@\0\�\\�Ps޺i�=iXw/\Z�5��/\n�\0Χ��\�$o�稠Fq�\���a��}�a)Q\�5kP�&���b�̙�\�\rq\�d_��j\�\�`�c\�B�H?��:[��2�\�i�e�\�j�\�V�\�(�@�\�\�j�p(M�#��� \�c\�V�b���ZɁ�4�͸�\�M\�b��:ӃA����fͱ\�5r:˵�\\=j\�rn8�ˠ��C=�\�x\�w�&\��y�J��H\�\�1nʞ�\�N�<[7(�[��x\�\�b\��?�1\'?L\��\�e�l��2H(@\�8\�61���\�\�\�S�\�F(\0�4��Ѱ4\�\���Ԙ# \�z,���*º8\��\�ڪ��H\��\�6\�\Z�aM�2\�D�t$�\�S-�\�*sJù\\\�\'�\�Jw\0\�;L\�z�\0:^�ہ�SVH��Kȡ�\�#\�ڎ[$���\�F?J\0k}s���#�R�t>\�c\r�Z`BP��vT`�q�\�zt΢�\0RG�z@X���ɗ>��:�R8�-L�F��ϗ8�T\Z�\� ��i\�7\��\�e\�7x�\�\�^�=B\�\�%�>I\Z>��\�@\�*N|���\�ĸ�#N�c̢I�y5\�<\�\�L�M�\�0}�*\�X�T��QU���^(��\�F���㡤mZ\��~\�¬\�j�\�F\Z6F\��֪\�\������D�ݞ�(\��P.�d\���\r%\�\�A��U��i\�\�\�k(\�\�r\�\�h\��\0Z�F\�\\ޓ�\�\�4\�7.z\�\�Q�Y��m\�j�M��\n���£�W�vӁ��\�\��)<R\�Lr߅o\��\�$�\�[\�YA�=9�{V��$6vѐ7��\�q��\�<w\�1\�\Z\�\�\"\�\�@\�Q���\0Z�ij ��!F\�\n��A\�\�E�熠\�@\'\�4�P8\����-L:�m\Z�\���\�Tu�\�[ċ\��\0��o� ��G4�s=\�[��ʡIQI\'ҷ�6���C�\�Rh��y��1\�n;�~jb9\�\"�}\�Ҟe\��+G]�3\�։K�ݞ��\�;$ ~�\0}ߺ\�\'҆\�u\�\�\�8\�\�JK=(\0�ɥ\�qH�\'��ƕ�Nr:\��\0t)��,98��1\�J6�2x��B�\0֓\r\��Ҫ�X\�ƚNO�0\�0��?:R\�go\'ބn\�\��(��]\�.��I�lP@ۏ�\r �A��\�.=(�0ߝ\0.zd��\��Nz\�rݷ�?\�s\�aC#\�\�##���\0ȴ�\�G�*`Ow���\�\�T\�Ԧ�\�~\�\�\"�\n7\��\��Sl�\�Ӧ�\��\�\�V\�1H\r\�;\�^�\0\�ĕZ/��qo\�U$\�\�6H\��2��۳��u9WK���(S~�\0׼�\0�4X���o\��u��u?�	�ȵ\�\�$�Z#P3�ҫͬO=\���D`�>��:D�d�X��<\�V���\0l�\0\�\����\"�\�!M���U\��A��\�-s�vn�\�Z\0��M\�\�h@\�`\�?\Z�Ä��\'�W�\Z˿�{����FU6\�6sޤ\��\�|ݑ��a�\�(x\\gK�^\��P)��\0\�v\����a�\0iL�Q[��j8|\�\�\�*f\�%��+�!�J\�\�\�4g]����\�r\�s���j֖k�gF\"\'p=�1X�\�d]�\�rH�?CQ\\kOo7\��8\���@\Z�ǳ\���~���n	�xK�VS�\��\0oK��<[&vl\��\0|\�v�\�֢P WH\�n�\�@4�ue����\�\�\"x8\�\�\��1=�wj�|����\�k:\�V�\�	�&��c=io�)�Ex�8�\�h9\��\����\�\\�\0�?�A��\0\�^�\�\��V\��)l� `ylb����\�\�Y� \�.r���s@��\�{�GA\�*��_\� �\�sW�V�9n����\�F�\0�\�*+\�\�/c�W�F����\�L\n�n=@4rx\0}jHv��0�I\�\\+h\0\��ן�\�\0P���#LaKu\�Z��ȑ�6	\�)qe����:\�zw\'�#s�Y���󒧓\��qN�Z���\�\�\�s@\�+e�iDNy���[4\�9\�֘2�\�{S%��E�v\0�\��sȢ�`9T�9=9�H�g�P7\�̣�:5�,O4Q@\�v\�1\�\�!\�:s\�4QHh\�0H\� P1\�ڊ(\���\0�4��.6�G\\\�E1��q\�N\�\��(��\0\nTm�H#ڊ(�4�\�\�x\�\�\�\�(��A*y��\'-�\�=h��\ZķҤD�\�\�4QHGe\�&�\�<\�E0\�`^O\"�g�E\0�y�Nl)��\�Pd&23\�=G\�&\nxҊ)l��#�Z@\�3���`\'��4\�\�1�=���\00=iBo\�>�Q@�\�');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblservicecategory`
--

LOCK TABLES `tblservicecategory` WRITE;
/*!40000 ALTER TABLE `tblservicecategory` DISABLE KEYS */;
INSERT INTO `tblservicecategory` VALUES (11,'Massage'),(12,'Hair Cut'),(13,'Hair Wax'),(14,'Body'),(15,'Nail'),(16,'Make up'),(17,'Hair Color');
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
  `intQuantity` int(11) NOT NULL,
  `intPackageServiceStatus` int(11) NOT NULL,
  PRIMARY KEY (`intServicePackageDetailID`),
  KEY `fk_intPackageServiceID_idx` (`intPackageServiceID`),
  KEY `fk_intPackageID_idx` (`intPackageID`),
  CONSTRAINT `fk_intDetailsPackageID` FOREIGN KEY (`intPackageID`) REFERENCES `tblpackage` (`intPackageID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intPackageServiceID` FOREIGN KEY (`intPackageServiceID`) REFERENCES `tblservice` (`intServiceID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblservicepackage`
--

LOCK TABLES `tblservicepackage` WRITE;
/*!40000 ALTER TABLE `tblservicepackage` DISABLE KEYS */;
INSERT INTO `tblservicepackage` VALUES (6,8,32,10,1),(7,8,33,2,1),(8,9,32,10,0),(9,9,33,2,1),(10,8,32,2,1),(11,8,33,2,1),(12,8,32,10,1),(13,8,33,2,1),(14,8,33,2,1),(15,8,33,2,1),(16,8,33,2,1),(17,8,33,2,1),(18,8,32,10,1),(20,8,32,10,1),(22,8,32,10,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblserviceprice`
--

LOCK TABLES `tblserviceprice` WRITE;
/*!40000 ALTER TABLE `tblserviceprice` DISABLE KEYS */;
INSERT INTO `tblserviceprice` VALUES (5,31,50,'2016-02-27 08:26:10'),(6,32,35,'2016-02-27 10:34:07'),(19,33,50,'2016-02-27 10:34:07'),(20,34,50,'2016-02-27 10:34:07'),(21,43,1,'2016-03-05 08:16:24'),(22,43,150,'2016-03-05 08:24:32'),(23,43,100,'2016-03-05 08:24:58'),(24,44,20,'2016-03-10 14:30:54'),(25,45,120,'2016-03-10 22:43:02'),(26,46,120,'2016-03-10 22:43:51');
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
  `intQuantity` int(11) NOT NULL,
  `intPromoStatus` int(11) NOT NULL,
  PRIMARY KEY (`inServicePromoID`),
  KEY `fk_intPromoID_idx` (`intPromoID`),
  KEY `fk_intServiceID_idx` (`intServiceID`),
  CONSTRAINT `fk_intDetailPromoID` FOREIGN KEY (`intPromoID`) REFERENCES `tblpromo` (`intPromoID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_intPromoServiceID` FOREIGN KEY (`intServiceID`) REFERENCES `tblservice` (`intServiceID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblservicepromo`
--

LOCK TABLES `tblservicepromo` WRITE;
/*!40000 ALTER TABLE `tblservicepromo` DISABLE KEYS */;
INSERT INTO `tblservicepromo` VALUES (1,1,31,1,1);
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
/*!50003 DROP PROCEDURE IF EXISTS `createCatalogue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createCatalogue`(IN strType VARCHAR(20),
									IN strName VARCHAR(70),
									IN blobPhoto LONGBLOB)
BEGIN
	DECLARE intID INT;
    
    SELECT intServiceID INTO intID FROM tblService WHERE strServiceName = strType;


	INSERT INTO tblCatalogue(intServiceID, strCatalogueName, blobStylePhoto, intStatus)
    VALUES(intID, strName, blobPhoto, 1);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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
		tblDiscount(strDiscountName, strDiscountDesc, intDiscountType, dblDiscountAmount, intStatus)
	VALUES
		(strName, strDesc, intType, dblPrice, 1);
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
                              IN strEmail VARCHAR(45),
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
				tblEmployee(intEmpJobID, strEmpLastName, strEmpFirstName, strEmpMiddleName, datEmpBirthdate, strEmpGender, strEmpAddress, strEmpContactNo, strEmpEmail, strEmpStatus, blobEmpPhoto) 
			VALUES 
				(intJobIDRetrieved, strLname, strFname, strMname, datBday, strGender, strAddress, strContact, strEmail, strStatus, blobPhoto);
        
			COMMIT;
	ELSEIF(intJobIDRetrieved IS NOT NULL)
	THEN
		INSERT INTO 
				tblEmployee(intEmpJobID, strEmpLastName, strEmpFirstName, strEmpMiddleName, datEmpBirthdate, strEmpGender, strEmpAddress, strEmpContactNo, strEmpEmail, strEmpStatus, blobEmpPhoto) 
			VALUES 
				(intJobIDRetrieved, strLname, strFname, strMname, datBday, strGender, strAddress, strContact, strEmail, strStatus, blobPhoto);
        
			COMMIT;
        
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
/*!50003 DROP PROCEDURE IF EXISTS `createLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createLocation`(IN strLocation VARCHAR(45),
								   IN dblPrice DOUBLE)
BEGIN
	INSERT INTO tblLocation(strLocationName, dblLocationPrice, intLocationStatus) VALUES (strLocation, dblPrice, 1);
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
                                  IN dblPrice DOUBLE, 
                                  IN intStatus INT)
BEGIN

	DECLARE intPackID INT;

	INSERT INTO
		tblPackage(strPackageName, strPackageDescription, intPackageType, intMaxHeadCount, strPackageAvailability, intPackageStatus)
	VALUES
		(strName, strDesc, intType, intMax, strAvailability, intStatus);
        
	SET intPackID = LAST_INSERT_ID();
        
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
			tblProduct(intProductCateCode, strProductName, intProductQuantity, blobProductPhoto, strProductDesc, intProdStatus)
		VALUES
			(intCateCode, strName, 0, blobPhoto, strDesc, 1);
            
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
			tblProduct(intProductCateCode, strProductName, intProductQuantity, blobProductPhoto, strProductDesc, intProdStatus)
		VALUES
			(intCateCode, strName, 0, blobPhoto, strDesc, 1);
            
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `createPromo`(IN strName VARCHAR(45),
								IN strDesc VARCHAR(70),
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
										 IN intServID INT,
                                         IN intQuan INT)
BEGIN
	INSERT INTO
		tblServicePackage(intPackageID, intPackageServiceID, intQuantity, intPackageServiceStatus )
	VALUES
		(intID, intServID, intQuan, 1);
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
                                       IN intServID INT, IN inQuan INT)
BEGIN
	INSERT INTO
		tblServicePromo(intPromoID, intServiceID, intQuantity, intPromoStatus)
	VALUES
		(intID, intServID, inQuan, 1);
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
		P.intProductID, C.strProdCategory, P.strProductName, P.strProductDesc, P.intProductQuantity, P.blobProductPhoto, P.intProdStatus 
	FROM
		tblProduct P
	INNER JOIN
		tblProductCategory C
	ON
		P.intProductCateCode = C.intProdCateCode
	WHERE intProdStatus = 1;
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
		S.intServiceCateCode = C.intServiceCateCode
	WHERE
		intServiceStatus = 1;
	
    commit;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllCatalogue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllCatalogue`()
BEGIN
	SELECT C.intCatalogueID, S.strServiceName, C.strCatalogueName, C.blobStylePhoto, C.intStatus
    FROM tblCatalogue C
    INNER JOIN tblService S
    ON C.intServiceID = S.intServiceID;
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
/*!50003 DROP PROCEDURE IF EXISTS `updateCatalogue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateCatalogue`(IN intCatID INT,
									IN strType VARCHAR(20),
									IN strName VARCHAR(70),
									IN blobPhoto LONGBLOB)
BEGIN
	DECLARE intID INT;
    
    SELECT intServiceID INTO intID FROM tblService WHERE strServiceName = strType;

	IF(blobPhoto = 101)
	THEN
		UPDATE tblCatalogue SET intServiceID = intID, strCatalogueName = strName
		WHERE intCatalogueID = intCatID;
	ELSEIF(blobPhoto <> 101)
    THEN
		UPDATE tblCatalogue SET intServiceID = intID, strCatalogueName = strName, blobStylePhoto = blobPhoto
		WHERE intCatalogueID = intCatID;
	END IF;
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
                              IN strEmail VARCHAR(45),
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
					strEmpGender = strGender, strEmpAddress = strAddress, strEmpContactNo = strContact, strEmpEmail = strEmail, intEmpJobID = intJobIDRetrieved
				WHERE
					intEmpID = intID;
			ELSEIF(blobPhoto <> 101)
			THEN
				UPDATE
					tblEmployee
				SET
					strEmpLastName = strLname, strEmpFirstName = strFname, strEmpMiddleName = strMname, datEmpBirthdate = datBday,
					strEmpGender = strGender, strEmpAddress = strAddress, strEmpContactNo = strContact, strEmpEmail = strEmail, blobEmpPhoto = blobPhoto, intEmpJobID = intJobIDRetrieved
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
					strEmpGender = strGender, strEmpAddress = strAddress, strEmpContactNo = strContact, strEmpEmail = strEmail, intEmpJobID = intNewJob
				WHERE
					intEmpID = intID;
			ELSEIF(blobPhoto <> 101)
			THEN
				UPDATE
					tblEmployee
				SET
					strEmpLastName = strLname, strEmpFirstName = strFname, strEmpMiddleName = strMname, datEmpBirthdate = datBday,
					strEmpGender = strGender, strEmpAddress = strAddress, strEmpContactNo = strContact, strEmpEmail = strEmail, blobEmpPhoto = blobPhoto, intEmpJobID = intNewJob
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
					strEmpGender = strGender, strEmpAddress = strAddress, strEmpContactNo = strContact, strEmpEmail = strEmail
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
/*!50003 DROP PROCEDURE IF EXISTS `updateLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateLocation`(IN intID INT,
									IN strLocation VARCHAR(45),
								   IN dblPrice DOUBLE)
BEGIN
	UPDATE tblLocation SET strLocationName = strLocation, dblLocationPrice = dblPrice WHERE intLocationID = intID;
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
        
	IF(blobPhoto <> 101)
	THEN
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
	ELSEIF(blobPhoto = 101)
    THEN
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
				intProductCateCode = intCateCode, strProductName = strName, strProductDesc = strDesc
			WHERE
				intProductID = intID;
            
		ELSEIF(intCateCode IS NOT NULL)
		THEN
    
			UPDATE 
				tblProduct
			SET
				intProductCateCode = intCateCode, strProductName = strName, strProductDesc = strDesc
			WHERE
				intProductID = intID;
            
		END IF;	
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
										 IN intQuan INT,
                                         IN intStatus INT)
BEGIN
	UPDATE
		tblProductPackage
	SET
		intQuantity = intQuan, intProductPackageStatus = intStatus
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
										 IN intStatus INT,
                                         IN intQuan INT)
BEGIN
	UPDATE
		tblServicePackage
	SET
		intQuantity = intQuan, intPackageServiceStatus = intStatus
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

-- Dump completed on 2016-03-10 22:49:19