drop database if exists EuroTravel;
create database EuroTravel;
use EuroTravel;

create table korisnik(
sifra int not null primary key auto_increment,
korisnicko_ime varchar(50) not null,
lozinka int not null
);

create table posjet(
	sifra 			int not null primary key auto_increment,
	korisnik 	    int not null,
	datum_polaska 	datetime,
    datum_odlaska	datetime,
	maksimalni_budzet decimal(9,2) not null
);


create table lokacija(
sifra int not null primary key auto_increment,
drzava varchar(100) not null,
naziv_mjesta varchar(150) not null,
postanski_broj varchar(20),
adresa_lokacije varchar(150)
);


create table smjestaj(
sifra int not null primary key auto_increment,
drzava varchar(100) not null,
naziv_mjesta varchar(150) not null,
postanski_broj varchar(20),
adresa varchar(150),
domacin varchar (100),
cijena decimal(9,2),
lokacija int not null
);



create table posjet_lokacija(
sifra int not null primary key auto_increment,
posjet int not null,
lokacija int not null,
iznos decimal(9,2),
smjestaj int not null
);


alter table posjet add foreign key (korisnik) references korisnik(sifra);
alter table smjestaj add foreign key (lokacija) references lokacija(sifra);
alter table posjet_lokacija add foreign key (posjet) references posjet(sifra);
alter table posjet_lokacija add foreign key (lokacija) references lokacija(sifra);
alter table posjet_lokacija add foreign key (smjestaj) references smjestaj(sifra);


