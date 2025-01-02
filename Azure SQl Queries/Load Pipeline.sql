-- Query for last_load lookup activity
select * from water_table

-- Query for current_load lookup activity
select max(Date_ID) as max_date from source_car_data

-- Query used in copy data activity to load data from source to destination
select * from source_car_data where Date_ID > @{activity('last_load').output} AND Date_ID <= @{activity('current_load').output}