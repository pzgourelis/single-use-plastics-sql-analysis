USE questionnaire_project;
-- Average frequency of plastic bag use (Q1):
SELECT AVG(CAST(Answer_Value AS DECIMAL(10,2))) AS avg_plastic_bag_use FROM Responses WHERE QuestionID = 1 AND Answer_Value IS NOT NULL AND Answer_Value <> 99;
SELECT COUNT(*) AS valid_answers, AVG(CAST(Answer_Value AS DECIMAL(10,2))) AS avg_plastic_bag_use FROM Responses WHERE QuestionID = 1 AND Answer_Value IS NOT NULL AND Answer_Value <> 99;

-- Average use of reusable bag (Q5):
SELECT  COUNT(*) AS valid_answers, AVG(CAST(Answer_Value AS DECIMAL(10,2))) AS avg_reusable_bag_use FROM Responses WHERE QuestionID = 5 AND Answer_Value IS NOT NULL AND Answer_Value <> 99;

-- Average use of reusable alternatives: (Q5), (Q6), (Q7):
SELECT  q.Question_Code, q.Question_Text,
    COUNT(*) AS valid_answers,
    CAST(ROUND(AVG(CAST(r.Answer_Value AS DECIMAL(10,2))), 2) AS DECIMAL(10,2)) AS average_score
FROM Responses r INNER JOIN Questions q ON r.QuestionID = q.QuestionID
WHERE r.QuestionID IN (5, 6, 7) AND r.Answer_Value IS NOT NULL AND r.Answer_Value <> 99 GROUP BY q.Question_Code, q.Question_Text ORDER BY average_score DESC;

-- Average score of Barriers: (Q10_1), (Q10_2), (Q10_3), (Q10_4):
SELECT q.Question_Code, q.Question_Text,
    COUNT(*) AS valid_answers,
    CAST(ROUND(AVG(CAST(r.Answer_Value AS DECIMAL(10,2))), 2) AS DECIMAL(10,2)) AS average_score
FROM Responses r INNER JOIN Questions q ON r.QuestionID = q.QuestionID
WHERE r.QuestionID IN (16, 17, 18, 19) AND r.Answer_Value IS NOT NULL AND r.Answer_Value <> 99 GROUP BY q.Question_Code, q.Question_Text ORDER BY average_score DESC;

-- Average score of Behavioral Intentions: (Q9_1), (Q9_2), (Q9_3), (Q9_4):
SELECT q.Question_Code, q.Question_Text,
    COUNT(*) AS valid_answers,
    CAST(ROUND(AVG(CAST(r.Answer_Value AS DECIMAL(10,2))), 2) AS DECIMAL(10,2)) AS average_score
FROM Responses r INNER JOIN Questions q ON r.QuestionID = q.QuestionID
WHERE r.QuestionID IN (12, 13, 14, 15) AND r.Answer_Value IS NOT NULL AND r.Answer_Value <> 99 GROUP BY q.Question_Code, q.Question_Text ORDER BY average_score DESC;

-- Average score of Environmental Attitudes: (Q8_1), (Q8_2), (Q8_3), (Q8_4):
SELECT q.Question_Code, q.Question_Text,
    COUNT(*) AS valid_answers,
    CAST(ROUND(AVG(CAST(r.Answer_Value AS DECIMAL(10,2))), 2) AS DECIMAL(10,2)) AS average_score
FROM Responses r INNER JOIN Questions q ON r.QuestionID = q.QuestionID
WHERE r.QuestionID IN (8, 9, 10, 11) AND r.Answer_Value IS NOT NULL AND r.Answer_Value <> 99 GROUP BY q.Question_Code, q.Question_Text ORDER BY average_score DESC;

-- Average score of Perceptions and Opinions: (Q11), (Q12), (Q13), (Q14):
SELECT q.Question_Code, q.Question_Text,
    COUNT(*) AS valid_answers,
    CAST(ROUND(AVG(CAST(r.Answer_Value AS DECIMAL(10,2))), 2) AS DECIMAL(10,2)) AS average_score
FROM Responses r INNER JOIN Questions q ON r.QuestionID = q.QuestionID
WHERE r.QuestionID IN (20, 21, 22, 23) AND r.Answer_Value IS NOT NULL AND r.Answer_Value <> 99 GROUP BY q.Question_Code, q.Question_Text ORDER BY average_score DESC;

-- Frequency distribution of Gender (Q15):
SELECT  CASE r.Answer_Value
        WHEN 1 THEN 'Male'
        WHEN 2 THEN 'Female'
        WHEN 3 THEN 'Other'
        WHEN 4 THEN 'Prefer Not To Answer' END AS gender, COUNT(*) AS total_answers, CAST(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Responses 
        WHERE QuestionID = 24 AND Answer_Value IS NOT NULL AND Answer_Value <> 99), 2) AS DECIMAL(10,2)) AS percentage FROM Responses r
WHERE r.QuestionID = 24
  AND r.Answer_Value IS NOT NULL
  AND r.Answer_Value <> 99 GROUP BY r.Answer_Value ORDER BY r.Answer_Value;

