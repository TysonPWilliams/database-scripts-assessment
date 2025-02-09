select
    g.name as genre,
    count(r.book_id) as number_of_reviews,
    round(avg(r.rating), 1) as average_rating

from books b
    join book_genres bg on b.book_id = bg.book_id
    join genres g on bg.genre_id = g.genre_id
    left join reviews r on b.book_id = r.book_id
    group by g.name
    order by average_rating desc nulls last;