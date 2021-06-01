drop database if exists kolokvijvjezba16;
create database kolokvijvjezba16;
use kolokvijvjezba16;

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
  dukserica varchar(44),
  prstena int,
  majica varchar(36) not null,
  punac int not null
);

create table mladic(
  sifra int not null primary key auto_increment,
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

alter table punac_zarucnik add foreign key (zarucnik) references zarucnik(sifra);
alter table punac_zarucnik add foreign key (punac) references punac(sifra);

alter table svekrva add foreign key (mladic) references mladic(sifra);
alter table mladic add foreign key (brat) references brat(sifra);
alter table brat add foreign key (punac) references punac(sifra);
alter table zena add foreign key (prijatelj) references prijatelj(sifra);


#1 U tablice mladic, brat i punac_zarucnik unesite po 3 retka.
select * from punac;
insert into punac(treciputa)
values  ('2014-11-21'),
        ('2015-08-11'),
        ('2017-04-26');

select * from brat;
insert into brat(vesta,majica,punac)
values  ('Plava','Crna',1),
        ('Plava','Crna',2),
        ('Plava','Crna',3);

select * from mladic;
insert into mladic(treciputa,brat)
values  ('2020-11-21',1),
        ('2019-01-21',2),
        ('2021-04-06',3);

select * from zarucnik;
insert into zarucnik(novcica,bojakose,kuna,prstena,kratkamajica,nausnica)
values  (21.33,'Crna',12.32,1,'Zuta',5),
        (321.33,'Plava',12.32,4,'Plava',7),
        (121.33,'Zelena',12.32,7,'Zelena',3);

select * from punac_zarucnik;
insert into punac_zarucnik(punac,zarucnik)
values  (1,3),
        (2,2),
        (3,1);