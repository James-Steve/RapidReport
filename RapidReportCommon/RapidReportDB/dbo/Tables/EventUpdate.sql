CREATE TABLE [dbo].[EventUpdate]
(
	[EventID] INT NOT NULL , 
    [IDNumber] CHAR(13) NOT NULL, 
    [Time] DATETIME2 NOT NULL, 
    [EventUpdateStatus] BIT NOT NULL
)
