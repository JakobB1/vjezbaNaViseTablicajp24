drop database if exists kolokvijvjezba15;
create database kolokvijvjezba15;
use kolokvijvjezba15;

create table punac_zarucnik(
  sifra int not null primary key auto_increment,
  punac int not null,
  zarucnik int not null
);

create table zarucnik(
  sifra int not null primary key auto_increment,
  novcica decimal(13,9) not null,
  bojakose varchar(41) not null,
  kuna decimal(16,8) not null,
  prstena int not null,
  kratkamajica varchar(44) not null,
  nausnica int not null
);

create table punac(
  sifra int not null primary key auto_increment,
  kratkamajica varchar(45),
  bojakose varchar(41),
  novcica decimal(16,8),
  treciputa datetime not null
);

create table brat(
  sifra int not null primary key auto_increment,
  vesta varchar(44) not null,
  dukserica varchar(34),
  prstena int,
  majica varchar(36) not null,
  punac int not null
);

create table mladic(
  sifra int not null primary key auto_increment,
  haljina varchar(30),
  lipa decimal(12,8),
  kratkamajica varchar(33),
  kuna decimal(12,10),
  treciputa datetime not null,
  brat int not null
);

create table svekrva(
  sifra int not null primary key auto_increment,
  jmbag char(11),
  ogrlica int,
  bojakose varchar(40) not null,
  drugiputa datetime not null,
  mladic int not null
);

create table zena(
  sifra int not null primary key auto_increment,
  gustoca decimal(12,8),
  lipa decimal(16,6),
  ogrlica int,
  carape varchar(32),
  nausnica int not null,
  modelnaocala varchar(46) not null,
  prijatelj int
);

create table prijatelj(
  sifra int not null primary key auto_increment,
  treciputa datetime,
  majica varchar(49),
  asocijalno bit not null,
  hlace varchar(42)
);
