USE questionnaire_project;
SELECT COUNT(*) AS total_questions FROM Questions;
SELECT COUNT(*) AS total_participants FROM Participants;
SELECT COUNT(*) AS total_responses FROM Responses;
SELECT ParticipantID, COUNT(*) AS total_answers FROM Responses GROUP BY ParticipantID ORDER BY ParticipantID;
SELECT QuestionID, COUNT(*) AS total_answers FROM Responses GROUP BY QuestionID ORDER BY QuestionID;
SELECT ParticipantID, CASE WHEN Answer_Value = 99 THEN 'Invalid' WHEN Answer_Value IS NULL THEN 'Missing' ELSE 'Valid' END AS Response_Status FROM Responses;
SELECT * FROM Responses WHERE Answer_Value IS NULL;
SELECT * FROM Responses WHERE Answer_Value = 99;
SELECT ResponseID, ParticipantID, QuestionID, Answer_Value, CASE WHEN Answer_Value = 99 THEN 'Invalid' WHEN Answer_Value IS NULL THEN 'Missing' ELSE 'Valid' END AS Response_Status FROM Responses ORDER BY ResponseID;
SELECT * FROM Responses WHERE Answer_Value IS NOT NULL AND Answer_Value <> 99 AND (Answer_Value < 1 OR Answer_Value > 8);
SELECT 
    r.ResponseID,
    r.ParticipantID,
    q.Question_Code,
    q.Question_Text,
    r.Answer_Value FROM Responses r INNER JOIN Questions q ON r.QuestionID = q.QuestionID ORDER BY r.ResponseID;