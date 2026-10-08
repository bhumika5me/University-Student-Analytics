CREATE DATABASE university_student_analytics;

USE university_student_analytics;

CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    faculty VARCHAR(100) NOT NULL
);


INSERT INTO departments (department_name, faculty)
VALUES
('Computer Science', 'Science and Technology'),
('Information Technology', 'Science and Technology'),
('Business Administration', 'Management'),
('Management', 'Management');

-- 3. CREATE STUDENTS TABLE


CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    city VARCHAR(50),
    admission_date DATE NOT NULL,
    department_id INT NOT NULL,

    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);


-- Insert students

INSERT INTO students
(first_name, last_name, gender, date_of_birth, email, phone, city, admission_date, department_id)
VALUES
('Aarav', 'Sharma', 'Male', '2003-02-14', 'aarav.sharma@gmail.com', '9800000001', 'Kathmandu', '2022-08-15', 1),
('Nisha', 'Lama', 'Female', '2003-07-21', 'nisha.lama@gmail.com', '9800000002', 'Lalitpur', '2022-08-15', 2),
('Ramesh', 'Rai', 'Male', '2002-11-08', 'ramesh.rai@gmail.com', '9800000003', 'Bhaktapur', '2022-08-16', 1),
('Sita', 'Gurung', 'Female', '2003-04-19', 'sita.gurung@gmail.com', '9800000004', 'Pokhara', '2023-01-10', 3),
('Bibek', 'Tamang', 'Male', '2002-09-30', 'bibek.tamang@gmail.com', '9800000005', 'Kathmandu', '2023-01-10', 2),
('Anisha', 'Shrestha', 'Female', '2003-12-02', 'anisha.shrestha@gmail.com', '9800000006', 'Lalitpur', '2023-01-11', 1),
('Prakash', 'Karki', 'Male', '2002-05-11', 'prakash.karki@gmail.com', '9800000007', 'Kathmandu', '2022-08-17', 4),
('Mina', 'Thapa', 'Female', '2003-06-27', 'mina.thapa@gmail.com', '9800000008', 'Bhaktapur', '2023-01-12', 3),
('Suman', 'Adhikari', 'Male', '2002-10-17', 'suman.adhikari@gmail.com', '9800000009', 'Chitwan', '2022-08-18', 2),
('Kritika', 'KC', 'Female', '2003-03-25', 'kritika.kc@gmail.com', '9800000010', 'Kathmandu', '2023-01-13', 1);

CREATE TABLE instructors (
    instructor_id INT PRIMARY KEY AUTO_INCREMENT,
    instructor_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department_id INT NOT NULL,
    salary DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);



INSERT INTO instructors
(instructor_name, email, department_id, salary)
VALUES
('Dr. Anil Thapa', 'anil.thapa@university.edu', 1, 85000),
('Er. Sunita Rai', 'sunita.rai@university.edu', 2, 82000),
('Prof. Milan Shrestha', 'milan.shrestha@university.edu', 3, 78000),
('Dr. Ritu Karki', 'ritu.karki@university.edu', 4, 80000),
('Er. Binod Gurung', 'binod.gurung@university.edu', 1, 76000),
('Ms. Pooja Lama', 'pooja.lama@university.edu', 2, 74000);


CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    credit_hours INT NOT NULL,
    department_id INT NOT NULL,
    instructor_id INT NOT NULL,

    FOREIGN KEY (department_id)
        REFERENCES departments(department_id),

    FOREIGN KEY (instructor_id)
        REFERENCES instructors(instructor_id)
);



INSERT INTO courses
(course_name, credit_hours, department_id, instructor_id)
VALUES
('Database Management Systems', 3, 1, 1),
('Data Structures and Algorithms', 3, 1, 5),
('Web Technology', 3, 2, 2),
('Data Analytics', 3, 2, 6),
('Marketing Management', 3, 3, 3),
('Financial Management', 3, 3, 3),
('Organizational Behavior', 3, 4, 4),
('Business Statistics', 3, 4, 4),
('Operating Systems', 3, 1, 1),
('Computer Networks', 3, 2, 2);




CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    marks DECIMAL(5,2) NOT NULL,
    grade CHAR(2) NOT NULL,
    status ENUM('Active', 'Completed', 'Dropped') DEFAULT 'Active',

    FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    FOREIGN KEY (course_id)
        REFERENCES courses(course_id)
);



INSERT INTO enrollments
(student_id, course_id, enrollment_date, marks, grade, status)
VALUES
(1, 1, '2025-01-10', 88, 'A', 'Completed'),
(1, 2, '2025-01-10', 82, 'A', 'Completed'),
(1, 3, '2025-01-11', 76, 'B', 'Completed'),

(2, 3, '2025-01-11', 91, 'A', 'Completed'),
(2, 4, '2025-01-11', 87, 'A', 'Completed'),

(3, 1, '2025-01-12', 72, 'B', 'Completed'),
(3, 2, '2025-01-12', 79, 'B', 'Completed'),
(3, 9, '2025-01-12', 68, 'C', 'Completed'),

(4, 5, '2025-01-13', 84, 'A', 'Completed'),
(4, 6, '2025-01-13', 78, 'B', 'Completed'),

(5, 3, '2025-01-14', 73, 'B', 'Completed'),
(5, 4, '2025-01-14', 89, 'A', 'Completed'),
(5, 10, '2025-01-14', 81, 'A', 'Completed'),

(6, 1, '2025-01-15', 95, 'A', 'Completed'),
(6, 2, '2025-01-15', 90, 'A', 'Completed'),
(6, 9, '2025-01-15', 86, 'A', 'Completed'),

(7, 7, '2025-01-16', 69, 'C', 'Completed'),
(7, 8, '2025-01-16', 75, 'B', 'Completed'),

(8, 5, '2025-01-17', 92, 'A', 'Completed'),
(8, 6, '2025-01-17', 88, 'A', 'Completed'),

(9, 3, '2025-01-18', 67, 'C', 'Completed'),
(9, 4, '2025-01-18', 71, 'B', 'Completed'),

(10, 1, '2025-01-19', 93, 'A', 'Completed'),
(10, 2, '2025-01-19', 96, 'A', 'Completed'),
(10, 9, '2025-01-19', 91, 'A', 'Completed');


 --ANALYSIS QUERIES--



-- Q1. Count total students

SELECT COUNT(*) AS total_students
FROM students;


-- Q2. Display all students

SELECT *
FROM students;


-- Q3. Display student name and city

SELECT first_name, last_name, city
FROM students;


-- Q4. Find students from Kathmandu

SELECT *
FROM students
WHERE city = 'Kathmandu';


-- Q5. Find all female students

SELECT *
FROM students
WHERE gender = 'Female';


-- Q6. Find female students from Kathmandu

SELECT *
FROM students
WHERE gender = 'Female'
AND city = 'Kathmandu';


-- Q7. Sort students alphabetically

SELECT *
FROM students
ORDER BY first_name ASC;


-- Q8. Sort students by ID descending

SELECT *
FROM students
ORDER BY student_id DESC;


-- Q9. Count students by gender

SELECT
    gender,
    COUNT(*) AS total_students
FROM students
GROUP BY gender;


-- Q10. Count students by city

SELECT
    city,
    COUNT(*) AS total_students
FROM students
GROUP BY city
ORDER BY total_students DESC;


-- Q11. Show each student with department

SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    d.department_name
FROM students s
JOIN departments d
    ON s.department_id = d.department_id;


-- Q12. Count students in each department

SELECT
    d.department_name,
    COUNT(s.student_id) AS total_students
FROM departments d
LEFT JOIN students s
    ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name;


-- Q13. Find department with most students

SELECT
    d.department_name,
    COUNT(s.student_id) AS total_students
FROM departments d
LEFT JOIN students s
    ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name
ORDER BY total_students DESC
LIMIT 1;


-- Q14. Average marks by department

SELECT
    d.department_name,
    ROUND(AVG(e.marks), 2) AS average_marks
FROM departments d
JOIN students s
    ON d.department_id = s.department_id
JOIN enrollments e
    ON s.student_id = e.student_id
GROUP BY d.department_id, d.department_name
ORDER BY average_marks DESC;


-- Q15. Show courses with instructors

SELECT
    c.course_name,
    i.instructor_name
FROM courses c
JOIN instructors i
    ON c.instructor_id = i.instructor_id;


