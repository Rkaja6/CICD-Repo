CREATE TABLE [dbo].[DeletedJobs] (
    [deletedjobs_id] INT    IDENTITY (1, 1) NOT NULL,
    [job_number]     BIGINT NOT NULL,
    CONSTRAINT [PK_DeletedJobs] PRIMARY KEY CLUSTERED ([deletedjobs_id] ASC)
);

