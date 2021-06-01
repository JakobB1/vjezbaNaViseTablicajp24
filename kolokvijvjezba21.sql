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


#1 U tablice ostavljen, cura i zena_brat unesite po 3 retka.
select * from zena;
insert into zena(kuna,asocijalno)
values  (30.23,0),
        (60.23,1),
        (40.23,0);

select * from cura;
insert into cura(nausnica,dukserica,stilfrizura,zena)
values  (3,'Plava','Kratka',1),
        (5,'Plava','Kratka',2),
        (7,'Plava','Kratka',3);

select * from ostavljen;
insert into ostavljen(ekstroventno,kratkamajica,kuna)
values  (0,'Plava',30.20),
        (1,'Crvena',40.20),
        (0,'Zelena',50.20);

select * from brat;
insert into brat(prviputa,hlace)
values  ('2020-11-11','Plave'),
        ('2020-11-01','Zelene'),
        ('2020-11-21','Zute');

select * from zena_brat;
insert into zena_brat(zena,brat)
values  (1,3),
        (2,2),
        (3,1);
        
       
#2 U tablici djevojka postavite svim zapisima kolonu maraka na vrijednost 15,74.
update djevojka set maraka = 15,74;


#3 U tablici svekrva obrišite sve zapise čija je vrijednost kolone jmbag 00000000007.
delete from svekrva where  jmbag =00000000007;      


#4 Izlistajte nausnica iz tablice cura uz uvjet da vrijednost kolone bojakose sadrže slova ana.
select nausnica from cura where bojakose like '%ana%';


#5 Prikažite hlace iz tablice brat, 
#  ostavljen iz tablice svekrva 
#  te ekstroventno iz tablice ostavljen 
#  uz uvjet da su vrijednosti kolone bojakose iz tablice cura počinju slovom a 
#  te da su vrijednosti kolone drugiputa iz tablice zena poznate. 
#  Podatke posložite po ekstroventno iz tablice ostavljen silazno.
select a.hlace , f.ostavljen ,e.ekstroventno 
from brat a
inner join zena_brat             b on a.sifra      = b.brat 
inner join zena                  c on b.zena       = c.sifra
inner join cura                  d on c.sifra      = d.zena 
inner join ostavljen             e on d.sifra      = e.cura
inner join svekrva               f on e.sifra      = f.ostavljen
where d.bojakose like 'a&' and c.drugiputa is null
order by e.ekstroventno desc;


#6 Prikažite kolone drugiputa i asocijalno iz tablice zena 
#  čiji se primarni ključ ne nalaze u tablici zena_brat.
select a.drugiputa , a.asocijalno 
from zena a left join zena_brat b on b.zena = a.sifra
where b.zena is null;