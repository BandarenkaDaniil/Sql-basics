/*
	��������� ���������� ALTER TABLE, �������� ��� ������� 
	dbo.Address ����������� DEFAULT ��� ���� ModifiedDate,
	 ������� �������� �� ��������� ������� ���� � �����
*/

USE AdventureWorks2012

ALTER TABLE dbo.Address
ADD CONSTRAINT modified_date_default DEFAULT GETDATE() FOR ModifiedDate