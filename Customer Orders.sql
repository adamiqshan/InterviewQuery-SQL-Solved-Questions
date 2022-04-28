--Write a query to identify customers who placed more than three transactions each in both 2019 and 2020.

create table users(
    id 	INTEGER,
    name 	VARCHAR
);

create table transactions(
    user_id 	INTEGER,
    created_at 	DATETIME,
    product_id 	INTEGER,
    quantity 	INTEGER
);


insert into users values
    (1, 'ramesh'),
    (2, 'suresh'),
    (3, 'ganesh'),
    (4, 'vignesh'),
    (5, 'jignest'),
    (6, 'mugesh');

insert into transactions values
    (1, '2020-01-01', 125, 10),
    (1, '2020-01-01', 129, 10),
    (1, '2020-01-02', 119, 5),
    (2, '2020-01-02', 119, 7),
    (2, '2020-01-02', 119, 7),
    (2, '2020-01-03', 119, 7),
    (3, '2020-01-02', 158, 12),
    (3, '2020-01-03', 158, 12),
    (3, '2020-01-13', 158, 12),
    (4, '2020-01-03', 157, 14),
     (4, '2020-01-03', 221, 44),
    (4, '2020-01-04', 221, 2),
    (5, '2020-01-04', 145, 4),
    (5, '2020-01-05', 175, 10),
    (1, '2019-01-01', 15, 10),
    (1, '2019-01-01', 12, 1),
    (1, '2019-01-02', 19, 5),
    (2, '2019-01-02', 1119, 70),
    (2, '2019-01-02', 112, 7),
    (2, '2019-01-05', 12, 57);


with trans_2019 as
(
    select t.user_id, count(1) as trans2019
    from transactions t
    where strftime('%Y', t.created_at) = '2019'
    group by t.user_id
),
trans_2020 as
(
    select t.user_id, count(1) as trans2020
    from transactions t
    where strftime('%Y', t.created_at) = '2020'
    group by t.user_id
)

select name as customer_name from users
where users.id in (select t_2019.user_id
                    from trans_2019 t_2019
                    join trans_2020 t_2020 on t_2019.user_id = t_2020.user_id
                    where t_2019.trans2019 >= 3 and t_2020.trans2020 >= 3)


/*    
WITH transactionCount AS
(
    SELECT user_id,
    SUM(CASE WHEN strftime('%Y', created_at) = '2019' THEN 1 ELSE 0 END) count2019,
    SUM(CASE WHEN strftime('%Y', created_at) = '2020' THEN 1 ELSE 0 END) count2020
    FROM transactions
    GROUP BY 1
)
SELECT name customer_name
FROM users
JOIN transactionCount tc ON users.id = tc.user_id
WHERE count2019 >= 3 AND count2020 >= 3
*/