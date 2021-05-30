drop database if exists kolokvijvjezba18;
create database kolokvijvjezba18;
use kolokvijvjezba18;

create table sestra(
  sifra int not null primary key auto_increment,
  eura decimal(14,10),
  indiferentno bit,
  maraka decimal(13,8),
  ogrlica int,
  haljina varchar(31) not null,
  introvertno int 
);

create table zarucnica(
  sifra int not null primary key auto_increment,
  carape varchar(43),
  treciputa datetime not null,
  eura decimal(16,8),
  sestra int
);

create table muskarac(
  sifra int not null primary key auto_increment,
  treciputa datetime,
  nausnica int not null,
  drugiputa datetime not null,
  prstena int not null,
  modelnaocala varchar(34)
);

create table mladic(
  sifra int not null primary key auto_increment,
  carape varchar(50) not null,
  jmbag char(11),
  hlace varchar(50) not null,
  treciputa datetime,
  drugiputa datetime not null,
  muskarac int
);

create table prijatelj(
  sifra int not null primary key auto_increment,
  novcica decimal(15,9),
  ekstroventno bit not null,
  bojakose varchar(30) not null,
  haljina varchar(37),
  narukvica int
);

create table muskarac_prijatelj(
  sifra int not null primary key auto_increment,
  muskarac int not null,
  prijatelj int not null
);

create table djevojka(
  sifra int not null primary key auto_increment,
  bojaociju varchar(43) not null,
  treciputa datetime not null,
  carape varchar(32) not null
);

create table ostavljena(
  sifra int not null primary key auto_increment,
  novcica decimal(18,9),
  drugiputa datetime not null,
  dukserica varchar(35),
  kratkamajica varchar(34),
  djevojka int not null
);