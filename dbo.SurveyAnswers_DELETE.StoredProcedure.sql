USE [CnmPro]
GO
/****** Object:  StoredProcedure [dbo].[SurveyAnswers_DELETE]    Script Date: 8/31/2022 9:13:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Allen Luong C-119>
-- Create date: <8/26/2022>
-- Description:	<DELETE for dbo.SurveysAnswers>
-- Code Reviewer:


-- MODIFIED BY: author
-- MODIFIED DATE:12/1/2020
-- Code Reviewer: 
-- Note: 
-- =============================================
CREATE proc [dbo].[SurveyAnswers_DELETE]
	@Id int
as

/*

			Declare @Id int = 2

			Select * 
			From dbo.SurveyAnswers
			WHERE Id = @Id


			Execute  dbo.SurveyAnswers_DELETE @Id

			Select * 
			From dbo.SurveyAnswers
			WHERE Id = @Id

*/

BEGIN

DELETE FROM dbo.SurveyAnswers
Where Id = @Id
END


GO
