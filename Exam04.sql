
select b.Id, b.[Full Name], c.Name, cit.Name, b.Duration from (
select h.Id, h.[Full Name], h.HometownId, h.DestinationId,case
when h.CancelDate is not null then 'Canceled'
else cast(datediff(day, h.ArrivalDate, h.ReturnDate) as nvarchar(50)) + ' days'
end as [Duration] from(
select t.Id,
CASE
when a.MiddleName is null then a.FirstName + ' ' + a.LastName
else a.FirstName + ' ' + a.MiddleName + ' ' + a.LastName
end as [Full Name],
a.CityId as [HometownId],
h.CityId as [DestinationId],
t.ArrivalDate,
t.ReturnDate,
t.CancelDate
	from Trips as t
join AccountsTrips as at on at.TripId = t.Id
join Accounts as a on a.Id = at.AccountId
join Rooms as r on r.Id = t.RoomId
join Hotels as h on h.Id = r.HotelId
) as h
) as b
join Cities as c on b.HometownId = c.Id
join Cities as cit on b.DestinationId = cit.Id
order by b.[Full Name], b.Id