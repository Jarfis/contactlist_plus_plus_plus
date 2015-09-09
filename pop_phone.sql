create table phones (id serial not null primary key, contact_id integer references contacts(id), phone_num text, phone_type text);

insert into phones (contact_id, phone_num, phone_type) values(2,'123-456-7890','home');
insert into phones (contact_id, phone_num, phone_type) values(2,'098-765-4321','cell');
insert into phones (contact_id, phone_num, phone_type) values(3,'019-283-7465','home');
insert into phones (contact_id, phone_num, phone_type) values(7,'123-456-7890','home');
insert into phones (contact_id, phone_num, phone_type) values(7,'234-567-8901','home');
insert into phones (contact_id, phone_num, phone_type) values(7,'345-678-9012','home');
insert into phones (contact_id, phone_num, phone_type) values(7,'456-789-0123','cell');
insert into phones (contact_id, phone_num, phone_type) values(7,'567-890-1234','cell');
insert into phones (contact_id, phone_num, phone_type) values(7,'678-901-2345','cell');
