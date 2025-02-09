select
    b.book_id,
    b.title,
    a.first_name || ' ' || a.last_name as author_name,
    g.name as genre,
    b.stock_available,
    round(avg(r.rating), 1) as average_rating

from books b
    join book_authors ba on b.book_id = ba.book_id
    join authors a on ba.author_id = a.author_id
    join book_genres bg on b.book_id = bg.book_id 
    join genres g on bg.genre_id = g.genre_id
    left join reviews r on b.book_id = r.book_id
where b.stock_available > 0

group by
    b.book_id,
    b.title,
    a.first_name,
    a.last_name,
    g.name,
    b.stock_available

order by b.book_id;
