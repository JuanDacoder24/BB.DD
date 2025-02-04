drop database if exists Taxis;
create database if not exists Taxis;
use Taxis;

create table Taxi(
matricula varchar(10) primary key,
marca varchar (30),
modelo varchar (30),
num_pasajeros int,
clientes_discapacitados enum ('SI', 'NO')
);

create table Conductor(
DNI_NIE varchar(10) primary key,
nombre varchar(40),
apellidos varchar(40),
direccion varchar (30),
matricula varchar(10),
constraint foreign key (matricula) references Taxi (matricula)
);

create table Carrera(
id_carrera int primary key,
origen varchar (30),
destino varchar (30),
precio decimal (5,2),
turno enum('SI','NO'),
DNI_NIE varchar(10),
matricula varchar(10),
constraint foreign key (DNI_NIE) references Conductor(DNI_NIE),
constraint foreign key (matricula) references Taxi (matricula)
);

insert into Taxi values ('1234 CHB','AUDI','A5','4','NO'),
('3243 HGF','AUDI','A4','4','NO'),
('2345 CKD','BMW','SERIE 3','4','SI'),
('2378 FHG','MERCEDES','CLASE A','4','SI'),
('7069 DLV','SEAT','IBIZA','4','NO'),
('0101 ABD','SEAT','LEON','4','NO'),
('1424 XYZ','AUDI','A5','4','SI'),
('6666 FJK','PEUGEOT','308','4','SI');

insert into Conductor values ('11111111H','JUAN','REJAS','CALLE ACEBEDOS 3','3243 HGF'),
('22222222J','MARIO','SERVELLON','AVENIDA LOS OLIVOS 2','2345 CKD'),
('33333333P','RODRIGO','ARGUMOSA','CALLE ACEBEDOS 2','2378 FHG'),
('44444444A','JAVIER','HERNANDEZ','AVENIDA LOS AIRES 3','7069 DLV'),
('55555555B','JOSE','FERNANDEZ','CALLE LOS ALIVOS 34','1234 CHB'),
('66666666C','LUIS','SORIA','AVENIDA LOS ENANOS 3','7069 DLV'),
('77777777D','DAVID','OTINIANO','CALLE JUAN 23','1234 CHB'),
('88888888E','JOEL','DIAZ','AVENIDA TOLEDO','3243 HGF'),
('99999999X','ELIAS','OTTONELO','PLAZA CENTRAL','2345 CKD');

insert into Carrera values('1','MALIAÑO','PEÑACASTILLO',7.50,'NO','11111111H','3243 HGF'),
('2','SANTANDER','MALIAÑO',10.20 ,'SI','22222222J','2345 CKD'),
('3','MALIAÑO','GENERAL DAVILA',14.52 ,'NO','22222222J','2345 CKD'),
('4','MALIAÑO','VALDECILLA',15.75 ,'NO','33333333P','2378 FHG'),
('5','PEÑACASTILLO','AYUNTAMIENTO',6.20 ,'SI','33333333P','2378 FHG'),
('6','SARDINERO','VALDECILLA',7.50 ,'SI','44444444A','7069 DLV'),
('7','SARDINERO','PEÑACASTILLO', 10.50,'NO','44444444A','7069 DLV'),
('8','VALDECILLA','MALIAÑO',16.20 ,'NO','44444444A','7069 DLV');

select Taxi.matricula, marca, modelo, DNI_NIE, nombre, apellidos from Taxi inner join Conductor where Taxi.matricula = Conductor.matricula;

select c.origen, c.destino, t.matricula, t.clientes_discapacitados from Carrera c inner join Taxi t where t.matricula = c.matricula;

select nombre, apellidos,DNI_NIE, marca, modelo, Taxi.matricula, num_pasajeros from Conductor inner join Taxi where Conductor.matricula = Taxi.matricula order by nombre;

select marca, modelo, num_pasajeros, clientes_discapacitados from Taxi left join Conductor on Taxi.matricula = Conductor.matricula UNION select DNI_NIE, nombre, apellidos, direccion from Taxi right join Conductor on Conductor.matricula = Taxi.matricula;

select t.matricula, t.marca, t.modelo, t.num_pasajeros, t.clientes_discapacitados from Taxi t left join Carrera c on t.matricula = c.matricula union select t.matricula, t.marca, t.modelo, t.num_pasajeros, t.clientes_discapacitados from Taxi t left join Carrera c on t.matricula = c.matricula;