-- Frequency distribution of Age Group (Q16):
SELECT  CASE r.Answer_Value
        WHEN 1 THEN '18-24'
        WHEN 2 THEN '25-34'
        WHEN 3 THEN '35-44'
        WHEN 4 THEN '45-54'
        WHEN 5 THEN '55-64'
        WHEN 6 THEN '65 and Above' END AS age_group, COUNT(*) AS total_answers, CAST(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Responses 
        WHERE QuestionID = 25 AND Answer_Value IS NOT NULL AND Answer_Value <> 99), 2) AS DECIMAL(10,2)) AS percentage FROM Responses r
WHERE r.QuestionID = 25
  AND r.Answer_Value IS NOT NULL
  AND r.Answer_Value <> 99 GROUP BY r.Answer_Value ORDER BY r.Answer_Value;

-- Frequency distribution of Educational Level (Q17):
SELECT  CASE r.Answer_Value
        WHEN 1 THEN 'Elementary School'
        WHEN 2 THEN 'Junior High School'
        WHEN 3 THEN 'High School'
        WHEN 4 THEN 'IEK / Other Technical School'
        WHEN 5 THEN 'Higher Education'
        WHEN 6 THEN 'Postgraduate / Doctoral Degree' END AS educational_level, COUNT(*) AS total_answers, CAST(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Responses 
        WHERE QuestionID = 26 AND Answer_Value IS NOT NULL AND Answer_Value <> 99), 2) AS DECIMAL(10,2)) AS percentage FROM Responses r
WHERE r.QuestionID = 26
  AND r.Answer_Value IS NOT NULL
  AND r.Answer_Value <> 99 GROUP BY r.Answer_Value ORDER BY r.Answer_Value;

-- Frequency distribution of Employment Status (Q18):
SELECT  CASE r.Answer_Value
        WHEN 1 THEN 'Student'
        WHEN 2 THEN 'Private Sector Employee'
        WHEN 3 THEN 'Public Sector Employee'
        WHEN 4 THEN 'Self-Employed'
        WHEN 5 THEN 'Unemployed'
        WHEN 6 THEN 'Retired'
        WHEN 7 THEN 'Homemaker'
        WHEN 8 THEN 'Other' END AS employment_status, COUNT(*) AS total_answers, CAST(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Responses 
        WHERE QuestionID = 27 AND Answer_Value IS NOT NULL AND Answer_Value <> 99), 2) AS DECIMAL(10,2)) AS percentage FROM Responses r
WHERE r.QuestionID = 27
  AND r.Answer_Value IS NOT NULL
  AND r.Answer_Value <> 99 GROUP BY r.Answer_Value ORDER BY r.Answer_Value;

-- Frequency distribution of Place of Residence (Q19):
SELECT  CASE r.Answer_Value
        WHEN 1 THEN 'Grevena Town'
        WHEN 2 THEN 'Town / Village in the Prefecture of Grevena'
        WHEN 3 THEN 'Other' END AS place_of_residence, COUNT(*) AS total_answers, CAST(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Responses 
        WHERE QuestionID = 28 AND Answer_Value IS NOT NULL AND Answer_Value <> 99), 2) AS DECIMAL(10,2)) AS percentage FROM Responses r
WHERE r.QuestionID = 28
  AND r.Answer_Value IS NOT NULL
  AND r.Answer_Value <> 99 GROUP BY r.Answer_Value ORDER BY r.Answer_Value;

-- Frequency distribution of Household Size (Q20):
SELECT  CASE r.Answer_Value
        WHEN 1 THEN '1 Person'
        WHEN 2 THEN '2 People'
        WHEN 3 THEN '3 People'
        WHEN 4 THEN '4 or More People' END AS household_size, COUNT(*) AS total_answers, CAST(ROUND(COUNT(*) * 100.0 /  (SELECT COUNT(*) FROM Responses 
        WHERE QuestionID = 29
           AND Answer_Value IS NOT NULL 
           AND Answer_Value <> 99), 2) AS DECIMAL(10,2)) AS percentage FROM Responses r
WHERE r.QuestionID = 29
  AND r.Answer_Value IS NOT NULL
  AND r.Answer_Value <> 99 GROUP BY r.Answer_Value ORDER BY r.Answer_Value;

-- Frequency distribution of Consent for Future Use of Responses (Q21):
SELECT  CASE r.Answer_Value
        WHEN 1 THEN 'Yes'
        WHEN 2 THEN 'No' END AS consent, COUNT(*) AS total_answers, CAST(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Responses 
        WHERE QuestionID = 30
           AND Answer_Value IS NOT NULL 
           AND Answer_Value <> 99), 2) AS DECIMAL(10,2)) AS percentage FROM Responses r
WHERE r.QuestionID = 30
  AND r.Answer_Value IS NOT NULL
  AND r.Answer_Value <> 99 GROUP BY r.Answer_Value ORDER BY r.Answer_Value;

