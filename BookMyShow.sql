CREATE DATABASE BookMyShow;

USE BookMyShow;



CREATE TABLE Customer
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Mobile VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Address VARCHAR(200) NOT NULL
);

INSERT INTO Customer
(CustomerID, CustomerName, Mobile, Email, Address)
VALUES
(1, 'Dheeraj', '6304976013', 'dheeraj@gmail.com', 'Tirupati'),
(2, 'Kareem', '8978624322', 'kareem@gmail.com', 'Bangalore'),
(3, 'Lokesh', '9162780333', 'lokesh@gmail.com', 'Chennai'),
(4, 'Sandeep', '9976349021', 'sanddeep@gmail.com', 'Hyderabad'),
(5, 'Satwik', '8769067453', 'satwik@gmail.com', 'Vijayawada');

SELECT * FROM Customer;



CREATE TABLE Movie
(
    MovieID INT PRIMARY KEY,
    MovieName VARCHAR(100) NOT NULL,
    Language VARCHAR(50) NOT NULL,
    Genre VARCHAR(50),
    Duration INT NOT NULL,
    Rating DECIMAL(2,1)
);

INSERT INTO Movie
(MovieID, MovieName, Language, Genre, Duration, Rating)
VALUES
(101, 'Kalki 2898 AD', 'Telugu', 'Science Fiction', 180, 4.6),
(102, 'Leo', 'Tamil', 'Action', 164, 4.0),
(103, 'Jawan', 'Hindi', 'Action', 169, 3.9),
(104, 'Pushpa 2', 'Telugu', 'Action', 200, 4.0),
(105, 'KGF Chapter 2', 'Kannada', 'Action', 168, 4.9);

SELECT * FROM Movie;



CREATE TABLE Theater
(
    TheaterID INT PRIMARY KEY,
    TheaterName VARCHAR(100) NOT NULL,
    Location VARCHAR(200) NOT NULL,
    Screens INT NOT NULL
);

INSERT INTO Theater
(TheaterID, TheaterName, Location, Screens)
VALUES
(201, 'INOX', 'Tirupati', 5),
(202, 'PVR Cinemas', 'Bangalore', 8),
(203, 'SVC Cinemas', 'Chennai', 5),
(204, 'Asian Cinemas', 'Vijayawada', 4),
(205, 'PVR ICON', 'Hyderabad', 7);

SELECT * FROM Theater;



CREATE TABLE Shows
(
    ShowID INT PRIMARY KEY,
    MovieID INT,
    TheaterID INT,
    Showtime TIME,
    Showdate DATE,
    ScreenNumber INT,
    TicketPrice INT
);

INSERT INTO Shows
(ShowID, MovieID, TheaterID, Showtime, Showdate, ScreenNumber, TicketPrice)
VALUES
(301, 101, 201, '10:00:00', '2026-08-01', 1, 250),
(302, 102, 202, '11:22:00', '2026-08-02', 2, 270),
(303, 103, 203, '18:00:00', '2026-08-03', 3, 300),
(304, 104, 204, '18:00:50', '2026-08-04', 1, 260),
(305, 105, 205, '15:00:00', '2026-08-05', 4, 250);

SELECT * FROM Shows;



CREATE TABLE Payment
(
    PaymentID INT PRIMARY KEY,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentType VARCHAR(50) NOT NULL,
    PaymentDate DATE NOT NULL,
    Discount DECIMAL(5,2) NOT NULL
   

);

INSERT INTO Payment
(PaymentID, Amount, PaymentType, PaymentDate, Discount)
VALUES
(401, 500.00, 'UPI', '2026-08-01', 50.00),
(402, 750.00, 'Card', '2026-08-02', 75.00),
(403, 400.00, 'Cash', '2026-08-03', 0.00),
(404, 900.00, 'UPI', '2026-08-04', 100.00),
(405, 650.00, 'Card', '2026-08-05', 50.00);

SELECT * FROM Payment;



CREATE TABLE Bookings
(
    BookingID INT PRIMARY KEY,
    CustomerID INT,
    ShowID INT,
    BookingDate DATE,
    Seats INT,
    TotalAmount INT
);

