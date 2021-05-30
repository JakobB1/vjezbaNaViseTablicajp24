drop database if exists kolokvijvjezba17;
create database kolokvijvjezba17;
use kolokvijvjezba17;

create table brat_becar(
  sifra int not null primary key auto_increment,
  brat int not null,
  becar int not null
);

create table becar(
  sifra int not null primary key auto_increment,
  narukvica int,
  asocijalno bit not null,
  vesta varchar(48),
  kuna decimal(13,10),
  kratkamajica varchar(30) not null
);

create table brat(
  sifra int not null primary key auto_increment,
  asocijalno bit not null,
  dukserica varchar(36),
  novcica decimal(15,6) not null,
  introvertno bit not null
);

create table ostavljen(
  sifra int not null primary key auto_increment,
  bojaociju varchar(45),
  bojakose varchar(33),
  novcica decimal(16,7) not null,
  brat int not null
);

create table cura(
  sifra int not null primary key auto_increment,
  ogrlica int,
  kuna decimal(16,8),
  indiferentno bit,
  jmbag char(11),
  maraka decimal(12,7) not null,
  ostavljen int not null
);

create table prijateljica(
  sifra int not null primary key auto_increment,
  lipa decimal(12,9),
  haljina varchar(37),
  maraka decimal(13,8) not null,
  modelnaocala varchar(41) not null,
  cura int
);

create table punica(
  sifra int not null primary key auto_increment,
  indiferentno bit,
  narukvica int,
  gustoca decimal(18,10) not null,
  prijatelj int
);

create table prijatelj(
  sifra int not null primary key auto_increment,
  maraka decimal(13,6),
  narukvica int,
  nausnica int,
  lipa decimal(15,10),
  carape varchar(33) not null,
  stilfrizura varchar(35)
);