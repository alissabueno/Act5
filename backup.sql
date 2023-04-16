-- MySqlBackup.NET 2.3.8.0
-- Dump Time: 2023-04-17 01:06:28
-- --------------------------------------
-- Server version 10.4.22-MariaDB mariadb.org binary distribution


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 
-- Definition of customers
-- 

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `customerNumber` int(11) NOT NULL,
  `customerName` varchar(45) NOT NULL,
  `contactLastName` varchar(45) NOT NULL,
  `contactFirstName` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `addressLine1` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `salesRepEmployeeNumber` varchar(45) DEFAULT NULL,
  `creditLimit` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`customerNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 
-- Dumping data for table customers
-- 

/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers`(`customerNumber`,`customerName`,`contactLastName`,`contactFirstName`,`phone`,`addressLine1`,`city`,`country`,`salesRepEmployeeNumber`,`creditLimit`) VALUES(103,'Atelier graphique','Schmitt','Carine ','40.32.2555','54, rue Royale','Nantes','France','1370',21000.00),(112,'Signal Gift Stores','King','Jean','7025551838','8489 Strong St.','Las Vegas','USA','1166',71800.00),(114,'Australian Collectors, Co.','Ferguson','Peter','03 9520 4555','636 St Kilda Road','Melbourne','Australia','1611',117300.00),(119,'La Rochelle Gifts','Labrune','Janine ','40.67.8555','67, rue des Cinquante Otages','Nantes','France','1370',118200.00),(121,'Baane Mini Imports','Bergulfsen','Jonas ','07-98 9555','Erling Skakkes gate 78','Stavern','Norway','1504',81700.00),(124,'Mini Gifts Distributors Ltd.','Nelson','Susan','4155551450','5677 Strong St.','San Rafael','USA','1165',210500.00),(125,'Havel & Zbyszek Co','Piestrzeniewicz','Zbyszek ','(26) 642-7555','ul. Filtrowa 68','Warszawa','Poland',NULL,0.00),(128,'Blauer See Auto, Co.','Keitel','Roland','+49 69 66 90 2555','Lyonerstr. 34','Frankfurt','Germany','1504',59700.00),(129,'Mini Wheels Co.','Murphy','Julie','6505555787','5557 North Pendale Street','San Francisco','USA','1165',64600.00),(131,'Land of Toys Inc.','Lee','Kwai','2125557818','897 Long Airport Avenue','NYC','USA','1323',114900.00),(141,'Euro+ Shopping Channel','Freyre','Diego ','(91) 555 94 44','C/ Moralzarzal, 86','Madrid','Spain','1370',227600.00);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

-- 
-- Definition of officearchive
-- 