INSERT INTO Bookings
(BookingID, CustomerID, ShowID, BookingDate, Seats, TotalAmount)
VALUES
(501, 1, 301, '2026-08-01', 2, 850),
(502, 2, 302, '2026-08-02', 3, 400),
(503, 3, 303, '2026-08-03', 4, 450),
(504, 4, 304, '2026-08-04', 1, 600),
(505, 5, 305, '2026-08-05', 5, 1200);

SELECT * FROM Bookings;


SELECT Customer_Name
FROM Customer
WHERE City = 'Tirupati';

SELECT Customer_Name, Phone
FROM Customer
WHERE City = 'Hyderabad';

SELECT *
FROM Movie
WHERE Language = 'Telugu';

SELECT MovieName, Genre
FROM Movie
WHERE Genre = 'Action';

SELECT Movie_Name
FROM Movie
WHERE Duration > 150;

SELECT *
FROM Theatre
WHERE City = 'Tirupati';

SELECT *
FROM Shows
WHERE Show_Date = '2026-08-05';

SELECT Show_ID, Movie_ID, Show_Time
FROM Shows
WHERE Show_Time > '18:00:00';

SELECT *
FROM Booking
WHERE Seats > 3;

SELECT Booking_ID, Customer_ID, Seats
FROM Booking
WHERE Booking_Date > '2026-08-05';

SELECT *
FROM Payment
WHERE Amount > 500.00;

SELECT Payment_ID, Booking_ID, Payment_Method
FROM Payment
WHERE Payment_Method = 'UPI';

SELECT *
FROM Payment
WHERE Payment_Status = 'Success';

SELECT Customer_Name, Email
FROM Customer
WHERE City = 'Tirupati' OR City = 'Chennai';

SELECT Movie_Name
FROM Movie
WHERE Language = 'Telugu'
AND Genre = 'Action';

SELECT Movie_Name
FROM Movie
WHERE Duration = 120
AND Duration < 180;

SELECT *
FROM Customer
WHERE City = 'Tirupati'
AND Email IS NOT NULL;

SELECT *
FROM Theatre
WHERE City = 'Tirupati'
OR City = 'Hyderabad';

SELECT Theatre_Name
FROM Theatre
WHERE Screen_Name IS NOT NULL
AND City = 'Tirupati';

SELECT *
FROM Booking
WHERE Seats >= 2
AND Seats <= 5;

SELECT Booking_ID, Customer_ID
FROM Booking
WHERE Booking_Date = '2026-08-05'
OR Seats > 4;

SELECT *
FROM Payment
WHERE Amount > 500
AND Payment_Status = 'Success';

SELECT Payment_ID, Amount, Payment_Method
FROM Payment
WHERE Payment_Method = 'UPI'
OR Payment_Method = 'Card';

SELECT *
FROM Customer
WHERE (City = 'Tirupati' OR City = 'Hyderabad')
AND Phone IS NOT NULL;

SELECT Customer_ID, Customer_Name
FROM Customer
WHERE City = 'Tirupati';

SELECT Movie_Name AS Movie_Name, Language, Genre
FROM Movie
WHERE Duration > 120;

SELECT Theatre_Name AS Theatre_Name, City, Screen_Name
FROM Theatre
WHERE Screen_Name IS NOT NULL;

SELECT Show_ID AS Show_ID, Movie_ID AS Movie_ID, Show_Time AS Show_Time
FROM Shows
WHERE Show_Time > '18:00:00';

SELECT Payment_ID AS Payment_ID, Amount, Payment_Status AS Payment_Status
FROM Payment
WHERE Amount > 2500;
UPDATE Customer
SET City = 'Chittoor'
WHERE Customer_ID = 1
AND City = 'Tirupati';


UPDATE Movie
SET Genre = 'Action'
WHERE Movie_ID = 5;



UPDATE Theatre
SET Screen_Name = 'Screen 6'
WHERE Theatre_ID = 2;



UPDATE Payment
SET Payment_Status = 'Success'
WHERE Payment_ID = 601;



UPDATE Payment
SET Payment_Method = 'UPI'
WHERE Payment_Status = 'Success'
AND Amount < 500;



DELETE FROM Customer
WHERE Customer_ID = 15;



DELETE FROM Movie
WHERE Duration < 90;



DELETE FROM Theatre
WHERE Theatre_ID = 5
AND City = 'Tirupati';



