-- Schema library_management_systems
CREATE SCHEMA IF NOT EXISTS library_management_systems;
USE library_management_systems;

-- Table: authors
CREATE TABLE IF NOT EXISTS author (
  author_id INT NOT NULL AUTO_INCREMENT,
  full_name VARCHAR(20) NOT NULL,
  bio VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (author_id),
  UNIQUE INDEX full_name (full_name ASC)
);

-- Table: categories
CREATE TABLE IF NOT EXISTS category (
  category_id INT NOT NULL AUTO_INCREMENT,
  category_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (category_id),
  UNIQUE INDEX category_name (category_name ASC)
);

-- Table: books
CREATE TABLE IF NOT EXISTS books (
  Book_id INT NOT NULL AUTO_INCREMENT,
  Title VARCHAR(50) NOT NULL,
  Author_id INT NULL DEFAULT NULL,
  category_id INT NULL DEFAULT NULL,
  Isbn VARCHAR(20) NOT NULL,
  Publisher VARCHAR(100) NULL DEFAULT NULL,
  year_published YEAR NULL DEFAULT NULL,
  Quantity INT NULL DEFAULT NULL,
  Available_copies INT NULL DEFAULT NULL,
  PRIMARY KEY (Book_id),
  UNIQUE INDEX Isbn (Isbn ASC),
  INDEX fk_authorid (Author_id ASC),
  INDEX fk_categoryid (category_id ASC),
  CONSTRAINT fk_authorid FOREIGN KEY (Author_id) REFERENCES author (author_id),
  CONSTRAINT fk_categoryid FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Table: users
CREATE TABLE IF NOT EXISTS user (
  user_id INT NOT NULL AUTO_INCREMENT,
  user_name VARCHAR(20) NOT NULL,
  email VARCHAR(20) NOT NULL,
  mobile VARCHAR(20) NULL DEFAULT NULL,
  date_of_birth DATE NULL DEFAULT NULL,
  Address VARCHAR(200) NULL DEFAULT NULL,
  Join_date DATE NULL DEFAULT NULL,
  Membership_Status ENUM('Active', 'Inactive') NULL DEFAULT NULL,
  PRIMARY KEY (user_id),
  UNIQUE INDEX email (email ASC),
  UNIQUE INDEX mobile (mobile ASC)
);

-- Table: transaction_details
CREATE TABLE IF NOT EXISTS transaction_details (
  transaction_id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  Book_id INT NOT NULL,
  borrow_dt DATE NOT NULL,
  due_dt DATE NOT NULL,
  return_dt DATE NULL DEFAULT NULL,
  book_status ENUM('Borrowed', 'Returned', 'Overdue') NULL DEFAULT 'Borrowed',
  PRIMARY KEY (transaction_id),
  INDEX fk_user (user_id ASC),
  INDEX fk_book (Book_id ASC),
  CONSTRAINT fk_book FOREIGN KEY (Book_id) REFERENCES books (Book_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES user (user_id)
);

-- Table: fines
CREATE TABLE IF NOT EXISTS fines (
  fine_id INT NOT NULL AUTO_INCREMENT,
  transaction_id INT NOT NULL,
  user_id INT NOT NULL,
  book_id INT NOT NULL,
  fine_amount DECIMAL(10,2) NOT NULL,
  fine_status ENUM('Pending', 'Paid') NULL DEFAULT NULL,
  fined_date DATE NOT NULL,
  paid_date DATE NULL DEFAULT NULL,
  PRIMARY KEY (fine_id),
  INDEX fk_transaction (transaction_id ASC),
  INDEX fk_useri (user_id ASC),
  INDEX fk_booki (book_id ASC),
  CONSTRAINT fk_booki FOREIGN KEY (book_id) REFERENCES books (Book_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_transaction FOREIGN KEY (transaction_id) REFERENCES transaction_details (transaction_id),
  CONSTRAINT fk_useri FOREIGN KEY (user_id) REFERENCES user (user_id)
);

