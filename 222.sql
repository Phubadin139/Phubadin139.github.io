SELECT EmployeeID,FirstName,TitleOfCourtesy,LastName from Employees WHERE Country = 'USA'
SELECT * from Products where CategoryID in (1,2,4,8) and unitPrice BETWEEN 100 and 200
SELECT Country,City,CompanyName,ContactName,Phone from Customers WHERE Region = 'WA' or Region = 'WY'
SELECT * from Products where CategoryID =1 and UnitPrice<=20
OR CategoryID = 8 and UnitPrice >=150
SELECT Companyname from Customers where fax is null ORDER by CompanyName
SELECT * from Customers where CompanyName like '%com%'

SELECT Region,Country,City,CompanyName,Phone from Customers
ORDER by 1 ASC,2 ASC, 3 ASC
                                                                                -- AS ตามด้วยชื่อที่อยากตั้ง
SELECT Productid รหัสสินค้า, productname ชื่อสินค้า, unitprice, unitsinstock,unitprice * unitsinstock AS stockvalue
from Products

SELECT ProductID as รหัส,ProductName as สินค้า,UnitsInStock + UnitsOnOrder as จำนวนคงเหลือทั้งหมด,
--เขียนแบบนี้ก็ได้
    จุดสั่งซื้อ = ReorderLevel  
from Products where (UnitsInStock + UnitsOnOrder) < ReorderLevel
                                                            --Round ทำให้ทศนิยมหลังแสดงได้ตามเขียนเขียนเช่น 2หลักหลัก
SELECT ProductID as รหัสสินค้า,ProductName,UnitPrice as ราคาสินค้า,ROUND(UnitPrice * 0.07,2 ) AS Vat7 from Products

                                            --space คือเว้นช่องว่าง  + คือต่อกัน
SELECT EmployeeID, TitleOfCourtesy+FirstName+SPACE(1)+ LastName as [Employeename] from Employees


SELECT orderId, PRODUCTID, UNITPRICE, quantity,discount,
        (unitprice* quantity)-(Unitprice* quantity* discount) as netprice
 from [Order Details] 
 --หรือ
 SELECT orderId, PRODUCTID, UNITPRICE, quantity,discount,
        (unitprice* quantity) as totalprice,
        UnitPrice* Quantity*(1-Discount)as netprice
 from [Order Details] 

SELECT EmployeeID,FirstName,BirthDate,DATEDIFF(year,BirthDate,GETDATE()) age, HireDate,
 DATEDIFF(YEAR,HireDate,GETDATE()) yearinoffice
 FROM Employees
 SELECT GETDATE()

--• แสดงข้อมูลจานวนสินค้าที่มีเก็บไว้ต่ากว่า15ชิ้น
 SELECT COUNT(*) as จำนวนสินค้า, count(ProductID), count(ProductName), COUNT(UnitPrice)
  from Products where UnitsInStock < 15

--จำนวนลูกค้าอยู่USA
  SELECT count(*) from Customers WHere Country = 'USA'
--จำนวนพนักงานที่อยู่ london
  SELECT Count(*) from Employees WHERE City = 'london'
--จำนวนใบสั่งซื้อที่ออกปี1997
  SELECT COUNT(*) from Orders where YEAR(OrderDate) = 1997
--จำนวนครั้งที่ขายสินค้ารหัส1
  SELECT COUNT(*) FROM [Order Details] WHERE ProductID = 1

--function sum
--จำนวนสินค้าที่ขายได้ทั้งหมด
  SELECT sum(Quantity)
  FROM [order Details]
  WHERE ProductID= 2

--มูลค่าสินค้าในคลังทั้งหมด
  SELECT UnitPrice * UnitsInStock from Products

  --จำนวนสินค้ารหัส8 ที่สั่งซื้อแล้ว
  SELECT sum(UnitsOnOrder) from Products where CategoryID = 8

  --ราคาสินค้ารหัส1ที่ขาดได้ราคาสูงสุดราคาต่ำสุด
  SELECT max(UnitPrice), min(UnitPrice) 
  from [Order Details] 
  where ProductID = 71


  --function AVG
--ราคาสินค้าเฉลี่ยทั้งหมดที่ขายได้ เฉพราะรหัส5
  SELECT avg(unitprice), min(UnitPrice), max(UnitPrice) 
  from [Order Details]
   where ProductID = 5

--ประเทศและจำนวนลูกค้า
  SELECT Country , COUNT(*) as [Num of Country] 
  FROM Customers
  GROUP BY Country

--รหัสประเภทสินค้า ราคาเฉลี่ยของสินค้าประเภทเดียวกัน
SELECT CategoryID, AVG(UnitPrice), min(UnitPrice), max(UnitPrice) 
FROM Products 
GROUP By CategoryID

--รายการสินค้าในใบสั่งซื้อทุกใบ 
--เฉพราะในใบสั่งซื้อสินต้ามากกว่า3ชนิด
SELECT OrderID, COUNT(*) 
FROM [Order Details] 
GROUP BY OrderID
HAVING COUNT(*)>3


--ประเทศและจำนวนใบสั่งซื้อที่ส่งสินค้าไปถึงปลายทาง
--ต้องการเฉพราะจำนวนที่มีใบสั่งซื้อตั้งแต้่100ขึ้นไป
SELECT ShipCountry, COUNT(*) numoforders
from Orders
GROUP by ShipCountry
HAVING COUNT(*)>=100


--ข้อมูลรหัสใบสั่งซื้อ ยอดรวมเงินในใบสั่งซื้อนั้น แสดงเฉพราะใบสั่งซื้อที่ยอดน้อยกว่า100 [order detail]
SELECT OrderID, sum(UnitPrice*Quantity*(1-Discount) )
FROM [Order Details]
GROUP by OrderID
HAVING sum(UnitPrice*Quantity*(1-Discount)) < 100

--ประเทศใดที่มีจำนวนใบสั่งซื้อที่ส่งสินค้าไปปลายทางต่ำกว่า 20รายการ ในปี 1997
SELECT Shipcountry, COUNT(*) as numoforder
from Orders
WHERE YEAR(OrderDate) = 1997
GROUP BY ShipCountry
HAVING COUNT(*) <20
ORDER BY COUNT(*) ASC

--ใบสั่งซื้อใดมียอดขายสูงสุด แสดงรหัสใบสั่งซื้อและยอดขาย
SELECT top 1 OrderID, sum(UnitPrice*Quantity*(1-Discount)) as total
 from [Order Details]
GROUP BY OrderID
order by total DESC