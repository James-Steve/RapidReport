CREATE TABLE [dbo].[EventImage]
(
	[EventID] INT NOT NULL Foreign key References Event(EventID), 
    [EventImageLocation] NVARCHAR(256) NOT NULL Primary key, 
    --CONSTRAINT [PK_EventImage] PRIMARY KEY ([EventImageLocation]) 
)
