-- database in second normal form
-- all tables set up with only one record per field
--used linking tables
drop database if exists HotelSchema;

create database HotelSchema;

use HotelSchema;

create table Guest(
guestId int not null auto_increment,
guestLastName varchar(75),
guestFirstName varchar(50),
guestAddress mediumtext,
guestCity varchar(50),
guestState varchar(15),
guestZip int,
guestPhone varchar(15),
CONSTRAINT PK_guest primary key (guestId)
);

create table RoomType(
roomTypeId int primary key auto_increment,
roomTypeDescription varchar(20),
roomBasePrice float,
extraGuestCharge float,
occupancyMax int,
occupancyStandard int
);

create table Ammenity(
ammenityTypeId int primary key auto_increment,
ammenityDescription  varchar(30) not null,
ammenityUpCharge float not null
);

create table Room(
roomNumber int primary key,
roomTypeId int,
adaAccessible boolean,
Constraint foreign key (roomTypeId) references RoomType(roomTypeId)
);

create table Reservation(
reservationId int primary key,
guestId int,
roomNumber int,
numAdults int,
numChildren int,
startDate date,
endDate date,
totalRoomCost float,
Constraint foreign key(guestId) references Guest(guestId),
Constraint foreign key(roomNumber) references Room(roomNumber)
);

create table RoomAmmenity(
roomNumber int,
ammentityTypeId int,
constraint foreign key(roomNumber) references Room(roomNumber),
constraint foreign key(ammentityTypeId) references Ammenity(ammenityTypeId)
);


