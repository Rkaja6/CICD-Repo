CREATE TABLE [RPT].[TELL_Holidays] (
    [Calendar_Date] DATE         NOT NULL,
    [Holiday_Name]  VARCHAR (50) NULL,
    CONSTRAINT [PK_TELL_Holidays] PRIMARY KEY CLUSTERED ([Calendar_Date] ASC)
);

