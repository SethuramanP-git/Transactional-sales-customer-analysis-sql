-- Insert data into customers table
INSERT INTO customers VALUES
(1,'Ravi','ravi@gmail.com','Chennai','2024-01-10'),
(2,'Anu','anu@gmail.com','Bangalore','2024-01-15'),
(3,'Karthik','karthik@gmail.com','Hyderabad','2024-02-01'),
(4,'Meena','meena@gmail.com','Chennai','2024-02-10'),
(5,'Arjun','arjun@gmail.com','Mumbai','2024-03-05');

-- Insert data into products table
INSERT INTO products VALUES
(101,'Mobile','Electronics',15000),
(102,'Laptop','Electronics',55000),
(103,'Headphones','Accessories',2000),
(104,'Smart Watch','Accessories',5000),
(105,'Tablet','Electronics',25000);

-- Insert data into orders table
INSERT INTO orders VALUES
(1001,1,'2024-03-10','Delivered'),
(1002,2,'2024-03-12','Delivered'),
(1003,1,'2024-03-20','Cancelled'),
(1004,3,'2024-04-01','Delivered'),
(1005,4,'2024-04-05','Delivered'),
(1006,1,'2024-04-10','Delivered');

-- Insert data into order_items table
INSERT INTO order_items VALUES
(1,1001,101,1),
(2,1001,103,2),
(3,1002,102,1),
(4,1004,104,1),
(5,1005,105,1),
(6,1006,101,2);

