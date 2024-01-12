--SELECT 
--	FirstName,
--	LastName,
--	Age,
--CASE 
--	WHEN Age > 30 THEN 'Old'
--	ELSE 'Young'
--END AS Category
--FROM EmployeeDemographics
--WHERE Age IS NOT NULL
--ORDER BY Age DESC;

--SELECT 
--	FirstName,
--	LastName,
--	JobTitle,
--	Salary,
--CASE 
--	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
--	WHEN JobTitle = 'Accoutnant' THEN Salary + (Salary * 0.20)
--	WHEN JobTitle = 'HR' THEN Salary + (Salary * .05)
--	ELSE Salary + (Salary * .03)
--END AS SalaryRaise 
--FROM EmployeeDemographics AS ed
--INNER JOIN EmployeeSalary AS es
--	ON ed.EmployeeID = es.EmployeeID
--ORDER BY Salary DESC;

--SELECT 
--	JobTitle,
--	AVG(Salary) AS 'AverageSalary'
--FROM EmployeeDemographics AS ed
--INNER JOIN EmployeeSalary AS es
--	ON Ed.EmployeeID = es.EmployeeID
--GROUP BY JobTitle
--HAVING AVG(Salary) > 40000
--ORDER BY AVG(Salary) DESC;

--SELECT *
--FROM EmployeeDemographics 
--UPDATE EmployeeDemographics
--SET Age = 36, Gender = 'Female'
--WHERE FirstName = 'Angela' AND LastName = 'Martin';

--DELETE FROM EmployeeDemographics
--WHERE EmployeeID = 1009;

SELECT * 
FROM EmployeeDemographics;
