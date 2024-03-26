USE Netflix;
-- parent table creation
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Age INT,
    Gender VARCHAR(6),
    Country VARCHAR(100),
    Device VARCHAR(10)
);


-- child table creation
CREATE TABLE Subscription (
    SubID INT PRIMARY KEY,
    Sub_Type VARCHAR(8),
    CustomerID INT, -- Remove UNIQUE constraint
    Monthly_Revenue INT,
    Plan_Duration VARCHAR(30),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

ALTER TABLE Subscription
ADD CONSTRAINT fk_CustomerID
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);

-- Child table refrencing the parent table, one to one relationship



-- USE CASE # 1 : Customer Segmentation

SELECT Age, Monthly_Revenue, PLan_Duration
FROM Customer
LEFT JOIN Subscription ON Customer.CustomerID = Subscription.CustomerID
ORDER BY Age ASC;

-- Collecting Monthly Revenue, and Plan Duration by Age
SELECT Gender, Monthly_Revenue, Plan_Duration
FROM Customer
LEFT JOIN Subscription ON Customer.CustomerID = Subscription.CustomerID
ORDER BY Gender ASC;

-- Collecting Monthly Revenue, and Plan Duration by Gender

SELECT Country, Monthly_Revenue, PLan_Duration
FROM Customer
LEFT JOIN Subscription ON Customer.CustomerID = Subscription.CustomerID
ORDER BY Country ASC;
-- Collecting Monthly Revenue, and Plan Duration by Country

SELECT Device , Monthly_Revenue, PLan_Duration
FROM Customer
LEFT JOIN Subscription ON Customer.CustomerID = Subscription.CustomerID
ORDER BY Device ASC;

-- -- Collecting Monthly Revenue, and Plan Duration by Device

-- USE CASE #2: Subscription Analysis

SELECT Monthly_Revenue, Sub_type
FROM Subscription
ORDER BY Monthly_Revenue DESC;
-- Find how much a subscription makes by monthly revenue 



SELECT Age, Sub_Type
FROM Customer
LEFT JOIN Subscription ON customer.CustomerID = Subscription.CustomerID
ORDER BY AGE ;
-- Find sub type by age

SELECT Gender, Sub_Type
FROM Customer
LEFT JOIN Subscription ON customer.CustomerID = Subscription.CustomerID
ORDER BY Gender;
-- What gender is subscribed to premium service

SELECT Country, Sub_Type
FROM Customer
LEFT JOIN Subscription ON customer.CustomerID = Subscription.CustomerID
ORDER BY Country

-- What country is subscribed to premium service
