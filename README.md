# 🎓 University Student Analytics — MySQL Project

A practical **MySQL SQL portfolio project** for managing university student data and analyzing academic performance.

The project uses multiple related tables to analyze **students, departments, instructors, courses, enrollments, marks, and grades** using SQL queries.

---

## 📌 Project Overview

The **University Student Analytics** project demonstrates how SQL can be used to manage and analyze relational data in a university environment.

The database contains:

* 👨‍🎓 Student information
* 🏢 Department information
* 👨‍🏫 Instructor information
* 📚 Course information
* 📝 Student enrollments
* 📊 Marks and grades

The project includes **45 SQL analysis queries**, ranging from basic data retrieval to advanced SQL techniques.

---

## 🛠️ Tools & Technologies

| Tool                | Usage                               |
| ------------------- | ----------------------------------- |
| **MySQL**           | Database management                 |
| **MySQL Workbench** | SQL development and testing         |
| **phpMyAdmin**      | Database management alternative     |
| **Git & GitHub**    | Version control and project sharing |

---

# 🗂️ Database Structure

The database is named:

```sql
university_student_analytics
```

### Tables

```text
university_student_analytics
│
├── departments
├── students
├── instructors
├── courses
└── enrollments
```

### 🔗 Database Relationships

```text
departments
     │
     ├────────── students
     │               │
     │               │
     │          enrollments
     │               │
     │               │
     └────────── courses
                     │
                     │
                instructors
```

---

# 📊 Database Tables

### 1. Departments

Stores university department information.

| Column            | Description          |
| ----------------- | -------------------- |
| `department_id`   | Unique department ID |
| `department_name` | Department name      |
| `faculty`         | Faculty name         |

---

### 2. Students

Stores student personal and academic information.

| Column           | Description          |
| ---------------- | -------------------- |
| `student_id`     | Unique student ID    |
| `first_name`     | Student first name   |
| `last_name`      | Student last name    |
| `gender`         | Student gender       |
| `date_of_birth`  | Date of birth        |
| `email`          | Student email        |
| `phone`          | Contact number       |
| `city`           | Student city         |
| `admission_date` | Admission date       |
| `department_id`  | Student's department |

---

### 3. Instructors

Stores instructor information.

| Column            | Description             |
| ----------------- | ----------------------- |
| `instructor_id`   | Unique instructor ID    |
| `instructor_name` | Instructor name         |
| `email`           | Instructor email        |
| `department_id`   | Instructor's department |
| `salary`          | Instructor salary       |

---

### 4. Courses

Stores course information.

| Column          | Description         |
| --------------- | ------------------- |
| `course_id`     | Unique course ID    |
| `course_name`   | Course name         |
| `credit_hours`  | Course credit hours |
| `department_id` | Course department   |
| `instructor_id` | Course instructor   |

---

### 5. Enrollments

Stores student enrollment and academic performance.

| Column            | Description          |
| ----------------- | -------------------- |
| `enrollment_id`   | Unique enrollment ID |
| `student_id`      | Enrolled student     |
| `course_id`       | Enrolled course      |
| `enrollment_date` | Enrollment date      |
| `marks`           | Student marks        |
| `grade`           | Student grade        |
| `status`          | Enrollment status    |

---

# 🔑 Database Relationships

The project uses **Primary Keys (PK)** and **Foreign Keys (FK)** to connect related tables.

```text
departments.department_id
        ↓
students.department_id

departments.department_id
        ↓
courses.department_id

departments.department_id
        ↓
instructors.department_id

instructors.instructor_id
        ↓
courses.instructor_id

students.student_id
        ↓
enrollments.student_id

courses.course_id
        ↓
enrollments.course_id
```

---

# 🔍 SQL Analysis

The project contains **45 SQL queries** divided into different analysis areas.

## 👨‍🎓 Student Analysis

Examples:

* Count total students
* Display all students
* Find students from Kathmandu
* Find female students
* Count students by gender
* Count students by city
* Sort students alphabetically

---

## 🏢 Department Analysis

Examples:

* Count students in each department
* Find the department with the most students
* Calculate average marks by department
* Compare department performance

---

## 📚 Course & Instructor Analysis

Examples:

