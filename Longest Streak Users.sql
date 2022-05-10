/*

Given a table with event logs, find the top five users with the longest continuous streak of visiting the platform in 2020.

Note: A continuous streak counts if the user visits the platform at least once per day on consecutive days.

*/

create table events  (
	user_id VARCHAR(1),
	created_at DATE,
	url  VARCHAR(10)
);

insert into events values
    (4, '2020-05-10', 'bing.com'),
    (1, '2020-05-12', 'webs.com'),
    (1, '2020-05-01', 'sohu.com'),
    (1, '2020-05-03', 'bing.com'),
    (1, '2020-05-05', 'bing.com'),
    (1, '2020-05-06', 'bing.com'),
    (1, '2020-05-07', 'bing.com'),
    (1, '2020-05-08', 'bing.com'),
    (2, '2020-05-06', 'sohu.com'),
    (4, '2020-05-13', 'sohu.com'),
    (4, '2020-05-05', 'webs.com'),
    (2, '2020-05-06', 'webs.com'),
    (1, '2020-05-07', 'unesco.org'),
    (1, '2020-05-02', 'webs.com'),
    (3, '2020-05-12', 'webs.com'),
    (4, '2020-05-08', 'sohu.com'),
    (2, '2020-05-12', 'weebly.com'),
    (4, '2020-05-08', 'unesco.org'),
    (4, '2020-05-01', 'unesco.org'),
    (2, '2020-05-06', 'webs.com'),
    (4, '2020-05-10', 'webs.com'),
    (3, '2020-05-11', 'bing.com'),
    (2, '2020-05-07', 'sohu.com'),
    (4, '2020-05-06', 'weebly.com'),
    (1, '2020-05-13', 'bing.com'),
    (3, '2020-05-11', 'unesco.org'),
    (2, '2020-05-07', 'bing.com'),
    (1, '2020-05-01', 'bing.com'),
    (3, '2020-05-05', 'weebly.com'),
    (4, '2020-05-08', 'sohu.com'),
    (3, '2020-05-08', 'weebly.com'),
    (2, '2020-05-05', 'sohu.com'),
    (3, '2020-05-11', 'unesco.org'),
    (4, '2020-05-03', 'weebly.com'),
    (2, '2020-05-07', 'unesco.org'),
    (3, '2020-05-08', 'unesco.org'),
    (2, '2020-05-10', 'webs.com'),
    (3, '2020-05-07', 'weebly.com'),
    (1, '2020-05-06', 'unesco.org'),
    (1, '2020-05-03', 'webs.com'),
    (4, '2020-05-11', 'sohu.com'),
    (4, '2020-05-03', 'webs.com'),
    (1, '2020-05-08', 'webs.com'),
    (1, '2020-05-03', 'unesco.org'),
    (1, '2020-05-02', 'bing.com'),
    (3, '2020-05-06', 'weebly.com'),
    (2, '2020-05-11', 'unesco.org'),
    (3, '2020-05-06', 'webs.com'),
    (4, '2020-05-10', 'bing.com'),
    (1, '2020-05-07', 'weebly.com'),
    (4, '2020-05-05', 'weebly.com'),
    (2, '2020-05-11', 'weebly.com'),
    (4, '2020-05-13', 'sohu.com'),
    (2, '2020-05-14', 'webs.com'),
    (2, '2020-05-05', 'bing.com'),
    (3, '2020-05-04', 'bing.com'),
    (1, '2020-05-04', 'bing.com'),
    (2, '2020-05-08', 'sohu.com'),
    (2, '2020-05-10', 'sohu.com'),
    (3, '2020-05-14', 'sohu.com'),
    (3, '2020-05-07', 'bing.com'),
    (3, '2020-05-11', 'webs.com'),
    (2, '2020-05-06', 'bing.com'),
    (4, '2020-05-01', 'weebly.com'),
    (4, '2020-05-05', 'unesco.org'),
    (1, '2020-05-06', 'webs.com'),
    (3, '2020-05-12', 'webs.com'),
    (4, '2020-05-01', 'bing.com'),
    (1, '2020-05-13', 'unesco.org'),
    (2, '2020-05-13', 'sohu.com'),
    (1, '2020-05-08', 'sohu.com'),
    (1, '2020-05-14', 'weebly.com'),
    (1, '2020-05-03', 'sohu.com'),
    (4, '2020-05-03', 'webs.com'),
    (4, '2020-05-12', 'sohu.com'),
    (4, '2020-05-07', 'sohu.com'),
    (2, '2020-05-14', 'bing.com'),
    (3, '2020-05-14', 'webs.com'),
    (4, '2020-05-06', 'bing.com'),
    (3, '2020-05-03', 'webs.com'),
    (4, '2020-05-06', 'bing.com'),
    (2, '2020-05-12', 'webs.com'),
    (3, '2020-05-01', 'bing.com'),
    (2, '2020-05-01', 'webs.com'),
    (3, '2020-05-04', 'webs.com'),
    (2, '2020-05-05', 'sohu.com'),
    (3, '2020-05-12', 'webs.com'),
    (2, '2020-05-02', 'webs.com'),
    (2, '2020-05-07', 'unesco.org'),
    (1, '2020-05-13', 'unesco.org'),
    (4, '2020-05-08', 'webs.com'),
    (2, '2020-05-04', 'bing.com'),
    (2, '2020-05-06', 'unesco.org'),
    (1, '2020-05-09', 'bing.com'),
    (1, '2020-05-06', 'unesco.org'),
    (2, '2020-05-14', 'weebly.com'),
    (1, '2020-05-12', 'weebly.com'),
    (3, '2020-05-10', 'unesco.org'),
    (1, '2020-05-03', 'webs.com'),
    (2, '2020-05-05', 'bing.com'),
    (4, '2020-05-11', 'unesco.org'),
    (2, '2020-05-01', 'weebly.com'),
    (1, '2020-05-03', 'unesco.org'),
    (1, '2020-05-06', 'sohu.com'),
    (3, '2020-05-04', 'bing.com'),
    (2, '2020-05-03', 'webs.com'),
    (2, '2020-05-07', 'webs.com'),
    (2, '2020-05-08', 'webs.com'),
    (2, '2020-05-09', 'webs.com'),
    (2, '2020-05-11', 'webs.com'),
    (2, '2020-05-13', 'webs.com'),
    (5, '2020-05-09', 'webs.com'),
    (5, '2020-05-10', 'zoho.com'),
    (6, '2020-05-13', 'webs.com'),
    (6, '2020-05-14', 'zoho.com'),
    (7, '2020-05-01', 'weebly.com'),
    (7, '2020-05-06', 'unesco.org'),
    (8, '2020-05-14', 'weebly.com'),
    (10, '2020-05-12', 'weebly.com'),
    (11, '2020-05-10', 'unesco.org');


with ranking as (
    select user_id, created_at, rank() over(partition by user_id order by               created_at) rank
    from events
    group by user_id, created_at
),
diff as (
    select user_id, date([created_at], '-'||[rank]||' day') date_diff
    from ranking
),
user_visits as (
    select user_id, max(streaks) streak_length
    from (
        select user_id, count(date_diff) as streaks
        from diff
        group by user_id, date_diff
    ) x
    group by user_id
)

select user_id, streak_length
from (
    select user_id,streak_length, dense_rank() over(order by streak_length desc)        streak_rank
from user_visits
)
where streak_rank < 6
