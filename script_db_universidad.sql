create database db_universidad;
use db_universidad;
drop database db_universidad;

create table departamento (
id_departamento int (10) primary key not null,
nombre varchar(50) not null
);

create table grado (
 id_grado int (10) primary key not null,
 nombre varchar (100) not null
 );

create table alumno(
 id_alumno int(10) primary key not null,
 nif varchar (9) not null,
 nombre varchar (25) not null,
 apellido1 varchar (50) not null,
 apellido2 varchar (50) not null,
 ciudad varchar (25) not null,
 direccion varchar (50) not null,
 telefono varchar (9) not null,
 fecha_nacimiento date not null,
 sexo enum ('h', 'm') not null
 );
 
 create table curso_escolar(
 id_curso_escolar int (10) primary key not null,
 año_inicio year (4) not null,
 año_fin year (4) not null
 );
 
 
create table profesor(
id_profesor int (10)primary key not null,
nif varchar(9) not null,
nombre varchar(25) not null,
apellido1 varchar (50) not null,
apellido2 varchar (50) not null,
ciudad varchar (25) not null,
direccion varchar(25)not null,
telefono varchar (9)not null,
fecha_nacimiento date not null,
sexo enum ('h', 'm') not null,
id_departamento int (10)not null,
foreign key (id_departamento) references departamento (id_departamento)
);



create table asignatura (
id_asignatura int (10) primary key not null,
nombre varchar(100) not null,
creditos float not null,
tipo enum ('basica', 'obligatoria', 'optativa') not null,
curso tinyint (3),
cuatrimestre tinyint (3),
id_profesor int (10),
id_grado int(10),
foreign key (id_profesor)references profesor(id_profesor),
foreign key (id_grado)references grado (id_grado)
);

 create table alumno_se_matricula_asignatura(
 id_alumno int(10)  not null,
 id_asignatura int (10) not null,
 id_curso_escolar int (10) not null,
 foreign key (id_alumno) references alumno(id_alumno),
 foreign key (id_asignatura) references asignatura (id_asignatura),
 foreign key (id_curso_escolar) references curso_escolar (id_curso_escolar)
 );
 
 
 insert into departamento (id_departamento, nombre) values 
 (001, 'Quindio'),
 (002, 'Valle'),
 (003, 'Boyaca'),
 (004, 'Cundinamarca'),
 (005, 'Magdalena');
 
 insert into profesor (id_profesor, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, id_departamento) values 
 (01, 1110273456, 'Sofia', 'Ortiz', 'Barreto', 'Armenia', 'calle 20', 3002842947, '2005/12/16', 'm', 001),
 (02, 1090234455, 'Luis Carlos', 'Muñoz', 'Escarraga', 'Cali', 'carrera 9', 3112842947, '2005/12/28', 'h', 002),
 (03, 1010234416, 'Dayana', 'Rojas', 'Becerra', 'Tunja', 'carrera 56', 3112842944, '2005/11/06', 'm', 003),
 (04, 1314254416, 'Maria', 'Barreto', 'Lievano', 'Chia', 'calle 6', 312842944, '2000/05/09', 'm', 004),
 (05, 1114254234, 'Willington', 'Ortiz', 'Galviz', 'Santa Marta', 'carrera 6-78', 316842945, '1980/10/27', 'h', 005);
 
 insert into grado (id_grado, nombre) values
(12345, 'Ingenieria Informatica'), 
(6789, 'Ingenieria Civil'), 
(6786, 'Licenciatura en psicologia'), 
(101112, 'Licenciatura en ciencias'), 
(13145, 'Aux. Enfermeria');

insert into alumno (id_alumno, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo) values 
(2345, 190234565, 'Dante', 'Jaramillo', 'Arboleda', 'Calarca', 3156789090, '2000/01/02', 'h'), 
(6789, 100234534, 'Dilan', 'Jaramillo', 'Ortiz', 'Fusa', 3156789045, '2004/03/03', 'h'), 
(1011, 111234534, 'Sara', 'Perez', 'Zuluaga', 'Cali', 3166889045, '2006/04/30', 'm'), 
(1213, 189253534, 'Angie', 'Meneses', 'Escarraga', 'Duitama', 3126889445, '2003/06/21', 'm'), 
(1415, 119453532, 'Leidy', 'Lievano', 'Escarraga', 'Cajamarca', 3136849447, '2008/10/30', 'm');

insert into curso_escolar (id_curso_escolar, año_inicio, año_fin) values 
(1001, 2023, 2028), 
(1002, 2022, 2027), 
(1003, 2021, 2026), 
(1004, 2020, 2025), 
(1005, 2019, 2024);

insert into asignatura (id_asignatura, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) values 
('A123', 'Introduccion a la programacion', 4, 'Obligatoria', '1er año', 'Primer cuatrimestre'),
('B123', 'Marketing fundamnetales', 6, 'Electiva', '2do año', 'Segundo cuatrimestre'),
('C123', 'Psicologia del desarrollo', 5,'Obligatoria', '3er año', 'Segundo cuatrimestre'),
('D123', 'Ecuaciones diferenciales', 2,'Obligatoria', '1er año', 'Primer cuatrimestre'),
('E123', 'Quimica organica', 3,'Electiva', '5to año', 'Segundo cuatrimestre');
 
insert into alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) values 
(2345,'A123',1001),
(6789,'B123',1002),
(1011,'C123',1003),
(1213,'D123',1004),
(1415,'E123',1005);
 
 
 
 