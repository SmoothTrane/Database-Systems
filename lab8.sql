
CREATE TABLE People(
  PID char(8) NOT NULL,
  Name text not null,
  Address text,
  SpouseName text,
  primary key (pid)
);
/*
Functional Dependencies, PID -> name, address, spousename
*/

  CREATE TABLE Actors(
    PID  char(8) references People(pid) NOT NULL,
    DOB date,
    HairColor text,
    EyeColor text,
    FavoriteColor text,
    HeightInches int,
    WeightLbs int,
    ActorsGuildAnniverseryDate date,
    primary key(pid)
);
/*
Functional Dependencies
pid -> dob, haircolor, eyecolor, favoritecolor, heightinches, weoght pounds, actors guild anniversary date
*/

CREATE TABLE Movies(
  MPAA_Number integer not null,
  Name text,
  ReleaseYear int,
  DomesticBoxOfficeSalesUSD integer,
  ForeignBoxOfficeSalesUSD integer,
  DVD_BLURAY_SALESUSD integer,
  primary key (MPAA_NUMBER)
);


/*
MPAA -> name, releaseyear, domesticboxoffice, foreignboxoffice, dvd blue ray
*/

CREATE TABLE Directors(
 PID char(8) references people(pid) NOT null,
  FilmSchool text,
  DirectorsGuildAnniversaryDate date,
  FavoriteLensMaker text
  primary key (pid)
);


/*
PID -> name, address, spousename, filmschool, directorsguildanniversary date, favoritelensmaker
*/

CREATE table Casting(
  MPAA_number integer references movies(MPAA_number) not null,
  pid char(8) references People(pid) not null,
  RoleName text not null,
  primary key (pid, MPAA_number)
);

/*
MPAA_NUMBER, PID -> rolename
*/
SELECT people.name
FROM people INNER JOIN casting ON casting.pid = people.pid AND
INNER JOIN DIRECTORS on people.pid = directors.pid
AND casting.mpaa_number IN ( SELECT casting.mpaa_number
                        FROM casting INNER JOIN people ON people.pid = casting.pid
                        WHERE people.name = 'Sean Connery' ) ;
