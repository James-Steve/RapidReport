CREATE TABLE [dbo].[CrimeReportSuspect]
(
	[CrimeReportID] INT NOT NULL Foreign key References CrimeReport(CrimeReportID), 
    [SuspectID] INT NOT NULL Foreign key References Suspect(SuspectID),
	Primary key (CrimeReportID, SuspectID)

)
