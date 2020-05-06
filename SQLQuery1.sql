USE Bank
CREATE TABLE Clients (
	Id INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL
)

GO

CREATE TABLE AccountTypes(
	Id INT PRIMARY KEY IDENTITY,
	[Name] nvarchar(50) not null,
)

go

create table Accounts (
	Id int primary key identity,
	AccountTypeId int foreign key references AccountTypes(Id),
	Balance decimal(15,2) not null default(0),
	ClientId int foreign key references Clients(Id)
)

go

insert into Clients (FirstName, LastName) values
('Gosho', 'Ivanov'),
('Pesho', 'Petrov'),
('Ivan', 'Iliev'),
('Merry', 'Ivanova')

go

INSERT INTO AccountTypes (Name) VALUES
('Checking'),
('Savings')

INSERT INTO Accounts (ClientId, AccountTypeId, Balance)
VALUES
(1, 1, 175),
(2, 1, 275.56),
(3, 1, 138.01),
(4, 1, 40.30),
(4, 2, 375.50)

go

create function f_CalculateTotalBalance (@ClientID int)
returns decimal(15,2)
begin
declare @result as decimal(15,2) = (
	select sum(Balance)
	from Accounts where ClientID = @ClientID
)
return @result
end

SELECT dbo.f_CalculateTotalBalance(4) AS Balance

go

CREATE PROC p_AddAccount @ClientId INT, @AccountTypeId INT AS
INSERT INTO Accounts (ClientId, AccountTypeId)
VALUES (@ClientId, @AccountTypeId)

go

p_AddAccount 2, 2

go

SELECT * FROM Accounts

go

create proc p_Deposit @AccountId int, @Amount decimal(15,2) as
update Accounts
set Balance += @Amount
where Id = @AccountId

go

create proc p_Withdraw @AccountId int, @Amount decimal(15,2) as
begin
	declare @OldBalance decimal(15,2)
	select @OldBalance = Balance from Accounts where Id = @AccountId
	if(@OldBalance - @Amount >= 0)
	begin
	update Accounts
	set Balance -= @Amount
	where Id = @AccountId
	end
	else
	begin
		raiserror('Insufficient funds', 10,1)
		end
     end

go

create table Transactions(
	Id int primary key identity,
	AccountId int foreign key references Accounts(Id),
	OldBalance decimal(15,2) not null,
	NewBalance decimal(15,2) not null,
	Amount as NewBalance - OldBalance,
	[DateTime] datetime2
)

go

create trigger tr_Transaction on Accounts
after update
as
insert into Transactions(AccountId, OldBalance, NewBalance, [DateTime])
select inserted.Id, deleted.Balance, inserted.Balance, getdate() from inserted
join deleted on inserted.Id = deleted.Id

go

p_Deposit 1, 25.00
GO
p_Deposit 1, 40.00
GO
p_Withdraw 2, 200.00
GO
p_Deposit 4, 180.00
GO

select *  from Transactions