--1)
--CREATE TABLE Trains
--(
--	[name] varchar(50),
--	[type] varchar(50),
--	PRIMARY KEY ([name]),
--	CONSTRAINT FK_type FOREIGN KEY ([type]) REFERENCES TrainTypes([name])
--);

--CREATE TABLE TrainTypes
--(
--	[name] varchar(50),
--	[description] varchar(256),
--	PRIMARY KEY ([name])
--);

--CREATE TABLE Stations
--(
--	[name] varchar(50) UNIQUE,
--	PRIMARY KEY([name])
--);

--CREATE TABLE Routes
--(
--	[name] varchar(50) UNIQUE,
--	train varcHar(50),
--	PRIMARY KEY([name]),
--	CONSTRAINT FK_train FOREIGN KEY (train) REFERENCES Trains([name])
--);

--CREATE TABLE StationsOnRoutes
--(
--	routeName varchar(50),
--	stationName varchar(50),
--	arrival time,
--	departure time,
--	PRIMARY KEY (routeName,stationName),
--	CONSTRAINT FK_routeName FOREIGN KEY (routeName) REFERENCES Routes([name]),
--	CONSTRAINT FK_stationName FOREIGN KEY (stationName) REFERENCES Stations([name]),
--);


--routes that pass through all the stations

INSERT INTO TrainTypes SELECT '1','type 1';

INSERT INTO Trains SELECT 'train 1','1';
INSERT INTO Trains SELECT 'train 2','1';

INSERT INTO Stations SELECT 'station 1';
INSERT INTO Stations SELECT 'station 2';
INSERT INTO Stations SELECT 'station 3';

INSERT INTO Routes SELECT 'route 1','train 1';
INSERT INTO Routes SELECT 'route 2','train 1';
INSERT INTO Routes SELECT 'route 3','train 2';

INSERT INTO StationsOnRoutes SELECT 'route 1','station 1',GETDATE(),GETDATE();
INSERT INTO StationsOnRoutes SELECT 'route 2','station 1',GETDATE(),GETDATE();
INSERT INTO StationsOnRoutes SELECT 'route 2','station 2',GETDATE(),GETDATE();
INSERT INTO StationsOnRoutes SELECT 'route 2','station 3',GETDATE(),GETDATE();


--3)
USE TrainScheduler
GO
CREATE OR ALTER VIEW routesOverAllStations AS
SELECT routeName
FROM StationsOnRoutes
GROUP BY routeName
HAVING COUNT(stationName) = (SELECT COUNT(*) FROM Stations)
GO

SELECT *
FROM routesOverAllStations;


--4)
USE TrainScheduler
GO
CREATE OR ALTER FUNCTION udf_StationsHavingMoreThanRRoutes (
	@R int
)
RETURNS TABLE
AS
RETURN
	SELECT stationName
	FROM StationsOnRoutes
	GROUP BY stationName
	HAVING COUNT(routeName) > @R
GO

SELECT *
FROM udf_StationsHavingMoreThanRRoutes(1);


--2)
USE TrainScheduler
GO
CREATE OR ALTER PROCEDURE addStationOnRoute
@route varchar(50),
@station varchar(50),
@arrival time,
@departure time
AS
IF EXISTS 
(
	SELECT *
	FROM StationsOnRoutes
	WHERE routeName = @route AND stationName = @station
)
BEGIN
	UPDATE StationsOnRoutes
	SET arrival = @arrival, departure = @departure
	WHERE  routeName = @route AND stationName = @station
END
ELSE
BEGIN
	INSERT INTO StationsOnRoutes SELECT @route,@station,@arrival,@departure
END
GO

SELECT *
FROM StationsOnRoutes
EXEC addStationOnRoute 'route 1','station 2','5:20','5:40'
SELECT *
FROM StationsOnRoutes

