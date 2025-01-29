select
    r.id,
    b.title as book_name,
    c.name as customer_name,
    r.rating,
    r.comment,
    r.date,
    a.first_name || ' ' || a.last_name as author_name

from reviews r 
    join books b on r.book_id = b.book_id
    join customers c on r.customer_id = c.customer_id
    join authors a on r.author_id = a.author_id;


