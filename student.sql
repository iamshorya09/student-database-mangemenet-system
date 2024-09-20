-- create a table
CREATE TABLE enrollments ( student_id INT,

course_id INT, enrollment_date DATE,

PRIMARY KEY (student_id, course_id), FOREIGN KEY (student_id) REFERENCES students (student_id),

FOREIGN KEY (course_id) REFERENCES courses (course_id)

);
CREATE TABLE grades (

student_id INT,

course_id INT, grade FLOAT,

PRIMARY KEY (student_id, course_id),

FOREIGN KEY (student_id) REFERENCES students (student_id),FOREIGN KEY (course_id) REFERENCES courses (course_id));
CREATE TABLE courses (

course_id INT PRIMARY KEY, name VARCHAR(50), description VARCHAR(200), credits INT

);
CREATE TABLE students ( student_id INT PRIMARY KEY, name VARCHAR(50), date_of_birth DATE, contact_number VARCHAR(15),address VARCHAR(100));
select * from students;
INSERT INTO students (student_id, name, date_of_birth, contact_number, address)
VALUES
    (2, 'Rahul', '1996-09-20', '987-654-3210', '15 Lotus Lane'),
    (5, 'Priya', '1999-04-12', '555-123-4567', '42 Tulip Road'),
    (3, 'Amit', '1997-07-05', '789-456-1230', '88 Rose Street');
select * from students;
INSERT INTO students (student_id, name, date_of_birth, address, contact_number)
VALUES
    (1, 'John Doe', '1995-07-15', '123 Main Street', '555-1234');
select * from students;
select * from students where student_id=1;
 INSERT INTO courses (course_id, name, description, credits)
VALUES
    (100, 'Introduction to Programming', 'An introductory course on programming concepts.', 3),
    (200, 'Database Management', 'Learn about managing and querying databases.', 4),
    (300, 'Web Development Fundamentals', 'Building web applications from scratch.', 3),
    (400, 'Data Structures and Algorithms', 'Advanced data structures and algorithms.', 4),
    (500, 'Machine Learning', 'Introduction to machine learning techniques.', 3);   
select * from courses;
INSERT INTO courses (course_id, name, description, credits)
VALUES (101, 'Mathematics', 'Introduction to Calculus', 3);
select * from courses;
SELECT* FROM courses WHERE course_id = 101;
INSERT INTO grades (student_id, course_id, grade)
VALUES
    (1, 101, 92.5),   
    (1, 200, 88.0),   
    (2, 100, 95.2),   
    (2, 300, 89.7),
    (5, 200, 58.4),   
    (5, 300, 82.1);
    (3, 200, 78.4),   
    (3, 400, 87.1);
INSERT INTO grades (student_id, course_id, grade)
VALUES (1, 101, 85.5);
UPDATE grades SET grade=98.8 WHERE student_id = 1 AND course_id = 101;
select * from grades;
-- Inserting sample enrollments
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES
    (1, 101, '2023-09-15'),  
    (1, 200, '2023-09-16'),  
    (2, 100, '2023-09-14'),  
    (2, 300, '2023-09-17'),  
    (5, 200, '2023-09-16'),  
    (3, 500, '2023-09-18');  
SELECT courses.* FROM courses JOIN enrollments ON courses.course_id = enrollments.course_id WHERE enrollments.student_id = 1;
SELECT AVG(grade) FROM grades WHERE student_id = 1;
SELECT students.*, AVG(grades.grade) AS average_grade
FROM students

JOIN grades ON students.student_id = grades. student_id

GROUP BY students.student_id

ORDER BY average_grade DESC LIMIT 10;