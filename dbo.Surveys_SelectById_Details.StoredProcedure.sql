USE [CnmPro]
GO
/****** Object:  StoredProcedure [dbo].[Surveys_SelectById_Details]    Script Date: 8/31/2022 9:13:07 AM ******/
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



CREATE Proc [dbo].[Surveys_SelectById_Details]

	@Id int

as

/* ----TEST CODE----
Declare @Id int = 1

Execute dbo.[Surveys_SelectById_Details]

@Id

select *
from dbo.surveyquestionansweroptions

select *
from dbo.surveyquestions

select *
from dbo.surveys

select *
from dbo.surveyanswers
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
		,Questions =	(
						SELECT	 sq.Question
								,sq.QuestionTypeId
								
						FROM dbo.SurveyQuestions as sq 	
						WHERE sq.Question LIKE '%' + 'Multiple' + '%' AND sq.SurveyId = s.Id


						FOR JSON AUTO
						)
		,QuestionsWithOptions =			
						(										
						SELECT    sq.Question
								, sq.QuestionTypeId
								,AnswerOptions.[Text]
								,AnswerOptions.[Value]
								,AnswerOptions.AdditionalInfo
						FROM dbo.SurveyQuestions as sq  
						inner join dbo.SurveyQuestionAnswerOptions as AnswerOptions
						on sq.Id = AnswerOptions.QuestionId
						WHERE s.Id = sq.SurveyId
						FOR JSON AUTO
						)
		
      ,s.[DateCreated]
      ,s.[DateModified]
 
FROM [dbo].[Surveys] as s 
inner join dbo.SurveyStatus as st
on st.Id = s.StatusId
inner join dbo.SurveyTypes as sty
on sty.id = s.SurveyTypeId

Where s.Id = @Id

END


						--WHERE EXISTS (	SELECT 1 
						--				FROM dbo.SurveyQuestions as sq
						--				WHERE (	sq.QuestionTypeId = 1 OR 
						--						sq.QuestionTypeId = 10) AND sq.SurveyId = s.Id) 
GO
