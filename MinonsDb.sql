use Minions

go

create table Minions(
	Id int primary key,
	[Name] nvarchar(50) not null,
	Age int
)

go

create table Towns(
	Id int primary key,
	[Name] nvarchar(50) not null,

)

go

alter table Minions
add TownId int foreign key references Towns(Id)

go

insert into Towns(Id, [Name]) values
(1, 'Sofia'),
(2, 'Plovdiv'),
(3, 'Varna')


insert into Minions(Id,[Name], Age, TownId) values
(1, 'Kevin', 22, 1),
(2, 'Bob', 15, 3),
(3, 'Steward', null,2)

select * from Minions


go

create table People(
	Id int primary key identity,
	[Name] nvarchar(200) not null,
	Picture image,
	Height decimal(15,2),
	[Weight] decimal(15,2),
	Gender nvarchar(1) not null,
	Birthdate Datetime not null,
	Biography nvarchar(max)
)

insert into People([Name], Picture, Height, [Weight], Gender, Birthdate, Biography) values
('Gosho', 'D:\thepathofimage.jpg', 1.80, 80, 'm', '12/12/2019', 'asdasdasdasdasdasdasdasdasdasdasdasd'),
('Stefan', 'D:\thepathofimage.jpg', 1.90, 100, 'm', '12/12/2010', 'asdasdasdasdasdasdasdasdasdasdasdasd'),
('Stefka', 'D:\thepathofimage.jpg', 1.60, 50, 'f', '12/12/1999', 'asdasdasdasdasdasdasdasdasdasdasdasd'),
('Vasil', 'D:\thepathofimage.jpg', 1.70, 70, 'm', '12/12/1996', 'asdasdasdasdasdasdasdasdasdasdasdasd'),
('Sonq', 'D:\thepathofimage.jpg', 1.50, 40, 'f', '12/12/1994', 'asdasdasdasdasdasdasdasdasdasdasdasd')


go


