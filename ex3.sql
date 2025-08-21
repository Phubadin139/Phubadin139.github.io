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

--จงแสดงหมายเลขใบสั่งซื้อ, ชื่อบริษัทลูกค้า, สถานที่ส่งของ, และพนักงานผู้ดูแล
SELECT O.OrderID เลขใบสั่งซื้อ, C.CompanyName ลูกค้า, E.FirstName พนักงาน, O.ShipAddress ส่งไปที่
FROM Orders O
join Customers C on O.CustomerID=C.CustomerID
join Employees E on O.EmployeeID=E.EmployeeID


select e.EmployeeID, FirstName , count(*) as [จ านวน order]
, sum(freight) as [Sum of Freight]
from Employees e join Orders o on e.EmployeeID = o.EmployeeID
where year(orderdate) = 1998
group by e.EmployeeID, FirstName
