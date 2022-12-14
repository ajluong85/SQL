USE [CnmPro]
GO
/****** Object:  StoredProcedure [dbo].[SurveyAnswers_Insert]    Script Date: 8/31/2022 9:13:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Allen Luong>
-- Create date: <8/26/2022>
-- Description: <INSERT into dbo.SurveyAnswers>
-- Code Reviewer:

-- MODIFIED BY: author
-- MODIFIED DATE:12/1/2020
-- Code Reviewer:
-- Note:
-- ==============================================

CREATE proc [dbo].[SurveyAnswers_Insert]
            @InstanceId int
           ,@QuestionId int
           ,@AnswerOptionId int
           ,@Answer nvarchar(500)
           ,@AnswerNumber int
           ,@Id int OUTPUT
as

/* ------ TEST CODE ------

Declare
			@InstanceId int = 1
           ,@QuestionId int = 1
           ,@AnswerOptionId int = 2
           ,@Answer nvarchar(500) = 'Test Answer for SurveyAnswers'
           ,@AnswerNumber int = 5
           ,@Id int = 0

Execute dbo.SurveyAnswers_Insert

     
            @InstanceId
           ,@QuestionId
           ,@AnswerOptionId 
           ,@Answer 
           ,@AnswerNumber 
           ,@Id OUTPUT

SELECT *
FROM dbo.SurveyAnswers
*/

BEGIN

INSERT INTO [dbo].[SurveyAnswers]
			(
				[InstanceId]
			   ,[QuestionId]
			   ,[AnswerOptionId]
			   ,[Answer]
			   ,[AnswerNumber]
			)

VALUES
		(
			@InstanceId
           ,@QuestionId
           ,@AnswerOptionId 
           ,@Answer 
           ,@AnswerNumber 
		)
		SET @Id = SCOPE_IDENTITY()

END

GO
