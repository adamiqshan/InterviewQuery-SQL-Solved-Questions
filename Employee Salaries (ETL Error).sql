/*

Let’s say we have a table representing a company payroll schema.

Due to an ETL error, the employees table instead of updating the salaries every year when doing compensation adjustments, did an insert instead. The head of HR still needs the current salary of each employee.

Bonus: Write a query to get the current salary for each employee.

*/

create table employees (
    id 	INTEGER,
    first_name 	VARCHAR,
    last_name 	VARCHAR,
    salary 	INTEGER,
    department_id 	INTEGER
);


insert into employees values
(1,'Randy','Washington',86000,1),
(2,'Ann','Roman',146000,3),
(3,'Evan','Lee',145000,3),
(4,'Dennis','Ortiz',82000,1),
(5,'Leah','Navarro',105000,2),
(6,'Randy','Washington',100000,1),
(7,'Ann','Roman',185000,3),
(8,'Evan','Lee',200000,3),
(9,'Dennis','Ortiz',75000,1),
(10,'Leah','Navarro',170000,2);


with recent_ids as (
    select first_name, last_name, max(id) id, salary
    from employees
    group by 1,2
)

select e.first_name, e.last_name, e.salary
from employees e
join recent_ids r on r.id = e.id
order by e.id