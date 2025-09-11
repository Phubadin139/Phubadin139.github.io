--1. หาต าแหน่งของ Nancy ก่อน
Select Title From Employees
Where FirstName = 'Nancy'

--หาข้อมูลคนที่มีต าแหน่งเดียวกับ Nancy
Select *
From Employees
Where Title = (Select Title From Employees Where FirstName = 'Nancy')

--ต้องการชื่อนามสกุลพนักงานที่อายุมากที่สุด
SELECT FirstName, LastName,*  From Employees
Where BirthDate = (Select MIN(BirthDate)From Employees)

--ต้องการซื้อสินค้าที่มีราคามากกว่าสินค้าชื่อ ikura 
SELECT ProductName From Products
WHERE UnitPrice > (Select UnitPrice from Products
where ProductName = 'ikura')

--ต้องการชื่อบริษัทลูกค้าที่อยู่เมืองเดียวกับบริษัทที่ชื่อ Around the horn
SELECT CompanyName From Customers
where city = (Select city from Customers
where CompanyName = 'Around the horn')

--ต้องการชื่อนามสกุลพนักงานที่เข้างานล่าสุด
SELECT FirstName, LastName from Employees
WHERE HireDate = (Select MAX(HireDate)from Employees)

--ข้อมูลใบสั่งซื้อที่ถูกส่งไปประเทศที่ไม่มีผู้ผลิตสินค้าตั้งอยู่
Select * From Orders
Where ShipCountry not in (Select distinct country from Suppliers)

SELECT ROW_NUMBER() OVER (order by UnitPrice) AS RowNum, ProductName, UnitPrice 
from Products
WHERE UnitPrice < 50


INSERT into Shippers
VALUES('บริษัทขนเยอะจำกัด','081-12345678')

INSERT into Shippers(CompanyName)
VALUES('บริษัทขนมหาศาลจำกัด')

Select * from Products
SELECT * from Customers

INSERT into Customers(CompanyName)
VALUES ('ภูบดินทร์')

--จงเพิ่มสินค้า ปลาแดกบอง ราคา 1.5$ จำนวน12
INSERT into Products(ProductName,UnitPrice,UnitsInStock)
VALUES('ปลากระป๋อง','1.5','12')

Update Shippers
set Phone = '085-99998989'
where ShipperID = 6

--ปรับปรุงจำนวนสินค้าคงเหลือสินค้ารหัส 1 เพิ่มจำนวนเข้าไป100
UPDATE Products
set UnitsInStock = UnitsInStock+100
WHERE ProductID = 1

--ปรับปรุง เมือง ประเทศลูกค้า รหัส A0001 ให้เป็นอุดรธานี thailand
Update Customers
set City = 'อุดรธานี', country = 'Thailand'
where CustomerID = 'A0001 '


DELETE FROM Products
WHERE ProductID = 78;

SELECT * from Products


