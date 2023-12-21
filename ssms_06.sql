--SELECT 
--	ed.FirstName + ' ' + ed.LastName AS FullName,
--	Age
--FROM EmployeeDemographics AS ed
--ORDER BY Age DESC;

--SELECT 
--	FirstName,
--	LastName,
--	Gender,
--	Salary,
--	COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
--FROM EmployeeDemographics AS ed
--JOIN EmployeeSalary AS es
--	ON Ed.EmployeeID = es.EmployeeID;

--WITH CTE_Employee AS  
--(
--SELECT 
--	FirstName,
--	LastName,
--	Gender,
--	Salary,
--	COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender,
--	AVG(Salary) OVER (PARTITION BY Gender) AS AvgSalary
--FROM EmployeeDemographics AS ed
--JOIN EmployeeSalary AS es
--	ON Ed.EmployeeID = es.EmployeeID
--WHERE Salary > 45000
--)
--SELECT 
--	FirstName,
--	Salary,
--	AvgSalary
--FROM CTE_Employee;

--CREATE TABLE #Temp_Employee 
--(
--EmployeeID int,
--JobTitle VARCHAR(100),
--Salary int
--)

--SELECT *
--FROM #Temp_Employee;

--INSERT INTO #Temp_Employee VALUES
--('1001', 'HR', '45000');

SELECT *
FROM #Temp_Employee;