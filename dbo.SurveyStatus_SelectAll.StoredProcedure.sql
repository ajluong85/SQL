USE [CnmPro]
GO
/****** Object:  StoredProcedure [dbo].[SurveyStatus_SelectAll]    Script Date: 8/31/2022 9:13:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Allen Luong>
-- Create date: <8/25/2022>
-- Description: <SelectAll(Paginated) for dbo.SurveyStatus>
-- Code Reviewer:

-- MODIFIED BY: author
-- MODIFIED DATE:12/1/2020
-- Code Reviewer:
-- Note:
-- ==============================================
CREATE proc [dbo].[SurveyStatus_SelectAll]
				 @PageIndex int
				,@PageSize int


as

/*

Declare
				 @PageIndex int = 0
				,@PageSize int = 4

Execute dbo.SurveyStatus_SelectAll

				 @PageIndex
				,@PageSize

Select *
From dbo.SurveyStatus

*/
BEGIN 

Declare @offset int = @PageIndex * @Pagesize

SELECT 
			 [Id]
			,[Name]
			,TotalCount = COUNT(1) OVER()
	FROM [dbo].[SurveyStatus]
	Order BY Id

  	OFFSET @offset Rows
	Fetch Next @PageSize Rows ONLY


END


GO
