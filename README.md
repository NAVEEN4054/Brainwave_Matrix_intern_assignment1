# Library Management System
# Library Management System

## Introduction
The Library Management System is a database project designed to efficiently manage library operations such as book inventory, member records, and transaction management. The system is built using SQL to store, retrieve, and manipulate library-related data.

## Features
- Book Management (Add, Update, Delete, Search Books)
- Member Management (Register, Update, Delete Members)
- Borrow and Return Books
- Fine Calculation for Late Returns
- User Authentication and Access Control
- Reports Generation

## Technologies Used
- **Database**: MySQL / PostgreSQL / SQLite
- **SQL Queries**: DDL, DML, and DQL operations
- **Tools**: MySQL Workbench, pgAdmin, SQLite Browser (as applicable)

## Database Schema
### Tables:
1. **Books**
   - book_id (Primary Key, INT, Auto Increment)
   - title (VARCHAR)
   - author (VARCHAR)
   - genre (VARCHAR)
   - quantity (INT)
   - publication_year (YEAR)

2. **Members**
   - member_id (Primary Key, INT, Auto Increment)
   - name (VARCHAR)
   - email (VARCHAR, UNIQUE)
   - phone (VARCHAR)
   - address (TEXT)

3. **Transactions**
   - transaction_id (Primary Key, INT, Auto Increment)
   - member_id (Foreign Key, INT)
   - book_id (Foreign Key, INT)
   - issue_date (DATE)
   - due_date (DATE)
   - return_date (DATE, NULLABLE)
   - fine (DECIMAL, DEFAULT 0)

4. **Users (Admin/Librarian)**
   - user_id (Primary Key, INT, Auto Increment)
   - username (VARCHAR, UNIQUE)
   - password (VARCHAR)
   - role (ENUM: 'admin', 'librarian')

## Installation
1. Install MySQL/PostgreSQL/SQLite on your system.
2. Create a database:
   ```sql
   CREATE DATABASE library_management;
   USE library_management;
   ```
3. Run the provided SQL scripts to create tables and insert sample data.
4. Use a database management tool (e.g., MySQL Workbench, pgAdmin) to interact with the system.

## Usage
1. Add books and register members.
2. Issue books to members and record the transaction.
3. Track book returns and calculate fines if applicable.
4. Generate reports on book availability, member activity, and overdue books.

## Future Enhancements
- Implementing a web-based interface for easy management.
- Integration with an RFID system for automated book tracking.
- SMS/email notifications for due date reminders.

## Author
Developed by **Tikkanam Naveen Kumar** as part of an internship project at Brainwave Matrix Solution Pvt Ltd.

## License
This project is open-source and available under the MIT License.


