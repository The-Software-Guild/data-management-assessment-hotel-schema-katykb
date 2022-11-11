-- INSERT INTO Guest VALUES (1, 'Pendergrass', 'Jeremiah', '70 Oakwood St.', 'Zion', 'IL', 60099, (279)-491-0960),(2,'Seery','Bettyann','750 Wintergreen Dr.','Wasilla','AK',99654,'(478) 277-9632'),(3,'Cullison','Duane','9662 Foxrun Lane','Harlingen','TX',78552,'(308) 494-0198'),(4,'Yang','Karie','9378 W. Augusta Ave.','West Deptford','NJ',8096,'(214) 730-0298'),(5,'Lipton','Aurore','762 Wild Rose Street','Saginaw','MI',48601,'(377) 507-0974'),(6,'Luechtefelt','Zachery','7 Poplar Dr.','Arvada','CO',80003,'(814) 485-2615'),(7,'Pendergrass','Jeremiah','70 Oakwood St.','Zion','IL',60099,'(279) 491-0960'),(8,'Holaway','Walter','7556 Arrowhead St.','Cumberland','RI',2864,'(446) 396-6785'),(9,'Vise','Wilfred','77 West Surrey Street','Oswego','NY',13126,'(834) 727-1001'),(10,'Tilton','Maritza','939 Linda Rd.','Burke','VA',22015,'(446) 351-6860'),(11,'Tison','Joleen','87 Queen St.','Drexel Hill','PA',19026,'(231) 893-2755'),(12,'Brown','Katy','1111 My Address','My City','TX',77777,'123-456-7890'), (13, 'Simmer', 'Mack', '379 Old Shore Street', 'Council Bluffs', 'IA',	51501, '(291) 553-05082');
-- Insert into RoomType Values(1, 'Single', '149.99', 0, 2, 2), (2, 'Double', '174.99', '10', '4', '2'), (3, 'Suite', '399.99', '20', '8', '3');
-- INSERT INTO Ammenity VALUES (6, 'refrigerator', 0),(2,'microwave',0),(3,'full kitchen',0),(4,'electric stove/oven',0),(5,'jacuzzi',25);
-- INSERT INTO Room VALUES (201, 2, 0),(202,2,1),(203,2,0),(204,2,1),(205,1,0),(206,1,1),(207,1,0),(208,1,1),(301,2,0),(302,2,1),(303,2,0),(304,2,1),(305,1,0),(306,1,1),(307,1,0),(308,1,1),(401,3,1),(402,3,1);
-- INSERT INTO Roomammenity VALUES (201, 2), (201, 5),(203,2),(203,5),(204,6),(205,2),(205,6),(205,5),(206,2),(206,6),(207,2),(207,6),(207,5),(208,2),(208,6),(301,2),(301,5),(302,6),(303,2),(303,5),(304,6),(305,2),(305,6),(305,5),(306,2),(306,6),(307,2),(307,6),(307,5),(308,2),(308,6),(401,2),(401,6),(401,4),(402,2),(402,6),(402,4),(202,6);
-- INSERT INTO Reservation VALUES (101, 1, 304, 2, 0, '2023-03-31','2023-04-05', 874.95),(102,2,203,2,1,'2023-02-05','2023-02-10',999.95),(103,3,305,2,0,'2023-02-22','2023-02-24',349.98),(105,12,307,1,1,'2023-03-17','2023-03-20',524.97),(106,5,302,3,0,'2023-03-18','2023-03-23',924.95),(107,6,202,2,2,'2023-03-29','2023-03-31',349.98),(108,7,304,2,0,'2023-03-31','2023-04-05',874.95),(109,8,301,1,0,'2023-04-09','2023-04-13',799.96),(110,9,207,1,1,'2023-04-23','2023-04-24',174.99),(111,10,401,2,4,'2023-05-30','2023-06-02',1199.97),(112,11,206,2,0,'2023-06-10','2023-06-14',599.96),(113,11,208,1,0,'2023-06-10','2023-06-14',599.96),(114,5,304,3,0,'2023-06-17','2023-06-18',184.99),(115,12,205,2,0,'2023-06-28','2023-07-02',699.96),(116,8,204,3,1,'2023-07-13','2023-07-14',184.99),(117,9,401,4,2,'2023-07-18','2023-07-21',1259.97),(118,2,303,2,1,'2023-07-28','2023-07-29',199.99),(119,2,305,1,0,'2023-08-30','2023-09-01',349.98),(121,4,203,2,2,'2023-09-13','2023-09-15',399.98),(122,3,401,2,2,'2023-11-22','2023-11-25',1199.97),(125,10,302,2,0,'2023-12-24','2023-12-28',699.96), (126, 2, 203, 2, 1, '2023-02-05', '2023-02-10', 999.95), (127, 4, 201, 2, 2, '2023-03-06', '2023-03-07',199.99),(128, 13, 301, 2, 2, '2023-11-22', '2023-11-25', 599.97);

/*Deleting data should start with records that reference 
Jeremiah Pendergrass using a foreign key and then delete 
the record from the guest table as the last step*/
use hotelschema;
SET SQL_SAFE_UPDATES = 0;

-- -- Delete Reservations first because Reservation references Guest.
DELETE FROM Reservation
WHERE guestId = 1;

-- -- -- -- Delete Guest next. 
-- -- -- -- That removes Jeremeiah Pendergrass from all Tables
DELETE FROM Guest
WHERE guestId = 1;

SET SQL_SAFE_UPDATES = 1;

-- Select * 
-- from Guest;


