CREATE TABLE [dbo].[EventImage]
(
	[EventID] INT NOT NULL, 
    [EventImageLocation] NVARCHAR(256) NOT NULL, 
    CONSTRAINT [PK_EventImage] PRIMARY KEY ([EventImageLocation]) 
)
