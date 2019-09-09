-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 14, 2019 at 07:40 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

DROP TABLE IF EXISTS `tbl_admin`;
CREATE TABLE IF NOT EXISTS `tbl_admin` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(255) NOT NULL,
  `adminUser` varchar(255) NOT NULL,
  `adminEmail` varchar(255) NOT NULL,
  `adminPass` varchar(32) NOT NULL,
  `level` tinyint(4) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`adminId`, `adminName`, `adminUser`, `adminEmail`, `adminPass`, `level`) VALUES
(1, 'Mahmudul Hassan', 'admin', 'admin@gmail.com', '202cb962ac59075b964b07152d234b70', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

DROP TABLE IF EXISTS `tbl_brand`;
CREATE TABLE IF NOT EXISTS `tbl_brand` (
  `brandId` int(11) NOT NULL AUTO_INCREMENT,
  `brandName` varchar(255) NOT NULL,
  PRIMARY KEY (`brandId`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_brand`
--

INSERT INTO `tbl_brand` (`brandId`, `brandName`) VALUES
(1, 'Acer'),
(2, 'Samsung'),
(3, 'Canon'),
(4, 'iPhone');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

DROP TABLE IF EXISTS `tbl_cart`;
CREATE TABLE IF NOT EXISTS `tbl_cart` (
  `cartId` int(11) NOT NULL AUTO_INCREMENT,
  `sId` varchar(255) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`cartId`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE IF NOT EXISTS `tbl_category` (
  `catId` int(11) NOT NULL AUTO_INCREMENT,
  `catName` varchar(255) NOT NULL,
  PRIMARY KEY (`catId`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`catId`, `catName`) VALUES
(1, 'Mobile Phones'),
(2, 'Desktop'),
(3, 'Laptop'),
(4, 'Accessories'),
(5, 'Software'),
(6, 'Sports &amp; Fitness'),
(7, 'Footwear'),
(8, 'Jewellery'),
(9, 'Clothing'),
(10, 'Home Decor &amp; Kitchen'),
(11, 'Beauty &amp; Healthcare'),
(12, 'Toys, Kids &amp; Babies'),
(14, 'Camera');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_compare`
--

DROP TABLE IF EXISTS `tbl_compare`;
CREATE TABLE IF NOT EXISTS `tbl_compare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmrId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_compare`
--

INSERT INTO `tbl_compare` (`id`, `cmrId`, `productId`, `productName`, `price`, `image`) VALUES
(6, 1, 10, 'Lorem Ipsum is simply', 621.75, 'uploads/083244e845.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

DROP TABLE IF EXISTS `tbl_customer`;
CREATE TABLE IF NOT EXISTS `tbl_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `zip` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`id`, `name`, `address`, `city`, `country`, `zip`, `phone`, `email`, `pass`) VALUES
(1, 'Mahmudul Hassan', 'A-R Tower, Banani', 'Dhaka', 'Bangladesh', '1213', '01686869921', 'mahmudul@gmail.com', '202cb962ac59075b964b07152d234b70'),
(2, 'Amir Khan', 'Stadium road, Dhanmondi', 'Dhaka', 'Bangladesh', '1216', '01797343692', 'amir@gmail.com', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE IF NOT EXISTS `tbl_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmrId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `cmrId`, `productId`, `productName`, `quantity`, `price`, `image`, `date`, `status`) VALUES
(31, 1, 11, 'Lorem Ipsum is simply', 3, 1373.64, 'uploads/6c3f8772e3.jpg', '2019-01-02 21:01:40', 0),
(30, 1, 10, 'Lorem Ipsum is simply', 1, 621.75, 'uploads/083244e845.png', '2019-01-02 21:01:40', 0),
(27, 1, 13, 'Lorem Ipsum is simply', 2, 901.76, 'uploads/aef2dacf04.jpg', '2019-01-02 15:00:27', 2),
(28, 1, 10, 'Lorem Ipsum is simply', 2, 1243.50, 'uploads/083244e845.png', '2019-01-02 15:53:45', 2),
(29, 1, 13, 'Lorem Ipsum is simply', 2, 901.76, 'uploads/aef2dacf04.jpg', '2019-01-02 15:53:45', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

DROP TABLE IF EXISTS `tbl_product`;
CREATE TABLE IF NOT EXISTS `tbl_product` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(255) NOT NULL,
  `catId` int(11) NOT NULL,
  `brandId` int(11) NOT NULL,
  `body` text NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`productId`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`productId`, `productName`, `catId`, `brandId`, `body`, `price`, `image`, `type`) VALUES
(2, 'Lorem Ipsum is simply', 2, 1, '&lt;p&gt;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;Body text will go here.&amp;nbsp;&lt;/p&gt;', 403.66, 'uploads/1b9d41624c.jpg', 0),
(3, 'Lorem Ipsum is simply', 4, 2, '&lt;p&gt;Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here.&lt;/p&gt;\r\n&lt;p&gt;Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here.&lt;/p&gt;\r\n&lt;p&gt;Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here.&lt;/p&gt;\r\n&lt;p&gt;Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here.&lt;/p&gt;', 621.75, 'uploads/d882757aa8.jpg', 0),
(4, 'Lorem Ipsum is simply', 4, 3, '&lt;p&gt;Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here.&lt;/p&gt;\r\n&lt;p&gt;Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here.&lt;/p&gt;\r\n&lt;p&gt;Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here.&lt;/p&gt;\r\n&lt;p&gt;Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here.&lt;/p&gt;', 428.02, 'uploads/e5b878da94.jpg', 0),
(5, 'This is Lorem Ipsum is simply', 10, 2, '&lt;p&gt;this Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here.&lt;/p&gt;\r\n&lt;p&gt;Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here.&lt;/p&gt;\r\n&lt;p&gt;This Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here.&lt;/p&gt;\r\n&lt;p&gt;Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here. Body text will go here.&lt;/p&gt;', 450.88, 'uploads/057d12fd98.jpg', 0),
(6, 'Lorem Ipsum is simply', 12, 4, '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident ab, voluptatibus perferendis a ipsa distinctio voluptatum hic, ullam fugiat iure neque velit tenetur incidunt quidem officia quo. Molestiae ullam, quas enim officiis optio saepe ea expedita hic, odit vero vitae. Atque voluptates consequatur reprehenderit, sed ab laboriosam doloremque non quis explicabo! Eum sunt ullam, ea eius, illum impedit. Debitis, ad, amet! Assumenda animi voluptas iusto facere, at odit dolorum sint magni quos quod laudantium facilis nesciunt obcaecati ea consectetur sit nobis iure odio sunt itaque saepe. Error porro, ex repellat quibusdam quia, sit voluptas sint aliquid, excepturi voluptate perspiciatis velit.&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident ab, voluptatibus perferendis a ipsa distinctio voluptatum hic, ullam fugiat iure neque velit tenetur incidunt quidem officia quo. Molestiae ullam, quas enim officiis optio saepe ea expedita hic, odit vero vitae. Atque voluptates consequatur reprehenderit, sed ab laboriosam doloremque non quis explicabo! Eum sunt ullam, ea eius, illum impedit. Debitis, ad, amet! Assumenda animi voluptas iusto facere, at odit dolorum sint magni quos quod laudantium facilis nesciunt obcaecati ea consectetur sit nobis iure odio sunt itaque saepe. Error porro, ex repellat quibusdam quia, sit voluptas sint aliquid, excepturi voluptate perspiciatis velit.&lt;/p&gt;', 621.75, 'uploads/3fdfdd751e.jpg', 0),
(7, 'Lorem Ipsum is simply', 14, 3, '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident ab, voluptatibus perferendis a ipsa distinctio voluptatum hic, ullam fugiat iure neque velit tenetur incidunt quidem officia quo. Molestiae ullam, quas enim officiis optio saepe ea expedita hic, odit vero vitae. Atque voluptates consequatur reprehenderit, sed ab laboriosam doloremque non quis explicabo! Eum sunt ullam, ea eius, illum impedit. Debitis, ad, amet! Assumenda animi voluptas iusto facere, at odit dolorum sint magni quos quod laudantium facilis nesciunt obcaecati ea consectetur sit nobis iure odio sunt itaque saepe. Error porro, ex repellat quibusdam quia, sit voluptas sint aliquid, excepturi voluptate perspiciatis velit.&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident ab, voluptatibus perferendis a ipsa distinctio voluptatum hic, ullam fugiat iure neque velit tenetur incidunt quidem officia quo. Molestiae ullam, quas enim officiis optio saepe ea expedita hic, odit vero vitae. Atque voluptates consequatur reprehenderit, sed ab laboriosam doloremque non quis explicabo! Eum sunt ullam, ea eius, illum impedit. Debitis, ad, amet! Assumenda animi voluptas iusto facere, at odit dolorum sint magni quos quod laudantium facilis nesciunt obcaecati ea consectetur sit nobis iure odio sunt itaque saepe. Error porro, ex repellat quibusdam quia, sit voluptas sint aliquid, excepturi voluptate perspiciatis velit.&lt;/p&gt;', 428.02, 'uploads/5c12a9b5a5.png', 1),
(8, 'Lorem Ipsum is simply', 10, 2, '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident ab, voluptatibus perferendis a ipsa distinctio voluptatum hic, ullam fugiat iure neque velit tenetur incidunt quidem officia quo. Molestiae ullam, quas enim officiis optio saepe ea expedita hic, odit vero vitae. Atque voluptates consequatur reprehenderit, sed ab laboriosam doloremque non quis explicabo! Eum sunt ullam, ea eius, illum impedit. Debitis, ad, amet! Assumenda animi voluptas iusto facere, at odit dolorum sint magni quos quod laudantium facilis nesciunt obcaecati ea consectetur sit nobis iure odio sunt itaque saepe. Error porro, ex repellat quibusdam quia, sit voluptas sint aliquid, excepturi voluptate perspiciatis velit.&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident ab, voluptatibus perferendis a ipsa distinctio voluptatum hic, ullam fugiat iure neque velit tenetur incidunt quidem officia quo. Molestiae ullam, quas enim officiis optio saepe ea expedita hic, odit vero vitae. Atque voluptates consequatur reprehenderit, sed ab laboriosam doloremque non quis explicabo! Eum sunt ullam, ea eius, illum impedit. Debitis, ad, amet! Assumenda animi voluptas iusto facere, at odit dolorum sint magni quos quod laudantium facilis nesciunt obcaecati ea consectetur sit nobis iure odio sunt itaque saepe. Error porro, ex repellat quibusdam quia, sit voluptas sint aliquid, excepturi voluptate perspiciatis velit.&lt;/p&gt;', 450.88, 'uploads/dd93144e9b.jpg', 0),
(9, 'Lorem Ipsum is simply', 4, 1, '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident ab, voluptatibus perferendis a ipsa distinctio voluptatum hic, ullam fugiat iure neque velit tenetur incidunt quidem officia quo. Molestiae ullam, quas enim officiis optio saepe ea expedita hic, odit vero vitae. Atque voluptates consequatur reprehenderit, sed ab laboriosam doloremque non quis explicabo! Eum sunt ullam, ea eius, illum impedit. Debitis, ad, amet! Assumenda animi voluptas iusto facere, at odit dolorum sint magni quos quod laudantium facilis nesciunt obcaecati ea consectetur sit nobis iure odio sunt itaque saepe. Error porro, ex repellat quibusdam quia, sit voluptas sint aliquid, excepturi voluptate perspiciatis velit.&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident ab, voluptatibus perferendis a ipsa distinctio voluptatum hic, ullam fugiat iure neque velit tenetur incidunt quidem officia quo. Molestiae ullam, quas enim officiis optio saepe ea expedita hic, odit vero vitae. Atque voluptates consequatur reprehenderit, sed ab laboriosam doloremque non quis explicabo! Eum sunt ullam, ea eius, illum impedit. Debitis, ad, amet! Assumenda animi voluptas iusto facere, at odit dolorum sint magni quos quod laudantium facilis nesciunt obcaecati ea consectetur sit nobis iure odio sunt itaque saepe. Error porro, ex repellat quibusdam quia, sit voluptas sint aliquid, excepturi voluptate perspiciatis velit.&lt;/p&gt;', 403.66, 'uploads/7c76ae73e9.jpg', 0),
(10, 'Lorem Ipsum is simply', 1, 4, '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident ab, voluptatibus perferendis a ipsa distinctio voluptatum hic, ullam fugiat iure neque velit tenetur incidunt quidem officia quo. Molestiae ullam, quas enim officiis optio saepe ea expedita hic, odit vero vitae. Atque voluptates consequatur reprehenderit, sed ab laboriosam doloremque non quis explicabo! Eum sunt ullam, ea eius, illum impedit. Debitis, ad, amet! Assumenda animi voluptas iusto facere, at odit dolorum sint magni quos quod laudantium facilis nesciunt obcaecati ea consectetur sit nobis iure odio sunt itaque saepe. Error porro, ex repellat quibusdam quia, sit voluptas sint aliquid, excepturi voluptate perspiciatis velit.&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident ab, voluptatibus perferendis a ipsa distinctio voluptatum hic, ullam fugiat iure neque velit tenetur incidunt quidem officia quo. Molestiae ullam, quas enim officiis optio saepe ea expedita hic, odit vero vitae. Atque voluptates consequatur reprehenderit, sed ab laboriosam doloremque non quis explicabo! Eum sunt ullam, ea eius, illum impedit. Debitis, ad, amet! Assumenda animi voluptas iusto facere, at odit dolorum sint magni quos quod laudantium facilis nesciunt obcaecati ea consectetur sit nobis iure odio sunt itaque saepe. Error porro, ex repellat quibusdam quia, sit voluptas sint aliquid, excepturi voluptate perspiciatis velit.&lt;/p&gt;', 621.75, 'uploads/083244e845.png', 0),
(11, 'Lorem Ipsum is simply', 7, 3, '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident ab, voluptatibus perferendis a ipsa distinctio voluptatum hic, ullam fugiat iure neque velit tenetur incidunt quidem officia quo. Molestiae ullam, quas enim officiis optio saepe ea expedita hic, odit vero vitae. Atque voluptates consequatur reprehenderit, sed ab laboriosam doloremque non quis explicabo! Eum sunt ullam, ea eius, illum impedit. Debitis, ad, amet! Assumenda animi voluptas iusto facere, at odit dolorum sint magni quos quod laudantium facilis nesciunt obcaecati ea consectetur sit nobis iure odio sunt itaque saepe. Error porro, ex repellat quibusdam quia, sit voluptas sint aliquid, excepturi voluptate perspiciatis velit.&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident ab, voluptatibus perferendis a ipsa distinctio voluptatum hic, ullam fugiat iure neque velit tenetur incidunt quidem officia quo. Molestiae ullam, quas enim officiis optio saepe ea expedita hic, odit vero vitae. Atque voluptates consequatur reprehenderit, sed ab laboriosam doloremque non quis explicabo! Eum sunt ullam, ea eius, illum impedit. Debitis, ad, amet! Assumenda animi voluptas iusto facere, at odit dolorum sint magni quos quod laudantium facilis nesciunt obcaecati ea consectetur sit nobis iure odio sunt itaque saepe. Error porro, ex repellat quibusdam quia, sit voluptas sint aliquid, excepturi voluptate perspiciatis velit.&lt;/p&gt;', 457.88, 'uploads/6c3f8772e3.jpg', 0),
(12, 'Lorem Ipsum is simply', 6, 2, '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident ab, voluptatibus perferendis a ipsa distinctio voluptatum hic, ullam fugiat iure neque velit tenetur incidunt quidem officia quo. Molestiae ullam, quas enim officiis optio saepe ea expedita hic, odit vero vitae. Atque voluptates consequatur reprehenderit, sed ab laboriosam doloremque non quis explicabo! Eum sunt ullam, ea eius, illum impedit. Debitis, ad, amet! Assumenda animi voluptas iusto facere, at odit dolorum sint magni quos quod laudantium facilis nesciunt obcaecati ea consectetur sit nobis iure odio sunt itaque saepe. Error porro, ex repellat quibusdam quia, sit voluptas sint aliquid, excepturi voluptate perspiciatis velit.&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident ab, voluptatibus perferendis a ipsa distinctio voluptatum hic, ullam fugiat iure neque velit tenetur incidunt quidem officia quo. Molestiae ullam, quas enim officiis optio saepe ea expedita hic, odit vero vitae. Atque voluptates consequatur reprehenderit, sed ab laboriosam doloremque non quis explicabo! Eum sunt ullam, ea eius, illum impedit. Debitis, ad, amet! Assumenda animi voluptas iusto facere, at odit dolorum sint magni quos quod laudantium facilis nesciunt obcaecati ea consectetur sit nobis iure odio sunt itaque saepe. Error porro, ex repellat quibusdam quia, sit voluptas sint aliquid, excepturi voluptate perspiciatis velit.&lt;/p&gt;', 457.88, 'uploads/fb875aea5f.jpg', 1),
(13, 'Lorem Ipsum is simply', 5, 1, '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident ab, voluptatibus perferendis a ipsa distinctio voluptatum hic, ullam fugiat iure neque velit tenetur incidunt quidem officia quo. Molestiae ullam, quas enim officiis optio saepe ea expedita hic, odit vero vitae. Atque voluptates consequatur reprehenderit, sed ab laboriosam doloremque non quis explicabo! Eum sunt ullam, ea eius, illum impedit. Debitis, ad, amet! Assumenda animi voluptas iusto facere, at odit dolorum sint magni quos quod laudantium facilis nesciunt obcaecati ea consectetur sit nobis iure odio sunt itaque saepe. Error porro, ex repellat quibusdam quia, sit voluptas sint aliquid, excepturi voluptate perspiciatis velit.&lt;/p&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident ab, voluptatibus perferendis a ipsa distinctio voluptatum hic, ullam fugiat iure neque velit tenetur incidunt quidem officia quo. Molestiae ullam, quas enim officiis optio saepe ea expedita hic, odit vero vitae. Atque voluptates consequatur reprehenderit, sed ab laboriosam doloremque non quis explicabo! Eum sunt ullam, ea eius, illum impedit. Debitis, ad, amet! Assumenda animi voluptas iusto facere, at odit dolorum sint magni quos quod laudantium facilis nesciunt obcaecati ea consectetur sit nobis iure odio sunt itaque saepe. Error porro, ex repellat quibusdam quia, sit voluptas sint aliquid, excepturi voluptate perspiciatis velit.&lt;/p&gt;', 450.88, 'uploads/aef2dacf04.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wlist`
--

DROP TABLE IF EXISTS `tbl_wlist`;
CREATE TABLE IF NOT EXISTS `tbl_wlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmrId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
