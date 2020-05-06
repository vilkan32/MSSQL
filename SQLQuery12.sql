CREATE TRIGGER tr_AfterDeleteJourneys
ON Journeys
AFTER  delete
AS
begin
insert into DeletedJourneys(Id, JourneyStart, JourneyEnd, Purpose, DestinationSpaceportId, SpaceshipId)
SELECT  Id, JourneyStart, JourneyEnd, Purpose, DestinationSpaceportId, SpaceshipId FROM deleted
end