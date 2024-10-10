-- create DB
DROP DATABASE ReadNet;
CREATE DATABASE ReadNet;
USE ReadNet;

-- create tables
CREATE TABLE Books (
    Book_ID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255),
    Genre VARCHAR(100),
    ISBN VARCHAR(20) UNIQUE,
    Publisher VARCHAR(100),
    Year_Published YEAR,
    Available BOOLEAN DEFAULT TRUE
);

CREATE TABLE Members (
    Member_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Address VARCHAR(255),
    Contact_Info VARCHAR(50),
    Membership_Type ENUM('Regular', 'Premium') DEFAULT 'Regular',
    Join_Date DATE
);

CREATE TABLE Categories (
    Category_ID INT PRIMARY KEY AUTO_INCREMENT,
    Category_Name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Loans (
    Loan_ID INT PRIMARY KEY AUTO_INCREMENT,
    Book_ID INT,
    Member_ID INT,
    Issue_Date DATE,
    Due_Date DATE,
    Return_Date DATE,
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID),
    FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID)
);

CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Position VARCHAR(100),
    Contact_Info VARCHAR(50),
    Salary DECIMAL(10, 2)  -- Assuming salary can have up to 10 digits, with 2 decimal places
);

CREATE TABLE Book_Category (
    Book_ID INT,
    Category_ID INT,
    PRIMARY KEY (Book_ID, Category_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID),
    FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID)
);
