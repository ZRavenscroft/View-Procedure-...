CREATE DATABASE EventList
USE EventList

CREATE TABLE Cities
(
	Id INT PRIMARY KEY IDENTITY,
	CityName NVARCHAR(20) NOT NULL
)

CREATE TABLE Speakers
(
	Id INT PRIMARY KEY IDENTITY,
	FullName NVARCHAR(20) NOT NULL
)

CREATE TABLE Events
(
	Id INT PRIMARY KEY IDENTITY,
	EventName NVARCHAR(20) NOT NULL,
	CityId INT FOREIGN KEY REFERENCES Cities(Id),
	StartDate DATETIME,
	EndDate DATETIME
)

CREATE TABLE EventSpeakers
(
	Id INT PRIMARY KEY IDENTITY,
	SpeakerId INT FOREIGN KEY REFERENCES Speakers(Id),
	EventId INT FOREIGN KEY REFERENCES Events(Id)
)

INSERT INTO Cities
VALUES
	('Baku'),
	('New-York'),
	('Prague'),
	('Saint-Peterburg'),
	('Berlin')

INSERT INTO Events
VALUES
	('Concert', 1, '2022-11-27 20:00:00', '2022-11-27 22:00:00'),
	('Concert', 3, '2022-12-01 19:00:00', '2022-12-01 22:00:00'),
	('Consert', 4, '2022-12-05 20:00:00', '2022-12-05 23:00:00'),
	('Christmas', 2, '2022-12-24 23:59:59', '2022-12-31 23:59:59'), 
	('Consert', 5, '2022-12-15 20:00:00', '2022-12-15 23:00:00')

INSERT INTO Speakers
VALUES 
	('Jah-Khalib'),
	('The Weeknd'),
	('Rammstein'),
	('Nikolay Baskov'),
	('Santa Claus')

INSERT INTO EventSpeakers
VALUES
	(1,3),
	(2,4),
	(3,7),
	(4,5),
	(5,6)

SELECT Events.EventName,
(SELECT Cities.CityName FROM Cities WHERE Events.CityId = Cities.Id) AS 'Cities',
(SELECT COUNT(SpeakerId) FROM EventSpeakers WHERE EventSpeakers.EventId = Events.Id) AS 'Speakers',
(SELECT DATEDIFF(MINUTE, StartDate, EndDate)) AS 'Minutes' FROM Events 




