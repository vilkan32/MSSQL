create database Minions

use Minions

create table Minions(
	Id int primary key not null,
	[Name] varchar(50) not null,
	Age int not null
)

create table Towns(
	Id int primary key not null,
	[Name] varchar(50) not null,
)

ALTER TABLE Minions
ADD TownId int foreign key references Towns(Id) 


insert into Minions(Id, [Name], Age, TownId)
values
(1,'Kevin',22,1),
(2,'Bob', 15,3),	
(3, 'Steward',	NULL, 2)

insert into Towns(Id, Name)
values
(1, 'Sofia'),
(2, 'Plovdiv'),
(3, 'Varna')


create table People(
	Id int primary key identity not null,
	[Name] varchar(50) not null,
	Picture image,
	Height decimal(14,2),
	[Weight] decimal(14,2),
	Gender char not null,
	Birthdate  date,
	Biography varchar(max)
	)


insert into People([Name], Picture, Height, [Weight], Gender, Birthdate, Biography) values
('Gosho', 'D:\thepathofimage.jpg', 1.80, 80, 'm', '12/12/2019', 'asdasdasdasdasdasdasdasdasdasdasdasd'),
('Stefan', 'D:\thepathofimage.jpg', 1.90, 100, 'm', '12/12/2010', 'asdasdasdasdasdasdasdasdasdasdasdasd'),
('Stefka', 'D:\thepathofimage.jpg', 1.60, 50, 'f', '12/12/1999', 'asdasdasdasdasdasdasdasdasdasdasdasd'),
('Vasil', 'D:\thepathofimage.jpg', 1.70, 70, 'm', '12/12/1996', 'asdasdasdasdasdasdasdasdasdasdasdasd'),
('Sonq', 'D:\thepathofimage.jpg', 1.50, 40, 'f', '12/12/1994', 'asdasdasdasdasdasdasdasdasdasdasdasd')

create table Users(
		Id int primary key identity not null,
		Username varchar(30) not null,
	[Password] varchar(26) not null,
	ProfilePicture image,
	LastLoginTime  date,
	IsDeleted  bit,
)


insert into Users(Username, Password, ProfilePicture, LastLoginTime, IsDeleted) values
('Pesho', '12dasdadw', 'D:\thepathofimage.jpg', '10/2/2018', 1)
insert into Users(Username, Password, ProfilePicture, LastLoginTime, IsDeleted) values
('Gosho', '12dasdadw', 'D:\thepathofimage.jpg', '10/2/2018', 1)
insert into Users(Username, Password, ProfilePicture, LastLoginTime, IsDeleted) values
('Sasho', '12dasdadw', 'D:\thepathofimage.jpg', '10/2/2018', 0)
insert into Users(Username, Password, ProfilePicture, LastLoginTime, IsDeleted) values
('Mesho', '12dasdadw', 'D:\thepathofimage.jpg', '10/2/2018', 0)
insert into Users(Username, Password, ProfilePicture, LastLoginTime, IsDeleted) values
('Tresho', '12dasdadw', 'D:\thepathofimage.jpg', '10/2/2018', 0)
