
/******************************
** Name:  vw_BOLO_LOS_GRP_INCL_ACCTS
** Desc:
** Auth:  Aaron Vogt
** Date:  09/10/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/10/2019   Aaron     Object creation
*******************************/
CREATE VIEW [DW].[vw_BOLOLOS_GRP_INCL_ACCTS] AS
Select 
    G.u2_id,
    G.CAT,
    G.DESCRIPTION,
    G.SUB_CAT,
    GC.COMPANIES,
    GCA.ACCTS
from StageBOLO.COA_GRP_CO_ACCTS GCA WITH (NOLOCK)
INNER JOIN StageBOLO.COA_GRP_CO GC WITH (NOLOCK)
    ON GCA.COA_GRP_CO_ID = GC.COA_GRP_CO_ID
INNER JOIN StageBOLO.COA_GRP G WITH (NOLOCK)
    ON G.u2_id = GC.u2_id