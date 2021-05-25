drop database if exists kolokvijvjezba2;
create database kolokvijvjezba2;
use kolokvijvjezba2;


#0 Kreiranje tablica i veza
create table cura(
  sifra int not null primary key auto_increment,
  haljina varchar(33) not null,
  drugiputa datetime not null,
  suknja varchar(38),
  narukvica int,
  introvertno bit,
  majica varchar(40) not null,
  decko int
);

create table neprijatelj(
  sifra int not null primary key auto_increment,
  majica varchar(32),
  haljina varchar(43) not null,
  lipa decimal(16,8),
  modelnaocala varchar(49) not null,
  kuna decimal(12,6) not null,
  jmbag char(11),
  cura int
);

create table brat(
  sifra int not null primary key auto_increment,
  suknja varchar(47),
  ogrlica int not null,
  asocijalno bit not null,
  neprijatelj int not null
);

create table decko(
  sifra int not null primary key auto_increment,
  indiferentno bit,
  vesta varchar(34),
  asocijalno bit not null
);

create table decko_zarucnica(
  sifra int not null primary key auto_increment,
  decko int not null,
  zarucnica int not null
);

create table zarucnica(
  sifra int not null primary key auto_increment,
  narukvica int,
  bojakose varchar(37) not null,
  novcica decimal(15,9),
  lipa decimal(15,8) not null,
  indiferentno bit not null
);

create table prijatelj(
  sifra int not null primary key auto_increment,
  modelnaocala varchar(37),
  treciputa datetime not null,
  ekstroventno bit not null,
  prviputa datetime,
  svekar int not null
);

create table svekar(
  sifra int not null primary key auto_increment,
  stilfrizura varchar(48),
  ogrlica int not null,
  asocijalno bit not null
);


alter table brat add foreign key(neprijatelj) references neprijatelj(sifra);
alter table neprijatelj add foreign key(cura) references cura(sifra);
alter table cura add foreign key(decko) references decko(sifra);
alter table prijatelj add foreign key(svekar) references svekar(sifra);

alter table decko_zarucnica add foreign key(zarucnica) references zarucnica(sifra);
alter table decko_zarucnica add foreign key(decko) references decko(sifra);


#1 Unjeti po 3 retka (neprijatelj, cura i decko_zarucnica)
select * from neprijatelj;

insert into neprijatelj (haljina,modelnaocala,kuna)
values ('Plava haljina','Ray-Ban',4),
       ('Zelena haljina','Suncane',5),
       ('Zuta haljina','Dioptrijske',6);


select * from cura;

insert into cura(haljina,drugiputa,majica)
values  ('Plava haljina','2019-09-11','Plava majica'),
        ('Zelena haljina','2019-01-21','Zelena majica'),
        ('Zuta haljina','2012-07-23','Zuta majica');
        

select * from decko;
       
insert into decko(asocijalno)
values(1),(1),(1);


select * from zarucnica;
       
insert into zarucnica(bojakose,lipa,indiferentno)
values  ('plava',99.99,1),
        ('zelena',88.88,1),
        ('crna',77.77,1);
        
       
select * from decko_zarucnica;

insert into decko_zarucnica(decko,zarucnica)
values(3,1),(2,2),(3,3);


#2 U tablici prijatelj postavite svim zapisima kolonu treciputa na vrijednost 30. travnja 2020.
select * from svekar;
insert into svekar(ogrlica,asocijalno)
values  (3,1),(3,1),(3,0);

select * from prijatelj;
insert into prijatelj(treciputa,ekstroventno,svekar)
values ('2020-12-19',1,1),
       ('2018-12-19',1,2),
       ('2019-12-19',1,3);
       
update prijatelj set treciputa='2020-04-30';


#3 U tablici brat obrišite sve zapise čija je vrijednost kolone ogrlica različito od 14.
select * from brat;
insert into brat (ogrlica,asocijalno,neprijatelj)
values  (14,0,1),
        (8,1,2),
        (4,1,3);
        
delete from brat where ogrlica != 14;


#5 Prikažite novcica iz tablice zarucnica, 
# neprijatelj iz tablice brat 
# te haljina iz tablice neprijatelj 
# uz uvjet da su vrijednosti kolone drugiputa iz tablice cura poznate 
# te da su vrijednosti kolone vesta iz tablice decko sadrže niz znakova ba. 
# Podatke posložite po haljina iz tablice neprijatelj silazno.
select a.novcica , f.neprijatelj , e.haljina
from zarucnica a 
inner join decko_zarucnica b on a.sifra = b.zarucnica 
inner join decko c           on b.decko = c.sifra 
inner join cura d            on c.sifra = d.decko
inner join neprijatelj e     on d.sifra = e.cura
inner join brat f            on e.sifra = f.neprijatelj
where c.vesta like '%ba%' and d.drugiputa is not null 
order by e.haljina desc;


#6 Prikažite kolone vesta i asocijalno iz tablice decko 
#  čiji se primarni ključ ne nalaze u tablici decko_zarucnica.
select a.vesta , a.asocijalno 
from decko a left join decko_zarucnica b on a.sifra = b.decko 
where b.decko is null;