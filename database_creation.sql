drop table authors cascade;
drop table books cascade;
drop table loans cascade;
drop table customers cascade;
drop table reviews cascade;
drop table postcodes cascade;
drop table addresses cascade;
drop table book_authors cascade;
drop table genres cascade;
drop table book_genres cascade;
drop database tysons_library;
create database tysons_library;

\c tysons_library

create table authors (
    author_id serial primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    country varchar(50),
    bio text
);

create table books (
    book_id serial primary key,
    title varchar(100) not null,
    stock_available integer default 1
);

create table customers (
    customer_id serial primary key,
    name varchar(100) not null,
    email varchar(100) unique not null check(email like '%@%'),
    phone varchar(12)
);

create table postcodes (
    postcode int primary key,
    state VARCHAR(20) not null
);

create table genres (
    genre_id serial primary key,
    name varchar(50) unique not null
);

create table book_authors (
    book_id integer not null,
    author_id integer not null,
    primary key (book_id, author_id),
    foreign key (book_id) references books(book_id) on delete cascade,
    foreign key (author_id) references authors(author_id) on delete cascade
);

create table reviews (
    id serial primary key,
    book_id integer not null,
    customer_id integer not null,
    rating integer not null check (rating between 1 and 5),
    comment text,
    date varchar(50) not null,
    author_id integer not null,
    foreign key (book_id) references books(book_id),
    foreign key (customer_id) references customers(customer_id),
    foreign key (author_id) references authors(author_id)
);

create table loans (
    id serial primary key,
    customer_id integer not null,
    book_id integer not null,
    borrow_date varchar(50) not null,
    due_date varchar(50) not null,
    foreign key (customer_id) references customers(customer_id),
    foreign key (book_id) references books(book_id)
);

create table addresses (
    id serial primary key,
    street_number integer,
    street_name varchar(100),
    suburb varchar(50) not null,
    postcode integer not null,
    customer_id integer not null,
    foreign key (postcode) references postcodes(postcode),
    foreign key (customer_id) references customers(customer_id)
);

create table book_genres (
    book_id integer not null,
    genre_id integer not null,
    primary key (book_id, genre_id),
    foreign key (book_id) references books(book_id) on delete cascade,
    foreign key (genre_id) references genres(genre_id) on delete cascade
);

insert into authors (first_name, last_name, country, bio) values 
    ('J.K', 'Rowling', 'Britain', 'Famous for her seven-volume fantasy series Harry Potter'),
    ('William', 'Shakespeare', 'Britain', ''),
    ('Danielle', 'Steel', 'USA', ''),
    ('Tom', 'Clancy', 'USA', 'Enjoys writing a good war book'),
    ('Dr.', 'Seuss', 'USA', 'His work includes many of the most popular childrens books of all time'),
    ('Stephen', 'King', 'USA', 'Widely known for his horror novels. Has been crowned the "King of Horror"')
;

INSERT INTO genres (name) VALUES
    ('Fantasy'),
    ('Comedy'),
    ('Tragedy'),
    ('Romance'),
    ('War'),
    ('Childrens'),
    ('Horror');


insert into books (title) values 
    ('Harry Potter & The Philosophers Stone'),
    ('Harry Potter & The Chamber of Secrets'),
    ('Harry Potter & The Prisoner of Azkaban'),
    ('Harry Potter & The Goblet of Fire'),
    ('Harry Potter & The Order of the Phoenix'),
    ('Harry Potter & The Half-Blood Prince'),
    ('Harry Potter & The Deathly Hallows'),
    ('A Midsummer Nights Dream'),
    ('The Taming of the Shrew'),
    ('Romeo and Juliet'),
    ('Macbeth'),
    ('The Gift'),
    ('Sisters'),
    ('Message from Nam'),
    ('Heartbeat'),
    ('Rainbow Six'),
    ('The Hunt for Red October'),
    ('Without Remorse'),
    ('How the Grinch Stole Christmas!'),
    ('The Cat in the Hat'),
    ('The Lorax'),
    ('Green Eggs and Ham'),
    ('It'),
    ('The Shining'),
    ('Pet Sematary'),
    ('Carrie')
;

insert into book_genres (book_id, genre_id) values
    (1,1),
    (2,1),
    (3,1),
    (4,1),
    (5,1),
    (6,1),
    (7,1),
    (8,2),
    (9,2),
    (10,3),
    (11,3),
    (12,4),
    (13,4),
    (14,4),
    (15,4),
    (16,5),
    (17,5),
    (18,5),
    (19,6),
    (20,6),
    (21,6),
    (22,6),
    (23,7),
    (24,7),
    (25,7),
    (26,7);

insert into customers (name, email, phone) values
    ('Tyson Williams', 'tyson@tyson.com.au', '0400294739'),
    ('Matt Etherington', 'mattyboy@gmail.com', '0422987308'),
    ('Brad Pit', 'bradlovesbooks@hotmail.com', '0493750093'),
    ('Andy Murray', 'amurray20@gmail.com', '0483920755')
;

insert into loans (customer_id, book_id, borrow_date, due_date) values
    (1, 25, '28/01/25', '28/02/25'),
    (3, 9, '25/01/25', '25/02/25'),
    (2, 19, '22/01/25', '25/02/25'),
    (4, 8, '15/01/25', '15/01/25')
;

update books set stock_availability = 0 where book_id in (25, 9, 19, 8);

insert into book_authors (book_id, author_id) values
    (1, 1),  -- J.K. Rowling wrote Harry Potter 1
    (2, 1),  -- J.K. Rowling wrote Harry Potter 2
    (8, 2),  -- Shakespeare wrote A Midsummer Night’s Dream
    (9, 2),  -- Shakespeare wrote The Taming of the Shrew
    (16, 4), -- Tom Clancy wrote Rainbow Six
    (17, 4); -- Tom Clancy wrote The Hunt for Red October

insert into postcodes (postcode, state) values
    (2541, 'NSW'),
    (2713, 'NSW'),
    (2540, 'NSW'),
    (4875, 'QLD');

insert into addresses (street_number, street_name, suburb, postcode, customer_id) values
    (20, 'Cleveland Drive', 'Nowra', 2541, 1),
    (179, 'Carter Street', 'Finley', 2713, 2),
    (144, 'Island Point Road', 'St Georges Basin', 2540, 3),
    (9, 'Muzza Lane', 'Murray Island', 4875, 4);

insert into reviews (book_id, customer_id, rating, comment, date, author_id) values 
    (1, 1, 5, 'A truly magical and captivating story.', '5/07/2024', 1), 
    (2, 2, 4, 'Enjoyed the suspense and mystery.', '20/06/2024', 1), 
    (8, 3, 3, 'A whimsical and entertaining play.', '15/08/2024', 2), 
    (16, 4, 5, 'A gripping and action-packed thriller.', '10/05/2024', 4), 
    (20, 1, 4, 'A delightful and imaginative story for children.', '2/09/2024', 5),
    (25, 3, 5, 'A thrilling and terrifying journey from beyond the grave.', '19/04/2024', 6);