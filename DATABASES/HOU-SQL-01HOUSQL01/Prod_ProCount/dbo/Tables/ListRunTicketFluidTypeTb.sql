CREATE TABLE [dbo].[ListRunTicketFluidTypeTb] (
    [MerrickID]  INT          NOT NULL,
    [Name]       VARCHAR (40) NOT NULL,
    [ActiveFlag] INT          NULL,
    CONSTRAINT [PK_ListRunTicketFluidTypeTb] PRIMARY KEY CLUSTERED ([MerrickID] ASC)
);

