CREATE TABLE [dbo].[Notifications]
(
	[NotificationID] INT NOT NULL PRIMARY KEY, 
    [IDNumber] NCHAR(13) NOT NULL, 
    [Name] NVARCHAR(50) NOT NULL, 
    [Description] NVARCHAR(250) NOT NULL
)
