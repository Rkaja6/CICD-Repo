CREATE TABLE [dbo].[SDE_process_information] (
    [sde_id]         INT            NOT NULL,
    [spid]           INT            NOT NULL,
    [server_id]      INT            NOT NULL,
    [start_time]     DATETIME       NOT NULL,
    [rcount]         INT            NOT NULL,
    [wcount]         INT            NOT NULL,
    [opcount]        INT            NOT NULL,
    [numlocks]       INT            NOT NULL,
    [fb_partial]     INT            NOT NULL,
    [fb_count]       INT            NOT NULL,
    [fb_fcount]      INT            NOT NULL,
    [fb_kbytes]      INT            NOT NULL,
    [owner]          NVARCHAR (30)  NOT NULL,
    [direct_connect] VARCHAR (1)    NOT NULL,
    [sysname]        NVARCHAR (32)  NOT NULL,
    [nodename]       NVARCHAR (256) NOT NULL,
    [xdr_needed]     VARCHAR (1)    NOT NULL,
    [table_name]     NVARCHAR (95)  NOT NULL,
    CONSTRAINT [process_pk] PRIMARY KEY CLUSTERED ([sde_id] ASC) WITH (FILLFACTOR = 75)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_process_information] TO PUBLIC
    AS [dbo];