* Display courses with instructors
* Display course, department, and instructor
* Count courses by department
* Find instructors teaching the most courses
* Analyze instructor-related course performance

---

## 📈 Academic Performance Analysis

Examples:

* Find highest marks
* Find lowest marks
* Calculate overall average marks
* Calculate average marks by course
* Calculate average marks by student
* Find students scoring above 80
* Find students scoring below 70
* Count students by grade

---

## 🏆 Top Performer Analysis

Examples:

* Find top 5 students by average marks
* Find top individual marks
* Find highest mark in each course
* Find lowest mark in each course
* Rank students by academic performance

---

# 🧠 SQL Concepts Used

This project demonstrates both basic and advanced SQL concepts.

### Basic SQL

```text
SELECT
WHERE
ORDER BY
LIMIT
DISTINCT
```

### Aggregate Functions

```text
COUNT()
AVG()
MAX()
MIN()
ROUND()
```

### Grouping

```text
GROUP BY
HAVING
```

### Joins

```text
INNER JOIN
LEFT JOIN
Multiple-table JOIN
```

### Advanced SQL

```text
CASE
Subqueries
Window Functions
RANK()
Department-wise Ranking
```

---

# 💻 Sample SQL Query

### Top 5 Students by Average Marks

```sql
SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    ROUND(AVG(e.marks), 2) AS average_marks
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id
GROUP BY s.student_id, student_name
ORDER BY average_marks DESC
LIMIT 5;
```

### What this query does

1. Joins the `students` and `enrollments` tables
2. Calculates each student's average marks
3. Groups results by student
4. Sorts students from highest to lowest average
5. Returns the top 5 students

---

# 📊 Key Analysis Areas

| Area              | Analysis                               |
| ----------------- | -------------------------------------- |
| 👨‍🎓 Students    | Demographics, gender, city, department |
| 📝 Enrollment     | Student and course enrollment          |
| 📚 Courses        | Course enrollment and performance      |
| 🏢 Departments    | Student count and average performance  |
| 👨‍🏫 Instructors | Courses taught and performance         |
| 📈 Performance    | Average, highest and lowest marks      |
| 🏆 Top Performers | Top students and marks                 |
| 🥇 Ranking        | Overall and department-wise ranking    |

---

# ▶️ How to Run the Project

### 1. Clone the repository

```bash
git clone YOUR_GITHUB_REPOSITORY_URL
```

### 2. Open MySQL Workbench

You can also use **phpMyAdmin**.

### 3. Open the SQL file

```text
university_student_analytics.sql
```

### 4. Run the SQL script

The script creates:

* Database
* Tables
* Primary keys
* Foreign keys
* Sample data
* Analysis queries

### 5. Run the analysis queries

Execute individual queries to explore the university data and generate analytical results.

---

# 📁 Project Structure

```text
University-Student-Analytics/
│
├── university_student_analytics.sql
│
└── README.md
```

---

# 💡 Example Insights

The analysis can help answer questions such as:

* Which department has the most students?
* Which course has the highest average marks?
* Who are the top-performing students?
* Which departments have better academic performance?
* Which instructors teach the most courses?
* How are students distributed by city and gender?
* How many students fall into each grade category?

---

# 🚀 Future Improvements

The project can be expanded by adding:

* 📅 Semester information
* 📊 Attendance data
* 💰 Tuition and payment information
* 🎓 Scholarship information
* 🧮 GPA calculation
* 👁️ SQL Views
* 📊 Power BI dashboard
* 🌐 Web application
* 📈 More realistic datasets

---

# 🎯 Project Purpose

This project was created as a **SQL portfolio project** to demonstrate practical skills in:

* Relational database design
* MySQL
* SQL querying
* Data analysis
* Table relationships
* Joins
* Aggregation
* Subqueries
* Window functions
* Ranking

It demonstrates how SQL can be used to transform raw university data into useful academic insights.

---

# 👩‍💻 Author

**Bhumika Tamang**

BCA Student | Aspiring Data Analyst

### Skills

* SQL / MySQL
* Microsoft Excel
* Data Analysis
* Data Visualization
* HTML / CSS
* PHP
* JavaScript
* SEO & Digital Marketing

---

⭐ **If you find this project useful, feel free to explore the SQL queries and database structure.**
