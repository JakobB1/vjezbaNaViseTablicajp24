drop database if exists kolokvijvjezba14;
create database kolokvijvjezba14;
use kolokvijvjezba14;


#0 Kreirajte tablice (16) i veze između tablica. (6)
create table ostavljen(
  sifra int not null primary key auto_increment,
  kratkamajica varchar(34),
  drugiputa datetime,
  asocijalno bit not null,
  stilfrizura varchar(40),
  svekrva int not null
);

create table mladic(
  sifra int not null primary key auto_increment,
  drugiputa datetime not null,
  carape varchar(48) not null,
  ogrlica int,
  kratkamajica varchar(42) not null,
  introvertno bit not null,
  asocijalno bit not null,
  ostavljen int 
);

create table cura(
  sifra int not null primary key auto_increment,
  ogrlica int,
  hlace varchar(42),
  vesta varchar(31) not null,
  majica varchar(50),
  mladic int
);

create table svekrva(
  sifra int not null primary key auto_increment,
  hlace varchar(35),
  ogrlica int,
  ekstroventno bit not null,
  narukvica int
);

create table svekar(
  sifra int not null primary key auto_increment,
  suknja varchar(40),
  stilfrizura varchar(34) not null,
  gustoca decimal(15,10) not null,
  carape varchar(35) not null
);

create table svekrva_svekar(
  sifra int not null primary key auto_increment,
  svekrva int not null,
  svekar int not null
);

create table neprijatelj(
  sifra int not null primary key auto_increment,
  bojakoje varchar(32),
  novcica decimal(12,6) not null,
  prviputa datetime,
  indiferentno bit not null,
  suknja varchar(44),
  jmbag char(11),
  muskarac int not null
);

create table muskarac(
  sifra int not null primary key auto_increment,
  dukserica varchar(34),
  gustoca decimal(13,10),
  haljina varchar(42) not null,
  majica varchar(39),
  suknja varchar(50) not null,
  kuna decimal(17,9) not null
);

alter table cura add foreign key(mladic) references mladic(sifra);
alter table mladic add foreign key(ostavljen) references ostavljen(sifra);
alter table ostavljen add foreign key(svekrva) references svekrva(sifra);
alter table neprijatelj add foreign key(muskarac) references muskarac(sifra);

alter table svekrva_svekar add foreign key(svekar) references svekar(sifra);
alter table svekrva_svekar add foreign key(svekrva) references svekrva(sifra);

#1 U tablice mladic, ostavljen i svekrva_svekar unesite po 3 retka.
select * from svekrva;
insert into svekrva(ekstroventno,narukvica)
values  (1,3),
        (0,7),
        (0,2);
       
select * from ostavljen;
insert into ostavljen(asocijalno,svekrva)
values  (0,1),
        (1,2),
        (0,3);
        
select * from mladic;
insert into mladic(drugiputa,carape,kratkamajica,introvertno,asocijalno,ostavljen)  
values  ('2013-04-12',5,4,1,0,1),
        ('2013-04-12',5,4,1,0,2),
        ('2013-04-12',5,4,1,0,3);
        
select * from svekar;
insert into svekar(stilfrizura,gustoca,carape)
values  ('Kratka',11,3),
        ('Kratka',12,2),
        ('Kratka',13,4);

select * from svekrva_svekar;
insert into svekrva_svekar(svekrva,svekar)
values  (1,3),
        (1,3),
        (1,3);
        
#2 U tablici neprijatelj postavite svim zapisima kolonu novcica na vrijednost 13,77.
update neprijatelj set novcica=13.77;  

#3 U tablici cura obrišite sve zapise čija je vrijednost kolone hlace različito od AB.
delete from cura where hlace like '%AB%';