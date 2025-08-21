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
