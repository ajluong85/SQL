USE [CnmPro]
GO
/****** Object:  StoredProcedure [dbo].[Surveys_Search]    Script Date: 8/31/2022 9:13:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Allen Luong C-119>
-- Create date: <8/24/2022>
-- Description:	<Search for dbo.Surveys>
-- Code Reviewer:


-- MODIFIED BY: author
-- MODIFIED DATE:12/1/2020
-- Code Reviewer: 
-- Note: 
-- =============================================



CREATE Proc [dbo].[Surveys_Search]

					 @PageIndex int
					,@PageSize int
					,@Query nvarchar(200) 

as

/* ----TEST CODE----
Declare 
		 @PageIndex int = 0
		,@PageSize int = 4
		,@Query nvarchar(200) = 'Test'

Execute dbo.Surveys_Search
		 @PageIndex 
		,@PageSize 
		,@Query 

Select * 
FROM dbo.Surveys



*/

BEGIN

Declare @offset int = @PageIndex * @Pagesize

SELECT s.[Id]
      ,s.[Name]
      ,s.[Description]
      ,st.[Id]
      ,st.[Name]
	  ,sty.Id
	  ,sty.Name
      ,s.[CreatedBy]
      ,s.[DateCreated]
      ,s.[DateModified]
	  ,TotalCount = COUNT(1) OVER()  
FROM [dbo].[Surveys] as s inner join dbo.SurveyStatus as st
on st.Id = s.StatusId
inner join dbo.SurveyTypes as sty
on sty.id = s.SurveyTypeId

WHERE s.Name like '%' + @Query + '%'

	ORDER BY s.Name 
	OFFSET @offset ROWS 
	FETCH NEXT @PageSize ROWS ONLY 



END
GO
