CREATE FULLTEXT INDEX ON [dbo].[Combined_Indexed]
    ([Job Title] LANGUAGE 1033, [UID] LANGUAGE 1033)
    KEY INDEX [ndx_Combined_Indexed_Unique_Index]
    ON [FullTextCatalog];

