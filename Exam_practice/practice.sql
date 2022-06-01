--part I
-- 1. a,b
-- 2. e
-- 3. 5

CREATE TABLE R
(
	RID INT PRIMARY KEY,
	A1 VARCHAR(100),
	K2 INT,
	A2 INT,
	A3 INT,
	A4 INT,
	A5 VARCHAR(30),
	A6 INT
);

INSERT INTO R SELECT 2,'Punctu-acela de miscare, mult mai slab ca boaba spumii,',100,1,3,3,'M1',22;
INSERT INTO R SELECT 3,'E stapanul fara margini peste marginile lumii...',200,1,3,3,'M1',22;
INSERT INTO R SELECT 4,'De-atunci negura eterna se desface in fasii,',150,2,3,4,'M1',23;
INSERT INTO R SELECT 5,'De atunci rasare lumea, luna, soare si stihii...',700,2,4,4,'M2',29;
INSERT INTO R SELECT 6,'De atunci si pana astazi colonii de lumi pierdute',300,3,4,5,'M2',29;
INSERT INTO R SELECT 7,'Vin din sure vai de chaos pe carari necunoscute',350,3,4,5,'M5',23;
INSERT INTO R SELECT 8,'Si in roiuri luminoase izvorand din infinit',400,3,5,7,'M5',29;
INSERT INTO R SELECT 9,'Sunt atrase in viata de un dor nemarginit.',500,4,5,7,'M2',30;
INSERT INTO R SELECT 10,
'Iar in lumea asta mare, noi copii ai lumii mici,',
450,
4,
5,
7,
'M7',
30;
INSERT INTO R SELECT 11,
'Facem pe pamantul nostru musunoaie de furnici;',
250,
4,
6,
7,
'M7',
30;
INSERT INTO R SELECT 12,
'Microscopice popoare, regi, osteni si invatati',
800,
5,
6,
7,
'M6',
22;
INSERT INTO R SELECT 13,
'Ne succedem generatii si ne credem minunati;',
750,
5,
6,
7,
'M6',
23;

SELECT r1.RID, r1.K2, COUNT(*) NumRows
FROM R r1 INNER JOIN R r2 ON r1.A2 = r2.A3
INNER JOIN R r3 ON r2.A3 = r3.A4
WHERE r1.A1 LIKE '_%'
GROUP BY r1.RID, r1.K2
HAVING COUNT(*) >= 6

SELECT r1.A6, MAX(r1.A2) MaxA2
FROM R r1
WHERE r1.A5 IN ('M1', 'M2')
GROUP BY r1.A6
EXCEPT
SELECT DISTINCT r2.A6, r2.A2
FROM R r2

CREATE TABLE InsertLog
(
	A5Value varchar(30),
	NumRows int
);

go
CREATE OR ALTER FUNCTION ufF1(@A5 CHAR(2))
RETURNS INT
BEGIN
RETURN
(SELECT COUNT(*)
FROM R
WHERE A5 = @A5)
END
GO

go
CREATE OR ALTER TRIGGER TrOnInsert
ON R
FOR INSERT
AS
INSERT InsertLog(A5Value, NumRows)
SELECT i.A5, dbo.ufF1(i.A5)
FROM inserted i
GO

INSERT R(RID, K2, A5) VALUES
(14, 14, 'M1'), (15, 15, 'M1'), (16, 16, 'M2')
INSERT R(RID, K2, A5) VALUES
(17, 17, 'M1'), (18, 18, 'M3')

select * from InsertLog;

select * from R;

-----------------------------------------------------------

CREATE TABLE DroneManufacturers
(
	id int PRIMARY KEY,
	[name] varchar(100),
);

INSERT INTO DroneManufacturers SELECT 1,'M1';
INSERT INTO DroneManufacturers SELECT 2,'M2';
INSERT INTO DroneManufacturers SELECT 3,'M3';

CREATE TABLE DroneModels
(
	id int PRIMARY KEY,
	drone_manufacturer_id int,
	[name] varchar(100),
	battery_life int,
	maximum_speed int,
	CONSTRAINT FK_drone_manufacturer_id FOREIGN KEY (drone_manufacturer_id) REFERENCES DroneManufacturers(id),
);

INSERT INTO DroneModels SELECT 1,1,'DM1',15,15;
INSERT INTO DroneModels SELECT 2,2,'DM2',15,15;
INSERT INTO DroneModels SELECT 3,3,'DM3',15,15;

CREATE TABLE Drones
(
	serial_number int PRIMARY KEY,
	drone_model_id int
	CONSTRAINT FK_drone_model_id FOREIGN KEY (drone_model_id) REFERENCES DroneModels(id),
);

INSERT INTO Drones SELECT 1,1;
INSERT INTO Drones SELECT 2,1;
INSERT INTO Drones SELECT 3,1;
INSERT INTO Drones SELECT 4,2;
INSERT INTO Drones SELECT 5,2;
INSERT INTO Drones SELECT 6,3;

CREATE TABLE PizzaShops
(
	[name] varchar(100) PRIMARY KEY,
	[address] varchar(100)
);

CREATE TABLE Customers
(
	[name] varchar(100) PRIMARY KEY,
	loyality_score int
);

CREATE TABLE Deliveries
(
	customer_name varchar(100),
	pizza_shop_name varchar(100),
	drone_serial_number int,
	[timestamp] datetime,

	CONSTRAINT FK_customer_name FOREIGN KEY (customer_name) REFERENCES Customers([name]),
	CONSTRAINT FK_pizza_shop_name FOREIGN KEY (pizza_shop_name) REFERENCES PizzaShops([name]),
	CONSTRAINT FK_drone_serial_number FOREIGN KEY (drone_serial_number) REFERENCES Drones(serial_number),
);


GO
CREATE OR ALTER VIEW myView AS
SELECT DroneManufacturers.name, COUNT(*) AS AMMOUNT
FROM Drones INNER JOIN DroneModels ON DroneModels.id = Drones.drone_model_id INNER JOIN DroneManufacturers ON DroneManufacturers.id = DroneModels.drone_manufacturer_id
GROUP BY DroneManufacturers.name
HAVING COUNT(*) = (	SELECT MAX(AMMOUNT)
					FROM (SELECT DroneManufacturers.name, COUNT(*) AS AMMOUNT
					FROM Drones INNER JOIN DroneModels ON DroneModels.id = Drones.drone_model_id INNER JOIN DroneManufacturers ON DroneManufacturers.id = DroneModels.drone_manufacturer_id
					GROUP BY DroneManufacturers.name) AS R);
GO


