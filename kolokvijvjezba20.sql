drop database if exists kolokvijvjezba20;
create database kolokvijvjezba20;
use kolokvijvjezba20;

create table neprijateljica(
  sifra int not null primary key auto_increment,
  introvertno bit not null,
  nausnica int,
  gustoca decimal(17,8),
  lipa decimal(17,8),
  jmbag char(11) not null,
  zena int
);

create table zena(
  sifra int not null primary key auto_increment,
  asocijalno bit not null,
  nausnica int,
  jmbag char(11) not null,
  bojaociju varchar(41),
  kratkamajica varchar(30)
);

create table decko(
  sifra int not null primary key auto_increment,
  kuna decimal(14,5),
  novcica decimal(15,7),
  indiferentno bit not null,
  maraka decimal(16,9) not null,
  punica int not null
);

create table zarucnica(
  sifra int not null primary key auto_increment,
  modelnaocala varchar(50),
  suknja varchar(49) not null,
  prviputa datetime,
  treciputa datetime,
  decko int 
);

create table mladic(
  sifra int not null primary key auto_increment,
  hlace varchar(47),
  suknja varchar(50),
  haljina varchar(50) not null,
  prstena int not null,
  treciputa datetime not null,
  introvertno bit not null
);

create table punica(
  sifra int not null primary key auto_increment,
  ogrlica int,
  prviputa datetime,
  drugiputa datetime not null,
  introvertno bit,
  treciputa datetime,
  mladic int not null
);

create table zarucnik(
  sifra int not null primary key auto_increment,
  suknja varchar(31),
  prstena int not null,
  modelnaocala varchar(46) not null,
  novcica decimal(17,5) not null,
  gustoca decimal(17,8)
);

create table mladic_zarucnik(
  sifra int not null primary key auto_increment,
  mladic int not null,
  zarucnik int not null
);

alter table mladic_zarucnik add foreign key (mladic) references mladic(sifra);
alter table mladic_zarucnik add foreign key (zarucnik) references zarucnik(sifra);

alter table zarucnica add foreign key (decko) references decko(sifra);
alter table decko add foreign key (punica) references punica(sifra);
alter table punica add foreign key (mladic) references mladic(sifra);
alter table neprijateljica add foreign key (zena) references zena(sifra);