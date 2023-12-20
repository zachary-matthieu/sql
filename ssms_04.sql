--SELECT
--	FirstName,
--	LastName,
--	Age,
--CASE 
--	WHEN Age > 35 THEN 'Old'
--	WHEN Age BETWEEN 30 AND 35 THEN 'Middle'
--	ELSE 'Young'
--END	
--FROM EmployeeDemographics
--WHERE Age IS NOT NULL
--ORDER BY Age;

--SELECT
--	FirstName,
--	LastName,
--	JobTitle,
--	Salary,
--CASE 
--	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
--	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
--	WHEN JobTitle = 'HR' THEN Salary + (Salary * .025)
--	ELSE Salary + (Salary * .01)
--END	 AS SalaryPostRaise
--FROM EmployeeDemographics
--JOIN EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

SELECT 
	JobTitle,
	COUNT(JobTitle) AS TitleCount
FROM EmployeeDemographics AS ed
JOIN EmployeeSalary AS es
	ON ed.EmployeeID = es.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1
ORDER BY TitleCount DESC;