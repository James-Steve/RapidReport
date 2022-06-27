CREATE TABLE [dbo].[Suspect]
(
	[SuspectID] INT NOT NULL PRIMARY KEY, 
    [SuspectImageLocation] NVARCHAR(256) NOT NULL, 
    [SuspectSex] BIT NOT NULL, 
    [SuspectRace] NVARCHAR(50) NOT NULL, 
    [SuspectHairColour] NVARCHAR(50) NOT NULL, 
    [SuspectHeight] SMALLINT NOT NULL, 
    [SuspectAge] TINYINT NOT NULL, 
    [SuspectBitmojiLocation] NVARCHAR(256) NOT NULL, 
    [DistrinctFeatures] NVARCHAR(500) NOT NULL
)
