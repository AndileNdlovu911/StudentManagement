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
INSERT INTO courses(course_id, course_name, course_description) VALUES(1011, 'DALG103', 'Data Structures and Algorithms');
INSERT INTO courses(course_id, course_name, course_description) VALUES(1012, 'DBMS101', 'Introduction to databases and SQL');
INSERT INTO courses(course_id, course_name, course_description) VALUES(1013, 'NOPS101', 'Networks and Operating Systems');

-- enrolling students into courses
INSERT INTO enrollments(enrollment_id, student_id, course_id, enrollment_date) VALUES(201, 1, 1011, TRUNC(SYSDATE));
INSERT INTO enrollments(enrollment_id, student_id, course_id, enrollment_date) VALUES(202, 2, 1011, TRUNC(SYSDATE));
INSERT INTO enrollments(enrollment_id, student_id, course_id, enrollment_date) VALUES(203, 3, 1012, TRUNC(SYSDATE));

-- Procedure for adding a student
CREATE OR REPLACE PROCEDURE add_student(
p_student_id IN NUMBER,
p_f_name IN VARCHAR2,
p_l_name IN VARCHAR2,
p_date_of_birth IN DATE,
p_email IN VARCHAR2
)AS
BEGIN
INSERT INTO students (student_id, f_name, l_name, date_of_birth, email) VALUES (p_student_id, p_f_name, p_l_name, p_date_of_birth, p_email);
COMMIT;
DBMS_OUTPUT.PUT_LINE('Student added successfully!');
END;

-- update student procedure
CREATE OR REPLACE PROCEDURE update_student(
p_student_id IN NUMBER,
p_f_name IN VARCHAR2,
p_l_name IN VARCHAR2,
p_date_of_birth IN DATE,
p_email IN VARCHAR2
)AS
BEGIN
UPDATE students
SET f_name = p_f_name, l_name = p_l_name, date_of_birth = p_date_of_birth, email = p_email
WHERE student_id = p_student_id;
COMMIT;
DBMS_OUTPUT.PUT_LINE('Student updated successfully!');
EXCEPTION
WHEN NO_DATA_FOUND THEN 
DBMS_OUTPUT.PUT_LINE('Student not found!');
WHEN OTHERS THEN 
DBMS_OUTPUT.PUT_LINE('Error occured while updating student:');
ROLLBACK;
END;
