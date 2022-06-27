CREATE TABLE [dbo].[EventUpdate]
(
	[EventID] INT NOT NULL Foreign key References [dbo].[Event](EventID), 
    [IDNumber] CHAR(13) NOT NULL  Foreign key References [dbo].[User](IDNumber), 
    [Time] DATETIME2 NOT NULL , 
    [EventUpdateStatus] BIT NOT NULL,
    Primary key (EventID, IDNumber, [Time])
)
