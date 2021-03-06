create Database Minions
go

use Minions
create table Minions(
Id int primary key identity,
[Name] nvarchar(50) not null,
Age int not null default(0)
)

go
use Minions
create table Towns(
Id int primary key identity,
[Name] nvarchar(50) not null,
)

go
use Minions
alter table Minions
add TownId INT FOREIGN KEY REFERENCES Towns(Id)
go

use Minions
insert into Towns(Id, Name) values
(1,'Sofia'),
(2,'Plovdiv'),
(3,'Varna')

insert into Minions (ID,Name, Age, TownId) values
(1, 'Kevin', 22,1),
(2, 'Bob', 15, 3),
(3, 'Steward', null ,2)


create table Users(
Id int primary key identity,
Username nvarchar(30) not null,
Password nvarchar(26) not null,
ProfilePicture image,
LastLoginTime Datetime,
IsDeleted nvarchar(10)
)


insert into Users(Username, Password, ProfilePicture, LastLoginTime, IsDeleted) values
('Pesho', '12dasdadw', 'D:\thepathofimage.jpg', '10/2/2018', 'true')
insert into Users(Username, Password, ProfilePicture, LastLoginTime, IsDeleted) values
('Gosho', '12dasdadw', 'D:\thepathofimage.jpg', '10/2/2018', 'true')
insert into Users(Username, Password, ProfilePicture, LastLoginTime, IsDeleted) values
('Sasho', '12dasdadw', 'D:\thepathofimage.jpg', '10/2/2018', 'true')
insert into Users(Username, Password, ProfilePicture, LastLoginTime, IsDeleted) values
('Mesho', '12dasdadw', 'D:\thepathofimage.jpg', '10/2/2018', 'true')
insert into Users(Username, Password, ProfilePicture, LastLoginTime, IsDeleted) values
('Tresho', '12dasdadw', 'D:\thepathofimage.jpg', '10/2/2018', 'true')

select * from Users