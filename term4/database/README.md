# 1. At least 6 entities
provinces
users
viewers
province_infos
images
recommends

# 2. ER Diagram in MySql Workbench
![Travel Site](https://user-images.githubusercontent.com/29684683/103800168-a3415000-507e-11eb-9dcd-cfe67d51f34a.png)

# 3. Create database schema in MySql Server
```sql
CREATE SCHEMA IF NOT EXISTS `travel` DEFAULT CHARACTER SET utf8 ;
USE `travel` ;

-- TABLE `provinces`;
CREATE TABLE `provinces` (
  `pid` varchar(255) PRIMARY KEY,
  `name` varchar(255),
  `thumbnail` varchar(255)
);

-- TABLE `province_infos`;
CREATE TABLE `province_infos` (
  `info_id` varchar(255) PRIMARY KEY,
  `pid` varchar(255),
  `name` varchar(255),
  `paragraph` varchar(2000),
  `category_type` varchar(25),
  `display_location` varchar(255),
  `latitude` double,
  `longitude` double,
  `thumbnail` varchar(255),
  `draft` bool,
  FOREIGN KEY (`pid`) REFERENCES `provinces` (`pid`)
);

-- TABLE `images`;
CREATE TABLE `images` (
  `info_id` varchar(255),
  `id` int AUTO_INCREMENT PRIMARY KEY,
  `imageUrl` varchar(255),
  FOREIGN KEY (`info_id`) REFERENCES `province_infos` (`info_id`)
);

-- TABLE `recommends`;
CREATE TABLE `recommends` (
  `uid` varchar(255),
  `info_id` varchar(255),
  `date` datetime,
  `rate` double,
  `comment` varcar(50),
  FOREIGN KEY (`uid`) REFERENCES `users` (`uid`),
  FOREIGN KEY (`info_id`) REFERENCES `province_infos` (`info_id`)
);

-- TABLE `viewers`;
CREATE TABLE `viewers` (
  `uid` varchar(255),
  `pid` varchar(255),
  `date` datetime,
  FOREIGN KEY (`uid`) REFERENCES `users` (`uid`),
  FOREIGN KEY (`pid`) REFERENCES `provinces` (`pid`)
);

-- TABLE `users`;
CREATE TABLE `users` (
  `uid` varchar(255) PRIMARY KEY,
  `email` varchar(255),
  `lname` varchar(255),
  `fname` varchar(255),
  `is_admin` bool,
  `profileUrl` varchar(255),
  `create_at` datetime,
  `update_at` datetime
);
```
# 4. Example of data (insert data at least 5 rows into each table)
### provinces
```sql
INSERT INTO `provinces` (`pid`, `name`, `thumbnail`)
VALUES 
("kohkong", "កោះកុង", "https://www.tourismkhmer.com/wp-content/uploads/2019/04/koh-kong-province.jpg"),
("keb", "កែប", "https://www.cpp.org.kh/wp-content/uploads/2019/02/36886-768x511.jpg"),
("kompongsom", "កំពងសោម", "https://www.antourist.com/upload_images/images/11a.JPG"),
("kompot", "កំពត", "https://ohhcambodia.com/wp-content/uploads/2019/12/14048230529_d64d3631db_k.jpg"),
("siemreap", "សៀមរាប", "https://cdn.britannica.com/35/171035-050-8423095A/Angkor-Wat-Siemreab-Cambodia.jpg"),
("battambang", "បាត់ដំបង", "https://media-cdn.tripadvisor.com/media/photo-s/12/a9/33/0d/the-namesake-of-the-city.jpg");
```

### province_infos
```sql
-- category_type enum(place, accommodation, restaurant,activity)
INSERT INTO `province_infos` (`info_id`, `pid`, `name`, `category_type`, `display_location`, `latitude`, `longitude`, `thumbnail`, `draft`, `paragraph`)
VALUES 
("place_francearchitect", "kompot", "place", "៤គីឡូម៉ែត្រពីក្រុងកំពត", "85.93932", "120.93938", "https://www.jayakiri.com/uploads/images/GalleryThumbs/1105-9.jpg", 0, "ឧទ្យានជាតិបូកគោ",  "ឧទ្យានជាតិព្រះមុនីវង្សភ្នំបូកគោឬឧទ្យានជាតិភ្នំបូកគោមានទីតាំងស្ថិតនៅក្នុងស្រុកទឹកឈូខេត្តកំពត។ ភ្នំបូកគោមានកម្ពស់ ១០៧៥ម៉ែត្រធៀបទៅនឹងនីវ៉ូទឹកសមុទ្រនិងមានចម្ងាយប្រមាណ ១១គីឡូម៉ែត្រពីក្រុងកំពតទៅកាន់ជើងភ្នំនិងចម្ងាយ ៣២គីឡូម៉ែត្រពីជើងភ្នំដល់កំពូលភ្នំ។ ភ្នំបូកគោត្រូវបានរកឃើញនៅឆ្នាំ១៩១៧ ដោយជនជាតិបារាំងនិងត្រូវបានអភិវឌ្ឍឲ្យទៅជារមណីយដ្ឋាននៅឆ្នាំ១៩២១ ក្នុងរជ្ជកាលព្រះបាទស៊ីសុវត្ថិ។"),
("acc_bamboo_bugalow", "kompot", "បឹងកាឡូឬស្សី - Bamboo Bungalow", "accommodation", "៣គីឡូមែត្រ ពីរង្វង់មូលទុរេន", "85.93932", "120.93938", "https://cf.bstatic.com/images/hotel/max1024x768/127/127542740.jpg", 0, "បឹងកាឡូ ឫស្សី ឬក៏គេច្រើនហៅថា Bamboo Bungalow មានទីតាំងស្ថិតនៅ ភូមិអូរតូច សង្កាត់អណ្ដូងខ្មែរ ក្រុងកំពត ខេត្តកំពត និងមានចម្ងាយប្រហែល ~3km ពីរង្វង់មូល​ធូរេន។"),
("act_biking", "kompongsom", "place", "៤គីឡូម៉ែត្រពីក្រុងកំពត", "85.93932", "120.93938", "https://www.cambotours.com/userfiles/thumbs/kampot-bike-to-the-backroads-tour.jpg", 0, "ជិះកង់មើលទេសភាពនៅក្នុងតំបន់ទេសចរណ៍", "បង្វែរអារម្មណ៍ពីការជិះឡានម៉ូតូនៅទីក្រុងមកជាការជិះកង់កំសាន្តមើលទេសភាពធម្មជាតិដ៏ខៀវស្រងាត់និងស្រូបខ្យល់អាកាសបរិសុទ្ធនៅកំពត។តើអ្នកដឹងទេថាការជិះកង់គឺពិតជាអស្ចារ្យនិងជាមធ្យោបាយបែបអេកូហ្រ្វេនលីដើម្បីទទួលបទពិសោធន៍ពីខេត្តកំពត។ដំណើរកម្សាន្តជិះកង់ដ៏ស្ងប់ស្ងាត់តាមដងទន្លេនេះអាចឱ្យអ្នករីករាយនឹងកំពតប្រកបដោយភាពសុខសាន្តបំផុតនិងអាចស្វែងយល់ពីការរស់នៅជុំវិញធម្មជាតិនិងកន្លែងរស់នៅក្នុងតំបន់ផងដែរ។"),
("res_epicartcafe", "kompot", "place", "កំពង់កណ្ដាល, កំពត", "85.93932", "120.93938", "https://www.madmonkeyhostels.com/wp-content/uploads/2017/06/Epic-Arts-Cafe-copy.jpg", 0, "Epic Arts Cafe", "បានបង្កើតឡើងក្នុងឆ្នាំ2006កាហ្វេរបស់យើងគឺជាកន្លែងធ្វើការដែលមានបម្រើអាហារពេលព្រឹកដ៏អស្ចារ្យនិងអាហារថ្ងៃត្រង់ដែលមានរសជាតិឈ្ងុយឆ្ងាញ់។"),
("acc_eden", "kompot", "Eden ភូមិអេកូ", "place", "ជាប់មាត់ព្រែកកំពត", "85.93932", "120.93938","https://firebasestorage.googleapis.com/v0/b/romduoltravel.appspot.com/o/kompot%2Faccomodations%2Feden-eco-village.jpg?alt=media&token=561925b0-444e-4467-96b8-7a5eed802052", 0, "ស្ថិតនៅចំងាយ4គ.មពីទីរួមខេត្តកំពតផ្ទះសំណាក់ហ្គេសហាកំពតអេកូផ្តល់ជូនភ្ញៀវនូវកន្លែងស្នាក់នៅសាមញ្ញនិងមានតំលៃសមរម្យ។កន្លែងចតរថយន្តឥតគិតថ្លៃត្រូវបានផ្តល់ជូនដល់អ្នកដែលបើកឡាននិងបើកវ៉ាយហ្វាយឥតគិតថ្លៃអាចរកបាននៅនឹងកន្លែង។បន្ទប់ត្រូវបានបំពាក់ដោយគ្រឿងបរិក្ខារមូលដ្ឋានរួមមានពូកមុងមុងនិងកង្ហារ។សម្ភារៈបន្ទប់ទឹកត្រូវបានចែករំលែក។បុគ្គលិកអាចរៀបចំឱ្យអ្នករីករាយនឹងសកម្មភាពក្រៅផ្សេងៗគ្នាដូចជាការនេសាទជិះកង់និងទូកកាណូ។ផ្ទះសំណាក់ហ្គេសសាកំពតអេកូអេកក៏មានកន្លែងបោកគក់ផងដែរ។ទាំងអាហារក្នុងស្រុកនិងអន្តរជាតិនឹងត្រូវបានបម្រើនៅភោជនីយដ្ឋានពីនឹងកន្លែង។ស្រាបៀរក្នុងស្រុកនិងជម្រើសស្រាដ៍រីករាយនៅបារ៍។");
```

### images
```sql
INSERT INTO `images` (`info_id`, `imageUrl`)
VALUES 
("place_francearchitect", "https://thumbs.dreamstime.com/b/abandoned-christian-church-top-bokor-mountain-preah-monivong-national-park-kampot-cambodia-kep-71161752.jpg"),
("place_francearchitect", "https://thumbs.dreamstime.com/b/abandoned-christian-church-top-bokor-mountain-preah-monivong-national-park-kampot-cambodia-kep-71163269.jpg"),
("place_francearchitect", "https://www.jayakiri.com/uploads/images/GalleryThumbs/1105-9.jpg"),
("acc_bamboo_bugalow", "https://cf.bstatic.com/images/hotel/max1280x900/900/90042437.jpg"),
("acc_bamboo_bugalow", "https://cf.bstatic.com/images/hotel/max1024x768/127/127542740.jpg");
```

### recommends
```sql
INSERT INTO `recommends` (`info_id`, `uid`, `date`, `rate`, `comment`)
VALUES 
("place_francearchitect", "49mxWNZqkcfmftQybPAEsMqGV9A2", "2020-01-01 10:10:10", 5, "That good!"),
("place_francearchitect", "LlxbgPduqoc45W6pCAZED4sbGGW2", "2020-01-01 10:10:10", 3, "Great place to visit"),
("place_francearchitect", "ON07b9cfCIaynav9tMxX16K2yWG3", "2020-01-01 10:10:10", 4, "I wish I can go there again"),
("acc_bamboo_bugalow", "XBFYTKcJf2MovRateghZVsY0uYk2", "2020-01-01 10:10:10", 3, "Good service"),
("acc_bamboo_bugalow", "XH7iwd95kjNunlLJmYypzf34Z5F3", "2020-01-01 10:10:10", 4, "I love people there!");
```

### viewers
```sql

INSERT INTO `viewers` (`uid`, `pid`, `date`)
VALUES 
("49mxWNZqkcfmftQybPAEsMqGV9A2", "kohkong", "2020-01-01 10:10:10"),
("LlxbgPduqoc45W6pCAZED4sbGGW2", "kohkong", "2020-01-01 10:10:10"),
("XBFYTKcJf2MovRateghZVsY0uYk2", "kohkong", "2020-01-01 10:10:10"),
("XH7iwd95kjNunlLJmYypzf34Z5F3", "kohkong", "2020-01-01 10:10:10"),
("49mxWNZqkcfmftQybPAEsMqGV9A2", "keb", "2020-01-01 10:13:10"),
("LlxbgPduqoc45W6pCAZED4sbGGW2", "keb", "2020-01-01 10:13:10"),
("XBFYTKcJf2MovRateghZVsY0uYk2", "keb", "2020-01-01 10:13:10"),
("XH7iwd95kjNunlLJmYypzf34Z5F3", "keb", "2020-01-01 10:13:10"),
("49mxWNZqkcfmftQybPAEsMqGV9A2", "kompongsom", "2020-01-01 11:13:10"),
("LlxbgPduqoc45W6pCAZED4sbGGW2", "kompongsom", "2020-01-01 11:13:10"),
("XBFYTKcJf2MovRateghZVsY0uYk2", "kompongsom", "2020-01-01 11:13:10"),
("XH7iwd95kjNunlLJmYypzf34Z5F3", "kompongsom", "2020-01-01 11:13:10"),
("XBFYTKcJf2MovRateghZVsY0uYk2", "siemreap", "2020-01-01 12:15:10"),
("LlxbgPduqoc45W6pCAZED4sbGGW2", "siemreap", "2020-01-01 12:15:10"),
("XBFYTKcJf2MovRateghZVsY0uYk2", "siemreap", "2020-01-01 12:15:10"),
("XH7iwd95kjNunlLJmYypzf34Z5F3", "siemreap", "2020-01-01 12:15:10"),
("49mxWNZqkcfmftQybPAEsMqGV9A2", "battambang", "2020-01-01 19:16:10"),
("LlxbgPduqoc45W6pCAZED4sbGGW2", "battambang", "2020-01-01 19:16:10"),
("XBFYTKcJf2MovRateghZVsY0uYk2", "battambang", "2020-01-01 19:16:10"),
("XH7iwd95kjNunlLJmYypzf34Z5F3", "battambang", "2020-01-01 19:16:10");
```

### users
```sql
INSERT INTO `users` (`uid`, `email`, `lname`, `fname`,`is_admin`,`profileUrl`,`create_at`)
VALUES 
("49mxWNZqkcfmftQybPAEsMqGV9A2", "sakee168@gmail.com", "Sak", "Kee",1 , "https://pbs.twimg.com/media/Ea3jz_1WoAANHhD.png", "2020-01-01 10:10:10"),
("LlxbgPduqoc45W6pCAZED4sbGGW2", "theasok168@gmail.com", "Thea", "Sok",1 , "https://www.cpp.org.kh/wp-content/uploads/2019/02/36886-768x511.jpg", "2020-01-01 10:10:10"),
("ON07b9cfCIaynav9tMxX16K2yWG3", "sokchan@gmail.com", "Sok", "Chan",1, "https://www.antourist.com/upload_images/images/11a.JPG", "2020-01-01 10:10:10"),
("XBFYTKcJf2MovRateghZVsY0uYk2", "chanmey@gmail.com", "Chan", "Mey",1 , "https://ohhcambodia.com/wp-content/uploads/2019/12/14048230529_d64d3631db_k.jpg", "2020-01-01 10:10:10"),
("XH7iwd95kjNunlLJmYypzf34Z5F3", "mey168@gmail.com", "Mey", "Moeun",1 , "https://cdn.britannica.com/35/171035-050-8423095A/Angkor-Wat-Siemreab-Cambodia.jpg", "2020-01-01 10:10:10");
```

# 5. All possible testing queries (at least 10)
### Selection
```sql
SELECT * FROM `provinces`;
SELECT * FROM `province_infos`;
SELECT * FROM `images`;
SELECT * FROM `recommends`;
SELECT * FROM `viewers`;
SELECT * FROM `users`;
```
**1. Get list of province and its viewer**
```sql
SELECT p.`name`, p.`thumbnail`, p.`pid`, COUNT(v.`uid`) as `viewer`
FROM `provinces` p 
INNER JOIN `viewers` v 
USING(`pid`)
GROUP BY v.`pid`;
```
**2. Get list of province info from category_type and pid**
```sql
SELECT i.`info_id`, i.`name`, i.`display_location`, 
i.`thumbnail`, i.`draft`
(SELECT COUNT(r.`uid`)
FROM `recommends` r 
WHERE r.`info_id` = i.`info_id`)
AS `display_recommends_number`,
(SELECT SUM(r.`rate`) / COUNT(r.`uid`)
FROM `recommends` r 
WHERE r.`info_id` = i.`info_id`)
AS `display_rating`
FROM `province_infos` i
WHERE i.`pid` = 'kompot' AND i.`category_type` = 'accommodation';
```
**3. Get province province info detail**
```sql
SELECT *,
(SELECT COUNT(r.`uid`)
FROM `recommends` r 
WHERE r.`info_id` = i.`info_id`)
AS `display_recommends_number`,
(SELECT SUM(r.`rate`) / COUNT(r.`uid`)
FROM `recommends` r 
WHERE r.`info_id` = i.`info_id`)
AS `display_rating`
FROM `province_infos` i
WHERE i.`info_id` = 'place_francearchitect';
```
**4. Get image list in province info detail**
```sql
SELECT * FROM `images`
WHERE `info_id` = 'place_francearchitect';
```
**5. Get recommend list in province info detail**
```sql
SELECT * FROM `recommends`
WHERE `info_id` = 'place_francearchitect';
```
**6. Get recommend list in province info detail**
```sql
SELECT * FROM `recommends`
WHERE `info_id` = 'place_francearchitect';
```
**7. Search in province by keyword**
```sql
SELECT i.`info_id`, i.`name`, i.`display_location`, 
i.`thumbnail`, i.`draft`,
(SELECT COUNT(r.`uid`)
FROM `recommends` r 
WHERE r.`info_id` = i.`info_id`)
AS `display_recommends_number`,
(SELECT SUM(r.`rate`) / COUNT(r.`uid`)
FROM `recommends` r 
WHERE r.`info_id` = i.`info_id`)
AS `display_rating`
FROM `province_infos` i
WHERE i.`pid` = 'kompot' 
AND i.`category_type` = 'accommodation'
AND  (i.`name` LIKE '%បឹង%'
OR i.`display_location` LIKE '%បឹង%');
```
**8. Get all province info**
```sql
SELECT i.`info_id`, i.`name`, i.`display_location`, 
i.`thumbnail`, i.`draft`,
(SELECT COUNT(r.`uid`)
FROM `recommends` r 
WHERE r.`info_id` = i.`info_id`)
AS `display_recommends_number`,
(SELECT SUM(r.`rate`) / COUNT(r.`uid`)
FROM `recommends` r 
WHERE r.`info_id` = i.`info_id`)
AS `display_rating`
FROM `province_infos` i
```
# 6. Create at least two functions, two store procedures and two triggers
### Functions
Get recommend number from info id
```sql
DELIMITER //
CREATE FUNCTION get_recommends_number(`info_id` varchar(255)) 
RETURNS INT
DETERMINISTIC

BEGIN
  DECLARE recommend INT;

  SELECT COUNT(*)
  INTO recommend
  FROM `recommends` r
  WHERE r.`info_id` = `info_id`;
  RETURN recommend;
END; //

DELIMITER ;

-- Testing
SELECT get_recommends_number ('acc_bamboo_bugalow') as recommends;
```
Get rating from info id
```sql
DELIMITER //
CREATE FUNCTION get_rating_from_info_id(`info_id` varchar(255)) 
RETURNS DOUBLE
DETERMINISTIC

BEGIN
  DECLARE rating DOUBLE;

  SELECT SUM(r.`rate`) / COUNT(r.`uid`)
  INTO rating
  FROM `recommends` r
  WHERE r.`info_id` = `info_id`;
  RETURN rating;
END; //
DELIMITER ;

-- Testing
SELECT get_rating_from_info_id ('acc_bamboo_bugalow') as rating;
```
Procedures
- Get all info id by province ID
```sql
DELIMITER //

CREATE PROCEDURE get_provinces_info_by_province_id(IN `pid` varchar(255), IN `category_type` varchar(25))
BEGIN
  SELECT i.`info_id`, i.`name`, i.`display_location`, 
  i.`thumbnail`, i.`draft`,
  get_recommends_number(i.`info_id`)
  AS `recommends`,
  get_rating_from_info_id(i.`info_id`)
  AS `rating`
  FROM `province_infos` i
  WHERE i.`pid` = `pid` AND i.`category_type` = `category_type`;
END //

DELIMITER ;

-- Testing
call get_provinces_info_by_province_id('kompot', 'accommodation');
```
- Recommend to a province info
```sql
DELIMITER //

CREATE PROCEDURE rate_a_province_info(IN `uid` VARCHAR(255), IN `info_id` VARCHAR(50), IN `date`	DATETIME, IN `rate` DOUBLE, IN `comment` VARCHAR(2000))
BEGIN
  INSERT INTO `recommends` (`uid`, `info_id`, `date`, `rate`, `comment`) VALUES (`uid`, `info_id`, `date`, `rate`, `comment`);
END //

DELIMITER ;

-- Testing
call rate_a_province_info('49mxWNZqkcfmftQybPAEsMqGV9A2', 'acc_bamboo_bugalow', '2021-01-05 00:43:32', '4', 'Good service, I love it so much!!');
```
Triggers
- Delele recomemnd when admin delete a province info
```sql
DELIMITER //

CREATE TRIGGER `delete_recommend_after_parent_is_deleted` 
  BEFORE DELETE
  ON `province_infos` FOR EACH ROW
BEGIN
  DELETE FROM `recommends` WHERE `info_id` = OLD.`info_id`;
  DELETE FROM `images` WHERE `info_id` = OLD.`info_id`;
  
END; //

DELIMITER ;

-- Testing
DELETE FROM `province_infos` WHERE info_id = 'acc_bamboo_bugalow';
```

- Delele all data in province once it is deleted
```sql
DELIMITER //

CREATE TRIGGER `delete_data_from_province`
  BEFORE DELETE
  ON `provinces` FOR EACH ROW
BEGIN
  DELETE FROM `province_infos` WHERE `pid` = OLD.`pid`;
  DELETE FROM `viewers` WHERE `pid` = OLD.`pid`;
END; //

DELIMITER ;

-- Testing
DELETE FROM `provinces` WHERE `pid` = 'kompot';
```
# 7. Create a developer and user account
Developer:
```sql
CREATE USER 'travel_dev'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON travel.* TO 'travel_dev'@'localhost';
```
User account:
```sql
CREATE USER 'travel_user'@'localhost' IDENTIFIED BY 'password123';
GRANT SELECT, INSERT, UPDATE, DELETE ON travel.* TO 'travel_user'@'localhost';
```
# 8. Create an admin account who can access from your IP.
```sql
CREATE USER 'travel_admin'@'%' IDENTIFIED BY 'password';
GRANT ALL ON travel.* TO 'travel_admin'@'%';
flush privileges;
```