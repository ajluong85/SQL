USE [CnmPro]
GO
/****** Object:  StoredProcedure [dbo].[SurveyTypes_SelectAll]    Script Date: 8/31/2022 9:13:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Allen Luong>
-- Create date: <8/25/2022>
-- Description: <SelectALL for dbo.SurveyTypes>
-- Code Reviewer:

-- MODIFIED BY: author
-- MODIFIED DATE:12/1/2020
-- Code Reviewer:
-- Note:
-- =============================================

CREATE proc [dbo].[SurveyTypes_SelectAll]

as

/*

Execute dbo.SurveyTypes_SelectAll

*/
BEGIN

SELECT 
		 [Id]
		,[Name]
  FROM [dbo].[SurveyTypes]

END


GO
