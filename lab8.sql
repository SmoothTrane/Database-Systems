  CREATE TABLE actors(
    aid int not null,
    name text,
    address text,
    dob date,
    ActorsGuildAnniverseryDate date
);

CREATE TABLE actors_personal_features(
  HairColor text,
  EyeColor text,
  FavoriteColor text,
  heightInches int,
  weight int,
  SpouseName text,

);

CREATE TABLE movies(
  mid int not null auto_increment,
  name text,
  ReleaseYear date.
  MPAA_Number integer,
  DomesticBoxOfficeSales integer,
  ForeignBoxOfficeSales integer,
  sales integer
);

CREATE TABLE directors(
  did int not null auto_increment,
  name text,
  address text,
  SpouseName text,
  FilmSchool text,
  DirectorsGuildAnniversaryDate date,
  FavoriteLensMaker

);
