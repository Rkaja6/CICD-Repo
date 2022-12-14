CREATE TABLE [dbo].[DB_TRIG_PROF_UPDT] (
    [DB_TRIG_PROF_UPDT_ID]        VARCHAR (255) NOT NULL,
    [u2_id]                       VARCHAR (255) NULL,
    [UPDATE_TRIGGERS]             VARCHAR (30)  NULL,
    [UPDATE_TRIGGERS_ENABLED]     VARCHAR (7)   NULL,
    [UPDATE_TRIGGER_MODIFY_FLAGS] VARCHAR (7)   NULL,
    [time_stamp]                  DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([DB_TRIG_PROF_UPDT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [DB_TRIG_PROF_UPDT_u2_id_in]
    ON [dbo].[DB_TRIG_PROF_UPDT]([u2_id] ASC);

