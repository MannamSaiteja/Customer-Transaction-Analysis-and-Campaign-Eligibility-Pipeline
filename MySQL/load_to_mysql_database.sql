CREATE DATABASE IF NOT EXISTS bank_db;
USE bank_db;

CREATE TABLE customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    age INT,
    job VARCHAR(255),
    marital_status VARCHAR(50),
    account_balance DECIMAL(15,2),
    credit_score INT
);

CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id VARCHAR(20),
    transaction_date DATE,
    transaction_type ENUM('credit', 'debit'),
    amount DECIMAL(15,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
LOAD DATA INFILE './formatted_customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(customer_id, age, job, marital_status, account_balance, credit_score);

LOAD DATA INFILE './formatted_transactions.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(customer_id, transaction_date, transaction_type, amount);
