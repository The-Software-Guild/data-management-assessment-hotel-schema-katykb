use hotelschema;

/*  1.Write a query that returns a list of reservations that end in July 2023, 
including the name of the guest, the room number(s), and the reservation dates.*/

-- Select
-- Reservation.roomNumber, 
-- Reservation.startDate,
-- Reservation.endDate,
-- Guest.guestFirstName, 
-- Guest.guestLastName
-- From Reservation
-- Inner join Guest on reservation.guestId = guest.guestId
-- Where month(endDate) = 7 and year(endDate) = 2023;

-- Results #2:
-- roomNumber, startDate, endDate,        glm,      gfm
-- '303', '2023-07-28', '2023-07-29', 'Bettyann', 'Seery'
-- '204', '2023-07-13', '2023-07-14', 'Walter', 'Holaway'
-- '401', '2023-07-18', '2023-07-21', 'Wilfred', 'Vise'
-- '205', '2023-06-28', '2023-07-02', 'Katy', 'Brown'


/* 2. Write a query that returns a list of all reservations for rooms with a jacuzzi, 
displaying the guest's name, the room number, and the dates of the reservation.*/
-- select
-- guest.guestFirstName,
-- guest.guestLastName,
-- reservation.startDate,
-- reservation.endDate,
-- reservation.roomNumber
-- -- roomammenity.ammentityTypeId
-- From guest
-- Join reservation on guest.guestId = reservation.guestId
-- Join roomammenity on reservation.roomNumber = roomammenity.roomNumber
-- Where roomammenity.ammentityTypeId = 5;

-- Results #2:
-- glname           gfname   start         end       rm#  
-- 'Bettyann', 'Seery', '2023-02-05', '2023-02-10', '203'
-- 'Karie', 'Yang', '2023-09-13', '2023-09-15', '203'
-- 'Katy', 'Brown', '2023-06-28', '2023-07-02', '205'
-- 'Wilfred', 'Vise', '2023-04-23', '2023-04-24', '207'
-- 'Walter', 'Holaway', '2023-04-09', '2023-04-13', '301'
-- 'Bettyann', 'Seery', '2023-07-28', '2023-07-29', '303'
-- 'Duane', 'Cullison', '2023-02-22', '2023-02-24', '305'
-- 'Bettyann', 'Seery', '2023-08-30', '2023-09-01', '305'
-- 'Katy', 'Brown', '2023-03-17', '2023-03-20', '307'

/*3.Write a query that returns all the rooms reserved
 for a specific guest, including the guest's name, the room(s) reserved, 
 the starting date of the reservation, and how many people were included in the reservation. 
 (Choose a guest's name from the existing data.)*/
-- Select
-- guest.guestFirstName,
-- guest.guestLastName,
-- reservation.roomNumber,
-- reservation.startDate,
-- reservation.numAdults + reservation.numChildren As totalGuests
-- From Guest
-- join Reservation on guest.guestId = reservation.guestId;
 
 -- Results #3:
--  gfn   gln    room#     startDate         totalGuets
--  'Bettyann', 'Seery', '203', '2023-02-05', '3'
-- 'Bettyann', 'Seery', '303', '2023-07-28', '3'
-- 'Bettyann', 'Seery', '305', '2023-08-30', '1'
-- 'Duane', 'Cullison', '305', '2023-02-22', '2'
-- 'Duane', 'Cullison', '401', '2023-11-22', '4'
-- 'Karie', 'Yang', '203', '2023-09-13', '4'
-- 'Aurore', 'Lipton', '302', '2023-03-18', '3'
-- 'Aurore', 'Lipton', '304', '2023-06-17', '3'
-- 'Zachery', 'Luechtefelt', '202', '2023-03-29', '4'
-- 'Walter', 'Holaway', '301', '2023-04-09', '1'
-- 'Walter', 'Holaway', '204', '2023-07-13', '4'
-- 'Wilfred', 'Vise', '207', '2023-04-23', '2'
-- 'Wilfred', 'Vise', '401', '2023-07-18', '6'
-- 'Maritza', 'Tilton', '401', '2023-05-30', '6'
-- 'Maritza', 'Tilton', '302', '2023-12-24', '2'
-- 'Joleen', 'Tison', '206', '2023-06-10', '2'
-- 'Joleen', 'Tison', '208', '2023-06-10', '1'
-- 'Katy', 'Brown', '307', '2023-03-17', '2'
-- 'Katy', 'Brown', '205', '2023-06-28', '2'

 
 /* 4.Write a query that returns a list of rooms, 
reservation ID, and per-room cost for each reservation. 
The results should include all rooms, whether or not there is 
a reservation associated with the room.*/

