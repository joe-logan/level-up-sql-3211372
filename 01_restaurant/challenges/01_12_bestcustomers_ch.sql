-- Identify a few customers who have ordered delivery
-- from the restaurant the most often, so we can send
-- them a promotional coupon.

SELECT c.customerID, c.FirstName, c.LastName, c.Email, COUNT(o.OrderID) AS TotalOrders FROM Orders o
JOIN Customers c 
ON o.CustomerID == c.CustomerID
GROUP BY o.CustomerID
ORDER BY TotalOrders DESC;