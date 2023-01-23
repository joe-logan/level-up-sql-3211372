-- Enter a customer's delivery order into our database, 
-- and provide the total cost of the items ordered.

-- Use this order information:
-- Customer: Loretta Hundey, at 6939 Elka Place
-- Items: 1 House Salad, 1 Mini Cheeseburgers, and
-- 1 Tropical Blue Smoothie
-- Delivery date and time: September 20, 2022 @ 2PM (14:00)
-- There are no taxes or other fees.

-- Does this customer exist in records already? Yes
SELECT * FROM Customers
WHERE FirstName = 'Loretta' AND LastName = 'Hundey';

--Add an order to the orders table
INSERT INTO Orders (CustomerID, OrderDate)
VALUES (
  (SELECT CustomerID FROM Customers
  WHERE FirstName = 'Loretta' AND LastName = 'Hundey'),
  '2022-09-20 14:00:00');

--Display orders to check addition
SELECT * FROM Orders
ORDER BY OrderDate DESC;

--Add items to OrderDishes
INSERT INTO OrdersDishes (OrderID, DishID)
VALUES (
  1001,
  (SELECT DishID FROM Dishes
  WHERE Name = 'House Salad'));
INSERT INTO OrdersDishes (OrderID, DishID)
VALUES (
  1001,
  (SELECT DishID FROM Dishes
  WHERE Name = 'Mini Cheeseburgers'));
INSERT INTO OrdersDishes (OrderID, DishID)
VALUES (
  1001,
  (SELECT DishID FROM Dishes
  WHERE Name = 'Tropical Blue Smoothie'));

--Check completion
SELECT * FROM OrdersDishes WHERE OrderID = 1001;

--Return total cost
SELECT SUM(d.Price) AS 'Total Price' FROM OrdersDishes o
JOIN Dishes d
ON o.DishID == d.DishID
WHERE OrderID = 1001;