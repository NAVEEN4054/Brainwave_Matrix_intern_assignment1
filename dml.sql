-- Inserting into user Table (Library Members)
INSERT INTO user (user_id, user_name, email, mobile, date_of_birth, Address, Join_date, Membership_Status) VALUES
(1, 'Alice Johnson', 'alice@example.com', '9876543210', '1998-05-21', '123 Main St, NY', '2023-01-10', 'Active'),
(2, 'Bob Smith', 'bob@example.com', '9123456789', '2000-09-15', '456 Elm St, CA', '2023-02-20', 'Active'),
(3, 'Charlie Brown', 'charlie@example.com', '9345678901', '1997-03-30', '789 Pine St, TX', '2023-03-05', 'Inactive'),
(4, 'David Wilson', 'david@example.com', '9786543210', '1995-12-11', '321 Oak St, FL', '2023-04-12', 'Active'),
(5, 'Emma Davis', 'emma@example.com', '9456789012', '1999-07-07', '654 Cedar St, WA', '2023-05-25', 'Active');

-- Inserting into category Table (Book Categories)
INSERT INTO category (category_id, category_name) VALUES
(1, 'Computer Science'),
(2, 'Electronics'),
(3, 'Databases'),
(4, 'Mathematics'),
(5, 'Physics');

-- Inserting into author Table (Authors)
INSERT INTO author (author_id, full_name, bio) VALUES
(1, 'Thomas H. Cormen', 'Author of Introduction to Algorithms'),
(2, 'Morris Mano', 'Author of Digital Design and Computer Architecture'),
(3, 'Ramez Elmasri', 'Database expert and author of DBMS books'),
(4, 'Silberschatz', 'Author of Operating System Concepts'),
(5, 'Alan V. Oppenheim', 'Author of Signals and Systems');

-- Inserting into books Table (Books)
INSERT INTO books (Book_id, Title, Author_id, category_id, Isbn, Publisher, year_published, Quantity, Available_copies) VALUES
(101, 'Introduction to Algorithms', 1, 1, '9780262033848', 'MIT Press', 2009, 5, 5),
(102, 'Digital Electronics', 2, 2, '9780133760033', 'Pearson', 2013, 3, 3),
(103, 'Database Systems', 3, 3, '9780133970777', 'Pearson', 2015, 4, 4),
(104, 'Operating Systems', 4, 1, '9781118063330', 'Wiley', 2018, 6, 6),
(105, 'Signals and Systems', 5, 5, '9780138147570', 'Prentice Hall', 2009, 2, 2);

-- Inserting into transaction_details Table (Book Transactions)
INSERT INTO transaction_details (transaction_id, user_id, Book_id, borrow_dt, due_dt, return_dt, book_status) VALUES
(1, 1, 101, '2025-02-10', '2025-02-24', NULL, 'Issued'),
(2, 2, 103, '2025-02-12', '2025-02-26', '2025-02-25', 'Returned'),
(3, 3, 105, '2025-02-15', '2025-02-29', NULL, 'Issued'),
(4, 4, 102, '2025-02-18', '2025-03-03', NULL, 'Issued'),
(5, 5, 104, '2025-02-20', '2025-03-05', '2025-03-01', 'Returned');

-- Inserting into fines Table (Fines for Late Returns)
INSERT INTO fines (fine_id, transaction_id, user_id, book_id, fine_amount, fine_status, fined_date, paid_date) VALUES
(1, 2, 2, 103, 50.00, 'Paid', '2025-02-27', '2025-02-28'),
(2, 5, 5, 104, 100.00, 'Unpaid', '2025-03-06', NULL);
