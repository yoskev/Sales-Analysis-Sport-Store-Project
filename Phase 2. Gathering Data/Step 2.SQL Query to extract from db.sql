USE distributordatabase;

SELECT SalesOrderID, PatnerStoreID, SalesTeamID, OrderDate, Payment, TotalOrderTrasaction, Note 
FROM SalesOrder
WHERE OrderDate BETWEEN '2020-01-01' AND '2022-12-31';

SELECT p.ProductID, p.VendorID, p.ProductName, p.Category, p.UnitSalesPrice, p.UnitBuyPrice, p.Quantity, p.UOM, p.DiscountProduct, p.ProductDescription
FROM Product p
INNER JOIN OrderItem o on p.ProductID = o.ProductID
WHERE o.SalesOrderID BETWEEN 'S0001' AND 'S1028';

SELECT v.VendorID, v.VendorName, v.Address, v.City, v.Province, v.email, v.Phone
FROM Vendor v
INNER JOIN Product p on v.VendorID = p.VendorID
WHERE p.ProductID BETWEEN 'PD0001' AND 'PD0020';

SELECT ps.PatnerStoreID, ps.PatnerStoreName, ps.PatnerType, ps.Region, ps.Province, ps.PatnerContactPhone
FROM PatnerStore ps
INNER JOIN SalesOrder s on ps.PatnerStoreIDID = s.PatnerStoreID
WHERE s.OrderDate BETWEEN '2020-01-01' AND '2022-12-31';

SELECT st.SalesTeamID, st.SalesTeamName, st.SalesTeamRegion, st.SalesPromotionMethods, st.TotalProspect 
FROM SalesTeam st
INNER JOIN SalesOrder s on st.SalesTeamID = s.SalesTeamID
WHERE s.OrderDate BETWEEN '2020-01-01' AND '2022-12-31';

SELECT o.SalesOrderID, o.ProductID, o.QuantityOrder, o.ItemTotal 
FROM OrderItem o
INNER JOIN SalesOrder s on o.SalesOrderID=s.SalesOrderID
WHERE s.OrderDate BETWEEN '2020-01-01' AND '2022-12-31';

SELECT i.InvoiceID, i.SalesOrderID, i.ShipmentType, i.WarehouseLocation, i.TermsofPayment, i.ShippingCost, i.Taxes, i.TotalDue
FROM Invoice i
INNER JOIN SalesOrder s on i.SalesOrderID = s.SalesOrderID
WHERE i.SalesOrderID BETWEEN 'S0001' AND 'S1028';