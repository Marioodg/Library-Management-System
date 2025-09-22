# Library Management System (Mini Database Project)

## 📌 Objective
This project demonstrates a **mini relational database system** for a Library Management System using SQL.  
It covers the design, implementation, and sample queries for managing library members, books, staff, borrowing, and payments.

---

## 📊 Database Design
### Entities (5 tables):
1. **Member**
   - MemberID (PK), Name, Email, Phone, JoinDate
2. **Book**
   - BookID (PK), Title, Author, Genre, PublishedYear, CopiesAvailable
3. **Staff**
   - StaffID (PK), Name, Role
4. **Borrow**
   - BorrowID (PK), MemberID (FK), BookID (FK), StaffID (FK), BorrowDate, ReturnDate
5. **Payment**
   - PaymentID (PK), MemberID (FK), Amount, PaymentDate, Reason

### ER Diagram
The ER diagram shows relationships between entities:
- Member ↔ Borrow ↔ Book
- Member ↔ Payment
- Staff ↔ Borrow

*(Attach ER diagram image here in submission)*

---

## 🛠️ Database Implementation
The SQL file (`library.sql`) includes:
- Table creation scripts with primary and foreign keys.
- Insert statements with 20+ rows of sample data.
- Example queries for business-style questions.

---

## 📜 Sample Queries
1. List all members who joined in 2024.  
2. Find all books currently borrowed (not yet returned).  
3. Show the top borrowed books by count.  
4. Calculate total fines paid by each member.  
5. Display staff members and the number of books issued by them.

---

## 🎥 Demonstration
A **3–5 minute demo video** should include:
- Database creation and schema explanation.
- Execution of queries with results.

*(Provide YouTube/Drive link here)*

---

## 📂 Submission Package
- `library.sql` – SQL script (tables + inserts + queries).  
- `README.md` – This file, summarizing design & queries.  
- ER diagram (`ERDiagram.png`).  
- Demo video link.  

---

## ✅ Evaluation Criteria
- Database Design (40%)  
- Query Correctness & Results (30%)  
- Demo Video (20%)  
- Creativity (10%)  
