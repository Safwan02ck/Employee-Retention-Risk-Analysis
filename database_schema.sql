CREATE DATABASE employee_retention;
USE employee_retention;

-- Departments Table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    dept_id INT,
    salary DECIMAL(10, 2),
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Projects Table
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    emp_id INT,
    hours_logged INT,
    deadline DATE,
    status ENUM('Completed', 'Delayed', 'Ongoing'),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

-- Performance Reviews Table
CREATE TABLE performance (
    review_id INT PRIMARY KEY,
    emp_id INT,
    review_date DATE,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);
INSERT INTO departments VALUES 
(1, 'Engineering'), (2, 'Marketing'), (3, 'HR');

INSERT INTO employees VALUES
(101, 'Alex Johnson', 1, 90000, '2020-03-15'),
(102, 'Sam Smith', 2, 75000, '2021-06-20'),
(103, 'Taylor Reed', 1, 85000, '2019-11-30');

INSERT INTO projects VALUES
(1001, 'System Upgrade', 101, 120, '2023-12-01', 'Completed'),
(1002, 'Campaign Launch', 102, 95, '2023-11-15', 'Delayed');

INSERT INTO performance VALUES
(501, 101, '2023-01-15', 4),
(502, 102, '2023-02-20', 3)
;
