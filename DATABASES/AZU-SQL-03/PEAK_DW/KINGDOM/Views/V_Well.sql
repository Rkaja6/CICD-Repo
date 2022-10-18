CREATE VIEW KINGDOM.V_Well AS 
select 
	B.Uwi,
	B.AlternateUWI,
	W.Name as WellName,
	W.WellNumber,
	W.SurfaceLocX,
	W.SurfaceLocY,
	W.SurfaceElevation,
	W.KBElevation,
	W.RealKBElevation,
	W.Latitude,
	W.Longitude,
	[ON].Name AS OperatorName,
	OON.Name AS OriginalOperatorName,
	LN.Name AS LeaseName,
	PF.Name AS ProducingFieldName,
	R.Name as ProducingReservoirName,
	BR.Name as BottomDepthReservoirName,
	B.BottomDepth,
	W.TotalDepth AS WellTotalDepth
from [Ark_La_Tx_2].dbo.T_Borehole B
left join [Ark_La_Tx_2].dbo.T_Well W
on B.WellID = W.ID
left join [Ark_La_Tx_2].dbo.T_ProducingField PF
on B.ProducingFieldID = PF.ID
left join [Ark_La_Tx_2].dbo.T_Name [ON]
on B.OperatorNameID  = [ON].ID
left join [Ark_La_Tx_2].dbo.T_Name OON
on B.OriginalOperatorId  = OON.ID
left join [Ark_La_Tx_2].dbo.T_Name LN
on B.LeaseNameID  = LN.ID
left join [Ark_La_Tx_2].dbo.T_ProducingReservoir R
ON B.ProducingFormationID = R.ID
left join [Ark_La_Tx_2].dbo.T_ProducingReservoir BR
ON B.FormationAtBottomDepthID = BR.ID