
-- 1. Count of users from each country (CITY)

SELECT City, COUNT(*) AS user_count
FROM personal_contacts___sheet_1_1
GROUP BY City;

-- 2. List of cities with more than 2 contacts

SELECT City, COUNT(*) AS total
FROM personal_contacts___sheet_1_1
GROUP BY City
HAVING COUNT(*) > 2;

-- 3. Using a window function to assign row numbers based on city grouping

SELECT ID, First_Name, Last_Name, City,
       ROW_NUMBER() OVER (PARTITION BY City ORDER BY First_Name) AS RowNum_By_City
FROM personal_contacts___sheet_1_1;

-- 4. Common Table Expression (CTE) to find contacts from INDIA

WITH IndianContacts AS (
    SELECT * FROM personal_contacts___sheet_1_1 WHERE City = 'INDIA'
)
SELECT * FROM IndianContacts;

-- 5. Subquery to find contacts with the longest phone numbers

SELECT * FROM personal_contacts___sheet_1_1
WHERE LENGTH(Phone) = (
    SELECT MAX(LENGTH(Phone)) FROM personal_contacts___sheet_1_1
);

-- 6. CTE to get city-wise name concatenation

WITH CityNames AS (
    SELECT City, CONCAT(First_Name, ' ', Last_Name) AS Full_Name
    FROM personal_contacts___sheet_1_1
)
SELECT * FROM CityNames;

-- 7. City-wise alphabetical list of people using window function

SELECT First_Name, Last_Name, City,
       DENSE_RANK() OVER (PARTITION BY City ORDER BY First_Name, Last_Name) AS NameRank
FROM personal_contacts___sheet_1_1;

-- 8. Contacts whose email contains 'info'

SELECT * FROM personal_contacts___sheet_1_1
WHERE Email_Address LIKE '%info%';
