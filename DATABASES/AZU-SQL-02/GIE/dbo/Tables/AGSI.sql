CREATE TABLE [dbo].[AGSI] (
    [EICCode]            VARCHAR (100) NULL,
    [status]             VARCHAR (100) NULL,
    [gasDayStartedOn]    VARCHAR (100) NULL,
    [gasInStorage]       VARCHAR (100) NULL,
    [full]               VARCHAR (100) NULL,
    [trend]              VARCHAR (100) NULL,
    [injection]          VARCHAR (100) NULL,
    [withdrawal]         VARCHAR (100) NULL,
    [workingGasVolume]   VARCHAR (100) NULL,
    [injectionCapacity]  VARCHAR (100) NULL,
    [withdrawalCapacity] VARCHAR (100) NULL,
    [info]               VARCHAR (100) NULL,
    [DateCreated]        DATETIME      DEFAULT (getdate()) NULL,
    [DateUpdated]        DATETIME      DEFAULT (getdate()) NULL
);

