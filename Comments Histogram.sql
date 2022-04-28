/*

Write a SQL query to create a histogram of the number of comments per user in the month of January 2020.

Note: Assume bin buckets class intervals of one.

Note: Comments by users that were not created in January 2020 should be counted in a “0” bucket

*/

create table users(
    id 	INTEGER,
    name 	VARCHAR,
    created_at 	DATE 
);

create table comments(
    user_id 	INTEGER,
    body 	VARCHAR,
    created_at 	DATE
);

insert into users values
    (1, 'ramesh', '2020-01-01'),
    (2, 'suresh', '2020-01-02'),
    (3, 'ganesh', '2020-02-02'),
    (4, 'vignesh', '2020-01-03'),
    (5, 'jignest', '2020-01-05'),
    (6, 'mugesh', '2020-01-05');

insert into comments values
    (1, 'first tweet here','2020-01-01'),
    (1, 'secpnd tweet here','2020-01-02'),
    (1, 'first tweet of the month','2020-02-01'),
    (2, 'first tweet here','2020-01-04'),
    (2, 'first here','2020-01-06'),
    (2, 'tweet here','2020-01-09'),
    (2, 'im here','2020-01-01'),
    (4, 'hi there','2020-01-01'),
    (4, 'hello','2020-01-10'),
    (4, 'first time here','2020-01-01'),
    (4, 'ohana hawaii','2020-01-01'),
    (4, 'ohana','2020-01-01');


-- subquery solution
select x.comments_count as comment_count, count(x.comments_count) as frequency from 
    (select u.id as id, count(c.created_at) as comments_count
        from users u
        left join comments c on c.user_id=u.id and c.created_at between 
        '2020-01-01' and '2020-01-31'
        group by u.id
    ) x
group by x.comments_count


--cte solution
with cmt as 
(  
    select u.id, sum(case when c.body is null then 0 else 1 end) comment_count 
    from users u 
    left join comments c 
    on c.user_id = u.id
    and c.created_at between '2020-01-01' and '2020-01-31'
    group by u.id
)

select comment_count,count(id) frequency from cmt group by 1

--when where is used after left join it removes records with no match
-- using and will keep the record and group by returns 0