drop database if exists kolokvijvjezba10;
create database kolokvijvjezba10;
use kolokvijvjezba10;


#0 Kreiranje tablica i veza
create table zarucnica(
  sifra int not null primary key auto_increment,
  treciputa datetime,
  prviputa datetime,
  suknja varchar(32) not null,
  eura decimal(16,10)
);

create table sestra(
  sifra int not null primary key auto_increment,
  suknja varchar(46) not null,
  bojaociju varchar(49),
  indiferentno bit,
  dukserica varchar(32) not null,
  drugiputa datetime,
  prviputa datetime not null,
  zarucnica int
);

create table zena(
  sifra int not null primary key auto_increment,
  bojaociju varchar(49) not null,
  maraka decimal(13,9) not null,
  majica varchar(45),
  indiferentno bit,
  prviputa datetime,
  mladic int
);

create table mladic(
  sifra int not null primary key auto_increment,
  hlace varchar(48) not null,
  lipa decimal(18,6),
  stilfrizura varchar(35) not null,
  prstena int,
  maraka decimal(12,6) not null,
  svekrva int
);

create table svekrva(
  sifra int not null primary key auto_increment,
  eura decimal(17,9),
  carape varchar(43),
  kuna decimal(13,9),
  majica varchar(30),
  introvertno bit not null,
  punac int
);

create table neprijatelj(
  sifra int not null primary key auto_increment,
  gustoca decimal(15,10) not null,
  dukserica varchar(32) not null,
  maraka decimal(15,7),
  stilfrizura varchar(49) not null
);

create table punac(
  sifra int not null primary key auto_increment,
  lipa decimal(15,9),
  eura decimal(15,10) not null,
  stilfrizura varchar(37)
);

create table punac_neprijatelj(
  sifra int not null primary key auto_increment,
  punac int not null,
  neprijatelj int not null
);

alter table sestra add foreign key(zarucnica) references zarucnica(sifra);
alter table zena add foreign key(mladic) references mladic(sifra);
alter table mladic add foreign key(svekrva) references svekrva(sifra);
alter table svekrva add foreign key(punac) references punac(sifra);

alter table punac_neprijatelj add foreign key(punac) references punac(sifra);
alter table punac_neprijatelj add foreign key(neprijatelj) references neprijatelj(sifra);


#1 Unjeti po 3 retka (mladic, svekrva i punac_neprijatelj)
select * from punac;

insert into punac(eura)
values  (10.99),
        (62.99),
        (13.99);

       
select * from svekrva;

insert into svekrva(introvertno)
values  (1),(0),(1);


select * from mladic;

insert into mladic(hlace,stilfrizura,maraka,svekrva)
values  ('Crne hlace','Kratka',13.52,1),
        ('Plave hlace','Duga',32.52,1),
        ('Zelene hlace','Celavo',113.52,1);
        
       
select * from neprijatelj;

insert into neprijatelj(gustoca,dukserica,stilfrizura)
values  (15.25,'Crna','Duga'),
        (25.25,'Dugih rukava','Duga'),
        (35.65,'Kratkih rukava','Duga');
        
       
select * from punac_neprijatelj;

insert into punac_neprijatelj (punac,neprijatelj)
values  (1,3),
        (2,1),
        (3,2);
        
       
#2 U tablici sestra postavite svim zapisima kolonu bojaociju na vrijednost Osijek.
select * from zarucnica;
insert into zarucnica(suknja)
values  ('Plava'),
        ('Zelena'),
        ('Crna');
        
select * from sestra;
insert into sestra(suknja,dukserica,prviputa,zarucnica)
values  ('Roza','Plava','2021-03-23',1),
        ('Plava','Zelena','2021-01-01',2),
        ('Crna','Zuta','2021-06-30',3);

update sestra set bojaociju='Osijek';


#3 U tablici zena obrišite sve zapise čija je vrijednost kolone maraka različito od 14,81.
select * from zena;
insert into zena(bojaociju,maraka,mladic)
values  ('Zelena',33.35,1),
        ('Plava',14.81,2),
        ('Crna',222.55,3);
        
delete from zena where maraka !=14.81;