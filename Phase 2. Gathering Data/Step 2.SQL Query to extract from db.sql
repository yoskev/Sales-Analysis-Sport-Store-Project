USE distributordatabase;

-- 1. Sales Order 2020-2022
CREATE TEMPORARY TABLE FilteredSalesOrder AS
SELECT SalesOrderID, PatnerStoreID, SalesTeamID, OrderDate, Payment, TotalOrderTransaction, Note
FROM SalesOrder
WHERE OrderDate BETWEEN '2020-01-01' AND '2022-12-31';

SELECT * FROM FilteredSalesOrder;

-- 2. Patner Store
SELECT DISTINCT ps.PatnerStoreID, ps.PatnerStoreName, ps.PatnerType, 
       ps.Region, ps.Province, ps.PatnerContactPhone
FROM PatnerStore ps
INNER JOIN FilteredSalesOrder fso ON ps.PatnerStoreID = fso.PatnerStoreID;

-- 3. Sales Team
SELECT DISTINCT st.SalesTeamID, st.SalesTeamName, st.SalesTeamRegion, 
       st.SalesPromotionMethods, st.TotalProspect
FROM SalesTeam st
INNER JOIN FilteredSalesOrder fso ON st.SalesTeamID = fso.SalesTeamID;

-- 4. Invoice
SELECT i.InvoiceID, i.SalesOrderID, i.ShipmentType, i.WarehouseLocation, 
       i.TermsOfPayment, i.ShippingCost, i.Taxes, i.TotalDue
FROM Invoice i
INNER JOIN FilteredSalesOrder fso ON i.SalesOrderID = fso.SalesOrderID;

-- 5. Order Item
SELECT oi.SalesOrderID, oi.ProductID, oi.QuantityOrder, oi.ItemTotal
FROM OrderItem oi
INNER JOIN FilteredSalesOrder fso ON oi.SalesOrderID = fso.SalesOrderID;

-- 6. Product 
SELECT DISTINCT p.ProductID, p.VendorID, p.ProductName, p.Category, 
       p.UnitSalesPrice, p.UnitBuyPrice, p.Quantity, p.UOM, 
       p.DiscountProduct, p.ProductDescription
FROM Product p
INNER JOIN OrderItem oi ON p.ProductID = oi.ProductID
INNER JOIN FilteredSalesOrder fso ON oi.SalesOrderID = fso.SalesOrderID;

-- 7. Vendor 
SELECT DISTINCT v.VendorID, v.VendorName, v.Address, v.City, v.Province, v.Email, v.Phone
FROM Vendor v
INNER JOIN Product p ON v.VendorID = p.VendorID
INNER JOIN OrderItem oi ON p.ProductID = oi.ProductID
INNER JOIN FilteredSalesOrder fso ON oi.SalesOrderID = fso.SalesOrderID;

DROP TEMPORARY TABLE FilteredSalesOrder;