-- Q16. Show course, department and instructor

SELECT
    c.course_name,
    d.department_name,
    i.instructor_name
FROM courses c
JOIN departments d
    ON c.department_id = d.department_id
JOIN instructors i
    ON c.instructor_id = i.instructor_id;


-- Q17. Count courses in each department

SELECT
    d.department_name,
    COUNT(c.course_id) AS total_courses
FROM departments d
LEFT JOIN courses c
    ON d.department_id = c.department_id
GROUP BY d.department_id, d.department_name;


-- Q18. Instructor teaching most courses

SELECT
    i.instructor_name,
    COUNT(c.course_id) AS total_courses
FROM instructors i
JOIN courses c
    ON i.instructor_id = c.instructor_id
GROUP BY i.instructor_id, i.instructor_name
ORDER BY total_courses DESC
LIMIT 1;


-- Q19. Show students, courses and marks

SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    c.course_name,
    e.marks
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id
JOIN courses c
    ON e.course_id = c.course_id;


-- Q20. Count total enrollments

SELECT COUNT(*) AS total_enrollments
FROM enrollments;


-- Q21. Find student with highest marks

SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    c.course_name,
    e.marks
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id
JOIN courses c
    ON e.course_id = c.course_id
ORDER BY e.marks DESC
LIMIT 1;


-- Q22. Find overall average marks

SELECT
    ROUND(AVG(marks), 2) AS average_marks
FROM enrollments;


-- Q23. Find highest and lowest marks

SELECT
    MAX(marks) AS highest_marks,
    MIN(marks) AS lowest_marks
FROM enrollments;


-- Q24. Average marks for each course

SELECT
    c.course_name,
    ROUND(AVG(e.marks), 2) AS average_marks
FROM courses c
JOIN enrollments e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY average_marks DESC;


-- Q25. Average marks for each student

SELECT
    s.student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    ROUND(AVG(e.marks), 2) AS average_marks
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id
GROUP BY s.student_id, student_name
ORDER BY average_marks DESC;


-- Q26. Students with average marks above 80

SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    ROUND(AVG(e.marks), 2) AS average_marks
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id
GROUP BY s.student_id, student_name
HAVING AVG(e.marks) > 80
ORDER BY average_marks DESC;


-- Q27. Students who scored more than 90

SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    c.course_name,
    e.marks
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id
JOIN courses c
    ON e.course_id = c.course_id
WHERE e.marks > 90
ORDER BY e.marks DESC;


-- Q28. Students who scored below 70

SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    c.course_name,
    e.marks
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id
JOIN courses c
    ON e.course_id = c.course_id
WHERE e.marks < 70
ORDER BY e.marks ASC;


-- Q29. Count students by grade

SELECT
    grade,
    COUNT(DISTINCT student_id) AS total_students
FROM enrollments
GROUP BY grade
ORDER BY grade;


-- Q30. Average marks by grade

SELECT
    grade,
    ROUND(AVG(marks), 2) AS average_marks
FROM enrollments
GROUP BY grade
ORDER BY average_marks DESC;


-- Q31. Top 5 students by average marks

SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    ROUND(AVG(e.marks), 2) AS average_marks
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id
GROUP BY s.student_id, student_name
ORDER BY average_marks DESC
LIMIT 5;


-- Q32. Top 5 individual marks

SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    c.course_name,
    e.marks
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id
JOIN courses c
    ON e.course_id = c.course_id
ORDER BY e.marks DESC
LIMIT 5;


-- Q33. Highest mark in each course

SELECT
    c.course_name,
    MAX(e.marks) AS highest_marks
FROM courses c
JOIN enrollments e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY highest_marks DESC;


-- Q34. Lowest mark in each course

SELECT
    c.course_name,
    MIN(e.marks) AS lowest_marks
FROM courses c
JOIN enrollments e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY lowest_marks ASC;


-- Q35. Categorize performance

SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    e.marks,
    CASE
        WHEN e.marks >= 90 THEN 'Excellent'
        WHEN e.marks >= 80 THEN 'Very Good'
        WHEN e.marks >= 70 THEN 'Good'
        ELSE 'Needs Improvement'
    END AS performance
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id;


-- Q36. Count performance categories

