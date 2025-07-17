
--แสดงข้อมูลทุกอย่างของพนักงานทุกคน
SELECT * from Employees
--แสดงข้อมูลรหัส , ชื่อและนามสกุลของพนักงานทุกคน
SELECT EmployeeID, FirstName,LastName from Employees
--แสดงข้อมูลทุกอย่างของพนักงานที่อยู่ในเมือง London
SELECT * from Employees WHERE City = 'London'
--แสดงข้อมูลรหัสพนักงาน , ชื่อ และนามสกุลของพนักงานที่อยู่ในเมือง London
SELECT EmployeeID, FirstName,LastName from Employees WHERE City = 'London'
--•แสดงชื่อเมือง และประเทศทั้งหมดของลูกค้า
SELECT City,Country From Customers
--•DISTINCT ข้อมูลที่แสดงออกมาซ้ากันจะแสดงเพียง 1 แถว
SELECT Distinct City,Country From Customers
--•แสดงข้อมูลสินค้าที่มีราคาสูงกว่า 200
SELECT * from Products where UnitPrice > 200
--• แสดงข้อมูลลูกค้าที่อยู่ในประเทศ USA หรือ ในเมือง Vancouver
SELECT * from Customers WHERE City ='London' OR City = 'Vancouver'
SELECT * from Customers WHERE Country = 'USA' OR City = 'Vancouver'
--•แสดงข้อมูลสินค้าที่มีราคาตั้งแต่ 50 $ ขึ้นไปและจำานวนคงเหลือน้อยกว่า 20 ชิ้น
SELECT * from Products WHERE UnitPrice >= 50 AND UnitsInStock < 20
SELECT * FROM Products
where UnitsInStock<20 or UnitsOnOrder <= ReorderLevel
--•แสดงข้อมูลสินค้าที่มีราคาตั้งแต่ 50-100 $
SELECT * FROM Products WHERE UnitPrice BETWEEN 100 and 150
SELECT * from Products where UnitPrice >= 50 AND UnitPrice<=100
--•แสดงข้อมูลลูกค้าที่อยู่ในประเทศ Brazil, Argentina, Mexico
SELECT * from Customers where Country in ('Brazil','Argentina','Mexico')
SELECT * FROM Customers WHERE Country = 'Brazil' or Country = 'Argentina' or Country = 'Mexico'
--•แสดงข้อมูลพนักงานมีชื่อขึ้นต้นด้วยตัวอักษร N หรือ อืนๆ
SELECT * FROM Employees WHERE FirstName LIKE 'N%'
SELECT * from Customers where CompanyName like 'A%'
SELECT * from Customers WHERE CompanyName LIKE 'Y%'
SELECT Firstname,lastname from Employees WHERE FirstName LIKE 'AN%'
SELECT * FROM Employees WHERE FirstName LIKE ' stres%'
--ต้องการชื่อชริษัทลูกค้าที่ตัวอักษรลำดับ 2 เป็น A
SELECT companyname from Customers WHERE CompanyName like 'A%'
--• คาสั่งในการจัดเรียงลาดับประกอบด้วย
--❖ ASC (Ascending) จากน้อย ไป มาก
--❖ DESC (Descending) จาก มาก ไป น้อย
--•แสดงข้อมูลรหัสสินค้า, ชื่อสินค้า และราคาโดยเรียงลาดับผลลัพธ์จากราคาสูงที่สุดไปต่าที่สุด
SELECT ProductID,ProductName,UnitPrice FROM Products ORDER BY UnitPrice DESC
--•แสดงข้อมูลชื่อบริษัทที่เป็นลูกค้า และชื่อผู้ติดต่อโดยเรียงล าดับชื่อผู้ติดต่อตามล าดับตัวอักษร
SELECT CompanyName, ContactName FROM Customers ORDER BY ContactName ASC
--ต้องการชื่อและราคา จำนวนคงหลือ ที่มีจำนวนคลเหลือมากสุด10อันดับแรก
SELECT top 10 PROductname, unitprice, UnitsInStock FROM Products ORDER BY UnitsInStock DESC
--•แสดงข้อมูลรหัสประเภทสินค้า, ชื่อสินค้า และราคา โดยเรียงล าดับตามรหัสประเภทสินค้าจากน้อยไปมาก หากรหัสประเภทเป็นรหัส
--เดียวกันให้เรียงตามราคาสินค้าจากมากไปน้อย
SELECT CategoryID, ProductName, UnitPrice FROM Products ORDER BY CategoryID ASC , UnitPrice DESC



