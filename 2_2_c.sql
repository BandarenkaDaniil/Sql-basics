/*
	��������� ���������� ALTER TABLE, �������� ��� �������
	dbo.PersonPhone ����������� ��� ���� PhoneNumber, 
	����������� ���������� ����� ���� �������
*/

USE AdventureWorks2012

ALTER TABLE dbo.Address
ADD CONSTRAINT check_postal_code CHECK (PostalCode NOT LIKE '%[a-zA-Z]%')