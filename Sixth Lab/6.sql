/*
	Создайте хранимую процедуру, которая будет возвращать сводную таблицу 
	(оператор PIVOT), отображающую данные о средней цене 
	(Production.Product.ListPrice) продукта в каждой подкатегории 
	(Production.ProductSubcategory) по определенному классу 
	(Production.Product.Class). Список классов передайте в 
	процедуру через входной параметр.
*/

USE AdventureWorks2012;


CREATE PROCEDURE
    dbo.SubCategoriesByClass 
    @Classes NVARCHAR(390)
AS
    DECLARE
        @Query
    AS
        NVARCHAR(MAX);

    SET @Query = '
		SELECT
			SubcategoryName,
			' + @Classes + '
		FROM
		(
			SELECT
				ProductSubcategory.Name AS SubcategoryName,
				Product.Class AS Class,
			Product.ListPrice as ListPrice
			FROM
				Production.ProductSubcategory
				INNER JOIN Production.Product
					ON ProductSubcategory.ProductSubcategoryID = Product.ProductSubcategoryID
		) AS SourceTable
		PIVOT
		(
			Avg(ListPrice)
			FOR
				Class
			IN
			(
			  ' + @Classes + '
			)
		) AS PivotTable;
			';

    EXEC (@Query);