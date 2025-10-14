CREATE DATABASE IF NOT EXISTS alx_book_store; -- Create DB on the server

USE alx_book_store; -- Use the newly created DB

-- Books Table
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Author Table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Customer Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL,
    address TEXT
);

-- Order Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    order_date DATE NOT NULL
);

-- Order Details Table

CREATE TABLE Order_Details (
    orderdetail_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
