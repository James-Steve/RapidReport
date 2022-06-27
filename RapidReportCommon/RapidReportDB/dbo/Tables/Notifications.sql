CREATE TABLE [dbo].[Notifications]
(
	[NotificationID] INT NOT NULL PRIMARY KEY, 
    [IDNumber] CHAR(13) NOT NULL Foreign key References [dbo].[User](IDNumber), 
    [Name] NVARCHAR(50) NOT NULL, 
    [Description] NVARCHAR(250) NOT NULL
)
