--SELECT 
--	FirstName,
--	Age
--FROM EmployeeDemographics;

--SELECT TOP 5 *
--FROM EmployeeDemographics;

--SELECT DISTINCT(EmployeeID)
--FROM EmployeeDemographics;

--SELECT COUNT(LastName) AS LastNameCount
--FROM EmployeeDemographics;

--SELECT MAX(Salary)
--FROM EmployeeSalary;

--SELECT *
--FROM xxxx.dbo.EmployeeSalary;



--SELECT *
--FROM EmployeeDemographics
--WHERE FirstName = 'Jim';

--SELECT *
--FROM EmployeeDemographics
--WHERE Age >= 32 AND Gender = 'Male';

--SELECT *
--FROM EmployeeDemographics
--WHERE Age >= 32 OR Gender = 'Male';

--SELECT * 
--FROM EmployeeDemographics
--WHERE LastName LIKE '%S%';

--SELECT * 
--FROM EmployeeDemographics
--WHERE LastName LIKE 'S%O%';

--SELECT * 
--FROM EmployeeDemographics
--WHERE FirstName IS NULL;

--SELECT * 
--FROM EmployeeDemographics
--WHERE FirstName IN ('Jim', 'Michael');

--SELECT  Gender,
--				COUNT(Gender) AS GenderCount
--FROM EmployeeDemographics
--WHERE Age > 30
--GROUP BY Gender
--ORDER BY GenderCount DESC;