/*
	��������� ���������� ALTER TABLE, �������� � ������� 
	dbo.PersonPhone ����� ���� ID, ������� �������� 
	���������� ������������ UNIQUE ���� bigint � ����� 
	�������� identity. ��������� �������� ��� ���� identity
	������� 2 � ���������� ������� 2
*/

USE AdventureWorks2012

ALTER TABLE dbo.Address 
	ADD CONSTRAINT PK_ADDRESS PRIMARY KEY (StateProvinceID, PostalCode)