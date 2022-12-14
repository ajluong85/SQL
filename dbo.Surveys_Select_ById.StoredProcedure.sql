USE [CnmPro]
GO
/****** Object:  StoredProcedure [dbo].[Surveys_Select_ById]    Script Date: 8/31/2022 9:13:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Allen Luong C-119>
-- Create date: <8/24/2022>
-- Description:	<SELECT_BYID for dbo.Surveys>
-- Code Reviewer:


-- MODIFIED BY: author
-- MODIFIED DATE:12/1/2020
-- Code Reviewer: 
-- Note: 
-- =============================================



CREATE Proc [dbo].[Surveys_Select_ById]

	@Id int

as

/* ----TEST CODE----
Declare @Id int = 1

Execute dbo.Surveys_Select_ById

@Id

*/

BEGIN

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
 
FROM [dbo].[Surveys] as s inner join dbo.SurveyStatus as st
on st.Id = s.StatusId
inner join dbo.SurveyTypes as sty
on sty.id = s.SurveyTypeId

Where s.Id = @Id

END


GO
