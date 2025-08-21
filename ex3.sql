--แสดงชื่อปรพเภทสินค้า ชื่อสินค้าและราคาสินค้า
SELECT c.CategoryName, p.ProductName, p.UnitPrice 
FROM Products as p,Categories as c
where P.CategoryID=C.CategoryID
AND CategoryName = 'seafood'

SELECT c.CategoryName, p.ProductName, p.UnitPrice 
FROM Products as p join Categories as c
on P.CategoryID=C.CategoryID
WHERE CategoryName = 'seafood'


SELECT CompanyName, OrderID 
from Orders,Shippers
where Shippers.ShipperID = Orders.ShipVia

--
SELECT CompanyName, OrderID
FROM Orders, Shippers
WHERE Shippers.ShipperID = Orders.Shipvia
AND OrderID = 10275

SELECT CompanyName, OrderID
FROM Orders JOIN Shippers
ON Shippers.ShipperID=Orders.Shipvia
WHERE OrderID=10275
--
--ต้องการรหัสสินค้า ชื่อสินค้า บริษัทผู้จำหน่าย ประเทศ เอาเฉพาะที่มาจาก UK USA
SELECT p.ProductID, p.ProductName, s.CompanyName, s.Country
FROM Products p JOIN Suppliers s ON p.SupplierID = s.SupplierID
where Country in ('usa', 'uk')

--ต้องการรหัสพนักงาน ชื่อพนักงาน รหัสใบสั่งซื้อที่เก่ี่ยวข้อง เรียงตามรหัสพนักงาน
SELECT e.EmployeeID, FirstName, o.OrderID
from  Employees e JOIN Orders o on e.EmployeeID = o.EmployeeID
ORDER by EmployeeID

--ต้องการชื่อบริษัทส่งของ และจำนวนใบสั่งซื้อที่ถูกต้อง
SELECT s.CompanyName, COUNT(*) จำนวนorder
From Shippers s JOIN Orders o on s.ShipperID = o.ShipVia
GROUP by s.CompanyName
ORDER BY 2 DESC

--ต้องการรหัสสินค้า ชื่อสินค้า และจำนวนทั้งหมดที่ขายได้
SELECT p.ProductID , p.ProductName, SUM(Quantity) จำนวนที่ขายได้
FROM Products p JOIN [Order Details] o ON p.ProductID = o.ProductID
GROUP BY p.ProductID, p.ProductName


-- ต้องการรหัสสินค้า ชื่อสินค้า ที่ nancy ขายได้ทั้งหมดเรียงตามรหัสสินค้า
SELECT distinct p.ProductID, p.ProductName
from Employees e JOIN Orders o on e.EmployeeID = o.EmployeeID
                 JOIN [Order Details] od ON o.OrderID = od.OrderID
                 JOIN Products p ON p.ProductID = od.ProductID
WHERE e.FirstName = 'Nancy'
ORDER by ProductID
