drop database if exists Taxis;
create database if not exists Taxis;
use Taxis;

create table Conductor(
DNI_NIE varchar(10) primary key,
nombre varchar(40),
apellidos varchar(40),
direccion varchar (30)
);

create table Taxi(
matricula varchar(10),
marca varchar (30),
modelo varchar (30),
num_pasajeros int,
clientes_discapacitados enum ('SI', 'NO'),
DNI_NIE varchar(10),
constraint foreign key (DNI_NIE) references Conductor (DNI_NIE)
);

create table Carrera(
id_carrera int primary key,
origen varchar (30),
destino varchar (30),
precio decimal (5,2),
turno enum ('Dia', 'Tarde', 'Noche'),
DNI_NIE varchar(10),
matricula varchar(10),
constraint foreign key (DNI_NIE) references Conductor (DNI_NIE),
constraint foreign key (matricula) references Taxi (matricula)
);