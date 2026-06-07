-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2025 at 03:38 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `health_care_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `booked_medicine`
--

CREATE TABLE `booked_medicine` (
  `id` int(11) NOT NULL,
  `med_id` int(11) NOT NULL,
  `cust_name` varchar(255) NOT NULL,
  `medicine` varchar(255) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `quantity` varchar(55) NOT NULL,
  `price` varchar(55) NOT NULL,
  `bill_date` varchar(55) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booked_medicine`
--

INSERT INTO `booked_medicine` (`id`, `med_id`, `cust_name`, `medicine`, `company`, `quantity`, `price`, `bill_date`, `status`) VALUES
(1, 1, 'Jay', 'Nicip', 'Cipla', '10', '115.00', '05/03/2025', 'AddCart'),
(2, 1, 'Raj', 'Nicip', 'Cipla', '10', '115.00', '05/03/2025', 'AddCart'),
(6, 2, 'Raj', 'Paracetimal', 'Cipla', '5', '40.0', '05/03/2025', 'AddCart');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `id` int(11) NOT NULL,
  `medicine` varchar(255) DEFAULT NULL,
  `sub` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`id`, `medicine`, `sub`, `company`, `type`, `quantity`, `price`, `username`) VALUES
(1, 'Nicip', '50mg', 'Cipla', 'Tablet', 40, 1115.00, 'Wellness Forever'),
(2, 'Paracetimal', '50mg', 'Cipla', 'Tablet', 75, 890.00, 'Wellness Forever'),
(3, 'Koflet', 'Alcofet', 'Cipla', 'Surup', 45, 900.00, 'Wellness Forever'),
(7, 'Omeze', '10mg', 'Becape', 'Tablet', 60, 540.00, 'Wellness Forever');

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tblblockchain`
--

CREATE TABLE `tblblockchain` (
  `TransactionID` int(10) NOT NULL,
  `Hospital_Email_ID` longtext DEFAULT NULL,
  `BlocKData` longtext DEFAULT NULL,
  `Current_Times` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblblockchain`
--

INSERT INTO `tblblockchain` (`TransactionID`, `Hospital_Email_ID`, `BlocKData`, `Current_Times`) VALUES
(22, 'h1@gmail.com', '34506a154fd2e202204b5d8a32515f5dacf498edc3bf0002106f4ec3340d75c2', '2021-05-27 00:34:26'),
(23, 'h1@gmail.com', '6159b84e71fe9383cbe8d17b3491bd8822bf657daa4fe91958f1968179d52989', '2024-10-15 17:19:16'),
(24, 'Apolo Hospital', '1bc6a7c71f9dcf3d1b4c826e2a5f3b7fbaaef496bde2701095b2bdb0683db6ff', '2025-03-07 12:58:11'),
(25, 'Apolo Hospital', '1bc6a7c71f9dcf3d1b4c826e2a5f3b7fbaaef496bde2701095b2bdb0683db6ff', '2025-03-07 13:01:16'),
(26, 'Apolo Hospital', '1bc6a7c71f9dcf3d1b4c826e2a5f3b7fbaaef496bde2701095b2bdb0683db6ff', '2025-03-07 13:02:59'),
(27, 'Apolo Hospital', 'ed784824187926494ed9cac570bf01b63961b207d663c6ae8a99cfaa841073e1', '2025-03-07 13:17:39');

-- --------------------------------------------------------

--
-- Table structure for table `tblchat`
--

