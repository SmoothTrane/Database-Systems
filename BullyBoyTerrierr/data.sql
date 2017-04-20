CREATE table People(
PersonId char(4) not null unique,
name text not null,
primary key PersonId
);


CREATE TABLE Trainers(
  TrainerID char(4) not null unique,
  PersonID char(4) not null unique,
  primary key PersonId,
  foreign key (PersonId) references people(PersonID)
);


CREATE TABLE Breeders(
BreederID char(4) not null unique,
PersonID char(4) not null unique,
primary key BreederID,
foreign key(PersonId) references people(PersonID)
);


CREATE TABLE Customers(
  CustomerID char(4) not null unique,
  PersonID char(4) not null unique,
  primary key CustomerID,
  foreign key (PersonID) references people(PersonID)
);

CREATE TABLE Dogs(
  DogID char(4) not null unique,
  name text not null,
  BreederID char(4) not null,
  DOB date not null,
  MotherID char(4) not null,
  FatherID char(4) not null,
  WeightLBS int,
  gender text,
  check(gender("MALE", "FEMALE"))
  primary key DogID,
  foreign key (BreederID) references Breeders(BreederID),
  foreign key (MotherID) references Dogs(DogID),
  f
);

  CREATE TABLE AdultDogs(
    AdultDogID char(4) not null unique,
    DogID char(4) not null,
    primary key AdultDogID,
    primary key DogId references Dogs(DogId)
  );

  CREATE TABLE Puppies(
    PuppyID char(4) not null unique,
    DogID char(4) not null,
    primary key AdultDogID,
    primary key DogId references Dogs(DogId)
  );