Select
room.roomNumber,
reservation.reservationId,
reservation.totalRoomCost
From Room
Left join Reservation on room.roomNumber= reservation.roomNumber
Left join roomtype on room.roomTypeId =  roomType.roomTypeId;

-- Results #4:
-- '205', '115', '699.96'
-- '206', '112', '599.96'
-- '207', '110', '174.99'
-- '208', '113', '599.96'
-- '305', '103', '349.98'
-- '305', '119', '349.98'
-- '306', NULL, NULL
-- '307', '105', '524.97'
-- '308', NULL, NULL
-- '201', '127', '199.99'
-- '202', '107', '349.98'
-- '203', '102', '999.95'
-- '203', '121', '399.98'
-- '203', '126', '999.95'
-- '204', '116', '184.99'
-- '301', '109', '799.96'
-- '301', '128', '599.97'
-- '302', '106', '924.95'
-- '302', '125', '699.96'
-- '303', '118', '199.99'
-- '304', '114', '184.99'
-- '401', '111', '1199.97'
-- '401', '117', '1259.97'
-- '401', '122', '1199.97'
-- '402', NULL, NULL

/* 5.Write a query that returns all rooms with a 
capacity of three or more and that are reserved on any date in April 2023.*/

-- Select
-- roomType.occupancyMax,
-- room.roomNumber,
-- reservation.endDate,
-- reservation.startDate
-- From roomType
-- Left join room on roomType.roomTypeId = room.roomTypeId
-- Join reservation on room.roomNumber = reservation.roomNumber
-- Where roomType.occupancyMax >3 and
--  month(startDate) = 4;

-- Results #5:
-- max	room#	dateStart	dateEnd
-- '4', '301', '2023-04-13', '2023-04-09'

/*6. Write a query that returns a list of all guest 
names and the number of reservations per guest, sorted 
starting with the guest with the most reservations and then by the guest's last name.*/

-- Select
-- 	Count(reservation.guestId) as guestTotalReservation,
-- guest.guestFirstName,
-- guest.guestLastName
-- -- reservation.guestId
-- From Guest
-- Join Reservation on guest.guestId = Reservation.guestId
-- Group by guest.guestLastName
-- Order by guestTotalReservation Desc,guestLastName;

-- Result #6:
-- TotRes	FirstN	LastN
-- '4', 'Bettyann', 'Seery'
-- '2', 'Katy', 'Brown'
-- '2', 'Duane', 'Cullison'
-- '2', 'Walter', 'Holaway'
-- '2', 'Aurore', 'Lipton'
-- '2', 'Maritza', 'Tilton'
-- '2', 'Joleen', 'Tison'
-- '2', 'Wilfred', 'Vise'
-- '2', 'Karie', 'Yang'
-- '1', 'Zachery', 'Luechtefelt'
-- '1', 'Mack', 'Simmer'


/*7.Write a query that displays the name, address, 
and phone number of a guest based on their phone number. 
(Choose a phone number from the existing data.)*/
-- Select 
-- guestFirstName,
-- guestLastName,
-- guestAddress,
-- guestState,
-- guestZip,
-- guestPhone
-- from Guest where guestPhone = '123-456-7890';

-- 7: Results: 
-- 'Katy', 'Brown', '1111 My Address', 'TX', '77777', '123-456-7890'

