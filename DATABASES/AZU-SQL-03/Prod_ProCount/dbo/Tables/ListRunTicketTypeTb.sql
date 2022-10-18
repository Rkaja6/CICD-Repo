CREATE TABLE [dbo].[ListRunTicketTypeTb] (
    [MerrickID]  INT          NOT NULL,
    [Name]       VARCHAR (40) NOT NULL,
    [ActiveFlag] INT          NULL,
    CONSTRAINT [PK_ListRunTicketTypeTb] PRIMARY KEY CLUSTERED ([MerrickID] ASC)
);