-- Average plastic bag use by age group:
SELECT  CASE age.Answer_Value
        WHEN 1 THEN '18-24'
        WHEN 2 THEN '25-34'
        WHEN 3 THEN '35-44'
        WHEN 4 THEN '45-54'
        WHEN 5 THEN '55-64'
        WHEN 6 THEN '65 and Above' END AS age_group, COUNT(*) AS valid_answers, CAST(ROUND(AVG(CAST(plastic.Answer_Value AS DECIMAL(10,2))), 2) AS DECIMAL(10,2)) AS avg_plastic_bag_use
FROM Responses plastic INNER JOIN Responses age ON plastic.ParticipantID = age.ParticipantID WHERE plastic.QuestionID = 1 AND age.QuestionID = 25
AND plastic.Answer_Value IS NOT NULL
AND plastic.Answer_Value <> 99
AND age.Answer_Value IS NOT NULL
AND age.Answer_Value <> 99 GROUP BY age.Answer_Value ORDER BY age.Answer_Value;

-- Average environmental attitude by educational level:
SELECT  CASE edu.Answer_Value
        WHEN 1 THEN 'Elementary School'
        WHEN 2 THEN 'Junior High School'
        WHEN 3 THEN 'High School'
        WHEN 4 THEN 'IEK / Other Technical School'
        WHEN 5 THEN 'Higher Education'
        WHEN 6 THEN 'Postgraduate / Doctoral Degree' END AS educational_level, COUNT(*) AS valid_answers, CAST(ROUND(AVG(CAST(att.Answer_Value AS DECIMAL(10,2))), 2) AS DECIMAL(10,2)) AS avg_environmental_attitude
FROM Responses att INNER JOIN Responses edu ON att.ParticipantID = edu.ParticipantID WHERE att.QuestionID IN (8, 9, 10, 11) AND edu.QuestionID = 26
AND att.Answer_Value IS NOT NULL
AND att.Answer_Value <> 99
AND edu.Answer_Value IS NOT NULL
AND edu.Answer_Value <> 99 GROUP BY edu.Answer_Value ORDER BY edu.Answer_Value;

-- Average intention to reduce plastic use by gender:
SELECT  CASE gender.Answer_Value
        WHEN 1 THEN 'Male'
        WHEN 2 THEN 'Female'
        WHEN 3 THEN 'Other'
        WHEN 4 THEN 'Prefer Not To Answer' END AS gender, COUNT(*) AS valid_answers, CAST(ROUND(AVG(CAST(intent.Answer_Value AS DECIMAL(10,2))), 2) AS DECIMAL(10,2)) AS avg_behavioral_intention
FROM Responses intent INNER JOIN Responses gender ON intent.ParticipantID = gender.ParticipantID WHERE intent.QuestionID IN (12, 13, 14, 15) AND gender.QuestionID = 24
AND intent.Answer_Value IS NOT NULL
AND intent.Answer_Value <> 99
AND gender.Answer_Value IS NOT NULL
AND gender.Answer_Value <> 99 GROUP BY gender.Answer_Value ORDER BY gender.Answer_Value;

-- Overall average score by question group:
SELECT q.Group_Name, COUNT(*) AS valid_answers, CAST(ROUND(AVG(CAST(r.Answer_Value AS DECIMAL(10,2))), 2) AS DECIMAL(10,2)) AS average_score FROM Responses r
INNER JOIN Questions q ON r.QuestionID = q.QuestionID WHERE r.Answer_Value IS NOT NULL AND r.Answer_Value <> 99 AND q.Group_Name NOT IN ('DEMOGRAPHICS', 'CONSENT')
GROUP BY q.Group_Name ORDER BY average_score DESC;

-- Top 5 questions with the highest average scores:
SELECT TOP 5
q.Question_Code,
q.Question_Text,
q.Group_Name,
COUNT(*) AS valid_answers, CAST(ROUND(AVG(CAST(r.Answer_Value AS DECIMAL(10,2))), 2) AS DECIMAL(10,2)) AS average_score FROM Responses r
INNER JOIN Questions q ON r.QuestionID = q.QuestionID WHERE r.Answer_Value IS NOT NULL AND r.Answer_Value <> 99 AND q.Group_Name NOT IN ('DEMOGRAPHICS', 'CONSENT')
GROUP BY q.Question_Code, q.Question_Text, q.Group_Name ORDER BY average_score DESC;

-- Bottom 5 questions with the lowest average scores:
SELECT TOP 5
q.Question_Code,
q.Question_Text,
q.Group_Name,
COUNT(*) AS valid_answers, CAST(ROUND(AVG(CAST(r.Answer_Value AS DECIMAL(10,2))), 2) AS DECIMAL(10,2)) AS average_score FROM Responses r
INNER JOIN Questions q ON r.QuestionID = q.QuestionID WHERE r.Answer_Value IS NOT NULL AND r.Answer_Value <> 99 AND q.Group_Name NOT IN ('DEMOGRAPHICS', 'CONSENT')
GROUP BY q.Question_Code, q.Question_Text, q.Group_Name ORDER BY average_score ASC;