USE [CnmPro]
GO
/****** Object:  StoredProcedure [dbo].[Surveys_SelectAll]    Script Date: 8/31/2022 9:13:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Allen Luong C-119>
-- Create date: <8/24/2022>
-- Description:	<SELECT_ALL for dbo.Surveys>
-- Code Reviewer:


-- MODIFIED BY: author
-- MODIFIED DATE:12/1/2020
-- Code Reviewer: 
-- Note: 
-- =============================================

CREATE proc [dbo].[Surveys_SelectAll]
		@PageIndex int
		,@PageSize int

as

/* ----TEST CODE----
Declare		
		@PageIndex int = 0
		,@PageSize int = 10

Execute dbo.Surveys_SelectAll

		@PageIndex 
		,@PageSize 

*/

BEGIN

Declare @offset int = @PageIndex * @Pagesize

SELECT s.[Id]
      ,s.[Name]
      ,[Description]
	  ,st.Id
      ,st.[Name]
	  ,sty.Id
      ,sty.[Name]
      ,s.[CreatedBy]
      ,s.[DateCreated]
      ,s.[DateModified]
	  ,TotalCount = COUNT(1) OVER()  
FROM [dbo].[Surveys] as s inner join dbo.SurveyStatus as st
on st.Id = s.StatusId
inner join dbo.SurveyTypes as sty
on sty.id = s.SurveyTypeId

    ORDER BY	s.Id
				OFFSET @offset Rows
	Fetch Next	@PageSize Rows ONLY

END


GO
