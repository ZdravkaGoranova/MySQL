# Table Relations - Exercise
# 01. One-To-One Relationship
CREATE DATABASE table_ralations;
CREATE TABLE people (
    person_id INT UNIQUE NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10 , 2 ) DEFAULT 0,
    passport_id INT UNIQUE
);
CREATE TABLE passports (
    passport_id INT PRIMARY KEY AUTO_INCREMENT,
    passport_number VARCHAR(8)  UNIQUE 
);

ALTER TABLE  people 
ADD CONSTRAINT pk_people PRIMARY KEY(person_id),
ADD CONSTRAINT fk_people_passports  
FOREIGN KEY(passport_id) 
REFERENCES  passports(passport_id);

INSERT INTO passports (passport_id, passport_number)
VALUES
    (101, 'N34FG21B'),
    (102,'K65LO4R7'),
    (103, 'ZE657QP2');
  INSERT INTO people (first_name, salary, passport_id)
VALUES
    ('Roberto', 43300.00, 102),
    ('Tom', 56100.00, 103),
    ('Yana', 60200.00, 101);  
    
# 02. One-To-Many Relationship
SELECT @@sql_mode;
SET @@sql_mode = 'NO_ZERO_DATE,NO_ZERO_IN_DATE';

CREATE TABLE manufacturers (
    manufacturer_id INT UNIQUE AUTO_INCREMENT,
    name VARCHAR(50)UNIQUE NOT NULL,
--     established_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP()
  --   established_on DATE NOT NULL DEFAULT NOW()
--   established_on DATETIME NOT NULL DEFAULT NOW()
  established_on DATE NOT NULL 
);

create table models(
model_id INT PRIMARY KEY AUTO_INCREMENT,
name  VARCHAR(50) NOT NULL, 
manufacturer_id INT
);

ALTER TABLE models AUTO_INCREMENT=101;

ALTER TABLE  manufacturers 
ADD CONSTRAINT pk_models PRIMARY KEY(manufacturer_id);

ALTER TABLE  models 
ADD CONSTRAINT fk_models_manufacturers 
FOREIGN KEY(manufacturer_id)
REFERENCES  manufacturers(manufacturer_id);

INSERT INTO manufacturers (manufacturer_id, name, established_on)
VALUES
    (1, 'BMW', '1916-03-01'),
    (2, 'Tesla', '2003-01-01'),
    (3, 'Lada', '1966-05-01');
    INSERT INTO models (model_id, name, manufacturer_id)
VALUES
    (101, 'X1', 1),
    (102, 'i6', '1'),
    (103, 'Model S', 2),
    (104, 'Model X', 2),
    (105, 'Model 3', 2),
    (106, 'Nova', 3);

# 03. Many-To-Many Relationship

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL
);

CREATE TABLE exams (
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
)  AUTO_INCREMENT=101;

CREATE TABLE students_exams (
    student_id INT,
    exam_id INT,
    CONSTRAINT pk_students_exams PRIMARY KEY (student_id , exam_id),
    CONSTRAINT fk_students_exams_student FOREIGN KEY (student_id)
        REFERENCES students (student_id),
    CONSTRAINT fk_students_exams_exams FOREIGN KEY (exam_id)
        REFERENCES exams (exam_id)
);
insert into students(name)
VALUE('Mila'),
('Toni'),
('Ron');

insert into exams(name)
VALUE('Spring MVC'),
('Neo4j'),
('Oracle 11g');

insert into students_exams
 values
 (1,101),
 (1,102),
 (2,101),
 (3,103),
 (2,102),
 (2,103);

# 04. Self-Referencing

CREATE TABLE teachers (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    manager_id INT ,
    CONSTRAINT fk_manager_id_teacher_id FOREIGN KEY (manager_id)
        REFERENCES teachers (teacher_id)
);

insert into teachers (teacher_id, name,manager_id)
VALUE
(101,'John',''),
(102,'Maya',106),
(103,'Silvia',106),
(104,'Ted',105),
(105,'Mark',101),
(106,'Greta',101)
;

# 05. Online Store Database
CREATE DATABASE online_store;

CREATE TABLE item_types (
    item_type_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) 
);
CREATE TABLE items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) ,
    item_type_id INT,
    CONSTRAINT fk_items_teacher_id FOREIGN KEY (item_type_id)
        REFERENCES item_types (item_type_id)
);
CREATE TABLE cities (
    city_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) 
);
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) ,
    birthday DATE,
    city_id INT,
    CONSTRAINT fk_customers_cities FOREIGN KEY (city_id)
        REFERENCES cities (city_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    CONSTRAINT fk_customers_orders FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
);
CREATE TABLE order_items (
    order_id INT,
    item_id INT,
    CONSTRAINT pk_order PRIMARY KEY (order_id , item_id),
    CONSTRAINT fk_order_items FOREIGN KEY (order_id)
        REFERENCES orders (order_id),
    CONSTRAINT fk_items_order FOREIGN KEY (item_id)
        REFERENCES items (item_id)
);

# 06. University Database
CREATE DATABASE database_University;
CREATE TABLE subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(50) 
);

CREATE TABLE majors (
    major_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_number VARCHAR(12),
    student_name VARCHAR(50),
    major_id INT,
    CONSTRAINT fk_order_majors FOREIGN KEY (major_id)
        REFERENCES majors (major_id)
);
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    payment_date DATE,
    payment__amount DECIMAL(8 , 2 ),
    student_id INT,
    CONSTRAINT fk_payments_students FOREIGN KEY (student_id)
        REFERENCES students (student_id)
);
CREATE TABLE agenda (
    student_id INT,
    subject_id INT,
    CONSTRAINT pk_agenda_ PRIMARY KEY (student_id , subject_id),
    CONSTRAINT fk_agenda_students FOREIGN KEY (student_id)
        REFERENCES students (student_id),
    CONSTRAINT fk_agenda_subjects FOREIGN KEY (subject_id)
        REFERENCES subjects (subject_id)
);
# 07. Peaks in Rila