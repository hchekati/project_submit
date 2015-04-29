delimiter $$

CREATE TABLE `brand` (
  `BrandID` int(11) DEFAULT NULL,
  `BrandName` varchar(225) DEFAULT NULL,
  `BrandDesc` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `cards` (
  `ItemID` int(11) NOT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `cno` varchar(45) DEFAULT NULL,
  `cvv` varchar(45) DEFAULT NULL,
  `exp` varchar(45) DEFAULT NULL,
  `addr` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `zip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `category` (
  `CategoryID` int(11) DEFAULT NULL,
  `CategoryName` varchar(225) DEFAULT NULL,
  `CategoryDesc` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `feedbackdesc` (
  `Feedbackid` int(11) DEFAULT NULL,
  `Loginname` varchar(225) DEFAULT NULL,
  `brandid` int(11) DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `itemid` int(11) DEFAULT NULL,
  `feedbackdesc` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `inventory` (
  `BrandID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `ItemID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `inventoryaudit` (
  `BrandID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `ItemID` int(11) DEFAULT NULL,
  `ModifiedDate` date DEFAULT NULL,
  `AuditType` int(11) DEFAULT NULL,
  `Comments` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `item` (
  `ItemID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `ItemName` varchar(225) DEFAULT NULL,
  `ItemDesc` varchar(225) DEFAULT NULL,
  `image` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `itemorder` (
  `OrderID` int(11) DEFAULT NULL,
  `BrandID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `ItemID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `loginaudit` (
  `loginid` varchar(225) DEFAULT NULL,
  `logindate` date DEFAULT NULL,
  `logindesc` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `logindetails` (
  `loginname` varchar(225) DEFAULT NULL,
  `password` varchar(225) DEFAULT NULL,
  `firstname` varchar(225) DEFAULT NULL,
  `lastname` varchar(225) DEFAULT NULL,
  `logintype` varchar(225) DEFAULT NULL,
  `loginstatus` int(11) DEFAULT NULL,
  `regdate` date DEFAULT NULL,
  `squestionid` int(11) DEFAULT NULL,
  `sanswer` varchar(225) DEFAULT NULL,
  `firstlogin` int(11) DEFAULT NULL,
  `passmodifieddate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `loginprofile` (
  `loginId` varchar(225) DEFAULT NULL,
  `Hno` varchar(225) DEFAULT NULL,
  `Street` varchar(225) DEFAULT NULL,
  `city` varchar(225) DEFAULT NULL,
  `state` varchar(225) DEFAULT NULL,
  `country` varchar(225) DEFAULT NULL,
  `pincode` varchar(225) DEFAULT NULL,
  `ContactNo` varchar(225) DEFAULT NULL,
  `Email` varchar(225) DEFAULT NULL,
  `profilemodifieddate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `query` (
  `QueryID` int(11) DEFAULT NULL,
  `loginname` varchar(225) DEFAULT NULL,
  `QueryDate` date DEFAULT NULL,
  `Description` varchar(225) DEFAULT NULL,
  `Status` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `questionbase` (
  `questionid` int(11) DEFAULT NULL,
  `questiondetail` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `sample` (
  `image` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `solution` (
  `QueryId` int(11) DEFAULT NULL,
  `SolvedDate` date DEFAULT NULL,
  `Solution` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `totalorders` (
  `OrderID` int(11) DEFAULT NULL,
  `LoginName` varchar(225) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `TotalAmount` int(11) DEFAULT NULL,
  `status` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$


