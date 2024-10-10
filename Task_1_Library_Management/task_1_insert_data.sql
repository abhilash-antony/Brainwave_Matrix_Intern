INSERT INTO Books (Title, Author, Genre, ISBN, Publisher, Year_Published, Available) VALUES 
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', '9780743273565', 'Scribner', 1925, TRUE),
('1984', 'George Orwell', 'Dystopian', '9780451524935', 'Houghton Mifflin', 1949, TRUE),
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', '9780061120084', 'J.B. Lippincott & Co.', 1960, TRUE),
('Brave New World', 'Aldous Huxley', 'Dystopian', '9780060850524', 'Chatto & Windus', 1932, TRUE),
('Moby Dick', 'Herman Melville', 'Fiction', '9780142437247', 'Harper & Brothers', 1932, TRUE),
('The Catcher in the Rye', 'J.D. Salinger', 'Fiction', '9780316769488', 'Little Brown and Company', 1951, TRUE),
('Fahrenheit 451', 'Ray Bradbury', 'Dystopian', '9781451673319', 'Ballantine Books', 1953, TRUE),
('Pride and Prejudice', 'Jane Austen', 'Fiction', '9780679783268', 'T. Egerton', 1912, TRUE),
('The Odyssey', 'Homer', 'Epic', '9780140268867', 'Penguin Classics', 1950, TRUE),
('The Iliad', 'Homer', 'Epic', '9780140447941', 'Penguin Classics', 1913, TRUE);

INSERT INTO Members (Name, Address, Contact_Info, Membership_Type) VALUES 
('Rajesh Kumar', '12 MG Road, Bangalore', 'rajesh.kumar@gmail.com', 'Premium'),
('Sneha Verma', '45 Jayanagar, Bangalore', 'sneha.verma@gmail.com', 'Regular'),
('Anjali Sharma', '89 Connaught Place, Delhi', 'anjali.sharma@gmail.com', 'Regular'),
('Amit Patel', '25 Ashok Nagar, Ahmedabad', 'amit.patel@gmail.com', 'Premium'),
('Neha Singh', '67 Gandhi Marg, Lucknow', 'neha.singh@gmail.com', 'Regular'),
('Vikram Reddy', '108 Jubilee Hills, Hyderabad', 'vikram.reddy@gmail.com', 'Premium'),
('Priya Nair', '32 Marine Drive, Mumbai', 'priya.nair@gmail.com', 'Regular'),
('Rohan Desai', '78 Ellis Bridge, Ahmedabad', 'rohan.desai@gmail.com', 'Premium'),
('Aishwarya Iyer', '23 T Nagar, Chennai', 'aishwarya.iyer@gmail.com', 'Regular'),
('Suresh Pillai', '56 Panampilly Nagar, Kochi', 'suresh.pillai@gmail.com', 'Premium');

INSERT INTO Categories (Category_Name) VALUES 
('Fiction'), ('Dystopian'), ('Science Fiction'), 
('Biography'),('Fantasy'),('History'),('Epic'),
('Philosophy'),('Drama'),('Mystery');

INSERT INTO Loans (Book_ID, Member_ID, Issue_Date, Due_Date, Return_Date) VALUES 
(1, 1, '2024-10-15', '2024-10-25', NULL), 
(2, 2, '2024-10-16', '2024-10-30', '2024-10-29'), 
(3, 3, '2024-10-17', '2024-10-28', NULL),
(4, 4, '2024-10-18', '2024-11-01', NULL),
(5, 5, '2024-10-19', '2024-11-03', '2024-11-01'),
(6, 6, '2024-10-20', '2024-10-29', NULL),
(7, 7, '2024-10-21', '2024-11-05', NULL),
(8, 8, '2024-10-22', '2024-11-07', '2024-11-06'),
(9, 9, '2024-10-23', '2024-11-10', NULL),
(10, 10, '2024-10-24', '2024-11-12', '2024-11-10');

INSERT INTO Book_Category (Book_ID, Category_ID)VALUES 
(1, 1),  -- 'The Great Gatsby' in Fiction
(2, 2),  -- '1984' in Dystopian
(2, 3),  -- '1984' also in Science Fiction
(3, 1),  -- 'To Kill a Mockingbird' in Fiction
(4, 2),  -- 'Brave New World' in Dystopian
(5, 1),  -- 'Moby Dick' in Fiction
(6, 1),  -- 'The Catcher in the Rye' in Fiction
(7, 2),  -- 'Fahrenheit 451' in Dystopian
(8, 1),  -- 'Pride and Prejudice' in Fiction
(9, 7),  -- 'The Odyssey' in Epic
(10, 7); -- 'The Iliad' in Epic

INSERT INTO Staff (Name, Position, Contact_Info, Salary) VALUES 
('Ravi Sharma', 'Librarian', 'ravi.sharma@readnest.in', 50000),
('Anita Desai', 'Assistant Librarian', 'anita.desai@readnest.in', 40000),
('Vikram Singh', 'Library Manager', 'vikram.singh@readnest.in', 60000),
('Neha Gupta', 'Library Assistant', 'neha.gupta@readnest.in', 35000),
('Priya Patel', 'Cataloger', 'priya.patel@readnest.in', 45000),
('Suresh Nair', 'Archivist', 'suresh.nair@readnest.in', 47000),
('Aditi Verma', 'Library Technician', 'aditi.verma@readnest.in', 43000),
('Rahul Mehta', 'Library Assistant', 'rahul.mehta@readnest.in', 37000),
('Kiran Rao', 'IT Specialist', 'kiran.rao@readnest.in', 55000),
('Simran Kaur', 'Acquisitions Librarian', 'simran.kaur@readnest.in', 52000);