DELETE FROM Booking
WHERE Seats = 1
AND Booking_Date < '2026-08-05';



DELETE FROM Payment
WHERE Payment_Status = 'Failed'
AND Amount < 300;


UPDATE Movie
SET Duration = Duration + 10
WHERE Duration < 120;



UPDATE Theatre
SET Screen_Name = 'Screen 6'
WHERE Theatre_ID = 2;



UPDATE Theatre
SET City = 'Tirupati'
WHERE City = 'Chittoor'
AND Theatre_ID = 2;



UPDATE Movie
SET Language = 'Telugu'
WHERE Language = 'English'
AND Genre = 'Drama';


UPDATE Movie
SET Genre = 'Action'
WHERE Language = 'Telugu'
AND Duration > 120;


UPDATE Shows
SET Show_Time = '18:00:00'
WHERE Show_Date = '2026-08-08'
AND Show_Time < '18:00:00';


UPDATE Booking
SET Seats = Seats + 1
WHERE Seats < 3;


UPDATE Booking
SET Booking_Date = '2026-08-15'
WHERE Seats > 4
AND Booking_Date < '2026-08-10';


UPDATE Payment
SET Payment_Method = 'UPI'
WHERE Payment_Method = 'Cash';


UPDATE Payment
SET Payment_Status = 'Success'
WHERE Amount > 500
AND Payment_Status = 'Pending';


UPDATE Payment
SET Payment_Status = 'Failed'
WHERE Amount < 100
AND Payment_Status = 'Pending';


UPDATE Payment
SET Amount = Amount + 100
WHERE Payment_Method = 'UPI'
AND Amount < 2500;


DELETE FROM Customer
WHERE City = 'Tirupati'
AND Email LIKE 'ganesh%@gmail.com';


DELETE FROM Movie
WHERE Language = 'English'
AND Duration > 180;


DELETE FROM Theatre
WHERE (City = 'Hyderabad' OR City = 'Chennai')
AND Theatre_ID IN (1, 2, 3, 4, 5);


DELETE FROM Shows
WHERE Show_Date = '2026-08-05'
AND Show_Time < '18:40:00';


DELETE FROM Booking
WHERE Seats > 4
AND Booking_Date < '2026-08-10';


DELETE FROM Payment
WHERE Amount > 1000
AND Payment_Status = 'Failed';


UPDATE Customer
SET City = 'Tirupati'
WHERE Customer_ID = 2
AND City = 'Chittoor';


UPDATE Payment
SET Amount = Amount + 50
WHERE Payment_Method = 'UPI'
AND Payment_Status = 'Success'
AND Amount < 1000;

select SUM(Amount) as Total_Amount
from Payment
where Payment_Status = 'Successful' AND Amount > 500

SELECT COUNT(*) AS Total_Customers
FROM Customer
WHERE City = 'Tirupati'
AND Email LIKE 'hemanth%@gmail.com';

SELECT COUNT(*) AS Total_Customers
FROM Customer
WHERE City = 'Hyderabad'
OR City = 'Chennai';

SELECT COUNT(*) AS Total_Movies
FROM Movie
WHERE Language = 'Telugu'
AND Genre = 'Action';

SELECT COUNT(*) AS Total_Movies
FROM Movie
WHERE Duration > 120
AND Duration < 180;

SELECT COUNT(*) AS Total_Theatres
FROM Theatre
WHERE Location = 'Tirupati'
AND Screen_Name > 3;

SELECT COUNT(*) AS Total_Bookings
FROM Booking
WHERE Seats >= 3
AND Seats <= 5;


SELECT MIN(Duration) AS Minimum_Duration
FROM Movie
WHERE Language = 'Telugu'
AND Genre = 'Action';

SELECT MAX(Duration) AS Maximum_Duration
FROM Movie
WHERE Language = 'English'
OR Language = 'Hindi';

SELECT AVG(Duration) AS Average_Duration
FROM Movie
WHERE Duration > 120
AND Duration < 180;

SELECT MIN(Screens) AS Minimum_Screens
FROM Theatre
WHERE Location = 'Tirupati'
AND Screens > 2;

SELECT MAX(Screens) AS Maximum_Screens
FROM Theatre
WHERE Location = 'Hyderabad'
OR Location = 'Chennai';

