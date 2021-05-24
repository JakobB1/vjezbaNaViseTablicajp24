drop database if exists kolokvijvjezba9;
create database kolokvijvjezba9;
use kolokvijvjezba9;


#0 Kreiranje tablica i veza
create table punac_prijateljica(
  sifra int not null primary key auto_increment,
  punac int not null,
  prijateljica int not null
);

create table prijateljica(
  sifra int not null primary key auto_increment,
  treciputa datetime,
  novcica decimal(16,7),
  kuna decimal(14,10) not null,
  drugiputa datetime,
  haljina varchar(45),
  kratkamajica varchar(49)
);

create table cura(
  sifra int not null primary key auto_increment,
  vesta varchar(49) not null,
  ekstroventno bit,
  carape varchar(37),
  suknja varchar(37) not null,
  punac int not null
);

create table punac(
  sifra int not null primary key auto_increment,
  narukvica int not null,
  modelnaocala varchar(30),
  kuna decimal(12,8),
  bojaociju varchar(33),
  suknja varchar(45)
);

create table brat(
  sifra int not null primary key auto_increment,
  novcica decimal(18,9) not null,
  ekstroventno bit,
  vesta varchar(32) not null,
  cura int
);

create table zarucnik(
  sifra int not null primary key auto_increment,
  gustoca decimal(17,6),
  haljina varchar(40),
  kratkamajica varchar(48) not null,
  nausnica int not null,
  brat int not null
);

create table ostavljena(
  sifra int not null primary key auto_increment,
  modelnaocala varchar(34) not null,
  suknja varchar(32),
  eura decimal(18,7) not null,
  lipa decimal(15,7) not null,
  treciputa datetime not null,
  drugiputa datetime not null
);

create table snasa(
  sifra int not null primary key auto_increment,
  prstena int,
  drugiputa datetime not null,
  haljina varchar(38) not null,
  ostavljena int
);

alter table punac_prijateljica add foreign key(punac) references punac(sifra);
alter table punac_prijateljica add foreign key(prijateljica) references prijateljica(sifra);

alter table cura add foreign key(punac) references punac(sifra);
alter table brat add foreign key(cura) references cura(sifra);
alter table zarucnik add foreign key(brat) references brat(sifra);
alter table snasa add foreign key(ostavljena) references ostavljena(sifra);


#1 Unjeti po 3 retka (brat, cura i punac_prijateljica)
select * from punac;

insert into punac(narukvica)
values  (6),(3),(8);


select * from cura;

insert into cura(vesta,suknja,punac)
values  ('Plava vesta','Crna suknja',1),
         ('Crna vesta','Zelena suknja',2),
         ('Zelena vesta','Crvena suknja',3);
         
        
select * from brat;

insert into brat(novcica,vesta,cura)
values  (99.99,'Plava vesta',1),
        (33.99,'Zelena vesta',2),
        (54.99,'Crna vesta',3);
        
       
select * from prijateljica;

insert into prijateljica(kuna)
values (12.12),
       (123.12),
       (54.15);


select * from punac_prijateljica;

insert into punac_prijateljica (punac,prijateljica)
values  (1,3),
        (2,2),
        (3,1);