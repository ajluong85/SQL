USE [CnmPro]
GO
/****** Object:  StoredProcedure [dbo].[SurveyAnswers_Update]    Script Date: 8/31/2022 9:13:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Allen Luong C-119>
-- Create date: <8/26/2022>
-- Description:	<INSERT for dbo.Surveys>
-- Code Reviewer:


-- MODIFIED BY: author
-- MODIFIED DATE:12/1/2020
-- Code Reviewer: 
-- Note: 
-- =============================================

CREATE proc [dbo].[SurveyAnswers_Update]
		 @InstanceId int
		,@QuestionId int
		,@AnswerOptionId int
		,@Answer nvarchar(500)
		,@AnswerNumber int
		,@Id int

as

/*

Declare @Id int = 1;

Declare
		 @InstanceId int = 3
		,@QuestionId int = 4
		,@AnswerOptionId int = 2
		,@Answer nvarchar(500) = 'An updated answer to surveyanswers'
		,@AnswerNumber int = 3
		
Select * 
From dbo.SurveyAnswers
Where Id = @Id

EXECUTE dbo.SurveyAnswers_Update

		 @InstanceId 
		,@QuestionId 
		,@AnswerOptionId 
		,@Answer 
		,@AnswerNumber 
		,@Id 

Select * 
From dbo.SurveyAnswers
Where Id = @Id

*/

BEGIN

Declare @DateModified datetime2 = getutcdate()

UPDATE [dbo].[SurveyAnswers]
   SET [InstanceId] = @InstanceId
      ,[QuestionId] = @QuestionId
      ,[AnswerOptionId] = @AnswerOptionId
      ,[Answer] = @Answer
      ,[AnswerNumber] = @AnswerNumber
      ,[DateModified] = @DateModified


WHERE Id = @Id


END


GO
