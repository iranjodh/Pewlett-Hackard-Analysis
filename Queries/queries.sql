
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
 emp_no INT NOT NULL ,
 dept_no VARCHAR NOT NULL ,
 from_date DATE ,
 to_date DATE ,
 Primary Key(emp_no,dept_no),
 FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
 FOREIGN KEY (emp_ no) REFERENCES employees (emp_no)
)

ALTER TABLE Dept_emp
    ADD CONSTRAINT fk_deptemp_employees FOREIGN KEY (emp_no) REFERENCES employees (emp_no);


CREATE TABLE titles (
  title_id  Serial ,
  emp_no INT NOT NULL,
  title Varchar(50) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (title_id)
);


-- Returned First name ,Last and emoplpyee number from emoplpyees table where the dept is marketing


select employees.first_name , employees.last_name , employees.emp_no
from departments as d
Inner Join dept_emp 
ON d.dept_no = dept_emp.dept_no
Inner join employees 
ON employees.emp_no = dept_emp.emp_no
where dept_name like 'Marketing';

