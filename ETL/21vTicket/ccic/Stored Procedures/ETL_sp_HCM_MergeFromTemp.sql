CREATE PROCEDURE [dbo].[ETL_sp_HMC_MergeFromTemp]
AS
	
	SET NOCOUNT ON;

	-- Merge by Insert and Update
    MERGE [dbo].[HMC_Subscription] AS target
    USING 
	(SELECT * FROM [HMC_Subscription_Temp]) 
	AS source (	[SubscriptionId], 
				[EndCustomerName],
				[EnglishName])
    ON (target.[SubscriptionId] = source.[SubscriptionId])
    
	-- MATCHED
	WHEN MATCHED THEN 
        UPDATE SET	[EndCustomerName]=source.[EndCustomerName],
					[EnglishName]=source.[EnglishName]
	-- NOT MATCHED
	WHEN NOT MATCHED THEN
    INSERT ([SubscriptionId], 
			[EndCustomerName],
			[EnglishName])
    VALUES (source.[SubscriptionId],
			source.[EndCustomerName],
			source.[EnglishName]);



RETURN 0
