drop database if exists kolokvijvjezba7;
create database kolokvijvjezba7;
use kolokvijvjezba7;


#0 Kreiranje tablica i veza
create table mladic(
  sifra int not null primary key auto_increment,
  prstena int,
  lipa decimal(14,5) not null,
  narukvica int not null,
  drugiputa datetime not null
);

create table zarucnik_mladic(
  sifra int not null primary key auto_increment,
  zarucnik int not null,
  mladic int not null
);

create table ostavljen(
  sifra int not null primary key auto_increment,
  lipa decimal(14,6),
  introvertno bit not null,
  kratkamajica varchar(38) not null,
  prstena int not null,
  zarucnik int
);

create table zarucnik(
  sifra int not null primary key auto_increment,
  vesta varchar(34),
  asocijalno bit not null,
  modelnaocala varchar(43),
  narukvica int not null,
  novcica decimal(15,5) not null
);

create table sestra(
  sifra int not null primary key auto_increment,
  bojakose varchar(34) not null,
  hlace varchar(36) not null,
  lipa decimal(15,6),
  stilfrizura varchar(40) not null,
  maraka decimal(12,8) not null,
  prijateljica int
);

create table prijateljica(
  sifra int not null primary key auto_increment,
  haljina varchar(45),
  gustoca decimal(12,5) not null,
  ogrlica int,
  novcica decimal(12,5),
  ostavljen int
);

create table punica(
  sifra int not null primary key auto_increment,
  majica varchar(40),
  eura decimal(12,6) not null,
  prstena int,
  cura int not null
);

create table cura(
  sifra int not null primary key auto_increment,
  lipa decimal(12,9) not null,
  introvertno bit,
  modelnaocala varchar(40),
  narukvica int,
  treciputa datetime,
  kuna decimal(14,9)
);

alter table zarucnik_mladic add foreign key(mladic) references mladic(sifra);
alter table zarucnik_mladic add foreign key(zarucnik) references zarucnik(sifra);

alter table ostavljen add foreign key(zarucnik) references zarucnik(sifra);
alter table prijateljica add foreign key(ostavljen) references ostavljen(sifra);
alter table sestra add foreign key(prijateljica) references prijateljica(sifra);
alter table punica add foreign key(cura) references cura(sifra);


#1 Unjeti po 3 retka (prijateljica, ostavljen i zarucnik_mladic)
select * from zarucnik;

insert into zarucnik(asocijalno,narukvica,novcica)
values  (1,6,20.99),
        (0,3,40.99),
        (1,9,50.99);
        
       
select * from ostavljen;

insert into ostavljen(introvertno,kratkamajica,prstena)
values  (0,'Plava kratka',7),
        (1,'Zelena kratka',3),
        (1,'Crna kratka',11);
        
       
select * from prijateljica;

insert into prijateljica(gustoca,ostavljen)
values  (11.33,1),
        (22.44,2),
        (33.55,3);
        
       
select * from mladic;

insert into mladic(lipa,narukvica,drugiputa)
values  (10.11,4,'2013-11-05'),
        (32.53,8,'2013-11-05'),
        (13.74,2,'2013-11-05');
        
       
select * from zarucnik_mladic;

insert into zarucnik_mladic(zarucnik,mladic)
values  (1,3),
        (2,2),
        (3,1);
       

#2 U tablici punica postavite svim zapisima kolonu eura na vrijednost 15,77.
select * from cura;
insert into cura(lipa)
values  (33.33),(32.22),(44.44);

select * from punica;
insert into punica(eura,cura)
values  (55.44,1),
        (13.55,2),
        (23.55,3);
        
update punica set eura=15.77;