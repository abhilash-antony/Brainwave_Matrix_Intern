-- Querying the DB
-- 1. List all books and their availability:
SELECT Title, Author, Available FROM Books;

-- 2. Find members who borrowed a book but have not returned it yet:
SELECT Members.Name, Books.Title, Loans.Issue_Date, Loans.Due_Date FROM Members
JOIN Loans ON Members.Member_ID = Loans.Member_ID
JOIN Books ON Loans.Book_ID = Books.Book_ID
WHERE Loans.Return_Date IS NULL;

-- 3. List books in a specific category (e.g., Fiction):
SELECT Books.Title, Books.Author FROM Books
JOIN Book_Category ON Books.Book_ID = Book_Category.Book_ID
JOIN Categories ON Book_Category.Category_ID = Categories.Category_ID
WHERE Categories.Category_Name = 'Fiction';

-- 4. Count how many books each member has borrowed:
SELECT Members.Name, COUNT(Loans.Loan_ID) AS Total_Borrowed FROM Members
LEFT JOIN Loans ON Members.Member_ID = Loans.Member_ID
GROUP BY Members.Member_ID;

-- 5. Update a book's availability after it has been returned:
UPDATE Books SET Available = TRUE WHERE Book_ID = 1;
UPDATE Loans SET Return_Date = CURDATE() WHERE Loan_ID = 1;

-- returned books
SELECT Book_ID, Member_ID, Return_Date FROM Loans WHERE Return_Date IS NOT NULL;