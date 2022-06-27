CREATE TABLE [dbo].[CrimeReportImage]
(
	[FileLocation] NVARCHAR(256) NOT NULL PRIMARY KEY, 
    [CrimeReportID] INT NOT NULL Foreign key References CrimeReport(CrimeReportID)
	--CONSTRAINT FK_CrimeReportImage_CrimeReportID FOREIGN KEY (CrimeReportID)
	--REFERENCES CrimeReport(CrimeReportID)
)
