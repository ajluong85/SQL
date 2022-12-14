USE [CnmPro]
GO
/****** Object:  StoredProcedure [dbo].[Surveys_Update]    Script Date: 8/31/2022 9:13:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Allen Luong C-119>
-- Create date: <8/24/2022>
-- Description:	<UPDATE for dbo.Surveys>
-- Code Reviewer:


-- MODIFIED BY: author
-- MODIFIED DATE:12/1/2020
-- Code Reviewer: 
-- Note: 
-- =============================================


CREATE proc [dbo].[Surveys_Update]
	   @Name nvarchar(100)
      ,@Description nvarchar(2000)
      ,@StatusId int
      ,@SurveyTypeId int
      ,@CreatedBy int
	  ,@Id int
as

/* ----TEST CODE----
Declare @Id int = 2

Declare
		 @Name nvarchar(100) = 'Updating a Survey'
		,@Description nvarchar(2000) = 'Survey Update'
		,@StatusId int = 2
		,@SurveyTypeId int = 2
		,@CreatedBy int = 104

EXECUTE dbo.Surveys_Update

	   @Name
      ,@Description 
      ,@StatusId 
      ,@SurveyTypeId 
      ,@CreatedBy 
	  ,@Id 

SELECT *
from dbo.surveys

*/

BEGIN

Declare @DateModified datetime2 = getutcdate();

UPDATE [dbo].[Surveys]
   SET [Name] = @Name
      ,[Description] = @Description
      ,[StatusId] = @StatusId
      ,[SurveyTypeId] = @SurveyTypeId
      ,[CreatedBy] = @CreatedBy
      ,[DateModified] = @DateModified


	WHERE Id = @Id
END

GO
