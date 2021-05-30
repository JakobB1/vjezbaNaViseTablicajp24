drop database if exists kolokvijvjezba21;
create database kolokvijvjezba21;
use kolokvijvjezba21;

create table djevojka(
  sifra int not null primary key auto_increment,
  bojakose varchar(31),
  maraka decimal(18,7),
  indiferentno bit not null,
  kratkamajica varchar(30),
  ogrlica int not null,
  mladic int not null
);

create table mladic(
  sifra int not null primary key auto_increment,
  modelnaocala varchar(40) not null,
  treciputa datetime not null,
  asocijalno bit not null,
  majica varchar(34) not null
);

create table cura(
  sifra int not null primary key auto_increment,
  modelnaocala varchar(45),
  bojakose varchar(35),
  nausnica int not null,
  ogrlica int,
  dukserica varchar(43) not null,
  stilfrizura varchar(39) not null,
  zena int not null
);

create table ostavljen(
  sifra int not null primary key auto_increment,
  bojakose varchar(50),
  ekstroventno bit not null,
  kratkamajica varchar(34) not null,
  kuna decimal(13,5) not null,
  maraka decimal(18,9),
  vesta varchar(38),
  cura int 
);

create table svekrva(
  sifra int not null primary key auto_increment,
  treciputa datetime,
  jmbag char(11),
  gustoca decimal(18,9) not null,
  ostavljen int not null
);

create table zena(
  sifra int not null primary key auto_increment,
  kuna decimal(12,7) not null,
  drugiputa datetime,
  asocijalno bit not null,
  jmbag char(11),
  prviputa datetime,
  maraka decimal(17,5)
);

create table brat(
  sifra int not null primary key auto_increment,
  gustoca decimal(14,10),
  prviputa datetime not null,
  hlace varchar(31) not null,
  stilfrizura varchar(38),
  novcica decimal(13,5),
  indiferentno bit
);

create table zena_brat(
  sifra int not null primary key auto_increment,
  zena int not null,
  brat int not null
);

alter table zena_brat add foreign key (zena) references zena(sifra);
alter table zena_brat add foreign key (brat) references brat(sifra);

alter table svekrva add foreign key (ostavljen) references ostavljen(sifra);
alter table ostavljen add foreign key (cura) references cura(sifra);
alter table cura add foreign key (zena) references zena(sifra);
alter table djevojka add foreign key (mladic) references mladic(sifra);