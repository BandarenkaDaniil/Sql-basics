/*
	Вывести на экран отчет истории изменения 
	почасовых ставок как показано в примере.
*/

USE AdventureWorks2012

SELECT 
	Emp.JobTitle, 
	PayHist.Rate, 
	PayHist.RateChangeDate, 
	(
		'The rate for ' + 
		Emp.JobTitle + 
		' was set to ' +
		CONVERT(varchar, PayHist.Rate, 1) + 
		' at ' +
		CONVERT(varchar, PayHist.ModifiedDate, 106) -- 106 is Date Format Number
	) as Report
FROM AdventureWorks2012.HumanResources.EmployeePayHistory PayHist
JOIN AdventureWorks2012.HumanResources.Employee Emp
	ON PayHist.BusinessEntityID = Emp.BusinessEntityID