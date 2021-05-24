drop database if exists kolokvijvjezba4;
create database kolokvijvjezba4;
use kolokvijvjezba4;


#0 Kreiranje tablica i veza
create table punac(
  sifra int not null primary key auto_increment,
  treciputa datetime,
  majica varchar(46),
  jmbag char(11) not null,
  novcica decimal(18,7) not null,
  marka decimal(12,6) not null,
  ostavljen int not null
);

create table ostavljen(
  sifra int not null primary key auto_increment,
  modelnaocala varchar(43),
  introvertno bit,
  kuna decimal(14,10)
);

create table zena(
  sifra int not null primary key auto_increment,
  suknja varchar(39) not null,
  lipa decimal(18,7),
  prstena int not null
);

create table snasa(
  sifra int not null primary key auto_increment,
  introvertno bit,
  treciputa datetime,
  haljina varchar(44) not null,
  zena int not null
);

create table becar(
  sifra int not null primary key auto_increment,
  novcica decimal(14,8),
  kratkamajica varchar(48) not null,
  bojaociju varchar(36) not null,
  snasa int not null
);

create table prijatelj(
  sifra int not null primary key auto_increment,
  eura decimal(16,9),
  prstena int not null,
  gustoca decimal(16,5),
  jmbag char(11) not null,
  suknja varchar(47) not null,
  becar int not null
);

create table zena_mladic(
  sifra int not null primary key auto_increment,
  zena int not null,
  mladic int not null
);

create table mladic(
  sifra int not null primary key auto_increment,
  kuna decimal(15,9),
  lipa decimal(18,5),
  nausnica int,
  stilfrizura varchar(49),
  vesta varchar(34) not null
);


alter table punac add foreign key(ostavljen) references ostavljen(sifra);
alter table prijatelj add foreign key(becar) references becar(sifra);
alter table becar add foreign key(snasa) references snasa(sifra);
alter table snasa add foreign key(zena) references zena(sifra);

alter table zena_mladic add foreign key(zena) references zena(sifra);
alter table zena_mladic add foreign key(mladic) references mladic(sifra);


#1 Unjeti po 3 retka (becar, snasa i zena_mladic)
select * from zena;

insert into zena(suknja,prstena)
values  ('Zelena suknja',1),
        ('Plava suknja',2),
        ('Crna suknja',3);
        
       
select * from snasa;
insert into snasa(haljina,zena)
values  ('Crna haljina',1),
        ('Plava haljina',2),
        ('Zelena haljina',3);
        
       
select * from becar;

insert into becar(kratkamajica,bojaociju,snasa)    
values  ('Crna kratka','Crna',1),
        ('Plava kratka','Zelena',2),
        ('Zelena kratka','Plava',3);
        
       
select * from mladic;

insert into mladic(vesta)
values  ('Crna vesta'),
        ('Plava vesta'),
        ('Zelena vesta');
        
       
select * from zena_mladic;

insert into zena_mladic(zena,mladic)
values (1,3),
       (2,2),
       (3,1);
       
      
#2 U tablici punac postavite svim zapisima kolonu majica na vrijednost Osijek.
select * from punac;
update punac set majica = 'Osijek';