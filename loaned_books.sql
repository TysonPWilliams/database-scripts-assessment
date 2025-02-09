select
    b.book_id,
    b.title,
    a.first_name || ' ' || a.last_name as author_name,
    c.name as customer_name,
    c.phone as phone_number,
    l.borrow_date,
    l.due_date

from loans l
    join books b on l.book_id = b.book_id
    join book_authors ba on b.book_id = ba.book_id
    join authors a on ba.author_id = a.author_id
    join customers c on l.customer_id = c.customer_id
    order by l.due_date;
    
    