SELECT
    CASE
        WHEN marks >= 90 THEN 'Excellent'
        WHEN marks >= 80 THEN 'Very Good'
        WHEN marks >= 70 THEN 'Good'
        ELSE 'Needs Improvement'
    END AS performance,
    COUNT(*) AS total_records
FROM enrollments
GROUP BY performance;


-- Q37. Students above overall average

SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    ROUND(AVG(e.marks), 2) AS average_marks
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id
GROUP BY s.student_id, student_name
HAVING AVG(e.marks) > (
    SELECT AVG(marks)
    FROM enrollments
)
ORDER BY average_marks DESC;


-- Q38. Course with highest average marks

SELECT
    c.course_name,
    ROUND(AVG(e.marks), 2) AS average_marks
FROM courses c
JOIN enrollments e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY average_marks DESC
LIMIT 1;


-- Q39. Students enrolled in more than 2 courses

SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    COUNT(e.course_id) AS total_courses
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id
GROUP BY s.student_id, student_name
HAVING COUNT(e.course_id) > 2
ORDER BY total_courses DESC;


-- Q40. Average marks for each instructor

SELECT
    i.instructor_name,
    ROUND(AVG(e.marks), 2) AS average_marks
FROM instructors i
JOIN courses c
    ON i.instructor_id = c.instructor_id
JOIN enrollments e
    ON c.course_id = e.course_id
GROUP BY i.instructor_id, i.instructor_name
ORDER BY average_marks DESC;

-- 8. WINDOW FUNCTIONS


-- Q41. Rank students by average marks

SELECT
    student_name,
    average_marks,
    RANK() OVER (
        ORDER BY average_marks DESC
    ) AS student_rank
FROM (
    SELECT
        CONCAT(s.first_name, ' ', s.last_name) AS student_name,
        ROUND(AVG(e.marks), 2) AS average_marks
    FROM students s
    JOIN enrollments e
        ON s.student_id = e.student_id
    GROUP BY s.student_id, student_name
) AS student_scores;


-- Q42. Rank students within each department

SELECT
    department_name,
    student_name,
    average_marks,
    RANK() OVER (
        PARTITION BY department_name
        ORDER BY average_marks DESC
    ) AS department_rank
FROM (
    SELECT
        d.department_name,
        CONCAT(s.first_name, ' ', s.last_name) AS student_name,
        ROUND(AVG(e.marks), 2) AS average_marks
    FROM students s
    JOIN departments d
        ON s.department_id = d.department_id
    JOIN enrollments e
        ON s.student_id = e.student_id
    GROUP BY
        d.department_id,
        d.department_name,
        s.student_id,
        student_name
) AS student_scores;



-- 9. FINAL PORTFOLIO REPORTS
-- Q43. Department performance summary

SELECT
    d.department_name,
    COUNT(DISTINCT s.student_id) AS total_students,
    COUNT(e.enrollment_id) AS total_enrollments,
    ROUND(AVG(e.marks), 2) AS average_marks,
    MAX(e.marks) AS highest_marks,
    MIN(e.marks) AS lowest_marks
FROM departments d
LEFT JOIN students s
    ON d.department_id = s.department_id
LEFT JOIN enrollments e
    ON s.student_id = e.student_id
GROUP BY d.department_id, d.department_name
ORDER BY average_marks DESC;


-- Q44. Course performance summary

SELECT
    c.course_name,
    COUNT(e.enrollment_id) AS total_students,
    ROUND(AVG(e.marks), 2) AS average_marks,
    MAX(e.marks) AS highest_marks,
    MIN(e.marks) AS lowest_marks
FROM courses c
LEFT JOIN enrollments e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY average_marks DESC;


-- Q45. Complete student performance report

SELECT
    s.student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    d.department_name,
    COUNT(e.course_id) AS total_courses,
    ROUND(AVG(e.marks), 2) AS average_marks,
    MAX(e.marks) AS highest_marks,
    MIN(e.marks) AS lowest_marks
FROM students s
JOIN departments d
    ON s.department_id = d.department_id
LEFT JOIN enrollments e
    ON s.student_id = e.student_id
GROUP BY
    s.student_id,
    student_name,
    d.department_name
ORDER BY average_marks DESC;