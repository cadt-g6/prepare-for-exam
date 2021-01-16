-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2021 at 11:00 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel`
--

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `info_id` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `imageUrl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`info_id`, `id`, `imageUrl`) VALUES
('place_francearchitect', 1, 'https://thumbs.dreamstime.com/b/abandoned-christian-church-top-bokor-mountain-preah-monivong-national-park-kampot-cambodia-kep-71161752.jpg'),
('place_francearchitect', 2, 'https://thumbs.dreamstime.com/b/abandoned-christian-church-top-bokor-mountain-preah-monivong-national-park-kampot-cambodia-kep-71163269.jpg'),
('place_francearchitect', 3, 'https://www.jayakiri.com/uploads/images/GalleryThumbs/1105-9.jpg'),
('acc_bamboo_bugalow', 4, 'https://cf.bstatic.com/images/hotel/max1280x900/900/90042437.jpg'),
('acc_bamboo_bugalow', 5, 'https://cf.bstatic.com/images/hotel/max1024x768/127/127542740.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `pid` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`pid`, `name`, `thumbnail`) VALUES
('battambang', 'បាត់ដំបង', 'https://media-cdn.tripadvisor.com/media/photo-s/12/a9/33/0d/the-namesake-of-the-city.jpg'),
('keb', 'កែប', 'https://www.cpp.org.kh/wp-content/uploads/2019/02/36886-768x511.jpg'),
('kohkong', 'កោះកុង', 'https://www.tourismkhmer.com/wp-content/uploads/2019/04/koh-kong-province.jpg'),
('kompongsom', 'កំពងសោម', 'https://www.antourist.com/upload_images/images/11a.JPG'),
('kompot', 'កំពត', 'https://ohhcambodia.com/wp-content/uploads/2019/12/14048230529_d64d3631db_k.jpg'),
('siemreap', 'សៀមរាប', 'https://cdn.britannica.com/35/171035-050-8423095A/Angkor-Wat-Siemreab-Cambodia.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `province_infos`
--

CREATE TABLE `province_infos` (
  `info_id` varchar(255) NOT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category_type` varchar(25) DEFAULT NULL,
  `display_location` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `draft` tinyint(1) DEFAULT NULL,
  `paragraph` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `province_infos`
--

INSERT INTO `province_infos` (`info_id`, `pid`, `name`, `category_type`, `display_location`, `latitude`, `longitude`, `thumbnail`, `draft`, `paragraph`) VALUES
('acc_bamboo_bugalow', 'kompot', 'បឹងកាឡូឬស្សី - Bamboo Bungalow', 'accommodation', '៣គីឡូមែត្រ ពីរង្វង់មូលទុរេន', 85.93932, 120.93938, 'https://cf.bstatic.com/images/hotel/max1024x768/127/127542740.jpg', 0, 'បឹងកាឡូ ឫស្សី ឬក៏គេច្រើនហៅថា Bamboo Bungalow មានទីតាំងស្ថិតនៅ ភូមិអូរតូច សង្កាត់អណ្ដូងខ្មែរ ក្រុងកំពត ខេត្តកំពត និងមានចម្ងាយប្រហែល ~3km ពីរង្វង់មូល​ធូរេន។'),
('acc_eden', 'kompot', 'Eden ភូមិអេកូ', 'accommodation', 'ជាប់មាត់ព្រែកកំពត', 85.93932, 120.93938, 'https://firebasestorage.googleapis.com/v0/b/romduoltravel.appspot.com/o/kompot%2Faccomodations%2Feden-eco-village.jpg?alt=media&token=561925b0-444e-4467-96b8-7a5eed802052', 0, 'ស្ថិតនៅចំងាយ4គ.មពីទីរួមខេត្តកំពតផ្ទះសំណាក់ហ្គេសហាកំពតអេកូផ្តល់ជូនភ្ញៀវនូវកន្លែងស្នាក់នៅសាមញ្ញនិងមានតំលៃសមរម្យ។កន្លែងចតរថយន្តឥតគិតថ្លៃត្រូវបានផ្តល់ជូនដល់អ្នកដែលបើកឡាននិងបើកវ៉ាយហ្វាយឥតគិតថ្លៃអាចរកបាននៅនឹងកន្លែង។បន្ទប់ត្រូវបានបំពាក់ដោយគ្រឿងបរិក្ខារមូលដ្ឋានរួមមានពូកមុងមុងនិងកង្ហារ។សម្ភារៈបន្ទប់ទឹកត្រូវបានចែករំលែក។បុគ្គលិកអាចរៀបចំឱ្យអ្នករីករាយនឹងសកម្មភាពក្រៅផ្សេងៗគ្នាដូចជាការនេសាទជិះកង់និងទូកកាណូ។ផ្ទះសំណាក់ហ្គេសសាកំពតអេកូអេកក៏មានកន្លែងបោកគក់ផងដែរ។ទាំងអាហារក្នុងស្រុកនិងអន្តរជាតិនឹងត្រូវបានបម្រើនៅភោជនីយដ្ឋានពីនឹងកន្លែង។ស្រាបៀរក្នុងស្រុកនិងជម្រើសស្រាដ៍រីករាយនៅបារ៍។'),
('acc_genesha', 'kompot', 'Ganesha ផ្ទះសំណាក់អេកូ', 'accommodation', 'ជាប់មាត់ព្រែកកំពត', 85.93932, 120.93938, 'https://firebasestorage.googleapis.com/v0/b/romduoltravel.appspot.com/o/kompot%2Faccomodations%2Fgenesha.webp?alt=media&token=a19d2e78-7551-43b1-bafb-5b9df9e0e145', 0, ''),
('act_biking', 'kompot', 'ជិះកង់មើលទេសភាពនៅក្នុងតំបន់ទេសចរណ៍', 'activity', '៤គីឡូម៉ែត្រពីក្រុងកំពត', 85.93932, 120.93938, 'https://www.cambotours.com/userfiles/thumbs/kampot-bike-to-the-backroads-tour.jpg', 0, 'បង្វែរអារម្មណ៍ពីការជិះឡានម៉ូតូនៅទីក្រុងមកជាការជិះកង់កំសាន្តមើលទេសភាពធម្មជាតិដ៏ខៀវស្រងាត់និងស្រូបខ្យល់អាកាសបរិសុទ្ធនៅកំពត។តើអ្នកដឹងទេថាការជិះកង់គឺពិតជាអស្ចារ្យនិងជាមធ្យោបាយបែបអេកូហ្រ្វេនលីដើម្បីទទួលបទពិសោធន៍ពីខេត្តកំពត។ដំណើរកម្សាន្តជិះកង់ដ៏ស្ងប់ស្ងាត់តាមដងទន្លេនេះអាចឱ្យអ្នករីករាយនឹងកំពតប្រកបដោយភាពសុខសាន្តបំផុតនិងអាចស្វែងយល់ពីការរស់នៅជុំវិញធម្មជាតិនិងកន្លែងរស់នៅក្នុងតំបន់ផងដែរ។'),
('place_francearchitect', 'kompot', 'ឧទ្យានជាតិបូកគោ', 'place', '៤គីឡូម៉ែត្រពីក្រុងកំពត', 85.93932, 120.93938, 'https://www.jayakiri.com/uploads/images/GalleryThumbs/1105-9.jpg', 0, 'ឧទ្យានជាតិព្រះមុនីវង្សភ្នំបូកគោឬឧទ្យានជាតិភ្នំបូកគោមានទីតាំងស្ថិតនៅក្នុងស្រុកទឹកឈូខេត្តកំពត។ ភ្នំបូកគោមានកម្ពស់ ១០៧៥ម៉ែត្រធៀបទៅនឹងនីវ៉ូទឹកសមុទ្រនិងមានចម្ងាយប្រមាណ ១១គីឡូម៉ែត្រពីក្រុងកំពតទៅកាន់ជើងភ្នំនិងចម្ងាយ ៣២គីឡូម៉ែត្រពីជើងភ្នំដល់កំពូលភ្នំ។ ភ្នំបូកគោត្រូវបានរកឃើញនៅឆ្នាំ១៩១៧ ដោយជនជាតិបារាំងនិងត្រូវបានអភិវឌ្ឍឲ្យទៅជារមណីយដ្ឋាននៅឆ្នាំ១៩២១ ក្នុងរជ្ជកាលព្រះបាទស៊ីសុវត្ថិ។'),
('place_popokvil', 'kompot', 'ឧទ្យានជាតិបូកគោ', 'place', '៤គីឡូម៉ែត្រពីក្រុងកំពត', 85.93932, 120.93938, 'https://media-cdn.tripadvisor.com/media/photo-b/768x250/0d/fa/4b/cc/popokvil-waterfall.jpg', 0, 'ទឹកជ្រោះពពកវិលស្ថិតនៅលើភ្នំបូកគោដែលជាទិសដៅពេញនិយមសម្រាប់ភ្ញៀវទេសចរក្នុងខេត្តកំពតដោយសារអាកាសធាតុត្រជាក់និងភ្នំដែលមានទេសភាពដ៏ស្រស់ស្អាត។ វាពិតជារីករាយណាស់ក្នុងការធ្វើដំណើរទៅកាន់ទីនោះ មិនត្រឹមតែប៉ុណ្ណោះ អ្នកក៏អាចមើលឃើញពីជីវិតសត្វព្រៃគួរឱ្យចាប់អារម្មណ៍មួយចំនួនដូចជាសត្វកំប្រុកក្រហមឬសត្វស្វា។ ទោះបីពេលមកដល់ទឹកជ្រោះអាចនឹងមានការលំបាកបន្តិចប៉ុន្តែនៅពេលដែលអ្នកបានឃើញដោយផ្ទាល់នូវសម្រស់ធម្មជាតិនៃទឹកធ្លាក់បន្ទាប់មកអ្នកប្រាកដជាដឹងច្បាស់ហើយថាវាពិតជាសក្តិសមនឹងការខិតខំរបស់អ្នក។'),
('place_prekjak', 'kompot', 'ឧទ្យានព្រែកចាក', 'place', '៤គីឡូម៉ែត្រពីក្រុងកំពត', 85.93932, 120.93938, 'https://1.bp.blogspot.com/-seJMr155SUA/XJ3PWe8wEMI/AAAAAAAABEo/mq4vdsocuYQXrAMkuvtg2sx-ZIEEKb0swCLcBGAs/s1600/%25E1%259E%2585%25E1%259E%25B6%25E1%259E%2580%25E1%259F%25A1.jpg', 0, ''),
('place_riverpark', 'kompot', 'ឧទ្យានដងព្រែក', 'place', '៤គីឡូម៉ែត្រពីក្រុងកំពត', 85.93932, 120.93938, 'https://3.bp.blogspot.com/-e8a7IfbXpu0/WxiZjMQCuqI/AAAAAAAAANM/IQ7-ZkAj11walpG-BBfRMR9x65q7qwAAQCLcBGAs/w1200-h630-p-k-no-nu/dong%2Bte.jpg', 0, 'testing riverpack'),
('place_roundedturen', 'kompot', 'រង្វង់មូលធុរេន', 'place', '៤គីឡូម៉ែត្រពីក្រុងកំពត', 85.93932, 120.93938, 'https://www.gocambodia.tours/wp-content/uploads/2018/11/Things-to-Do-See-in-Kampot-Kampot-Travel-Guide-cambodia-tours.jpg', 0, 'testing'),
('place_sampovprampagoda', 'kompot', 'វត្តសំពៅប្រាំ', 'place', '៤គីឡូម៉ែត្រពីក្រុងកំពត', 85.93932, 120.93938, 'https://4.bp.blogspot.com/-zIdJwDbk7eM/U5lfL3PSAZI/AAAAAAAACXU/nH6S9vcog_4/s1600/WAT+SAMPHOV+5.jpg', 0, 'វត្តសំពៅប្រាំដែលត្រូវបានគេចាត់ទុកថាជាវត្តព្រះពុទ្ធខ្ពស់ជាងគេនៅកម្ពុជាគឺជាទីកន្លែងបែបសាសនាដ៏មានភាពទាក់ទាញ។ ឈ្មោះវត្តសំពៅប្រាំនេះមានន័យថាប្រាសាទទូកប្រាំដែលជាឯកសារយោងសម្រាប់ទ្រង់ទ្រាយថ្មធំនិងរាបស្មើនៅក្បែរនោះមានបណ្តោយ ១០ ម៉ែត្រគុណនឹង ១០ ម៉ែត្រទ្រង់ទ្រាយធម្មជាតិទាំងនេះបង្ហាញពីរូបភាពនៃទូកដែលដាក់ឈ្មោះវត្តនោះ។'),
('res_epicartcafe', 'kompot', 'Epic Arts Cafe', 'restaurant', 'កំពង់កណ្ដាល, កំពត', 85.93932, 120.93938, 'https://www.madmonkeyhostels.com/wp-content/uploads/2017/06/Epic-Arts-Cafe-copy.jpg', 0, 'បានបង្កើតឡើងក្នុងឆ្នាំ2006កាហ្វេរបស់យើងគឺជាកន្លែងធ្វើការដែលមានបម្រើអាហារពេលព្រឹកដ៏អស្ចារ្យនិងអាហារថ្ងៃត្រង់ដែលមានរសជាតិឈ្ងុយឆ្ងាញ់។');

-- --------------------------------------------------------

--
-- Table structure for table `recommends`
--

CREATE TABLE `recommends` (
  `uid` varchar(255) DEFAULT NULL,
  `info_id` varchar(50) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `comment` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recommends`
--

INSERT INTO `recommends` (`uid`, `info_id`, `date`, `rate`, `comment`) VALUES
('49mxWNZqkcfmftQybPAEsMqGV9A2', 'place_francearchitect', '2020-01-01 10:10:10', 5, 'That good!'),
('LlxbgPduqoc45W6pCAZED4sbGGW2', 'place_francearchitect', '2020-01-01 10:10:10', 3, 'Great place to visit'),
('ON07b9cfCIaynav9tMxX16K2yWG3', 'place_francearchitect', '2020-01-01 10:10:10', 4, 'I wish I can go there again'),
('XBFYTKcJf2MovRateghZVsY0uYk2', 'acc_bamboo_bugalow', '2020-01-01 10:10:10', 3, 'Good service'),
('XH7iwd95kjNunlLJmYypzf34Z5F3', 'acc_bamboo_bugalow', '2020-01-01 10:10:10', 4, 'I love people there!');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `profileUrl` varchar(255) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `email`, `lname`, `fname`, `is_admin`, `profileUrl`, `create_at`, `update_at`) VALUES
('49mxWNZqkcfmftQybPAEsMqGV9A2', 'sakee168@gmail.com', 'Sak', 'Kee', 0, 'https://pbs.twimg.com/media/Ea3jz_1WoAANHhD.png', '2020-01-01 10:10:10', NULL),
('LlxbgPduqoc45W6pCAZED4sbGGW2', 'theasok168@gmail.com', 'Thea', 'Sok', 0, 'https://www.cpp.org.kh/wp-content/uploads/2019/02/36886-768x511.jpg', '2020-01-01 10:10:10', NULL),
('ON07b9cfCIaynav9tMxX16K2yWG3', 'sokchan@gmail.com', 'Sok', 'Chan', 0, 'https://www.antourist.com/upload_images/images/11a.JPG', '2020-01-01 10:10:10', NULL),
('XBFYTKcJf2MovRateghZVsY0uYk2', 'chanmey@gmail.com', 'Chan', 'Mey', 0, 'https://ohhcambodia.com/wp-content/uploads/2019/12/14048230529_d64d3631db_k.jpg', '2020-01-01 10:10:10', NULL),
('XH7iwd95kjNunlLJmYypzf34Z5F3', 'mey168@gmail.com', 'Mey', 'Moeun', 0, 'https://cdn.britannica.com/35/171035-050-8423095A/Angkor-Wat-Siemreab-Cambodia.jpg', '2020-01-01 10:10:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `viewers`
--

CREATE TABLE `viewers` (
  `uid` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `viewers`
--

INSERT INTO `viewers` (`uid`, `pid`, `date`) VALUES
('49mxWNZqkcfmftQybPAEsMqGV9A2', 'kohkong', '2020-01-01 10:10:10'),
('LlxbgPduqoc45W6pCAZED4sbGGW2', 'kohkong', '2020-01-01 10:10:10'),
('XBFYTKcJf2MovRateghZVsY0uYk2', 'kohkong', '2020-01-01 10:10:10'),
('ON07b9cfCIaynav9tMxX16K2yWG3', 'kohkong', '2020-01-01 10:10:10'),
('49mxWNZqkcfmftQybPAEsMqGV9A2', 'keb', '2020-01-01 10:13:10'),
('LlxbgPduqoc45W6pCAZED4sbGGW2', 'keb', '2020-01-01 10:13:10'),
('XBFYTKcJf2MovRateghZVsY0uYk2', 'keb', '2020-01-01 10:13:10'),
('ON07b9cfCIaynav9tMxX16K2yWG3', 'keb', '2020-01-01 10:13:10'),
('XH7iwd95kjNunlLJmYypzf34Z5F3', 'keb', '2020-01-01 10:13:10'),
('49mxWNZqkcfmftQybPAEsMqGV9A2', 'kompongsom', '2020-01-01 11:13:10'),
('LlxbgPduqoc45W6pCAZED4sbGGW2', 'kompongsom', '2020-01-01 11:13:10'),
('XBFYTKcJf2MovRateghZVsY0uYk2', 'kompongsom', '2020-01-01 11:13:10'),
('LlxbgPduqoc45W6pCAZED4sbGGW2', 'kompongsom', '2020-01-01 11:13:10'),
('XH7iwd95kjNunlLJmYypzf34Z5F3', 'kompongsom', '2020-01-01 11:13:10'),
('49mxWNZqkcfmftQybPAEsMqGV9A2', 'siemreap', '2020-01-01 12:15:10'),
('LlxbgPduqoc45W6pCAZED4sbGGW2', 'siemreap', '2020-01-01 12:15:10'),
('XBFYTKcJf2MovRateghZVsY0uYk2', 'siemreap', '2020-01-01 12:15:10'),
('XH7iwd95kjNunlLJmYypzf34Z5F3', 'siemreap', '2020-01-01 12:15:10'),
('49mxWNZqkcfmftQybPAEsMqGV9A2', 'battambang', '2020-01-01 19:16:10'),
('XH7iwd95kjNunlLJmYypzf34Z5F3', 'battambang', '2020-01-01 19:16:10'),
('LlxbgPduqoc45W6pCAZED4sbGGW2', 'battambang', '2020-01-01 19:16:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `info_id` (`info_id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `province_infos`
--
ALTER TABLE `province_infos`
  ADD PRIMARY KEY (`info_id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `recommends`
--
ALTER TABLE `recommends`
  ADD KEY `uid` (`uid`),
  ADD KEY `info_id` (`info_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `viewers`
--
ALTER TABLE `viewers`
  ADD KEY `uid` (`uid`),
  ADD KEY `pid` (`pid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`info_id`) REFERENCES `province_infos` (`info_id`);

--
-- Constraints for table `province_infos`
--
ALTER TABLE `province_infos`
  ADD CONSTRAINT `province_infos_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `provinces` (`pid`);

--
-- Constraints for table `recommends`
--
ALTER TABLE `recommends`
  ADD CONSTRAINT `recommends_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`),
  ADD CONSTRAINT `recommends_ibfk_2` FOREIGN KEY (`info_id`) REFERENCES `province_infos` (`info_id`);

--
-- Constraints for table `viewers`
--
ALTER TABLE `viewers`
  ADD CONSTRAINT `viewers_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`),
  ADD CONSTRAINT `viewers_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `provinces` (`pid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;