DROP TABLE IF EXISTS `officearchive`;
CREATE TABLE IF NOT EXISTS `officearchive` (
  `officeCode` varchar(10) NOT NULL,
  `country` varchar(45) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`officeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 
-- Dumping data for table officearchive
-- 

/*!40000 ALTER TABLE `officearchive` DISABLE KEYS */;
INSERT INTO `officearchive`(`officeCode`,`country`,`time`) VALUES('1','USA','2023-02-24 17:36:22');
/*!40000 ALTER TABLE `officearchive` ENABLE KEYS */;

-- 
-- Definition of offices
-- 

DROP TABLE IF EXISTS `offices`;
CREATE TABLE IF NOT EXISTS `offices` (
  `officeCode` varchar(10) NOT NULL,
  `city` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `addressLine1` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  PRIMARY KEY (`officeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 
-- Dumping data for table offices
-- 

/*!40000 ALTER TABLE `offices` DISABLE KEYS */;
INSERT INTO `offices`(`officeCode`,`city`,`phone`,`addressLine1`,`country`) VALUES('2','Boston','+1 215 837 0825','1550 Court Place','USA'),('3','NYC','+1 212 555 3000','523 East 53rd Street','USA'),('4','Paris','+33 14 723 4404','43 Rue Jouffroy D''abbans','France'),('5','Tokyo','+81 33 224 5000','4-1 Kioicho','Japan'),('6','Sydney','+61 2 9264 2451','5-11 Wentworth Avenue','Australia'),('7','London','+44 20 7877 2041','25 Old Broad Street','UK');
/*!40000 ALTER TABLE `offices` ENABLE KEYS */;

-- 
-- Definition of orderdetails
-- 

DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE IF NOT EXISTS `orderdetails` (
  `productCode` varchar(45) NOT NULL,
  `orderNumber` int(11) NOT NULL,
  `quantityOrdered` int(11) NOT NULL,
  `priceEach` decimal(10,2) NOT NULL,
  `orderLineNumber` smallint(6) NOT NULL,
  `orderdetail` varchar(50) NOT NULL,
  PRIMARY KEY (`productCode`,`orderNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 
-- Dumping data for table orderdetails
-- 

/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails`(`productCode`,`orderNumber`,`quantityOrdered`,`priceEach`,`orderLineNumber`,`orderdetail`) VALUES('S18_1342',10102,39,95.55,2,'0'),('S18_1367',10102,41,43.13,1,'0'),('S18_1749',10100,30,136.00,3,'0'),('S18_2248',10100,50,55.09,2,'0'),('S18_2325',10101,25,108.06,4,'0'),('S18_2795',10101,26,167.06,1,'0'),('S18_4409',10100,22,75.46,4,'0'),('S24_1937',10101,45,32.53,3,'0'),('S24_2022',10101,46,44.35,2,'0'),('S24_3969',10100,49,35.29,1,'0');
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;

-- 
-- Definition of orders
-- 

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `orderNumber` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  `requiredDate` date NOT NULL,
  `shippedDate` date DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `comments` text DEFAULT NULL,
  `customerNumber` int(11) NOT NULL,
  PRIMARY KEY (`orderNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 
-- Dumping data for table orders
-- 

/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders`(`orderNumber`,`orderDate`,`requiredDate`,`shippedDate`,`status`,`comments`,`customerNumber`) VALUES(10100,'2003-01-06 00:00:00','2003-01-13 00:00:00','2003-01-10 00:00:00','Shipped',NULL,363),(10101,'2003-01-09 00:00:00','2003-01-18 00:00:00','2003-01-11 00:00:00','Shipped','Check on availability.',128),(10102,'2003-01-10 00:00:00','2003-01-18 00:00:00','2003-01-14 00:00:00','Shipped',NULL,181),(10103,'2003-01-29 00:00:00','2003-02-07 00:00:00','2003-02-02 00:00:00','Shipped',NULL,121),(10104,'2003-01-31 00:00:00','2003-02-09 00:00:00','2003-02-01 00:00:00','Shipped',NULL,141),(10105,'2003-02-11 00:00:00','2003-02-21 00:00:00','2003-02-12 00:00:00','Shipped',NULL,145),(10106,'2003-02-17 00:00:00','2003-02-24 00:00:00','2003-02-21 00:00:00','Shipped',NULL,278),(10107,'2003-02-24 00:00:00','2003-03-03 00:00:00','2003-02-26 00:00:00','Shipped','Difficult to negotiate with customer. We need more marketing materials',131),(10108,'2003-03-03 00:00:00','2003-03-12 00:00:00','2003-03-08 00:00:00','Shipped',NULL,385),(10109,'2003-03-10 00:00:00','2003-03-19 00:00:00','2003-03-11 00:00:00','Shipped','Customer requested that FedEx Ground is used for this shipping',486);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- 
-- Definition of productchanges
-- 

DROP TABLE IF EXISTS `productchanges`;
CREATE TABLE IF NOT EXISTS `productchanges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productCode` varchar(45) DEFAULT NULL,
  `beforequantityInStock` int(11) DEFAULT NULL,
  `afterquantityInStock` int(11) DEFAULT NULL,
  `changedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- 
-- Dumping data for table productchanges
-- 

/*!40000 ALTER TABLE `productchanges` DISABLE KEYS */;
INSERT INTO `productchanges`(`id`,`productCode`,`beforequantityInStock`,`afterquantityInStock`,`changedAt`) VALUES(1,'S10_2016',6625,50,'2023-02-24 16:45:47');
/*!40000 ALTER TABLE `productchanges` ENABLE KEYS */;

-- 
-- Definition of products
-- 

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `productCode` varchar(15) NOT NULL,
  `productName` varchar(70) NOT NULL,
  `productLine` varchar(50) NOT NULL,
  `productScale` varchar(10) NOT NULL,
  `productVendor` varchar(50) NOT NULL,
  `productDescription` text NOT NULL,
  `quantityInStock` smallint(6) DEFAULT NULL,
  `buyPrice` decimal(10,2) NOT NULL,
  `MSRP` decimal(10,2) NOT NULL,
  PRIMARY KEY (`productCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 
-- Dumping data for table products
-- 

/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products`(`productCode`,`productName`,`productLine`,`productScale`,`productVendor`,`productDescription`,`quantityInStock`,`buyPrice`,`MSRP`) VALUES('S10_1678','1969 Harley Davidson Ultimate Chopper','Motorcycles','1:10','Min Lin Diecast','This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.',350,48.81,95.70),('S10_1949','1952 Alpine Renault 1300','Classic Cars','1:10','Classic Metal Creations','Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',7305,98.58,214.30),('S10_2016','1996 Moto Guzzi 1100i','Motorcycles','1:10','Highway 66 Mini Classics','Official Moto Guzzi logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.',50,68.99,118.94),('S10_4698','2003 Harley-Davidson Eagle Drag Bike','Motorcycles','1:10','Red Start Diecast','Model features, official Harley Davidson logos and insignias, detachable rear wheelie bar, heavy diecast metal with resin parts, authentic multi-color tampo-printed graphics, separate engine drive belts, free-turning front fork, rotating tires and rear racing slick, certificate of authenticity, detailed engine, display stand\r\n, precision diecast replica, baked enamel finish, 1:10 scale model, removable fender, seat and tank cover piece for displaying the superior detail of the v-twin engine',5582,91.02,193.66),('S10_4757','1972 Alfa Romeo GTA','Classic Cars','1:10','Motor City Art Classics','Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',3252,85.68,136.00),('S10_4962','1962 LanciaA Delta 16V','Classic Cars','1:10','Second Gear Diecast','Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',6791,103.42,147.74),('S12_1099','1968 Ford Mustang','Classic Cars','1:12','Autoart Studio Design','Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color dark green.',68,95.34,194.57),('S12_1108','2001 Ferrari Enzo','Classic Cars','1:12','Second Gear Diecast','Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',3619,95.59,207.80),('S12_1666','1958 Setra Bus','Trucks and Buses','1:12','Welly Diecast Productions','Model features 30 windows, skylights & glare resistant glass, working steering system, original logos',1579,77.90,136.67),('S12_2823','2002 Suzuki XREO','Motorcycles','1:12','Unimax Art Galleries','Official logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.',9997,66.27,150.62);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- 
-- Definition of reminders
-- 

DROP TABLE IF EXISTS `reminders`;
CREATE TABLE IF NOT EXISTS `reminders` (
  `id` int(11) NOT NULL,
  `customerNumber` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`customerNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 
-- Dumping data for table reminders
-- 

/*!40000 ALTER TABLE `reminders` DISABLE KEYS */;

/*!40000 ALTER TABLE `reminders` ENABLE KEYS */;

-- 
-- Definition of users
-- 

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(250) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 
-- Dumping data for table users
-- 

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users`(`username`,`password`) VALUES('alissa','');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- 
-- Dumping functions
-- 

DROP FUNCTION IF EXISTS `order_remarks`;
DELIMITER |
CREATE FUNCTION `order_remarks`(quantityOrdered int
) RETURNS varchar(50) CHARSET utf8mb4
BEGIN
	DECLARE order_remarks VARCHAR(50);  
    IF quantityOrdered > 40 THEN  
        SET order_remarks = 'Highly popular';  
    ELSEIF (quantityOrdered <= 26 AND   
            quantityOrdered >= 38) THEN  
        SET order_remarks = 'Popular';  
    ELSEIF quantityOrdered < 25 THEN  
        SET order_remarks = 'Not so popular';  
    END IF;  
    -- return the order remarks  
    RETURN (order_remarks);  

RETURN 1;
END |
DELIMITER ;

-- 
-- Dumping procedures
-- 

DROP PROCEDURE IF EXISTS `customerNumber_list`;
DELIMITER |
CREATE PROCEDURE `customerNumber_list`()
BEGIN
SELECT customerNumber FROM orders;
END |
DELIMITER ;

-- 
-- Dumping views
-- 

DROP TABLE IF EXISTS `customer_view`;
DROP VIEW IF EXISTS `customer_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `customer_view` AS select `customers`.`contactFirstName` AS `contactFirstName`,`customers`.`contactLastName` AS `contactLastName`,`customers`.`creditLimit` AS `creditLimit` from `customers`;

DROP TABLE IF EXISTS `office_view`;
DROP VIEW IF EXISTS `office_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `office_view` AS select `orders`.`orderNumber` AS `orderNumber`,`orders`.`status` AS `status`,`orders`.`comments` AS `comments` from `orders`;

DROP TABLE IF EXISTS `product_view`;
DROP VIEW IF EXISTS `product_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `product_view` AS select `products`.`productName` AS `productName`,`products`.`productLine` AS `productLine`,`products`.`productDescription` AS `productDescription`,`products`.`quantityInStock` AS `quantityInStock` from `products`;


-- 
-- Dumping triggers
-- 

DROP TRIGGER /*!50030 IF EXISTS */ `customers_AFTER_INSERT`;
DELIMITER |
CREATE TRIGGER `sampledb`.`customers_AFTER_INSERT` 
AFTER INSERT 
ON `customers` FOR EACH ROW
BEGIN
	IF NEW.state IS NULL THEN
		INSERT INTO reminders(customerNumber, message)
        VALUES (CONCAT('Hi', NEW.contactFirstName, ', please update your state.'));
        /* the purpose of this trigger is to be reminded to update their information on the involved field. */
        END IF;
END |
DELIMITER ;

DROP TRIGGER /*!50030 IF EXISTS */ `offices_BEFORE_DELETE`;
DELIMITER |
CREATE TRIGGER `sampledb`.`offices_BEFORE_DELETE` 
BEFORE DELETE 
ON `offices` FOR EACH ROW
BEGIN
	INSERT INTO officearchive (officeCode, country)
VALUES (OLD.officeCode, OLD.country);
/* this trigger shows the deleted involved fields are listed in the table named 'officearchive'*/
END |
DELIMITER ;

DROP TRIGGER /*!50030 IF EXISTS */ `products_AFTER_UPDATE`;
DELIMITER |
CREATE TRIGGER `sampledb`.`products_AFTER_UPDATE` 
AFTER UPDATE 
ON `products` FOR EACH ROW
BEGIN
	IF OLD.quantityInStock <> new.quantityInStock THEN
    INSERT INTO productchanges(productCode,beforequantityInStock, afterquantityInStock)
        VALUES(old.productCode, old.quantityInStock, new.quantityInStock);
        /* this trigger shows the comparison of the total amount of the stock before and after update*/
    END IF;

END |
DELIMITER ;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


-- Dump completed on 2023-04-17 01:06:28
-- Total time: 0:0:0:0:404 (d:h:m:s:ms)
