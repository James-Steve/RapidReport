CREATE TABLE [dbo].[User]
(
	[IDNumber] CHAR(13) NOT NULL PRIMARY KEY, 
    [CellPhoneNumber] CHAR(10) NOT NULL, 
    [Password] NVARCHAR(100) NOT NULL, 
    [HomeLocation] [sys].[geography] NULL, 
    [FirstName] NVARCHAR(25) NULL, 
    [LastName] NVARCHAR(25) NULL, 
    [EmailAdress] NVARCHAR(320) NOT NULL, 
    [IsVerified] BIT NOT NULL DEFAULT 0, 
    [IsBanned] BIT NOT NULL DEFAULT 0, 
    [AdminRights] BIT NOT NULL DEFAULT 0
)
