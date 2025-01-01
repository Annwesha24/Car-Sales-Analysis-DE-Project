-- create a water table to load the 1st date from which we need the historical data

CREATE TABLE water_table(
	last_load varchar(2000)
)

select * from water_table

-- get min value from source db
select min(Date_ID) from [dbo].[source_car_data]

-- inserted 1 - min value
INSERT INTO water_table VALUES('DT00000')

-- verifying the data
select count(*) from [dbo].[source_car_data] where DATE_ID>'DT00000'

select count(*) from [dbo].[source_car_data]