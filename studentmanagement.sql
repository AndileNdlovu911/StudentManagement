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