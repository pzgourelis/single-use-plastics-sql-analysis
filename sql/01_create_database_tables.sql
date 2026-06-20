CREATE DATABASE questionnaire_project;
USE questionnaire_project;
CREATE TABLE Questions(QuestionID INT NOT NULL, Question_Code NVARCHAR(10) NOT NULL, Question_Text NVARCHAR(100) NOT NULL, Question_Type NVARCHAR(20) NOT NULL, Valid_Values NVARCHAR(20) NOT NULL, Part NCHAR(1) NOT NULL, Group_Name NVARCHAR(50) NOT NULL, PRIMARY KEY(QuestionID), UNIQUE (Question_Code));
CREATE TABLE Participants(ParticipantID INT NOT NULL, PRIMARY KEY(ParticipantID));
CREATE TABLE Responses(ResponseID INT NOT NULL, ParticipantID INT NOT NULL, QuestionID INT NOT NULL, Answer_Value INT NULL, PRIMARY KEY(ResponseID), FOREIGN KEY(ParticipantID) REFERENCES Participants(ParticipantID), FOREIGN KEY(QuestionID) REFERENCES Questions(QuestionID));