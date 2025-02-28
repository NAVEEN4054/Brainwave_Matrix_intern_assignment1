-- View: User Borrowing Details
CREATE VIEW View_User_Borrowing AS
SELECT 
    u.user_id, 
    u.user_name, 
    b.Title AS book_title, 
    t.borrow_dt, 
    t.due_dt, 
    t.return_dt, 
    t.book_status
FROM transaction_details t
JOIN user u ON t.user_id = u.user_id
JOIN books b ON t.Book_id = b.Book_id;

-- View: Currently Issued Books
CREATE VIEW View_Currently_Issued AS
SELECT 
    t.transaction_id, 
    u.user_name, 
    b.Title AS book_title, 
    t.borrow_dt, 
    t.due_dt, 
    t.book_status
FROM transaction_details t
JOIN user u ON t.user_id = u.user_id
JOIN books b ON t.Book_id = b.Book_id
WHERE t.book_status = 'Issued';

-- View: Overdue Books & Fines
CREATE VIEW View_Overdue_Books AS
SELECT 
    f.fine_id, 
    u.user_name, 
    b.Title AS book_title, 
    f.fine_amount, 
    f.fine_status, 
    f.fined_date, 
    f.paid_date
FROM fines f
JOIN user u ON f.user_id = u.user_id
JOIN books b ON f.book_id = b.Book_id
WHERE f.fine_status = 'Pending';

-- View: Available Books
CREATE VIEW View_Available_Books AS
SELECT 
    b.Book_id, 
    b.Title, 
    a.full_name AS author, 
    c.category_name, 
    b.year_published, 
    b.Quantity, 
    b.Available_copies
FROM books b
JOIN author a ON b.Author_id = a.author_id
JOIN category c ON b.category_id = c.category_id
WHERE b.Available_copies > 0;

-- View: User Transaction History
CREATE VIEW View_User_Transaction_History AS
SELECT 
    u.user_name, 
    b.Title AS book_title, 
    t.borrow_dt, 
    t.return_dt, 
    t.book_status
FROM transaction_details t
JOIN user u ON t.user_id = u.user_id
JOIN books b ON t.Book_id = b.Book_id
WHERE t.book_status = 'Returned';
