-----------------------------------------------------------------------------------------
-- For Issueing book
-----------------------------------------------------------------------------------------
CREATE PROCEDURE IssueBook(IN memberID INT, IN bookID INT)  
BEGIN  
    DECLARE bookCount INT;
    SELECT quantity INTO bookCount FROM Books WHERE book_id = bookID;
    
    IF bookCount > 0 THEN  
        INSERT INTO Transactions (member_id, book_id, issue_date, due_date)  
        VALUES (memberID, bookID, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 14 DAY));  
        UPDATE Books SET quantity = quantity - 1 WHERE book_id = bookID;  
    ELSE  
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Book not available';  
    END IF;  
END;
-----------------------------------------------------------------------------------------
-- For Returning book with Fine Calculation
-----------------------------------------------------------------------------------------
CREATE PROCEDURE ReturnBook(IN transactionID INT)  
BEGIN  
    DECLARE dueDate DATE;
    DECLARE fineAmount DECIMAL(5,2);
    
    SELECT due_date INTO dueDate FROM Transactions WHERE transaction_id = transactionID;
    
    IF CURDATE() > dueDate THEN  
        SET fineAmount = DATEDIFF(CURDATE(), dueDate) * 2; -- ₹2 per day  
    ELSE  
        SET fineAmount = 0;  
    END IF;
    
    UPDATE Transactions SET return_date = CURDATE(), fine = fineAmount WHERE transaction_id = transactionID;
    UPDATE Books SET quantity = quantity + 1 WHERE book_id = (SELECT book_id FROM Transactions WHERE transaction_id = transactionID);
END;
