/*
	������� ���� AddressType �� �������, ������� ���
	��������� ����������� � �������� �� ���������
*/

USE AdventureWorks2012;

ALTER TABLE
    dbo.Address
DROP COLUMN
    AddressType;
ALTER TABLE
    dbo.Address
DROP CONSTRAINT
    AK_Address_PostalCode,
    DF_Address_ModifiedDate