insert into customers (name, email, phone) values
    ('John Doe', 'johndoe@hotmail.com', '0481937640'),
    ('Jane Doe', 'jane.doe87@gmail.com', '0411419920'),
    ('John F. Kennedy', 'johnny.kennedy@yahoo.com.au', '0498037963');

insert into loans (customer_id, book_id, borrow_date, due_date) values
    (7, 17, '9/02/25', '9/03/25'),
    (5, 6, '9/02/25', '9/03/25'),
    (6, 10, '9/02/25', '9/03/25');

update books set stock_available = stock_available - 1
    where book_id in (17, 6, 10);