drop database if exists kolokvijvjezba1;
create database kolokvijvjezba1;
use kolokvijvjezba1;


#0 Kreiranje tablica i veza
create table sestra(
  sifra int not null primary key auto_increment,
  introvertno bit,
  haljina varchar(31) not null,
  marka decimal(16,6),
  hlace varchar(46) not null,
  narukvica int not null 
);

create table sestra_svekar(
  sifra int not null primary key auto_increment,
  sestra int,
  svekar int
);

create table svekar(
  sifra int not null primary key auto_increment,
  bojaociju varchar(40) not null,
  prstena int,
  dukserica varchar(41),
  lipa decimal(13,8),
  eura decimal(12,7),
  majica varchar(35)
);

create table zena(
  sifra int not null primary key auto_increment,
  treciputa datetime,
  hlace varchar(46),
  kratkamajica varchar(31) not null,
  jmbag char(11) not null,
  bojaociju varchar(39) not null,
  haljina varchar(44),
  sestra int not null
);

create table muskarac(
  sifra int not null primary key auto_increment,
  bojaociju varchar(50) not null,
  hlace varchar(30),
  modelnaocala varchar(43),
  maraka decimal(14,5) not null,
  zena int not null
);

create table mladic(
  sifra int not null primary key auto_increment,
  suknja varchar(50) not null,
  kuna decimal(16,8) not null,
  drugiputa datetime,
  asocijalno bit,
  ekstroventno bit not null,
  dukserica varchar(48) not null,
  muskarac int
);

create table punac(
  sifra int not null primary key auto_increment,
  ogrlica int,
  gustoca decimal(14,9),
  hlace varchar(41) not null
);

create table cura(
  sifra int not null primary key auto_increment,
  novcica decimal(16,5) not null,
  gustoca decimal(18,6) not null,
  lipa decimal(13,10),
  ogrlica int not null,
  bojakose varchar(38),
  suknja varchar(36),
  punac int
);


alter table sestra_svekar add foreign key(sestra) references sestra(sifra);
alter table sestra_svekar add foreign key(svekar) references svekar(sifra);

alter table mladic add foreign key(muskarac) references muskarac(sifra);
alter table muskarac add foreign key(zena) references zena(sifra);
alter table zena add foreign key(sestra) references sestra(sifra);
alter table cura add foreign key(punac) references punac(sifra);


#1 Unjeti po 3 retka (muskarac,zena i zena_svekar)
select * from sestra;

insert into sestra(haljina,hlace,narukvica)
values ('Plava haljina','Plave hlace',4),
       ('Zelena haljina','Zelene hlace',5),
       ('Zuta haljina','Zute hlace',6);
      

select * from zena;

insert into zena(kratkamajica,jmbag,bojaociju,sestra)
values ('Plava kratka',111111,'zelena',1),
       ('Zelena kratka',222222,'plava',2),
       ('Zuta kratka',333333,'zuta',3);
      
      
select * from muskarac;

insert into muskarac(bojaociju,maraka,zena)
values ('Crna',10,1),
       ('Plava',20,2),
       ('Zelena',30,3);
     
      
select * from svekar;

insert into svekar(bojaociju,eura,majica)
values('Plava',40.00,'Crna majica'),
('Crna',50.00,'Bijela majica'),
('Zelena',60.00,'Plava majica');


select * from sestra_svekar;

insert into sestra_svekar(sestra,svekar) 
values(1,1),(2,2),(3,3);


#2 U tablici cura postaviti gustocu
select * from cura;
insert into cura(novcica,gustoca,ogrlica)
values(10,10,1);
update cura set gustoca = 15.77;


#3 U tablici mladic obrisati kune vece od 
select * from mladic;
insert into mladic(suknja, kuna ,ekstroventno ,dukserica)
values (1,10,false,'Plava');
delete from mladic where kuna > 15.78;


#4 Izlistati kratkamajica iz tablice zena
select kratkamajica from zena where hlace like '%ana%';


#5 Tablice i podaci
