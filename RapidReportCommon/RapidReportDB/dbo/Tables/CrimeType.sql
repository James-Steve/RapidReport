CREATE TABLE [dbo].[CrimeType]
(
	[CrimeTypeID] INT NOT NULL PRIMARY KEY, 
    [CrimeTypeName] NVARCHAR(50) NOT NULL, 
    [CrimeTypeDescription] NVARCHAR(250) NOT NULL, 
    [CrimeTypeEmoji] NVARCHAR(1) NOT NULL
)
