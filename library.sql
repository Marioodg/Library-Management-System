DROP TABLE IF EXISTS Payment, Borrow, Staff, Book, Member;


CREATE TABLE Member (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    JoinDate DATE
);

CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    Title VARCHAR(150),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    PublishedYear INT,
    CopiesAvailable INT
);

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50)
);

CREATE TABLE Borrow (
    BorrowID INT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    StaffID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    MemberID INT,
    Amount DECIMAL(8,2),
    PaymentDate DATE,
    Reason VARCHAR(100),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);


INSERT INTO Member VALUES (1,'Alice','alice@mail.com','1234567890','2024-01-15');
INSERT INTO Member VALUES (2,'Bob','bob@mail.com','9876543210','2024-02-10');
INSERT INTO Member VALUES (3,'Charlie','charlie@mail.com','5551234567','2024-03-05');
INSERT INTO Member VALUES (4,'Diana','diana@mail.com','4442221111','2024-04-12');
INSERT INTO Member VALUES (5,'Ethan','ethan@mail.com','9998887777','2024-05-20');


INSERT INTO Book VALUES (101,'Database Systems','Elmasri','Education',2017,5);
INSERT INTO Book VALUES (102,'Clean Code','Robert Martin','Programming',2008,3);
INSERT INTO Book VALUES (103,'Harry Potter','J.K. Rowling','Fiction',1997,4);
INSERT INTO Book VALUES (104,'Design Patterns','GoF','Programming',1994,2);
INSERT INTO Book VALUES (105,'Inferno','Dan Brown','Thriller',2013,6);


INSERT INTO Staff VALUES (1,'David','Librarian');
INSERT INTO Staff VALUES (2,'Emma','Assistant');
INSERT INTO Staff VALUES (3,'Frank','Clerk');


INSERT INTO Borrow VALUES (1,1,101,1,'2025-09-10',NULL);
INSERT INTO Borrow VALUES (2,2,102,2,'2025-09-05','2025-09-15');
INSERT INTO Borrow VALUES (3,3,103,1,'2025-09-01',NULL);
INSERT INTO Borrow VALUES (4,4,104,3,'2025-09-12',NULL);
INSERT INTO Borrow VALUES (5,5,105,2,'2025-09-07','2025-09-14');


INSERT INTO Payment VALUES (1,2,50.00,'2025-09-16','Late Fee');
INSERT INTO Payment VALUES (2,3,20.00,'2025-09-10','Lost Book Cover');
INSERT INTO Payment VALUES (3,4,10.00,'2025-09-18','Late Fee');


SELECT * FROM Member WHERE YEAR(JoinDate) = 2024;


SELECT m.Name, b.Title, br.BorrowDate
FROM Borrow br
JOIN Member m ON br.MemberID = m.MemberID
JOIN Book b ON br.BookID = b.BookID
WHERE br.ReturnDate IS NULL;


SELECT b.Title, COUNT(*) AS TimesBorrowed
FROM Borrow br
JOIN Book b ON br.BookID = b.BookID
GROUP BY b.Title
ORDER BY TimesBorrowed DESC;


SELECT m.Name, SUM(p.Amount) AS TotalFines
FROM Payment p
JOIN Member m ON p.MemberID = m.MemberID
GROUP BY m.Name;


SELECT s.Name, COUNT(br.BorrowID) AS BooksIssued
FROM Staff s
LEFT JOIN Borrow br ON s.StaffID = br.StaffID
GROUP BY s.Name;
