CREATE TABLE [dbo].[v_EnrollmentSubscription]
(
	[EnrollmentId] [int] NOT NULL,
	[StartEffectiveDate] [datetime2](7) NOT NULL,
	[EndEffectiveDate] [datetime2](7) NOT NULL,
	[SubscriptionId] [bigint] NULL
)
