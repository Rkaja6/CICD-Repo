Create view KINGDOM.V_ZoneItems AS
select
	Val.AttrValue,
	Val.DateValue, 
	Val.TextValue,
	Val.Comments,
	Def.Name Attribute_Name,
	Def.FullDescription,
	Def.Unit,
	ZN.Name AS Zone_Name,
	Z.Notes AS Zone_Notes,
	ZI.StartDepth,
	ZI.EndDepth, 
	B.Uwi, 
	W.Name as Well_Name,
	W.WellNumber
from [Ark_La_Tx_2].dbo.[T_ZoneIntervalAV2] Val
INNER JOIN [Ark_La_Tx_2].dbo.[T_ZoneAttribDef2] Def
on Val.ZoneAttribDef2ID = Def.ID
LEFT JOIN [Ark_La_Tx_2].dbo.T_Zone Z
on Val.ZoneID = Z.ID
INNER JOIN [Ark_La_Tx_2].dbo.T_ZoneInterval ZI
on Val.ZoneIntervalID = ZI.ID
INNER JOIN [Ark_La_Tx_2].dbo.T_Borehole B
on ZI.BoreholeID = B.ID
LEFT JOIN [Ark_La_Tx_2].dbo.T_Name ZN
on Z.NameID = ZN.ID
INNER JOIN [Ark_La_Tx_2].dbo.T_Well W
on B.WellID = W.ID