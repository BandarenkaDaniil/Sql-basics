/*
	Заполните временную таблицу данными из dbo.Address. 
	Поле CountryRegionCode заполните значениями из таблицы
	Person.StateProvince. Поле TaxRate заполните значениями
	из таблицы Sales.SalesTaxRate. Выберите только те записи,
	где TaxRate > 5. Выборку данных для вставки в табличную
	переменную осуществите в Common Table Expression (CTE).
*/

USE AdventureWorks2012;

WITH TaxRate_CTE(StateProvinceID, TaxRate) AS (
    SELECT
		StateProvinceID,
        TaxRate
    FROM
        Sales.SalesTaxRate
    WHERE
        TaxRate > 5.00
)

INSERT INTO #Address (
    AddressID,
	AddressLine1,
	AddressLine2,
	City,
	StateProvinceID,
	PostalCode,
	ModifiedDate,
	CountryRegionCode,
	TaxRate
)
SELECT
	Addr.AddressID,
	Addr.AddressLine1,
	Addr.AddressLine2,
	Addr.City,
	Addr.StateProvinceID,
	Addr.PostalCode,
	Addr.ModifiedDate,
	StProv.CountryRegionCode,
	cte.TaxRate
FROM
    dbo.Address as Addr
    INNER JOIN Person.StateProvince as StProv
        ON (Addr.StateProvinceID = StProv.StateProvinceID)
	INNER JOIN Sales.SalesTaxRate as TxRt
		ON (StProv.StateProvinceID = TxRt.StateProvinceID)
	INNER JOIN TaxRate_CTE as cte
		ON (TxRt.StateProvinceID = cte.StateProvinceID)