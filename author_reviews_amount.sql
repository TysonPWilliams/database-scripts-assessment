\echo '\nAuthors and Reviews Information\n'
select
    count(r.author_id) as number_of_reviews,
    a.first_name || ' ' || a.last_name as author_name,
    min(rating) as lowest_rating,
    max(rating) as highest_rating
    

from reviews r
    join authors a on r.author_id = a.author_id
    group by a.first_name, a.last_name;