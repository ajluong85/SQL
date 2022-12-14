USE [CnmPro]
GO
/****** Object:  StoredProcedure [dbo].[Surveys_Insert]    Script Date: 8/31/2022 9:13:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Allen Luong C-119>
-- Create date: <8/24/2022>
-- Description:	<INSERT for dbo.Surveys>
-- Code Reviewer:


-- MODIFIED BY: author
-- MODIFIED DATE:12/1/2020
-- Code Reviewer: 
-- Note: 
-- =============================================


CREATE proc [dbo].[Surveys_Insert]
            @Name nvarchar(100)
           ,@Description nvarchar(2000)
           ,@StatusId int
           ,@SurveyTypeId int
           ,@CreatedBy int
		   ,@Id int OUTPUT

as

/*----TEST CODE----

Declare
            @Name nvarchar(100) = 'Test Survey'
           ,@Description nvarchar(2000) = 'Test Survey Description'
           ,@StatusId int = 1
           ,@SurveyTypeId int = 2
           ,@CreatedBy int = 102
		   ,@Id int = 0

Execute dbo.Surveys_Insert

            @Name
           ,@Description 
           ,@StatusId
           ,@SurveyTypeId
           ,@CreatedBy
		   ,@Id OUTPUT

Select * 
FROM dbo.Surveys


*/

BEGIN

INSERT INTO [dbo].[Surveys]
		(
			 [Name]
			,[Description]
			,[StatusId]
			,[SurveyTypeId]
			,[CreatedBy]
		)

VALUES	
		(
            @Name 
           ,@Description 
           ,@StatusId 
           ,@SurveyTypeId 
           ,@CreatedBy 
		)
		SET @Id = SCOPE_IDENTITY()


END


GO
