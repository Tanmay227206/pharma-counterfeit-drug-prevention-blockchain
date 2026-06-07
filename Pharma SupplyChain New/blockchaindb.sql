# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     blockchain1
# Server version:               5.1.73-community
# Server OS:                    Win32
# HeidiSQL version:             5.0.0.3272
# Date/time:                    2020-05-11 13:32:27
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
# Dumping database structure for blockchain1
CREATE DATABASE IF NOT EXISTS `blockchain1` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `blockchain1`;


# Dumping structure for table blockchain1.transhash
CREATE TABLE IF NOT EXISTS `transhash` (
  `TransactionID` int(11) NOT NULL AUTO_INCREMENT,
  `PlainData` longtext,
  `BlocKData` longtext,
  `PreviousHash` longtext,
  `HashBlock` longtext,
  `Current_Times` longtext,
  PRIMARY KEY (`TransactionID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

# Dumping data for table blockchain1.transhash: 5 rows
/*!40000 ALTER TABLE `transhash` DISABLE KEYS */;
INSERT INTO `transhash` (`TransactionID`, `PlainData`, `BlocKData`, `PreviousHash`, `HashBlock`, `Current_Times`) VALUES (1, 'xyz@gmail.com0000a-----', '000e8d75c57e68cd29bb97ded89932049332d65e91dc5a833086a8654db8d6d4', '0', '1589175361323', '48154'), (2, 'abc@gmail.comabcababb2000/1/2aaaa-----', '000a3d9805c2dbfdf4a6312018099d68a3c43435cf9d7b03a5c58bf0bd2275ac', '000e8d75c57e68cd29bb97ded89932049332d65e91dc5a833086a8654db8d6d4', '1589175383467', '66955'), (3, 'om@gmail.comomaaokn1990/2/15sfsdfs-----', '00032dc06a19f51c7901ad80b57e53846ff6b9de8622d46ed49d2a45fe9c9809', '000a3d9805c2dbfdf4a6312018099d68a3c43435cf9d7b03a5c58bf0bd2275ac', '1589175538170', '14243'), (4, 'xyz@gmail.com0000fjdhgdlk-----', '00072a74c46727c1e5f78c07afd23cf2997306eb15d55c698e91134549db0e12', '00032dc06a19f51c7901ad80b57e53846ff6b9de8622d46ed49d2a45fe9c9809', '1589175564969', '27743'), (5, 'jitu', '000a63b989ac68a1e70c24c528a0dc7bc853484bc724b7371c9c766a8be27f2e', '00072a74c46727c1e5f78c07afd23cf2997306eb15d55c698e91134549db0e12', '1589183724338', '14888'), (6, 'jitu', '000cd514fe3e1d7fdadc440a4337d55dc761ce33ea5d17d8335f40a6b44c86e5', '000a63b989ac68a1e70c24c528a0dc7bc853484bc724b7371c9c766a8be27f2e', '1589183927289', '31926'), (7, 'jitu', '0002b8f3eeddb6bb8b4afa8117898e371e49d288d5dbc86697bc4772878c0655', '000cd514fe3e1d7fdadc440a4337d55dc761ce33ea5d17d8335f40a6b44c86e5', '1589183959871', '30529'), (8, 'jitu', '000c55d27f74dc28cb68d06b212a538420a422b82169d40cc571616e65d33564', '0002b8f3eeddb6bb8b4afa8117898e371e49d288d5dbc86697bc4772878c0655', '1589183986479', '18862');
/*!40000 ALTER TABLE `transhash` ENABLE KEYS */;
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     blockchain2
# Server version:               5.1.73-community
# Server OS:                    Win32
# HeidiSQL version:             5.0.0.3272
# Date/time:                    2020-05-11 13:32:27
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
# Dumping database structure for blockchain2
CREATE DATABASE IF NOT EXISTS `blockchain2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `blockchain2`;


# Dumping structure for table blockchain2.transhash
CREATE TABLE IF NOT EXISTS `transhash` (
  `TransactionID` int(11) NOT NULL AUTO_INCREMENT,
  `PlainData` longtext,
  `BlocKData` longtext,
  `PreviousHash` longtext,
  `HashBlock` longtext,
  `Current_Times` longtext,
  PRIMARY KEY (`TransactionID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

# Dumping data for table blockchain2.transhash: 7 rows
/*!40000 ALTER TABLE `transhash` DISABLE KEYS */;
INSERT INTO `transhash` (`TransactionID`, `PlainData`, `BlocKData`, `PreviousHash`, `HashBlock`, `Current_Times`) VALUES (1, 'xyz@gmail.com0000a-----', '000e8d75c57e68cd29bb97ded89932049332d65e91dc5a833086a8654db8d6d4', '0', '1589175361323', '48154'), (2, 'abc@gmail.comabcababb2000/1/2aaaa-----', '000a3d9805c2dbfdf4a6312018099d68a3c43435cf9d7b03a5c58bf0bd2275ac', '000e8d75c57e68cd29bb97ded89932049332d65e91dc5a833086a8654db8d6d4', '1589175383467', '66955'), (3, 'om@gmail.comomaaokn1990/2/15sfsdfs-----', '00032dc06a19f51c7901ad80b57e53846ff6b9de8622d46ed49d2a45fe9c9809', '000a3d9805c2dbfdf4a6312018099d68a3c43435cf9d7b03a5c58bf0bd2275ac', '1589175538170', '14243'), (4, 'xyz@gmail.com0000fjdhgdlk-----', '00072a74c46727c1e5f78c07afd23cf2997306eb15d55c698e91134549db0e12', '00032dc06a19f51c7901ad80b57e53846ff6b9de8622d46ed49d2a45fe9c9809', '1589175564969', '27743'), (5, 'jitu', '000a63b989ac68a1e70c24c528a0dc7bc853484bc724b7371c9c766a8be27f2e', '0000000000000000000000000000', '1589183724338', '14888'), (6, 'jitu', '000cd514fe3e1d7fdadc440a4337d55dc761ce33ea5d17d8335f40a6b44c86e5', '000a63b989ac68a1e70c24c528a0dc7bc853484bc724b7371c9c766a8be27f2e', '1589183927289', '31926'), (7, 'jitu', '0002b8f3eeddb6bb8b4afa8117898e371e49d288d5dbc86697bc4772878c0655', '000cd514fe3e1d7fdadc440a4337d55dc761ce33ea5d17d8335f40a6b44c86e5', '1589183959871', '30529'), (8, 'jitu', '000c55d27f74dc28cb68d06b212a538420a422b82169d40cc571616e65d33564', '0002b8f3eeddb6bb8b4afa8117898e371e49d288d5dbc86697bc4772878c0655', '1589183986479', '18862');
/*!40000 ALTER TABLE `transhash` ENABLE KEYS */;
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     blockchain3
# Server version:               5.1.73-community
# Server OS:                    Win32
# HeidiSQL version:             5.0.0.3272
# Date/time:                    2020-05-11 13:32:27
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
# Dumping database structure for blockchain3
CREATE DATABASE IF NOT EXISTS `blockchain3` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `blockchain3`;


# Dumping structure for table blockchain3.transhash
CREATE TABLE IF NOT EXISTS `transhash` (
  `TransactionID` int(11) NOT NULL AUTO_INCREMENT,
  `PlainData` longtext,
  `BlocKData` longtext,
  `PreviousHash` longtext,
  `HashBlock` longtext,
  `Current_Times` longtext,
  PRIMARY KEY (`TransactionID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

# Dumping data for table blockchain3.transhash: 8 rows
/*!40000 ALTER TABLE `transhash` DISABLE KEYS */;
INSERT INTO `transhash` (`TransactionID`, `PlainData`, `BlocKData`, `PreviousHash`, `HashBlock`, `Current_Times`) VALUES (1, 'xyz@gmail.com0000a-----', '000e8d75c57e68cd29bb97ded89932049332d65e91dc5a833086a8654db8d6d4', '0', '1589175361323', '48154'), (2, 'abc@gmail.comabcababb2000/1/2aaaa-----', '000a3d9805c2dbfdf4a6312018099d68a3c43435cf9d7b03a5c58bf0bd2275ac', '000e8d75c57e68cd29bb97ded89932049332d65e91dc5a833086a8654db8d6d4', '1589175383467', '66955'), (3, 'om@gmail.comomaaokn1990/2/15sfsdfs-----', '00032dc06a19f51c7901ad80b57e53846ff6b9de8622d46ed49d2a45fe9c9809', '000a3d9805c2dbfdf4a6312018099d68a3c43435cf9d7b03a5c58bf0bd2275ac', '1589175538170', '14243'), (4, 'xyz@gmail.com0000fjdhgdlk-----', '00072a74c46727c1e5f78c07afd23cf2997306eb15d55c698e91134549db0e12', '00032dc06a19f51c7901ad80b57e53846ff6b9de8622d46ed49d2a45fe9c9809', '1589175564969', '27743'), (5, 'jitu', '000a63b989ac68a1e70c24c528a0dc7bc853484bc724b7371c9c766a8be27f2e', '00072a74c46727c1e5f78c07afd23cf2997306eb15d55c698e91134549db0e12', '1589183724338', '14888'), (6, 'jitu', '000cd514fe3e1d7fdadc440a4337d55dc761ce33ea5d17d8335f40a6b44c86e5', '000a63b989ac68a1e70c24c528a0dc7bc853484bc724b7371c9c766a8be27f2e', '1589183927289', '31926'), (7, 'jitu', '0002b8f3eeddb6bb8b4afa8117898e371e49d288d5dbc86697bc4772878c0655', '000cd514fe3e1d7fdadc440a4337d55dc761ce33ea5d17d8335f40a6b44c86e5', '1589183959871', '30529'), (8, 'jitu', '000c55d27f74dc28cb68d06b212a538420a422b82169d40cc571616e65d33564', '0002b8f3eeddb6bb8b4afa8117898e371e49d288d5dbc86697bc4772878c0655', '1589183986479', '18862');
/*!40000 ALTER TABLE `transhash` ENABLE KEYS */;
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     blockchain4
# Server version:               5.1.73-community
# Server OS:                    Win32
# HeidiSQL version:             5.0.0.3272
# Date/time:                    2020-05-11 13:32:27
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
# Dumping database structure for blockchain4
CREATE DATABASE IF NOT EXISTS `blockchain4` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `blockchain4`;


# Dumping structure for table blockchain4.transhash
CREATE TABLE IF NOT EXISTS `transhash` (
  `TransactionID` int(11) NOT NULL AUTO_INCREMENT,
  `PlainData` longtext,
  `BlocKData` longtext,
  `PreviousHash` longtext,
  `HashBlock` longtext,
  `Current_Times` longtext,
  PRIMARY KEY (`TransactionID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

# Dumping data for table blockchain4.transhash: 8 rows
/*!40000 ALTER TABLE `transhash` DISABLE KEYS */;
INSERT INTO `transhash` (`TransactionID`, `PlainData`, `BlocKData`, `PreviousHash`, `HashBlock`, `Current_Times`) VALUES (1, 'xyz@gmail.com0000a-----', '000e8d75c57e68cd29bb97ded89932049332d65e91dc5a833086a8654db8d6d4', '0', '1589175361323', '48154'), (2, 'abc@gmail.comabcababb2000/1/2aaaa-----', '000a3d9805c2dbfdf4a6312018099d68a3c43435cf9d7b03a5c58bf0bd2275ac', '000e8d75c57e68cd29bb97ded89932049332d65e91dc5a833086a8654db8d6d4', '1589175383467', '66955'), (3, 'om@gmail.comomaaokn1990/2/15sfsdfs-----', '00032dc06a19f51c7901ad80b57e53846ff6b9de8622d46ed49d2a45fe9c9809', '000a3d9805c2dbfdf4a6312018099d68a3c43435cf9d7b03a5c58bf0bd2275ac', '1589175538170', '14243'), (4, 'xyz@gmail.com0000fjdhgdlk-----', '00072a74c46727c1e5f78c07afd23cf2997306eb15d55c698e91134549db0e12', '00032dc06a19f51c7901ad80b57e53846ff6b9de8622d46ed49d2a45fe9c9809', '1589175564969', '27743'), (5, 'jitu', '000a63b989ac68a1e70c24c528a0dc7bc853484bc724b7371c9c766a8be27f2e', '00072a74c46727c1e5f78c07afd23cf2997306eb15d55c698e91134549db0e12', '1589183724338', '14888'), (6, 'jitu', '000cd514fe3e1d7fdadc440a4337d55dc761ce33ea5d17d8335f40a6b44c86e5', '000a63b989ac68a1e70c24c528a0dc7bc853484bc724b7371c9c766a8be27f2e', '1589183927289', '31926'), (7, 'jitu', '0002b8f3eeddb6bb8b4afa8117898e371e49d288d5dbc86697bc4772878c0655', '000cd514fe3e1d7fdadc440a4337d55dc761ce33ea5d17d8335f40a6b44c86e5', '1589183959871', '30529'), (8, 'jitu', '000c55d27f74dc28cb68d06b212a538420a422b82169d40cc571616e65d33564', '0002b8f3eeddb6bb8b4afa8117898e371e49d288d5dbc86697bc4772878c0655', '1589183986479', '18862');
/*!40000 ALTER TABLE `transhash` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
