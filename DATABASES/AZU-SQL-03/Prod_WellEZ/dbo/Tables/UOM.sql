CREATE TABLE [dbo].[UOM] (
    [uom_id]       INT             IDENTITY (1, 1) NOT NULL,
    [stShift]      DECIMAL (19, 9) NOT NULL,
    [stFactor]     DECIMAL (19, 9) NOT NULL,
    [stCode]       NVARCHAR (MAX)  NOT NULL,
    [factor]       DECIMAL (19, 9) NOT NULL,
    [Shift]        DECIMAL (19, 9) NOT NULL,
    [LookupItemID] BIGINT          NOT NULL,
    [Code]         NVARCHAR (MAX)  NOT NULL,
    CONSTRAINT [PK_UOM] PRIMARY KEY CLUSTERED ([uom_id] ASC)
);

