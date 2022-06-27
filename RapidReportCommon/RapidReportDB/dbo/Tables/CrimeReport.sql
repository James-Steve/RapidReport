CREATE TABLE [dbo].[CrimeReport]
(
	[CrimeReportID] INT NOT NULL PRIMARY KEY, 
    [CrimeLocation] [sys].[geography] NOT NULL, 
    [CrimeDateTime] DATETIME2 NOT NULL, 
    [CrimeDescription] NVARCHAR(500) NOT NULL, 
    [IDNumber] CHAR(13) NOT NULL, 
    [CrimeTypeID] INT NOT NULL
)
