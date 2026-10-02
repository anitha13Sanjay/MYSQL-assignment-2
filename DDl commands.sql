create database Employees1_DB;
use Employees1_DB;
## department , location,employees table creation
create table Departments(department_id int primary key,department_name varchar(100) not null);
create table location1(location_id int primary key auto_increment,location_name varchar(30) not null);

create table employees(employee_id int primary key,employee_name varchar(50) not null,
gender enum('M','F'),age int check (age>=18) ,
hire_date date default (current_date),
designation varchar(100),department_id int,location_id int,salary decimal (10,2));
use Employees1_DB;

insert into departments(department_id,department_name) values
(1,'IT'),
(2,'HR'),
(3,'Finance'),
(4,'Marketing'),
(5,'Sales'),
(6,'Administration'),
(7,'Production');

insert into location1(location_id,location_name) values
(101,'chennai'),
(102,'Banglore'),
(103,'Salem'),
(104,'Coimbatore'),
(105,'Madurai'),
(106,'Trichy'),
(107,'Mumbai');

insert into employees(employee_id,employee_name,gender,age,hire_date,designation,department_id,location_id,salary) values 
(1,'Ajay','M',23,'2018-01-15','Developer',1,101,550000.00),
(2,'sanjay','M',28,'2016-03-09','HR Executive',2,102,68000.00),
(3,'Viji','F',25,'2020-12-25','Financial Analyst',3,103,53000.00),
(4,'Sharma','F',27,'2017-10-14','Marketing manager',4,104,69000.00),
(5,'joseph','M',32,'2015-05-25','Sales officer',5,105,550000.00),
(6,'Priya','F',29,'2021-02-18','Admin',6,106,46000.00),
(7,'Riyan','M',26,'2025-08-29',' Producation lead',7,107,35000.00);

select distinct salary from employees;

select age as Employee_Age from employees;
select salary as Employee_salary from employees;




select  employee_name,salary from employees where salary > 50000 and hire_date < '2016-01-01';







select * from employees where designation is null ;

update employees set designation ='data scientist' where designation = ' ';

select * from employees order by department_id asc ,salary desc;



select sum(salary) as  total_Finance from employees;






select min(age) as minimum_Age from employees;



select * from employees where hire_date >= '2018-01-01' and hire_date < '2019-01-01' order by hire_date limit 5;



use Employees1_DB;
## GROUP BY
	
    select 
   l.location_name, max(e.salary) as maximum_salary 
    from location1 l,
    employees e 
     where  l.location_id=e.location_id
    group by l.location_name;
    
    select designation ,avg(salary) as average_salary from employees
    where designation like   '%Analyst%'
    group by designation;
    
    ## having
    select department_id,count(*) AS total_employees from employees
    group by department_id 
    having count(*) < 3;
    
    use Employees1_DB;
    select e.employee_name,e.designation,d.department_name
    from employees e
    inner join departments as d
    on e.department_id=d.department_id;
    
    
    
    
    
    
    select d.department_name,
    count(e.employee_id)as
    total_employees
    from departments d
    left join employees e on d.department_id= e.department_id
    group by d.department_id;
    
    
    
    
    use Employees1_DB;
  
    
    
    select l.location,e.employee_name
    from employees e
    right join location l
    on e.location_id=l.location_id;
    
    
    



select * from employees;



## Add new column to the employees table
alter table employees
add column email varchar(150);

## modify designation data type 
alter table employees
modify column designation varchar(150);

## drop age column from the employees table
alter table employees
drop column age;

## Rename the hire_date column to Date_of_joining
alter table employees
rename column hire_date to Date_of_joining;


##  Rename the Department table to Department_Info

alter table Departments
rename to Department_Info;

## Rename the location1 table Locations
alter table location1
rename to Locations;
use Employees1_DB;



truncate table employees;

## drop the employees table
drop database Employees1_DB;