SELECT AVG(Screens) AS Average_Screens
FROM Theatre
WHERE Location = 'Tirupati'
AND Screens >= 3;

SELECT MIN(Seats) AS Minimum_Seats
FROM Booking
WHERE Seats > 1
AND Seats < 5;

SELECT MAX(Seats) AS Maximum_Seats
FROM Booking
WHERE Booking_Date > '2026-01-01'
AND Seats > 2;


SELECT AVG(Amount) AS Average_Amount
FROM Payment
WHERE Payment_Status = 'Successful'
AND Amount > 500;

SELECT SUM(Amount) AS Total_Amount
FROM Payment
WHERE Payment_Method = 'UPI'
AND Amount > 300;


SELECT SUM(Amount) AS Total_Amount
FROM Payment
WHERE Payment_Status = 'Successful'
AND Payment_Method = 'UPI'
AND Amount > 500;

SELECT DISTINCT Location
FROM Theatre
WHERE Screens > 2
AND Screens < 6;

SELECT DISTINCT Payment_Status
FROM Payment
WHERE Payment_Method = 'UPI'
OR Payment_Method = 'Credit Card';

SELECT DISTINCT Show_Date
FROM Shows
WHERE Show_Time > '18:00:00'
AND Show_Time < '22:00:00';


SELECT Customer_Name
FROM Customer
WHERE Customer_Name LIKE 'A%'
AND City = 'Tirupati';

SELECT Customer_Name
FROM Customer
WHERE (Customer_Name LIKE 'R%'
OR Customer_Name LIKE 'S%')
AND City = 'Hyderabad';

SELECT Language, AVG(Duration) AS Avg_Duration
FROM Movie
WHERE Duration > 100
GROUP BY Language;

SELECT City, COUNT(*) AS Total_Theatres
FROM Theater
WHERE Screens >= 3
GROUP BY city;

SELECT City, AVG(Screens) AS Avg_Screens
FROM Theater
WHERE Screens > 3
GROUP BY City;

SELECT Payment_Method, SUM(Amount) AS Total_Amount
FROM Payment
WHERE Payment_Status = 'Success'
GROUP BY Payment_Method;

SELECT city, COUNT(*) AS Customer_Count
FROM Customer
GROUP BY city
HAVING COUNT(*) > 2;

SELECT Language, COUNT(*) AS Movie_Count
FROM Movie
GROUP BY Language
HAVING COUNT(*) > 3;

SELECT Genre, AVG(Duration) AS Avg_Duration
FROM Movie
GROUP BY Genre
HAVING AVG(Duration) > 120;

SELECT City, COUNT(*) AS Theatre_Count
FROM Theater
GROUP BY City
HAVING COUNT(*) >= 2;

SELECT Payment_Method, SUM(Amount) AS Total_Amount
FROM Payment
GROUP BY Payment_Method
HAVING SUM(Amount) > 500;

SELECT Genre, COUNT(*) AS Movie_Count
FROM Movie
WHERE Genre = 'Action'
GROUP BY Genre
HAVING COUNT(*) > 2;

SELECT Customer_ID, SUM(Seats) AS Total_Seats
FROM Booking
WHERE Seats > 1
GROUP BY Customer_ID
HAVING SUM(Seats) > 5;

SELECT Payment_Method, AVG(Amount) AS Avg_Amount
FROM Payment
WHERE Payment_Status = 'Success'
GROUP BY Payment_Method
HAVING AVG(Amount) > 500;

SELECT Genre, COUNT(*) AS Movie_Count
FROM Movie
GROUP BY Genre
ORDER BY Movie_Count DESC;

SELECT Language, AVG(Duration) AS Avg_Duration
FROM Movie
GROUP BY Language
ORDER BY Avg_Duration ASC;

SELECT Payment_Method, SUM(Amount) AS Total_Amount
FROM Payment
WHERE Payment_Status = 'Success' AND Amount > 300
GROUP BY Payment_Method
HAVING SUM(Amount) > 1000
ORDER BY Total_Amount DESC;


-- Subqueries

SELECT * 
FROM Movie 
WHERE Duration = (SELECT MAX(Duration) FROM Movie);

SELECT * 
FROM Movie 
WHERE Duration = (SELECT MIN(Duration) FROM Movie);

