/*
	Выполните код, созданный во втором задании второй лабораторной работы. 
	Добавьте в таблицу dbo.Address поля CountryRegionCode NVARCHAR(3) и 
	TaxRate SMALLMONEY. Также создайте в таблице вычисляемое поле DiffMin, 
	считающее разницу между значением в поле TaxRate и минимальной 
	налоговой ставкой 5.00
*/

USE AdventureWorks2012;

ALTER TABLE
    dbo.Address
ADD
    CountryRegionCode NVARCHAR(3),
    TaxRate SMALLMONEY,
    DiffMin AS (TaxRate - 5.00);