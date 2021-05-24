drop database if exists kolokvijvjezba5;
create database kolokvijvjezba5;
use kolokvijvjezba5;


#0 Kreiranje tablica i veza
create table mladic(
  sifra int not null primary key auto_increment,
  kratkamajica varchar(48) not null,
  haljina varchar(30) not null,
  asocijalno bit,
  zarucnik int
);

create table zarucnik(
  sifra int not null primary key auto_increment,
  jmbag char(11),
  lipa decimal(12,8),
  indiferentno bit not null
);

create table svekar(
  sifra int not null primary key auto_increment,
  bojakose varchar(33),
  majica varchar(31),
  carape varchar(31) not null,
  haljina varchar(43),
  narukvica int,
  eura decimal(14,5) not null
);

create table svekar_cura(
  sifra int not null primary key auto_increment,
  svekar int not null,
  cura int not null
);

create table cura(
  sifra int not null primary key auto_increment,
  carape varchar(41) not null,
  marka decimal(17,10) not null,
  asocijalno bit,
  vesta varchar(47) not null
);

create table punac(
  sifra int not null primary key auto_increment,
  dukserica varchar(33),
  prviputa datetime not null,
  majica varchar(36),
  svekar int not null
);

create table punica(
  sifra int not null primary key auto_increment,
  hlace varchar(43) not null,
  nausnica int not null,
  ogrlica int,
  vesta varchar(49) not null,
  modelnaocala varchar(31) not null,
  treciputa datetime not null,
  punac int not null
); 

create table ostavljena(
  sifra int not null primary key auto_increment,
  majica varchar(33),
  ogrlica int not null,
  carape varchar(44),
  stilfrizura varchar(42),
  punica int not null
);


alter table mladic add foreign key(zarucnik) references zarucnik(sifra);
alter table ostavljena add foreign key(punica) references punica(sifra);
alter table punica add foreign key(punac) references punac(sifra);
alter table punac add foreign key(svekar) references svekar(sifra);

alter table svekar_cura add foreign key(svekar) references svekar(sifra);
alter table svekar_cura add foreign key(cura) references cura(sifra);


#1 Unjeti po 3 retka (punica, punac i svekar_cura)
select * from svekar;

insert into svekar(carape,eura)
values  ('Crne',10.99),
        ('Zelene',20.99),
        ('Plave',30.99);
        
       
select * from punac;

insert into punac(prviputa,svekar)
values ('2012-01-25',1),
       ('2013-02-11',2),
       ('2014-07-05',3);
       
      
select * from punica;      

insert into punica(hlace,nausnica,vesta,modelnaocala,treciputa,punac)
values  ('Plave',4,'Crna','Suncane','2012-12-25',1),
        ('Zelene',7,'Plava','Dioptrijske','2012-12-25',2),
        ('Crne',9,'Zelena','Ray-Ban','2012-12-25',3);
        
 
select * from cura;

insert into cura(carape,marka,vesta)
values  ('Crne',20.99,'Plava'),
        ('Plave',30.99,'Crna'),
        ('Zelene',40.99,'Zuta');
        
       
select * from svekar_cura;

insert into svekar_cura(svekar,cura)
values (1,3),
       (2,2),
       (3,1);
  
      
#2 U tablici mladic postavite svim zapisima kolonu haljina na vrijednost Osijek.
select * from zarucnik;
insert into zarucnik (indiferentno)
values (1),(1),(0);

select * from mladic;
insert into mladic(kratkamajica,haljina,zarucnik)
values  ('Crna','Plava',1),
        ('Crvena','Zelena',2),
        ('Plava','Zelena',3);
        
update mladic set haljina='Osijek';       