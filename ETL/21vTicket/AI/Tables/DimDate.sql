﻿CREATE TABLE [dbo].[DimDate]
(
	[DimDateKey] INT NOT NULL PRIMARY KEY,	
	[CalendarDate] [date] NOT NULL,
	[DayOfWeek] [tinyint] NOT NULL,
	[DayName] [nvarchar](10) NOT NULL,
	[CalendarYearKey] [smallint] NOT NULL,
	[CalendarYearName] [nvarchar](10) NOT NULL,
	[CalendarYearShortName] [nvarchar](10) NOT NULL,
	[CalendarQuarterKey] [int] NOT NULL,
	[CalendarQuarterInYearNumber] [tinyint] NOT NULL,
	[CalendarQuarterName] [nvarchar](10) NOT NULL,
	[CalendarQuarterShortName] [nvarchar](10) NOT NULL,
	[CalendarMonthKey] [int] NOT NULL,
	[CalendarMonthName] [nvarchar](10) NOT NULL,
	[CalendarMonthShortName] [nvarchar](10) NOT NULL,
	[CalendarMonthAltName] [nvarchar](10) NOT NULL,
	[CalendarMonthAltShortName] [nvarchar](10) NOT NULL,
	[CalendarMonthInYearNumber] [tinyint] NOT NULL,
	[CalendarWeekKey] [smallint] NOT NULL,
	[CalendarWeekName] [nvarchar](10) NOT NULL,
	[CalendarWeekShortName] [nvarchar](10) NOT NULL,
	[MSFiscalYearKey] [smallint] NOT NULL,
	[MSFiscalYearName] [nvarchar](10) NOT NULL,
	[MSFiscalYearShortName] [nvarchar](10) NOT NULL,
	[MSFiscalHalfKey] [smallint] NOT NULL,
	[MSFiscalHalfName] [nvarchar](10) NOT NULL,
	[MSFiscalHalfShortName] [nvarchar](10) NOT NULL,
	[MSFiscalQuarterKey] [smallint] NOT NULL,
	[MSFiscalQuarterName] [nvarchar](10) NOT NULL,
	[MSFiscalQuarterShortName] [nvarchar](10) NOT NULL,
	[MSFiscalMonthKey] [smallint] NOT NULL,
	[MSFiscalMonthName] [nvarchar](10) NOT NULL,
	[MSFiscalMonthShortName] [nvarchar](10) NOT NULL,
	[MSFiscalMonthAltName] [nvarchar](10) NOT NULL,
	[MSFiscalMonthAltShortName] [nvarchar](10) NOT NULL,
	[GregorianMonthKey] [smallint] NOT NULL,
	[GregorianMonthBeginDate] [date] NOT NULL,
	[GregorianMonthEndDate] [date] NOT NULL,
	[GregorianMonthName] [nvarchar](12) NOT NULL,
	[GregorianMonthFullName] [nvarchar](18) NOT NULL,
	[GregorianQuarterKey] [smallint] NOT NULL,
	[GregorianQuarterName] [nvarchar](7) NOT NULL,
	[GregorianSemesterKey] [smallint] NOT NULL,
	[GregorianSemesterName] [nvarchar](7) NOT NULL,
	[GregorianYearKey] [smallint] NOT NULL,
	[GregorianYearName] [nvarchar](7) NOT NULL,
	[ReportingWeekKey] [smallint] NOT NULL,
	[ReportingWeekBeginDate] [date] NOT NULL,
	[ReportingWeekEndDate] [date] NOT NULL,
	[AIMeta_CreatedAt] [datetime2](7) NOT NULL,
	[AIMeta_UpdatedAt] [datetime2](7) NOT NULL,
	[AIMeta_CreatedDimAuditKey] [bigint] NOT NULL,
	[AIMeta_UpdatedDimAuditKey] [bigint] NOT NULL,
	[AIMeta_SCDIsCurrent] [bit] NOT NULL,
	[AIMeta_SCDEffectiveFrom] [datetime2](7) NOT NULL,
	[AIMeta_SCDEffectiveTo] [datetime2](7) NOT NULL
)