CREATE TABLE `tblchat` (
  `id` int(11) NOT NULL,
  `wid` varchar(55) NOT NULL,
  `pid` varchar(55) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `timestamp` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblchat`
--

INSERT INTO `tblchat` (`id`, `wid`, `pid`, `sender`, `message`, `timestamp`) VALUES
(3, '1', '4', 'AJ Pharma', 'Hey Dj', '2025-03-07 15:48:07'),
(4, '1', '4', 'AJ Pharma', 'Ok', '2025-03-07 16:12:14'),
(6, '1', '4', 'AJ Pharma', 'Order Received', '2025-03-07 20:07:40');

-- --------------------------------------------------------

--
-- Table structure for table `tblchat1`
--

CREATE TABLE `tblchat1` (
  `id` int(11) NOT NULL,
  `pid` varchar(55) DEFAULT NULL,
  `wid` varchar(55) DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL,
  `message` varchar(255) NOT NULL,
  `timestamp` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblchat1`
--

INSERT INTO `tblchat1` (`id`, `pid`, `wid`, `receiver`, `message`, `timestamp`) VALUES
(1, '4', '1', 'Dvijay Pharma Pvt. Ltd.', 'Hello AJ', '2025-03-07 16:31:55');

-- --------------------------------------------------------

--
-- Table structure for table `tbldealer`
--

CREATE TABLE `tbldealer` (
  `id` int(11) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `dob` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `mobile` varchar(200) NOT NULL,
  `pswd` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbldealer`
--

INSERT INTO `tbldealer` (`id`, `firstname`, `lastname`, `email`, `dob`, `gender`, `mobile`, `pswd`, `status`) VALUES
(1, 'Ramesh', 'Kumar', 'ramesh@gmail.com', '1996-05-05', 'Male', '9876543456', '123', 'Active'),
(2, 'JK', 'Courier', 'jk@gmail.com', '1998-08-05', 'Male', '8790875784', '123', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tblhospital`
--

CREATE TABLE `tblhospital` (
  `ID_Patient` int(10) NOT NULL,
  `Name` text DEFAULT NULL,
  `Email_IDs` text DEFAULT NULL,
  `Mobile_No` text DEFAULT NULL,
  `Passwords` text DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `b_type` text DEFAULT NULL,
  `Status` varchar(255) DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblhospital`
--

INSERT INTO `tblhospital` (`ID_Patient`, `Name`, `Email_IDs`, `Mobile_No`, `Passwords`, `Address`, `b_type`, `Status`) VALUES
(1, 'h1', 'h1@gmail.com', '8605067524', '123', '8605067524', 'Hospital Service', 'Active'),
(2, 'Apolo Hospital', 'apolo@gmail.com', 'Deccan, Pune', '1234', 'Deccan, Pune', 'Hospital Service', 'Active'),
(3, 'Puna Hospital', 'puna@gmail.com', 'FC, Pune', '1122', 'FC, Pune', 'Hospital Service', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tblinfohospital`
--

CREATE TABLE `tblinfohospital` (
  `I_IDs` int(11) NOT NULL,
  `PatientEmail` text DEFAULT NULL,
  `Insurance_Company` text DEFAULT NULL,
  `Police_Name` text DEFAULT NULL,
  `Months` text DEFAULT NULL,
  `Coverage_Msg` text DEFAULT NULL,
  `Hospital_Email_ID` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblinfohospital`
--

INSERT INTO `tblinfohospital` (`I_IDs`, `PatientEmail`, `Insurance_Company`, `Police_Name`, `Months`, `Coverage_Msg`, `Hospital_Email_ID`) VALUES
(22, 'raj@gmail.com', 'ICICI', 'ICICI', '10', 'Up to 2 Member', 'h1@gmail.com'),
(23, 'raj@gmail.com', 'ICICI', 'ICICI', '10', 'Up to 2 Member', 'h1@gmail.com'),
(27, 'priya@gmail.com', 'a', 'health care', '1', 'up to 4 member family', 'Apolo Hospital');

-- --------------------------------------------------------

--
-- Table structure for table `tblinfoinsurance`
--

CREATE TABLE `tblinfoinsurance` (
  `T_ID` int(10) NOT NULL,
  `PatientName` text DEFAULT NULL,
  `PatientEmail` text DEFAULT NULL,
  `Company_Name` text DEFAULT NULL,
  `Mobile_Number` text DEFAULT NULL,
  `Web_Site` text DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `Policy_No` text DEFAULT NULL,
  `Policy_Name` text DEFAULT NULL,
  `Policy_Tenue` text DEFAULT NULL,
  `Base_Premium` text DEFAULT NULL,
  `Coverage_Info` text DEFAULT NULL,
  `Policy_Amount` text DEFAULT NULL,
  `Email_IDs` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblinfoinsurance`
--

INSERT INTO `tblinfoinsurance` (`T_ID`, `PatientName`, `PatientEmail`, `Company_Name`, `Mobile_Number`, `Web_Site`, `Address`, `Policy_No`, `Policy_Name`, `Policy_Tenue`, `Base_Premium`, `Coverage_Info`, `Policy_Amount`, `Email_IDs`) VALUES
(5, 'abc', 'abc@gmail.com', 'Stat Health', '88889233612', 'www.pp.com', 'pune', '10101010', 'health care', '1', '10000', 'up to 4 member family', '5 Lac', 'tata@gmail.com'),
(9, 'Raj', 'raj@gmail.com', 'ICICI', '9876543211', 'icici.com', 'Pune', 'AC12345', 'ICICI', '10', '5500', 'Up to 2 Member', '5Lac', 'tata@gmail.com'),
(10, 'Priya Patil', 'priya@gmail.com', 'Star Health', '88889233612', 'www.pp.com', 'pune', '10101010', 'health care', '1', '10000', 'up to 4 member family', '5 Lac', 'tata@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tblinfoinsuranceo`
--

CREATE TABLE `tblinfoinsuranceo` (
  `I_IDs` int(10) NOT NULL,
  `PatientName` text DEFAULT NULL,
  `PatientEmail` text DEFAULT NULL,
  `Insurance_Company` text DEFAULT NULL,
  `Police_Name` text DEFAULT NULL,
  `Months` text DEFAULT NULL,
  `Coverage_Msg` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblinfoinsuranceo`
--

INSERT INTO `tblinfoinsuranceo` (`I_IDs`, `PatientName`, `PatientEmail`, `Insurance_Company`, `Police_Name`, `Months`, `Coverage_Msg`) VALUES
(1, 'abc', 'abc@gmail.com', 'tata', 'health care', '15', '4 family member'),
(2, 'Raj', 'raj@gmail.com', 'ICICI', 'ICICI', '10', 'Up to 2 Member'),
(3, 'Priya Patil', 'priya@gmail.com', 'a', 'health care', '1', 'up to 4 member family');

-- --------------------------------------------------------

--
-- Table structure for table `tblinsurance`
--

CREATE TABLE `tblinsurance` (
  `ID_Patient` int(10) NOT NULL,
  `Name` text DEFAULT NULL,
  `Email_IDs` text DEFAULT NULL,
  `Mobile_No` text DEFAULT NULL,
  `Passwords` text DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `b_type` varchar(255) DEFAULT NULL,
  `Status` text DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblinsurance`
--

INSERT INTO `tblinsurance` (`ID_Patient`, `Name`, `Email_IDs`, `Mobile_No`, `Passwords`, `Address`, `b_type`, `Status`) VALUES
(1, 'TataAIG', 'tata@gmail.com', '88888896', '123', 'Pune', 'Private Limited Company', 'Active'),
(2, 'Kotak Health', 'kotak@gmail.com', '89888890', '1212', 'Mumbai', 'Private Limited Company', 'Active'),
(3, 'Star Health', 'star@gmail.com', 'PC, Pune', '1234', 'PC, Pune', 'Private Limited Company', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tblinsurance_details`
--

CREATE TABLE `tblinsurance_details` (
  `T_ID` int(10) NOT NULL,
  `Email_IDs` text DEFAULT NULL,
  `Company_Name` text DEFAULT NULL,
  `Mobile_Number` text DEFAULT NULL,
  `Web_Site` text DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `Policy_No` text DEFAULT NULL,
  `Policy_Name` text DEFAULT NULL,
  `Policy_Tenue` text DEFAULT NULL,
  `Base_Premium` text DEFAULT NULL,
  `Coverage_Info` text DEFAULT NULL,
  `Policy_Amount` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblinsurance_details`
--

INSERT INTO `tblinsurance_details` (`T_ID`, `Email_IDs`, `Company_Name`, `Mobile_Number`, `Web_Site`, `Address`, `Policy_No`, `Policy_Name`, `Policy_Tenue`, `Base_Premium`, `Coverage_Info`, `Policy_Amount`) VALUES
(1, 'tata@gmail.com', 'a', '88889233612', 'www.pp.com', 'pune', '10101010', 'health care', '1', '10000', 'up to 4 member family', '5 Lac'),
(2, 'tata@gmail.com', 'ICICI', '9876543211', 'icici.com', 'Pune', 'AC12345', 'ICICI', '10', '5500', 'Up to 2 Member', '5Lac');

-- --------------------------------------------------------

--
-- Table structure for table `tblmaster`
--

CREATE TABLE `tblmaster` (
  `Trans_ID` int(10) NOT NULL,
  `Transcation_Hash` text DEFAULT NULL,
  `FromName` text DEFAULT NULL,
  `ToName` text DEFAULT NULL,
  `NonceData` text DEFAULT NULL,
  `PreViewHash` text DEFAULT NULL,
  `DiseaseFirst` text DEFAULT NULL,
  `DiseaseSecond` text DEFAULT NULL,
  `DiseaseThrees` text DEFAULT NULL,
  `DiseaseFour` text DEFAULT NULL,
  `DiseaseFive` text DEFAULT NULL,
  `DiseaseSix` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblmaster`
--

INSERT INTO `tblmaster` (`Trans_ID`, `Transcation_Hash`, `FromName`, `ToName`, `NonceData`, `PreViewHash`, `DiseaseFirst`, `DiseaseSecond`, `DiseaseThrees`, `DiseaseFour`, `DiseaseFive`, `DiseaseSix`) VALUES
(3, '00000a9ad915c7c622de08f4f3052489c5d95e1987486fb1a185b1da9c078d0e', 'h1@gmail.com', 'om@gmail.com', '9345834', '000002c2b63ecc0e5d104054cc67bdee0af7288293d734c6810089beb3106a7c', 'jkdbfk', 'kjsdbfk', 'bdkjlb', 'kjbdvk', 'kjbvkdb', 'kjbvdkj'),
(4, '000008b3725149d8429ab25735dcccfb47999360c8ac04698654eecd163c9aab', 'h1@gmail.com', 'abc@gmail.com', '3829846', '0000087dd16f687d94f6dc73a4b45e72ad795b1350837f0d55082213665ca2fe', 'f', 's', 's', 'ss', 's', 's'),
(21, '34506a154fd2e202204b5d8a32515f5dacf498edc3bf0002106f4ec3340d75c2', 'h1@gmail.com', 'raj@gmail.com', '32', '0', 'Headache', 'Pain', 'Feavor', 'No', 'No', 'No'),
(27, 'ed784824187926494ed9cac570bf01b63961b207d663c6ae8a99cfaa841073e1', 'Apolo Hospital', 'priya@gmail.com', '32', '0', 'Headache', 'StumakPain', 'Hand Pain', 'Na', 'Na', 'Na');

-- --------------------------------------------------------

--
-- Table structure for table `tblmasterpatient`
--

CREATE TABLE `tblmasterpatient` (
  `P_ID` int(11) NOT NULL,
  `First_Name` text DEFAULT NULL,
  `Middle_Name` text DEFAULT NULL,
  `Last_Name` text DEFAULT NULL,
  `Birth_Of_Date` text DEFAULT NULL,
  `Email_ID` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblmasterpatient`
--

INSERT INTO `tblmasterpatient` (`P_ID`, `First_Name`, `Middle_Name`, `Last_Name`, `Birth_Of_Date`, `Email_ID`) VALUES
(4, 'abc', 'ab', 'abb', '2000/1/2', 'abc@gmail.com'),
(8, '0', '0', '0', '0', 'aa@gmail.com'),
(9, '0', '0', '0', '0', 'priya@gmail.com'),
(10, '0', '0', '0', '0', 'kk@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tblmasterpatientnew`
--

CREATE TABLE `tblmasterpatientnew` (
  `P_ID` int(11) NOT NULL,
  `First_Name` text DEFAULT NULL,
  `Middle_Name` text DEFAULT NULL,
  `Last_Name` text DEFAULT NULL,
  `Birth_Of_Date` text DEFAULT NULL,
  `DiseaseFirst` text DEFAULT NULL,
  `DiseaseSecond` text DEFAULT NULL,
  `DiseaseThrees` text DEFAULT NULL,
  `DiseaseFour` text DEFAULT NULL,
  `DiseaseFive` text DEFAULT NULL,
  `DiseaseSix` text DEFAULT NULL,
  `Email_ID` text DEFAULT NULL,
  `DateShow` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblmasterpatientnew`
--

INSERT INTO `tblmasterpatientnew` (`P_ID`, `First_Name`, `Middle_Name`, `Last_Name`, `Birth_Of_Date`, `DiseaseFirst`, `DiseaseSecond`, `DiseaseThrees`, `DiseaseFour`, `DiseaseFive`, `DiseaseSix`, `Email_ID`, `DateShow`) VALUES
(6, 'om', 'aa', 'okn', '1990/2/15', 'aa', 'aa', 'aa', 'aa', 'aa', 'aa', 'om@gmail.com', '2020-03-13 14:55:25'),
(22, 'Raj', 'Kumar', 'Patil', '2012-05-05', 'Headache', 'Pain', 'Feavor', 'No', 'No', 'No', 'raj@gmail.com', '2021-05-27 00:34:26'),
(23, 'Raj', 'Kumar', 'Patil', '2006-10-10', 'Abc', 'abc', 'abc', 'abc', 'abc', 'abc', 'raj@gmail.com', '2024-10-15 17:19:16'),
(27, 'Priya', 'Kumar', 'Patil', '2005-03-08', 'Headache', 'StumakPain', 'Hand Pain', 'Na', 'Na', 'Na', 'priya@gmail.com', '2025-03-07 13:17:39');

-- --------------------------------------------------------

--
-- Table structure for table `tblmedicine`
--

CREATE TABLE `tblmedicine` (
  `id` int(11) NOT NULL,
  `OrderId` varchar(255) NOT NULL,
  `Email_ID` varchar(255) NOT NULL,
  `hospital` varchar(200) NOT NULL,
  `medname` varchar(255) NOT NULL,
  `submedname` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `createdate` varchar(255) NOT NULL,
  `createtime` varchar(255) NOT NULL,
  `cost` varchar(200) NOT NULL DEFAULT '0',
  `TrackingId` varchar(200) NOT NULL DEFAULT 'Not Assign'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblmedicine`
--

INSERT INTO `tblmedicine` (`id`, `OrderId`, `Email_ID`, `hospital`, `medname`, `submedname`, `company`, `quantity`, `createdate`, `createtime`, `cost`, `TrackingId`) VALUES
(2, 'CH2020212', 'raj@gmail.com', 'h1@gmail.com', 'Remdesivir', '100mg/vial', 'COVIFOR', '5', '2021/05/27', '00:49:47', '1000', 'CH2020214'),
(4, 'CH2020213', 'raj@gmail.com', 'h1@gmail.com', 'Admisor', 'Divis', 'Shipla', '10', '2021/05/27', '14:28:40', '800', 'CH2020214'),
(5, 'OD2020215', 'raj@gmail.com', 'h1@gmail.com', 'Fevasor', '250mg', 'Somp', '12', '2021/05/28', '12:44:47', '10500', 'CH20202116'),
(6, 'OD2020216', 'raj@gmail.com', 'h1@gmail.com', 'abc', 'abc', 'abc', '12', '2024/10/15', '17:17:30', '0', 'Not Assign'),
(7, 'OD2020217', 'priya@gmail.com', 'Apolo Hospital', 'Naxdom', '250mg', 'Sun Pharma', '20', '2025/03/07', '13:33:13', '2030', 'CH20202120');

-- --------------------------------------------------------

--
-- Table structure for table `tblorder`
--

CREATE TABLE `tblorder` (
  `Order_ID` varchar(55) NOT NULL,
  `Order_Date` varchar(255) DEFAULT NULL,
  `Pharmacy_Supplier` varchar(255) DEFAULT NULL,
  `Medicines` text DEFAULT NULL,
  `Quantity` varchar(255) DEFAULT NULL,
  `Total_Amount` varchar(255) DEFAULT NULL,
  `Order_Status` varchar(50) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblorder`
--

INSERT INTO `tblorder` (`Order_ID`, `Order_Date`, `Pharmacy_Supplier`, `Medicines`, `Quantity`, `Total_Amount`, `Order_Status`) VALUES
('20250301', '04/03/2025', 'Health Forever', 'Paracitimal, Nicip, Omeze', '100', '23450', 'Pending'),
('20250302', '01/03/2025', 'Wellness', 'Remediciver', '10', '25400', 'Order Accepted'),
('2BU61K', '05/03/2025', 'Wellness Forever', 'Koflet', '45', '890.0', 'Pending'),
('P48BIQ', '05/03/2025', 'Wellness Forever', 'Omeze', '60', '540.0', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `tblpharmacy`
--

CREATE TABLE `tblpharmacy` (
  `id` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Email_IDs` varchar(255) DEFAULT NULL,
  `Mobile_No` varchar(2255) DEFAULT NULL,
  `Passwords` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Status` varchar(50) DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpharmacy`
--

INSERT INTO `tblpharmacy` (`id`, `Name`, `Email_IDs`, `Mobile_No`, `Passwords`, `Address`, `Status`) VALUES
(1, 'Health Forever', 'healthforever@gmail.com', '8888889090', 'hp@123', 'Deccan, Pune', 'Active'),
(3, 'Wellness Forever', 'wellness@gmail.com', 'Chnchwad, Pune', '12345', 'Chnchwad, Pune', 'Active'),
(4, 'AJ Pharma', 'ajpharma@gmail.com', 'PC, Mumbai', '1122', 'PC, Mumbai', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tblregister`
--

CREATE TABLE `tblregister` (
  `ID_Patient` int(10) NOT NULL,
  `Name` text DEFAULT NULL,
  `Email_IDs` text DEFAULT NULL,
  `Mobile_No` text DEFAULT NULL,
  `Passwords` text DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `Gender` text DEFAULT NULL,
  `Hospital_Name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblregister`
--

INSERT INTO `tblregister` (`ID_Patient`, `Name`, `Email_IDs`, `Mobile_No`, `Passwords`, `Address`, `Gender`, `Hospital_Name`) VALUES
(4, 'abc', 'abc@gmail.com', '8888888888', '123', '8888888888', 'Male', 'h1'),
(6, 'Karan', 'karan@gmail.com', '8888923361', '123', '8888923361', 'Male', 'Apolo Hospital'),
(7, 'Raj', 'raj@gmail.com', '9876543456', '1234', '9876543456', 'Male', 'Puna Hospital'),
(8, 'Priya Patil', 'priya@gmail.com', 'PC, Pune', '1212', 'PC, Pune', 'FeMale', 'Apolo Hospital'),
(9, 'Karshma Kapoor', 'kk@gmail.com', 'Malad, Mumbai', '1122', 'Malad, Mumbai', 'FeMale', 'Puna Hospital');

-- --------------------------------------------------------

--
-- Table structure for table `tblshipproduct`
--

CREATE TABLE `tblshipproduct` (
  `id` int(11) NOT NULL,
  `TrackingId` varchar(200) NOT NULL,
  `Email_ID` varchar(200) NOT NULL,
  `hospitalname` varchar(200) NOT NULL,
  `total_product` varchar(200) NOT NULL,
  `cost` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL DEFAULT 'Not Assign',
  `dealername` varchar(200) NOT NULL DEFAULT '0',
  `otp` varchar(255) NOT NULL DEFAULT '0',
  `payment` varchar(200) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblshipproduct`
--

INSERT INTO `tblshipproduct` (`id`, `TrackingId`, `Email_ID`, `hospitalname`, `total_product`, `cost`, `status`, `dealername`, `otp`, `payment`) VALUES
(3, 'CH2020213', 'raj@gmail.com', 'h1@gmail.com', '1', '600', 'Delivered', 'Ramesh Kumar', '5834', 'Done'),
(14, 'CH2020214', 'raj@gmail.com', 'h1@gmail.com', '1', '2500', 'Not Assign', '0', '0', 'Pending'),
(15, 'CH20202115', 'raj@gmail.com', 'h1@gmail.com', '2', '5200', 'Delivered', 'JK Courier', '6046', 'Done'),
(16, 'CH20202116', 'raj@gmail.com', 'h1@gmail.com', '12', '10500', 'Assign', 'JK Courier', '0', 'Pending'),
(17, 'CH20202117', 'priya@gmail.com', 'Apolo Hospital', '20', '2030', 'Not Assign', '0', '0', 'Pending'),
(18, 'CH20202118', 'priya@gmail.com', 'Apolo Hospital', '20', '2030', 'Not Assign', '0', '0', 'Pending'),
(19, 'CH20202119', 'priya@gmail.com', 'Apolo Hospital', '20', '2030', 'Delivered', 'Ramesh Kumar', '6403', 'Done'),
(20, 'CH20202120', 'priya@gmail.com', 'Apolo Hospital', '20', '2030', 'Assign', 'Ramesh Kumar', '0', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `tblsupplier`
--

CREATE TABLE `tblsupplier` (
  `id` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Email_IDs` varchar(255) DEFAULT NULL,
  `Mobile_No` varchar(20) DEFAULT NULL,
  `Passwords` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `b_type` varchar(255) DEFAULT NULL,
  `Status` varchar(10) DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblsupplier`
--

INSERT INTO `tblsupplier` (`id`, `Name`, `Email_IDs`, `Mobile_No`, `Passwords`, `Address`, `b_type`, `Status`) VALUES
(1, 'Jay Pharma', 'jaypharmaceuticals@gmail.com', '9090909090', '123', 'Pimpri, Pune', 'Supplier Service', 'Active'),
(2, 'PN Pharma Services', 'pnpharma@gmail.com', 'Main Nashik', '1010', 'Main Nashik', 'Supplier Service', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tbltracking`
--

CREATE TABLE `tbltracking` (
  `id` int(11) NOT NULL,
  `TrackingId` varchar(200) NOT NULL,
  `dealername` varchar(200) NOT NULL,
  `total_product` varchar(200) NOT NULL,
  `cdate` varchar(200) NOT NULL,
  `time` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbltracking`
--

INSERT INTO `tbltracking` (`id`, `TrackingId`, `dealername`, `total_product`, `cdate`, `time`, `status`) VALUES
(1, 'CH2020213', 'aa aa', '1', '2021/05/27', '20:16:41', 'Delivered'),
(5, 'CH20202115', 'JK Courier', '2', '2021/05/28', '13:35:05', 'Delivered'),
(6, 'CH20202116', 'JK Courier', '12', '2021/05/28', '13:53:07', 'In Transit'),
(7, 'CH20202120', 'Ramesh Kumar', '20', '2025/03/07', '14:51:25', 'In Transit'),
(8, 'CH20202119', 'Ramesh Kumar', '20', '2025/03/07', '14:52:42', 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `tblwholesaler`
--

CREATE TABLE `tblwholesaler` (
  `id` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Email_IDs` varchar(255) DEFAULT NULL,
  `Mobile_No` varchar(20) DEFAULT NULL,
  `Passwords` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Status` varchar(10) DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblwholesaler`
--

INSERT INTO `tblwholesaler` (`id`, `Name`, `Email_IDs`, `Mobile_No`, `Passwords`, `Address`, `Status`) VALUES
(1, 'Dvijay Pharma Pvt. Ltd.', 'dvijaypharma@gmail.com', '9898989890', '123', 'PC, Pune', 'Active'),
(2, 'Ator Healthcare Pvt. Ltd.', 'ator@gmail.com', '9098989090', '1122', 'FC, Pune', 'Active'),
(3, 'Bajaj Healthcare', 'bajaj@gmail.com', 'Shivajinagar, Pune', '1155', 'Shivajinagar, Pune', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booked_medicine`
--
ALTER TABLE `booked_medicine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblblockchain`
--
ALTER TABLE `tblblockchain`
  ADD PRIMARY KEY (`TransactionID`);

--
-- Indexes for table `tblchat`
--
ALTER TABLE `tblchat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblchat1`
--
ALTER TABLE `tblchat1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbldealer`
--
ALTER TABLE `tbldealer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblhospital`
--
ALTER TABLE `tblhospital`
  ADD PRIMARY KEY (`ID_Patient`);

--
-- Indexes for table `tblinfohospital`
--
ALTER TABLE `tblinfohospital`
  ADD PRIMARY KEY (`I_IDs`),
  ADD KEY `I_IDs` (`I_IDs`);

--
-- Indexes for table `tblinfoinsurance`
--
ALTER TABLE `tblinfoinsurance`
  ADD PRIMARY KEY (`T_ID`);

--
-- Indexes for table `tblinfoinsuranceo`
--
ALTER TABLE `tblinfoinsuranceo`
  ADD KEY `I_IDs` (`I_IDs`);

--
-- Indexes for table `tblinsurance`
--
ALTER TABLE `tblinsurance`
  ADD PRIMARY KEY (`ID_Patient`);

--
-- Indexes for table `tblinsurance_details`
--
ALTER TABLE `tblinsurance_details`
  ADD PRIMARY KEY (`T_ID`);

--
-- Indexes for table `tblmaster`
--
ALTER TABLE `tblmaster`
  ADD PRIMARY KEY (`Trans_ID`);

--
-- Indexes for table `tblmasterpatient`
--
ALTER TABLE `tblmasterpatient`
  ADD PRIMARY KEY (`P_ID`);

--
-- Indexes for table `tblmasterpatientnew`
--
ALTER TABLE `tblmasterpatientnew`
  ADD PRIMARY KEY (`P_ID`);

--
-- Indexes for table `tblmedicine`
--
ALTER TABLE `tblmedicine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblorder`
--
ALTER TABLE `tblorder`
  ADD PRIMARY KEY (`Order_ID`);

--
-- Indexes for table `tblpharmacy`
--
ALTER TABLE `tblpharmacy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblregister`
--
ALTER TABLE `tblregister`
  ADD PRIMARY KEY (`ID_Patient`);

--
-- Indexes for table `tblshipproduct`
--
ALTER TABLE `tblshipproduct`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsupplier`
--
ALTER TABLE `tblsupplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbltracking`
--
ALTER TABLE `tbltracking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblwholesaler`
--
ALTER TABLE `tblwholesaler`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booked_medicine`
--
ALTER TABLE `booked_medicine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblblockchain`
--
ALTER TABLE `tblblockchain`
  MODIFY `TransactionID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tblchat`
--
ALTER TABLE `tblchat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblchat1`
--
ALTER TABLE `tblchat1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbldealer`
--
ALTER TABLE `tbldealer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblhospital`
--
ALTER TABLE `tblhospital`
  MODIFY `ID_Patient` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblinfohospital`
--
ALTER TABLE `tblinfohospital`
  MODIFY `I_IDs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tblinfoinsurance`
--
ALTER TABLE `tblinfoinsurance`
  MODIFY `T_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblinfoinsuranceo`
--
ALTER TABLE `tblinfoinsuranceo`
  MODIFY `I_IDs` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblinsurance`
--
ALTER TABLE `tblinsurance`
  MODIFY `ID_Patient` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblinsurance_details`
--
ALTER TABLE `tblinsurance_details`
  MODIFY `T_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblmaster`
--
ALTER TABLE `tblmaster`
  MODIFY `Trans_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tblmasterpatient`
--
ALTER TABLE `tblmasterpatient`
  MODIFY `P_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblmasterpatientnew`
--
ALTER TABLE `tblmasterpatientnew`
  MODIFY `P_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tblmedicine`
--
ALTER TABLE `tblmedicine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblpharmacy`
--
ALTER TABLE `tblpharmacy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblregister`
--
ALTER TABLE `tblregister`
  MODIFY `ID_Patient` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblshipproduct`
--
ALTER TABLE `tblshipproduct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tblsupplier`
--
ALTER TABLE `tblsupplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbltracking`
--
ALTER TABLE `tbltracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblwholesaler`
--
ALTER TABLE `tblwholesaler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
