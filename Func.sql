create or alter  function udf_GetPromotedProducts(@CurrentDate datetime, @StartDate datetime, @EndDate datetime, @Discount decimal(16,2), @FirstItemId int, @SecondItemId int, @ThirdItemId int)
returns nvarchar(250)
as
begin

	declare @exists nvarchar(30) = (select [Name]
	from Items where Id = @FirstItemId)
	declare @result nvarchar(50)
	if(@exists is null)
		begin
			  return 'One of the items does not exists!'
		end

	 declare @nextExists nvarchar(40) = (select [Name]
	from Items where Id = @SecondItemId)

	if(@nextExists is null)
		begin
			  return 'One of the items does not exists!'
		end

		 declare @nextEExists nvarchar(40) = (select [Name]
	from Items where Id = @ThirdItemId)

	    if(@nextEExists is null)
		begin
			  return 'One of the items does not exists!'
		end


		if(@CurrentDate not between @StartDate and @EndDate)
			begin
				return 'The current date is not within the promotion dates!'
			end

			
			declare @firstPrice  decimal(14,2) = (
			
				select Price
				from Items where Id = @FirstItemId
			
			)

			set @firstPrice = @firstPrice - @firstPrice * (@Discount / 100)

				
			declare @secondPrice  decimal(14,2) = (
			
				select Price
				from Items where Id = @SecondItemId
			
			)

			set @secondPrice -=  @secondPrice * (@Discount / 100)

				declare @thirdPrice  decimal(14,2) = (
			
				select Price
				from Items where Id = @ThirdItemId
			
			)

			set @thirdPrice -=  @thirdPrice * (@Discount / 100)


			return  @exists +' price: ' +  CAST(@firstPrice as nvarchar(40)) +' <-> '+ @nextExists +' price: ' +  CAST(@secondPrice as nvarchar(40)) +' <-> '+ @nextEExists +' price: ' +  cast(@thirdPrice as nvarchar(40));
end



