/*

You’re given a table that represents search results from searches on Facebook. The query column is the search term, position column represents each position the search result came in, and the rating column represents the human rating of the result from 1 to 5 where 5 is high relevance and 1 is low relevance.

Write a query to get the percentage of search queries where all of the ratings for the query results are less than a rating of 3. Please round your answer to two decimal points.

*/

create table search_results
(
    query 	varchar,
    result_id 	INTEGER,
    position 	INTEGER,
    rating 	INTEGER
);

insert into search_results values
    ("hey", 1, 5, 3),
    ("hello", 2, 4, 5),
    ("wish", 3, 5, 1),
    ("dude", 4, 2, 3),
    ("wish", 5, 5, 2),
    ("hello", 6, 2, 5),
    ("wish", 7, 3, 3),
    ("dude", 8, 2, 2),
    ("meine schatz", 1, 5, 4),
    ("hey", 9, 6, 2),
    ("yellove", 10, 2, 2),
    ("hola amigo", 11, 4, 6),
    ("aloha", 12, 4, 5),
    ("hello", 13, 8, 4),
    ("wish", 14, 5, 1),
    ("yellove", 15, 1, 2),
    ("heey", 16, 9, 4),
    ("hey", 17, 5, 4);


with max_ratings as (
    select query, max(rating) as max_rating
    from search_results
    group by query
)

select 
    round(sum(case when max_rating <3 then 1 else 0 end) / (count(query)+0.0),2) as percentage_less_than_3 
from max_ratings


/*

-- percent of total queries with rating less than 3
select round(sum(case when sr.rating <=3 then 1 else 0 end)/(count(query)+0.0),2) as percentage_less_than_3
from search_results sr

*/