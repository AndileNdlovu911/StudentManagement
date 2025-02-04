-- creating student table
CREATE TABLE students(
student_id NUMBER PRIMARY KEY,
f_name VARCHAR(50),
l_name VARCHAR(50),
date_of_birth DATE,
email VARCHAR(100)
);

-- table for courses
CREATE TABLE courses(
course_id NUMBER PRIMARY KEY,
course_name VARCHAR(50),
course_description VARCHAR(50)
);

-- table for enrollments
CREATE TABLE enrollments(
enrollment_id NUMBER PRIMARY KEY,
student_id NUMBER,
course_id NUMBER,
enrollment_date DATE,
FOREIGN KEY(student_id) REFERENCES students(student_id),
FOREIGN KEY(course_id) REFERENCES courses(course_id)
);

-- inserting student information
INSERT INTO students(student_id, f_name, l_name, date_of_birth, email) VALUES(1, 'Andile', 'Ndlovu', TO_DATE('11-09-1990', 'DD-MM-YYYY'), 'an@notreal.com');
INSERT INTO students(student_id, f_name, l_name, date_of_birth, email) VALUES(2, 'Buhle', 'Mukhuba', TO_DATE('10-07-2003', 'DD-MM-YYYY'), 'bm@notreal.com');
INSERT INTO students(student_id, f_name, l_name, date_of_birth, email) VALUES(3, 'Khumbulani', 'Ndlovu', TO_DATE('04-10-2003', 'DD-MM-YYYY'), 'kb@notreal.com');

-- inserting course information
INSERT INTO courses(course_id, course_name, course_description) VALUES(11, 'DALG103', 'Data Structures and Algorithms');
INSERT INTO courses(course_id, course_name, course_description) VALUES(12, 'DBMS101', 'Introduction to databases and SQL');
INSERT INTO courses(course_id, course_name, course_description) VALUES(13, 'NOPS101', 'Networks and Operating Systems');

-- enrolling students into courses
INSERT INTO enrollments(enrollment_id, student_id, course_id, enrollment_date) VALUES(21, 1, 1, TRUNC(SYSDATE));
INSERT INTO enrollments(enrollment_id, student_id, course_id, enrollment_date) VALUES(22, 2, 1, TRUNC(SYSDATE));
INSERT INTO enrollments(enrollment_id, student_id, course_id, enrollment_date) VALUES(23, 3, 1, TRUNC(SYSDATE));