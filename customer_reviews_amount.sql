select 
    count(r.customer_id) as no_of_reviews,
    c.name as customer_name,
    min(r.rating) as lowest_rating_given,
    max(r.rating) as highest_rating_given,
    round(avg(r.rating), 1) as average_rating_given

from reviews r
    join customers c on r.customer_id = c.customer_id
    join authors a on r.author_id = a.author_id
    group by c.name;