create table Users(
	
	Id int primary key identity,
	[Username] nvarchar(30) not null,
	[Password] nvarchar(26) not null,
	ProfilePicture image,
	LastLoginTime datetime,
	IsDeleted nvarchar(5)

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

go

alter table Users
drop constraint PK__Users__3214EC07DAABFB12

go

ALTER TABLE Users
ADD NewKey varchar(255)
go

ALTER TABLE Users
DROP COLUMN Newkey; 
go

ALTER TABLE Users
    ADD Newkey AS convert(varchar, Id) + '_' + convert(varchar, Username) PERSISTED not null

go

ALTER TABLE Users ADD PRIMARY KEY (Newkey)

go

ALTER TABLE Users
add CHECK (len([Password]) >= 5)

go

insert into Users(Username, [Password], ProfilePicture, LastLoginTime, IsDeleted) values
('Pesho', '12ds', 'D:\thepathofimage.jpg', '10/2/2018', 'true')

go

ALTER TABLE Users ADD CONSTRAINT DF_YourTable DEFAULT GETDATE() FOR LastLoginTime

go

insert into Users(Username, [Password], ProfilePicture, IsDeleted) values
('PEdero', '12sdd', 'D:\thepathofimage.jpg', 'true')

go

ALTER TABLE Users
ADD CONSTRAINT PK_Id
PRIMARY KEY (Id)

ALTER TABLE Users ADD PRIMARY KEY (Id)

SELECT * FROM sys.objects
WHERE type = 'PK' 
AND  parent_object_id = OBJECT_ID ('Users')

go

ALTER TABLE Users
add CHECK (len(Username) >= 3)

go

create database Movies


create table Directors(
	Id int primary key identity not null,
	DirectorName nvarchar(30) not null,
	Notes nvarchar(400)
)


insert into Directors(DirectorName, Notes) values
('Strahil', 'dasdasdasdasd'),
('Vasil', ''),
('Emil', 'dasdasdasdasd'),
('Ludmil', 'd32d2dsdf434rfdsvsd'),
('Zumbil', 'd32d2dsdf434rfdsvsd23refdss')

create table Genres(
	Id int primary key identity not null,
	GenreName nvarchar(30) not null,
	Notes nvarchar(400)
)

insert into Genres(GenreName, Notes) values
('Strahil', 'dasdasdasdasd'),
('Vasil', ''),
('Emil', 'dasdasdasdasd'),
('Ludmil', 'd32d2dsdf434rfdsvsd'),
('Zumbil', 'd32d2dsdf434rfdsvsd23refdss')


create table Categories(
	Id int primary key identity not null,
	CategoryName nvarchar(30) not null,
	Notes nvarchar(400)
)

insert into Categories(CategoryName, Notes) values
('Strahil', 'dasdasdasdasd'),
('Vasil', ''),
('Emil', 'dasdasdasdasd'),
('Ludmil', 'd32d2dsdf434rfdsvsd'),
('Zumbil', 'd32d2dsdf434rfdsvsd23refdss')

-- (Id, Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
create table Movies(
	
	Id int primary key identity not null,
	Title nvarchar(100) not null,
	DirectorId int foreign key references Directors(Id),
	CopyrightYear datetime2,
	[Length] nvarchar(50),
	GenreId int foreign key references Genres(Id),
	CategoryId int foreign key references Categories(Id),
	Rating decimal(15,2),
	Notes nvarchar(400)
)

insert into Movies(Title, DirectorId, CopyrightYear, [Length], GenreId, CategoryId, Rating, Notes) values
('StupidMovies', 1, '12/12/2019', '2.31', 1, 2, 10, 'asdasdasdasd'),
('StupidMovies1', 3, '12/12/2011', '2.31', 1, 4, 10, 'asdasdasdasd'),
('StupidMovies2', 4, '12/12/2012', '2.31', 1, 3, 10, 'asdasdasdasd'),
('StupidMovies3', 2, '12/12/2013', '2.31', 1, 1, 10, 'asdasdasdasd'),
('StupidMovies4', 1, '12/12/2019', '2.31', 1, 2, 10, 'asdasdasdasd')


create database CarRental

use CarRental



create table Categories(
	
	Id int primary key identity not null,
	CategoryName nvarchar(50) not null,
	DailyRate  DECIMAL(10, 2) not null,
	WeeklyRate DECIMAL(10, 2) not null,
	MonthlyRate  DECIMAL(10, 2) not null,
	WeekendRate  DECIMAL(10, 2) not null,
)

insert into Categories(CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate) values
('CheapCars', 12,2,3,4),
('ExpensiveCars', 12,2,3,4),
('ShittyCars', 12,2,3,4)




create table Cars(
	Id int primary key identity not null,
	PlateNumber nvarchar(20) not null,
	Manufacturer nvarchar(60) not null,
	Model nvarchar(50) not null,
	CarYear int,
	CategoryId int foreign key references Categories(Id),
	Doors int,
	Picture image,
	Condition nvarchar(50),
	Available nvarchar(50)
)

insert into Cars(PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Picture, Condition, Available) values
('CA9021KH', 'Honda', 'Civic', 2019, 2, 5, 'D:\thepathofimage.jpg', 'New', 'true'),
('CA9024KH', 'BMW', '330i', 2019, 2, 5, 'D:\thepathofimage.jpg', 'New', 'false'),
('CA9051KH', 'Hyundai', 'ex50', 2019, 1, 5, 'D:\thepathofimage.jpg', 'New', 'true')



create table Employees(
	
	Id int primary key identity not null,
	FirstName nvarchar(60) not null,
	LastName nvarchar(60) not null,
	Title nvarchar(60) not null,
	Notes nvarchar(500)
)


insert into Employees(FirstName, LastName, Title, Notes) values
('Ivan', 'Ivanov', 'CEO', 'Work hard!'),
('Stefan', 'Ivanov', 'Manager', 'Work hard!'),
('Georgi', 'Ivanov', 'Production', 'Work hard!')




create table Customers(
	
	Id int primary key identity not null,
	DriverLicenceNumber nvarchar(200) not null,
	FullName nvarchar(80) not null,
	[Address] nvarchar(80) not null,
	City nvarchar(80) not null,
	ZIPCode nvarchar(80) not null,
	Notes nvarchar(80) not null,
)


insert into Customers(DriverLicenceNumber, FullName, [Address], City, ZIPCode, Notes) values
('129323423dadas3311', 'Stefan Ivanov Peshov', 'Sofia Lulin 1', 'Sofia', '1520', 'Not reliable'),
('129323423dadas3312', 'Petur Ivanov Peshov', 'Sofia Lulin 2', 'Sofia', '1520', 'reliable'),
('129323423dadas3313', 'Gosho Ivanov Peshov', 'Sofia Lulin 3', 'Sofia', '1520', 'reliable')






create table RentalOrders(
	Id int primary key identity not null,
	EmployeeId int foreign key references Employees(Id) not null,
	CustomerId int foreign key references Customers(Id) not null,
	CarId int foreign key references Cars(Id),
	TankLevel decimal (15,2),
	KilometrageStart int,
	KilometrageEnd int,
	TotalKilometrage int,
	StartDate datetime2 not null,
	EndDate datetime2 not null,
	TotalDays int not null,
	RateApplied int,
	TaxRate int,
	OrderStatus nvarchar(50) not null,
	Notes nvarchar(600)
)


insert into RentalOrders (EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd,TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus, Notes) values
(2,2,1, 50.42, 123002, 12400, '100', '12/12/2019', '3/1/2020', 4, 12, 10, 'completed', 'Great new year!'),
(1,2,2, 50.42, 123001, 12400, '100', '12/12/2019', '3/1/2020', 4, 12, 10, 'completed', 'Great new year!'),
(3,3,3, 50.42, 12300, 12400, '100', '12/12/2019', '3/1/2020', 4, 12, 10, 'completed', 'Great new year!')


create database Hotel

use Hotel


-- Employees (Id, FirstName, LastName, Title, Notes)

create table Employees(
	Id int primary key identity not null,
	FirstName nvarchar(50) not null,
	LastName nvarchar(50) not null,
	Title nvarchar(50) not null,
	Notes nvarchar(600)
)


insert into Employees(FirstName, LastName, Title, Notes) values
('Gosho', 'Goshev', 'Jedi', null),
('Iliqn', 'Iliev', 'Master', null),
('Pesho', 'Peshev', 'Noob', null)


-- Customers (AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)

create table Customers(
	AccountNumber nvarchar(100) primary key not null,
	FirstName nvarchar(100) not null,
	LastName nvarchar(100) not null,
	PhoneNumber nvarchar(100) not null,
	EmergencyName nvarchar(100) not null,
	EmergencyNumber nvarchar(100) not null,
	Notes nvarchar(600),
)

insert into Customers(AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes) values
('123', 'Pesho', 'Peshev', '0912312312', 'Iliq', '0192312312', null),
('1234', 'IVan', 'Ivanov', '093212312', 'GOsho', '019322', null),
('12345', 'Todor', 'Todorov', '091232312', 'Pesho', '0192323312', null)

-- RoomStatus (RoomStatus, Notes)

create table RoomStatus(
	RoomStatus nvarchar(60) primary key not null,
	Notes nvarchar(600)
)

insert into RoomStatus(RoomStatus, Notes) values
('Empty', null),
('Cleaning', null),
('Occupied', null)

-- RoomTypes (RoomType, Notes)

create table RoomTypes(
	RoomType nvarchar(60) primary key not null,
	Notes nvarchar(600)
)

insert into RoomTypes(RoomType, Notes) values
('Big', null),
('Small', null),
('Medium', null)


-- BedTypes (BedType, Notes)

create table BedTypes(
	
	BedType nvarchar(60) primary key not null,
	Notes Nvarchar(600)
)

insert into BedTypes(BedType, Notes) values
('Single', null),
('Double', null),
('KingSize', null)

-- Rooms (RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)

create table Rooms(
	RoomNumber int primary key not null,
	RoomType nvarchar(60) foreign key references RoomTypes(RoomType) not null,
	BedType nvarchar(60) foreign key references BedTypes(BedType) not null,
	Rate decimal(15,2),
	RoomStatus nvarchar(60) foreign key references RoomStatus(RoomStatus) not null,
	Notes nvarchar(600)
)

insert into Rooms(RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes) values
(1, 'Big', 'Single', 12.4, 'Empty', null),
(2, 'Small', 'Double', 12.4, 'Cleaning', null),
(3, 'Medium', 'KingSize', 12.4, 'Occupied', null)


-- Payments (Id, EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes)

create table Payments(
	
	Id int primary key identity not null,
	EmployeeId int foreign key references Employees(Id) not null,
	PaymentDate datetime2 not null,
	AccountNumber nvarchar(100) foreign key references Customers(AccountNumber) not null,
	FirstDateOccupied datetime2 not null,
	LastDateOccupied datetime2 not null,
	TotalDays int not null,
	AmountCharged decimal(15,2) not null,
	TaxRate decimal(15,2),
	TaxAmount decimal(15,2),
	PaymentTotal decimal(15,2) not null,
	Notes nvarchar(600),
)


insert into Payments(EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes) values
(1, '12/10/2019', '123', '9/10/2019', '12/10/2019', 3, 200.50, 5.3, 10, 255.80, null),
(2, '12/10/2019', '1234', '9/10/2019', '12/10/2019', 3, 200.50, 5.3, 10, 255.80, null),
(3, '12/10/2019', '12345', '9/10/2019', '12/10/2019', 3, 200.50, 5.3, 10, 255.80, null)


-- Occupancies (Id, EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes)


create table Occupancies (

	Id int primary key identity not null,
	EmployeeId int foreign key references Employees(Id) not null,
	DateOccupied datetime2,
	AccountNumber nvarchar(100) foreign key references Customers(AccountNumber) not null,
	RoomNumber int foreign key references Rooms(RoomNumber)  not null,
	RateApplied decimal(15,2),
	PhoneCharge decimal(15,2),
	Notes nvarchar(600)
)

insert into Occupancies(EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes) values
(1, '12/10/2019', '123', 1, 5.60, 0, null),
(2, '12/10/2019', '1234', 2, 5.60, 50, null),
(3, '12/10/2019', '12345', 3, 5.60, 100, null)



create database SoftUni

use SoftUni

create table Towns(
	Id int primary key identity not null,
	[Name] nvarchar(50) not null
) 

-- Addresses (Id, AddressText, TownId)
create table Addresses(
	Id int primary key identity not null,
	AddressText nvarchar(200) not null,
	TownId int foreign key references Towns(Id) not null
)

insert into Addresses(AddressText, TownId) values
('Galio Jelev 11', 2)


create table Departments(
	Id int primary key identity not null,
	[Name] nvarchar(50) not null
) 


-- Employees (Id, FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary, AddressId)

create table Employees(
	Id int primary key identity not null,
	FirstName nvarchar(50) not null,
	MiddleName nvarchar(50) not null,
	LastName nvarchar(50) not null,
	JobTitle nvarchar(50) not null,
	DepartmentId int foreign key references Departments(Id) not null,
	HireDate datetime2,
	Salary decimal(15,2) not null,
	AddressId int foreign key references Addresses(Id)
)

RESTORE DATABASE SoftUni  
   FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\Backup\SoftUni.bak' ;  

go

use SoftUni

-- Towns: Sofia, Plovdiv, Varna, Burgas

insert into Towns([Name]) values
('Sofia'), -- 1
('Plovdiv'), -- 2
('Varna'), -- 3
('Burgas') -- 4

 -- Departments: Engineering, Sales, Marketing, Software Development, Quality Assurance

 insert into Departments([Name]) values
 ('Engineering'), --1
  ('Sales'),  -- 2
   ('Marketing'), -- 3
    ('Software Development'), -- 4
	 ('Quality Assurance') -- 5


go
-- Peter Pan Pan Intern Marketing 28/08/2016 599.88
insert into Employees(FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary, AddressId) values
('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, convert(datetime2,'01/02/2013', 103), 3500.00, 1),
('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, convert(datetime2,'02/03/2004',103), 4000.00, 2),
('Maria', 'Petrova', 'Ivanova', 'Intern', 5, convert(datetime2,'28/08/2016',103), 525.25, 3),
('Georgi', 'Teziev', 'Ivanov', 'CEO', 2, convert(datetime2,'09/12/2007',103), 3000.00, 4),
('Peter', 'Pan', 'Pan', 'Intern', 3, convert(datetime2,'28/08/2016', 103), 599.88, 5)

drop table Employees


Select Id, [Name] from Towns

select * from Departments

select * from Employees


SELECT *
FROM Towns
ORDER BY [Name] asc

SELECT *
FROM Departments
ORDER BY [Name] asc

SELECT *
FROM Employees
ORDER BY Salary desc

go

select [Name]
from Towns
ORDER BY [Name] asc

select [Name]
from Departments
ORDER BY [Name] asc

SELECT
       [FirstName],
       [LastName],
       [JobTitle],
       [Salary]
  FROM [Employees]
  ORDER BY Salary desc


  

UPDATE Employees
SET Salary += Salary * 0.10

Select [Salary] from Employees

use Hotel

UPDATE Payments
SET TaxRate -= TaxRate * 0.03
SELECT TaxRate FROM Payments


drop database SoftUni

Select * from Departments

go

select [Name] from Departments

select FirstName, LastName, Salary from Employees

select FirstName, MiddleName, LastName from Employees

select FirstName + '.' + LastName + '@softuni.bg' as [Full Email Address]
 from Employees

 select distinct Salary from Employees

 select * 
 from Employees
 where [JobTitle] = 'Sales Representative'


 select FirstName, LastName, JobTitle
 from Employees
 where Salary between 20000 and 30000

 select FirstName + ' ' + MiddleName + ' ' + LastName as [Full Name]
from Employees
where (Salary = 25000 or Salary = 14000 or Salary = 12500 or Salary = 23600)

select FirstName, LastName from Employees where ManagerId is null

select FirstName, LastName, Salary from Employees
where Salary >= 50000
Order by Salary desc

select top(5) FirstName, LastName from Employees
Order by Salary desc

select FirstName, LastName from Employees 
where not DepartmentId = 4

select * from Employees
order by Salary desc,
FirstName asc,
LastName desc,
MiddleName asc


create view V_EmployeesSalaries as
select FirstName, LastName, Salary
from Employees

update Employees 
set MiddleName = ''
where MiddleName is null

go

create view V_EmployeeNameJobTitle as
select FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName as [Full Name], JobTitle as [Job Title]
from Employees


select distinct JobTitle from Employees

select top(10) * from Projects 
order by StartDate, [Name]

select top(7) FirstName, LastName, HireDate from Employees
order by HireDate desc

go

declare @EngineeringId int;

DECLARE @ToolDesignID INT;

DECLARE @MarketingID INT;

DECLARE @InformationServicesID INT;

SELECT TOP (1) @EngineeringID = DepartmentID
FROM Departments
WHERE [Name] = 'Engineering';

SELECT TOP (1) @ToolDesignID = DepartmentID
FROM Departments
WHERE [Name] = 'Tool Design';

SELECT TOP (1) @MarketingID = DepartmentID
FROM Departments
WHERE [Name] = 'Marketing';

SELECT TOP (1) @InformationServicesID = DepartmentID
FROM Departments
WHERE [Name] = 'Information Services';


UPDATE Employees
  SET
      Salary+=Salary * 0.12
WHERE DepartmentID IN(@EngineeringID, @ToolDesignID, @MarketingID, @InformationServicesID);
Select Salary from Employees

use Geography

select top(30) CountryName, [Population]  from Countries
where ContinentCode = 'EU'
order by [Population] desc, CountryName asc

select CountryName,
CountryCode,
case CurrencyCode
when 'EUR'
then 'Euro'
else 'Not Euro'
end as 'Currency'
from Countries
order by CountryName


use SoftUni

Select FirstName
from Employees
where DepartmentId = 3 or DepartmentId = 10 and DATEPART(year,HireDate) between 1995 and 2005

select * from Employees

select [Name] 
from Towns
where len([Name]) between 5 and 6
order by [Name]

select * from Towns
where [Name] like '[M, K, B, E]%'
order by [Name]

select * 
from Towns
where [Name] like '[^R, B, D]%'
order by [Name] asc 




create view V_EmployeesHiredAfter2000 as
select FirstName, LastName
from Employees
where datepart(year, HireDate) > 2000

use SoftUni

select FirstName, LastName from Employees
where len(LastName) = 5

use Geography

select * from Countries

select CountryName, IsoCode as [Iso Code] from Countries
WHERE CountryName LIKE '%a%a%a%'

select Peaks.PeakName, Rivers.RiverName,
LOWER(CONCAT(LEFT(Peaks.PeakName, LEN(Peaks.PeakName)-1), Rivers.RiverName)) AS Mix
from Peaks, Rivers
where right(PeakName,1) = left(RiverName, 1)
order by Mix


select Left(PeakName,2) as char from Peaks

SELECT Peaks.PeakName,
       Rivers.RiverName,
       LOWER(CONCAT(LEFT(Peaks.PeakName, LEN(Peaks.PeakName)-1), Rivers.RiverName)) AS Mix
FROM Peaks
     JOIN Rivers ON RIGHT(Peaks.PeakName, 1) = LEFT(Rivers.RiverName, 1)
ORDER BY Mix;

use Diablo

select top(50) [Name], FORMAT (Start, 'yyyy-MM-dd') as [Start] from Games
where DATEPART(year, Start) between 2011 and 2012
order by Start


select Username,
    right(Email, LEN(Email)-CHARINDEX('@', Email)) AS [Email Provider]
FROM Users
ORDER BY [Email Provider],
         Username;

use Diablo

SELECT Username,
       IpAddress AS [IP Address]
FROM Users
WHERE IpAddress LIKE '___.1_%._%.___'
ORDER BY Username;

select [Name] as [Game],
case
when datepart(hour, Start) between 0 and 11
then 'Morning'
when datepart(hour, Start) between 12 and 17
then 'Afternoon'
when datepart(hour, Start) between 18 and 23
then 'Evening'
else 'N\A'
end as [Part of the Day],
case
when Duration <= 3
then 'Extra Short'
when Duration between 4 and 6
then 'Short'
when Duration > 6
then 'Long'
when Duration is null
then 'Extra Long'
end as [Duration]
 from Games
 ORDER BY Name,
         [Duration],
         [Part of the Day]; 


		 SELECT Name AS [Game],
       CASE
           WHEN DATEPART(HOUR, Start) BETWEEN 0 AND 11
           THEN 'Morning'
           WHEN DATEPART(HOUR, Start) BETWEEN 12 AND 17
           THEN 'Afternoon'
           WHEN DATEPART(HOUR, Start) BETWEEN 18 AND 23
           THEN 'Evening'
           ELSE 'N\A'
       END AS [Part of the Day],
       CASE
           WHEN Duration <= 3
           THEN 'Extra Short'
           WHEN Duration BETWEEN 4 AND 6
           THEN 'Short'
           WHEN Duration > 6
           THEN 'Long'
           WHEN Duration IS NULL
           THEN 'Extra Long'
           ELSE 'Error - must be unreachable case'
       END AS [Duration]
FROM Games
ORDER BY Name,
         [Duration],
         [Part of the Day]; 


go

use Gringotts

select  count(*) as [Count]
from WizzardDeposits

select  *
from WizzardDeposits

select max(MagicWandSize) 
from WizzardDeposits

select DepositGroup, max(MagicWandSize) as [LongestMagicWand]
from WizzardDeposits
group by DepositGroup


select top(2) DepositGroup
from WizzardDeposits
group by DepositGroup
order by avg(MagicWandSize)


select DepositGroup, sum(DepositAmount) as [TotalSum]
from WizzardDeposits
group by DepositGroup


select DepositGroup, sum(DepositAmount) as [TotalSum]
from WizzardDeposits
where MagicWandCreator = 'Ollivander family'
group by DepositGroup


select DepositGroup, sum(DepositAmount) as [TotalSum]
from WizzardDeposits
where MagicWandCreator = 'Ollivander family'
group by DepositGroup
having sum(DepositAmount) < 150000
order by sum(DepositAmount) desc


select DepositGroup, MagicWandCreator, min(DepositCharge) as [MinDepositCharge]
from WizzardDeposits
group by DepositGroup, MagicWandCreator
order by MagicWandCreator, DepositGroup


select 
case
when Age between 0 and 10
then '[0-10]'
when Age between 11 and 20
then '[11-20]'
when Age between 21 and 30
then '[21-30]'
when Age between 31 and 40
then '[31-40]'
when Age between 41 and 50
then '[41-50]'
when Age between 51 and 60
then '[51-60]'
when Age >= 61
then '[61+]'
end as AgeGroup,
count(*) as WizardCount
from WizzardDeposits
group by case
when Age between 0 and 10
then '[0-10]'
when Age between 11 and 20
then '[11-20]'
when Age between 21 and 30
then '[21-30]'
when Age between 31 and 40
then '[31-40]'
when Age between 41 and 50
then '[41-50]'
when Age between 51 and 60
then '[51-60]'
when Age >= 61
then '[61+]'
end

go

select  *
from WizzardDeposits


go

select left(FirstName, 1) as FirstLetter
from WizzardDeposits
WHERE DepositGroup = 'Troll Chest'
group by left(FirstName, 1)
ORDER BY FirstLetter


select DepositGroup, IsDepositExpired, avg(DepositInterest) as [AverageInterest]
from WizzardDeposits
where DepositStartDate > '01/01/1985'
group by DepositGroup, IsDepositExpired
order by DepositGroup desc, IsDepositExpired asc

select sum(e.Diff) as [TotalSum] from(
select DepositAmount - LEAD(DepositAmount) over (order by ID) as Diff
from WizzardDeposits
) as e

use SoftUni

select DepartmentId, sum(Salary) as [TotalSalary]
from Employees
group by DepartmentId

select DepartmentId, min(Salary) as [MinimumSalary]
from Employees
where DepartmentId in(2,5,7) and HireDate> '01/01/2000'
group by DepartmentId

use SoftUni


select * into NewEmpT
from Employees
where Salary > 30000


delete NewEmpT
where ManagerId = 42 

update NewEmpT
set Salary += 5000
where DepartmentId = 1

select DepartmentId, avg(Salary)
from NewEmpT
group by DepartmentId


use SoftUni


select DepartmentId, max(Salary)
from Employees
group by DepartmentId
having max(Salary) < 30000 or max(Salary) > 70000

select count(Salary) as [Count]
from Employees
where ManagerId is null

USE SoftUni


SELECT DISTINCT DepartmentId, Salary FROM(
SELECT DepartmentId, Salary, DENSE_RANK() OVER(PARTITION BY DepartmentId ORDER BY Salary DESC) as r
	FROM Employees
) AS e
WHERE r = 3


SELECT TOP(10) FirstName, LastName, DepartmentId
FROM Employees AS e
WHERE Salary > (SELECT AVG(Salary) FROM Employees WHERE DepartmentId = e.DepartmentId)
ORDER BY DepartmentId

SELECT  AVG(Salary)
	FROM Employees
	GROUP BY DepartmentId


	create database Passports
	
	use Passports

create table Persons(
	PersonID int not null identity,
	FirstName nvarchar(50) not null,
	Salary decimal(15,2) not null,
	PassportID int not null
)



ALTER TABLE Persons
ADD CONSTRAINT PK_PersonID PRIMARY KEY (PersonID);

create table Passports(
	PassportID int not null,
	PassportNumber nvarchar(50) not null
)



ALTER TABLE Passports
ADD CONSTRAINT PK_PassportID PRIMARY KEY (PassportID);

ALTER TABLE Persons
ADD CONSTRAINT FK_Passports_Persons FOREIGN KEY (PassportID)
REFERENCES Passports(PassportID)

insert into Passports values
(101, 'N34FG21B'),
(102, 'K65LO4R7'),
(103, 'ZE657QP2')

insert into Persons values
('Roberto', 43300.00, 102),
('Tom', 56100.00, 103),
('Yana', 60200.00, 101)



create database Vehicles

use Vehicles

create table Manufacturers(
	ManufacturerID int primary key not null identity,
	Name nvarchar(50) not null,
	EstablishedOn datetime2 not null,
)

create table Models(
	ModelID int primary key not null,
	Name nvarchar(50) not null,
	ManufacturerID int foreign key(ManufacturerID) references Manufacturers(ManufacturerID)
)


insert into Manufacturers values
('BMW', '07/03/1916'),
('Tesla', '01/01/2003'),
('Lada', '01/05/1966')


insert into Models values
(101, 'X1', 1),
(102, 'i6', 1),
(103, 'Model S', 2),
(104, 'Model X', 2),
(105, 'Model 3', 2),
(106, 'Nova', 3)


create database StudentInfo

use StudentInfo

create table Students(
 StudentID int not null identity,
 Name nvarchar(50) not null,
 constraint PK_StudentID primary key(StudentID)
)

create table Exams(
 ExamID int not null,
 [Name] nvarchar(50) not null,
 constraint PK_ExamID primary key(ExamID)
)


create table StudentsExams(
StudentID int not null,
ExamID int not null,

CONSTRAINT PK_StudentsExams PRIMARY KEY(StudentID, ExamID),
constraint FK_StudentsExams_Students foreign key(StudentID)
references Students(StudentID),
constraint FK_StudentsExams_Exams foreign key(ExamID)
references Exams(ExamID)
)

insert into Students values
('Mila'),
('Toni'),
('Ron')

insert into Exams values
(101,'SpringMVC'),
(102,'Neo4j'),
(103,'Oracle 11g')


insert into StudentsExams values
(1, 101),
(1, 102),
(2, 101),
(3, 103),
(2, 102),
(2, 103)


create database School

use School

create table Teachers(
	TeacherID int primary key not null,
	[Name] nvarchar(50) not null,
	ManagerID int,
	constraint FK_TeacherID_ManagerID foreign key(ManagerID) references Teachers(TeacherID)
)


insert into Teachers values
(101, 'John', NULL),
(102, 'Maya', 106),
(103, 'Silvia', 106),
(104, 'Ted', 105),
(105, 'Mark', 101),
(106, 'Greta', 101)

create database OnlineStore

use OnlineStore

create table Cities(
	CityID int primary key not null identity,
	[Name] varchar(50) not null
)

create table Customers(
	CustomerID int primary key not null identity,
	[Name] varchar(50) not null,
	Birthday date not null,
	CityID int not null,
	constraint FK_Customers_Cities foreign key(CityID) references Cities(CityID)
)

create table Orders(
	OrderID int primary key not null identity,
	CustomerID int not null,
	constraint FK_Orders_Customers foreign key(CustomerID) references Customers(CustomerID)
)

create table ItemTypes(
	ItemTypeID int primary key not null identity,
	[Name] varchar(50) not null
)

create table Items(
	ItemID int primary key not null,
	[Name] varchar(50) not null,
	ItemTypeID int not null,
	constraint FK_Items_ItemTypes foreign key(ItemTypeID) references ItemTypes(ItemTypeID)
)


create table OrderItems(
	OrderID int not null,
	ItemID int not null,
	constraint PK_OrderItems primary key(OrderID, ItemID),
	constraint FK_OrderItems_Orders foreign key(OrderID) references Orders(OrderID),
	constraint FK_OrderItems_Items foreign key(ItemID) references Items(ItemID)
)


create database University

use University

create table Subjects(
	SubjectID int primary key not null,
	SubjectName varchar(50) not null

)

create table Majors(
	MajorID int primary key not null,
	[Name] varchar(50) not null
)

create table Students(
	StudentID int primary key not null,
	StudentNumber varchar(50) not null,
	StudentName varchar(50) not null,
	MajorID int not null,
	constraint FK_Students_Majors foreign key(MajorID) references Majors(MajorID)
)

create table Agenda(
	StudentID int not null,
	SubjectID int not null,
	constraint PK_Agenda primary key(StudentID, SubjectID),
	constraint FK_Agenda_Students foreign key(StudentID) references Students(StudentID),
	constraint FK_Agenda_Subjects foreign key(SubjectID) references Subjects(SubjectID)
)

create table Payments(
	PaymentID int not null primary key,
	PaymentDate date not null,
	PaymentAmount decimal(15,2) not null,
	StudentID int not null,
	constraint FK_Payments_Students foreign key(StudentID) references Students(StudentID)

)


use Geography

select MountainRange, PeakName, Elevation
from Mountains as m
join Peaks as p on p.MountainId = m.Id
where m.MountainRange = 'Rila'
order by p.Elevation desc

use SoftUni


select top(50) e.FirstName, e.LastName, t.Name as Town, a.AddressText 
from Employees as e
join Addresses as a
on e.AddressID = a.AddressID
join Towns as t
on t.TownID = a.TownID
order by e.FirstName,
 e.LastName

 select e.EmployeeID, e.FirstName, e.LastName, d.Name as DepartmentName
 from Employees as e
 join Departments as d
 on (e.DepartmentID = d.DepartmentID and d.Name = 'Sales')
 order by e.EmployeeID


 use SoftUni

 select top(5) e.EmployeeID, e.FirstName, e.Salary, d.Name as DepartmentName
 from Employees as e
 join Departments as d
 on e.DepartmentID = d.DepartmentID and e.Salary > 15000
 order by d.DepartmentID

 select * from EmployeesProjects

 go

 
 
 select e.EmployeeID, e.FirstName
 from Employees as e
 RIGHT OUTER join EmployeesProjects as p
 on e.EmployeeID not in (SELECT DISTINCT EmployeeID FROM EmployeesProjects)
 ORDER BY e.EmployeeID

 select e.FirstName, e.LastName, e.HireDate, d.Name as DeptName
 from Employees as e
 join Departments as d
 on (d.DepartmentID = e.DepartmentID and e.HireDate > '1.1.1999 ' and (d.Name = 'Sales' or d.Name = 'Finance'))
 order by e.HireDate 

 use SoftUni

select *
from Employees as e
join EmployeesProjects as emppr
on e.EmployeeID = emppr.EmployeeID
join Projects as p 
on (p.ProjectID = emppr.ProjectID and p.StartDate > '2002-08-13' and p.EndDate is null)
order by e.EmployeeID


select e.EmployeeID, e.FirstName,
case
	WHEN p.StartDate >= '2005-01-01' THEN NULL
		ELSE p.Name
end as ProjectName
from Employees as e
join EmployeesProjects as ep
on (e.EmployeeID = ep.EmployeeID and e.EmployeeID in(24))
join Projects as p
on ep.ProjectID = p.ProjectID

select e.EmployeeID, e.FirstName, e.ManagerID, e2.FirstName AS ManagerName
from Employees as e
join Employees as e2
on e2.EmployeeID = e.ManagerID and e.ManagerID in (3,7)
ORDER BY e.EmployeeID


select top(50) e.EmployeeID, 
e.FirstName + ' ' + e.LastName as EmployeeName, 
e2.FirstName + ' ' + e2.LastName as ManagerName, 
d.Name as DepartmentName
from Employees as e
join Employees as e2
on e2.EmployeeID = e.ManagerID
join Departments as d
on e.DepartmentID = d.DepartmentID
ORDER BY e.EmployeeID

SELECT MIN(avgSal) AS MinAverageSalary FROM
(select avg(e.Salary) as avgSal
from Employees as e
group by e.DepartmentID) as sal


SELECT MIN(AverageSalaryByDepartment) AS MinAverageSalary FROM
	(SELECT AVG(Salary) AS AverageSalaryByDepartment FROM Employees
	GROUP BY DepartmentID) AS AvgSalaries


	use Geography

select c.CountryCode, m.MountainRange, p.PeakName, p.Elevation
from Countries as c
join MountainsCountries as mc
on (c.CountryCode = mc.CountryCode and c.CountryCode = 'BG')
join Mountains as m
on mc.MountainId = m.Id 
join Peaks as p
on p.MountainId = m.Id and p.Elevation > 2835
order by p.Elevation desc


use Geography
 
select c.CountryCode, count(mc.MountainId)  AS MountainRanges
from Countries as c
join MountainsCountries as mc
on (c.CountryCode = mc.CountryCode and c.CountryName IN ('United States', 'Russia', 'Bulgaria'))
group by c.CountryCode



select *
from Countries

select * from 
CountriesRivers

select *
from Rivers

-- top(5) c.CountryName, r.RiverName

select top(5) c.CountryName, r.RiverName
from Countries as c
left join CountriesRivers as cr
on (c.CountryCode = cr.CountryCode)
left join Rivers as r
on r.Id = cr.RiverId
where c.ContinentCode = 'AF'
order by c.CountryName 

select * 
from Continents

select * 
from Countries 

select *
from Currencies

select * 
from Continents as c



WITH CTE_ContinentsAllUsages (ContinentCode, CurrencyCode, CurrencyUsage) AS
(
select m.ContinentCode, m.CurrencyCode,  m.CurrencyUsage
from
(select c.ContinentCode, c.CurrencyCode, count(c.CurrencyCode) as CurrencyUsage
from Countries as c
group by c.ContinentCode, c.CurrencyCode) as m
where m.CurrencyUsage > 1
)

select continentCodeAndUsage.ContinentCode, currencyCode.CurrencyCode, continentCodeAndUsage.CurrencyUsage from
(
select cont.ContinentCode, max(cont.CurrencyUsage) as CurrencyUsage
from (
SELECT  max(acc.CurrencyUsage) as CurrencyUsage, acc.ContinentCode
FROM CTE_ContinentsAllUsages AS acc
group by acc.CurrencyCode, acc.ContinentCode
) as cont
group by cont.ContinentCode
) as continentCodeAndUsage
join 
(
select cont.ContinentCode, max(cont.CurrencyUsage) as CurrencyUsage, cont.CurrencyCode
from (
SELECT acc.CurrencyCode, max(acc.CurrencyUsage) as CurrencyUsage, acc.ContinentCode
FROM CTE_ContinentsAllUsages AS acc
group by acc.CurrencyCode, acc.ContinentCode
) as cont
group by cont.ContinentCode, CurrencyCode
) as currencyCode
on continentCodeAndUsage.ContinentCode = currencyCode.ContinentCode 
and continentCodeAndUsage.CurrencyUsage = currencyCode.CurrencyUsage
order by currencyCode.ContinentCode

select count(c.CountryCode) as CountryCode 
from Countries as c
full join MountainsCountries as mc
on c.CountryCode = mc.CountryCode
full join Mountains as m
on m.Id = mc.MountainId
where m.Id is null




WITH CTE_CountryPeaks (CountryName, HighestPeakElevation, CountryCode) AS
(
	select c.CountryName,  max(p.Elevation) as HighestPeakElevation, c.CountryCode
	from Countries as c
	join MountainsCountries as mc
	on mc.CountryCode = c.CountryCode
	join Mountains as m
	on mc.MountainId = m.Id
	join Peaks as p
	on p.MountainID = m.Id
	group by c.CountryCode, c.CountryName
),

CTE_CountryRivers (CountryCode, LongestRiverLength) AS
(
	select c.CountryCode, max(r.Length) as LongestRiverLength
	from Countries as c
	join CountriesRivers as mr
	on mr.CountryCode = c.CountryCode
	join Rivers as r
	on mr.RiverId = r.Id
	group by c.CountryCode
)


select top (5) cp.CountryName, cp.HighestPeakElevation, cr.LongestRiverLength
from CTE_CountryPeaks as cp
join CTE_CountryRivers as cr
on cp.CountryCode = cr.CountryCode
order by cp.HighestPeakElevation desc, cr.LongestRiverLength desc, cp.CountryName



WITH CTE_CountryPeaks (CountryName, HighestPeakElevation, CountryCode) AS
(
	select c.CountryName,  max(p.Elevation) as HighestPeakElevation, c.CountryCode
	from Countries as c
	full join MountainsCountries as mc
	on mc.CountryCode = c.CountryCode
	full join Mountains as m
	on mc.MountainId = m.Id
	full join Peaks as p
	on p.MountainID = m.Id
	group by c.CountryCode, c.CountryName
),

CTE_HighestPeaksAndMore (Country, [Highest Peak Name], [Highest Peak Elevation], [Mountain]) AS
(
select cp.CountryName as Country, p.PeakName as [Highest Peak Name], cp.HighestPeakElevation as [Highest Peak Elevation], m.MountainRange as [Mountain]
from CTE_CountryPeaks as cp
left join MountainsCountries as mc
on cp.CountryCode =  mc.CountryCode
left join Mountains as m
on mc.MountainId  = m.Id
join Peaks as p
on p.MountainId = mc.MountainId and cp.HighestPeakElevation = p.Elevation and p.MountainId = m.Id
)

select top(5) c.CountryName as Country,
	CASE
		WHEN hpm.[Highest Peak Name] IS NULL THEN '(no highest peak)'
		ELSE hpm.[Highest Peak Name]
	END AS [Highest Peak Name],

	case
	when hpm.[Highest Peak Elevation] is null then (0)
	else hpm.[Highest Peak Elevation]
	end as [Highest Peak Elevation],
	
	CASE
		WHEN hpm.Mountain IS NULL THEN '(no mountain)'
		ELSE hpm.Mountain
	END AS Mountain
from Countries as c
left join CTE_HighestPeaksAndMore as hpm
on c.CountryName = hpm.Country
order by c.CountryName, hpm.[Highest Peak Elevation]


CREATE PROC dbo.usp_GetEmployeesSalaryAbove35000
AS 
SELECT FirstName, LastName
FROM Employees
WHERE Salary > 35000


CREATE PROC dbo.usp_GetEmployeesSalaryAboveNumber(@number DECIMAL(18,4))
AS
SELECT FirstName, LastName
FROM Employees
WHERE Salary >= @number

EXEC dbo.usp_GetEmployeesSalaryAboveNumber 35000

CREATE PROC usp_GetTownsStartingWith (@startsWith nvarchar(10))
AS
SELECT t.Name
FROM Towns AS t
WHERE t.Name LIKE @startsWith + '%'

EXEC dbo.usp_GetTownsStartingWith 'b'

SELECT * FROM Employees

select * from Addresses

WITH CTE_EmployeesAddressesTowns (FirstName, LastName, TownName) AS
(
	SELECT e.FirstName, e.LastName, t.Name
	FROM Employees as e
	JOIN Addresses as a
	ON a.AddressID = e.AddressID
	JOIN Towns as t
	ON t.TownID = a.TownID
)

go

CREATE PROC usp_GetEmployeesFromTown @townName nvarchar(20)
AS
	SELECT e.FirstName, e.LastName
	FROM Employees as e
	JOIN Addresses as a
	ON a.AddressID = e.AddressID
	JOIN Towns as t
	ON t.TownID = a.TownID
WHERE t.Name = @townName

exec usp_GetEmployeesFromTown 'Sofia'


create function ufn_GetSalaryLevel(@salary decimal(18,4))
returns nvarchar(20)
as
begin

declare @salaryLevel nvarchar(20);

if @salary < 30000
begin
set @salaryLevel = 'Low'
end
else if @salary between 30000 and 50000
begin
set @salaryLevel = 'Average'
end
else 
begin
set @salaryLevel = 'High'
end

return @salaryLevel
end

select Salary, dbo.ufn_GetSalaryLevel(Salary)  AS [Salary Level]
from Employees


create proc usp_EmployeesBySalaryLevel @salaryLevel nvarchar(20)
as
select 
	FirstName,
    LastName
from Employees
where  @salaryLevel = dbo.ufn_GetSalaryLevel(Salary)

create function ufn_IsWordComprised(@setOfLetters NVARCHAR(MAX), @word NVARCHAR(MAX))
  RETURNS int
  as
  begin

  declare @index int = 1;
  declare @isComprised int = 0;
  declare @currentChar nvarchar(1);

  while(@index <= LEN(@word))
	begin
		  SET @currentChar = substring(@word, @index, 1);

		  if(charindex(@currentChar, @setOfLetters) = 0)
		  begin
		   RETURN @isComprised;
		  end
		   else
		  begin
		   SET @index += 1;
		  end
	 end
		set @isComprised = 1
		 RETURN @isComprised 
	end

SELECT dbo.ufn_IsWordComprised('oistmiahf', 'halves')

use SoftUni


create proc usp_DeleteEmployeesFromDepartment(@departmentId INT)
AS
	alter table Departments
		alter column ManagerID int null

	delete from EmployeesProjects
	where EmployeeID in
	(
		select EmployeeID
		from Employees
		where DepartmentID = @departmentId
	)

	update Departments
	set ManagerID = null
	where ManagerID in
	(
		select EmployeeID
		from Employees
		where DepartmentID = @departmentId
	)

	delete from Employees
	where EmployeeID in
	(
	select EmployeeID
	from Employees
	where DepartmentID = @departmentId
	)

	delete from Departments
	where DepartmentID = @departmentId

	select count(*) as [Employees Count]
	from Employees as e
	join Departments as d
	on d.DepartmentID = e.DepartmentID
	where e.departmentID = @departmentId




create proc usp_GetHoldersFullName
as
select ah.FirstName + ' ' + ah.LastName as [Full Name]
from AccountHolders as ah

create proc usp_GetHoldersWithBalanceHigherThan @higherThanNum decimal(18,4)
as

select ah.FirstName AS [First Name], ah.LastName AS [Last Name]
from AccountHolders as ah
join Accounts as a
on ah.Id = a.Id
group by ah.FirstName, ah.LastName
having sum(a.Balance) >= @higherThanNum




CREATE PROC usp_GetHoldersWithBalanceHigherThan(@higherThan MONEY) AS
BEGIN
	SELECT h.FirstName as [First Name], h.LastName as [Last Name]
	FROM AccountHolders h
	JOIN Accounts a ON h.Id = a.AccountHolderId
	GROUP BY h.Id, h.FirstName, h.LastName
	HAVING SUM(a.Balance) > @higherThan
	ORDER BY h.FirstName, h.LastName
END

exec usp_GetHoldersWithBalanceHigherThan 5000

CREATE FUNCTION ufn_CalculateFutureValue (@sum decimal(18,4), @yearlyInterestRate float, @numberOfYears int)
RETURNS DECIMAL(18,4)
BEGIN
RETURN @sum * POWER((1 + @yearlyInterestRate), @numberOfYears)
END


CREATE PROC usp_CalculateFutureValueForAccount(@accountID INT, @interestRate FLOAT)
AS
SELECT a.Id, 
ah.FirstName, 
ah.LastName, 
a.Balance, 
dbo.ufn_CalculateFutureValue(a.Balance, @interestRate, 5)
FROM Accounts as a
JOIN AccountHolders AS ah
on ah.Id = a.AccountHolderId
WHERE a.Id = @accountID

select * from AccountHolders
select * from Accounts


CREATE FUNCTION ufn_CashInUsersGames (@gameName varchar(max))
returns table
return select sum(k.Cash) as SumCash from
(
select g.Name, ug.Cash, ROW_NUMBER() over (order by ug.Cash desc ) as RowNumber
from Games as g
join UsersGames as ug
on g.Id = ug.GameId
where g.Name = @gameName) as k
where k.RowNumber % 2 != 0

use Bank


create table Logs(
	LogId int primary key identity not null,
	AccountId int not null,
	OldSum decimal(18,4),
	NewSum decimal(18,4)
	
)


create trigger tr_TransactionLog
on Accounts
after update
as
begin
	
	declare @accountId int = (
		select Id from inserted
	)

	declare @oldSum decimal(18,4) = (
		select Balance from deleted
	)

	declare @newSum decimal(18,4) = (
		select Balance from inserted
	)

	insert into Logs values
	(@accountId, @oldSum, @newSum)

end


create table NotificationEmails(
	Id int primary key identity not null,
	Recipient int not null,
	Body nvarchar(max),
	Subject nvarchar(max)
)


create trigger tr_LogsEmail
on Logs
after insert
as
begin
	
	declare @accountId int = (
		select AccountId from inserted
	)

	declare @subject nvarchar(max) = concat('Balance change for account: ', @accountId);

	declare @oldSum decimal(18,4) = (
		select OldSum from inserted
	)

	declare @newSum decimal(18,4) = (
		select NewSum from inserted
	)
	declare @body nvarchar(max) = concat('On ', GETDATE(), ' your balance was changed from ', @oldSum, ' to ', @newSum,  '.');

	insert into NotificationEmails values
	(@accountId, @subject, @body)
end

SELECT Id, Recipient, Subject FROM NotificationEmails

use Bank

create proc usp_DepositMoney (@accountId int, @moneyAmount decimal(18,4))
as
begin transaction
update Accounts
set Balance += @moneyAmount
where Id = @accountId
commit



create proc usp_WithdrawMoney (@AccountId int, @MoneyAmount decimal(18,4))
as
begin
begin transaction
update Accounts
set Balance -= @MoneyAmount
where Id = @AccountId

if(Balance - @MoneyAmount > 0)
begin

rollback;
return;
end

commit
end


create proc usp_TransferMoney(@SenderId int, @ReceiverId int , @Amount decimal(18,4))
as
begin transaction
 exec dbo.usp_WithdrawMoney @SenderId, @Amount;
 EXEC dbo.usp_DepositMoney @ReceiverId, @Amount;
 IF ((SELECT Balance
         FROM Accounts
         WHERE Accounts.Id = @SenderId) < 0)
      BEGIN
        ROLLBACK
      END
    ELSE
      BEGIN
        COMMIT
      END
 



 select * from UsersGames

 select * 
 from Users as u
 join UsersGames as ug on u.Id = ug.UserID
 join Games as g on ug.GameId = g.Id
 where Username = 'Stamat' and g.Name = 'Safflower'


 select *
 from Items as i
 join UserGameItems as ugi on i.Id = ugi.ItemId



 declare @stamatId int = (
		select Id
		from Users
		where Username = 'Stamat'
 )



 declare @gameId int = (
	select Id from Games where Name = 'Safflower'
 )

 declare @usersGamesId int = (
	select Id from UsersGames where UserId = @stamatId and GameId = @gameId 
 )

 declare @totalSumOfItemsBetween11And12 money = (
		select sum(Price)
		 from Items
			where MinLevel between 11 and 12
 ) 

  declare @totalSumOfItemsBetween19And21 money = (
		select sum(Price)
		 from Items
			where MinLevel between 19 and 21
 ) 

 declare @currentCash money;

 begin transaction

	insert into UserGameItems  (ItemId, UserGameId)
	SELECT Id, @usersGamesId
	FROM Items
	WHERE MinLevel BETWEEN 11 AND 12

	set @currentCash = (
		select Cash
		from UsersGames
		where Id = @usersGamesId
	)

	if(@currentCash - @totalSumOfItemsBetween11And12 < 0)
	begin
	rollback
	end

ELSE BEGIN
	UPDATE UsersGames
	SET Cash -= @totalSumOfItemsBetween11And12
	WHERE Id = @UsersGamesId
	COMMIT
END


begin transaction

	insert into UserGameItems (ItemId, UserGameId)
	SELECT Id, @usersGamesId
	FROM Items
	WHERE MinLevel BETWEEN 19 AND 21

	set @currentCash = (
		select Cash
		from UsersGames
		where Id = @usersGamesId
	)

	if(@currentCash - @totalSumOfItemsBetween19And21 < 0)
	begin
	rollback
	end

ELSE BEGIN
	UPDATE UsersGames
	SET Cash -= @totalSumOfItemsBetween19And21
	WHERE Id = @UsersGamesId
	COMMIT
END

SELECT i.Name as [Item Name]
FROM UserGameItems AS ui
JOIN Items as i ON i.Id = ui.ItemId
WHERE ui.UserGameId = @usersGamesId
ORDER BY i.Name ASC



create proc usp_AssignProject(@emloyeeId int, @projectID int)
as
begin

declare @numberOfAssignedProjects int = (select count(ep.EmployeeID)  as [Count]
from EmployeesProjects as ep
group by ep.EmployeeID
having ep.EmployeeID = 2)

begin transaction 

insert into EmployeesProjects (EmployeeID, ProjectID) values
(@emloyeeId, @projectID)

if(@numberOfAssignedProjects > 2)
begin
raiserror('The employee has too many projects!',16,1)
rollback
return
end

commit
end

delete from EmployeesProjects where EmployeeID = 2

EXEC dbo.usp_AssignProject 2,1
EXEC usp_AssignProject 2,2
EXEC usp_AssignProject 2,3
BEGIN TRY  
 EXEC usp_AssignProject 2,5
END TRY  
BEGIN CATCH  
   SELECT error_message()
END CATCH;



create table Deleted_Employees(
EmployeeId int primary key not null, 
FirstName varchar(50) not null, 
LastName varchar(50) not null, 
MiddleName varchar(50), 
JobTitle varchar(50) not null,
DepartmentId int not null, 
Salary money not null)

CREATE TRIGGER tr_EmployeesDelete ON Employees FOR DELETE
AS
INSERT INTO Deleted_Employees (FirstName, LastName, MiddleName, JobTitle, DepartmentID, Salary)
SELECT FirstName, LastName, MiddleName, JobTitle, DepartmentID, Salary
FROM deleted


use Diablo

select SUBSTRING ( Email ,charindex('@', Email) + 1, len(Email) - charindex('@', Email))  as [Email Provider], count(*) as [Number Of Users]
from Users
group by SUBSTRING ( Email ,charindex('@', Email) + 1, len(Email) - charindex('@', Email))
order by [Number Of Users] desc, [Email Provider]


declare @username nvarchar(30) = 'Alex';

declare @gameName nvarchar(30) = 'Edinburgh';


declare @usersGamesId int = (
		select ug.Id
		from Users as u
		join UsersGames as ug on u.Id = ug.UserId
		join Games as g on g.Id = ug.GameId
		where g.name = @gameName and u.Username = @username
)

declare @availableCash money = (
	
	select Cash 
	from UsersGames as ug
	where ug.Id = @usersGamesId
)

declare @itemPrice money = (
	
	select sum(Price)
	from Items
	where [Name] in (
	'Blackguard', 'Bottomless Potion of Amplification', 'Eye of Etlich (Diablo III)',
    'Gem of Efficacious Toxin', 'Golden Gorget of Leoric', 'Hellfire Amulet'
	)
)

if(@availableCash >= @itemPrice)
begin
		begin transaction

		 UPDATE UsersGames
		 SET Cash -= @itemPrice
		 WHERE Id = @usersGamesId


		  INSERT INTO UserGameItems (ItemId, UserGameId)
			(SELECT
				Id,
				@usersGamesId
			FROM Items
				WHERE Name IN
				('Blackguard', 'Bottomless Potion of Amplification', 'Eye of Etlich (Diablo III)',
				'Gem of Efficacious Toxin', 'Golden Gorget of Leoric', 'Hellfire Amulet'))
end

SELECT
  u.Username,
  g.Name,
  ug.Cash,
  i.Name AS [Item Name]
FROM UsersGames AS ug
  JOIN Games AS g
    ON ug.GameId = g.Id
  JOIN Users AS u
    ON ug.UserId = u.Id
  JOIN UserGameItems AS item
    ON ug.Id = item.UserGameId
  JOIN Items AS i
    ON item.ItemId = i.Id
WHERE g.Name = @gameName

use Geography

select p.PeakName, m.MountainRange, p.Elevation
	from Mountains as m
	join Peaks as p on m.Id = p.MountainId
	order by p.Elevation desc, p.PeakName



select p.PeakName, m.MountainRange as [Mountain], c.CountryName, cont.ContinentName 
	from Countries as c
	join MountainsCountries as mc on mc.CountryCode = c.CountryCode
	join Mountains as m on mc.MountainId = m.Id
	join Peaks as p on p.MountainId = m.Id
	join Continents as cont on cont.ContinentCode = c.ContinentCode
	order by p.PeakName, c.CountryName



select c.CountryName, cont.ContinentName, count(r.RiverName) as [RiversCount], ISNULL(sum(r.Length), 0) as [TotalLength]
	from Countries as c
		left join CountriesRivers as cr on cr.CountryCode = c.CountryCode
		left join Rivers as r on r.Id = cr.RiverId
		left join Continents as cont on cont.ContinentCode = c.ContinentCode
			group by c.CountryName, cont.ContinentName
			order by count(r.RiverName) desc, ISNULL(sum(r.Length), 0) desc, c.CountryName


select cur.CurrencyCode, cur.Description as [Currency], count(c.CountryName) as [NumberOfCountries]
	from Countries as c
	left join Currencies as cur on c.CurrencyCode = cur.CurrencyCode
		group by cur.CurrencyCode, cur.Description
			order by  count(c.CountryName) desc, cur.Description




select cont.ContinentName, sum(cast(c.AreaInSqKm as bigint)) as CountriesArea, sum(cast(c.[Population] as float)) as CountriesPopulation
 from Countries as c
 join Continents as cont on c.ContinentCode = cont.ContinentCode
 group by cont.ContinentName
 order by CountriesPopulation desc



 create table Monasteries(
 Id int primary key identity not null, 
 Name varchar(50) not null, 
 CountryCode char(2) foreign key references Countries(CountryCode)
 )

 INSERT INTO Monasteries(Name, CountryCode) VALUES
('Rila Monastery “St. Ivan of Rila”', 'BG'), 
('Bachkovo Monastery “Virgin Mary”', 'BG'),
('Troyan Monastery “Holy Mother''s Assumption”', 'BG'),
('Kopan Monastery', 'NP'),
('Thrangu Tashi Yangtse Monastery', 'NP'),
('Shechen Tennyi Dargyeling Monastery', 'NP'),
('Benchen Monastery', 'NP'),
('Southern Shaolin Monastery', 'CN'),
('Dabei Monastery', 'CN'),
('Wa Sau Toi', 'CN'),
('Lhunshigyia Monastery', 'CN'),
('Rakya Monastery', 'CN'),
('Monasteries of Meteora', 'GR'),
('The Holy Monastery of Stavronikita', 'GR'),
('Taung Kalat Monastery', 'MM'),
('Pa-Auk Forest Monastery', 'MM'),
('Taktsang Palphug Monastery', 'BT'),
('S?mela Monastery', 'TR')


ALTER TABLE Countries
ADD IsDeleted bit NOT NULL
CONSTRAINT con_DefaultValueFalse DEFAULT 0



	UPDATE Countries 
SET IsDeleted = 1
WHERE CountryName in (
select grouped.CountryName
from
(select count(r.RiverName) as RiversCount, c.CountryName
	from Countries as c
	join CountriesRivers as cr on cr.CountryCode = c.CountryCode
	join Rivers as r on cr.RiverId = r.Id
	group by c.CountryName
	) as grouped
	where grouped.RiversCount > 3
)


select 
  m.Name        AS [Monastery],
  c.CountryName AS [Country]
from Monasteries as m
left join Countries as c on m.CountryCode = c.CountryCode
WHERE c.IsDeleted <> 1
ORDER BY Monastery ASC


update Countries
set CountryName = 'Burma'
where CountryName = 'Myanmar'

insert into Monasteries (Name, CountryCode)
(select
	'Hanga Abbey',
     CountryCode
   FROM Countries
   WHERE CountryName = 'Tanzania')

   INSERT INTO Monasteries (Name, CountryCode)
  (SELECT
     'Myin-Tin-Daik',
     CountryCode
   FROM Countries
   WHERE CountryName = 'Myanmar')


   SELECT
  con.ContinentName AS [ContinentName],
  c.CountryName     AS [CountryName],
  count(m.Id)       AS [MonasteriesCount]
FROM Continents AS con
  JOIN Countries AS c
    ON c.ContinentCode = con.ContinentCode
  LEFT JOIN Monasteries AS m
    ON m.CountryCode = c.CountryCode
WHERE c.IsDeleted = 0
GROUP BY c.CountryName, con.ContinentName
ORDER BY MonasteriesCount DESC, CountryName ASC