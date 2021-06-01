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


#1 tablice svekrva, punac i punica_ostavljena unesite po 3 retka
select * from punica;
insert into punica(stilfrizura,maraka,jmbag)
values ('Duga',20.22,12345678910),
       ('Kratka',30.22,12345678910),
       ('Rep',40.22,12345678910);

select * from punac;
insert into punac(punica)
values  (1),(2),(3);

select * from svekrva;
insert into svekrva(stilfrizura,punac)
values  ('2020-11-21',1),


insert into ostavljena(ekstroventno,eura)
values  (0,30.29),
        (0,40.29),
        (1,60.29);

select * from punica_ostavljena;
insert into punica_ostavljena(punica,ostavljena)
values  (1,3),
        (2,2),
        (3,1);
        
 
#2 U tablici svekar postavite svim zapisima kolonu indiferentno na vrijednost false.
update svekar set indiferentno = false;


#3 U tablici muskarac obrišite sve zapise čija je vrijednost kolone gustoca jednako 14,92.
delete from muskarac where  gustoca =14.92;

       
#4 Izlistajte ekstroventno iz tablice punac uz uvjet da vrijednost kolone treciputa nepoznate.
select ekstroventno from punac where treciputa is not null;     


#5 Prikažite narukvica iz tablice ostavljena, 
#  ogrlica iz tablice muskarac 
#  te carape iz tablice svekrva 
#  uz uvjet da su vrijednosti kolone treciputa iz tablice punac poznate 
#  te da su vrijednosti kolone maraka iz tablice punica različite od 21. 
#  Podatke posložite po carape iz tablice svekrva silazno.
select a.narukvica , f.ogrlica , e.carape 
from ostavljena a
inner join punica_ostavljena     b on a.sifra      = b.ostavljena 
inner join punica                c on b.punica     = c.sifra
inner join punac                 d on c.sifra      = d.punica 
inner join svekrva               e on d.sifra      = e.punac
inner join muskarac              f on e.sifra      = f.svekrva
where d.treciputa is null and c.maraka != 21
order by e.carape desc;


#6 Prikažite kolone maraka i jmbag iz tablice punica 
#  čiji se primarni ključ ne nalaze u tablici punica_ostavljena.
select a.maraka , a.jmbag
from punica a left join punica_ostavljena b on b.punica = a.sifra
where b.punica is null;       