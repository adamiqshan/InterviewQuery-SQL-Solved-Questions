-- Write a query to retrieve all user IDs in ascending order whose transactions        have exactly a 10-second gap from one another.

create table bank_transactions
(
    user_id 	INTEGER,
    created_at 	DATETIME,
    transaction_value 	FLOAT
);

insert into bank_transactions values
(1, '2017-01-01 10:10:15',10),
(2, '2017-01-01 11:11:11' ,20),
(3, '2017-01-01 12:12:12', 10),
(4, '2017-01-01 10:10:20', 30),
(5, '2017-01-01 10:10:34', 40),
(6, '2017-01-01 11:11:21', 50);


select user_id from
    (select user_id, 
        created_at, 
        lag(created_at) over(order by created_at),
            ROUND((JULIANDAY(created_at) - JULIANDAY(lag(created_at) over(order by created_at asc))) * 86400) AS difference1,
        abs(ROUND((JULIANDAY(created_at) - JULIANDAY(lag(created_at) over(order by created_at desc))) * 86400)) AS difference2
    from bank_transactions) x
where x.difference1 = 10 or x.difference2 = 10
