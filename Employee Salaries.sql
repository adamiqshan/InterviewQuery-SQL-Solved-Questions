--Given a employees and departments table, select the top 3 departments with at least ten employees and rank them according to the percentage of their employees making over 100K in salary.

create table employees (
    id 	INTEGER,
    first_name 	VARCHAR,
    last_name 	VARCHAR,
    salary 	INTEGER,
    department_id 	INTEGER
);

create table departments (
id 	INTEGER,
name 	VARCHAR
);

insert into departments values
(1,'Admin'),
(2,'HR'),
(3,'IT'),
(4,'Finance'),
(5,'Accounts');


insert into employees values
(1,'Randy','Washington',86000,1),
(2,'Ann','Roman',146000,3),
(3,'Evan','Lee',145000,3),
(4,'Dennis','Ortiz',82000,1),
(5,'Leah','Navarro',105000,2),
(6,'Alyssa','Barry',140000,3),
(7,'Stephen','Osborne',110000,2),
(8,'Jorge','Murphy',149000,4),
(9,'Stephen','Moore',59000,2),
(10,'Penny','Berg',50000,5),
(11,'James','Washington',60000,3),
(12,'Christopher','Gibbs',67000,2),
(13,'Stephanie','Rivera',121000,3),
(14,'James','Garcia',128000,2),
(15,'Lisa','Torres',101000,1),
(16,'Kevin','Miller',101000,4),
(17,'Nancy','Adams',109000,1),
(18,'Caroline','Allen',135000,3),
(19,'Joseph','Garcia',74000,1),
(20,'Andre','Dorsey',121000,2),
(21,'Emily','Ortega',91000,4),
(22,'Amanda','Roth',77000,1),
(23,'David','Sanders',93000,1),
(24,'Nicole','Hines',98000,1),
(25,'Peter','Wright',53000,5),
(26,'Wendy','Hall',146000,2),
(27,'Elizabeth','Escobar',116000,4),
(28,'Christopher','Jimenez',77000,4),
(29,'Dennis','Tran',131000,3),
(30,'Nicholas','Jones',124000,1),
(31,'Angela','Young',96000,1),
(32,'Stephanie','Forbes',130000,5),
(33,'Tiffany','Oneal',82000,2),
(34,'Meredith','King',88000,1),
(35,'Patricia','Coleman',144000,1),
(36,'Timothy','Castillo',72000,1),
(37,'Kevin','Wilson',150000,4),
(38,'Hannah','Chan',117000,4),
(39,'Jeff','Tran',82000,1),
(40,'James','Smith',96000,2),
(41,'Tamara','Barton',94000,1),
(42,'Sarah','Rogers',130000,3),
(43,'Rachel','Sanders',130000,4),
(44,'Michael','Wells',62000,2),
(45,'Mrs.','Tracy',114000,4),
(46,'Tammy','Barnes',145000,2),
(47,'Jordan','Nelson',113000,3),
(48,'Eric','Williams',62000,3),
(49,'Monica','Williams',82000,2),
(50,'Andrea','Brooks',134000,2),
(51,'Chelsea','Henderson',62000,4),
(52,'Christopher','Santiago',51000,3),
(53,'Timothy','Brennan',53000,3),
(54,'Jose','Walker',97000,3),
(55,'Terri','Henderson',97000,2),
(56,'Tonya','Wilson',131000,3),
(57,'Amber','Larson',58000,5),
(58,'Nancy','White',59000,5),
(59,'Kelly','Banks',144000,3),
(60,'Richard','Flores',110000,5),
(61,'John','Quinn',104000,2),
(62,'Jacob','White',91000,3),
(63,'Jeremy','Walker',52000,3),
(64,'Gregory','Henry',98000,2),
(65,'Jennifer','Marks',79000,4),
(66,'Amy','King',114000,1),
(67,'Lisa','Buchanan',96000,3),
(68,'Jeffrey','Adkins',95000,1),
(69,'Lisa','Jones',57000,1),
(70,'Katherine','Chase',120000,1),
(71,'Stanley','Carter',127000,4),
(72,'Samantha','Hill',105000,4),
(73,'Rick','Hernandez',96000,4),
(74,'Laura','Holt',127000,3),
(75,'Brandon','Shelton',112000,1),
(76,'James','Wilson',129000,5),
(77,'Michael','Coleman',126000,4),
(78,'John','Stephens',141000,4),
(79,'Jaime','Manning',102000,3),
(80,'Destiny','Hall',92000,5),
(81,'Jerry','Baird',58000,2),
(82,'Matthew','Collins',99000,1),
(83,'Sara','Wall',70000,1),
(84,'Tina','Horn',117000,2),
(85,'Victoria','Richardson',150000,2),
(86,'Frank','Norton',76000,3),
(87,'Jessica','Peters',50000,5),
(88,'Troy','Rodriguez',101000,5),
(89,'Patricia','Johnson',133000,1),
(90,'Derek','Anderson',78000,3),
(91,'Christina','King',113000,5),
(92,'Bradley','Howell',103000,2),
(93,'Andrew','Jones',101000,1),
(94,'Amy','Peterson',107000,1),
(95,'Matthew','Gray',135000,2),
(96,'Christopher','Fisher',136000,3),
(97,'Mrs.','Cynthia',92000,4),
(98,'George','Cherry',150000,3),
(99,'Travis','Caldwell',87000,5),
(100,'Nicholas','Carney',103000,3);


--Given a employees and departments table, select the top 3 departments with at least 15 employees and rank them according to the percentage of their employees making over 100K in salary.

-- solution 1
with 
    data as (
    select d.id,d.name, count(e.id) as over_100k
    from employees e
    join departments d on d.id = e.department_id
    where e.salary >= 100000
    group by d.name
),

    dept_strength as (
    select department_id id, count(*) strength from employees
    group by department_id
    having count(*)>15
    )

select
    round((d.over_100k/(ds.strength+0.0))*100,2) as percentage_over_100K,
    d.name as department_name,
    ds.strength as number_of_employees
from data d
join dept_strength ds on d.id = ds.id
order by 1 desc
limit 3;


--solution 2


select 
    round((sum(case when e.salary>100000 then 1 else 0 end)/(count(e.id)+0.0))*100,2) as percentage_over_100K,
    d.name as department_name,
    count(e.id) as number_of_employees
from employees e
join departments d on d.id = e.department_id
group by d.name
having count(2) > 15
order by 1 desc
limit 3;