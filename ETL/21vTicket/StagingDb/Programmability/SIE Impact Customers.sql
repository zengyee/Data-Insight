/****** Script for SelectTopNRows command from SSMS  ******/
SELECT distinct m.[SubscriptionID]
      ,m.[CustomerType]
      ,m.[MSLed ], s.SubscriptionGUID
  FROM [StagingDb].[dbo].[v_CSS_Data_Latest] m left join [AI_Mooncake].[dbo].[DimSubscription] s on m.SubscriptionGUID = s.SubscriptionGUID
  Where[ParentIssueCode] = 'Service Impacting Event' and YearMonthofCreate = '2016-02'
  and (msled=0)
  --or m.SubscriptionID ='33510ee3-9f05-4ade-a164-c730789fe3c1')


  SELECT distinct m.[SubscriptionID]
      ,m.[CustomerType]
      ,m.[MSLed], s.EndCustomerName
  FROM [StagingDb].[dbo].[v_CSS_Data_Latest] m left join [velocity].[dbo].[DimSubAccountEnrollment] s on m.SubscriptionGUID = s.MOCPSubscriptionGuid
  Where [ParentIssueCode] = 'Service Impacting Event' and YearMonthofCreate = '2016-02' and m.msled = 1