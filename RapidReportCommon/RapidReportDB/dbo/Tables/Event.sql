CREATE TABLE [dbo].[Event]
(
	[EventID] INT NOT NULL PRIMARY KEY, 
    [EventLocation] [sys].[geography] NOT NULL, 
    [EventStartDate] DATETIME2 NOT NULL, 
    [EventEndDate] DATETIME2 NULL, 
    [EventDescription] NVARCHAR(500) NOT NULL, 
    [EventStatus] BIT NOT NULL DEFAULT 1, 
    [IDNumber] CHAR(13) NOT NULL, 
    [EventTypeID] INT NOT NULL
)
