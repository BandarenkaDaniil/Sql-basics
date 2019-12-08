/*
	������� ������ �� dbo.Address, ������� ������ �� ����� ������ 
	��� ������� AddressType � ����������� AddressID
*/

USE AdventureWorks2012;

DELETE
    Address
FROM
    dbo.Address Address, dbo.Address Address1
WHERE
    Address.AddressID < Address1.AddressID AND Address.AddressType = Address1.AddressType 