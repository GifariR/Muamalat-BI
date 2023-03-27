
-- The following SQL query retrieves data from multiple tables that are joined together with INNER JOIN


SELECT DISTINCT
    customers.CustomerID,
    customers.FirstName,
    customers.LastName,
    customers.CustomerEmail,
    customers.CustomerPhone,
    customers.CustomerAddress,
    customers.CustomerCity,
    customers.CustomerState,
    customers.CustomerZip,
    product_category.CategoryName,
    dataset_task_5.ProdName,
    CONVERT(date, orders.Date) AS Date,
    sum(orders.quantity) as [sum of quantity],
    sum(dataset_task_5.price) as [sum of price]

--The FROM clause specifies the tables involved in the query and the join conditions among them.     
FROM 
    product_category 
    INNER JOIN dataset_task_5 
        ON (product_category.CategoryID = dataset_task_5.Category)
    INNER JOIN orders 
        ON (dataset_task_5.ProdNumber = orders.ProdNumber)
    INNER JOIN customers 
        ON (customers.CustomerID = orders.CustomerID)

--  he GROUP BY clause groups the rows based on the specified columns.
GROUP BY 
    customers.CustomerID,
    customers.FirstName,
    customers.LastName,
    customers.CustomerEmail,
    customers.CustomerPhone,
    customers.CustomerAddress,
    customers.CustomerCity,
    customers.CustomerState,
    customers.CustomerZip,
    product_category.CategoryName,
    dataset_task_5.ProdName,
    orders.Date ;