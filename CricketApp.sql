CREATE DATABASE CricketApp;

USE CricketApp;

CREATE TABLE Players
(
    Player_id INT PRIMARY KEY,
    Player_Name VARCHAR(50),
    Age INT,
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female')),
    Role VARCHAR(25),
    country VARCHAR(20)
);

INSERT INTO Players VALUES
(1, 'Aditya', 25, 'Male', 'Batsman', 'India'),
(2, 'Karthik', 30, 'Male', 'Bowler', 'India'),
(3, 'Manoj', 27, 'Male', 'All-Rounder', 'India'),
(4, 'Rakesh', 33, 'Male', 'Batsman', 'India'),
(5, 'Michael', 29, 'Male', 'Batsman', 'Australia'),
(6, 'Daniel', 32, 'Male', 'Bowler', 'Australia'),
(7, 'Harry', 26, 'Male', 'All-Rounder', 'England'),
(8, 'George', 31, 'Male', 'Batsman', 'England'),
(9, 'Anil', 39, 'Male', 'Bowler', 'India'),
(10, 'Varun', 28, 'Male', 'Batsman', 'India'),
(11, 'Ravi', 23, 'Male', 'Bowler', 'India'),
(12, 'Vikram', 36, 'Male', 'All-Rounder', 'India'),
(13, 'Mitchell', 35, 'Male', 'Bowler', 'Australia'),
(14, 'Quinton', 30, 'Male', 'Batsman', 'South Africa'),
(15, 'James', 41, 'Male', 'Batsman', 'England');


SELECT * FROM  Players;

CREATE TABLE Team
(
    Team_ID INT PRIMARY KEY,
    Team_Name VARCHAR(50),
    Country VARCHAR(30),
    Coach VARCHAR(50),
    Ranking INT
);

INSERT INTO Team VALUES
(101, 'India', 'India', 'Rahul Dravid', 3),
(102, 'Australia', 'Australia', 'Jason Gillespie', 2),
(103, 'England', 'England', 'Matthew Mott', 5),
(104, 'South Africa', 'South Africa', 'Rob Walter', 6),
(105, 'New Zealand', 'New Zealand', 'Luke Ronchi', 8);


SELECT * FROM Team;

CREATE TABLE Matches
(
    Match_ID INT PRIMARY KEY,
    Team1_ID INT,
    Team2_ID INT,
    Match_Date DATE,
    Venue VARCHAR(100),
    Match_Type VARCHAR(20),
    Winner_ID INT
);

INSERT INTO Matches VALUES
(201, 101, 103, '2026-04-10', 'Delhi', 'T20', 101),
(202, 102, 105, '2026-04-16', 'Sydney', 'ODI', 102),
(203, 104, 101, '2026-05-02', 'Cape Town', 'Test', 104),
(204, 103, 102, '2026-05-12', 'London', 'T20', 103),
(205, 105, 101, '2026-06-01', 'Auckland', 'ODI', 105),
(206, 102, 104, '2026-06-15', 'Melbourne', 'T20', 102);

SELECT * FROM Matches;


CREATE TABLE Player_Performance
(
    Performance_ID INT PRIMARY KEY,
    Match_ID INT,
    Player_ID INT,
    Runs INT,
    Wickets INT,
    Catches INT
);

INSERT INTO Player_Performance VALUES
(301, 201, 1, 92, 0, 2),
(302, 201, 2, 28, 3, 1),
(303, 201, 3, 55, 2, 3),
(304, 201, 4, 68, 0, 2),
(305, 202, 5, 125, 0, 4),
(306, 202, 6, 22, 5, 2),
(307, 202, 7, 48, 1, 2),
(308, 202, 8, 75, 0, 3),
(309, 203, 4, 105, 0, 3),
(310, 203, 9, 18, 4, 2),
(311, 203, 10, 82, 1, 1),
(312, 203, 14, 95, 2, 4),
(313, 204, 6, 14, 4, 1),
(314, 204, 13, 32, 3, 2),
(315, 204, 8, 88, 0, 3),
(316, 205, 3, 72, 2, 2),
(317, 205, 11, 20, 5, 1),
(318, 205, 12, 115, 1, 4),
(319, 206, 5, 81, 0, 2),
(320, 206, 13, 27, 3, 2);

SELECT * FROM Player_Performance;


CREATE TABLE Match_Official
(
    Official_ID INT PRIMARY KEY,
    Official_Name VARCHAR(50),
    Role VARCHAR(30),
    Country VARCHAR(30),
    Match_ID INT
);

INSERT INTO Match_Official VALUES
(401, 'Arun Sharma', 'Umpire', 'India', 201),
(402, 'Robert Smith', 'Umpire', 'Australia', 202),
(403, 'Kevin Brown', 'Third Umpire', 'England', 203),
(404, 'Peter Johnson', 'Match Referee', 'South Africa', 204),
(405, 'William Clark', 'Umpire', 'New Zealand', 205);


SELECT * FROM Match_Official;


CREATE TABLE Payment
(
    Payment_ID INT PRIMARY KEY,
    Booking_ID INT,
    Amount DECIMAL(10,2),
    Payment_Mode VARCHAR(20),
    Payment_Status VARCHAR(20)
);

