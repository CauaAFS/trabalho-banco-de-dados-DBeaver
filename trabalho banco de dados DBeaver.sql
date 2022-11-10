create table user (
id_user INT  auto_increment primary key,
nome VARCHAR(30) not null,
nascimento DATE,
sexo ENUM('M','F'),
peso DECIMAL(5,2),
altura DECIMAL(3,2)
)default charset = utf8;


create table Post (
id_post INT auto_increment primary key,
title VARCHAR(30),
description TEXT,
id_user INT,
FOREIGN KEY(id_user) references user (id_user)
);

create table roles (
	id_role int auto_increment,
	primary key(id_role),
	usuario varchar(16) not null
);

create table user_roles (
	id_user int,
	id_roles int,
	foreign key(id_user) references user(id_user),
	foreign key(id_roles) references roles(id_role)
);



insert into user
(nome, nascimento, sexo, peso, altura)
values
('Julia', '2001-04-20', 'F', '70.5', '1.70' ),
('Maria', '2004-10-29', 'F', '80.4', '1.80'),
('Cauã', '2003-05-15', 'M', '85.0', '1.79' ),
('Kelly', '2002-02-07', 'F', '83.2', '1.77'),
('Pedro', '1999-08-10', 'M', '81.2', '1.81');


insert into Post
(title, description, id_user)
values
('eu sou', 'Uma pessoa bem alegre e tenho 14 ano', 1),
('gosto de fazer', 'jogar futebol', 1),
('minha vida', 'é muito alegre  e tenho 17 ano', 2),
('gosto de fazer', 'jogar videogame', 2),
('eu sou', 'bem humorado  e tenho 20 ano', 3),
('gosto de fazer', 'jogar volei', 3),
('eu sou', 'Uma pessoa bem divertida  e tenho 21 ano', 4),
('gosto de fazer', 'jogar basquete', 4),
('eu sou', 'Uma pessoa bem de vida  e tenho 18 ano', 5),
('gosto de fazer', 'andar de bike', 5);


insert into roles 
(usuario)
values
("Admin"),
("Employee"),
("Cient");

insert into user_roles 
(id_user, id_roles)
values
(1, 1), 
(2, 1),
(3, 1),
(4, 2),
(5, 3),
(5, 2),
(3, 3);



select user.id_user, user.nome, roles.usuario from user_roles
join user on user.id_user = user_roles.id_user
join roles on roles.id_role =  user_roles.id_roles
where roles.usuario = 'admin';

select * from post where id_user in (3,5);


