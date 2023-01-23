-- Update information in the database.

-- Set Cleo Goldwater's favorite dish to
-- the Quinoa Salmon Salad.

--Get ID for dish             ----9----
SELECT * FROM Dishes
WHERE Name = 'Quinoa Salmon Salad';

-- Get ID for Cleo            ----42----
SELECT * FROM Customers
WHERE FirstName = 'Cleo' AND LastName = 'Goldwater';

--Update Cleo's information
Update Customers
SET FavoriteDish = 9
WHERE CustomerID = 42;

--Check completion
SELECT * FROM Customers
WHERE CustomerID = 42