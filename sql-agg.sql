CREATE schema netologyJoin;

create table CUSTOMERS
(
    id int not null primary key auto_increment,
    name varchar(255),
    surname varchar(255),
    age int,
    phone_number varchar(255)
);



create table ORDERS
(
    id int not null primary key auto_increment,
    date timestamp not null default now(),
    customer_id int,
    product_name varchar(255),
    amount int,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS (id)
);

insert into CUSTOMERS (name, surname, age, phone_number)
    VALUE ('Вася', 'Пупкин', 23, 8134215),
    ('alexey', 'ivanov', 43, 8240925),
    ('Alexey', 'Smirnov', 26, 2358792),
    ('Анатолий', 'Дукалис', 66, 7453284),
    ('Антон', 'Сидоров', 32, 6657835),
    ('Константин', 'Повелитель тьмы', 47, 9654826),
    ('Oleg', 'Joh', 22, 4218945);



insert into ORDERS (customer_id, product_name, amount)
    VALUE (2, 'Перчатки', 1999),
    (1, 'Куртка', 15999),
    (3, 'Штаны', 4599),
    (7, 'Шапка', 2599),
    (6, 'Носки', 599),
    (4, 'Футболка', 2200),
    (5, 'Спортивный костюм', 8599);



SELECT  c.name, o.product_name
from CUSTOMERS c
join ORDERS O on c.id = O.customer_id
where c.name = 'Alexey' or 'alexey'
;