-- create stored procedure

CREATE PROCEDURE UpdateWatermarkTable
	@lastload varchar(2000)
AS
BEGIN
    --start the transaction
	BEGIN TRANSACTION;

	--update the incremental column in the table
	UPDATE water_table
	SET last_load = @lastload

	END;
