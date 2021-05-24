drop database if exists kolokvijvjezba3;
create database kolokvijvjezba3;
use kolokvijvjezba3;


#0 Kreiranje tablica i veza
create table svekar(
  sifra int not null primary key auto_increment,
  novcica decimal(16,8) not null,
  suknja varchar(44) not null,
  bojakose varchar(36),
  prstena int,
  narukvica int not null,
  cura int not null
);

create table cura(
  sifra int not null primary key auto_increment,
  dukserica varchar(49),
  marka decimal(13,7),
  drugiputa datetime,
  majica varchar(49),
  novcica decimal(15,8),
  ogrlica int not null
);

create table ostavljena(
  sifra int not null primary key auto_increment,
  kuna decimal(17,5),
  lipa decimal (15,6),
  majica varchar(36),
  modelnaocala varchar(31) not null,
  prijatelj int
);

create table snasa(
  sifra int not null primary key auto_increment,
  introvertno bit,
  kuna decimal(15,6) not null,
  eura decimal(12,9) not null,
  treciputa datetime,
  ostavljena int not null
);

create table punica(
  sifra int not null primary key auto_increment,
  asocijalno bit,
  kratkamajica varchar(44),
  kuna decimal(13,8) not null,
  vesta varchar(32) not null,
  snasa int
);

create table prijatelj(
  sifra int not null primary key auto_increment,
  kuna decimal(16,10),
  haljina varchar(37),
  lipa decimal(13,10),
  dukserica varchar(31),
  indiferentno bit not null
);

create table prijatelj_brat(
  sifra int not null primary key auto_increment,
  prijatelj int not null,
  brat int not null
);

create table brat(
  sifra int not null primary key auto_increment,
  jmbag char(11),
  ogrlica int not null,
  ekstrovertno bit not null
);


alter table svekar add foreign key(cura) references cura(sifra);
alter table punica add foreign key(snasa) references snasa(sifra);
alter table snasa add foreign key(ostavljena) references ostavljena(sifra); 
alter table ostavljena add foreign key(prijatelj) references prijatelj(sifra);

alter table prijatelj_brat add foreign key(prijatelj) references prijatelj(sifra);
alter table prijatelj_brat add foreign key(brat) references brat(sifra);


#1 Unjeti po 3 retka (snasa, ostavljena i prijatelj_brat)
select * from ostavljena;

insert into ostavljena(modelnaocala)
values  ('Ray-Ban'),
        ('Suncane'),
        ('Dioptrijske');
       
       
select * from snasa;

insert into snasa(kuna,eura,ostavljena)
values  (1.99,10.99,1),
        (2.33,20.99,2),
        (3.99,30.99,3);     
       
       
select * from prijatelj;

insert into prijatelj(indiferentno)
values  (1),(1),(0);


select * from brat;

insert into brat(ogrlica, ekstrovertno)
values  (1,1),
        (2,0),
        (3,1);
       
       
select * from prijatelj_brat;

insert into prijatelj_brat(prijatelj,brat)
values  (1,3), 
        (2,2), 
        (3,1);      