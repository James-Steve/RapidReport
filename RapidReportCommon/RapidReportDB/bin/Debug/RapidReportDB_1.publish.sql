﻿/*
Deployment script for RapidReportDB

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "RapidReportDB"
:setvar DefaultFilePrefix "RapidReportDB"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating database $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating Table [dbo].[CrimeReport]...';


GO
CREATE TABLE [dbo].[CrimeReport] (
    [CrimeReportID]    INT               NOT NULL,
    [CrimeLocation]    [sys].[geography] NOT NULL,
    [CrimeDateTime]    DATETIME2 (7)     NOT NULL,
    [CrimeDescription] NVARCHAR (500)    NOT NULL,
    [IDNumber]         CHAR (13)         NOT NULL,
    [CrimeTypeID]      INT               NOT NULL,
    PRIMARY KEY CLUSTERED ([CrimeReportID] ASC)
);


GO
PRINT N'Creating Table [dbo].[CrimeReportImage]...';


GO
CREATE TABLE [dbo].[CrimeReportImage] (
    [FileLocation]  NVARCHAR (256) NOT NULL,
    [CrimeReportID] INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([FileLocation] ASC)
);


GO
PRINT N'Creating Table [dbo].[CrimeReportSuspect]...';


GO
CREATE TABLE [dbo].[CrimeReportSuspect] (
    [CrimeReportID] INT NOT NULL,
    [SuspectID]     INT NOT NULL,
    PRIMARY KEY CLUSTERED ([CrimeReportID] ASC, [SuspectID] ASC)
);


GO
PRINT N'Creating Table [dbo].[CrimeType]...';


GO
CREATE TABLE [dbo].[CrimeType] (
    [CrimeTypeID]          INT            NOT NULL,
    [CrimeTypeName]        NVARCHAR (50)  NOT NULL,
    [CrimeTypeDescription] NVARCHAR (250) NOT NULL,
    [CrimeTypeEmoji]       NVARCHAR (1)   NOT NULL,
    PRIMARY KEY CLUSTERED ([CrimeTypeID] ASC)
);


GO
PRINT N'Creating Table [dbo].[Event]...';


GO
CREATE TABLE [dbo].[Event] (
    [EventID]          INT               NOT NULL,
    [EventLocation]    [sys].[geography] NOT NULL,
    [EventStartDate]   DATETIME2 (7)     NOT NULL,
    [EventEndDate]     DATETIME2 (7)     NULL,
    [EventDescription] NVARCHAR (500)    NOT NULL,
    [EventStatus]      BIT               NOT NULL,
    [IDNumber]         CHAR (13)         NOT NULL,
    [EventTypeID]      INT               NOT NULL,
    PRIMARY KEY CLUSTERED ([EventID] ASC)
);


GO
PRINT N'Creating Table [dbo].[EventImage]...';


GO
CREATE TABLE [dbo].[EventImage] (
    [EventID]            INT            NOT NULL,
    [EventImageLocation] NVARCHAR (256) NOT NULL,
    PRIMARY KEY CLUSTERED ([EventImageLocation] ASC)
);


GO
PRINT N'Creating Table [dbo].[EventType]...';


GO
CREATE TABLE [dbo].[EventType] (
    [EventTypeID]         INT            NOT NULL,
    [EventTypeName]       NVARCHAR (50)  NOT NULL,
    [EventTypeDesription] NVARCHAR (250) NOT NULL,
    PRIMARY KEY CLUSTERED ([EventTypeID] ASC)
);


GO
PRINT N'Creating Table [dbo].[EventUpdate]...';


GO
CREATE TABLE [dbo].[EventUpdate] (
    [EventID]           INT           NOT NULL,
    [IDNumber]          CHAR (13)     NOT NULL,
    [Time]              DATETIME2 (7) NOT NULL,
    [EventUpdateStatus] BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([EventID] ASC, [IDNumber] ASC, [Time] ASC)
);


GO
PRINT N'Creating Table [dbo].[Notifications]...';


GO
CREATE TABLE [dbo].[Notifications] (
    [NotificationID] INT            NOT NULL,
    [IDNumber]       CHAR (13)      NOT NULL,
    [Name]           NVARCHAR (50)  NOT NULL,
    [Description]    NVARCHAR (250) NOT NULL,
    PRIMARY KEY CLUSTERED ([NotificationID] ASC)
);


GO
PRINT N'Creating Table [dbo].[Suspect]...';


GO
CREATE TABLE [dbo].[Suspect] (
    [SuspectID]              INT            NOT NULL,
    [SuspectImageLocation]   NVARCHAR (256) NOT NULL,
    [SuspectSex]             BIT            NOT NULL,
    [SuspectRace]            NVARCHAR (50)  NOT NULL,
    [SuspectHairColour]      NVARCHAR (50)  NOT NULL,
    [SuspectHeight]          SMALLINT       NOT NULL,
    [SuspectAge]             TINYINT        NOT NULL,
    [SuspectBitmojiLocation] NVARCHAR (256) NOT NULL,
    [DistrinctFeatures]      NVARCHAR (500) NOT NULL,
    PRIMARY KEY CLUSTERED ([SuspectID] ASC)
);


GO
PRINT N'Creating Table [dbo].[User]...';


GO
CREATE TABLE [dbo].[User] (
    [IDNumber]        CHAR (13)         NOT NULL,
    [CellPhoneNumber] CHAR (10)         NOT NULL,
    [Password]        NVARCHAR (100)    NOT NULL,
    [HomeLocation]    [sys].[geography] NULL,
    [FirstName]       NVARCHAR (25)     NULL,
    [LastName]        NVARCHAR (25)     NULL,
    [EmailAdress]     NVARCHAR (320)    NOT NULL,
    [IsVerified]      BIT               NOT NULL,
    [IsBanned]        BIT               NOT NULL,
    [AdminRights]     BIT               NOT NULL,
    PRIMARY KEY CLUSTERED ([IDNumber] ASC)
);


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Event]...';


GO
ALTER TABLE [dbo].[Event]
    ADD DEFAULT 1 FOR [EventStatus];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[User]...';


GO
ALTER TABLE [dbo].[User]
    ADD DEFAULT 0 FOR [IsVerified];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[User]...';


GO
ALTER TABLE [dbo].[User]
    ADD DEFAULT 0 FOR [IsBanned];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[User]...';


GO
ALTER TABLE [dbo].[User]
    ADD DEFAULT 0 FOR [AdminRights];


GO
PRINT N'Creating Foreign Key unnamed constraint on [dbo].[CrimeReport]...';


GO
ALTER TABLE [dbo].[CrimeReport]
    ADD FOREIGN KEY ([IDNumber]) REFERENCES [dbo].[User] ([IDNumber]);


GO
PRINT N'Creating Foreign Key unnamed constraint on [dbo].[CrimeReport]...';


GO
ALTER TABLE [dbo].[CrimeReport]
    ADD FOREIGN KEY ([CrimeTypeID]) REFERENCES [dbo].[CrimeType] ([CrimeTypeID]);


GO
PRINT N'Creating Foreign Key unnamed constraint on [dbo].[CrimeReportImage]...';


GO
ALTER TABLE [dbo].[CrimeReportImage]
    ADD FOREIGN KEY ([CrimeReportID]) REFERENCES [dbo].[CrimeReport] ([CrimeReportID]);


GO
PRINT N'Creating Foreign Key unnamed constraint on [dbo].[CrimeReportSuspect]...';


GO
ALTER TABLE [dbo].[CrimeReportSuspect]
    ADD FOREIGN KEY ([CrimeReportID]) REFERENCES [dbo].[CrimeReport] ([CrimeReportID]);


GO
PRINT N'Creating Foreign Key unnamed constraint on [dbo].[CrimeReportSuspect]...';


GO
ALTER TABLE [dbo].[CrimeReportSuspect]
    ADD FOREIGN KEY ([SuspectID]) REFERENCES [dbo].[Suspect] ([SuspectID]);


GO
PRINT N'Creating Foreign Key unnamed constraint on [dbo].[Event]...';


GO
ALTER TABLE [dbo].[Event]
    ADD FOREIGN KEY ([IDNumber]) REFERENCES [dbo].[User] ([IDNumber]);


GO
PRINT N'Creating Foreign Key unnamed constraint on [dbo].[Event]...';


GO
ALTER TABLE [dbo].[Event]
    ADD FOREIGN KEY ([EventTypeID]) REFERENCES [dbo].[EventType] ([EventTypeID]);


GO
PRINT N'Creating Foreign Key unnamed constraint on [dbo].[EventImage]...';


GO
ALTER TABLE [dbo].[EventImage]
    ADD FOREIGN KEY ([EventID]) REFERENCES [dbo].[Event] ([EventID]);


GO
PRINT N'Creating Foreign Key unnamed constraint on [dbo].[EventUpdate]...';


GO
ALTER TABLE [dbo].[EventUpdate]
    ADD FOREIGN KEY ([EventID]) REFERENCES [dbo].[Event] ([EventID]);


GO
PRINT N'Creating Foreign Key unnamed constraint on [dbo].[EventUpdate]...';


GO
ALTER TABLE [dbo].[EventUpdate]
    ADD FOREIGN KEY ([IDNumber]) REFERENCES [dbo].[User] ([IDNumber]);


GO
PRINT N'Creating Foreign Key unnamed constraint on [dbo].[Notifications]...';


GO
ALTER TABLE [dbo].[Notifications]
    ADD FOREIGN KEY ([IDNumber]) REFERENCES [dbo].[User] ([IDNumber]);


GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '6d85be16-71d0-498d-b2fc-150873a5f081')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('6d85be16-71d0-498d-b2fc-150873a5f081')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '8b4fcfa4-c9ba-4842-b01c-487ed4e0b393')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('8b4fcfa4-c9ba-4842-b01c-487ed4e0b393')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'c2f377e8-eb84-42ac-b15f-7a1aedd75f89')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('c2f377e8-eb84-42ac-b15f-7a1aedd75f89')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'b7370032-b146-437b-a3c1-ad86c32a7ed3')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('b7370032-b146-437b-a3c1-ad86c32a7ed3')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '58414709-44a3-48f5-970b-29b3c8bf5a5d')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('58414709-44a3-48f5-970b-29b3c8bf5a5d')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '741cb61f-5760-438e-95dd-fd4f9a925a1d')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('741cb61f-5760-438e-95dd-fd4f9a925a1d')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'f28c8108-4314-4a39-b358-0b373ea05761')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('f28c8108-4314-4a39-b358-0b373ea05761')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'd19dea14-dc55-468b-be44-acc9fced414c')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('d19dea14-dc55-468b-be44-acc9fced414c')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '23d171f7-e2b9-4911-a6ef-e43c28b0cc9a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('23d171f7-e2b9-4911-a6ef-e43c28b0cc9a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'd9a734b1-f9c1-43a9-91a4-441c05979b27')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('d9a734b1-f9c1-43a9-91a4-441c05979b27')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'faa8a04b-d4e3-4671-bffe-66662c61cdf6')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('faa8a04b-d4e3-4671-bffe-66662c61cdf6')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '0a5bc7eb-8c12-4259-9b91-30964ad27108')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('0a5bc7eb-8c12-4259-9b91-30964ad27108')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '44d73b36-5ae7-4dee-beaa-1c1340f91b0c')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('44d73b36-5ae7-4dee-beaa-1c1340f91b0c')

GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO
