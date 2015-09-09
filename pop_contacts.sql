CREATE TABLE contacts (id serial not null primary key, firstname varchar(40) not null, lastname varchar(40) not null, email varchar(40) not null, address text);

insert into contacts (firstname, lastname, email, address) values('Bob','Bobson','bob@bob.bob', '123 bob street');
insert into contacts (firstname, lastname, email, address) values('Jim','Jimson','jim@jim.jim', '123 jim street');
insert into contacts (firstname, lastname, email, address) values('steve','steveson','steve@steve.steve', '123 steve street');
insert into contacts (firstname, lastname, email, address) values('Bob','jimson','bob@jim.bob', '123 jim street');
insert into contacts (firstname, lastname, email, address) values('jim','steveson','steve@jim.steve', '123 steve street');
insert into contacts (firstname, lastname, email, address) values('steve','Bobson','bob@steve.bob', '123 bob street');
insert into contacts (firstname, lastname, email, address) values('Bubba','lotsaphones','bubba@bubba.bubba', '123 bubba street');
