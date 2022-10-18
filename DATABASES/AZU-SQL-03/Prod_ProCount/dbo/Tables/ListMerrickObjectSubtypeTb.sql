CREATE TABLE [dbo].[ListMerrickObjectSubtypeTb] (
    [ObjectSubtypeID] INT           NOT NULL,
    [ObjectTypeID]    INT           NOT NULL,
    [Description]     VARCHAR (100) NULL,
    [TableID]         INT           NULL,
    [ActiveFlag]      INT           NULL,
    CONSTRAINT [PK_ListMerrickObjectSubtypeTb] PRIMARY KEY CLUSTERED ([ObjectSubtypeID] ASC, [ObjectTypeID] ASC)
);

