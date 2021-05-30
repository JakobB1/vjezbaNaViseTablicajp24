drop database if exists kolokvijvjezba19;
create database kolokvijvjezba19;
use kolokvijvjezba19;

create table punac(
  sifra int not null primary key auto_increment,
  maraka decimal(12,7),
  treciputa datetime,
  ekstroventno bit,
  hlace varchar(32),
  punica int not null
);

create table punica(
  sifra int not null primary key auto_increment,
  stilfrizura varchar(39) not null,
  maraka decimal(15,6) not null,
  jmbag char(11) not null
);

create table ostavljena(
  sifra int not null primary key auto_increment,
  hlace varchar(41),
  ekstroventno bit not null,
  narukvica int,
  eura decimal(17,6) not null,
  kratkamajica varchar(46)
);

create table punica_ostavljena(
  sifra int not null primary key auto_increment,
  punica int not null,
  ostavljena int not null
);

create table muskarac(
  sifra int not null primary key auto_increment,
  drugiputa datetime not null,
  gustoca decimal(16,7),
  maraka decimal(15,9),
  ogrlica int not null,
  svekrva int 
);

create table svekrva(
  sifra int not null primary key auto_increment,
  ekstroventno bit,
  carape varchar(42),
  gustoca decimal(13,10),
  stilfrizura varchar(34) not null,
  punac int not null
);

create table decko(
  sifra int not null primary key auto_increment,
  modelnaocala varchar(42) not null,
  gustoca decimal(16,10) not null,
  dukserica varchar(47) not null,
  stilfrizura varchar(40),
  novcica decimal(14,7) not null
);

create table svekar(
  sifra int not null primary key auto_increment,
  nausnica int not null,
  indiferentno bit not null,
  suknja varchar(37) not null,
  drugiputa datetime,
  kuna decimal(13,6) not null,
  decko int 
);

alter table punica_ostavljena add foreign key (punica) references punica(sifra);
alter table punica_ostavljena add foreign key (ostavljena) references ostavljena(sifra);

alter table muskarac add foreign key (svekrva) references svekrva(sifra);
alter table svekrva add foreign key (punac) references punac(sifra);
alter table punac add foreign key (punica) references punica(sifra);
alter table svekar add foreign key (decko) references decko(sifra);