INSERT INTO Payment VALUES
(501, 2001, 350.00, 'UPI', 'Success'),
(502, 2002, 550.00, 'Card', 'Success'),
(503, 2003, 275.00, 'Cash', 'Pending'),
(504, 2004, 750.00, 'UPI', 'Failed'),
(505, 2005, 425.00, 'Card', 'Success');

SELECT * FROM Payment;

SELECT Player_Name,
       Country
FROM Players
WHERE Role = 'Batsman'
    AND Age > 25;

SELECT Player_Name
FROM Players
WHERE (Country = 'India'
    OR Country = 'Australia')
    AND Age < 30;

SELECT *
FROM Team
WHERE Ranking <= 10
    AND Country = 'India';

SELECT Match_ID,
       Venue,
       Match_Type
FROM Matches
WHERE Match_Type = 'T20'
    AND Venue = 'Hyderabad';

SELECT Player_ID,
       Runs,
       Wickets
FROM Player_Performance
WHERE Runs > 50
    OR Wickets > 2;

SELECT DISTINCT Country
FROM Players;

SELECT DISTINCT Match_Type
FROM Matches;

SELECT Player_Name
FROM Players
WHERE Player_Name LIKE 'S%'
    AND Country = 'India';

SELECT COUNT(*) AS Total_Indian_Players
FROM Players
WHERE Country = 'India';

SELECT MAX(Runs) AS Maximum_Runs
FROM Player_Performance;

SELECT AVG(Runs) AS Average_Runs
FROM Player_Performance
WHERE Runs > 20;

SELECT SUM(Wickets) AS Total_Wickets
FROM Player_Performance;

SELECT MIN(Catches) AS Minimum_Catches,
       MAX(Catches) AS Maximum_Catches,
       AVG(Catches) AS Average_Catches
FROM Player_Performance;

SELECT Role,
COUNT(*) AS Number_Of_Players
FROM Players
WHERE Age > 25
GROUP BY Role;

SELECT Country,
COUNT(*) AS Number_Of_Bowlers
FROM Players
WHERE Role = 'Bowler'
GROUP BY Country;

SELECT Player_ID,
SUM(Runs) AS Total_Runs
FROM Player_Performance
WHERE Runs > 20
GROUP BY Player_ID;

SELECT Match_ID,
SUM(Wickets) AS Total_Wickets
FROM Player_Performance
WHERE Wickets > 0
GROUP BY Match_ID;

SELECT Country,
COUNT(*) AS Number_Of_Players
FROM Players
GROUP BY Country
HAVING COUNT(*) > 2;

SELECT Player_ID,
SUM(Runs) AS Total_Runs
FROM Player_Performance
GROUP BY Player_ID
HAVING SUM(Runs) > 100;

SELECT Match_ID,
SUM(Wickets) AS Total_Wickets
FROM Player_Performance
GROUP BY Match_ID
HAVING SUM(Wickets) > 3;

SELECT Player_ID,
SUM(Runs) AS Total_Runs
FROM Player_Performance
GROUP BY Player_ID
HAVING SUM(Runs) > 100
ORDER BY Total_Runs DESC;

SELECT Player_ID,
AVG(Runs) AS Average_Runs
FROM Player_Performance
GROUP BY Player_ID
HAVING AVG(Runs) > 30
ORDER BY Average_Runs ASC;

UPDATE Team
SET Ranking = 1
WHERE Team_ID = 101;

UPDATE Players
SET Age = Age + 1
WHERE Age > 30

UPDATE Player_Performance
SET Catches = Catches + 1
WHERE Wickets > 2
AND Catches < 3;

DELETE
FROM Players
WHERE Age > 45
AND Country <> 'India';

DELETE
FROM Player_Performance
WHERE Runs < 5
AND Wickets = 0;

DELETE
FROM Team
WHERE Ranking > 15
    AND Country = 'India';


SELECT P.Player_Name,
       P.Role,
       PP.Runs
FROM Players P
JOIN Player_Performance PP
ON P.Player_ID = PP.Player_ID;


SELECT T.Team_Name,
       M.Match_Date,
       M.Venue
FROM Team T
JOIN Matches M
ON T.Team_ID = M.Team1_ID;

SELECT P.Player_Name,
       PP.Match_ID,
       PP.Runs,
       PP.Wickets
FROM Players P
JOIN Player_Performance PP
ON P.Player_ID = PP.Player_ID
WHERE PP.Runs > 50;


SELECT P.Player_Name,
       M.Match_Date,
       M.Venue,
       PP.Runs
FROM Players P
JOIN Player_Performance PP
ON P.Player_ID = PP.Player_ID
JOIN Matches M
ON PP.Match_ID = M.Match_ID;

SELECT P.Player_Name,
       M.Match_Type,
       M.Venue,
       PP.Wickets
FROM Players P
JOIN Player_Performance PP
ON P.Player_ID = PP.Player_ID
JOIN Matches M
ON PP.Match_ID = M.Match_ID
WHERE PP.Wickets > 2;

SELECT DISTINCT P.Player_Name
FROM Players P
JOIN Player_Performance PP
ON P.Player_ID = PP.Player_ID
WHERE PP.Runs > (SELECT AVG(Runs)
FROM Player_Performance);

SELECT P.Player_Name
FROM Players P
JOIN Player_Performance PP
ON P.Player_ID = PP.Player_ID
GROUP BY P.Player_ID, P.Player_Name
HAVING SUM(PP.Runs) > (SELECT SUM(Runs)
FROM Player_Performance
WHERE Player_ID = 1);