SELECT * 
FROM Theater 
WHERE Screens = (SELECT MAX(Screens) FROM Theater);

SELECT * 
FROM Theater 
WHERE Screens = (SELECT MIN(Screens) FROM Theater);

SELECT * 
FROM Booking 
WHERE Seats = (SELECT MAX(Seats) FROM Booking);

SELECT * 
FROM Booking 
WHERE Seats = (SELECT MIN(Seats) FROM Booking);

SELECT * 
FROM Payment 
WHERE Amount = (SELECT MAX(Amount) FROM Payment);

SELECT * 
FROM Payment 
WHERE Amount = (SELECT MIN(Amount) FROM Payment);

SELECT Movie_Name 
FROM Movie 
WHERE Duration > (SELECT AVG(Duration) FROM Movie);

SELECT Theater_Name 
FROM Theater 
WHERE Screens > (SELECT AVG(Screens) FROM Theater);



SELECT Movie_Name 
FROM Movie 
WHERE Duration > (SELECT Duration FROM Movie WHERE Movie_ID = 205);

SELECT Theater_Name 
FROM Theater 
WHERE Screens > (SELECT Screens FROM Theater WHERE Theater_Id = 102);

SELECT Customer_Name 
FROM Customer 
WHERE City = (SELECT City FROM Customer WHERE Customer_Id = 105);

SELECT * 
FROM Booking 
WHERE Seats > (SELECT Seats FROM Booking WHERE Booking_ID = 305);

SELECT * 
FROM Payment 
WHERE Amount > (SELECT Amount FROM Payment WHERE Payment_ID = 405);

SELECT Movie_Name 
FROM Movie 
WHERE Duration < (SELECT AVG(Duration) FROM Movie);

SELECT Theater_Name 
FROM Theater 
WHERE Screens < (SELECT AVG(Screens) FROM Theater);



SELECT Customer_Name 
FROM Customer 
WHERE Customer_Id IN (SELECT Customer_ID FROM Booking);

SELECT Movie_Name 
FROM Movie 
WHERE Movie_ID IN (SELECT Movie_ID FROM Shows);

SELECT Theater_Name 
FROM Theater 
WHERE Theater_Id IN (SELECT Theater_Id FROM Shows);

SELECT Customer_Name 
FROM Customer 
WHERE Customer_Id NOT IN (SELECT Customer_ID FROM Booking);



SELECT Movie_Name 
FROM Movie 
WHERE Language = 'Telugu' 
  AND Duration > (SELECT AVG(Duration) FROM Movie);

SELECT Theater_Name 
FROM Theater 
WHERE City = 'Tirupati' 
  AND Screens > (SELECT AVG(Screens) FROM Theater);

SELECT * 
FROM Payment 
WHERE P_Status = 'Success' 
  AND Amount > (SELECT AVG(Amount) FROM Payment);

SELECT Customer_Name 
FROM Customer 
WHERE Customer_ID IN (
    SELECT Customer_ID 
    FROM Booking 
    GROUP BY Customer_ID 
    HAVING COUNT(Booking_ID) > (
        SELECT AVG(Booking_Count) 
        FROM (SELECT COUNT(Booking_ID) AS Booking_Count FROM Booking GROUP BY Customer_ID) AS CustomerBookings
    )

);
SELECT Movie_Name
FROM Movie m1
WHERE Duration > (
    SELECT AVG(Duration)
    FROM Movie m2
    WHERE m2.Language = m1.Language
);

SELECT Theatre_Name
FROM Theatre t1
WHERE Screens > (
    SELECT AVG(Screens)
    FROM Theater t2
    WHERE t2.City = t1.City
);


SELECT DISTINCT c.*
FROM Customer c
JOIN Booking b1 ON c.Customer_ID = b1.Customer_ID
WHERE b1.Seats > (
    SELECT AVG(Seats)
    FROM Booking b2
    WHERE b2.Customer_ID = b1.Customer_ID
);

SELECT p1.*
FROM Payment p1
WHERE Amount > (
    SELECT AVG(Amount)
    FROM Payment p2
    WHERE p2.Payment_Method = p1.Payment_Method
);

SELECT MovieName
FROM Movie m1
WHERE Duration > (
    SELECT AVG(Duration)
    FROM Movie m2
    WHERE m2.Genre = m1.Genre
);