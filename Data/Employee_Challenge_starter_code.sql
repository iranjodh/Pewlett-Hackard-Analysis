CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

CREATE TABLE employees (
     emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);

CREATE TABLE Dept_emp (
 dept INT NOT NULL ,
 dept_no INT NOT NULL ,
 from_date DATE ,
 to_date DATE ,
 Primary Key(dept)
 FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
)




CREATE TABLE titles (
  emp_no INT NOT NULL,
  title Varchar(50) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);



-- # Deleiverable 1 

Select  e.emp_no , e.first_name , e.last_name ,ti.title, ti.from_date ,ti.to_date
INTO retirement_titles
from employees as e
Inner Join titles as ti
ON e.emp_no = ti.emp_no
where birth_date BETWEEN '1952-01-01' AND '1955-12-31'
Order by emp_no;


SELECT DISTINCT ON (emp_no),emp_no
first_name,
last_name,
title
INTO unique_titles
FROM etirement_titles
WHERE to_date ='9999-01-01'
ORDER BY emp_no, to_date DESC;

Select Count(title) title
Into retiring_titles
from unique_titles
Group by title 
Order by Count(title) desc;



Select DISTINCT on(e.emp_no)e.emp_no,e.first_name,e.last_name,e.birth_date,
de.from_date , de.to_date,ti.title
Into mentorship_eligibilty
from employees as e
Inner join dept_emp as de
on (e.emp_no = de.emp_no)
Inner join titles as ti
on (e.emp_no = ti.emp_no)
where 
(e.birth_date between '1965-01-01' and '1965-12-31') And(de.to_date='9999-01-01')
Order by emp_no;