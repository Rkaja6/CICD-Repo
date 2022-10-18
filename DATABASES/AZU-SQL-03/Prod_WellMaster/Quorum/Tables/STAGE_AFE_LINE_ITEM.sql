﻿CREATE TABLE [Quorum].[STAGE_AFE_LINE_ITEM] (
    [Id]                                 VARCHAR (255)  NULL,
    [Sys_Archive]                        VARCHAR (255)  NULL,
    [Archive]                            VARCHAR (255)  NULL,
    [AccrualCalculationDate]             VARCHAR (255)  NULL,
    [AfenumberDoc_Afenumber]             VARCHAR (255)  NULL,
    [ApprovedGrossEstimate]              VARCHAR (255)  NULL,
    [ApprovedNetEstimate]                VARCHAR (255)  NULL,
    [ApprovedProjects]                   VARCHAR (255)  NULL,
    [BaseCreationDate]                   VARCHAR (255)  NULL,
    [BaseCreationDateDays]               VARCHAR (255)  NULL,
    [BudgetGroup]                        VARCHAR (255)  NULL,
    [BudgetGroupId]                      VARCHAR (255)  NULL,
    [BudgetGroupNum]                     VARCHAR (255)  NULL,
    [BudgetManager]                      VARCHAR (255)  NULL,
    [BudgetManager_Name]                 VARCHAR (255)  NULL,
    [BudgetManager_Userdescription]      VARCHAR (255)  NULL,
    [BudgetManager_Email]                VARCHAR (255)  NULL,
    [BudgetYear]                         VARCHAR (255)  NULL,
    [Carryover]                          VARCHAR (255)  NULL,
    [ChainVersion]                       VARCHAR (255)  NULL,
    [Closed]                             VARCHAR (255)  NULL,
    [ClosedDate]                         VARCHAR (255)  NULL,
    [ClosedReason]                       VARCHAR (255)  NULL,
    [ClosedUser]                         VARCHAR (255)  NULL,
    [ClosedUser_Name]                    VARCHAR (255)  NULL,
    [ClosedUser_Userdescription]         VARCHAR (255)  NULL,
    [ClosedUser_Email]                   VARCHAR (255)  NULL,
    [Completed]                          VARCHAR (255)  NULL,
    [CorrNumber]                         VARCHAR (255)  NULL,
    [CreationDate]                       VARCHAR (255)  NULL,
    [CreationDateDays]                   VARCHAR (255)  NULL,
    [Creator]                            VARCHAR (255)  NULL,
    [Creator_Name]                       VARCHAR (255)  NULL,
    [Creator_Userdescription]            VARCHAR (255)  NULL,
    [Creator_Email]                      VARCHAR (255)  NULL,
    [CurrencyCode]                       VARCHAR (255)  NULL,
    [Custom_AdValoremM]                  VARCHAR (255)  NULL,
    [Custom_AfeType]                     VARCHAR (255)  NULL,
    [Custom_AfeType_Value]               VARCHAR (255)  NULL,
    [Custom_AfeType_OtherValue1]         VARCHAR (255)  NULL,
    [Custom_AfeType_OtherValue2]         VARCHAR (255)  NULL,
    [Custom_Area]                        VARCHAR (255)  NULL,
    [Custom_Area_Description]            VARCHAR (255)  NULL,
    [Custom_AriesPropnum]                VARCHAR (255)  NULL,
    [Custom_B]                           VARCHAR (255)  NULL,
    [Custom_Basin]                       VARCHAR (255)  NULL,
    [Custom_Basin_Description]           VARCHAR (255)  NULL,
    [Custom_CasingDesign]                VARCHAR (255)  NULL,
    [Custom_ClusterSpacing]              VARCHAR (255)  NULL,
    [Custom_Comments]                    VARCHAR (255)  NULL,
    [Custom_CompletionComments]          VARCHAR (255)  NULL,
    [Custom_CompletionsCapexMm]          VARCHAR (255)  NULL,
    [Custom_CostCenter]                  VARCHAR (255)  NULL,
    [Custom_CostCenter_Description]      VARCHAR (255)  NULL,
    [Custom_CountryState]                VARCHAR (255)  NULL,
    [Custom_CountryState_Description]    VARCHAR (255)  NULL,
    [Custom_CriticalDate]                VARCHAR (255)  NULL,
    [Custom_CriticalReason]              VARCHAR (255)  NULL,
    [Custom_De]                          VARCHAR (255)  NULL,
    [Custom_Details]                     VARCHAR (255)  NULL,
    [Custom_Di]                          VARCHAR (255)  NULL,
    [Custom_DrillingCapexMm]             VARCHAR (255)  NULL,
    [Custom_DrillingComments]            VARCHAR (255)  NULL,
    [Custom_EstimatedDatsCompl]          VARCHAR (255)  NULL,
    [Custom_EstimatedDaysDrill]          VARCHAR (255)  NULL,
    [Custom_EstimatedFirstProd]          VARCHAR (255)  NULL,
    [Custom_EstimatedFracDate]           VARCHAR (255)  NULL,
    [Custom_EstimatedSpudDate]           VARCHAR (255)  NULL,
    [Custom_EurftMmcfkft]                VARCHAR (255)  NULL,
    [Custom_EurftRiskedMmcfkft]          VARCHAR (255)  NULL,
    [Custom_ExpectedLogSuite]            VARCHAR (255)  NULL,
    [Custom_ExpectedTopBossier]          VARCHAR (255)  NULL,
    [Custom_ExpectedTopHaynesv]          VARCHAR (255)  NULL,
    [Custom_ExpectedTopMidBos]           VARCHAR (255)  NULL,
    [Custom_FacilitiesCapexmm]           VARCHAR (255)  NULL,
    [Custom_FixedOpexM]                  VARCHAR (255)  NULL,
    [Custom_FlatplateauPeriod]           VARCHAR (255)  NULL,
    [Custom_FluidIntensityBbls]          VARCHAR (255)  NULL,
    [Custom_GeologyGeophysicsC]          VARCHAR (255)  NULL,
    [Custom_GisNum]                      VARCHAR (255)  NULL,
    [Custom_GngCost]                     VARCHAR (255)  NULL,
    [Custom_GngType]                     VARCHAR (255)  NULL,
    [Custom_GngType_Description]         VARCHAR (255)  NULL,
    [Custom_IpMmcf]                      VARCHAR (255)  NULL,
    [Custom_Irr]                         VARCHAR (255)  NULL,
    [Custom_LandComments]                VARCHAR (255)  NULL,
    [Custom_LateralLength]               VARCHAR (255)  NULL,
    [Custom_LegalDescription]            VARCHAR (255)  NULL,
    [Custom_MeasuredDepth]               VARCHAR (255)  NULL,
    [Custom_MudLogging]                  VARCHAR (255)  NULL,
    [Custom_NetReservesBcf_2]            VARCHAR (255)  NULL,
    [Custom_NetRevenueInterest]          VARCHAR (255)  NULL,
    [Custom_OpenHoleLogs]                VARCHAR (255)  NULL,
    [Custom_OperatorStatus]              VARCHAR (255)  NULL,
    [Custom_OperatorStatus_Value]        VARCHAR (255)  NULL,
    [Custom_Parish]                      VARCHAR (255)  NULL,
    [Custom_Parish_Description]          VARCHAR (255)  NULL,
    [Custom_PerforationsPerSta]          VARCHAR (255)  NULL,
    [Custom_PilotHole]                   VARCHAR (255)  NULL,
    [Custom_PriceDeck]                   VARCHAR (255)  NULL,
    [Custom_ProppantIntensityF]          VARCHAR (255)  NULL,
    [Custom_ProspectName]                VARCHAR (255)  NULL,
    [Custom_Pv10]                        VARCHAR (255)  NULL,
    [Custom_RateBpm]                     VARCHAR (255)  NULL,
    [Custom_Rig]                         VARCHAR (255)  NULL,
    [Custom_SeveranceMcf]                VARCHAR (255)  NULL,
    [Custom_StageSpacing]                VARCHAR (255)  NULL,
    [Custom_TargetInterval]              VARCHAR (255)  NULL,
    [Custom_TargetInterval_Description]  VARCHAR (255)  NULL,
    [Custom_TotalCompletionsCo]          VARCHAR (255)  NULL,
    [Custom_TotalDrillingCost]           VARCHAR (255)  NULL,
    [Custom_TypeCurveArea]               VARCHAR (255)  NULL,
    [Custom_VariableOpexMcf]             VARCHAR (255)  NULL,
    [Custom_Vendor]                      VARCHAR (255)  NULL,
    [Custom_WellSiteName]                VARCHAR (255)  NULL,
    [Custom_WellSiteName_Name]           VARCHAR (255)  NULL,
    [Custom_WellSiteName_SurfaceUwi]     VARCHAR (255)  NULL,
    [Custom_WellSiteName_BottomHoleUwi]  VARCHAR (255)  NULL,
    [Custom_WellSiteName_WellNumber]     VARCHAR (255)  NULL,
    [Custom_WellsPerPad]                 VARCHAR (255)  NULL,
    [Custom_WorkDescr]                   VARCHAR (8000) NULL,
    [Custom_WorkingInterest]             VARCHAR (255)  NULL,
    [Description]                        VARCHAR (255)  NULL,
    [DocumentId]                         VARCHAR (255)  NULL,
    [EndDate]                            VARCHAR (255)  NULL,
    [EstimateConversionDate]             VARCHAR (255)  NULL,
    [ExternalJustification]              VARCHAR (255)  NULL,
    [FullApprovalDate]                   VARCHAR (255)  NULL,
    [GrossAccrual]                       VARCHAR (255)  NULL,
    [GrossVarianceActuals]               VARCHAR (255)  NULL,
    [GrossVarianceFieldcosts]            VARCHAR (255)  NULL,
    [HasProject]                         VARCHAR (255)  NULL,
    [HoldComment]                        VARCHAR (255)  NULL,
    [HoldDate]                           VARCHAR (255)  NULL,
    [HoldPosition]                       VARCHAR (255)  NULL,
    [HoldPosition_PositionName]          VARCHAR (255)  NULL,
    [HoldPosition_DocumentType]          VARCHAR (255)  NULL,
    [HoldPosition_RuleType]              VARCHAR (255)  NULL,
    [HoldUser]                           VARCHAR (255)  NULL,
    [HoldUser_Name]                      VARCHAR (255)  NULL,
    [HoldUser_Userdescription]           VARCHAR (255)  NULL,
    [HoldUser_Email]                     VARCHAR (255)  NULL,
    [InternalApprovalDate]               VARCHAR (255)  NULL,
    [InternalJustification]              VARCHAR (255)  NULL,
    [LatestApprovalDate]                 VARCHAR (255)  NULL,
    [LegacyAfeid]                        VARCHAR (255)  NULL,
    [LegacyChainid]                      VARCHAR (255)  NULL,
    [Mailballot_DeemedApprovedDate]      VARCHAR (255)  NULL,
    [Mailballot_GoverningAgreements]     VARCHAR (255)  NULL,
    [Mailballot_IsMailballot]            VARCHAR (255)  NULL,
    [Mailballot_MailBallotMotion]        VARCHAR (255)  NULL,
    [Mailballot_MailBallotNumber]        VARCHAR (255)  NULL,
    [Mailballot_MinimumCost]             VARCHAR (255)  NULL,
    [Mailballot_PartnersToPass]          VARCHAR (255)  NULL,
    [Mailballot_PartnersToReject]        VARCHAR (255)  NULL,
    [Mailballot_WiToPass]                VARCHAR (255)  NULL,
    [NetAccrual]                         VARCHAR (255)  NULL,
    [NetVarianceActuals]                 VARCHAR (255)  NULL,
    [NetVarianceFieldcosts]              VARCHAR (255)  NULL,
    [NextApprovingPositions]             VARCHAR (255)  NULL,
    [NextReviewingPositions]             VARCHAR (255)  NULL,
    [OpNotice]                           VARCHAR (255)  NULL,
    [OperatingCompany]                   VARCHAR (255)  NULL,
    [OperatingCompany_Comname]           VARCHAR (255)  NULL,
    [OperatingCompany_Code]              VARCHAR (255)  NULL,
    [OperatorWi]                         VARCHAR (255)  NULL,
    [OurWi]                              VARCHAR (255)  NULL,
    [OutsideAfenumber]                   VARCHAR (255)  NULL,
    [Owner]                              VARCHAR (255)  NULL,
    [Owner_Name]                         VARCHAR (255)  NULL,
    [Owner_Userdescription]              VARCHAR (255)  NULL,
    [Owner_Email]                        VARCHAR (255)  NULL,
    [ParentCompany]                      VARCHAR (255)  NULL,
    [ParentCompany_Comname]              VARCHAR (255)  NULL,
    [ParentCompany_Code]                 VARCHAR (255)  NULL,
    [ParentRtx]                          VARCHAR (255)  NULL,
    [ParentRtx_RtxNumber]                VARCHAR (255)  NULL,
    [ParentRtx_Description]              VARCHAR (255)  NULL,
    [PrimaryWell_Description]            VARCHAR (255)  NULL,
    [PrimaryWell_SurfaceLocationUwi]     VARCHAR (255)  NULL,
    [PrimaryWell_Uwi]                    VARCHAR (255)  NULL,
    [ProjectCapital]                     VARCHAR (255)  NULL,
    [RejectComment]                      VARCHAR (255)  NULL,
    [RejectDate]                         VARCHAR (255)  NULL,
    [RejectPosition]                     VARCHAR (255)  NULL,
    [RejectPosition_PositionName]        VARCHAR (255)  NULL,
    [RejectPosition_DocumentType]        VARCHAR (255)  NULL,
    [RejectPosition_RuleType]            VARCHAR (255)  NULL,
    [RejectUser]                         VARCHAR (255)  NULL,
    [RejectUser_Name]                    VARCHAR (255)  NULL,
    [RejectUser_Userdescription]         VARCHAR (255)  NULL,
    [RejectUser_Email]                   VARCHAR (255)  NULL,
    [ReleaseComment]                     VARCHAR (255)  NULL,
    [ReleaseUser]                        VARCHAR (255)  NULL,
    [ReleaseUser_Name]                   VARCHAR (255)  NULL,
    [ReleaseUser_Userdescription]        VARCHAR (255)  NULL,
    [ReleaseUser_Email]                  VARCHAR (255)  NULL,
    [ReleasedDate]                       VARCHAR (255)  NULL,
    [RequiredByDate]                     VARCHAR (255)  NULL,
    [RevNumber]                          VARCHAR (255)  NULL,
    [RevSupMode]                         VARCHAR (255)  NULL,
    [ReviewCompletedDate]                VARCHAR (255)  NULL,
    [RoutedComment]                      VARCHAR (255)  NULL,
    [RoutedDate]                         VARCHAR (255)  NULL,
    [RoutedUser]                         VARCHAR (255)  NULL,
    [RoutedUser_Name]                    VARCHAR (255)  NULL,
    [RoutedUser_Userdescription]         VARCHAR (255)  NULL,
    [RoutedUser_Email]                   VARCHAR (255)  NULL,
    [SilentPartnerMode]                  VARCHAR (255)  NULL,
    [SilentPartnerMode_Name]             VARCHAR (255)  NULL,
    [StartDate]                          VARCHAR (255)  NULL,
    [Status]                             VARCHAR (255)  NULL,
    [StatusDesc]                         VARCHAR (255)  NULL,
    [SupNumber]                          VARCHAR (255)  NULL,
    [SupersededDate]                     VARCHAR (255)  NULL,
    [SupersededStatus]                   VARCHAR (255)  NULL,
    [SupersededStatusDesc]               VARCHAR (255)  NULL,
    [SupplementalGrossEstimate]          VARCHAR (255)  NULL,
    [SupplementalNetEstimate]            VARCHAR (255)  NULL,
    [TotalGrossActual]                   VARCHAR (255)  NULL,
    [TotalGrossEstimate]                 VARCHAR (255)  NULL,
    [TotalGrossFieldcost]                VARCHAR (255)  NULL,
    [TotalNetActual]                     VARCHAR (255)  NULL,
    [TotalNetEstimate]                   VARCHAR (255)  NULL,
    [TotalNetFieldcost]                  VARCHAR (255)  NULL,
    [UpdatedProjEst]                     VARCHAR (255)  NULL,
    [UpdatedProjEstFc]                   VARCHAR (255)  NULL,
    [VersionString]                      VARCHAR (255)  NULL,
    [WellListTitle]                      VARCHAR (255)  NULL,
    [WellReportingIdentifier]            VARCHAR (255)  NULL,
    [WiDetails_CapCount]                 VARCHAR (255)  NULL,
    [WiDetails_Cap1Amount]               VARCHAR (255)  NULL,
    [WiDetails_Cap1Description]          VARCHAR (255)  NULL,
    [WiDetails_Cap10Amount]              VARCHAR (255)  NULL,
    [WiDetails_Cap10Description]         VARCHAR (255)  NULL,
    [WiDetails_Cap2Amount]               VARCHAR (255)  NULL,
    [WiDetails_Cap2Description]          VARCHAR (255)  NULL,
    [WiDetails_Cap3Amount]               VARCHAR (255)  NULL,
    [WiDetails_Cap3Description]          VARCHAR (255)  NULL,
    [WiDetails_Cap4Amount]               VARCHAR (255)  NULL,
    [WiDetails_Cap4Description]          VARCHAR (255)  NULL,
    [WiDetails_Cap5Amount]               VARCHAR (255)  NULL,
    [WiDetails_Cap5Description]          VARCHAR (255)  NULL,
    [WiDetails_Cap6Amount]               VARCHAR (255)  NULL,
    [WiDetails_Cap6Description]          VARCHAR (255)  NULL,
    [WiDetails_Cap7Amount]               VARCHAR (255)  NULL,
    [WiDetails_Cap7Description]          VARCHAR (255)  NULL,
    [WiDetails_Cap8Amount]               VARCHAR (255)  NULL,
    [WiDetails_Cap8Description]          VARCHAR (255)  NULL,
    [WiDetails_Cap9Amount]               VARCHAR (255)  NULL,
    [WiDetails_Cap9Description]          VARCHAR (255)  NULL,
    [Yearend]                            VARCHAR (255)  NULL,
    [YearendFc]                          VARCHAR (255)  NULL,
    [Child_Account]                      VARCHAR (255)  NULL,
    [Child_AccountNumber]                VARCHAR (255)  NULL,
    [Child_AccountGroup]                 VARCHAR (255)  NULL,
    [Child_AccountDesc]                  VARCHAR (255)  NULL,
    [Child_Phase]                        VARCHAR (255)  NULL,
    [Child_GrossEstimate]                VARCHAR (255)  NULL,
    [Child_GrossActual]                  VARCHAR (255)  NULL,
    [Child_NetActual]                    VARCHAR (255)  NULL,
    [Child_GrossFieldcost]               VARCHAR (255)  NULL,
    [Child_NetFieldcost]                 VARCHAR (255)  NULL,
    [SpendNoEstimate]                    VARCHAR (255)  NULL,
    [IsOperated]                         VARCHAR (255)  NULL,
    [Approvals_Due]                      VARCHAR (255)  NULL,
    [Approvals_Upcoming]                 VARCHAR (255)  NULL,
    [Approvals_Byme]                     VARCHAR (255)  NULL,
    [Reviews_Due]                        VARCHAR (255)  NULL,
    [Reviews_Upcoming]                   VARCHAR (255)  NULL,
    [My_Work]                            VARCHAR (255)  NULL,
    [Reviews_Releasedbefore]             VARCHAR (255)  NULL,
    [Reviews_Delegated]                  VARCHAR (255)  NULL,
    [Reviews_Byme]                       VARCHAR (255)  NULL,
    [All_Open]                           VARCHAR (255)  NULL,
    [My_Afes]                            VARCHAR (255)  NULL,
    [My_Reviewcomplete]                  VARCHAR (255)  NULL,
    [DelegatedToMe]                      VARCHAR (255)  NULL,
    [Latestcomment]                      VARCHAR (255)  NULL,
    [FieldcostComment]                   VARCHAR (255)  NULL,
    [FlagGreen]                          VARCHAR (255)  NULL,
    [FlagRed]                            VARCHAR (255)  NULL,
    [FlagYellow]                         VARCHAR (255)  NULL,
    [FlagWatch]                          VARCHAR (255)  NULL,
    [FlagTemplate]                       VARCHAR (255)  NULL,
    [FlagReviewTemplate]                 VARCHAR (255)  NULL,
    [Sys_LastModifiedDate]               VARCHAR (255)  NULL,
    [Sys_LastModifiedUser]               VARCHAR (255)  NULL,
    [Child_NetEstimate]                  VARCHAR (255)  NULL,
    [Child_SupplementalGrossNetEstimate] VARCHAR (255)  NULL,
    [Child_SupplementalNetEstimate]      VARCHAR (255)  NULL,
    [Child_ApprovedGrossEstimate]        VARCHAR (255)  NULL,
    [Child_ApprovedNetEstimate]          VARCHAR (255)  NULL,
    [Child_SupplementalGrossEstimate]    VARCHAR (255)  NULL
);

