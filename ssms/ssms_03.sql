--SELECT 
--	ed.EmployeeID,
--	FirstName,
--	JobTitle,
--	Salary
--FROM EmployeeDemographics AS ed
--INNER JOIN EmployeeSalary AS es
--	ON ed.EmployeeID = es.EmployeeID
--WHERE Salary >= 45000
--ORDER BY Salary DESC;

--SELECT 
--	ed.EmployeeID,
--	FirstName,
--	JobTitle,
--	Salary
--FROM EmployeeDemographics AS ed
--INNER JOIN EmployeeSalary AS es
--	ON ed.EmployeeID = es.EmployeeID
--WHERE Salary >= 48000 AND JobTitle = 'Salesman'
--ORDER BY Salary DESC; 

--CREATE TABLE WarehouseEmployeeDemographics 
--(EmployeeID int, 
--FirstName varchar(50), 
--LastName varchar(50), 
--Age int, 
--Gender varchar(50))

--INSERT INTO WarehouseEmployeeDemographics VALUES
--(1013, 'Darryl', 'Philbin', NULL, 'Male'),
--(1050, 'Roy', 'Anderson', 31, 'Male'),
--(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
--(1052, 'Val', 'Johnson', 31, 'Female');

--SELECT *
--FROM WarehouseEmployeeDemographics
--UNION ALL
--SELECT *
--FROM EmployeeDemographics
--ORDER BY EmployeeID;

SELECT 
EmployeeID,
FirstName,
Age
FROM EmployeeDemographics
UNION 
SELECT 
EmployeeID,
JobTitle,
Salary
FROM EmployeeSalary
ORDER BY EmployeeID;
