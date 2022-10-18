CREATE TABLE [dbo].[SDE_locators] (
    [locator_id]  INT           NOT NULL,
    [name]        NVARCHAR (32) NOT NULL,
    [owner]       NVARCHAR (32) NOT NULL,
    [category]    NVARCHAR (32) NOT NULL,
    [type]        INT           NOT NULL,
    [description] NVARCHAR (64) NULL,
    CONSTRAINT [sdelocators_pk] PRIMARY KEY CLUSTERED ([locator_id] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [sdelocators_uk] UNIQUE NONCLUSTERED ([name] ASC, [owner] ASC) WITH (FILLFACTOR = 75)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_locators] TO PUBLIC
    AS [dbo];

